/*
     * To change this license header, choose License Headers in Project Properties.
     * To change this template file, choose Tools | Templates
     * and open the template in the editor.
 */
package app.classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class Customer {

    private int customerId;
    private String firstName;
    private String lastName;
    private String gender;
    private String contactNo;
    private String street;
    private String city;
    private String district;
    private String proofDocument;
    private String status;
    private String nicNo;

    public String getNicNo() {
        return nicNo;
    }

    public void setNicNo(String nicNo) {
        this.nicNo = nicNo;
    }

    public Customer() {
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public void setProofDocument(String proofDocument) {
        this.proofDocument = proofDocument;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setNic(String nic) {
        this.nicNo = nic;
    }

    public boolean addCustomer() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBconnector.getConnection();

            // Check if the NIC already exists
            String checkSql = "SELECT COUNT(*) FROM customer WHERE NIC_no = ?";
            stmt = conn.prepareStatement(checkSql);
            stmt.setString(1, this.nicNo);
            rs = stmt.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                // NIC already exists, return false
                return false;
            }

            // Insert the new customer if NIC does not exist
            String sql = "INSERT INTO customer (First_name, Last_name, Gender, Contact_no, NIC_no, Street, City, District) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS); // Request generated keys
            stmt.setString(1, this.firstName);
            stmt.setString(2, this.lastName);
            stmt.setString(3, this.gender);
            stmt.setString(4, this.contactNo);
            stmt.setString(5, this.nicNo); // Set the NIC no
            stmt.setString(6, this.street);
            stmt.setString(7, this.city);
            stmt.setString(8, this.district);

            int rows = stmt.executeUpdate();

            if (rows > 0) {
                rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    this.customerId = rs.getInt(1); 
                }
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public List<Customer> getCustomers() {
        List<Customer> customers = new ArrayList<>();
        try {
            String sql = "SELECT * FROM customer";
            Connection conn = DBconnector.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setCustomerId(rs.getInt("Customer_id"));
                customer.setFirstName(rs.getString("First_name"));
                customer.setLastName(rs.getString("Last_name"));
                customer.setGender(rs.getString("Gender"));
                customer.setContactNo(rs.getString("Contact_no"));
                customer.setNicNo(rs.getString("NIC_no"));
                customer.setStreet(rs.getString("Street"));
                customer.setCity(rs.getString("City"));
                customer.setDistrict(rs.getString("District"));
                customer.setStatus(rs.getString("Status"));
                customers.add(customer);
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }

    public boolean updateStatus(int customerId, String status) {
        try {
            Connection conn = DBconnector.getConnection();
            String sql = "UPDATE customer SET Status = ? WHERE Customer_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, status);
            stmt.setInt(2, customerId);
            int rows = stmt.executeUpdate();
            if (rows > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public int totalCustomers() {
        int total = 0;
        try {
            Connection conn = DBconnector.getConnection();
            String sql = "SELECT COUNT(*) FROM customer";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public List<Customer> getCustomersOnlyNewCompleted() {
        List<Customer> customers = new ArrayList<>();
        try {
            String sql = "SELECT * FROM customer WHERE Status = 'new' OR Status = 'completed'";

            Connection conn = DBconnector.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Customer customer = new Customer();
                customer.setCustomerId(rs.getInt("Customer_id"));
                customer.setFirstName(rs.getString("First_name"));
                customer.setLastName(rs.getString("Last_name"));
                customer.setGender(rs.getString("Gender"));
                customer.setContactNo(rs.getString("Contact_no"));
                customer.setStreet(rs.getString("Street"));
                customer.setCity(rs.getString("City"));
                customer.setDistrict(rs.getString("District"));
                customer.setStatus(rs.getString("Status"));
                customers.add(customer);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    public Customer getCustomerById(int customerId) {
        Customer customer = null;
        try (Connection conn = DBconnector.getConnection()) {
            String sql = "SELECT * FROM customer WHERE Customer_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, customerId);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        customer = new Customer();
                        customer.setCustomerId(rs.getInt("Customer_id"));
                        customer.setFirstName(rs.getString("First_name"));
                        customer.setLastName(rs.getString("Last_name"));
                        customer.setGender(rs.getString("Gender"));
                        customer.setContactNo(rs.getString("Contact_no"));
                        customer.setStreet(rs.getString("Street"));
                        customer.setCity(rs.getString("City"));
                        customer.setDistrict(rs.getString("District"));
                        customer.setNic(rs.getString("NIC_no")); 
                        customer.setStatus(rs.getString("Status"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    public int getCustomerId() {
        return customerId;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getGender() {
        return gender;
    }

    public String getContactNo() {
        return contactNo;
    }

    public String getStreet() {
        return street;
    }

    public String getCity() {
        return city;
    }

    public String getDistrict() {
        return district;
    }

    public String getProofDocument() {
        return proofDocument;
    }

    public String getStatus() {
        return status;
    }

    public String getNic() {
        return nicNo;
    }

    public int getBlacklistedCustomersCount() {
        int count = 0;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBconnector.getConnection();
            String sql = "SELECT COUNT(*) FROM customer WHERE Status = 'blacklist'";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return count;
    }

}
