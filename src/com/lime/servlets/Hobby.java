package com.lime.servlets;

import java.util.ArrayList;

public class Hobby {
    private int id;
    private String title;
    private String overview;
    private int admin_id;
    private int count_of_posts;
    private int group_id;
    private ArrayList<Post> posts;

    public Hobby() {
    }

    public Hobby(int id, String title, String overview, int admin_id, int count_of_posts, int group_id, ArrayList<Post> posts) {
        this.id = id;
        this.title = title;
        this.overview = overview;
        this.admin_id = admin_id;
        this.count_of_posts = count_of_posts;
        this.group_id = group_id;
        this.posts = posts;
    }

    public Hobby(int id, String title, String overview, int admin_id, int count_of_posts, int group_id) {
        this.id = id;
        this.title = title;
        this.overview = overview;
        this.admin_id = admin_id;
        this.count_of_posts = count_of_posts;
        this.group_id = group_id;
    }

    public Hobby(String title, String overview, int admin_id, int count_of_posts) {
        this.title = title;
        this.overview = overview;
        this.admin_id = admin_id;
        this.count_of_posts = count_of_posts;
    }

    public Hobby(String title, String overview, int admin_id, int count_of_posts, int group_id) {
        this.title = title;
        this.overview = overview;
        this.admin_id = admin_id;
        this.count_of_posts = count_of_posts;
        this.group_id = group_id;
    }

    public ArrayList<Post> getPosts() {
        return posts;
    }

    public void setPosts(ArrayList<Post> posts) {
        this.posts = posts;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public int getCount_of_posts() {
        return count_of_posts;
    }

    public void setCount_of_posts(int count_of_posts) {
        this.count_of_posts = count_of_posts;
    }

    public int getGroup_id() {
        return group_id;
    }

    public void setGroup_id(int group_id) {
        this.group_id = group_id;
    }

    @Override
    public String toString() {
        return "Hobby{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", overview='" + overview + '\'' +
                ", admin_id=" + admin_id +
                ", count_of_posts=" + count_of_posts +
                ", group_id=" + group_id +
                '}';
    }
}
