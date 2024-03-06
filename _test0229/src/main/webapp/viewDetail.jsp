<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

  <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 화면 전체 높이를 기준으로 정렬 */
            margin: 0;
        }

        video {
            width: 80%; /* 동영상의 가로 크기를 조절 */
            max-width: 100%; /* 너비가 100%가 되도록 설정 */
        }

        /* 우측 상단 버튼 스타일 */
        .btn-close {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1000; /* 다른 요소들보다 위에 나타나도록 설정 */
        }
    </style>
</head>

<body>
<a href="HomePage.jsp">
<button type="button" class="btn-close" aria-label="Close"></button>
</a>
<video src="img/champion.mp4" autoplay muted loop></video>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>