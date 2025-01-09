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
                Ban ban = new Ban(rs.getInt("id"), rs.getInt("soLuong"), rs.getString("trangThai"), rs.getString("khongGian"));
                bans.add(ban);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bans;
    }

}
