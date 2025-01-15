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
public class AdminController extends HttpServlet{
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        // Xử lý thêm bàn
        if ("addDesk".equals(action)) {
            String tenBan = request.getParameter("tenBan");
            String soLuongStr = request.getParameter("soLuong");
            String khongGian = request.getParameter("khongGian");
            // Kiểm tra thông tin nhập vào
            if (tenBan == null || tenBan.trim().isEmpty() || soLuongStr == null || soLuongStr.trim().isEmpty() || khongGian == null || khongGian.trim().isEmpty()) {
                request.setAttribute("message", "Vui lòng điền đầy đủ thông tin bàn!");
                request.setAttribute("messageType", "error");
                RequestDispatcher dispatcher = request.getRequestDispatcher("pages/Admin.jsp");
                dispatcher.forward(request, response);
                return;
            }
            int soLuong = Integer.parseInt(soLuongStr);
            Ban newBan = new Ban(0, tenBan, soLuong, khongGian);
            try {
                BanDao banDao = new BanDao();
                banDao.insertBan(newBan); // Thêm bàn vào cơ sở dữ liệu
                request.setAttribute("message", "Thêm bàn thành công!");
                request.setAttribute("messageType", "success");
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("message", "Có lỗi xảy ra khi thêm bàn: " + e.getMessage());
                request.setAttribute("messageType", "error");
            }
            doGet(request, response);
        }
        // Xử lý thêm người dùng
        else if ("addUser".equals(action)) {
            String hoten = request.getParameter("name");
            String diachi = request.getParameter("address");
            String sodt = request.getParameter("phone");
            String email = request.getParameter("email");

            // Kiểm tra thông tin nhập vào
            if (hoten == null || hoten.trim().isEmpty() || diachi == null || diachi.trim().isEmpty() || sodt == null || sodt.trim().isEmpty() || email == null || email.trim().isEmpty()) {
                request.setAttribute("message", "Vui lòng điền đầy đủ thông tin!");
                request.setAttribute("messageType", "error");
                RequestDispatcher dispatcher = request.getRequestDispatcher("pages/Admin.jsp");
                dispatcher.forward(request, response);
                return;
            }
            User newUser = new User(0, hoten, diachi, sodt, email, null);
            try {
                UserDao userDao = new UserDao();
                userDao.insertUser(newUser);
                request.setAttribute("message", "Thêm người dùng thành công!");
                request.setAttribute("messageType", "success");
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("message", "Có lỗi xảy ra khi thêm người dùng: " + e.getMessage());
                request.setAttribute("messageType", "error");
            }

        }
        else if ("addProduct".equals(action)) {
            String tenSanPham = request.getParameter("tenSanPham");
            double gia = Double.parseDouble(request.getParameter("gia"));
            String moTa = request.getParameter("moTa");
            String loaiHangName = request.getParameter("loaiHang");
            String hinhAnh = request.getParameter("hinhAnh");
            // Kiểm tra thông tin nhập vào
            if (tenSanPham == null || tenSanPham.trim().isEmpty() || moTa == null || moTa.trim().isEmpty() || loaiHangName == null || loaiHangName.trim().isEmpty() || hinhAnh == null || hinhAnh.trim().isEmpty()) {
                request.setAttribute("message", "Vui lòng điền đầy đủ thông tin sản phẩm!");
                request.setAttribute("messageType", "error");
                RequestDispatcher dispatcher = request.getRequestDispatcher("pages/Admin.jsp");
                dispatcher.forward(request, response);
                return;
            }
            // Lấy ID của loại hàng từ tên
            int loaiHangId = sanPhamDao.getLoaiHangIdByName(loaiHangName);
            if (loaiHangId == -1) {
                request.setAttribute("message", "Không tìm thấy loại hàng!");
                request.setAttribute("messageType", "error");
                RequestDispatcher dispatcher = request.getRequestDispatcher("pages/Admin.jsp");
                dispatcher.forward(request, response);
                return;
            }
            // Tạo đối tượng SanPham
            SanPham newProduct = new SanPham(0, tenSanPham, gia, moTa, loaiHangId, hinhAnh);
            try {
                sanPhamDao.insertSanPham(newProduct);
                request.setAttribute("message", "Thêm sản phẩm thành công!");
                request.setAttribute("messageType", "success");
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("message", "Có lỗi xảy ra khi thêm sản phẩm: " + e.getMessage());
                request.setAttribute("messageType", "error");
            }
            // Quay lại trang Admin để thông báo
            RequestDispatcher dispatcher = request.getRequestDispatcher("pages/Admin.jsp");
            dispatcher.forward(request, response);
        }
        else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String tenBan = request.getParameter("tenBan");
            int soLuong = Integer.parseInt(request.getParameter("soLuong"));
            String khongGian = request.getParameter("khongGian");
            Ban ban = new Ban(id, tenBan, soLuong, khongGian);
            BanDao banDao = new BanDao();
            banDao.update(ban);
            response.sendRedirect(request.getContextPath() + "/users");
        }
    }
}
