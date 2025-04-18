<%@page import="app.classes.Customer"%>
<%@page import="app.classes.DBconnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%

    try {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String gender = request.getParameter("gender");
        String contactNo = request.getParameter("contactNo");
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String nic = request.getParameter("nicNo");

        Customer customer = new Customer();
        customer.setFirstName(firstName);
        customer.setLastName(lastName);
        customer.setGender(gender);
        customer.setContactNo(contactNo);
        customer.setStreet(street);
        customer.setCity(city);
        customer.setDistrict(district);
        customer.setNicNo(nic);

        boolean res = customer.addCustomer();
        if (res) {
            response.sendRedirect("customers.jsp?message=Customer added successfully!&type=success");
        } else {
            response.sendRedirect("customers.jsp?message=Error adding customer.&type=error");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("customers.jsp?message=Exception occurred: " + e.getMessage());
    }
%>
