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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));
        String khongGian = request.getParameter("khongGian");
        String ngayDat = request.getParameter("ngayDat");
        String gioDat = request.getParameter("gioDat");
        String gioTra = request.getParameter("gioTra");
        List<Ban> availableBans = banDao.getAllBan();
        availableBans.sort(Comparator.comparingInt(Ban::getSoLuong)); // Sắp xếp theo số lượng ghế tăng dần

        List<Ban> selectedBans = new ArrayList<>();
        int remaining = soLuong;

        Ban exactMatchBan = null;
        Ban slightlyLargerBan = null;

        // Tìm bàn phù hợp với yêu cầu
        for (Ban ban : availableBans) {
            boolean isBooked = datBanDao.isBanBooked(ban.getId(), ngayDat, gioDat, gioTra);
            if (!isBooked && ban.getKhongGian().equals(khongGian)) {
                if (ban.getSoLuong() == soLuong) {
                    exactMatchBan = ban;
                    break;
                } else if (slightlyLargerBan == null && ban.getSoLuong() > soLuong && ban.getSoLuong() <= soLuong + 1) {
                    slightlyLargerBan = ban;
                }
            }
        }

        if (exactMatchBan != null) {
            selectedBans.add(exactMatchBan);
            remaining = 0;
        } else if (slightlyLargerBan != null) {
            selectedBans.add(slightlyLargerBan);
            remaining = 0;
        } else {
            // Nếu không có bàn chính xác hoặc lớn hơn, thực hiện ghép bàn
            for (Ban ban : availableBans) {
                boolean isBooked = datBanDao.isBanBooked(ban.getId(), ngayDat, gioDat, gioTra);
                if (!isBooked && ban.getKhongGian().equals(khongGian)) {
                    selectedBans.add(ban);
                    remaining -= ban.getSoLuong();
                    if (remaining <= 0) break;
                }
            }
        }
        boolean success = remaining <= 0;
        String message;
        if (success) {
            DatBan datBan = new DatBan(soLuong, ngayDat, gioDat, gioTra, khongGian, "Đang chờ");
            datBanDao.saveDatBan(datBan);
            for (Ban ban : selectedBans) {
                chiTietDatBanDao.saveChiTietDatBan(datBan.getId(), ban.getId());
            }
            message = "Đặt bàn thành công!";
            ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
            scheduler.schedule(() -> {
                datBanDao.updateTrangThaiDatBan(datBan.getId(), "Đã xác nhận");
                System.out.println("Trạng thái đơn đặt bàn ID " + datBan.getId() + " đã được cập nhật thành 'Đã xác nhận'.");
                scheduler.shutdown();
            }, 2, TimeUnit.MINUTES);

            request.setAttribute("datBan", datBan);
        } else {
            message = "Không đủ bàn cho số lượng yêu cầu. Vui lòng chọn số lượng nhỏ hơn hoặc thay đổi không gian.";
        }
        // Truyền dữ liệu cho JSP
        request.setAttribute("success", success);
        request.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/dat_ban_result.jsp");
        dispatcher.forward(request, response);
    }

}