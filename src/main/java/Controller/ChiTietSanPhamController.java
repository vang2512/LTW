package Controller;

import Dao.SanPhamDao;
import Model.SanPham;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet(name = "ChiTietSanPhamController", urlPatterns = {"/chitietSP"})
public class ChiTietSanPhamController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy id từ request
        String idParam = request.getParameter("id");

        // Nếu id có tồn tại
        if (idParam != null) {
            try {
                int id = Integer.parseInt(idParam);
                SanPhamDao sanPhamDao = new SanPhamDao();
                SanPham sanPham = sanPhamDao.getSanPhamById(id);

                if (sanPham != null) {
                    request.setAttribute("sanPham", sanPham);
                } else {
                    // Nếu không có sản phẩm, chuyển đến trang lỗi hoặc thông báo
                    request.setAttribute("errorMessage", "Sản phẩm không tồn tại");
                }
            } catch (NumberFormatException e) {
                // Xử lý lỗi nếu không thể chuyển đổi id sang kiểu int
                request.setAttribute("errorMessage", "ID sản phẩm không hợp lệ");
            }
        }
        request.getRequestDispatcher("pages/chi_tiet_san_pham.jsp").forward(request, response);
    }
}
