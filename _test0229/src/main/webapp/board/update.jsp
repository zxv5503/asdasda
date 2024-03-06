<%@page import="dto.Member"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.time.*"%>

<%
    request.setCharacterEncoding("utf-8");

    // 양식에 입력되었던 값 읽기
    int num = Integer.parseInt(request.getParameter("num"));
    String title   = request.getParameter("title"  );
    String content = request.getParameter("content");
    String memberno = request.getParameter("memberno");
   
    // 빈 칸이 하나라도 있으면 오류 출력하고 종료
    if (title   == null || title.length()   == 0 ||
        content == null || content.length() == 0) {
%>
    <script>
        alert('모든 항목이 빈칸 없이 입력되어야 합니다.');
        history.back();
    </script>
<%        
        return;
    }

    String memberId = (String) session.getAttribute("ID");
    if (memberId == null) {
    	response.sendRedirect("../index.jsp");
    	return;
    }
    
    
    

    // 수정할 Board 객체 생성
    
    Member member = (Member)session.getAttribute("member");
    BoardDao dao = BoardDao.getInstance();
    Board board = dao.selectOne(num, true);
    if (member == null) {
        // 세션에 "member" 속성이 없거나 null인 경우
        response.sendRedirect("../index.jsp");
        return;
    }
    LocalDateTime regtime = LocalDateTime.now();
	Board updatedBoard = new Board(num, title, content, regtime, 0, member.getMemberno());
	
	
	 if (member.getMemberno() != board.getMemberno()) {
	        // 권한이 없는 경우
	        System.out.println(member.getMemberno()+","+memberno);
	       
	        %>
	        <script>
					alert("권한이 없습니다.")
					history.back();
			</script>
	        
	        
	        <%
	        return;
	    }

    // BoardDao 객체 생성 및 게시글 수정
   // BoardDao dao = BoardDao.getInstance();
    int result = dao.update(updatedBoard);

    if (result > 0) {
        // 정상적으로 수정되었을 때의 로그
        System.out.println("게시글이 성공적으로 수정되었습니다.");
        System.out.println(member.getMemberno()+", "+ updatedBoard.getMemberno()+memberno);
        
    } else {
        // 수정 실패 시의 로그
        System.out.println("게시글 수정에 실패했습니다.");
    }

    // 목록보기 화면으로 돌아감
    response.sendRedirect("list.jsp");
%>
