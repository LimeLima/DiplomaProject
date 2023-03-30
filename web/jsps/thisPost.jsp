<%--
  Created by IntelliJ IDEA.
  User: lime
  Date: 28.11.2022
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Post | HobHub</title>
    <link href="${pageContext.request.contextPath}/csss/header.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/csss/footer.css" rel="stylesheet">
</head>
<body>
    <header>
        <div class="sign-up">
            <a class="sign-up-button valign-text-middle links" href="signup.jsp">Sign up</a>
        </div>
        <div class="menu">
            <div class="navigation">
                <a class="links" href="../index.jsp">Main</a>
                <a class="links" href="hobby.jsp">Hobby</a>
                <a class="links">Events</a>
            </div>
            <div class="logo-div">
                <img src="${pageContext.request.contextPath}/content/logo.jpg" class="logo-img" alt="">
                <a class="title links">HobHub</a>
            </div>
        </div>
    </header>
    <div class="main">

    </div>
    <footer>
        <div class="footer-logo">
            <img src="${pageContext.request.contextPath}/content/logo.jpg" class="footer-logo-img">
            <a class="footer-name">HobHub</a>
        </div>
        <div class="footer-navigate">
            <a class="links" href="../index.jsp">Main</a>
            <a class="links" href="HobbiesServlet">Hobby</a>
            <a class="links">Events</a>
        </div>
        <div class="contact-us">
            <p class="contact-us-title">Contact us</p>
            <a href="https://www.instagram.com" class="links-social1"><img src="${pageContext.request.contextPath}/content/instagram.svg" class="insta-img"><p class="text-link">hobhub.kz</p></a>
            <a href="https://www.facebook.com" class="links-social2"><img src="${pageContext.request.contextPath}/content/facebook.svg" class="insta-img"><p class="text-link">hobhub.kz</p></a>
            <a href="https://mail.google.com" class="links-social3"><img src="${pageContext.request.contextPath}/content/gmail.svg" class="insta-img"><p class="text-link">hobhub.kz@gmail.com</p></a>
        </div>
        <img src="${pageContext.request.contextPath}/content/up.svg" class="up">
        <a class="google-play">
            <img src="${pageContext.request.contextPath}/content/google_play.svg" class="icon">
            <p class="android">ANDROID APP ON</p>
            <p class="play">Google Play</p>
        </a>
        <a class="app-store">
            <img src="${pageContext.request.contextPath}/content/app_store.svg" class="icon">
            <p class="download">DOWNLOAD ON THE</p>
            <p class="apple">App Store</p>
        </a>
    </footer>
</body>
</html>
