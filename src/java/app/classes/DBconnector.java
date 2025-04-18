package app.classes;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBconnector {
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/vehicle_rental_managment_system";
    private static final String DBUSER = "root";
    private static final String DBPW = "";

 public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName(DRIVER);
            con = DriverManager.getConnection(URL, DBUSER, DBPW);
            if(con == null){
                out.println("Connection is not available");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBconnector.class.getName()).log(Level.SEVERE, null, ex);
        }

        return con;
    }
}
