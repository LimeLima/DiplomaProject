<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="com.lime.servlets.User" %>
<%@ page import="com.lime.db.DBManager" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lime.servlets.Hobby" %><%--
  Created by IntelliJ IDEA.
  User: lime
  Date: 30.11.2022
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hobbies | Admin Page</title>
    <link href="${pageContext.request.contextPath}/csss/header.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/hobby/hobbies.css" rel="stylesheet">
<%--    <link href="${pageContext.request.contextPath}/admin/user/users.csss.css" rel="stylesheet">--%>
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
                <a class="title links" href="index.jsp">HobHub</a>
            </div>
        </div>
    </header>
    <div class="main">
        <h3>Data of Hobby</h3>
        <table>
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Title</th>
                <th scope="col">Overview</th>
                <th scope="col">Admin ID</th>
                <th scope="col">Count of Posts</th>
                <th scope="col">Group ID</th>
                <th scope="col">Update</th>
                <th scope="col">Delete</th>
            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<Hobby> hobbies = DBManager.getHobbies();
                for (Hobby h : hobbies) {
            %>
            <tr>
                <td><%=h.getId()%></td>
                <td><%=h.getTitle()%></td>
                <td><%=h.getOverview()%></td>
                <td><%=h.getAdmin_id()%></td>
                <td><%=h.getCount_of_posts()%></td>
                <td><%=h.getGroup_id()%></td>
                <td><a href="${pageContext.request.contextPath}/UpdateHobbyServlet?id=<%=h.getId()%>" class="btn btn-primary">Update</a></td>
                <td><a href="${pageContext.request.contextPath}/DeleteHobbyServlet?id=<%=h.getId()%>" class="btn btn-primary">Delete</a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <a href="AddHobbyServlet" class="addHobby">Add Hobby</a>
    </div>
</body>
</html>
