<%@page import="java.sql.SQLException"%>
<%@page import="app.classes.Vehicle"%>
<%@page import="app.classes.Customer"%>
<%@page import="java.sql.Connection"%>
<%@page import="app.classes.DBconnector"%>
<%@page import="java.util.List"%>
<%@page import="app.classes.Rental"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    request.setAttribute("currentPage", "rentals");
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("index.jsp?message=Error in validating the user. Login again&type=error");
        return;
    } else {
        System.out.println("userIdL" + session.getAttribute("userId"));
    }
%>
<%
    // Set the current page for the active class in the sidebar
    request.setAttribute("currentPage", "rentals");

    // Check session for userId, redirect if not found
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("index.jsp?message=Error in validating the user. Login again&type=error");
        return;  // Important: return to stop further processing of the page
    } else {
        System.out.println("userIdL" + session.getAttribute("userId"));
    }

    // Database connection and operations
    Connection conn = null;
    List<Rental> rentalList = null;
    List<Customer> customerList = null;
    List<Vehicle> vehicleList = null;

    DBconnector db = new DBconnector();
    conn = db.getConnection();

    if (conn == null) {
        throw new ServletException("Database connection is null.");
    }

    // Get the list of rentals, customers, and vehicles
    Rental rentalObj = new Rental();
    rentalList = rentalObj.getRentals(conn);

    Customer customerObj = new Customer();
    customerList = customerObj.getCustomersOnlyNewCompleted();

    Vehicle vehicleObj = new Vehicle();
    vehicleList = vehicleObj.getAvailabVehicles();

