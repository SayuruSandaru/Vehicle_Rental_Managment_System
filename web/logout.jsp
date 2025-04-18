<%-- 
    Document   : logout
    Created on : Aug 10, 2024, 9:32:15 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
    response.sendRedirect("index.jsp?message=You have successfully logged out&type=success");
%>
