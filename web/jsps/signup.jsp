<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Name | Sign up</title>
    <link rel="stylesheet" href="../csss/signup.css">
    <link href="../csss/header.css" rel="stylesheet">
    <link href="../csss/footer.css" rel="stylesheet">
</head>
<body>
    <header>
        <div class="sign-up">
            <a class="sign-up-button valign-text-middle links" href="login.jsp">Log in</a>
        </div>
        <div class="menu">
            <div class="navigation">
                <a class="links" href="../index.jsp">Main</a>
                <a class="links" href="HobbiesServlet">Hobby</a>
                <a class="links">Events</a>
            </div>
            <div class="logo-div">
                <img src="../content/logo.jpg" class="logo-img" alt="">
                <a class="title links">HobHub</a>
            </div>
        </div>
    </header>
    <div class="main">
        <img src="../content/logo.jpg" class="logo">
        <p class="sign-up-text">Sign up</p>
        <form method="post" action="${pageContext.request.contextPath}/SignUpServlet">
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
            <label class="re-password-label">Repeat password<br><input class="email-input" type="password" name="repassword"></label>
            <input class="checkbox-input" type="checkbox"><label class="checkbox-label">Accept all things which will be here</label>
<%--            <a href="../index.jsp"><input type="button" value="Sign up" class="button" onclick=""></a>--%>
            <button type="submit" class="button">Sign up</button>
        </form>
        <div class="have-acc-div"><p class="have-acc">Already have account?<a class="link-to-login" href="login.jsp">Log in</a></p></div>
    </div>
    <footer>
        <div class="footer-logo">
            <img src="../content/logo.jpg" class="footer-logo-img">
            <a class="footer-name">HobHub</a>
        </div>
        <div class="footer-navigate">
            <a class="links" href="../index.jsp">Main</a>
            <a class="links" href="HobbiesServlet">Hobby</a>
            <a class="links">Events</a>
        </div>
        <div class="contact-us">
            <p class="contact-us-title">Contact us</p>
            <a href="https://www.instagram.com" class="links-social1"><img src="../content/instagram.svg" class="insta-img"><p class="text-link">Name</p></a>
            <a href="https://www.facebook.com" class="links-social2"><img src="../content/facebook.svg" class="insta-img"><p class="text-link">Name</p></a>
            <a href="https://mail.google.com" class="links-social3"><img src="../content/gmail.svg" class="insta-img"><p class="text-link">Name@gmail.com</p></a>
        </div>
        <img src="../content/up.svg" class="up">
        <a class="google-play">
            <img src="../content/google_play.svg" class="icon">
            <p class="android">ANDROID APP ON</p>
            <p class="play">Google Play</p>
        </a>
        <a class="app-store">
            <img src="../content/app_store.svg" class="icon">
            <p class="download">DOWNLOAD ON THE</p>
            <p class="apple">App Store</p>
        </a>
    </footer>
</body>
</html>
