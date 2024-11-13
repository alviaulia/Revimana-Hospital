package BACKEND;

import java.sql.SQLException;

public interface DatabaseOperations {

    // Insert data into the database
    boolean insert() throws SQLException;

    // Update data in the database
    boolean update() throws SQLException;

    // Delete data from the database
    boolean delete() throws SQLException;

    // Close the database connection
    void closeConnection() throws SQLException;
}
