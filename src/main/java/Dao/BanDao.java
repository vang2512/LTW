package Dao;

import Model.Ban;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class BanDao {
    // Lấy tất cả các bàn
    public List<Ban> getAllBan() {
        List<Ban> bans = new ArrayList<>();
        String sql = "SELECT * FROM tables";
        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Ban ban = new Ban(rs.getInt("id"),rs.getString("tenBan"), rs.getInt("soLuong"), rs.getString("khongGian"));
                bans.add(ban);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bans;
    }
    public void insertBan(Ban ban) throws SQLException {
        String sql = "INSERT INTO tables (tenBan, soLuong, khongGian) VALUES (?, ?, ?)";
        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, ban.getTenBan());
            stmt.setInt(2, ban.getSoLuong());
            stmt.setString(3, ban.getKhongGian());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }
}
