<%-- 
    Document   : rental_decline
    Created on : Aug 9, 2024, 11:05:49 AM
    Author     : User
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="app.classes.Rental"%>
<%@page import="java.sql.Connection"%>
<%@page import="app.classes.DBconnector"%>
<%
    String rentalIdStr = request.getParameter("rentalId");
    int rentalId = Integer.parseInt(rentalIdStr);

    DBconnector db = new DBconnector();
    Connection conn = db.getConnection();
    Rental rental = new Rental();

    rental.setRentalId(rentalId);
    rental.setStatus("declined");

    boolean isUpdated = rental.updateStatus(conn);

    if (isUpdated) {
        response.sendRedirect("rentals.jsp?message=Rental declined successfully&type=success");
    } else {
        response.sendRedirect("rentals.jsp?message=Error declining rental&type=error");
    }
%>
