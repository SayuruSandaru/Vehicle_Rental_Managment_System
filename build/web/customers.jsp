<%@page import="java.util.List"%>
<%@page import="app.classes.Customer"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    request.setAttribute("currentPage", "customers");

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
        <title>Customers</title>
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
                box-shadow: 2px 0 5px rgba(0,0,0,0.1); 
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
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <%@ include file="header.jsp" %>
            </div>
            <div class="row">
                <%@ include file="sidebar.jsp" %>
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Customers</h1>
                    </div>

                    <% 
                        String message = request.getParameter("message");
                        String type = request.getParameter("type"); // Get the type parameter

                        if (message != null && !message.isEmpty()) {
                            String alertClass = "success".equals(type) ? "alert-success" : "alert-danger";
                    %>
                    <div class="alert <%= alertClass%> alert-dismissible fade show" role="alert">
                        <%= message%>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <% } %>

                    <div class="row">
                        <div class="col-md-12 mb-4">
                            <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#addCustomerModal">Add Customer</button>
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Customer Information</h5>
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Customer ID</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>NIC No</th>
                                                <th>Contact No</th>
                                                <th>City</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Customer cust = new Customer();
                                                List<Customer> customerList = cust.getCustomers();
                                                if (customerList != null) {
                                                    for (Customer customer : customerList) {
                                            %>
                                            <tr>
                                                <td><%= customer.getCustomerId()%></td>
                                                <td><%= customer.getFirstName()%></td>
                                                <td><%= customer.getLastName()%></td>
                                                <td><%= customer.getNicNo()%></td>
                                                <td><%= customer.getContactNo()%></td>
                                                <td><%= customer.getCity()%></td>
                                                <td>
                                                    <% if ("new".equalsIgnoreCase(customer.getStatus())) { %>
                                                    <span class="badge badge-primary">New</span>
                                                    <% } else if ("blacklist".equalsIgnoreCase(customer.getStatus())) { %>
                                                    <span class="badge badge-danger">Blacklist</span>
                                                    <% } else if ("pending".equalsIgnoreCase(customer.getStatus())) { %>
                                                    <span class="badge badge-warning">Pending</span>
                                                    <% } else if ("completed".equalsIgnoreCase(customer.getStatus())) { %>
                                                    <span class="badge badge-success">Completed</span>
                                                    <% } %>
                                                </td>
                                               <td>
    <% if (!"blacklist".equalsIgnoreCase(customer.getStatus()) && !"pending".equalsIgnoreCase(customer.getStatus())) { %>
    <form action="blacklist_customer.jsp" method="post" style="display:inline;" onsubmit="confirmBlacklist(event, this);">
        <input type="hidden" name="customerId" value="<%= customer.getCustomerId()%>">
        <button type="submit" class="btn btn-danger btn-sm">Blacklist</button>
    </form>
    <% } %>
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

                    <%@ include file="add_customer_modal.jsp" %>

                </main>
            </div>
        </div>

        <!-- Confirmation Modal -->
        <div class="modal fade" id="confirmBlacklistModal" tabindex="-1" aria-labelledby="confirmBlacklistModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmBlacklistModalLabel">Confirm Blacklist</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to blacklist this customer? This action cannot be undone.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-danger" id="confirmBlacklistButton">Blacklist</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            let blacklistForm;

            function confirmBlacklist(event, form) {
                event.preventDefault(); // Prevent form from submitting
                blacklistForm = form; // Store the form reference
                $('#confirmBlacklistModal').modal('show'); // Show the confirmation modal
            }

            document.getElementById('confirmBlacklistButton').addEventListener('click', function () {
                blacklistForm.submit(); // Submit the form if confirmed
            });
        </script>
    </body>
</html>
