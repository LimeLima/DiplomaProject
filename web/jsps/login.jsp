<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  servlets.User: lime
  Date: 09.11.2022
  Time: 09:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Name | Log in</title>
    <link rel="stylesheet" href="../csss/login.css">
    <link href="../csss/header.css" rel="stylesheet">
    <link href="../csss/footer.css" rel="stylesheet">
</head>
<body>
    <header>
        <div class="sign-up">
            <a class="sign-up-button valign-text-middle links" href="signup.jsp">Sign up</a>
        </div>
        <div class="menu">
            <div class="navigation">
                <a class="links" href="../index.jsp">Main</a>
                <a class="links" href="HobbiesServlet">Hobby</a>
                <a class="links">Events</a>
            </div>
            <div class="logo-div">
                <img src="../content/logo.jpg" class="logo-img" alt="">
                <a class="title links">HobHub</a>
            </div>
        </div>
    </header>
    <div class="main">
        <img src="../content/logo.jpg" class="logo">
        <p class="sign-up-text">Log in</p>
        <form action="${pageContext.request.contextPath}/LogInServlet" method="post">
            <label class="email-label">E-mail or nickname<br><input class="email-input" name="email" type="text"></label>
            <label class="password-label">Password<br><input class="email-input" name="password" type="password"></label>
<%--            <a href="../index.jsp"><input type="button" value="Sign up" class="button" onclick=""></a>--%>
            <button type="submit" class="button">Log in</button>
        </form>
        <div class="have-acc-div"><p class="have-acc">Do not have an account?<a class="link-to-login" href="signup.jsp">Sign up</a></p></div>
    </div>
    <footer>
        <div class="footer-logo">
            <img src="../content/logo.jpg" class="footer-logo-img">
            <a class="footer-name">HobHub</a>
        </div>
        <div class="footer-navigate">
            <a class="links" href="login.jsp">Main</a>
            <a class="links" href="HobbiesServlet">Hobby</a>
            <a class="links">Events</a>
        </div>
        <div class="contact-us">
            <p class="contact-us-title">Contact us</p>
            <a href="https://www.instagram.com" class="links-social1"><img src="../content/instagram.svg" class="insta-img"><p class="text-link">Name</p></a>
            <a href="https://www.facebook.com" class="links-social2"><img src="../content/facebook.svg" class="insta-img"><p class="text-link">Name</p></a>
            <a href="https://mail.google.com" class="links-social3"><img src="../content/gmail.svg" class="insta-img"><p class="text-link">Name@gmail.com</p></a>
        </div>
        <img src="../content/up.svg" class="up">
        <a class="google-play">
            <img src="../content/google_play.svg" class="icon">
            <p class="android">ANDROID APP ON</p>
            <p class="play">Google Play</p>
        </a>
        <a class="app-store">
            <img src="../content/app_store.svg" class="icon">
            <p class="download">DOWNLOAD ON THE</p>
            <p class="apple">App Store</p>
        </a>
    </footer>
</body>
</html>
