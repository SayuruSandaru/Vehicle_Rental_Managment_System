<%-- 
    Document   : delete_vehicle_pr
    Created on : Aug 8, 2024, 11:25:52 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="app.classes.Vehicle"%>

<%
    // Get the vehicle ID from the request
    String vehicleIdStr = request.getParameter("vehicleId");
    
    int vehicleId = Integer.parseInt(vehicleIdStr);

    Vehicle vehicle = new Vehicle();
    vehicle.setVehicleId(vehicleId);

    try {
        if (vehicle.deleteVehicle(vehicleId)) {
            response.sendRedirect("vehicles.jsp?message=Vehicle deleted successfully!");
        } else {
            response.sendRedirect("vehicles.jsp?message=Error deleting vehicle.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("vehicles.jsp?message=Exception occurred: " + e.getMessage());
    }
%>
