<%-- 
    Document   : signout
    Created on : May 29, 2013, 6:59:19 PM
    Author     : X
--%>

 <% 
session.equals("false");

String redirectURL = "index.jsp";
response.sendRedirect(redirectURL);


%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
