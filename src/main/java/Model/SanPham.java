package Model;

public class SanPham {
    private int id;
    private String tenSanPham;
    private float gia;
    private String moTa;
    private String hinhAnh;
    private int loaiHangId;
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
    public float getGia() {
        return gia;
    }
    public void setGia(float gia) {
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
}
