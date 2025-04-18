<%-- 
    Document   : rental_process
    Created on : Aug 9, 2024, 7:10:06 AM
    Author     : User
--%>

<%@page import="app.classes.Vehicle"%>
<%@page import="app.classes.Rental"%>
<%@page import="java.sql.Connection"%>
<%@page import="app.classes.DBconnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DBconnector db = new DBconnector();
    Connection conn = db.getConnection();
    Rental rental = new Rental();
    int customerId = Integer.parseInt(request.getParameter("customer"));
    String licensePlateNo = request.getParameter("licensePlateNo");
    String rentalStartDate = request.getParameter("rentalStartDate");
    int noOfDays = Integer.parseInt(request.getParameter("noOfDays"));
    String pickupLocation = request.getParameter("pickupLocation");
    String status = "pending";
    
    Vehicle vehicle = new Vehicle();
    vehicle = vehicle.getVehicleByLicensePlate(licensePlateNo, conn);
    double cost = vehicle.getPrice()*noOfDays;
    rental.setCustomerId(customerId);
    rental.setLicensePlateNo(licensePlateNo);
    rental.setRentalStartDate(rentalStartDate);
    rental.setNoOfDays(noOfDays);
    rental.setPickupLocation(pickupLocation);
    rental.setTotalCost(cost);
    rental.setStatus(status);

    boolean isAdded = rental.addRental(conn);
    


    if (isAdded) {
        response.sendRedirect("rentals.jsp?message=Rental added successfully!&type=success");
    } else {
        response.sendRedirect("rentals.jsp?message=Error adding rental.&type=error");
    }

%>