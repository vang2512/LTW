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
public class LichSuDatBanController extends HttpServlet {
    private DatBanDao datBanDao = new DatBanDao(); // Sử dụng đúng tên biến cho DatBanDao
    private BanDao banDao = new BanDao();
    private ChiTietDatBanDao chiTietDao = new ChiTietDatBanDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<DatBan> datBans = datBanDao.getAllDatBan();
        request.setAttribute("datBans", datBans);
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/Lich_su_dat_ban.jsp");
        dispatcher.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            // Xử lý sửa
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                int soLuong = Integer.parseInt(request.getParameter("soLuong"));
                String khongGian = request.getParameter("khongGian");
                String ngayDat = request.getParameter("ngayDat");
                String gioDat = request.getParameter("gioDat");
                String gioTra = request.getParameter("gioTra");

                // Lấy danh sách tất cả các bàn
                List<Ban> availableBans = banDao.getAllBan();
                List<Ban> selectedBans = new ArrayList<>();
                int remaining = soLuong;

                // Kiểm tra bàn còn trống và ghép bàn
                for (Ban ban : availableBans) {
                    boolean isBooked = datBanDao.isBanBooked(ban.getId(), ngayDat, gioDat, gioTra);
                    if (!isBooked && ban.getSoLuong() <= remaining && ban.getKhongGian().equals(khongGian)) {
                        selectedBans.add(ban);
                        remaining -= ban.getSoLuong();
                        if (remaining <= 0) break;
                    }
                }

                // Kiểm tra nếu đủ bàn
                boolean success = remaining <= 0;
                String message;
                if (success) {
                    // Cập nhật thông tin đơn đặt bàn
                    DatBan datBan = new DatBan(id, soLuong, ngayDat, gioDat, gioTra, khongGian, "Đang chờ");
                    boolean isUpdated = datBanDao.updateDatBan(datBan);
                    if (isUpdated) {
                        // Xóa các bàn chi tiết cũ liên quan đến datBanId


                        // Lưu chi tiết đặt bàn mới
                        for (Ban ban : selectedBans) {
                            chiTietDao.saveChiTietDatBan(datBan.getId(), ban.getId());
                        }

                        message = "Cập nhật đơn đặt bàn và các bàn chi tiết thành công!";
                        request.setAttribute("datBan", datBan);
                    } else {
                        message = "Cập nhật không thành công!";
                    }
                } else {
                    message = "Không đủ bàn trống để ghép!";
                }

                request.setAttribute("message", message);
            } catch (Exception e) {
                request.setAttribute("message", "Đã xảy ra lỗi khi cập nhật đơn đặt bàn: " + e.getMessage());
            }

        } else if ("delete".equals(action)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                boolean isDeleted = datBanDao.deleteDatBan(id);

                if (isDeleted) {
                    request.setAttribute("message", "Xóa đơn đặt bàn thành công.");
                } else {
                    request.setAttribute("message", "Không thể xóa đơn đặt bàn. Vui lòng thử lại.");
                }
            } catch (Exception e) {
                request.setAttribute("message", "Đã xảy ra lỗi khi xóa đơn đặt bàn: " + e.getMessage());
            }
        }

        doGet(request, response);
    }



}
