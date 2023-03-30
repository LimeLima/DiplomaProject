<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="com.lime.servlets.Hobby" %><%--
  Created by IntelliJ IDEA.
  User: lime
  Date: 30.11.2022
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Hobby | Admin Page</title>
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
    <%
        Hobby hobby = (Hobby) request.getAttribute("hobby");
    %>
    <div class="main">
        <h3 class="text-title">Update Hobby / Hobby ID: <%=hobby.getId()%></h3>
        <form action="${pageContext.request.contextPath}/UpdateHobbyServlet" method="post">
            <label class="email-label">Title<br><input class="email-input" type="text" name="title" value="<%=hobby.getTitle()%>"></label>
            <label class="nick-label">Overview<br><input class="nick-input" type="text" name="overview" value="<%=hobby.getOverview()%>"></label>
            <label class="adminId-label">Admin ID<br><input class="nick-input" type="text" name="admin_id" value="<%=hobby.getAdmin_id()%>"></label>
            <label class="count-label">Count of posts<br><input value="<%=hobby.getCount_of_posts()%>" class="nick-input" type="text" name="count" readonly></label>
            <label class="password-label">Group ID<br><input class="email-input" type="text" name="group_id" value="<%=hobby.getGroup_id()%>"></label>
            <input name="id" class="invisible-id" type="text" value="<%=hobby.getId()%>" style="visibility: hidden">
            <button type="submit" class="button">Update Hobby</button>
        </form>
        <a class="back-button" href="${pageContext.request.contextPath}/HobbiesServlet">Back</a>
    </div>
</body>
</html>
