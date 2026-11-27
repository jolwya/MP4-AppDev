/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lostfound.controllers;

import com.lostfound.models.LostItem;
import com.lostfound.models.User;
import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author JIllianne
 */
public class ItemServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session=request.getSession(false);
        if(session==null || session.getAttribute("currentUser")==null){
            response.sendRedirect(request.getContextPath()+"/login.jsp");
            return;
        }//checks active sesh
        
        User currentUser=(User) session.getAttribute("currentUser");
        String action=request.getParameter("action");
        
        List<LostItem> globalItemList=(List<LostItem>) getServletContext().getAttribute("globalItemList");//retrieve app-scope list
        
        if("add".equalsIgnoreCase(action)){
            String title=request.getParameter("title");
            String category=request.getParameter("category");
            String description=request.getParameter("description");
            String locationFound=request.getParameter("locationFound");
            String locker=request.getParameter("locker");
            
            if(locker==null || locker.trim().isEmpty()){
                locker=getInitParameter("defaultLocker");
                if(locker==null){
                    locker="Locker 101";
                }
            }//if locker is blank
            
            int nextId=1;
            if(globalItemList!=null && !globalItemList.isEmpty()){
                nextId=globalItemList.get(globalItemList.size()- 1).getId()+ 1;
            }//seq id
            
            LostItem newItem=new LostItem(
                    nextId,
                    title,
                    category,
                    description,
                    locationFound,
                    locker,
                    "REPORTED",
                    new Date(),
                    currentUser.getUsername()
            );
            
            if("ADMIN".equals(currentUser.getRole())){
                response.sendRedirect(request.getContextPath()+"/admin-dashboard.jsp?status=added");
            }
            else{
                response.sendRedirect(request.getContextPath()+"/student-dashboard.jsp?status=added");
            }
        }
        else if("claim".equalsIgnoreCase(action)){
            if("ADMIN".equals(currentUser.getRole())){
                String idParam=request.getParameter("itemId");
                if(idParam!=null && globalItemList!=null){
                    int itemId=Integer.parseInt(idParam);
                    for(LostItem item: globalItemList){
                        if(item.getId()==itemId){
                            item.setStatus("CLAIMED");
                            item.setDateClaimed(new Date());
                            break;
                        }
                    }
                }//admin claim
                response.sendRedirect(request.getContextPath()+"/admin-dashboard.jsp?status=claimed");
            }
            else{
                response.sendRedirect(request.getContextPath()+"/student-dashboard.jsp?error=unauthorized");
            }
        }
        else{
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session=request.getSession(false);
        if(session!=null && session.getAttribute("currentUser")!=null){
            User user=(User) session.getAttribute("currentUser");
            if("ADMIN".equals(user.getRole())){
                response.sendRedirect(request.getContextPath()+"/admin-dashboard.jsp");
                return;
            }
            else{
                response.sendRedirect(request.getContextPath()+"/student-dashboard.jsp");
                return;
            }
        }
        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }
}
