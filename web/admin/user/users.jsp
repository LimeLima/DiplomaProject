<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="com.lime.servlets.User" %>
<%@ page import="com.lime.db.DBManager" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: lime
  Date: 30.11.2022
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users | Admin Page</title>
    <link href="${pageContext.request.contextPath}/csss/header.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/user/users.css" rel="stylesheet">
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
                <a class="links" href="${pageContext.request.contextPath}/UsersServlet">Users</a>
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
        <h3>Data of User</h3>
        <table>
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Nickname</th>
                <th scope="col">E-mail</th>
                <th scope="col">Password</th>
                <th scope="col">Date of birth</th>
                <th scope="col">Update</th>
                <th scope="col">Delete</th>
            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<User> users = DBManager.getUsers();
                for (User u : users) {
            %>
            <tr>
                <td><%=u.getId()%></td>
                <td><%=u.getNickname()%></td>
                <td><%=u.getEmail()%></td>
                <td><%=u.getPassword()%></td>
                <td><%=u.getBirthday()%></td>
                <td><a href="${pageContext.request.contextPath}/UpdateUserServlet?id=<%=u.getId()%>" class="btn btn-primary">Update</a></td>
                <td><a href="${pageContext.request.contextPath}/DeleteUserServlet?id=<%=u.getId()%>" class="btn btn-primary">Delete</a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <a href="AddUserServlet" class="addUser">Add User</a>
    </div>
</body>
</html>
