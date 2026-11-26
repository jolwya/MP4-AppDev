/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lostfound.controllers;

import com.lostfound.models.User;
import java.io.IOException;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author JIllianne
 */
public class LoginServlet extends HttpServlet{
    
    private String adminUser;
    private String adminPass;
    private String studentUser;
    private String studentPass;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        String username=request.getParameter("username");
        String password=request.getParameter("password");//reads login creds
        
        String adminUser=getInitParameter("adminUser");
        String adminPass=getInitParameter("adminPass");
        String studentUser=getInitParameter("studentUser");
        String studentPass=getInitParameter("studentPass");//reads configed
        
        AtomicInteger counter=(AtomicInteger) getServletContext().getAttribute("cisitorCounter");
        if(counter!=null){
            counter.incrementAndGet();
        }//++visitorCounter
        
        User loggedUser=null;
        
        if(username!=null && password!=null){
            if(username.equals(adminUser) && password.equals(adminPass)){
                loggedUser=new User("admin", adminPass, "ADMIN", "Administrator");
            }
            else if(username.equals(studentUser) && password.equals(studentPass)){
                loggedUser=new User("student", studentPass, "STUDENT", "Student User");
            }
        }//validates creds
        
        if(loggedUser!=null){
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", loggedUser);
            session.setAttribute("userRole", loggedUser.getRole());
            
            if("ADMIN".equals(loggedUser.getRole())){
                response.sendRedirect(request.getContextPath()+ "/admin-dashboard.jsp");
            }
            else{
                response.sendRedirect(request.getContextPath()+ "/student-dashboard.jsp");
            }
        }
        else{
            response.sendRedirect(request.getContextPath()+ "/login.jsp?error=invalid");
        }
    }
        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    } 
}
