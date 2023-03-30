package com.lime.servlets;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class User {
    private int id;
    private String email;
    private String nickname;
    private String password;
    private String birthday;

    public User() {
    }

    public User(int id, String email, String nickname, String password, String birthday) {
        this.id = id;
        this.email = email;
        this.nickname = nickname;
        this.password = password;
        this.birthday = birthday;
    }

    public User(String email, String nickname, String password, String birthday) {
        this.email = email;
        this.nickname = nickname;
        this.password = password;
        this.birthday = birthday;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", nickname='" + nickname + '\'' +
                ", password='" + password + '\'' +
                ", birthday='" + birthday + '\'' +
                '}';
    }

    public static ArrayList<String> validation(User user) {
        ArrayList<String> errors = new ArrayList<>();
        String regexEmail = "^(.+)@(.+)$";
        Pattern patternEmail = Pattern.compile(regexEmail);
        Matcher matcherEmail = patternEmail.matcher(user.getEmail());
        if (!matcherEmail.matches()) {
            System.out.println("error in email");
            errors.add("email");
        }
        String regexPass = "^(?=.*[0-9])"
                + "(?=.*[a-z])(?=.*[A-Z])"
                + "(?=.*[@#$%^&+.=])"
                + "(?=\\S+$).{8,20}$";
        Pattern patternPass = Pattern.compile(regexPass);
        Matcher matcherPass = patternPass.matcher(user.getPassword());
        if (!matcherPass.matches()) {
            errors.add("pass");
        }
        System.out.println("validation");
        return errors;
    }
}
