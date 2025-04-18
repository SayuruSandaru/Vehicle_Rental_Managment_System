<%@page import="app.classes.Customer"%>
<%@page import="app.classes.DBconnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    try {
        // Retrieve form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String gender = request.getParameter("gender");
        String contactNo = request.getParameter("contactNo");
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String nic = request.getParameter("nicNo");

        // Retrieve vehicleId from session
        Integer vehicleIdObj = (Integer) session.getAttribute("vehicleId");
        System.out.println("Vehicle ID:"+vehicleIdObj);
        if (vehicleIdObj == null) {
            // Redirect to an error page if vehicleId is missing
            response.sendRedirect("catalog.jsp?message=Vehicle ID is missing.&type=error");
            return; // Stop further processing
        }
        int vehicleId = vehicleIdObj;

        // Create and populate customer object
        Customer customer = new Customer();
        customer.setFirstName(firstName);
        customer.setLastName(lastName);
        customer.setGender(gender);
        customer.setContactNo(contactNo);
        customer.setStreet(street);
        customer.setCity(city);
        customer.setDistrict(district);
        customer.setNicNo(nic);

        // Add customer to the database
        boolean res = customer.addCustomer();
        if (res) {
            // Retrieve the customerId after adding the customer
            int customerId = customer.getCustomerId();
            session.setAttribute("customerId", customerId);
            response.sendRedirect("add_rental_catalog.jsp");
        } else {
            // Handle the error case
            response.sendRedirect("catalog.jsp?message=Error adding customer.&type=error&vehicleId=" + vehicleId);
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("catalog.jsp?message=Exception occurred: " + e.getMessage() + "&vehicleId=" + session.getAttribute("vehicleId"));
    }
%>
