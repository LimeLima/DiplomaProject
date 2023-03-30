<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="com.lime.servlets.User" %>
<%@ page import="java.util.StringTokenizer" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: lime
  Date: 30.11.2022
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update User | Admin Page</title>
    <link href="${pageContext.request.contextPath}/csss/header.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/user/updateUser.css" rel="stylesheet">
</head>
<body>
    <footer>
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
    </footer>
    <div class="main">

        <%
            User u = (User) request.getAttribute("user");
            String[] bd = u.getBirthday().split("\\s");
            int day = Integer.parseInt(bd[0]);
            String month = bd[1];
            int year = Integer.parseInt(bd[2]);

            request.setAttribute("user_id", u.getId());
        %>

        <h3 class="text-title">Update User / User's ID: <%=u.getId()%></h3>
        <form action="${pageContext.request.contextPath}/UpdateUserServlet" method="post">
            <label class="email-label">E-mail<br><input class="email-input" type="email" name="email" value="<%=u.getEmail()%>"></label>
            <label class="nick-label">Nickname<br><input class="nick-input" type="text" name="nickname" value="<%=u.getEmail()%>"></label>
            <label class="birth-label">Birthday<br>
<%--                <input class="birth-day-input" list="days" name="day">--%>
<%--                <input class="birth-month-input" list="months" name="month">--%>
<%--                <input class="birth-year-input" list="years" name="year"></label>--%>
            <select id="days" name="day" class="birth-day-input">
                <%
                    for(int i = 1; i <= 31; i++){
                        if (i == day){
                %>
                <option selected><%=i%></option>
                <%
                        }else {
                %>
                <option><%=i%></option>
                <%
                        }
                    }
                %>
            </select>
            <select id="months" class="birth-month-input" name="month">
                <%
                    String[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
                    for(String m : months) {
                        if (m == month){
                %>
                <option selected><%=m%></option>
                <%
                        } else {
                %>
                <option><%=m%></option>
                <%
                        }
                    }
                %>
            </select>
            <select id="years" name="year" class="birth-year-input">
                <%
                    for (int i = 2021; i > 1950; i--) {
                        if (i == year) {
                %>
                <option selected><%=i%></option>
                <%
                        } else {
                %>
                <option><%=i%></option>
                <%
                        }
                    }
                %>
            </select>
            </label>
            <label class="password-label">Password<br><input class="email-input" type="text" name="password" value="<%=u.getPassword()%>"></label>
            <input name="id" class="invisible-id" type="text" value="<%=u.getId()%>" style="visibility: hidden">
            <button type="submit" class="button">Update User</button>
        </form>
        <a class="back-button" href="${pageContext.request.contextPath}/UsersServlet">Back</a>
    </div>
</body>
</html>