package Dao;

import java.sql.*;

public class ChiTietDatBanDao {

    // Lưu chi tiết các bàn vào đơn đặt bàn
    public void saveChiTietDatBan(int datBanId, int banId) {
        String sql = "INSERT INTO chitietdatban (datBanId, banId) VALUES (?, ?)";

        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, datBanId);
            stmt.setInt(2, banId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void deleteChiTietByDatBanId(int datBanId) {
        String sql = "DELETE FROM chitietdatban WHERE datBanId = ?";

        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, datBanId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
