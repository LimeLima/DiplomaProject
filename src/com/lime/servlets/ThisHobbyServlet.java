package com.lime.servlets;

import com.lime.db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ThisHobbyServlet", value = "/ThisHobbyServlet")
public class ThisHobbyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_of_hobby = Integer.parseInt(request.getParameter("param"));
        Hobby hobby = new Hobby();
        if (DBManager.getHobbyByID(id_of_hobby) != null) {
            System.out.println("skdfhdslkjfhjkdhfkdjshfklshfeuihfeui");
            hobby = DBManager.getHobbyByID(id_of_hobby);
            System.out.println(hobby);
            hobby.setPosts(DBManager.getPostsByHobbyID(hobby.getId()));
            for (int i = 0; i < hobby.getCount_of_posts(); i++) {
                System.out.println(hobby.getPosts().get(i));
                hobby.getPosts().get(i).setComments(DBManager.getCommentsByPostID(hobby.getPosts().get(i).getId()));
            }
            request.setAttribute("thisHobby", hobby);
            request.getRequestDispatcher("jsps/thisHobby.jsp").forward(request, response);
        }
        else  {
            request.getRequestDispatcher("jsps/errorPage.jsp").forward(request, response);
        }
        request.getRequestDispatcher("jsps/thisHobby.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_of_hobby = Integer.parseInt(request.getParameter("param"));
        System.out.println("param   dfsdf " + id_of_hobby);
        Hobby hobby = new Hobby();
        if (DBManager.getHobbyByID(id_of_hobby) != null) {
            System.out.println("skdfhdslkjfhjkdhfkdjshfklshfeuihfeui");
            hobby = DBManager.getHobbyByID(id_of_hobby);
            hobby.setPosts(DBManager.getPostsByHobbyID(hobby.getId()));
            for (int i = 0; i < hobby.getCount_of_posts(); i++) {
                hobby.getPosts().get(i).setComments(DBManager.getCommentsByPostID(hobby.getPosts().get(i).getId()));
            }
            request.setAttribute("thisHobby", hobby);
            request.getRequestDispatcher("jsps/thisHobby.jsp").forward(request, response);
        }
        else  {
            request.getRequestDispatcher("jsps/errorPage.jsp").forward(request, response);
        }
    }
}
