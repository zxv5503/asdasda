package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import dto.Comments;

public class CommentsDao {
	private static Connection conn;
	private static CommentsDao dao = new CommentsDao();
	private CommentsDao() {} // 생성자
	public static CommentsDao getInstance() {
		CommentsDao.getConnection();
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
	

	
	public ArrayList<Comments> selectList() {
		ArrayList<Comments> list = new ArrayList<>();
		String sql = "select * from comments order by num desc";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Comments comments = new Comments(rs.getInt("num"),
						rs.getString("title"), rs.getString("content"),
						 rs.getTimestamp("regtime").toLocalDateTime(), rs.getInt("hits"),rs.getInt("memberno"));
				list.add(comments);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Comments> searchByTitle(String title) {
	    ArrayList<Comments> list = new ArrayList<>();
	    String sql = "SELECT * FROM comments WHERE title LIKE ? ORDER BY num DESC";
	    PreparedStatement pstmt;

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, "%" + title + "%");

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Comments comments = new Comments(
	                    rs.getInt("num"),
	                    rs.getString("title"),
	                    rs.getString("content"),
	                    rs.getTimestamp("regtime").toLocalDateTime(),
	                    rs.getInt("hits"),
	                    rs.getInt("memberno")
	            );
	            list.add(comments);
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
	
	public Comments selectOne(int memberno) {
		Comments comments = null;
		String sql = "select * from comments where memberno = ?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberno);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				comments = new Comments(rs.getInt("num"),
						rs.getString("title"), rs.getString("content"),
						 rs.getTimestamp("regtime").toLocalDateTime(), rs.getInt("hits"),rs.getInt("memberno"));

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return comments;
		
	}
	
	public int delete(int num) {
		int result = 0;
		try ( 
		        PreparedStatement pstmt = conn.prepareStatement(
		        		"delete from comments where num=" + num);
		    ) {
		        // 쿼리 실행
				result = pstmt.executeUpdate();
		        
		    } catch(Exception e) {
		        e.printStackTrace();
		    }
		return result;
	}
	
	public int insert(Comments comments) {
	    String sql = "insert into comments(num, title, content, regtime, hits, memberno) values (SEQ_MEMBER.nextval,?,?,?,0,?)";
	    try ( 
	        PreparedStatement pstmt = conn.prepareStatement(sql);            
	    ) {
	        pstmt.setString(1, comments.getTitle());
	        pstmt.setString(2, comments.getContent());
	        pstmt.setTimestamp(3, Timestamp.valueOf(comments.getRegtime()));
	        pstmt.setInt(4,comments.getMemberno());
	        return pstmt.executeUpdate();
	    } catch(SQLException e) {
	        e.printStackTrace();
	    } 
	    return 0;
	}

	
	public int update(Comments comments) {
	    String sql = "update comments set title=?, content=?, regtime=?  where num=?";
	    try ( 
	        PreparedStatement pstmt = conn.prepareStatement(sql);            
	    ) {
	        pstmt.setString(1, comments.getTitle());
	        pstmt.setString(2, comments.getContent());
	        pstmt.setTimestamp(3, Timestamp.valueOf(comments.getRegtime()));
	        pstmt.setInt(4, comments.getNum());
	        
	        return pstmt.executeUpdate();
	    } catch(SQLException e) {
	        e.printStackTrace();
	    } 
	    return 0;
	}

	
}





