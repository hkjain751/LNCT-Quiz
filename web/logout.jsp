<%-- 
    Document   : newjsp
    Created on : 26 Mar, 2018, 12:01:43 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.removeAttribute("username");
    
%>
<jsp:forward page="index.html"></jsp:forward>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LNCT Quiz|Logout</title>
    </head>
    <body>
    </body>
</html>
