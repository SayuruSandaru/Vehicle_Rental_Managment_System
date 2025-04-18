<%-- 
    Document   : home_process
    Created on : Aug 9, 2024, 9:38:05 AM
    Author     : User
--%>

<%@page import="app.classes.Vehicle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="app.classes.DBconnector"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
    // Initialize variables
    int totalCustomers = 0;
    int totalVehicles = 0;
    List<String> chartData1 = new ArrayList<>();
    List<String> chartData2 = new ArrayList<>();

    // Establish database connection
    DBconnector db = new DBconnector();
    Connection conn = db.getConnection();

    Vehicle vehicle = new Vehicle();

    totalVehicles = vehicle.totalVehicle();
    request.setAttribute("totalVehicles", totalVehicles);

    request.getRequestDispatcher("dashboard.jsp").forward(request, response);

    
%>
