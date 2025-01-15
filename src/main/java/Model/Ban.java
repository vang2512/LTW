package Model;

public class Ban {
    private int id;
    private String tenBan;
    private int soLuong;
    private String khongGian;
    public Ban(int id,String tenBan, int soLuong, String khongGian) {
        this.id = id;
        this.tenBan = tenBan;
        this.soLuong = soLuong;
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

    public String getTenBan() {
        return tenBan;
    }

    public void setTenBan(String tenBan) {
        this.tenBan = tenBan;
    }

    public String getKhongGian() {
        return khongGian;
    }

    public void setKhongGian(String khongGian) {
        this.khongGian = khongGian;
    }
}
