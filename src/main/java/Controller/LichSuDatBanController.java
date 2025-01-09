package Controller;

import Dao.DatBanDao;
import Model.DatBan;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class LichSuDatBanController extends HttpServlet {
    private DatBanDao datBan = new DatBanDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<DatBan> datBans = datBan.getAllDatBan();
        request.setAttribute("datBans", datBans);
        RequestDispatcher dispatcher = request.getRequestDispatcher("LichSuDatBan/jsp/LichSuDatBan.jsp");
        dispatcher.forward(request, response);
    }
}
