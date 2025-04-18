<%-- 
    Document   : change_vehicle_status
    Created on : Aug 9, 2024, 11:40:29 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="app.classes.Vehicle" %>

<%
    int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
    String newStatus = request.getParameter("status");

    Vehicle vehicle = new Vehicle();
    boolean updated = vehicle.updateStatus(vehicleId, newStatus);

    if (updated) {
        response.sendRedirect("vehicles.jsp?message=Status updated successfully");
    } else {
        response.sendRedirect("vehicles.jsp?message=Failed to update status&type=error");
    }
%>
