<%-- 
    Document   : add_rental_modal
    Created on : Aug 9, 2024, 12:06:35 PM
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="app.classes.Vehicle"%>
<%@page import="app.classes.Customer"%>
<div class="modal fade" id="addRentalModal" tabindex="-1" role="dialog" aria-labelledby="addRentalModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addRentalModalLabel">Make a Rental</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="rental_process.jsp" method="post">
                    <!-- Customer Dropdown -->
                    <div class="form-group">
                        <label for="customer">Customer</label>
                        <select class="form-control" id="customerData" name="customer" required style="width: 100%;">
                            <option value="" disabled selected>Select a Customer</option>
                            <%
                                // Fetch customers from the database
                                List<Customer> customers = new Customer().getCustomersOnlyNewCompleted();
                                
                                // Check if customers are not null and not empty
                                if (customers != null && !customers.isEmpty()) {
                                    for (Customer customer : customers) {
                            %>
                            <option value="<%= customer.getCustomerId() %>"><%= customer.getFirstName() %> <%= customer.getLastName() %> - <%= customer.getStatus() %></option>
                            <%
                                    }
                                } else {
                            %>
                            <option value="" disabled>No Customers Available</option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                    <!-- License Plate Dropdown -->
                    <div class="form-group">
                        <label for="licensePlateNo">License Plate No</label>
                        <select class="form-control" id="licensePlateNoData" name="licensePlateNo" required style="width: 100%;">
                            <option value="" disabled selected>Select a License Plate</option>
                            <%
                                // Fetch vehicles from the database
                                List<Vehicle> vehicles = new Vehicle().getAvailabVehicles();
                                    
                                // Check if vehicles are not null and not empty
                                if (vehicles != null && !vehicles.isEmpty()) {
                                    for (Vehicle vehicle : vehicles) {
                            %>
                            <option value="<%= vehicle.getLicensePlateNo() %>"><%= vehicle.getLicensePlateNo() %> - <%= vehicle.getType() %> - <%= vehicle.getBrand() %></option>
                            <%
                                    }
                                } else {
                            %>
                            <option value="" disabled>No Vehicles Available</option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                    <!-- Other Form Fields -->
                    <div class="form-group">
                        <label for="rentalStartDate">Rental Start Date</label>
                        <input type="date" class="form-control" id="rentalStartDate" name="rentalStartDate" required>
                    </div>
                    <div class="form-group">
                        <label for="noOfDays">Number of Days</label>
                        <input type="number" class="form-control" id="noOfDays" name="noOfDays" required>
                    </div>
                    <div class="form-group">
                        <label for="pickupLocation">Pickup Location</label>
                        <input type="text" class="form-control" id="pickupLocation" name="pickupLocation" required>
                    </div>
<!--                    <div class="form-group">
                        <label for="totalCost">Total Cost</label>
                        <input type="number" step="0.01" class="form-control" id="totalCost" name="totalCost" required>
                    </div>-->
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>
