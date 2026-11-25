/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lostfound.models;

import java.io.Serializable;

/**
 *
 * @author JIllianne
 */
public class User implements Serializable{
    private static final long serialVersionUID=1L;
    private String username;
    private String password;
    private String role;
    private String fullName;
    
    public User(){
    }
    
    public User(String username, String password, String role, String fullName){
        this.username=username;
        this.password=password;
        this.role=role;
        this.fullName=fullName;
    }
    
    public String getUsername(){
        return username;
    }
    
    public void setUsername(String username){
        this.username=username;
    }
    
    public String getPassword(){
        return password;
    }
    
    public void setPassword(String password){
        this.password=password;
    }
    
    public String getRole(){
        return role;
    }
    
    public void setRole(String role){
        this.role=role;
    }
    
    public String getFullName(){
        return fullName;
    }
    
    public void setFullName(String fullName){
        this.fullName=fullName;
    }
}
