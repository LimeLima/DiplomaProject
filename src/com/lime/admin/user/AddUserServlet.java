package com.lime.admin.user;

import com.lime.db.DBManager;
import com.lime.servlets.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AddUserServlet", value = "/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("admin/user/addUser.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User(request.getParameter("email"), request.getParameter("nickname"),
                request.getParameter("password"), request.getParameter("day") + " " +
                request.getParameter("month") + " " + request.getParameter("year"));

        ArrayList<String> errors = User.validation(user);
        System.out.println(user);
        if(errors.size() == 0) {
            DBManager.addUser(user);

            RequestDispatcher rd = request.getRequestDispatcher("admin/user/users.jsp");
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

            RequestDispatcher rd = request.getRequestDispatcher("admin/user/users.jsp");
            rd.forward(request, response);
        }
//        request.getRequestDispatcher("admin/addUser.jsp").forward(request, response);
    }
}
