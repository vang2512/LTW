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

public class SanPhamController extends HttpServlet {
    private SanPhamDao sanPhamDao = new SanPhamDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy các sản phẩm theo loại
        List<SanPham> cafeList = sanPhamDao.getSanPhamByLoai(1);
        List<SanPham> nuocEpList = sanPhamDao.getSanPhamByLoai(2);
        List<SanPham> traList = sanPhamDao.getSanPhamByLoai(3);
        List<SanPham> banhList = sanPhamDao.getSanPhamByLoai(4);

        // Set dữ liệu lên request
        request.setAttribute("cafeList", cafeList);
        request.setAttribute("nuocEpList", nuocEpList);
        request.setAttribute("traList", traList);
        request.setAttribute("banhList", banhList);

        // Chuyển tiếp sang JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/Mat_hang.jsp");
        dispatcher.forward(request, response);
    }

}
