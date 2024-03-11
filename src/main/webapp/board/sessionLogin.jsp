<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%

// POST로 전송된 폼 데이터 얻어오기
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String password = request.getParameter("password");

MemberDao memberDao = MemberDao.getInstance();
Member member = memberDao.selectForLogin(id, password);

if (member != null) { // 로그인 성공 시
    session.setAttribute("member", id);
%>
    <html>
    <head>
        <title>로그인 성공</title>
    </head>
    <body>로그인에 성공했습니다.</body>
    </html>
<%
} else { // 로그인 실패 시
%>
    <script>
        alert("로그인에 실패하였습니다.");
        history.go(-1);
    </script>
<%
}
%>
