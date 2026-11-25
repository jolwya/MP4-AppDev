<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Campus Lost &amp; Found - Sign In</title>
    <link rel="stylesheet" href="<%= contextPath %>/css/style.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="auth-page">

    <div class="auth-box">
        <div class="auth-header">
            <h1 class="auth-title">Campus Lost &amp; Found</h1>
            <p class="auth-subtitle">Custody &amp; Property Retrieval Center</p>
        </div>

        <div class="auth-meta">
            <div class="course-text">ICS2608</div>
            <div class="member-chip">
                Amparo, Caitlin Julia &bull; Reyes, Aisha Jullienne &bull; Lorenzo, Jillianne
            </div>
        </div>

        <% if ("empty".equals(request.getParameter("error"))) { %>
            <div class="alert alert-danger">
                Please enter your ID number or username.
            </div>
        <% } %>

        <% if ("true".equals(request.getParameter("loggedout"))) { %>
            <div class="alert alert-success">
                You have successfully signed out of the custody kiosk.
            </div>
        <% } %>

        <form action="<%= contextPath %>/login" method="POST">
            <div class="form-group">
                <label for="username">Student ID / Personnel Username *</label>
                <input type="text" id="username" name="username" class="form-control" placeholder="e.g., 2023-0101 or admin" required autofocus>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="Enter password (optional for demo)">
            </div>

            <div class="form-group">
                <label for="role">Access Role</label>
                <select id="role" name="role" class="form-control">
                    <option value="STUDENT">Student / Campus Claimant</option>
                    <option value="ADMIN">Campus Security / Desk Admin</option>
                </select>
            </div>

            <div style="margin-top: 1.35rem; margin-bottom: 1.15rem;">
                <button type="submit" class="btn btn-success btn-block">Sign In to Kiosk &rarr;</button>
            </div>

            <div style="text-align: center; border-top: 1px solid var(--border-light); padding-top: 1rem;">
                <a href="<%= contextPath %>/index.jsp" style="color: var(--cocoa-muted); font-size: 0.84rem; font-weight: 700; text-decoration: none;">
                    Continue to Public Feed as Guest &rarr;
                </a>
            </div>
        </form>
    </div>

</body>
</html>
