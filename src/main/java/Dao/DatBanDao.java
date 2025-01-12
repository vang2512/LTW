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
        String sql = "INSERT INTO DatBan (soLuong, ngayDat, gioDat,gioTra, khongGian, trangThai, thoiGianDat) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, datBan.getSoLuong());
            stmt.setDate(2, Date.valueOf(datBan.getNgayDat()));
            stmt.setTime(3, Time.valueOf(formatTime(datBan.getGioDat())));
            stmt.setTime(4, Time.valueOf(formatTime(datBan.getGioTra())));
            stmt.setString(5, datBan.getKhongGian());
            stmt.setString(6, datBan.getTrangThai());  // Đang chờ
            stmt.setTimestamp(7, Timestamp.valueOf(datBan.getThoiGianDat()));  // Thời gian đặt
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
                        rs.getString("gioTra"),
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
                    } else {
                        String message = !("Đang chờ".equals(trangThaiHienTai))
                                ? "Trạng thái không phải 'Đang chờ', không thể cập nhật."
                                : "Thời gian đặt chưa đủ 2 phút, không thể cập nhật.";
                        System.out.println(message);
                    }
                } else {
                    System.out.println("Không tìm thấy đơn đặt bàn với ID " + id);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    // Cập nhật thông tin đơn đặt bàn
    public boolean updateDatBan(DatBan datBan) {
        String sql = "UPDATE datban SET soLuong = ?, ngayDat = ?, gioDat = ?, gioTra = ?, khongGian = ? WHERE id = ?";
        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, datBan.getSoLuong());
            stmt.setString(2, datBan.getNgayDat());
            stmt.setString(3, datBan.getGioDat());
            stmt.setString(4, datBan.getGioTra());
            stmt.setString(5, datBan.getKhongGian());
            stmt.setInt(6, datBan.getId());

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    // Xóa đơn đặt bàn
    public boolean deleteDatBan(int id) {
        String sql = "DELETE FROM datban WHERE id = ?";
        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Kiểm tra bàn đã được đặt chưa vào ngày và giờ yêu cầu
    public boolean isBanBooked(int banId, String ngayDat, String gioDat, String gioTra) {
        String sql = "SELECT * FROM datban d JOIN chitietdatban ctdb ON d.id = ctdb.datBanId " +
                "WHERE ctdb.banId = ? AND d.ngayDat = ? AND (d.gioDat <= ? AND d.gioTra >= ?)";
        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, banId);
            stmt.setString(2, ngayDat);
            stmt.setString(3, gioDat);
            stmt.setString(4, gioTra);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next(); // Nếu có kết quả, bàn đã được đặt
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Nếu không có kết quả, bàn chưa được đặt
    }
}
