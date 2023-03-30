<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="com.lime.servlets.User" %>
<%@ page import="com.lime.db.DBManager" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lime.servlets.Comment" %><%--
  Created by IntelliJ IDEA.
  User: lime
  Date: 30.11.2022
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Comments | Admin Page</title>
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
        <h3>Data of Comments</h3>
        <table>
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Post ID</th>
                <th scope="col">User ID</th>
                <th scope="col">Date of comment</th>
                <th scope="col">Text of comment</th>

                <th scope="col">Delete</th>
            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<Comment> comments = DBManager.getComments();
                for (Comment c : comments) {
            %>
            <tr>
                <td><%=c.getId()%></td>
                <td><%=c.getPost_id()%></td>
                <td><%=c.getUser_id()%></td>
                <td><%=c.getDate_of_comment()%></td>
                <td><%=c.getText_of_comment()%></td>
                <td><a href="${pageContext.request.contextPath}/DeleteCommentServlet?id=<%=c.getId()%>" class="btn btn-primary">Delete</a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</body>
</html>
