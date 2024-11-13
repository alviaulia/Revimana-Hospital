/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BACKEND;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import com.mysql.cj.jdbc.Driver;


public class DBConnection {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/db_rumahsakit";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";
    private Connection connection;
 

    public Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
        }
        return connection;
    }

    public void closeConnection() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }
}