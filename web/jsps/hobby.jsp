<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lime.servlets.Hobby" %>
<%@ page import="com.lime.servlets.Group" %>
<%@ page import="jakarta.servlet.http.Cookie" %><%--
  Created by IntelliJ IDEA.
  servlets.User: lime
  Date: 09.11.2022
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hobby | HobHub</title>
    <link href="${pageContext.request.contextPath}/csss/header.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/csss/footer.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/csss/hobby.css" rel="stylesheet">
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
    <div class="main">
        <p class="hobby-title">Hobby</p>
        <p class="sport-title">Sport</p>
        <p class="handmade-title">Handmade</p>
        <p class="language-title">Language club</p>
        <div class="sport-div">
            <%
                ArrayList<Hobby> hobbies = (ArrayList<Hobby>) request.getAttribute("hobbies");
                ArrayList<Hobby> sports = new ArrayList<>();
                ArrayList<Hobby> handmade = new ArrayList<>();
                ArrayList<Hobby> languages = new ArrayList<>();
                for (Hobby h : hobbies) {
                    if (h.getGroup_id() == 1) sports.add(h);
                    else if(h.getGroup_id() == 2) handmade.add(h);
                    else if(h.getGroup_id() == 3) languages.add(h);
                }

                for (Hobby s : sports) {
            %>
                <a href="ThisHobbyServlet?param=<%=s.getId()%>">
                <div class="sport">
                    <p class="sport-name"><%=s.getTitle()%></p>
                </div>
                </a>
            <%
                }
            %>
        </div>
        <div class="handmade-div">
            <%
                for (Hobby h : handmade) {
            %>
                <a href="ThisHobbyServlet?param=<%=h.getId()%>">
                <div class="handmade">
                    <p class="handmade-name"><%=h.getTitle()%></p>
                </div>
                </a>
            <%
                }
            %>
        </div>
        <div class="languages-div">
            <%
                for (Hobby l : languages) {
            %>
            <a href="ThisHobbyServlet?param=<%=l.getId()%>">
            <div class="language">
                <p class="language-name"><%=l.getTitle()%></p>
            </div>
            </a>
            <%
                }
            %>
        </div>
    </div>
    <footer>
        <div class="footer-logo">
            <img src="${pageContext.request.contextPath}/content/logo.jpg" class="footer-logo-img">
            <a class="footer-name">Name</a>
        </div>
        <div class="footer-navigate">
            <a class="links" href="../index.jsp">Main</a>
            <a class="links" href="HobbiesServlet">Hobby</a>
            <a class="links">Events</a>
        </div>
        <div class="contact-us">
            <p class="contact-us-title">Contact us</p>
            <a href="https://www.instagram.com" class="links-social1"><img src="${pageContext.request.contextPath}/content/instagram.svg" class="insta-img"><p class="text-link">Name</p></a>
            <a href="https://www.facebook.com" class="links-social2"><img src="${pageContext.request.contextPath}/content/facebook.svg" class="insta-img"><p class="text-link">Name</p></a>
            <a href="https://mail.google.com" class="links-social3"><img src="${pageContext.request.contextPath}/content/gmail.svg" class="insta-img"><p class="text-link">Name@gmail.com</p></a>
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
