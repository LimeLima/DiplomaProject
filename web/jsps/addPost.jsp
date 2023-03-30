<%@ page import="com.lime.db.DBManager" %>
<%@ page import="com.lime.servlets.Group" %>
<%@ page import="com.lime.servlets.Hobby" %>
<%@ page import="com.lime.servlets.User" %>
<%@ page import="jakarta.servlet.http.Cookie" %><%--
  Created by IntelliJ IDEA.
  User: lime
  Date: 29.11.2022
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Post | HobHub</title>
    <link href="${pageContext.request.contextPath}/csss/header.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/csss/footer.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/csss/addPost.css" rel="stylesheet">
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
                        System.out.println("getname " + cookies[i].getName());
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
    <%
        Hobby hobby = (Hobby) request.getAttribute("thisHobby");
        Group group = DBManager.getGroupByID(hobby.getGroup_id());
        request.setAttribute("thisHobby", hobby);
    %>
    <div class="main">
        <p class="title2"><%=hobby.getTitle()%> / <%=group.getTitle()%></p>
        <form action="${pageContext.request.contextPath}/AddHobbyServlet" method="post">
            <label>Write your post<br>
                <textarea rows="5" cols="126" name="post_text" placeholder="Post text..."></textarea>
                <input type="text" name="hobbyID" value="<%=hobby.getId()%>" style="visibility: hidden">
            </label>
            <button type="submit" >Publish a post</button>
        </form>
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
