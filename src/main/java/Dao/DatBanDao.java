package Dao;

import Model.DatBan;
import java.sql.*;
import java.util.*;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDateTime;   // Để sử dụng LocalDateTime
import java.sql.Timestamp;        // Để sử dụng Timestamp

public class DatBanDao {
    // Lưu đơn đặt bàn mới
    public void saveDatBan(DatBan datBan) {
        String sql = "INSERT INTO DatBan (soLuong, ngayDat, gioDat, khongGian, trangThai, thoiGianDat) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, datBan.getSoLuong());
            stmt.setDate(2, Date.valueOf(datBan.getNgayDat()));
            stmt.setTime(3, Time.valueOf(formatTime(datBan.getGioDat())));
            stmt.setString(4, datBan.getKhongGian());
            stmt.setString(5, datBan.getTrangThai());  // Đang chờ
            stmt.setTimestamp(6, Timestamp.valueOf(datBan.getThoiGianDat()));  // Thời gian đặt
            stmt.executeUpdate();
            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    datBan.setId(rs.getInt(1));  // Gán ID vừa được tạo
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    private String formatTime(String gioDat) {
        if (gioDat.matches("\\d{2}:\\d{2}")) {
            gioDat += ":00";  // Nếu không có giây, thêm giây
        }
        return gioDat;
    }
}
