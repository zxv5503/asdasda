<%@page import="dto.Member"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    Member member = (Member)session.getAttribute("member");
    if (member == null) {
        // 로그인되어 있지 않으면 경고 메시지 표시하고 index.jsp로 리디렉션
%>
        <script>
            alert('로그인이 필요합니다!');
            location.href='../index.jsp';
        </script>
<%
        return;
    }
    String memberId = member.getId();
    int memberNo = member.getMemberno(); // 이 부분을 추가
    String searchKeyword = request.getParameter("searchKeyword");
   
    BoardDao dao = BoardDao.getInstance();
    List<Board> list = dao.selectList();
    
    if (searchKeyword != null && !searchKeyword.isEmpty()) {
        // 검색어가 있는 경우
        list = dao.searchByTitle(searchKeyword);
    } else {
        // 검색어가 없는 경우 모든 글을 가져옴
        list = dao.selectList();
    }

    // 페이지 처리
    int pageSize = 8;
    int totalPosts = list.size();
    int totalPages = (int) Math.ceil((double) totalPosts / pageSize);

    String pageParam = request.getParameter("page");
    int currentPage = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;

    int startIndex = (currentPage - 1) * pageSize;
    int endIndex = Math.min(startIndex + pageSize, totalPosts);

    List<Board> currentPageList = list.subList(startIndex, endIndex);

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>list</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    
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
      <form class="d-flex" role="search" >
        <input class="form-control me-2" type="search" placeholder="제목" aria-label="Search" name="searchKeyword">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
 <style>
        body {
            background-color: #f9f9f9;
            color: #fff;
            margin: 0;
        }
    </style>
</head>
<body>

    <div class="container" style="padding-top: 50px;">
        <table class="table table-bordered table-hover">
            <tr>
                <th class="num">번호</th>
                <th class="title">제목</th>
                <th class="memberno">작성자(고유번호)</th>
                <th class="regtime">작성일시</th>
                <th>조회수</th>
            </tr>
            <% for (Board board : currentPageList) { %>
                <tr>
                    <td><%= board.getNum() %></td>
                    <td style="text-align:left;">
                        <a href="view.jsp?num=<%= board.getNum() %>" class="link-success link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">
                            <%= board.getTitle() %>
                        </a>
                    </td>
                    <td><%= board.getMemberno() %></td>
                    <td><%= board.getRegtime().format(formatter) %></td>
                    <td><%= board.getHits() %></td>
                </tr>
            <% } %>
        </table>

        <!-- 페이지네이션 -->
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <% if (currentPage > 1) { %>
                    <li class="page-item">
                        <a class="page-link" href="list.jsp?page=<%= currentPage - 1 %>" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                <% } %>
                <% for (int i = 1; i <= totalPages; i++) { %>
                    <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
                        <a class="page-link" href="list.jsp?page=<%= i %>"><%= i %></a>
                    </li>
                <% } %>
                <% if (currentPage < totalPages) { %>
                    <li class="page-item">
                        <a class="page-link" href="list.jsp?page=<%= currentPage + 1 %>" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                <% } %>	
            </ul>
        </nav>

        <!-- 글쓰기 버튼 -->
        <br>
        <button type="button" class="btn btn-dark fixed button" onclick="location.href='write.jsp'">글쓰기</button>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
