package com.lime.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import com.lime.db.DBManager;
import com.lime.servlets.User;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "SignUpServlet", value = "/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User(request.getParameter("email"), request.getParameter("nickname"),
                request.getParameter("password"), request.getParameter("day") + " " + request.getParameter("month") + " " + request.getParameter("year"));

        ArrayList<String> errors = User.validation(user);
        System.out.println(user);
        if(errors.size() == 0) {
            DBManager.addUser(user);
            user = DBManager.getUserByEmail(user.getEmail());

            request.setAttribute("online", user);

            Cookie cookie = new Cookie("online", String.valueOf(user.getId()));
            response.addCookie(cookie);

            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        else {
            String error = "error";
            request.setAttribute("errors", errors);
            for (String str : errors) {
                if (str.equals("email")) {
                    System.out.println("gfjdhgkjdhgjkfdjkghdkfhg");
                    request.setAttribute("emailErr", error);
                    System.out.println("servlet " + request.getAttribute("emailErr"));
                }
                if (str.equals("pass")) {
                    request.setAttribute("passErr", error);
                }
                if (str.equals("phone")) {
                    request.setAttribute("phoneErr", error);
                }
            }

            RequestDispatcher rd = request.getRequestDispatcher("jsps/signup.jsp");
            rd.forward(request, response);
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
