package Dao;

import java.sql.*;

public class ChiTietDatBanDao {

    // Lưu chi tiết các bàn vào đơn đặt bàn
    public void saveChiTietDatBan(int datBanId, int banId) {
        String sql = "INSERT INTO chitietdatban (datBanId, banId, trangThai) VALUES (?, ?, ?)";

        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, datBanId);
            stmt.setInt(2, banId);
            stmt.setString(3, "Đang chờ");
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
