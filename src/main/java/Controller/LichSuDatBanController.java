package Controller;

import Dao.DatBanDao;
import Model.DatBan;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class LichSuDatBanController extends HttpServlet {
    private DatBanDao datBanDao = new DatBanDao(); // Sử dụng đúng tên biến cho DatBanDao
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<DatBan> datBans = datBanDao.getAllDatBan();
        request.setAttribute("datBans", datBans);
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/Lich_su_dat_ban.jsp");
        dispatcher.forward(request, response);
    }
}
