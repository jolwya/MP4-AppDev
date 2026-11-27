<%-- 
    Document   : error
    Created on : 11 27, 26, 11:22:17 AM
    Author     : JIllianne
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Application Error</title>
    </head>
    <body style="font-family: Arial, sans-serif; text-align: center; padding: 50px;">
        <h2>Application Error Encountered</h2>
        <p>An unexpected error occurred. Try again later.</p>
        <a href="${pageContext.request.contextPath}/index.jsp">Return to Home</a>
    </body>
</html>
