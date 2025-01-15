package Model;

import java.sql.Timestamp;

public class User {
    private int id;
    private String hoten;
    private String diachi;
    private String sodt;
    private String email;
    private Timestamp ngaydk;
    // Constructor
    public User(int id, String hoten, String diachi, String sodt, String email, Timestamp ngaydk) {
        this.id = id;
        this.hoten = hoten;
        this.diachi = diachi;
        this.sodt = sodt;
        this.email = email;
        this.ngaydk = ngaydk;
    }
    // Getters
    public int getId() {
        return id;
    }

    public String getHoten() {
        return hoten;
    }

    public String getDiachi() {
        return diachi;
    }

    public String getSodt() {
        return sodt;
    }

    public String getEmail() {
        return email;
    }

    public Timestamp getNgaydk() {
        return ngaydk;
    }
}

