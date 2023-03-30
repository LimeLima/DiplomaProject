<%@ page import="com.lime.servlets.Hobby" %>
<%@ page import="com.lime.servlets.User" %>
<%@ page import="com.lime.db.DBManager" %>
<%@ page import="com.lime.servlets.Group" %>
<%@ page import="jakarta.servlet.http.Cookie" %><%--
  Created by IntelliJ IDEA.
  User: lime
  Date: 28.11.2022
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hobby | HobHub</title>
    <link href="${pageContext.request.contextPath}/csss/header.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/csss/footer.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/csss/this_hobby.css" rel="stylesheet">
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
    %>
    <div class="main">
        <p class="title2"><%=hobby.getTitle()%> / <%=group.getTitle()%></p>
        <a href="AddPostServlet?param=<%=hobby.getId()%>"><img src="https://e7.pngegg.com/pngimages/354/728/png-clipart-plus-and-minus-signs-computer-icons-emoji-logo-plus-thumbnail.png" class="button-add-post"></a>
        <%
            for (int i = hobby.getCount_of_posts() - 1; i >= 0; i--) {
                User user1 = DBManager.getUserByID(hobby.getPosts().get(i).getAuthor_id());
                System.out.println("this hobby user1 = " + user1);
        %>
        <div class="post">
            <p class="title2 handmade"><%=hobby.getTitle()%> / <%=group.getTitle()%></p>
            <p class="more">See more</p>
            <p class="nickname"><%=user1.getNickname()%></p><p class="date"><%=hobby.getPosts().get(i).getDate_of_posting()%></p>
            <p class="post-text"><%=hobby.getPosts().get(i).getText_of_post()%></p>
            <%
                User commentUser = null;
                if (hobby.getPosts().get(i).getCount_of_comments() > 0){
                    commentUser = DBManager.getUserByID(hobby.getPosts().get(i).getComments().get(0).getUser_id());
            %>
            <p class="discussion">Discussions             <%=hobby.getPosts().get(i).getCount_of_comments()%> replies</p>
            <p class="nickname2"><%=commentUser.getNickname()%></p>
            <p class="date2"><%=hobby.getPosts().get(i).getComments().get(0).getDate_of_comment()%></p>
            <p class="reply-text"><%=hobby.getPosts().get(i).getComments().get(0).getText_of_comment()%></p>
            <%
                }
            %>
        </div>
        <%
            }
        %>
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
