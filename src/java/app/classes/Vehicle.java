package app.classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Vehicle {
    private int vehicleId;
    private String type;
    private String brand;
    private String model;
    private int year;
    private String licensePlateNo;
    private String imagePath;
    private String status;
    private double price;

    // Getters and Setters
    public int getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getLicensePlateNo() {
        return licensePlateNo;
    }

    public void setLicensePlateNo(String licensePlateNo) {
        this.licensePlateNo = licensePlateNo;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // Add Vehicle method
    public boolean addVehicle() {
        try {
            DBconnector dbConnector = new DBconnector();
            Connection conn = dbConnector.getConnection();

            String sql = "INSERT INTO vehicle (Type, Brand, Model, Year, License_plate_no, Image, Status, rental_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, type);
            stmt.setString(2, brand);
            stmt.setString(3, model);
            stmt.setInt(4, year);
            stmt.setString(5, licensePlateNo);
            stmt.setString(6, imagePath);
            stmt.setString(7, status);
            stmt.setDouble(8, price);
            
            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException ex) {
            Logger.getLogger(Vehicle.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    // Get all vehicles
    public List<Vehicle> getVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        try {
            DBconnector dbConnector = new DBconnector();
            Connection conn = dbConnector.getConnection();

            String sql = "SELECT * FROM vehicle";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Vehicle vehicle = new Vehicle();
                vehicle.setVehicleId(rs.getInt("Vehicle_id"));
                vehicle.setType(rs.getString("Type"));
                vehicle.setBrand(rs.getString("Brand"));
                vehicle.setModel(rs.getString("Model"));
                vehicle.setYear(rs.getInt("Year"));
                vehicle.setLicensePlateNo(rs.getString("License_plate_no"));
                vehicle.setImagePath(rs.getString("Image"));
                vehicle.setStatus(rs.getString("Status"));
                vehicle.setPrice(rs.getDouble("rental_price"));
                vehicles.add(vehicle);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Vehicle.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vehicles;
    }

    // Get available vehicles
    public List<Vehicle> getAvailabVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        try {
            DBconnector dbConnector = new DBconnector();
            Connection conn = dbConnector.getConnection();

            String sql = "SELECT * FROM vehicle WHERE Status = 'available'";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Vehicle vehicle = new Vehicle();
                vehicle.setVehicleId(rs.getInt("Vehicle_id"));
                vehicle.setType(rs.getString("Type"));
                vehicle.setBrand(rs.getString("Brand"));
                vehicle.setModel(rs.getString("Model"));
                vehicle.setYear(rs.getInt("Year"));
                vehicle.setLicensePlateNo(rs.getString("License_plate_no"));
                vehicle.setImagePath(rs.getString("Image"));
                vehicle.setStatus(rs.getString("Status"));
                vehicle.setPrice(rs.getDouble("rental_price"));
                vehicles.add(vehicle);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Vehicle.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vehicles;
    }

    // Update vehicle status by Vehicle ID
    public boolean updateStatus(int vehicleId, String newStatus) {
        try {
            DBconnector dbConnector = new DBconnector();
            Connection conn = dbConnector.getConnection();

            String sql = "UPDATE vehicle SET Status = ? WHERE Vehicle_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, newStatus);
            stmt.setInt(2, vehicleId);

            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException ex) {
            Logger.getLogger(Vehicle.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    // Update vehicle status by License Plate
    public boolean updateStatusByLicensePlate(String licensePlateNo, String newStatus) {
        try {
            DBconnector dbConnector = new DBconnector();
            Connection conn = dbConnector.getConnection();

            String sql = "UPDATE vehicle SET Status = ? WHERE License_plate_no = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, newStatus);
            stmt.setString(2, licensePlateNo);

            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException ex) {
            Logger.getLogger(Vehicle.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    // Get a vehicle by ID
    public Vehicle getVehicleById(int vehicleId, Connection conn) {
        String query = "SELECT * FROM vehicle WHERE vehicle_id = ?";
        Vehicle vehicle = null;

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, vehicleId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    vehicle = new Vehicle();
                    vehicle.setVehicleId(rs.getInt("vehicle_id"));
                    vehicle.setType(rs.getString("type"));
                    vehicle.setBrand(rs.getString("brand"));
                    vehicle.setModel(rs.getString("model"));
                    vehicle.setYear(rs.getInt("year"));
                    vehicle.setLicensePlateNo(rs.getString("license_plate_no"));
                    vehicle.setImagePath(rs.getString("image"));
                    vehicle.setStatus(rs.getString("status"));
                    vehicle.setPrice(rs.getDouble("rental_price"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vehicle;
    }

    // Get a vehicle by License Plate
    public Vehicle getVehicleByLicensePlate(String licensePlateNo, Connection conn) {
        String query = "SELECT * FROM vehicle WHERE license_plate_no = ?";
        Vehicle vehicle = null;

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, licensePlateNo);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    vehicle = new Vehicle();
                    vehicle.setVehicleId(rs.getInt("vehicle_id"));
                    vehicle.setType(rs.getString("type"));
                    vehicle.setBrand(rs.getString("brand"));
                    vehicle.setModel(rs.getString("model"));
                    vehicle.setYear(rs.getInt("year"));
                    vehicle.setLicensePlateNo(rs.getString("license_plate_no"));
                    vehicle.setImagePath(rs.getString("image"));
                    vehicle.setStatus(rs.getString("status"));
                    vehicle.setPrice(rs.getDouble("rental_price"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vehicle;
    }

    // Get the total number of vehicles
    public int totalVehicle() {
        int total = 0;
        try {
            DBconnector dbConnector = new DBconnector();
            Connection conn = dbConnector.getConnection();

            String sql = "SELECT COUNT(*) FROM vehicle";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Vehicle.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    // Delete a vehicle by ID
    public boolean deleteVehicle(int vehicleId) {
        try {
            DBconnector dbConnector = new DBconnector();
            Connection conn = dbConnector.getConnection();

            String sql = "DELETE FROM vehicle WHERE Vehicle_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, vehicleId);

            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException ex) {
            Logger.getLogger(Vehicle.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
