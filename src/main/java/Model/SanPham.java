package Model;

public class SanPham {
    private int id;
    private String tenSanPham;
    private Double gia;
    private String moTa;
    private String hinhAnh;
    private int loaiHangId;
    private String tenLoai;
    public SanPham() {
    }

    // Constructor
    public SanPham(int id, String tenSanPham, Double gia, String hinhAnh) {
        this.id = id;
        this.tenSanPham = tenSanPham;
        this.gia = gia;
        this.hinhAnh = hinhAnh;
    }
    // Constructor
    public SanPham(int id, String tenSanPham, Double gia, String hinhAnh, String tenLoai, int loaiHangId) {
        this.id = id;
        this.tenSanPham = tenSanPham;
        this.gia = gia;
        this.hinhAnh = hinhAnh;
        this.tenLoai = tenLoai;
        this.loaiHangId = loaiHangId;
    }
    public SanPham(int id, String tenSanPham, Double gia, String moTa, int loaiHangId, String hinhAnh) {
        this.id = id;
        this.tenSanPham = tenSanPham;
        this.gia = gia;
        this.moTa = moTa;
        this.loaiHangId = loaiHangId;
        this.hinhAnh = hinhAnh;
    }



    // Getters và Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getTenSanPham() {
        return tenSanPham;
    }
    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }
    public Double getGia() {
        return gia;
    }
    public void setGia(Double gia) {
        this.gia = gia;
    }
    public String getMoTa() {
        return moTa;
    }
    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }
    public String getHinhAnh() {
        return hinhAnh;
    }
    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }
    public int getLoaiHangId() {
        return loaiHangId;
    }
    public void setLoaiHangId(int loaiHangId) {
        this.loaiHangId = loaiHangId;
    }
    public String getTenLoai() {
        return tenLoai;
    }
    public void setTenLoai(String tenLoai) {
        this.tenLoai = tenLoai;
    }
}
