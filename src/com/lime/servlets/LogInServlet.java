package com.lime.servlets;

import com.lime.db.DBManager;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import com.lime.servlets.User;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "LogInServlet", value = "/LogInServlet")
public class LogInServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<User> users = DBManager.getUsers();
        System.out.println("sa;dlsal;dksalkd");
        User user = new User(request.getParameter("email"), request.getParameter("password"));
        System.out.println(user.getEmail() + " " + user.getPassword());

        for (User u : users) {
            if (u.getEmail().equals(user.getEmail()) || u.getNickname().equals(user.getEmail())) {
                if(u.getPassword().equals(user.getPassword())) {

                    request.setAttribute("online", u);

                    System.out.println("loginservlet " + u.getId());

                    Cookie cookie = new Cookie("online", String.valueOf(u.getId()));
                    response.addCookie(cookie);

                    if (u.getId() == 6) {
                        System.out.println("admin");
                        request.getRequestDispatcher("admin/user/users.jsp").forward(request, response);
                    }
                    else {
                        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                        rd.forward(request, response);
                    }
                }
            }
        }
        request.getRequestDispatcher("jsps/login.jsp").forward(request, response);
    }
}
