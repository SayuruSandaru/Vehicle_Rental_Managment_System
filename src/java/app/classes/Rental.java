/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class Rental {
    private int rentalId;
    private int customerId;
    private String licensePlateNo;
    private String rentalStartDate;
    private int noOfDays;
    private String pickupLocation;
    private double totalCost;
    private String status;

    public Rental() {
    }

    public int getRentalId() {
        return rentalId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public String getLicensePlateNo() {
        return licensePlateNo;
    }

    public String getRentalStartDate() {
        return rentalStartDate;
    }

    public int getNoOfDays() {
        return noOfDays;
    }

    public String getPickupLocation() {
        return pickupLocation;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public String getStatus() {
        return status;
    }

    public void setRentalId(int rentalId) {
        this.rentalId = rentalId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public void setLicensePlateNo(String licensePlateNo) {
        this.licensePlateNo = licensePlateNo;
    }

    public void setRentalStartDate(String rentalStartDate) {
        this.rentalStartDate = rentalStartDate;
    }

    public void setNoOfDays(int noOfDays) {
        this.noOfDays = noOfDays;
    }

    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public boolean addRental(Connection conn) {
        String query = "INSERT INTO rental (customer_id, license_plate_no, rental_start_date, no_of_days, pickup_location, total_cost) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, customerId);
            ps.setString(2, licensePlateNo);
            ps.setString(3, rentalStartDate);
            ps.setInt(4, noOfDays);
            ps.setString(5, pickupLocation);
            ps.setDouble(6, totalCost);

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateStatus(Connection conn) {
        String query = "UPDATE rental SET status = ? WHERE rental_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, rentalId);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Rental> getRentals(Connection conn) {
        List<Rental> rentals = new ArrayList<>();
        String query = "SELECT * FROM rental";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Rental rental = new Rental();
                rental.setRentalId(rs.getInt("rental_id"));
                rental.setCustomerId(rs.getInt("customer_id"));
                rental.setLicensePlateNo(rs.getString("license_plate_no"));
                rental.setRentalStartDate(rs.getString("rental_start_date"));
                rental.setNoOfDays(rs.getInt("no_of_days"));
                rental.setPickupLocation(rs.getString("pickup_location"));
                rental.setTotalCost(rs.getDouble("total_cost"));
                rental.setStatus(rs.getString("status"));
                rentals.add(rental);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentals;
    }

    public Rental getRentalById(int rentalId, Connection conn) {
        String query = "SELECT * FROM rental WHERE rental_id = ?";
        Rental rental = null;

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, rentalId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    rental = new Rental();
                    rental.setRentalId(rs.getInt("rental_id"));
                    rental.setCustomerId(rs.getInt("customer_id"));
                    rental.setLicensePlateNo(rs.getString("license_plate_no"));
                    rental.setRentalStartDate(rs.getString("rental_start_date"));
                    rental.setNoOfDays(rs.getInt("no_of_days"));
                    rental.setPickupLocation(rs.getString("pickup_location"));
                    rental.setTotalCost(rs.getDouble("total_cost"));
                    rental.setStatus(rs.getString("status"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rental;
    }
}
