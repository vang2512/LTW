package Dao;

import Model.SanPham;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SanPhamDao {
    // Lấy danh sách sản phẩm theo loại hàng
    public List<SanPham> getSanPhamByLoai(int loaiHangId) {
        List<SanPham> sanPhams = new ArrayList<>();
        String sql = "SELECT * FROM sanpham WHERE loaiHangId = ?";
        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, loaiHangId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    SanPham sp = new SanPham();
                    sp.setId(rs.getInt("id"));
                    sp.setTenSanPham(rs.getString("tenSanPham"));
                    sp.setGia(rs.getDouble("gia"));
                    sp.setMoTa(rs.getString("moTa"));
                    sp.setHinhAnh(rs.getString("hinhAnh"));
                    sp.setLoaiHangId(rs.getInt("loaiHangId"));
                    sanPhams.add(sp);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sanPhams;
    }

    public SanPham getSanPhamById(int id) {
        SanPham sanPham = null;
        String sql = "SELECT * FROM sanpham WHERE id = ?";
        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    sanPham = new SanPham();
                    sanPham.setId(rs.getInt("id"));
                    sanPham.setTenSanPham(rs.getString("tenSanPham"));
                    sanPham.setGia(rs.getDouble("gia"));
                    sanPham.setMoTa(rs.getString("moTa"));
                    sanPham.setHinhAnh(rs.getString("hinhAnh"));
                    sanPham.setLoaiHangId(rs.getInt("loaiHangId"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sanPham;
    }
    public List<SanPham> getAllSanPhamWithLoaiHang() {
        List<SanPham> sanPhams = new ArrayList<>();
        String sql = "SELECT sp.*, lh.tenLoai AS tenLoai " +
                "FROM sanpham sp " +
                "JOIN loaihang lh ON sp.loaiHangId = lh.id";

        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                SanPham sp = new SanPham(
                        rs.getInt("id"),
                        rs.getString("tenSanPham"),
                        rs.getDouble("gia"),
                        rs.getString("hinhAnh"),
                        rs.getString("tenLoai"),
                        rs.getInt("loaiHangId")
                );
                sanPhams.add(sp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return sanPhams;
    }
    public void insertSanPham(SanPham sanPham) throws SQLException {
        String sql = "INSERT INTO sanpham (tenSanPham, gia, moTa, loaiHangId,hinhAnh) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, sanPham.getTenSanPham());
            stmt.setDouble(2, sanPham.getGia());
            stmt.setString(3, sanPham.getMoTa());
            stmt.setInt(4, sanPham.getLoaiHangId());
            stmt.setString(5, sanPham.getHinhAnh());
            stmt.executeUpdate();
        }
    }
    // Phương thức lấy ID của loại hàng từ tên
    public int getLoaiHangIdByName(String loaiHangName) {
        int loaiHangId = -1;
        String sql = "SELECT id FROM loaiHang WHERE tenLoai = ?";

        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, loaiHangName);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                loaiHangId = rs.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return loaiHangId;
    }
    public List<SanPham> getSanPhamMoiNhat(int limit) {
        List<SanPham> sanPhams = new ArrayList<>();
        String sql = "SELECT * FROM sanpham ORDER BY thoiGianThem DESC LIMIT ?";
        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, limit);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    SanPham sp = new SanPham();
                    sp.setId(rs.getInt("id"));
                    sp.setTenSanPham(rs.getString("tenSanPham"));
                    sp.setGia(rs.getDouble("gia"));
                    sp.setMoTa(rs.getString("moTa"));
                    sp.setHinhAnh(rs.getString("hinhAnh"));
                    sp.setLoaiHangId(rs.getInt("loaiHangId"));
                    sanPhams.add(sp);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sanPhams;
    }
}
