package com.lime.servlets;

import com.lime.db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.DateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "AddPostServlet", value = "/AddPostServlet")
public class AddPostServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_of_hobby = Integer.parseInt(request.getParameter("param"));
        Hobby hobby = new Hobby();
        if (DBManager.getHobbyByID(id_of_hobby) != null) {
            hobby = DBManager.getHobbyByID(id_of_hobby);
            System.out.println(hobby + " add post");
            hobby.setPosts(DBManager.getPostsByHobbyID(hobby.getId()));
            for (int i = 0; i < hobby.getCount_of_posts(); i++) {
                hobby.getPosts().get(i).setComments(DBManager.getCommentsByPostID(hobby.getPosts().get(i).getId()));
            }
            request.setAttribute("thisHobby", hobby);
            request.getRequestDispatcher("jsps/addPost.jsp").forward(request, response);
        }
        else  {
            request.getRequestDispatcher("jsps/errorPage.jsp").forward(request, response);
        }
        request.getRequestDispatcher("jsps/thisHobby.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int hobby_id = Integer.parseInt(request.getParameter("hobbyID"));

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

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
        LocalDateTime now = LocalDateTime.now();
        Post post = new Post(Integer.parseInt(user), hobby_id, 0, dtf.format(now), request.getParameter("post_text"));
        DBManager.addPost(post);
        DBManager.updateCountOfPostsInHobby(hobby_id);
        request.setAttribute("thisHobby", DBManager.getHobbyByID(hobby_id));
        request.getRequestDispatcher("ThisHobbyServlet?param=" + hobby_id).forward(request, response);
    }
}
