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
                    sp.setGia(rs.getFloat("gia"));
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
                    sanPham.setGia(rs.getFloat("gia"));
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

}
