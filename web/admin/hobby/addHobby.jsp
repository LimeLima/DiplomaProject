<%@ page import="jakarta.servlet.http.Cookie" %><%--
  Created by IntelliJ IDEA.
  User: lime
  Date: 30.11.2022
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Hobby | Admin Page</title>
    <link href="${pageContext.request.contextPath}/csss/header.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/hobby/updateHobby.css" rel="stylesheet">
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
                <a class="links" href="${pageContext.request.contextPath}/UsersServlet">Users </a>
                <a class="links" href="${pageContext.request.contextPath}/HobbyServlet">Hobbies</a>
                <a class="links" href="${pageContext.request.contextPath}/PostsServlet">Posts</a>
                <a class="links" href="${pageContext.request.contextPath}/CommentsServlet">Comments</a>
            </div>
            <div class="logo-div">
                <img src="content/logo.jpg" class="logo-img" alt="">
                <a class="title links">HobHub</a>
            </div>
        </div>
    </header>
    <div class="main">
        <h3 class="text-title">New Hobby</h3>
        <form action="${pageContext.request.contextPath}/AddHobbyServlet" method="post">
            <label class="email-label">Title<br><input class="email-input" type="text" name="title"></label>
            <label class="nick-label">Overview<br><input class="nick-input" type="text" name="overview"></label>
            <label class="adminId-label">Admin ID<br><input class="nick-input" type="text" name="admin_id"></label>
            <label class="count-label">Count of posts<br><input value="0" class="nick-input" type="text" name="count" readonly></label>
            <label class="password-label">Group ID<br><input class="email-input" type="text" name="group_id"></label>
            <button type="submit" class="button">Add Hobby</button>
        </form>
        <a class="back-button" href="${pageContext.request.contextPath}/HobbiesServlet">Back</a>
    </div>
</body>
</html>
