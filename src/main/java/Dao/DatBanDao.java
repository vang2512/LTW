package Dao;

import Model.DatBan;
import java.sql.*;
import java.util.*;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDateTime;
import java.sql.Timestamp;

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
    public List<DatBan> getAllDatBan() {
        List<DatBan> datBans = new ArrayList<>();
        String sql = "SELECT * FROM datban";
        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Timestamp timestamp = rs.getTimestamp("thoiGianDat");
                LocalDateTime thoiGianDat = timestamp != null ? timestamp.toLocalDateTime() : null;
                DatBan datBan = new DatBan(
                        rs.getInt("id"),
                        rs.getInt("soLuong"),
                        rs.getString("ngayDat"),
                        rs.getString("gioDat"),
                        rs.getString("khongGian"),
                        rs.getString("trangThai"),
                        thoiGianDat
                );
                datBans.add(datBan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return datBans;
    }
    public void updateTrangThaiDatBan(int id, String trangThai) {
        String checkSql = "SELECT trangThai, thoiGianDat FROM datban WHERE id = ?";
        String updateSql = "UPDATE datban SET trangThai = ? WHERE id = ?";
        try (Connection conn = DbConnection.getConnection();
             PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
            checkStmt.setInt(1, id);
            try (ResultSet rs = checkStmt.executeQuery()) {
                if (rs.next()) {
                    String trangThaiHienTai = rs.getString("trangThai");
                    Timestamp thoiGianDat = rs.getTimestamp("thoiGianDat");
                    Timestamp now = new Timestamp(System.currentTimeMillis());
                    if ("Đang chờ".equals(trangThaiHienTai) && thoiGianDat != null && now.getTime() - thoiGianDat.getTime() >= 2 * 60 * 1000) {
                        try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                            updateStmt.setString(1, trangThai);
                            updateStmt.setInt(2, id);
                            if (updateStmt.executeUpdate() > 0) {
                                System.out.println("Trạng thái đơn đặt bàn ID " + id + " đã được cập nhật thành '" + trangThai + "'.");
                            } else {
                                System.out.println("Không có đơn đặt bàn nào cần cập nhật với ID " + id);
                            }
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
