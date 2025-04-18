<%@page import="app.classes.Customer"%>
<%@page import="app.classes.Vehicle"%>
<%@page import="java.sql.Connection"%>
<%@page import="app.classes.DBconnector"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    request.setAttribute("currentPage", "home");
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
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }
        .dashboard-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        .dashboard-card:hover {
            transform: translateY(-5px);
        }
        .card-icon {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }
        .main-content {
            padding: 2rem;
        }
    </style>
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
            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4 main-content">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Dashboard</h1>
                </div>

                <!-- Dashboard Cards -->
                <div class="row">
                    <div class="col-md-4 mb-4">
                        <div class="card dashboard-card bg-primary bg-gradient text-white">
                            <div class="card-body text-center">
                                <i class="bi bi-people card-icon"></i>
                                <h5 class="card-title">Total Customers</h5>
                                <p class="card-text display-6">
                                    <%
                                        Customer customer = new Customer();
                                        int totalCustomer = customer.totalCustomers();
                                    %>
                                    <%=totalCustomer%>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card dashboard-card bg-success bg-gradient text-white">
                            <div class="card-body text-center">
                                <i class="bi bi-truck card-icon"></i>
                                <h5 class="card-title">Total Vehicles</h5>
                                <p class="card-text display-6">
                                    <%
                                        Vehicle vehicle = new Vehicle();
                                        int totalVehicles = vehicle.totalVehicle();
                                    %>
                                    <%=totalVehicles%>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card dashboard-card bg-danger bg-gradient text-white">
                            <div class="card-body text-center">
                                <i class="bi bi-exclamation-triangle card-icon"></i>
                                <h5 class="card-title">Blacklisted Customers</h5>
                                <p class="card-text display-6">
                                    <%
                                        int blacklistcust = customer.getBlacklistedCustomersCount();
                                    %>
                                    <%=blacklistcust%>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

          
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>