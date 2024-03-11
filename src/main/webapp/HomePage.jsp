<!DOCTYPE html>
<%@page import="java.util.Optional"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>Document</title>
</head>
<body>
    <header>
        <div class="inner">
            <h1><a href="HomePage.jsp">PROJECT</a></h1>

            <ul id="gnb">
                <li><a href="https://www.fotmob.com/ko/world">NEWS</a></li>
                <li><a href="#">GALLERY</a></li>
                <li><a href="https://www.youtube.com/">YOUTUBE</a></li>
                <li><a href="<%= Optional.ofNullable(session.getAttribute("ID")).isPresent() ? "board/list.jsp" : "#" %>" onclick="checkLogin()">COMMUNITY</a></li>
                <li><a href="#">LOCATION</a></li>
            </ul>

            <ul class="util">
                <li><a href="#">Contact</a></li>
                <li><a href="member/member_update_form.jsp">Update</a></li>
                <li><a href="index.jsp">Login</a></li>
                <li><a href="member/member_join_form.jsp">Join</a></li>
                <li><a href="member/logout.jsp">Logout</a></li>
            </ul>
        </div>
    </header>
    <figure>
        <video src="img/champion.mp4" autoplay muted loop></video>
        <div class="inner">
            <h1>23-24<br> Champions League</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.<br>
                 Earum nisi deserunt inventore qui ex sed ad nulla dolor quod velit doloribus commodi dolorem nostrum aliquam adipisci hic illum, dolores doloremque!</p>
                 <a href="viewDetail.jsp">view detail</a>
        </div>
    </figure>

    <section>
        <div class="inner">
            <h1>RECENT NEWS</h1>
            <div class="wrap">
                <article>
                    <div class="pic">
                        <img src="img/epl.jpeg" alt="1ë²ì§¸ ì½íì¸  ì´ë¯¸ì§">
                    </div>
                    <h2><a href="#">Lorem, ipsum dolor sit.</a></h2>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quidem, natus deserunt! Explicabo ab reiciendis alias!</p>
                </article>
                <article>
                    <div class="pic">
                        <img src="img/seria.jpeg" alt="2ë²ì§¸ ì½íì¸  ì´ë¯¸ì§">
                    </div>
                    <h2><a href="#">Lorem, ipsum dolor sit.</a></h2>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quidem, natus deserunt! Explicabo ab reiciendis alias!</p>
                </article>
                <article>
                    <div class="pic">
                        <img src="img/laliga.jpeg" alt="3ë²ì§¸ ì½íì¸  ì´ë¯¸ì§">
                    </div>
                    <h2><a href="#">Lorem, ipsum dolor sit.</a></h2>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quidem, natus deserunt! Explicabo ab reiciendis alias!</p>
                </article>
                <article>
                    <div class="pic">
                        <img src="img/bun.jpeg" alt="4ë²ì§¸ ì½íì¸  ì´ë¯¸ì§">
                    </div>
                    <h2><a href="#">Lorem, ipsum dolor sit.</a></h2>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quidem, natus deserunt! Explicabo ab reiciendis alias!</p>
                </article>
            </div>
        </div>
    </section>
    <footer>
        <div class="inner">
        <div class="upper">
            <h1>PROJECT</h1>
            <ul>
                <li><a href="#">Policy</a></li>
                <li><a href="#">Terms</a></li>
                <li><a href="#">Family Site</a></li>
                <li><a href="#">Sitemap</a></li>
            </ul>
            </div>

            <div class="lower">
                <address>
                    Lorem ipsum dolor sit, amet consectetur adipisicing elit. Blanditiis hic expedita officia impedit iste quo eum debitis. Commodi, delectus ab!<br>
                    TEL : 031-111-1234 C.P : 010-1234-5678
                </address>
                <p>
                    2024 DECDELAB &copy; copyright all rights reserved.
                </p>
            </div>
        </div>
    </footer>
<script>
    function checkLogin() {
        // Check if the user is logged in
        var loggedIn = '<%= Optional.ofNullable(session.getAttribute("ID")).isPresent() %>';

        if (loggedIn) {
            // If logged in, go to the community page
            window.location.href = 'board/list.jsp';
        } else {
            // If not logged in, show a warning and redirect to the login page
            alert('로그인이 필요합니다.');
            window.location.href = 'index.jsp';
        }
    }
</script>
  
    
</body>
</html>