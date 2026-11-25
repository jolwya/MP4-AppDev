/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lostfound.listeners;

import com.lostfound.models.LostItem;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import javax.servlet.*;


/**
 *
 * @author JIllianne
 */
public class AppContextListener implements ServletContextListener{
    @Override
    public void contextInitialized(ServletContextEvent sce){
        ServletContext context=sce.getServletContext();
        
        context.setAttribute("visitorCounter", new AtomicInteger(0)); //visitor counter
        context.setAttribute("serverLaunchTime", new Date());//server launch date
        List<LostItem> globalItemList=new ArrayList<LostItem>();//memory
        
        //TEst SAmple
        globalItemList.add(new LostItem(
                1,
                "UST Hydro Flask",
                "Tumbler",
                "Yellow flask with stickers",
                "Main Building",
                "Locker 101",
                "REPORTED",
                new Date(),
                "student"
        ));
        
        globalItemList.add(new LostItem(
                2,
                "Scientific Calculator",
                "Electronics",
                "Casio fx-991EX Classwiz",
                "Fr. Blanco Building",
                "Locker 104",
                "CLAIMED",
                new Date(),
                "admin"
        ));
        
        context.setAttribute("globalItemList", globalItemList);
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent sce){
    }
}
