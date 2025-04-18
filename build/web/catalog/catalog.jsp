<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="app.classes.Vehicle"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Car Rental Catalogue | Rent Easy</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .header-logo {
                font-family: 'Pacifico', cursive;
                color: #007bff;
            }
            .header-nav a {
                margin: 0 15px;
                color: #333;
                text-decoration: none;
            }
            .header-nav a:hover {
                color: #007bff;
                text-decoration: underline;
            }
            .catalog-title {
                margin-bottom: 30px;
                color: #007bff;
            }
            .car-card {
                transition: transform 0.2s ease;
            }
            .car-card:hover {
                transform: scale(1.05);
            }
            .car-title {
                font-weight: bold;
                color: #333;
            }
            .car-info {
                color: #6c757d;
            }
            .car-price {
                font-size: 1.2rem;
                font-weight: bold;
                color: #28a745;
            }
            .make-request {
                background-color: #007bff;
                color: #fff;
                padding: 10px;
                text-decoration: none;
                display: block;
                border-radius: 0 0 0.25rem 0.25rem;
                transition: background-color 0.2s ease;
            }
            .make-request:hover {
                background-color: #0056b3;
            }
            .footer {
                padding: 20px 0;
                background-color: #f8f9fa;
                text-align: center;
                margin-top: 30px;
                color: #6c757d;
            }
            .footer a {
                color: #007bff;
                text-decoration: none;
            }
            .footer a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <!-- Header Section -->
        <jsp:include page="header.jsp" />

        <!-- Main Content Section -->
        <div class="container mt-5">
            <h1 class="catalog-title text-center">Explore Our Car Rentals</h1>
            
            <% 
                String status = request.getParameter("s");

                if (status != null) {
                    String alertType = "";
                    String message = "";
                    if ("1".equals(status)) {
                        alertType = "success";
                        message = "Successfully added your request!";
                    } else if ("0".equals(status)) {
                        alertType = "danger";
                        message = "There was an error processing your request.";
                    }
            %>
                <div class="alert alert-<%= alertType %> alert-dismissible fade show" role="alert">
                    <%= message %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% 
                }
            %>
            
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <%
                    // Get the list of vehicles from the database
                    Vehicle vehicleObj = new Vehicle();
                    List<Vehicle> vehicleList = vehicleObj.getAvailabVehicles();

                    // Loop through the list of vehicles and generate the HTML for each vehicle
                    for (Vehicle vehicle : vehicleList) {
                %>
                <div class="col">
                    <div class="card car-card shadow-sm h-100">
                        <img src="<%= vehicle.getImagePath()%>" alt="<%= vehicle.getModel()%>" class="car-image card-img-top" style="width: 100%; height: 200px; object-fit: cover;">
                        <div class="card-body car-details">
                            <h5 class="car-title"><%= vehicle.getModel()%></h5>
                            <p class="car-info">Brand: <%= vehicle.getBrand()%> | Year: <%= vehicle.getYear()%></p>
                            <p class="car-price">Price: Rs. <%= vehicle.getPrice()%>/day</p>
                        </div>
                        <div class="card-footer p-0">
                            <%
                                session.setAttribute("vehicleId", vehicle.getVehicleId());
                            %>
                            <a href="add_customer.jsp" class="make-request text-center">Make Request</a>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>

        <!-- Footer Section -->
       <jsp:include page="footer.jsp" />

        <!-- Bootstrap 5 JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    </body>
</html>
