package BACKEND.CLASS;

import BACKEND.DBConnection;
import BACKEND.DatabaseOperations;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ObatAlat implements DatabaseOperations {

    private String id = null;
    private String nama;
    private String jenis;
    private int jumlah;

    private Connection conn;

    public ObatAlat(String id, String nama, String jenis, int jumlah) {
        try {
            if(id != null || id != ""){
                this.id = id;
            }
            this.nama = nama;
            this.jenis = jenis;
            this.jumlah = jumlah;

            this.conn = new DBConnection().getConnection();
        }
        catch(SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean insert() throws SQLException {
                        
        try {
            
            String query = "INSERT INTO `ObatDanAlatMedis`(`nama_obat`, `jenis`, `jumlah`) "
                    + "VALUES (?,?,?)";
            try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                preparedStatement.setString(1, this.nama);
                preparedStatement.setString(2, this.jenis);
                preparedStatement.setInt(3, this.jumlah);

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
            
            String query = "UPDATE `ObatDanAlatMedis`SET `nama_obat`=?,`jenis`=?,`jumlah`=? WHERE `id_obat` = ?";
            try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                preparedStatement.setString(1, this.nama);
                preparedStatement.setString(2, this.jenis);
                preparedStatement.setInt(3, this.jumlah);
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
            
            String query = "DELETE FROM `ObatDanAlatMedis` WHERE `id_obat` = ?";
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

    // Getters and Setters for other attributes
}
