package com.lime.servlets;

public class Group {
    private int id;
    private String title;
    private int count_of_hobbies;

    public Group() {
    }

    public Group(int id, String title, int count_of_hobbies) {
        this.id = id;
        this.title = title;
        this.count_of_hobbies = count_of_hobbies;
    }

    public Group(String title, int count_of_hobbies) {
        this.title = title;
        this.count_of_hobbies = count_of_hobbies;
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

    public int getCount_of_hobbies() {
        return count_of_hobbies;
    }

    public void setCount_of_hobbies(int count_of_hobbies) {
        this.count_of_hobbies = count_of_hobbies;
    }
}
