<%@page import="app.classes.Rental"%>
<%@page import="app.classes.Customer"%>
<%@page import="app.classes.Vehicle"%>
<%@page import="app.classes.DBconnector"%>
<%@page import="java.sql.Connection"%>

<%
    // Retrieve the connection and rental object from the request
    Connection conn = (Connection) request.getAttribute("conn");
    Rental rental = (Rental) request.getAttribute("rental");
    Customer customer = new Customer();
    customer = customer.getCustomerById(rental.getCustomerId());

    Vehicle vehicle = new Vehicle();
    vehicle = vehicle.getVehicleByLicensePlate(rental.getLicensePlateNo(), conn);
%>

<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="viewRentalModalLabel_<%= rental.getRentalId() %>" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Rental Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Customer Details -->
                <h5>Customer Details</h5>
                <p><strong>First Name:</strong> <%= customer.getFirstName() %></p>
                <p><strong>Last Name:</strong> <%= customer.getLastName() %></p>
                <p><strong>Contact No:</strong> <%= customer.getContactNo() %></p>
                <p><strong>City:</strong> <%= customer.getCity() %></p>
                
                <!-- Vehicle Details -->
                <h5>Vehicle Details</h5>
                <p><strong>License Plate No:</strong> <%= vehicle.getLicensePlateNo() %></p>
                <p><strong>Type:</strong> <%= vehicle.getType() %></p>
                <p><strong>Brand:</strong> <%= vehicle.getBrand() %></p>
                <p><strong>Model:</strong> <%= vehicle.getModel() %></p>
                
                <!-- Rental Details -->
                <h5>Rental Details</h5>
                <p><strong>Rental Start Date:</strong> <%= rental.getRentalStartDate() %></p>
                <p><strong>No of Days:</strong> <%= rental.getNoOfDays() %></p>
                <p><strong>Pickup Location:</strong> <%= rental.getPickupLocation() %></p>
                <p><strong>Total Cost:</strong> <%= rental.getTotalCost() %></p>
                <p><strong>Status:</strong> <%= rental.getStatus() %></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
