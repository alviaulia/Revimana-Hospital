package BACKEND.CLASS;

import BACKEND.DBConnection;
import BACKEND.DatabaseOperations;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Ruangan implements DatabaseOperations {

    private String id = null;
    private String nomor_kamar;
    private String jenis;
    private String ketersediaan;

    private Connection conn;

    public Ruangan(String id, String nomor, String jenis, String ketersediaan) {
        try {
            if(id != null || id != ""){
                this.id = id;
            }
            this.nomor_kamar = nomor;
            this.jenis = jenis;
            this.ketersediaan = ketersediaan;

            this.conn = new DBConnection().getConnection();
        }
        catch(SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean insert() throws SQLException {
                        
        try {
            
            String query = "INSERT INTO `RuangPerawatan` (`nomor_kamar`, `jenis`, `ketersediaan`) "
                    + "VALUES (?,?,?)";
            try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                preparedStatement.setString(1, this.nomor_kamar);
                preparedStatement.setString(2, this.jenis);
                preparedStatement.setString(3, this.ketersediaan);

                int rowAffected = preparedStatement.executeUpdate();

                conn.close();
                return rowAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;

    }

    @Override
    public boolean update() throws SQLException {
        try {
            
            String query = "UPDATE `RuangPerawatan`SET `nomor_kamar`=?,`jenis`=?,`ketersediaan`=? WHERE `id_ruang` = ?";
            try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                preparedStatement.setString(1, this.nomor_kamar);
                preparedStatement.setString(2, this.jenis);
                preparedStatement.setString(3, this.ketersediaan);
                preparedStatement.setInt(4, Integer.parseInt(this.id));

                int rowAffected = preparedStatement.executeUpdate();

                conn.close();
                return rowAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete() throws SQLException {
        try {
            
            String query = "DELETE FROM `RuangPerawatan` WHERE `id_ruang` = ?";
            try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                preparedStatement.setInt(1, Integer.parseInt(this.id));

                int rowAffected = preparedStatement.executeUpdate();

                conn.close();
                return rowAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void closeConnection() throws SQLException {
        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }
}
