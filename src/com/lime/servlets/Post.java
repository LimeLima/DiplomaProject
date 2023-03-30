package com.lime.servlets;

import java.util.ArrayList;

public class Post {
    private int id;
    private int author_id;
    private int hobby_id;
    private int  count_of_comments;
    private String date_of_posting;
    private String text_of_post;
    private ArrayList<Comment> comments;

    public Post(int id, int author_id, int hobby_id, int count_of_comments, String date_of_posting, String text_of_post, ArrayList<Comment> comments) {
        this.id = id;
        this.author_id = author_id;
        this.hobby_id = hobby_id;
        this.count_of_comments = count_of_comments;
        this.date_of_posting = date_of_posting;
        this.text_of_post = text_of_post;
        this.comments = comments;
    }

    public Post(int id, int author_id, int hobby_id, int count_of_comments, String date_of_posting, String text_of_post) {
        this.id = id;
        this.author_id = author_id;
        this.hobby_id = hobby_id;
        this.count_of_comments = count_of_comments;
        this.date_of_posting = date_of_posting;
        this.text_of_post = text_of_post;
    }

    public Post(int author_id, int hobby_id, int count_of_comments, String date_of_posting, String text_of_post) {
        this.author_id = author_id;
        this.hobby_id = hobby_id;
        this.count_of_comments = count_of_comments;
        this.date_of_posting = date_of_posting;
        this.text_of_post = text_of_post;
    }

    public Post() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(int author_id) {
        this.author_id = author_id;
    }

    public int getHobby_id() {
        return hobby_id;
    }

    public void setHobby_id(int hobby_id) {
        this.hobby_id = hobby_id;
    }

    public int getCount_of_comments() {
        return count_of_comments;
    }

    public void setCount_of_comments(int count_of_comments) {
        this.count_of_comments = count_of_comments;
    }

    public String getDate_of_posting() {
        return date_of_posting;
    }

    public void setDate_of_posting(String date_of_posting) {
        this.date_of_posting = date_of_posting;
    }

    public String getText_of_post() {
        return text_of_post;
    }

    public void setText_of_post(String text_of_post) {
        this.text_of_post = text_of_post;
    }

    public ArrayList<Comment> getComments() {
        return comments;
    }

    public void setComments(ArrayList<Comment> comments) {
        this.comments = comments;
    }

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", author_id=" + author_id +
                ", hobby_id=" + hobby_id +
                ", count_of_comments=" + count_of_comments +
                ", date_of_posting='" + date_of_posting + '\'' +
                ", text_of_post='" + text_of_post + '\'' +
                '}';
    }
}
