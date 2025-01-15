package Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Model.User;

public class UserDao {
    // Lấy tất cả người dùng từ cơ sở dữ liệu
    public List<User> getAllUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (Connection conn = DbConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                User user = new User(
                        rs.getInt("id"),
                        rs.getString("hoten"),
                        rs.getString("diachi"),
                        rs.getString("sodt"),
                        rs.getString("email"),
                        rs.getTimestamp("ngaydk")
                );
                users.add(user);
            }
        }
        return users;
    }
    public void insertUser(User user) throws SQLException {
        String sql = "INSERT INTO users (hoten, diachi, sodt, email, ngaydk) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getHoten());
            stmt.setString(2, user.getDiachi());
            stmt.setString(3, user.getSodt());
            stmt.setString(4, user.getEmail());
            stmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            stmt.executeUpdate();
        }
    }
    public int checkLogin(String emailOrPhone, String password) {
        int role = -1;
        try (Connection connection = DbConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(
                     "SELECT role FROM users WHERE (email = ? OR sodt = ?) AND passWord = ?")) {
            ps.setString(1, emailOrPhone);
            ps.setString(2, emailOrPhone);
            ps.setString(3, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                role = rs.getInt("role");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return role;
    }

}
