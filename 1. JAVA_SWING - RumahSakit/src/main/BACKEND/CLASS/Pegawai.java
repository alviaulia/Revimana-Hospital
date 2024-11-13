package BACKEND.CLASS;

import BACKEND.DBConnection;
import BACKEND.DatabaseOperations;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Pegawai extends User implements DatabaseOperations {

    private String alamat;
    private String nomorTelp;
    private String tglLahir;
    private String keluhan;

    private Connection conn;

    public Pegawai(String nama, String alamat, String nomorTelp, String tglLahir, String keluhan) {
        try {
            this.nama = nama;
            this.alamat = alamat;
            this.nomorTelp = nomorTelp;
            this.tglLahir = tglLahir;
            this.keluhan = keluhan;

            this.conn = new DBConnection().getConnection();
        }
        catch(SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String toString() {
        return this.nama + " - " + this.alamat + " - " + this.nomorTelp + " - " + this.tglLahir + " - " + this.keluhan;
    }

    @Override
    public boolean insert() throws SQLException {
                        
        try {
            
            String query = "INSERT INTO `Pasien`(`nama_pasien`, `alamat`, `nomor_telepon`, `tanggal_lahir`, `riwayat_penyakit`) "
                    + "VALUES (?,?,?,?,?)";
            try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                preparedStatement.setString(1, this.nama);
                preparedStatement.setString(2, this.alamat);
                preparedStatement.setString(3, this.nomorTelp);
                preparedStatement.setString(4, this.tglLahir);
                preparedStatement.setString(5, this.keluhan);

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
        // Similar implementation as insert
        // ...
        return false;
    }

    @Override
    public boolean delete() throws SQLException {
        // Similar implementation as insert
        // ...
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
