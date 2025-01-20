package Controller;

import Model.SanPham;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
@WebServlet("/GioHangController")
public class giohangController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin sản phẩm từ request
        int id = Integer.parseInt(request.getParameter("id"));
        String tenSanPham = request.getParameter("tenSanPham");
        String hinhAnh = request.getParameter("hinhAnh");
        Double gia = Double.parseDouble(request.getParameter("gia"));

        SanPham sanPham = new SanPham(id, tenSanPham, gia, hinhAnh);
        HttpSession session = request.getSession();
        List<SanPham> cart = (List<SanPham>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }
        boolean exists = false;
        for (SanPham item : cart) {
            if (item.getId() == sanPham.getId()) {
                exists = true;
                break;
            }
        }
        if (!exists) {
            cart.add(sanPham);
            session.setAttribute("notification", "Sản phẩm đã được thêm vào giỏ hàng!");
        } else {
            session.setAttribute("notification", "Sản phẩm đã có trong giỏ hàng!");
        }
        session.setAttribute("cart", cart);

    }
}