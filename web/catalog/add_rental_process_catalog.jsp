<%@page import="app.classes.Vehicle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="app.classes.Rental"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="app.classes.DBconnector"%>

<%
    // Retrieve form parameters
    String rentalStartDate = request.getParameter("rentalStartDate");
    String noOfDaysStr = request.getParameter("noOfDays");
    String pickupLocation = request.getParameter("pickupLocation");

    // Retrieve customerId and vehicleId from session
    Integer customerId = (Integer) session.getAttribute("customerId");
    Integer vehicleIdObj = (Integer) session.getAttribute("vehicleId");

    // Check for null values
    if (customerId == null || vehicleIdObj == null) {
        response.sendRedirect("catalog.jsp?message=Customer ID or Vehicle ID is missing.&type=error");
        return; // Stop further processing
    }

    int vehicleId = vehicleIdObj;
    int noOfDays = Integer.parseInt(noOfDaysStr);

    // Initialize necessary objects
    Rental rental = new Rental();
    Vehicle vehicle = new Vehicle();
    Connection conn = null;

    // Establish database connection
    conn = DBconnector.getConnection();

    // Fetch vehicle details to calculate total cost
    vehicle = vehicle.getVehicleById(vehicleId, conn);
    double cost = vehicle.getPrice()*noOfDays;

//    // Set rental details
    rental.setRentalStartDate(rentalStartDate);
    rental.setNoOfDays(noOfDays);
    rental.setPickupLocation(pickupLocation);
    rental.setTotalCost(cost);
    rental.setCustomerId(customerId);
    rental.setLicensePlateNo(vehicle.getLicensePlateNo());

    // Add rental to the database
    boolean res = rental.addRental(conn);

    // Redirect based on the result
    if (res) {
        response.sendRedirect("catalog.jsp?s=1");
    } else {
        response.sendRedirect("catalog.jsp?s=0");
    }

%>
