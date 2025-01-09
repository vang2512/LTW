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
        String gioTra = request.getParameter("gioTra");

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
        // Kiểm tra nếu đủ bàn
        boolean success = remaining <= 0;
        String message;
        if (success) {
            // Lưu đơn đặt bàn mới vào cơ sở dữ liệu
            DatBan datBan = new DatBan(soLuong, ngayDat, gioDat,gioTra, khongGian, "Đang chờ");
            datBanDao.saveDatBan(datBan);
            // Cập nhật trạng thái bàn và lưu chi tiết
            for (Ban ban : selectedBans) {
                banDao.updateBanTrangThai(ban.getId(), "Đặt");
                chiTietDatBanDao.saveChiTietDatBan(datBan.getId(), ban.getId());
            }
            // Thông báo đặt bàn thành công
            message = "Đặt bàn thành công!";
            request.setAttribute("datBan", datBan);
            ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
            scheduler.schedule(() -> {
                datBanDao.updateTrangThaiDatBan(datBan.getId(), "Đã xác nhận");
                System.out.println("Trạng thái đơn đặt bàn ID " + datBan.getId() + " đã được cập nhật thành 'Đã xác nhận'.");
                scheduler.shutdown();
            }, 2, TimeUnit.MINUTES);
        } else {
            message = "Không đủ bàn cho số lượng yêu cầu.";
        }
        // Truyền dữ liệu cho JSP
        request.setAttribute("success", success);
        request.setAttribute("message", message);
        // Chuyển hướng đến trang kết quả đặt bàn
        RequestDispatcher dispatcher = request.getRequestDispatcher("DatBan/jsp/DatBanResult.jsp");
        dispatcher.forward(request, response);
    }
}
