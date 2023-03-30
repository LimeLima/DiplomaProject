package com.lime.admin.hobby;

import com.lime.db.DBManager;
import com.lime.servlets.Hobby;
import com.lime.servlets.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "UpdateHobbyServlet", value = "/UpdateHobbyServlet")
public class UpdateHobbyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Hobby hobby = DBManager.getHobbyByID(id);

        if (hobby != null) {
            request.setAttribute("hobby", hobby);
            request.getRequestDispatcher("admin/hobby/updateHobby.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Hobby hobby = new Hobby(request.getParameter("title"), request.getParameter("overview"),
                Integer.parseInt(request.getParameter("admin_id")), Integer.parseInt(request.getParameter("count")),
                Integer.parseInt(request.getParameter("group_id")));
        int id = Integer.parseInt(request.getParameter("id"));
        DBManager.updateHobby(id, hobby);

        request.getRequestDispatcher("admin/hobby/hobbies.jsp").forward(request, response);
    }
}
