<%-- 
    Document   : footer
    Created on : 11 22, 26, 9:03:43 PM
    Author     : caitlinjuliaamparo
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>

            </main>
        </div>
    </div>

    <footer class="app-footer">
        <div class="footer-identifier">
            ICS2608 MACHINE PROBLEM 4 (MP4)
        </div>
        <div class="footer-date">
            Context Initialized (Listener): 
            <span>${applicationScope.appDate != null ? applicationScope.appDate : "Active Session"}</span>
            &nbsp;•&nbsp;
            Live Server Time: 
            <span><%= new SimpleDateFormat("MMMM dd, yyyy - hh:mm:ss a").format(new Date()) %></span>
        </div>
    </footer>

</body>
</html>