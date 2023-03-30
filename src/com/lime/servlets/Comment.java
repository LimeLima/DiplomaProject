package com.lime.servlets;

public class Comment {
    private int id;
    private int post_id;
    private int user_id;
    private  String date_of_comment;
    private String text_of_comment;

    public Comment() {
    }

    public Comment(int id, int post_id, int user_id, String date_of_comment, String text_of_comment) {
        this.id = id;
        this.post_id = post_id;
        this.user_id = user_id;
        this.date_of_comment = date_of_comment;
        this.text_of_comment = text_of_comment;
    }

    public Comment(int post_id, int user_id, String date_of_comment, String text_of_comment) {
        this.post_id = post_id;
        this.user_id = user_id;
        this.date_of_comment = date_of_comment;
        this.text_of_comment = text_of_comment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getDate_of_comment() {
        return date_of_comment;
    }

    public void setDate_of_comment(String date_of_comment) {
        this.date_of_comment = date_of_comment;
    }

    public String getText_of_comment() {
        return text_of_comment;
    }

    public void setText_of_comment(String text_of_comment) {
        this.text_of_comment = text_of_comment;
    }
}
