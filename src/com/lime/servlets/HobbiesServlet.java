package com.lime.servlets;

import com.lime.db.DBManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "HobbiesServlet", value = "/HobbiesServlet")
public class HobbiesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Hobby> hobbies = DBManager.getHobbies();
        ArrayList<Group> groups = DBManager.getGroups();
        request.setAttribute("hobbies", hobbies);
        request.setAttribute("groups", groups);
        request.getRequestDispatcher("jsps/hobby.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
