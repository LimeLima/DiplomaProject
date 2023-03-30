<%@ page import="jakarta.servlet.http.Cookie" %><%--
  Created by IntelliJ IDEA.
  servlets.User: lime
  Date: 08.11.2022
  Time: 09:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Main | HobHub</title>
    <link href="csss/index.css" rel="stylesheet">
    <link href="csss/header.css" rel="stylesheet">
    <link href="csss/footer.css" rel="stylesheet">
  </head>
  <body>
    <header>
      <div class="sign-up">
        <%
          String login = "logout";
          String link = "jsps/signup.jsp";
//            User user = (User) request.getAttribute("online");

          Cookie[] cookies = null;
          cookies = request.getCookies();
          String user = null;
          if (cookies != null) {
            for (int i = 0; i < cookies.length; i++){
              if (cookies[i].getName().equals("online")){
                user = cookies[i].getValue();
                System.out.println(cookies[i].getValue() + " getname " + cookies[i].getName());
              }
            }
          }

//            String user = request.getParameter("online");
          System.out.println("cookie " + user);
          if (user != null){
            link = "LogOutServlet";
            login = "Log out";
          }
          else {
            login = "Sign up";
            link = "jsps/signup.jsp";
          }
        %>
        <a href="<%=link%>" class="sign-up-button valign-text-middle links"><%=login%></a>
      </div>
      <div class="menu">
        <div class="navigation">
          <a class="links" href="#">Main</a>
          <a class="links" href="HobbiesServlet">Hobby</a>
          <a class="links">Events</a>
        </div>
        <div class="logo-div">
          <img src="content/logo.jpg" class="logo-img" alt="">
          <a class="title links">HobHub</a>
        </div>
      </div>
    </header>
    <div class="main">
      <img src="content/banner.svg" class="banner">
      <div class="content">
        <div class="empty"></div>
        <p class="titles text-main">Main</p>
        <div class="post">
          <p class="title2 handmade">Knitting / Handmade</p>
          <p class="more">See more</p>
          <p class="nickname">Limko</p><p class="date">2 november 9:23</p>
          <p class="post-text">Hi all, today I had a great idea for a handmade gift for my friend to knit. I need help, so
            if anyone has been able to find knitting patterns for a scarf, can you share with me? </p>
          <p class="attachments">3 attachments</p>
          <p class="discussion">Discussions</p>
          <p class="replies">5 replies</p>
          <p class="nickname2">qwerty</p>
          <p class="date2">2 november 18:10</p>
          <p class="reply-text">Hello! Oh it’s good idea to make skarf by yourself for your friend. I use good web site for
            knitting - www.funknitting.com</p>
        </div>
        <div class="post">
          <p class="handmade title2">Football / Sport</p>
          <p class="more">See more</p>
          <p class="nickname">footballBoy</p><p class="date">2 november 9:43</p>
          <p class="post-text">Hi all, guys. Wanted to play some football today, who wants to post below let's discuss time
            and place. Tentative area - Almalinski, Almaty, and time - I am free all day, so let's decide</p>
  <%--        <p class="attachments">3 attachments</p>--%>
          <p class="discussion">Discussions</p>
          <p class="replies">10 replies</p>
          <p class="nickname2">aaasssd</p>
          <p class="date2">2 november 18:10</p>
          <p class="reply-text">Oooh, hello. I'd love to play football today, and the Almalinski area is convenient for me.
            I'll be free by 12 noon, I suggest we play on the football...</p>
        </div>
        <div class="post">
          <p class="handmade title2">English / Language clubs</p>
          <p class="more">See more</p>
          <p class="nickname">kkenguk</p><p class="date">2 november 12:02</p>
          <p class="post-text">Good afternoon, I was scheduled to have English today but it has been cancelled but I would
            like to practise at this time, who would like to sign up and we can meet at the cafe at the intersection of
            Abaya and Nazarbaeva Streets </p>
          <p class="discussion">Discussions</p>
  <%--        <p class="replies">5 replies</p>--%>
          <p class="nickname2">iamalina</p>
          <p class="date2">2 november 12:24</p>
          <p class="reply-text">Hi, I wouldn't mind practising with you, you forgot to mention the time, I'll probably come, it'll be fun</p>
        </div>
      </div>
    </div>
    <footer>
      <div class="footer-logo">
        <img src="content/logo.jpg" class="footer-logo-img">
        <a class="footer-name">HobHub</a>
      </div>
      <div class="footer-navigate">
        <a class="links" href="#">Main</a>
        <a class="links" href="jsps/hobby.jsp">Hobby</a>
        <a class="links">Events</a>
      </div>
      <div class="contact-us">
        <p class="contact-us-title">Contact us</p>
        <a href="https://www.instagram.com" class="links-social1"><img src="content/instagram.svg" class="insta-img"><p class="text-link">Name</p></a>
        <a href="https://www.facebook.com" class="links-social2"><img src="content/facebook.svg" class="insta-img"><p class="text-link">Name</p></a>
        <a href="https://mail.google.com" class="links-social3"><img src="content/gmail.svg" class="insta-img"><p class="text-link">Name@gmail.com</p></a>
      </div>
      <img src="content/up.svg" class="up">
      <a class="google-play">
        <img src="content/google_play.svg" class="icon">
        <p class="android">ANDROID APP ON</p>
        <p class="play">Google Play</p>
      </a>
      <a class="app-store">
        <img src="content/app_store.svg" class="icon">
        <p class="download">DOWNLOAD ON THE</p>
        <p class="apple">App Store</p>
      </a>
    </footer>
  </body>
</html>
