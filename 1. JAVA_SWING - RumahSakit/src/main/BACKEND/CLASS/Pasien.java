package BACKEND.CLASS;

import BACKEND.DBConnection;
import BACKEND.DatabaseOperations;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Pasien extends User implements DatabaseOperations {
    
    private int id = 0;
    private String nama;
    private String email;
    private String password;
    private String alamat;
    private String tglLahir;
    private String keluhan;

    private Connection conn;

    public Pasien(int id, String nama, String email, String password, String alamat, String nomorTelp, String tglLahir, String keluhan) {
        try {
            this.id = id;
            this.nama = nama;
            this.email = email;
            this.password = password;
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
    
    // Overload pasien without id
    public Pasien(String nama, String email, String password, String alamat, String nomorTelp, String tglLahir, String keluhan) {
        try {
            this.nama = nama;
            this.email = email;
            this.password = password;
            this.alamat = alamat;
            this.nomorTelp = nomorTelp;
            this.tglLahir = tglLahir;
            this.keluhan = keluhan;

            this.conn = new DBConnection().getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getID()
    {
        return this.id;
    }
    
    public String getNama() {
        return this.nama;
    }

    public String getEmail() {
        return this.email;
    }

    public String getPassword() {
        return this.password;
    }

    public String getAlamat() {
        return this.alamat;
    }

    public String getNomorTelp() {
        return this.nomorTelp;
    }

    public String getTglLahir() {
        return this.tglLahir;
    }

    public String getKeluhan() {
        return this.keluhan;
    }
    
    @Override
    public String toString() {
        return this.nama + " - " + this.alamat + " - " + this.nomorTelp + " - " + this.tglLahir + " - " + this.keluhan;
    }

    @Override
    public boolean insert() throws SQLException {
                        
        try {
            
            String query = "INSERT INTO `Pasien`(`nama_pasien`, `email`, `password`, `alamat`, `nomor_telepon`, `tanggal_lahir`, `riwayat_penyakit`) "
                    + "VALUES (?,?,?,?,?)";
            try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                preparedStatement.setString(1, this.nama);
                preparedStatement.setString(2, this.email);
                preparedStatement.setString(3, this.password);
                preparedStatement.setString(4, this.alamat);
                preparedStatement.setString(5, this.nomorTelp);
                preparedStatement.setString(6, this.tglLahir);
                preparedStatement.setString(7, this.keluhan);

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
        // ...
        return false;
    }

    @Override
    public boolean delete() throws SQLException {
        // ...
        return false;
    }

    @Override
    public void closeConnection() throws SQLException {
        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }
}
