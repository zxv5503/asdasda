<%@page import="dto.Board"%>
<%@page import="dto.Member"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>  
    
<%
    // 지정된 글 번호 얻기
    int num = Integer.parseInt(request.getParameter("num"));

Member member = (Member)session.getAttribute("member");
if (member == null) {
	response.sendRedirect("sessionLoginForm.jsp");
}
BoardDao dao = BoardDao.getInstance();
Board board = dao.selectOne(num, true);
if (member.getMemberno() != board.getMemberno()) {
    // 권한이 없는 경우
    
   
    %>
    <script>
			alert("권한이 없습니다.")
			history.back();
	</script>
    
    
    <%
    return;
}
dao.delete(num);
    
    // 목록보기 화면으로 돌아감
    response.sendRedirect("list.jsp");
%>