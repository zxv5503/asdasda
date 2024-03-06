<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원 가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>



<body class="d-flex align-items-center justify-content-center" style="height: 100vh;">
    <form action="member_join.jsp" method="post">
        <div class="container-md">
            <div class="row justify-content-center">
                <div class="col-md-13">
                    <div class="mb-3">
                        <label for="floatingInputID" class="form-label">아이디</label>
                        <input type="text" class="form-control" id="floatingInputID" placeholder="ID" name="id">
                    </div>
                    <div class="mb-3">
                        <label for="floatingEmail" class="form-label">이메일</label>
                        <input type="email" class="form-control" id="floatingEmail" placeholder="name@example.com" name="pw">
                    </div>
                    <div class="mb-3">
                        <label for="floatingInputName" class="form-label">이름</label>
                        <input type="text" class="form-control" id="floatingInputName" placeholder="Name" name="name">
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
