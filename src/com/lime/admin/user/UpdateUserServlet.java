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

@WebServlet(name = "UpdateUserServlet", value = "/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = DBManager.getUserByID(id);

        if (user != null) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("admin/user/updateUser.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User(request.getParameter("email"), request.getParameter("nickname"),
                request.getParameter("password"), request.getParameter("day") + " " +
                request.getParameter("month") + " " + request.getParameter("year"));
        int id = Integer.parseInt(request.getParameter("id"));
        DBManager.updateUser(id, user);

        request.getRequestDispatcher("admin/user/users.jsp").forward(request, response);
    }
}
