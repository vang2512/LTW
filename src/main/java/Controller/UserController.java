package Controller;

import Dao.UserDao;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class UserController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDao userDao = new UserDao();
        int role = userDao.checkLogin(email, password);

        if (role == 0) { // Role 0: User
            response.sendRedirect("pages/Trang_chu.jsp");
        } else if (role == 1) { // Role 1: Admin
            response.sendRedirect("pages/Admin.jsp");
        } else { // Đăng nhập không hợp lệ
            request.setAttribute("errorMessage", "Email hoặc mật khẩu không đúng!");
            request.getRequestDispatcher("pages/Login.jsp").forward(request, response);
        }
    }

}