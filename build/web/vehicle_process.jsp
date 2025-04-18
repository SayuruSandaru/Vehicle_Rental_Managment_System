<%@ page import="app.classes.Vehicle"%>
<%@ page import="java.io.*, java.nio.file.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Get form parameters
    String vehicleType = request.getParameter("vehicleType");
    String brand = request.getParameter("brand");
    String model = request.getParameter("model");
    String yearStr = request.getParameter("year");
    String licensePlateNo = request.getParameter("licensePlateNo");
    String imageFileName = request.getParameter("imageFileName");
    String priceStr = request.getParameter("price");

    if (yearStr == null || yearStr.isEmpty()) {
        response.sendRedirect("vehicles.jsp?message=Year cannot be null or empty.");
        return;
    }

    if (priceStr == null || priceStr.isEmpty()) {
        response.sendRedirect("vehicles.jsp?message=Price cannot be null or empty.");
        return;
    }

    int year = 0;
    int price = 0;
    
    try {
        year = Integer.parseInt(yearStr);
        price = Integer.parseInt(priceStr);
    } catch (NumberFormatException e) {
        response.sendRedirect("vehicles.jsp?message=Invalid number format for year or price.");
        return;
    }

    Vehicle vehicle = new Vehicle();
    vehicle.setType(vehicleType);
    vehicle.setBrand(brand);
    vehicle.setModel(model);
    vehicle.setYear(year);
    vehicle.setLicensePlateNo(licensePlateNo);
    vehicle.setImagePath(imageFileName);
    vehicle.setPrice(price);
    vehicle.setStatus("available");

    try {
        if (vehicle.addVehicle()) {
            response.sendRedirect("vehicles.jsp?message=Vehicle added successfully!");
        } else {
            response.sendRedirect("vehicles.jsp?message=Error adding vehicle.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("vehicles.jsp?message=Exception occurred: " + e.getMessage());
    }
%>
