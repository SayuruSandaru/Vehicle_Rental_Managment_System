<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="app.classes.DBconnector"%>
<%@page import="java.util.List"%>
<%@page import="app.classes.Employee"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    System.out.println("User is this: " + session.getAttribute("role"));
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("index.jsp?message=Error in validating the user. Login again&type=error");
    } else {
        String role = (String) session.getAttribute("role");
        System.out.println("Role is that: " + role);
        if ("employee".equals(role)) {  // Use .equals for string comparison
            System.out.println("USER ID");
            response.sendRedirect("index.jsp?message=Error in validating the user. Login again&type=error");
        }
    }
%>
<%
    Employee employeeObj = new Employee();
    List<Employee> employeeList = employeeObj.getEmployees();

%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Employees</title>
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
                        <h1 class="h2">Employees</h1>
                    </div>

                    <!-- Display success or error message -->
                    <%                    String message = request.getParameter("message");
                        String type = request.getParameter("type");
                        if (message != null && type
                                != null) {
                    %>
                    <div class="alert alert-<%= type%> alert-dismissible fade show" role="alert">
                        <%= message%>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <%
                        }
                    %>


                    <!-- Table for employee information -->
                    <div class="row">
                        <div class="col-md-12 mb-4">
                            <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#addEmployeeModal">Add Employee</button>
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Employee Information</h5>
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Employee ID</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Gender</th>
                                                <th>Contact No</th>
                                                <th>Street</th>
                                                <th>City</th>
                                                <th>District</th>
                                                <th>Email</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                for (Employee employee : employeeList) {
                                            %>
                                            <tr>
                                                <td><%= employee.getEmployeeId()%></td>
                                                <td><%= employee.getFirstName()%></td>
                                                <td><%= employee.getLastName()%></td>
                                                <td><%= employee.getGender()%></td>
                                                <td><%= employee.getContactNo()%></td>
                                                <td><%= employee.getStreet()%></td>
                                                <td><%= employee.getCity()%></td>
                                                <td><%= employee.getDistrict()%></td>
                                                <td><%= employee.getEmail()%></td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- Include the add employee modal -->
                        <div class="modal fade" id="addEmployeeModal" tabindex="-1" role="dialog" aria-labelledby="addEmployeeModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addEmployeeModalLabel">Add New Employee</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form method="post" action="process_employee.jsp">
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label for="firstName">First Name</label>
                                                    <input type="text" class="form-control" id="firstName" name="firstName" required>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="lastName">Last Name</label>
                                                    <input type="text" class="form-control" id="lastName" name="lastName" required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="gender">Gender</label>
                                                <select class="form-control" id="gender" name="gender" required>
                                                    <option value="" selected disabled>Choose...</option>
                                                    <option value="M">Male</option>
                                                    <option value="F">Female</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="contactNo">Contact Number</label>
                                                <input type="text" class="form-control" id="contactNo" name="contactNo" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="street">Street Address</label>
                                                <input type="text" class="form-control" id="street" name="street" required>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label for="city">City</label>
                                                    <input type="text" class="form-control" id="city" name="city" required>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="district">District</label>
                                                    <input type="text" class="form-control" id="district" name="district" required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="email">Email</label>
                                                <input type="email" class="form-control" id="email" name="email" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="password">Password</label>
                                                <input type="password" class="form-control" id="password" name="password" required>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Add Employee</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </main>
            </div>
        </div>
    </body>
</html>
