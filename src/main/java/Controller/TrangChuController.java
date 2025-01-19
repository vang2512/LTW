package Controller;

import Dao.SanPhamDao;
import Model.SanPham;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class TrangChuController extends HttpServlet {
    private SanPhamDao sanPhamDao = new SanPhamDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<SanPham> spMoiNhat = sanPhamDao.getSanPhamMoiNhat(4);
        request.setAttribute("spMoiNhat", spMoiNhat);

        // Chuyển tiếp sang JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/trang_chu.jsp");
        dispatcher.forward(request, response);
    }

}