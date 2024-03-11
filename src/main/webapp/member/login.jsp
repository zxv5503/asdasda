<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   

<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String email = request.getParameter("email");
    String remember = request.getParameter("remember");
    
    

    // 아이디가 쿠키에 저장되어 있다면, 입력란에 설정
   // if (rememberedId != null && !rememberedId.isEmpty()) {
     //   id = rememberedId;
   // }

    boolean login = MemberDao.getInstance().login(id, email);
    
    // 그런 레코드가 있으면, 세션 속성을 등록하고, 메인 화면으로 돌아감
    if (login) {
        Member member = MemberDao.getInstance().selectForLogin(id, email);
        session.setAttribute("ID", id);
        session.setAttribute("member", member);
        
        // 현재 시간으로부터 1분 뒤의 시간 설정
        //long expirationTime = System.currentTimeMillis() + 60 * 1000;

        if(remember != null && remember.equals("on")) {
        	System.out.println(id);
        	// 쿠키에 아이디 저장
            Cookie cookie = new Cookie("rememberedId", id);
            cookie.setMaxAge(60);
            cookie.setPath("/");
            response.addCookie(cookie);
        } else {
        	Cookie cookie = new Cookie("rememberedId", "");
            cookie.setMaxAge(0);
            cookie.setPath("/");
            response.addCookie(cookie);
        }
        
        
        response.sendRedirect("../board/list.jsp");   
    }
    else {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<script>
    alert('아이디 또는 비밀번호가 틀립니다!');
    history.back();
</script>
<%
    }
%>
</body>
</html>
