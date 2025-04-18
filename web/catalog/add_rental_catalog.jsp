<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="app.classes.Vehicle"%>
<%@page import="app.classes.Customer"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Rental Information</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 50px;
            margin-bottom: 50px;
        }
        .form-box {
            width: 100%;
            max-width: 600px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
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
        .footer {
            padding: 20px 0;
            background-color: #f8f9fa;
            text-align: center;
            color: #6c757d;
            margin-top: 30px;
        }
        .footer a {
            color: #007bff;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
        .stepper-wrapper {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }
        .stepper-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            flex: 1;
            position: relative;
        }
        .stepper-item:not(:last-child):after {
            content: '';
            position: absolute;
            width: 100%;
            height: 4px;
            background-color: #e9ecef;
            top: 50%;
            left: 50%;
            transform: translateX(-50%);
            z-index: 0;
        }
        .stepper-item.completed .step-counter {
            background-color: #007bff;
            color: #fff;
        }
        .step-counter {
            position: relative;
            z-index: 1;
            width: 40px;
            height: 40px;
            background-color: #e9ecef;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            font-weight: bold;
            color: #495057;
        }
        .step-name {
            margin-top: 10px;
            color: #495057;
            font-size: 14px;
            font-weight: 500;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp" />
        <div class="stepper-wrapper mt-4">
            <div class="stepper-item completed">
                <div class="step-counter">2</div>
                <div class="step-name">Rental Information</div>
            </div>
        </div>

<div class="container form-container">
    <div class="form-box">
        <div class="header-title text-center mb-4">Submit Rental Information</div>

        <form action="add_rental_process_catalog.jsp" method="post">

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

            <div class="d-flex justify-content-end mt-4">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp" />

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
