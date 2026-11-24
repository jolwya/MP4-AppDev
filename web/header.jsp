<%-- 
    Document   : header
    Created on : 11 22, 26, 9:03:38 PM
    Author     : caitlinjuliaamparo
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>
<%
    String contextPath = request.getContextPath();
    User currentUser = (User) session.getAttribute("currentUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Campus Lost &amp; Found</title>
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="<%= contextPath %>/css/global.css">
</head>
<body>

    <header class="app-header">
        <div class="header-inner">
            <div class="header-brand">
                <h1 class="header-title">Campus Lost &amp; Found</h1>
            </div>
            <div class="header-right">
                <div class="course-text">ICS2608</div>
                <div class="member-chip">
                    Amparo, Caitlin Julia &bull; Reyes, Aisha Jullienne &bull; Lorenzo, Jillianne
                </div>
            </div>
        </div>
    </header>

    <nav class="app-nav">
        <div class="nav-inner">
            <div class="nav-links">
                <a href="index.jsp">Public Feed</a>
                <a href="report-item.jsp">Report Found Item</a>
                <% if (currentUser != null) { %>
                    <% if ("ADMIN".equalsIgnoreCase(currentUser.getRole())) { %>
                        <a href="<%= contextPath %>/admin-dashboard.jsp">Security Console</a>
                    <% } else { %>
                        <a href="<%= contextPath %>/student-dashboard.jsp">My Claims</a>
                    <% } %>
                <% } %>
            </div>

            <div class="nav-actions">
                <% if (currentUser == null) { %>
                    <a href="<%= contextPath %>/login.jsp" class="btn btn-sm btn-login">Login</a>
                <% } else { %>
                    <span style="font-size: 0.82rem; font-weight: 700; color: var(--cocoa-dark); margin-right: 0.4rem;">
                        <%= currentUser.getFullName() %> (<%= currentUser.getRole() %>)
                    </span>
                    <a href="<%= contextPath %>/logout" class="btn btn-sm btn-logout">Logout</a>
                <% } %>
            </div>
        </div>
    </nav>

    <div class="page-wrapper">
        <div class="kiosk-frame">
            <main class="main-container">