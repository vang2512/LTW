package Model;

import java.time.LocalDateTime;

public class DatBan {
    private int id;
    private int soLuong;
    private String ngayDat;
    private String gioDat;
    private String gioTra;
    private String khongGian;
    private String trangThai;
    private LocalDateTime thoiGianDat;

    // Constructor bao gồm thời gian đặt
    public DatBan(int soLuong, String ngayDat, String gioDat,String gioTra, String khongGian, String trangThai) {
        this.soLuong = soLuong;
        this.ngayDat = ngayDat;
        this.gioDat = gioDat;
        this.gioTra = gioTra;
        this.khongGian = khongGian;
        this.trangThai = trangThai;
        this.thoiGianDat = LocalDateTime.now();
    }
    // Constructor bao gồm thời gian đặt
    public DatBan(int id,int soLuong, String ngayDat, String gioDat,String gioTra, String khongGian, String trangThai) {
        this.id = id;
        this.soLuong = soLuong;
        this.ngayDat = ngayDat;
        this.gioDat = gioDat;
        this.gioTra = gioTra;
        this.khongGian = khongGian;
        this.trangThai = trangThai;
        this.thoiGianDat = LocalDateTime.now();
    }
    public DatBan(int id, int soLuong, String ngayDat, String gioDat,String gioTra, String khongGian, String trangThai, LocalDateTime thoiGianDat) {
        this.id = id;
        this.soLuong = soLuong;
        this.ngayDat = ngayDat;
        this.gioDat = gioDat;
        this.gioTra= gioTra;
        this.khongGian = khongGian;
        this.trangThai = trangThai;
        this.thoiGianDat = thoiGianDat;
    }
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

    public String getNgayDat() {
        return ngayDat;
    }

    public void setNgayDat(String ngayDat) {
        this.ngayDat = ngayDat;
    }

    public String getGioDat() {
        return gioDat;
    }

    public void setGioDat(String gioDat) {
        this.gioDat = gioDat;
    }
    public String getGioTra() {
        return gioTra;
    }

    public void setGioTra(String gioTra) {
        this.gioTra = gioTra;
    }

    public String getKhongGian() {
        return khongGian;
    }

    public void setKhongGian(String khongGian) {
        this.khongGian = khongGian;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }
    public LocalDateTime getThoiGianDat() {
        return thoiGianDat;
    }

    public void setThoiGianDat(LocalDateTime thoiGianDat) {
        this.thoiGianDat = thoiGianDat;
    }
}
