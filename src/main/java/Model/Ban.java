package Model;

public class Ban {
    private int id;
    private int soLuong;
    private String trangThai;
    private String khongGian;
    public Ban(int id, int soLuong, String trangThai, String khongGian) {
        this.id = id;
        this.soLuong = soLuong;
        this.trangThai = trangThai;
        this.khongGian = khongGian;
    }
    // Getter và Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getKhongGian() {
        return khongGian;
    }

    public void setKhongGian(String khongGian) {
        this.khongGian = khongGian;
    }
}
