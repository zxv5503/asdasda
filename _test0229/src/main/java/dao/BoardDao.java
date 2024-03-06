package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import dto.Board;
import dto.Member;

public class BoardDao {
	private static Connection conn;
	private static BoardDao dao = new BoardDao();
	private BoardDao() {} // 생성자
	public static BoardDao getInstance() {
		BoardDao.getConnection();
		return dao;
	}
	
	private static void getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}		
	}
	

	
	public ArrayList<Board> selectList() {
		ArrayList<Board> list = new ArrayList<>();
		String sql = "select * from board order by num desc";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Board board = new Board(rs.getInt("num"),
						rs.getString("title"), rs.getString("content"),
						 rs.getTimestamp("regtime").toLocalDateTime(), rs.getInt("hits"),rs.getInt("memberno"));
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Board> searchByTitle(String title) {
	    ArrayList<Board> list = new ArrayList<>();
	    String sql = "SELECT * FROM board WHERE title LIKE ? ORDER BY num DESC";
	    PreparedStatement pstmt;

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, "%" + title + "%");

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Board board = new Board(
	                    rs.getInt("num"),
	                    rs.getString("title"),
	                    rs.getString("content"),
	                    rs.getTimestamp("regtime").toLocalDateTime(),
	                    rs.getInt("hits"),
	                    rs.getInt("memberno")
	            );
	            list.add(board);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
//	 public boolean login(String id, String password) {
//	        boolean login = false;
//	        String sql = "SELECT COUNT(*) FROM board WHERE num = ? AND writer = ?";
//
//	        try (
//	           
//	            PreparedStatement pstmt = conn.prepareStatement(sql);
//	        ) {
//	            pstmt.setString(1, id);
//	            pstmt.setString(2, password);
//
//	            try (ResultSet rs = pstmt.executeQuery()) {
//	                rs.next();
//	                int res = rs.getInt(1);
//	                if (res == 1) {
//	                    login = true;
//	                }
//	            } catch (SQLException e) {
//	                e.printStackTrace();
//	            }
//	        } catch (SQLException e) {
//	            e.printStackTrace();
//	        }
//
//	        return login;
//	    }
	
	public Board selectOne(int num, boolean inc) {
		Board board = null;
		String sql = "select * from board where num = ?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board = new Board(rs.getInt("num"),
						rs.getString("title"), rs.getString("content"),
						 rs.getTimestamp("regtime").toLocalDateTime(), rs.getInt("hits"),rs.getInt("memberno"));

			}
			if (inc) {
				pstmt.executeUpdate("update board set hits=hits+1 where num="+num);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return board;
		
	}
	
	public int delete(int num) {
		int result = 0;
		try ( 
		        PreparedStatement pstmt = conn.prepareStatement(
		        		"delete from board where num=" + num);
		    ) {
		        // 쿼리 실행
				result = pstmt.executeUpdate();
		        
		    } catch(Exception e) {
		        e.printStackTrace();
		    }
		return result;
	}
	
	public int insert(Board board) {
	    String sql = "insert into board(num, title, content, regtime, hits, memberno) values (SEQ_MEMBER.nextval,?,?,?,0,?)";
	    try ( 
	        PreparedStatement pstmt = conn.prepareStatement(sql);            
	    ) {
	        pstmt.setString(1, board.getTitle());
	        pstmt.setString(2, board.getContent());
	        pstmt.setTimestamp(3, Timestamp.valueOf(board.getRegtime()));
	        pstmt.setInt(4,board.getMemberno());
	        return pstmt.executeUpdate();
	    } catch(SQLException e) {
	        e.printStackTrace();
	    } 
	    return 0;
	}

	
	public int update(Board board) {
	    String sql = "update board set title=?, content=?, regtime=?  where num=?";
	    try ( 
	        PreparedStatement pstmt = conn.prepareStatement(sql);            
	    ) {
	        pstmt.setString(1, board.getTitle());
	        pstmt.setString(2, board.getContent());
	        pstmt.setTimestamp(3, Timestamp.valueOf(board.getRegtime()));
	        pstmt.setInt(4, board.getNum());
	        
	        return pstmt.executeUpdate();
	    } catch(SQLException e) {
	        e.printStackTrace();
	    } 
	    return 0;
	}

	
}





