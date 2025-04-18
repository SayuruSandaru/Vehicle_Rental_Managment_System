<%@page import="java.sql.Connection"%>
<%@page import="app.classes.DBconnector"%>
<%@page import="app.classes.Vehicle"%>
<%@page import="app.classes.Customer"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%

    // Retrieve the customer ID and vehicle ID from the request parameters
    String customerId = request.getParameter("customerId");
    String vehicleId = request.getParameter("vehicleId");
    Connection con = DBconnector.getConnection();

    // Assuming methods to fetch customer and vehicle details by ID
    Customer customer = new Customer().getCustomerById(Integer.parseInt(customerId));
    Vehicle vehicle = new Vehicle().getVehicleById(Integer.parseInt(vehicleId), con);

%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Rental Booking</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Roboto', sans-serif;
                background-color: #f8f9fa;
                margin: 0;
                padding: 0;
            }
            .container {
                margin-top: 50px;
                max-width: 800px;
                background-color: #ffffff;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }
            .header-title {
                text-align: center;
                margin-bottom: 30px;
                font-size: 32px;
                font-weight: bold;
                color: #343a40;
            }
            .form-step {
                display: none;
            }
            .form-step.active {
                display: block;
            }
            .form-group label {
                font-weight: 500;
                color: #495057;
            }
            .form-control {
                height: calc(2.75rem + 2px);
                font-size: 16px;
                border-radius: 8px;
                border: 1px solid #ced4da;
                padding: 10px;
            }
            .form-control:focus {
                border-color: #80bdff;
                box-shadow: 0 0 8px rgba(0, 123, 255, 0.25);
            }
            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
                padding: 12px 20px;
                font-size: 18px;
                border-radius: 8px;
                transition: background-color 0.3s ease;
            }
            .btn-primary:hover {
                background-color: #0056b3;
            }
            .card {
                background-color: #f8f9fa;
                padding: 20px;
                border: 1px solid #dee2e6;
                border-radius: 10px;
                margin-bottom: 20px;
            }
            .card-title {
                font-size: 20px;
                font-weight: bold;
                color: #343a40;
            }
            .card-text {
                font-size: 16px;
                color: #6c757d;
            }
            .stepper {
                display: flex;
                justify-content: space-between;
                margin-bottom: 30px;
            }
            .stepper .step {
                width: 30%;
                text-align: center;
                position: relative;
            }
            .stepper .step::after {
                content: '';
                position: absolute;
                top: 50%;
                left: 100%;
                transform: translateX(-50%);
                width: 100%;
                height: 2px;
                background-color: #dee2e6;
            }
            .stepper .step:last-child::after {
                display: none;
            }
            .stepper .step.active .step-number,
            .stepper .step.completed .step-number {
                background-color: #007bff;
                color: white;
            }
            .stepper .step-number {
                display: inline-block;
                width: 30px;
                height: 30px;
                border-radius: 50%;
                background-color: #dee2e6;
                line-height: 30px;
                text-align: center;
                margin-bottom: 5px;
            }
            .stepper .step-title {
                font-size: 14px;
                font-weight: bold;
                color: #6c757d;
            }
            .stepper .step.active .step-title,
            .stepper .step.completed .step-title {
                color: #343a40;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header-title">Rental Booking</div>

            <!-- Stepper -->
            <div class="stepper">
                <div class="step active">
                    <div class="step-number">1</div>
                    <div class="step-title">Customer Info</div>
                </div>
                <div class="step">
                    <div class="step-number">2</div>
                    <div class="step-title">Rental Details</div>
                </div>
            </div>

            <!-- Step 1: Customer Information -->
            <div class="form-step active" id="step-1">
                <div class="card">
                    <div class="card-title">Customer Information</div>
                    <p class="card-text"><%= customer.getFirstName() + " " + customer.getLastName() %></p>
                    <p class="card-text">NIC: <%= customer.getNicNo() %></p>
                </div>

                <div class="card">
                    <div class="card-title">Vehicle Information</div>
                    <p class="card-text"><%= vehicle.getBrand() + " " + vehicle.getModel() %></p>
                    <p class="card-text">Year: <%= vehicle.getYear() %></p>
                    <p class="card-text">Price: Rs. <%= vehicle.getPrice() %> / day</p>
                </div>

                <button class="btn btn-primary btn-block" id="next-step">Next: Rental Details</button>
            </div>

            <!-- Step 2: Rental Details -->
            <div class="form-step" id="step-2">
                <form action="rental_process.jsp" method="post">
                    <input type="hidden" name="customerId" value="<%= customerId %>">
                    <input type="hidden" name="vehicleId" value="<%= vehicleId %>">

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
                    <div class="form-group">
                        <label for="totalCost">Total Cost</label>
                        <input type="number" step="0.01" class="form-control" id="totalCost" name="totalCost" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Complete Rental</button>
                </form>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script>
            $(document).ready(function() {
                // Move to next step
                $('#next-step').on('click', function() {
                    $('#step-1').removeClass('active');
                    $('#step-2').addClass('active');
                    $('.stepper .step').eq(0).addClass('completed');
                    $('.stepper .step').eq(1).addClass('active');
                });
            });
        </script>
    </body>
</html>
