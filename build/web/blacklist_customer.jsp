<%-- 
    Document   : blacklist_customer
    Created on : Aug 9, 2024, 7:59:01 AM
    Author     : User
--%>

<%@page import="app.classes.Customer"%>
<%@page import="java.sql.Connection"%>
<%@page import="app.classes.DBconnector"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Get the customer ID from the request parameter
    int customerId = Integer.parseInt(request.getParameter("customerId"));

    // Create an instance of the Customer class
    Customer customer = new Customer();
    customer.setCustomerId(customerId);

    customer.setStatus("blacklist");
    Connection con  = DBconnector.getConnection();

    boolean isUpdated = customer.updateStatus(customerId, "blacklist");

    if (isUpdated) {
        response.sendRedirect("customers.jsp?message=Customer blacklisted successfully!&type=success");
    } else {
        response.sendRedirect("customers.jsp?message=Error blacklisting customer.&type=error");
    }
%>
