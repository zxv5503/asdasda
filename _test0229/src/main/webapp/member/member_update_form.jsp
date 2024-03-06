<!DOCTYPE html>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>update</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>



<body class="d-flex align-items-center justify-content-center" style="height: 100vh;">
<%
    request.setCharacterEncoding("utf-8");
	Member member3 = (Member)session.getAttribute("member");
	//Member member 
	//  = MemberDao.getInstance().select(member3.getId());  
	  if (member3 == null) {
		  %>
	        <script>
	            alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
	            window.location.href = "../index.jsp";
	        </script> 
	<%
	return;
    }
%>
    <form action="member_update.jsp" method="post">
        <div class="container-md">
            <div class="row justify-content-center">
                <div class="col-md-13">
                    <div class="mb-3">
                        <label for="floatingInputID" class="form-label">아이디</label>
                        <input type="text" class="form-control" id="floatingInputID" placeholder="ID" name="id" value="<%=member3.getId()%>">
                    </div>
                    <div class="mb-3">
                        <label for="floatingEmail" class="form-label">이메일</label>
                        <input type="email" class="form-control" id="floatingEmail" placeholder="name@example.com" name="pw" value="<%=member3.getEmail()%>">
                    </div>
                    <div class="mb-3">
                        <label for="floatingInputName" class="form-label">이름</label>
                        <input type="text" class="form-control" id="floatingInputName" placeholder="Name" name="name" value="<%=member3.getName()%>">
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <button type="submit" class="btn btn-primary">등록</button>
                        <input type="button" value="취소" onclick="history.back()" class="btn btn-danger">
                    </div>
                </div>
                
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
