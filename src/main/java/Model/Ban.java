package Model;

public class Ban {
    private int id;
    private int soLuong;
    private String khongGian;
    public Ban(int id, int soLuong, String khongGian) {
        this.id = id;
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

    public String getKhongGian() {
        return khongGian;
    }

    public void setKhongGian(String khongGian) {
        this.khongGian = khongGian;
    }
}
