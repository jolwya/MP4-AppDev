package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String role = request.getParameter("role");

        if (username == null || username.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=empty");
            return;
        }

        username = username.trim();
        if (role == null || role.trim().isEmpty()) {
            role = "STUDENT";
        }

        User user;
        if ("ADMIN".equalsIgnoreCase(role) || "admin".equalsIgnoreCase(username)) {
            user = new User(username, "Security Officer (" + username + ")", "ADMIN", "STAFF-01");
        } else {
            user = new User(username, username, "STUDENT", "2023-0101");
        }

        HttpSession session = request.getSession(true);
        session.setAttribute("currentUser", user);

        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
}
