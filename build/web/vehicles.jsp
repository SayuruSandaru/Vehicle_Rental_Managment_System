<%@page import="java.util.List"%>
<%@page import="app.classes.Vehicle"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    request.setAttribute("currentPage", "vehicles");

    if (session.getAttribute("userId") == null) {
        response.sendRedirect("index.jsp?message=Error in validating the user. Login again&type=error");
    } else {
        System.out.println("userIdL" + session.getAttribute("userId"));
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Vehicles</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
        <style>
            body {
                font-family: 'Poppins', sans-serif;
            }
            .sidebar {
                height: 100vh;
                background-color: #343a40;
                color: white;
                padding-top: 20px;
                box-shadow: 2px 0 5px rgba(0,0,0,0.1); /* Adding shadow */
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
        </style>
        <!-- Include jQuery and Bootstrap JS for the modal -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            function showVehicleDetails(vehicleId, type, brand, model, year, licensePlateNo, imageFileName, price) {
                // Populate the modal with vehicle details
                document.getElementById('vehicleTypeModal').textContent = type;
                document.getElementById('vehicleBrandModal').textContent = brand;
                document.getElementById('vehicleModelModal').textContent = model;
                document.getElementById('vehicleYearModal').textContent = year;
                document.getElementById('vehicleLicensePlateNoModal').textContent = licensePlateNo;
                document.getElementById('vehicleImageModal').src = imageFileName;
                document.getElementById('priceModal').textContent = "Price per day: Rs. " + price;

                // Show the modal
                $('#viewVehicleModal').modal('show');
            }
        </script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Header -->
                <jsp:include page="header.jsp"/>
            </div>
            <div class="row">
                <!-- Sidebar -->
                <jsp:include page="sidebar.jsp"/>

                <!-- Main Content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Vehicles</h1>
                    </div>

                    <%
                        String message = request.getParameter("message");
                        if (message != null && !message.isEmpty()) {
                    %>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <%= message%>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <%
                        }
                    %>
                    <div class="row">
                        <div class="col-md-12 mb-4">
                            <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#addVehicleModal">Add Vehicle</button>
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Available Vehicles</h5>
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Type</th>
                                                <th>Brand</th>
                                                <th>Model</th>
                                                <th>Year</th>
                                                <th>License Plate No</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Vehicle vehicleObj = new Vehicle();
                                                List<Vehicle> vehicleList = vehicleObj.getVehicles();
                                                if (vehicleList != null) {
                                                    for (Vehicle vehicle : vehicleList) {
                                            %>
                                            <tr>
                                                <td><%= vehicle.getType()%></td>
                                                <td><%= vehicle.getBrand()%></td>
                                                <td><%= vehicle.getModel()%></td>
                                                <td><%= vehicle.getYear()%></td>
                                                <td><%= vehicle.getLicensePlateNo()%></td>
                                                <td>
                                                    <!-- Display vehicle status -->
                                                    <%
                                                        String status = vehicle.getStatus();
                                                        if ("available".equalsIgnoreCase(status)) {
                                                    %>
                                                    <span class="badge badge-success">Available</span>
                                                    <%
                                                    } else if ("unavailable".equalsIgnoreCase(status)) {
                                                    %>
                                                    <span class="badge badge-danger">Unavailable</span>
                                                    <%
                                                    } else if ("booked".equalsIgnoreCase(status)) {
                                                    %>
                                                    <span class="badge badge-warning">Booked</span>
                                                    <%
                                                        }
                                                    %>
                                                </td>
                                                <td>
                                                    <!-- View Button with Icon -->
                                                    <button type="button" class="btn btn-info btn-sm"
                                                            onclick="showVehicleDetails('<%= vehicle.getVehicleId()%>', '<%= vehicle.getType()%>', '<%= vehicle.getBrand()%>', '<%= vehicle.getModel()%>', '<%= vehicle.getYear()%>', '<%= vehicle.getLicensePlateNo()%>', '<%= vehicle.getImagePath()%>', '<%= vehicle.getPrice()%>')">
                                                        <i class="bi bi-eye"></i>
                                                    </button>

                                                    <!-- Delete Button with Icon (only show if status is not "booked") -->
                                                    <% if (!"booked".equalsIgnoreCase(vehicle.getStatus())) {%>
                                                    <form action="delete_vehicle_pr.jsp" method="post" style="display:inline;">
                                                        <input type="hidden" name="vehicleId" value="<%= vehicle.getVehicleId()%>">
                                                        <button type="submit" class="btn btn-danger btn-sm">
                                                            <i class="bi bi-trash"></i>
                                                        </button>
                                                    </form>
                                                    <% }%>

                                                    <!-- Status Change Button with Icon -->
                                                    <form action="change_vehicle_status.jsp" method="post" style="display:inline;">
                                                        <input type="hidden" name="vehicleId" value="<%= vehicle.getVehicleId()%>">
                                                        <%

                                                            if ("available".equalsIgnoreCase(status)) {
                                                        %>
                                                        <input type="hidden" name="status" value="unavailable">
                                                        <button type="submit" class="btn btn-warning btn-sm">
                                                            Unavailable
                                                        </button>
                                                        <%
                                                        } else if ("unavailable".equalsIgnoreCase(status)) {
                                                        %>
                                                        <input type="hidden" name="status" value="available">
                                                        <button type="submit" class="btn btn-success btn-sm">
                                                            Available
                                                        </button>
                                                        <%
                                                            }
                                                            // Don't show the Available/Unavailable button if status is 'booked'
                                                        %>
                                                    </form>
                                                </td>

                                            </tr>

                                            <%
                                                    }
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal for adding a new vehicle -->
                    <div class="modal fade" id="addVehicleModal" tabindex="-1" role="dialog" aria-labelledby="addVehicleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addVehicleModalLabel">Add New Vehicle</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="vehicle_process.jsp" method="POST">
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="vehicleType">Vehicle Type</label>
                                                <select class="form-control" id="vehicleType" name="vehicleType" required>
                                                    <option value="">Select a type</option>
                                                    <option value="Sedan">Car</option>
                                                    <option value="SUV">SUV</option>
                                                    <option value="Truck">Van</option>
                                                    <option value="Coupe">TukTuk</option>
                                                    <option value="Convertible">Motorbikes</option>
                                                    <option value="Van">Scooters</option>
                                                    <option value="Electric">Buses</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="brand">Brand</label>
                                                <select class="form-control" id="brand" name="brand" required>
                                                    <option value="">Select a brand</option>
                                                    <option value="Toyota">Toyota</option>
                                                    <option value="Honda">Honda</option>
                                                    <option value="Ford">Ford</option>
                                                    <option value="BMW">BMW</option>
                                                    <option value="Tesla">Tesla</option>
                                                    <option value="Nissan">Nissan</option>
                                                    <option value="Chevrolet">Bajaj</option>
                                                    <option value="Piaggio">Piaggio</option>
                                                    <option value="Yamaha">Yamaha</option>
                                                    <option value="Suzuki">Suzuki</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="model">Model</label>
                                                <input type="text" class="form-control" id="model" name="model" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="year">Year</label>
                                                <input type="number" class="form-control" id="year" name="year" required>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="licensePlateNo">License Plate No</label>
                                                <input type="text" class="form-control" id="licensePlateNo" name="licensePlateNo" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="imageFileName">Image URL</label>
                                                <input type="text" class="form-control" id="imageFileName" name="imageFileName" required>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="price">Price per day</label>
                                                <input type="text" class="form-control" id="price" name="price" required>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Add Vehicle</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal for viewing vehicle details -->
                    <div class="modal fade" id="viewVehicleModal" tabindex="-1" role="dialog" aria-labelledby="viewVehicleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="viewVehicleModalLabel">Vehicle Details</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <!-- Image at the top -->
                                    <div class="text-center mb-4">
                                        <img id="vehicleImageModal" src="" alt="Vehicle Image" class="img-fluid"/>
                                    </div>

                                    <!-- Vehicle details in two columns -->
                                    <div class="row">
                                        <!-- Left column -->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="vehicleTypeModal"><strong>Vehicle Type:</strong></label>
                                                <p id="vehicleTypeModal"></p>
                                            </div>
                                            <div class="form-group">
                                                <label for="vehicleModelModal"><strong>Model:</strong></label>
                                                <p id="vehicleModelModal"></p>
                                            </div>
                                            <div class="form-group">
                                                <label for="vehicleLicensePlateNoModal"><strong>License Plate No:</strong></label>
                                                <p id="vehicleLicensePlateNoModal"></p>
                                            </div>
                                            <div class="form-group">
                                                <label for="priceModal"><strong>Price per day:</strong></label>
                                                <p id="priceModal"></p>
                                            </div>
                                        </div>

                                        <!-- Right column -->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="vehicleBrandModal"><strong>Brand:</strong></label>
                                                <p id="vehicleBrandModal"></p>
                                            </div>
                                            <div class="form-group">
                                                <label for="vehicleYearModal"><strong>Year:</strong></label>
                                                <p id="vehicleYearModal"></p>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
