<%@page import="java.time.LocalDateTime"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<%
String numParam = request.getParameter("num");
int num = (numParam != null && !numParam.isEmpty()) ? Integer.parseInt(numParam) : 0;

int memberno = 0;
String title = "";
String content = "";
LocalDateTime regtime = null;
int hits = 0;

String memberId = (String) session.getAttribute("ID");
if (memberId == null) {
	response.sendRedirect("../index.jsp");
}

BoardDao dao = BoardDao.getInstance();
Board board = dao.selectOne(num, true);

memberno = board.getMemberno();
title = board.getTitle();
content = board.getContent();
regtime = board.getRegtime();
hits = board.getHits();
num = board.getNum();

// 날짜 및 시간 형식 지정
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
String formattedRegtime = regtime.format(formatter);

// 공백 및 줄바꿈 처리
title = title.replace(" ", "&nbsp;");
content = content.replace(" ", "&nbsp;").replace("\n", "<br>");
%>

<!doctype html>
<html lang="en">

<head>
    <nav class="navbar navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="../HomePage.jsp">HomePage</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="list.jsp">List</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="http://youtube.com">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="../viewDetail.jsp">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" aria-disabled="true">...</a>
        </li>
      </ul>
      
    </div>
  </div>
</nav>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>view</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
           <style>
        body {
            background-color: #f9f9f9;
            
            margin: 0;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-8">
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">제목</label>
                    <input class="form-control" type="text" value="<%=title %>" readonly name="title">
                </div>

                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">작성자</label>
                    <input class="form-control" type="text" value="<%=memberno %>" readonly>
                </div>

                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">작성일시</label>
                    <input class="form-control" type="text" value="<%=formattedRegtime %>" readonly>
                </div>

                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">조회수</label>
                    <input class="form-control" type="text" value="<%=hits %>" readonly>
                </div>

                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">내용</label>
                    <textarea class="form-control" readonly rows="6"><%=content %></textarea>
                </div>
                <input type="button" value="목록보기" onclick="location.href='list.jsp'" class="btn btn-primary">
				<input type="button" value="수정" class="btn btn-dark"
      					 onclick="location.href='write.jsp?num=<%=num%>'">
				<input type="button" value="삭제" class="btn btn-danger"
       					onclick="location.href='delete.jsp?num=<%=num%>'">
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>
