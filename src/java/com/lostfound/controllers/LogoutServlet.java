/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lostfound.controllers;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author JIllianne
 */
public class LogoutServlet extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session=request.getSession(false);
        if(session!=null){
            session.removeAttribute("currentUser");
            session.removeAttribute("userRole");
            session.invalidate();//fetch current sessions
        }
        
        response.setHeader("Cache-control", "no-cache, no store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);//prevent from back, not forward&backward
        
        response.sendRedirect(request.getContextPath()+"/login.jsp?logout=true");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doGet(request, response);
    }
}
