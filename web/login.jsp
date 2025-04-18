<%-- 
    Document   : login.jsp
    Created on : Jul 27, 2024, 2:47:17 PM
    Author     : User
--%>

<%@page import="app.classes.MD5"%>
<%@page import="java.sql.Connection"%>
<%@ page import="app.classes.DBconnector" %>
<%@ page import="app.classes.Employee" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%! Employee user = new Employee(); %>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    boolean isAuthenticated = false;
    if (email != null && password != null) {
        String hashedPassword = MD5.getMd5(password);
        user.setEmail(email);
        user.setPassword(hashedPassword);
        Connection con  = DBconnector.getConnection();
        if (user.authenticateByCredentials(con, session)) {
            isAuthenticated = true;
            // Debug prints
            out.println("Debug: Authentication successful.");
            if (isAuthenticated) {
                response.sendRedirect("home.jsp");
            } else {
                response.sendRedirect("index.jsp?message=Failed to login&type=error");
            }
        } else {
            response.sendRedirect("index.jsp?message=Invalid credentials&type=error");
        }
    } else {
        response.sendRedirect("index.jsp?message=Please enter both email and password&type=error");
    }
%>
