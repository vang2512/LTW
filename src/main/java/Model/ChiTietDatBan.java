package Model;

public class ChiTietDatBan {
    private int id;
    private int datBanId;
    private int banId;
    private String trangThai;

    public ChiTietDatBan(int datBanId, int banId, String trangThai) {
        this.datBanId = datBanId;
        this.banId = banId;
        this.trangThai = trangThai;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDatBanId() {
        return datBanId;
    }

    public void setDatBanId(int datBanId) {
        this.datBanId = datBanId;
    }

    public int getBanId() {
        return banId;
    }

    public void setBanId(int banId) {
        this.banId = banId;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }
}