%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Rentals</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet"/>
        <style>
            body {
                font-family: 'Poppins', sans-serif;
            }
            .sidebar {
                height: 100vh;
                background-color: #343a40;
                color: white;
                padding-top: 20px;
            }
            .sidebar a {
                color: white;
                text-decoration: none;
                padding: 10px;
                display: block;
            }
            .sidebar a:hover {
                background-color: #006666;
            }
            .sidebar a.active {
                background-color: #006666;
            }
            .main-content {
                padding: 20px;
            }
            .navbar-brand {
                font-size: 1.5rem;
            }
            .header {
                background-color: #343a40;
                color: white;
                padding: 10px 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .header .brand {
                font-size: 1.5rem;
                font-weight: bold;
                font-family: Arial, sans-serif;
            }
            .user-info {
                display: flex;
                align-items: center;
            }
            .user-info .bi {
                font-size: 1.5rem;
                margin-right: 10px;
            }
            .chip {
                display: inline-block;
                padding: 2px 5px 2px 5px;
                font-size: 0.875em;
                font-weight: 600;
                color: white;
                border-radius: 2px;
            }
            .chip.pending {
                background-color: #ffc107;
            }
            .chip.active {
                background-color: #28a745;
            }
            .chip.completed {
                background-color: #17a2b8;
            }
            .chip.declined {
                background-color: #dc3545;
            }
        </style>
        <!-- Include jQuery and Bootstrap JS for the modal and dropdown search -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Header -->
                <jsp:include page="header.jsp"/>
            </div>
            <div class="row">
                <jsp:include page="sidebar.jsp"/>
                <!-- Main Content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Rentals</h1>
                    </div>
                    <%                    String message = request.getParameter("message");
                        String type = request.getParameter("type"); // type can be 'success' or 'error'

                        if (message != null && !message.isEmpty()) {
                    %>
                    <div class="alert <%= "success".equals(type) ? "alert-success" : "alert-danger"%> alert-dismissible fade show" role="alert">
                        <%= message%>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <%
                        }
                    %>

                    <!-- Table for rental information -->
                    <div class="row">
                        <div class="col-md-12 mb-4">
                            <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#addRentalModal">Make a Rental</button>
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Rental Information</h5>
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Rental ID</th>
                                                <th>License Plate No</th>
                                                <th>Rental Start Date</th>
                                                <th>No of Days</th>
                                                <th>Pickup Location</th>
                                                <th>Total Cost</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                for (Rental rental : rentalList) {
                                                    // Fetch the corresponding customer and vehicle details
                                                    Customer customer = customerObj.getCustomerById(rental.getCustomerId());
                                                    Vehicle vehicle = vehicleObj.getVehicleByLicensePlate(rental.getLicensePlateNo(), conn);

                                                    if (customer == null || vehicle == null) {
                                                        continue; // Skip this rental if customer or vehicle is not found.
                                                    }
                                            %>
                                            <tr>
                                                <td><%= rental.getRentalId()%></td>
                                                <td><%= rental.getLicensePlateNo()%></td>
                                                <td><%= rental.getRentalStartDate()%></td>
                                                <td><%= rental.getNoOfDays()%></td>
                                                <td><%= rental.getPickupLocation()%></td>
                                                <td><%= rental.getTotalCost()%></td>
                                                <td><span class="chip <%= rental.getStatus().toLowerCase()%>"><%= rental.getStatus()%></span></td>
                                                <td>
                                                    <% if ("pending".equalsIgnoreCase(rental.getStatus())) {%>
                                                    <form action="rental_accept.jsp" method="post" style="display:inline;">
                                                        <input type="hidden" name="rentalId" value="<%= rental.getRentalId()%>">
                                                        <button type="submit" class="btn btn-success btn-sm">
                                                            Accept
                                                        </button>
                                                    </form>
                                                    <form action="rental_decline.jsp" method="post" style="display:inline;">
                                                        <input type="hidden" name="rentalId" value="<%= rental.getRentalId()%>">
                                                        <button type="submit" class="btn btn-danger btn-sm">
                                                            Decline
                                                        </button>
                                                    </form>
                                                    <% } else if ("active".equalsIgnoreCase(rental.getStatus())) {%>
                                                    <form action="rental_complete.jsp" method="post" style="display:inline;">
                                                        <input type="hidden" name="rentalId" value="<%= rental.getRentalId()%>">
                                                        <button type="submit" class="btn btn-primary btn-sm">
                                                            Complete
                                                        </button>
                                                    </form>
                                                    <% }%>
                                                    <!-- Adding the View button -->
                                                    <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#viewRentalModal_<%= rental.getRentalId()%>">
                                                        <i class="bi bi-eye"></i>
                                                    </button>
                                                </td>
                                            </tr>

                                            <!-- Modal for viewing rental details -->
                                            <!-- Modal for viewing rental details -->
                                        <div class="modal fade" id="viewRentalModal_<%= rental.getRentalId()%>" tabindex="-1" role="dialog" aria-labelledby="viewRentalModalLabel_<%= rental.getRentalId()%>" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="viewRentalModalLabel_<%= rental.getRentalId()%>">Rental Details</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <!-- Vehicle Details -->
                                                        <div class="card mb-3">
                                                            <div class="card-header">
                                                                <h5 class="mb-0">Vehicle Details</h5>
                                                            </div>
                                                            <div class="card-body">
                                                                <img src="<%= vehicle.getImagePath()%>" alt="Vehicle Image" class="img-fluid mb-3">
                                                                <p><strong>License Plate No:</strong> <%= vehicle.getLicensePlateNo()%></p>
                                                                <p><strong>Type:</strong> <%= vehicle.getType()%></p>
                                                                <p><strong>Brand:</strong> <%= vehicle.getBrand()%></p>
                                                                <p><strong>Model:</strong> <%= vehicle.getModel()%></p>
                                                            </div>
                                                        </div>

                                                        <!-- Customer Details -->
                                                        <div class="card mb-3">
                                                            <div class="card-header">
                                                                <h5 class="mb-0">Customer Details</h5>
                                                            </div>
                                                            <div class="card-body">
                                                                <p><strong>First Name:</strong> <%= customer.getFirstName()%></p>
                                                                <p><strong>Last Name:</strong> <%= customer.getLastName()%></p>
                                                                <p><strong>Contact No:</strong> <%= customer.getContactNo()%></p>
                                                                <p><strong>City:</strong> <%= customer.getCity()%></p>
                                                            </div>
                                                        </div>

                                                        <!-- Rental Details -->
                                                        <div class="card">
                                                            <div class="card-header">
                                                                <h5 class="mb-0">Rental Details</h5>
                                                            </div>
                                                            <div class="card-body">
                                                                <p><strong>Rental Start Date:</strong> <%= rental.getRentalStartDate()%></p>
                                                                <p><strong>No of Days:</strong> <%= rental.getNoOfDays()%></p>
                                                                <p><strong>Pickup Location:</strong> <%= rental.getPickupLocation()%></p>
                                                                <p><strong>Total Cost:</strong> <%= rental.getTotalCost()%></p>
                                                                <p><strong>Status:</strong> <%= rental.getStatus()%></p>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <%
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- Include the add rental modal -->
                        <%@ include file="add_rental_modal.jsp" %>
                    </div>
                </main>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                // Initialize Select2 for the customer dropdown
                $('#customer').select2({
                    placeholder: 'Select a customer',
                    allowClear: true
                });

                // Initialize Select2 for the license plate dropdown
                $('#licensePlateNo').select2({
                    placeholder: 'Select a license plate',
                    allowClear: true
                });
            });
        </script>
    </body>
</html>

