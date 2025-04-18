<%@page import="app.classes.Employee"%>
<%@page import="app.classes.MD5"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Retrieve form data
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String gender = request.getParameter("gender");
    String contactNo = request.getParameter("contactNo");
    String street = request.getParameter("street");
    String city = request.getParameter("city");
    String district = request.getParameter("district");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // Hash the password using MD5
    String hashedPassword = MD5.getMd5(password);

    // Create an Employee object
    Employee emp = new Employee();
    emp.setFirstName(firstName);
    emp.setLastName(lastName);
    emp.setGender(gender);
    emp.setContactNo(contactNo);
    emp.setStreet(street);
    emp.setCity(city);
    emp.setDistrict(district);
    emp.setEmail(email);
    emp.setPassword(hashedPassword);

    // Add the employee to the database
    boolean res = emp.addEmployee();

    // Redirect based on the result
    if (res) {
        response.sendRedirect("employees.jsp?message=Employee added successfully&type=success");
    } else {
        response.sendRedirect("employees.jsp?message=Error adding employee&type=error");
    }
%>
