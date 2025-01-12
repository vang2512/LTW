package Controller;

import Dao.DatBanDao;
import Dao.BanDao;
import Model.DatBan;
import Model.Ban;

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            // Xử lý sửa
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                int soLuong = Integer.parseInt(request.getParameter("soLuong"));
                String ngayDat = request.getParameter("ngayDat");
                String gioDat = request.getParameter("gioDat");
                String gioTra = request.getParameter("gioTra");
                String khongGian = request.getParameter("khongGian");

                // Kiểm tra xem có bàn trống phù hợp với các điều kiện không
                boolean isAvailable = true;
                if (isAvailable) {
                    // Tạo đối tượng DatBan mới với thông tin đã sửa
                    DatBan datBan = new DatBan(id, soLuong, ngayDat, gioDat, gioTra, khongGian, "Đang chờ");

                    // Gọi phương thức cập nhật từ DAO
                    boolean isUpdated = datBanDao.updateDatBan(datBan);
                    if (isUpdated) {
                        request.setAttribute("message", "Cập nhật đơn đặt bàn thành công.");
                    } else {
                        request.setAttribute("message", "Không thể cập nhật đơn đặt bàn. Vui lòng thử lại.");
                    }
                } else {
                    request.setAttribute("message", "Không có bàn trống phù hợp với thông tin đã chỉnh sửa.");
                }

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
