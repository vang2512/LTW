package Controller;
import java.io.*;
import java.sql.*;
import java.util.List;
import Dao.BanDao;
import Dao.SanPhamDao;
import Dao.UserDao;
import Model.Ban;
import Model.SanPham;
import Model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
public class AdminController {
    private SanPhamDao sanPhamDao = new SanPhamDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            UserDao userDAO = new UserDao();
            BanDao banDAO = new BanDao();
            SanPhamDao sanPhamDAO = new SanPhamDao();
            List<Ban> bans = banDAO.getAllBan();
            List<User> users = userDAO.getAllUsers();
            List<SanPham> sanPhams = sanPhamDAO.getAllSanPhamWithLoaiHang();
            request.setAttribute("users", users);
            request.setAttribute("bans", bans);
            request.setAttribute("sanPhams", sanPhams);
            RequestDispatcher dispatcher = request.getRequestDispatcher("pages/Admin.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error fetching users: " + e.getMessage());
        }
    }

}
