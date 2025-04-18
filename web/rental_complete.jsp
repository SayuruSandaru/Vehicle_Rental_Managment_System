<%@page import="app.classes.Customer"%>
<%@page import="app.classes.Vehicle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        rental.setStatus("completed");

        // Update the rental status in the database
        boolean isUpdated = rental.updateStatus(conn);

        // If rental status updated, update the vehicle status as well
        if (isUpdated) {
            Vehicle vehicle = new Vehicle();
            boolean updateVehicleStatus = vehicle.updateStatusByLicensePlate(licensePlateNo, "available");

            Customer customer = new Customer();
            boolean updateCustomerStatus = customer.updateStatus(rental.getCustomerId(), "completed");

            if (updateVehicleStatus && updateCustomerStatus) {
                response.sendRedirect("rentals.jsp?message=Rental completed successfully&type=success");
            } else {
                response.sendRedirect("rentals.jsp?message=Rental completed, but error updating vehicle or customer status&type=error");
            }
        } else {
            response.sendRedirect("rentals.jsp?message=Error completing rental&type=error");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("rentals.jsp?message=Unexpected error occurred&type=error");
    }
%>
