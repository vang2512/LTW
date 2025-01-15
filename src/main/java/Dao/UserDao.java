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

}
