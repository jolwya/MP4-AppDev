<%-- 
    Document   : 404
    Created on : 11 27, 26, 11:11:35 AM
    Author     : JIllianne
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>404 - Page Not Found</title>
    </head>
    <body style="font-family: Arial, sans-serif; text-align: center; padding: 50px;">
        <h2>404 - Page Not Found</h2>
        <p>The page or resource you requested could not be located.</p>
        <a href="${pageContext.request.contextPath}/index.jsp">Return to Home</a>
    </body>
</html>
