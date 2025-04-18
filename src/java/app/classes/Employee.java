/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.classes;

import static java.lang.System.out;
import java.sql.*;
import java.util.logging.Logger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class Employee {

    private int employeeId;
    private String firstName;
    private String lastName;
    private String gender;
    private String contactNo;
    private String street;
    private String city;
    private String district;
    private String email;
    private String password;
    private String role;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Employee() {
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getContactNo() {
        return contactNo;
    }

    public String getRole() {
        return role;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public String getStreet() {
        return street;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public void setAllValues(int employeeId, String firstName, String lastName, String gender, String contactNo,
            String street, String city, String district) {
        this.employeeId = employeeId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.contactNo = contactNo;
        this.street = street;
        this.city = city;
        this.district = district;
    }

    public boolean authenticateByCredentials(Connection con, HttpSession session) {
        try {
            String query = "SELECT * FROM employee WHERE Email = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, this.email);
            ResultSet rs = pstmt.executeQuery();
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, "executed");

            if (rs.next()) {
                String db_password = rs.getString("Password");
                Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, db_password);
                Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, this.password);

                if (db_password.equals(this.password)) {
                    // Set the employee details
                    this.setEmployeeId(rs.getInt("Employee_ID"));
                    this.setFirstName(rs.getString("First_name"));
                    this.setLastName(rs.getString("Last_name"));
                    this.setGender(rs.getString("Gender"));
                    this.setContactNo(rs.getString("Contact_no"));
                    this.setStreet(rs.getString("Street"));
                    this.setCity(rs.getString("City"));
                    this.setDistrict(rs.getString("District"));
                    this.setEmail(rs.getString("Email"));
                    this.setRole(rs.getString("Role"));

                    session.setAttribute("userId", this.getEmployeeId());
                    session.setAttribute("firstName", this.getFirstName());
                    session.setAttribute("lastName", this.getLastName());
                    session.setAttribute("email", this.getEmail());
                    session.setAttribute("role", this.getRole());

                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public List<Employee> getEmployees() {
        List<Employee> employees = new ArrayList<Employee>();
        try {
            Connection con = DBconnector.getConnection();
            String query = "SELECT * FROM employee WHERE role = 'employee'";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Employee employee = new Employee();
                employee.setEmployeeId(rs.getInt("Employee_ID"));
                employee.setFirstName(rs.getString("First_name"));
                employee.setLastName(rs.getString("Last_name"));
                employee.setGender(rs.getString("Gender"));
                employee.setContactNo(rs.getString("Contact_no"));
                employee.setStreet(rs.getString("Street"));
                employee.setCity(rs.getString("City"));
                employee.setDistrict(rs.getString("District"));
                employee.setEmail(rs.getString("Email"));
                employees.add(employee);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return employees;
    }

    public boolean addEmployee() {
        try {
            Connection con = DBconnector.getConnection();
            String query = "INSERT INTO employee (First_name, Last_name, Gender, Contact_no, Street, City, District, Email, Password) VALUES (?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, this.firstName);
            pstmt.setString(2, this.lastName);
            pstmt.setString(3, this.gender);
            pstmt.setString(4, this.contactNo);
            pstmt.setString(5, this.street);
            pstmt.setString(6, this.city);
            pstmt.setString(7, this.district);
            pstmt.setString(8, this.email);
            pstmt.setString(9, this.password);
            int result = pstmt.executeUpdate();
            if (result > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

}
