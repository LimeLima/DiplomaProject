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
    <title>Add User | Admin Page</title>
    <link href="${pageContext.request.contextPath}/csss/header.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/user/addUser.cssr.css" rel="stylesheet">
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
        <h3 class="text-title">New User</h3>
        <form action="${pageContext.request.contextPath}/AddUserServlet" method="post">
            <label class="email-label">E-mail<br><input class="email-input" type="email" name="email"></label>
            <label class="nick-label">Nickname<br><input class="nick-input" type="text" name="nickname"></label>
            <label class="birth-label">Birthday<br>
                <input class="birth-day-input" list="days" name="day">
                <input class="birth-month-input" list="months" name="month">
                <input class="birth-year-input" list="years" name="year"></label>
            <datalist id="days">
                <%
                    for(int i = 1; i <= 31; i++){
                %>
                <option><%=i%></option>
                <%
                    }
                %>
            </datalist>
            <datalist id="months">
                <%
                    String[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
                    for(String m : months) {
                %>
                <option><%=m%></option>
                <%
                    }
                %>
            </datalist>
            <datalist id="years">
                <%
                    for (int i = 2021; i > 1950; i--) {
                %>
                <option><%=i%></option>
                <%
                    }
                %>
            </datalist>
            <label class="password-label">Password<br><input class="email-input" type="password" name="password"></label>
            <button type="submit" class="button">Add User</button>
        </form>
        <a class="back-button" href="${pageContext.request.contextPath}/UsersServlet">Back</a>
    </div>
</body>
</html>
