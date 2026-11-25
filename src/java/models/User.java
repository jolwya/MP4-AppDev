package models;

import java.io.Serializable;

public class User implements Serializable {
    private String username;
    private String fullName;
    private String role;
    private String studentNumber;

    public User() {
    }

    public User(String username, String fullName, String role, String studentNumber) {
        this.username = username;
        this.fullName = fullName;
        this.role = role;
        this.studentNumber = studentNumber;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getStudentNumber() {
        return studentNumber;
    }

    public void setStudentNumber(String studentNumber) {
        this.studentNumber = studentNumber;
    }
}
