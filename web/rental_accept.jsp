<%@page import="app.classes.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="app.classes.Vehicle"%>
<%@page import="app.classes.Rental"%>
<%@page import="java.sql.Connection"%>
<%@page import="app.classes.DBconnector"%>
<%
    String rentalIdStr = request.getParameter("rentalId");
    int rentalId = Integer.parseInt(rentalIdStr);

    DBconnector db = new DBconnector();
    Connection conn = null;

    try {
        conn = db.getConnection();
        Rental rental = new Rental();

        // Get the rental details from the database
        rental = rental.getRentalById(rentalId, conn);
        String licensePlateNo = rental.getLicensePlateNo();  // Retrieve the license plate number

        rental.setRentalId(rentalId);
        rental.setStatus("active");

        // Update the rental status in the database
        boolean isUpdated = rental.updateStatus(conn);

        // If rental status updated, update the vehicle status as well
        if (isUpdated) {
            Vehicle vehicle = new Vehicle();
            boolean updateStatus = vehicle.updateStatusByLicensePlate(licensePlateNo, "booked");
            
            Customer customer = new Customer();
            customer.updateStatus(rental.getCustomerId(), "pending");

            if (updateStatus) {
                response.sendRedirect("rentals.jsp?message=Rental accepted successfully&type=success");
            } else {
                response.sendRedirect("rentals.jsp?message=Rental accepted, but error updating vehicle status&type=error");
            }
        } else {
            response.sendRedirect("rentals.jsp?message=Error accepting rental&type=error");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("rentals.jsp?message=Unexpected error occurred&type=error");
    }
%>
