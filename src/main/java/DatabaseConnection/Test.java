package DatabaseConnection;

import java.sql.*;

public class Test {
    public static void main(String[] args) {
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/coffee_shop", "root", "40");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from coffee_shop.khachhang");
            while (resultSet.next()) {
                System.out.println(resultSet.getString("MAKH"));
                System.out.println(resultSet.getString("HOTEN"));
                System.out.println(resultSet.getString("DIACHI"));
                System.out.println(resultSet.getString("SODT"));
                System.out.println(resultSet.getString("EMAIL"));
                System.out.println(resultSet.getString("NGAYDK"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

