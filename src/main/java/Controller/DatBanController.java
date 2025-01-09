package Controller;

import Dao.BanDao;
import Dao.ChiTietDatBanDao;
import Dao.DatBanDao;
import Model.Ban;
import Model.DatBan;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;
import java.io.IOException;
import java.util.concurrent.*;

public class DatBanController extends HttpServlet {
    private BanDao banDao = new BanDao();
    private DatBanDao datBanDao = new DatBanDao();
    private ChiTietDatBanDao chiTietDatBanDao = new ChiTietDatBanDao();
    // Xử lý yêu cầu POST từ form đặt bàn
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));
        String khongGian = request.getParameter("khongGian");
        String ngayDat = request.getParameter("ngayDat");
        String gioDat = request.getParameter("gioDat");

        // Lấy danh sách bàn trống và ghép bàn
        List<Ban> availableBans = banDao.getAllBan();
        List<Ban> selectedBans = new ArrayList<>();
        int remaining = soLuong;

        for (Ban ban : availableBans) {
            if (ban.getTrangThai().equals("Còn Trống") && ban.getSoLuong() <= remaining && ban.getKhongGian().equals(khongGian)) {
                selectedBans.add(ban);
                remaining -= ban.getSoLuong();
                if (remaining <= 0) break;
            }
        }
    }
}
