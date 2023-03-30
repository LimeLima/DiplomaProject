package com.lime.db;

import com.lime.servlets.*;

import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    static Connection connection;
    static PreparedStatement preparedStatement;
    static ResultSet resultSet;

    public static void db() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hobhub",
                    "root", "qwerty");
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    static public void addUser(User user) {
        db();
        System.out.println("db add");
        try {
            preparedStatement = connection.prepareStatement(
                    "" + "INSERT INTO users(id, nickname, email, password, date_of_birth) " +
                            "VALUES(NULL, ?, ?, ?, ?)");
            preparedStatement.setString(1, user.getNickname());
            preparedStatement.setString(2, user.getNickname());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getBirthday());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    static public ArrayList<User> getUsers() {
        db();
        ArrayList<User> users = new ArrayList<>();
        try {
            PreparedStatement getStatement = connection.prepareStatement("SELECT * FROM users");
            resultSet = getStatement.executeQuery();
            while (resultSet.next()) {
                users.add(new User(resultSet.getInt("id"), resultSet.getString("email"),
                        resultSet.getString("nickname"), resultSet.getString("password"),
                        resultSet.getString("date_of_birth")));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return users;
    }

    static public User getUserByID(int id) {
        User user = new User();
        for (User u : getUsers()) {
            if (u.getId() == id) user = u;
        }
        return user;
    }

    static public User getUserByEmail(String email) {
        User user = new User();
        for (User u : getUsers()) {
            if (u.getEmail().equals(email)) user = u;
        }
        return user;
    }

    static public void updateUser(int id, User user) {
        db();
        try {
            preparedStatement = connection.prepareStatement("UPDATE users SET nickname = ?," +
                    "email = ?, password = ?, date_of_birth = ? WHERE id = ?");
            preparedStatement.setString(1, user.getNickname());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getBirthday());
            preparedStatement.setInt(5, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    static public void deleteUser(int id) {
        db();
        try {
            preparedStatement = connection.prepareStatement("DELETE FROM users WHERE id = ?");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    static public void addHobby(Hobby hobby) {
        db();
        try {
            preparedStatement = connection.prepareStatement(
                    "INSERT INTO hobbies(id, title, overview, admin_id, count_of_posts)" +
                    "VALUES(NULL, ?, ?, ?, ?)");
            preparedStatement.setString(1, hobby.getTitle());
            preparedStatement.setString(2, hobby.getOverview());
            preparedStatement.setInt(3, hobby.getAdmin_id());
            preparedStatement.setInt(4, hobby.getCount_of_posts());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        }
        catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    static public ArrayList<Hobby> getHobbies () {
        db();
        ArrayList<Hobby> hobbies = new ArrayList<>();
        try {
            PreparedStatement getStatement = connection.prepareStatement("SELECT * FROM hobbies");
            resultSet = getStatement.executeQuery();
            while (resultSet.next()) {
                hobbies.add(new Hobby(resultSet.getInt("id"), resultSet.getString("title"),
                        resultSet.getString("overview"), resultSet.getInt("admin_id"),
                        resultSet.getInt("count_of_posts"), resultSet.getInt("group_id"),
                        new ArrayList<>()));
            }
        }
        catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return hobbies;
    }

    static public Hobby getHobbyByID(int id) {
        ArrayList<Hobby> hobbies = getHobbies();
        for(Hobby h : hobbies) {
            if (h.getId() == id){
                return h;
            }
        }
        return null;
    }

    static public void updateCountOfPostsInHobby (int id) {
        db();

        Hobby hobby = getHobbyByID(id);
        int count = hobby.getCount_of_posts() + 1;
            try {
                    preparedStatement = connection.prepareStatement("UPDATE hobbies SET title = ?, overview = ?, " +
                            "admin_id = ?, count_of_posts = ?, group_id = ? WHERE id = ?");
                    preparedStatement.setString(1, hobby.getTitle());
                preparedStatement.setString(2, "");
                preparedStatement.setInt(3, 1);
                preparedStatement.setInt(4, count);
                preparedStatement.setInt(5, hobby.getGroup_id());
                    preparedStatement.setInt(6, id);
                preparedStatement.executeUpdate();
                preparedStatement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

    }

    static public void updateHobby(int id, Hobby hobby) {
        db();
        try {
            preparedStatement = connection.prepareStatement("UPDATE hobbies SET title = ?," +
                    "overview = ?, admin_id = ?, count_of_posts = ?, group_id = ? WHERE id = ?");
            preparedStatement.setString(1, hobby.getTitle());
            preparedStatement.setString(2, hobby.getOverview());
            preparedStatement.setInt(3, hobby.getAdmin_id());
            preparedStatement.setInt(4, hobby.getCount_of_posts());
            preparedStatement.setInt(5, hobby.getGroup_id());
            preparedStatement.setInt(6, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    static public void deleteHobby(int id) {
        db();
        try {
            preparedStatement = connection.prepareStatement("DELETE FROM hobbies WHERE id = ?");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    static public ArrayList<Post> getPosts() {
        db();
        ArrayList<Post> posts = new ArrayList<>();
        try {
            PreparedStatement getStatement = connection.prepareStatement("SELECT * FROM posts");
            resultSet = getStatement.executeQuery();
            while (resultSet.next()) {
                posts.add(new Post(resultSet.getInt("id"), resultSet.getInt("author_id"),
                        resultSet.getInt("hobby_id"), resultSet.getInt("count_of_comments"),
                        resultSet.getString("date_of_posting"), resultSet.getString("text_of_post"),
                        new ArrayList<>()));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return posts;
    }

    static public ArrayList<Post> getPostsByHobbyID (int id) {
        ArrayList<Post> posts = new ArrayList<>();
        for (Post p : getPosts()) {
            if (p.getHobby_id() == id) posts.add(p);
        }
        return posts;
    }

    static public Post getPostById(int id) {
        Post post = new Post();
        for (Post p : getPosts()) {
            if (p.getId() == id) post = p;
        }
        return post;
    }

    static public void addPost(Post post) {
        db();
        try {
            preparedStatement = connection.prepareStatement(
                    "" + "INSERT INTO posts(id, author_id, hobby_id, count_of_comments, " +
                            "date_of_posting, text_of_post) VALUES(NULL, ?, ?, ?, ?, ?)");
            preparedStatement.setInt(1, post.getAuthor_id());
            preparedStatement.setInt(2, post.getHobby_id());
            preparedStatement.setInt(3, 0);
            preparedStatement.setString(4, post.getDate_of_posting());
            preparedStatement.setString(5, post.getText_of_post());
            preparedStatement.executeUpdate();
            preparedStatement.close();
            System.out.println("Post saved!");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    static public void deletePost (int id) {
        db();
        try  {
            preparedStatement = connection.prepareStatement("DELETE FROM posts WHERE id = ?");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    static public ArrayList<Comment> getComments() {
        db();
        ArrayList<Comment> comments = new ArrayList<>();
        try {
            PreparedStatement getStatement = connection.prepareStatement("SELECT * FROM comments");
            resultSet = getStatement.executeQuery();
            while (resultSet.next()) {
                comments.add(new Comment(resultSet.getInt("id"), resultSet.getInt("post_id"),
                        resultSet.getInt("user_id"), resultSet.getString("date_of_comment"),
                        resultSet.getString("text_of_comment")));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return comments;
    }

    static public ArrayList<Comment> getCommentsByPostID(int id) {
        ArrayList<Comment> comments = new ArrayList<>();
        for (Comment c : getComments()) {
            if (c.getPost_id() == id) comments.add(c);
        }
        return comments;
    }

    static public void deleteComment (int id) {
        db();
        try {
            preparedStatement = connection.prepareStatement("DELETE FROM comments WHERE id = ?");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    static public ArrayList<Group> getGroups() {
        db();
        ArrayList<Group> groups = new ArrayList<>();
        try {
            PreparedStatement getStatement = connection.prepareStatement("SELECT * FROM groups");
            resultSet = getStatement.executeQuery();
            while (resultSet.next()) {
                groups.add(new Group(resultSet.getInt("id"),
                        resultSet.getString("title"), resultSet.getInt("count_of_hobbies")));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return groups;
    }

    static public Group getGroupByID(int id) {
        Group group = new Group();
        for (Group g : getGroups()) {
            if (g.getId() == id) group = g;
        }
        return group;
    }
}
