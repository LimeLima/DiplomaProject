package com.lime.admin.hobby;

import com.lime.db.DBManager;
import com.lime.servlets.Hobby;
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

@WebServlet(name = "AddHobbyServlet", value = "/AddHobbyServlet")
public class AddHobbyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("admin/hobby/addHobby.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Hobby hobby = new Hobby(request.getParameter("title"), request.getParameter("overview"),
                Integer.parseInt(request.getParameter("admin_id")), Integer.parseInt(request.getParameter("count")),
                Integer.parseInt(request.getParameter("group_id")));

        DBManager.addHobby(hobby);
        RequestDispatcher rd = request.getRequestDispatcher("admin/hobby/hobbies.jsp");
        rd.forward(request, response);
    }
}
