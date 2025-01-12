<!DOCTYPE html>
<html lang="en">
<head>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Lich_su_dat_ban.css">
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <title>Lịch Sử Đặt Bàn</title>
  <link rel="stylesheet" href="lichsudatban.css">
</head>
<body>
<!-- Header -->
<jsp:include page="/components/Header.jsp" />
<script src="${pageContext.request.contextPath}/js/components/Header_Footer.js" defer></script>

<!-- History -->
<div class="booking-history">
  <h2>Lịch Sử Đặt Bàn</h2>
  <table>
    <thead>
    <tr>
      <th>Ngày Đặt</th>
      <th>Giờ Đặt</th>
      <th>Không Gian</th>
      <th>Số Lượng</th>
      <th>Trạng Thái</th>
      <th>Hành Động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="datBan" items="${datBans}">
      <tr>
        <td>${datBan.ngayDat}</td>
        <td>${datBan.gioDat}</td>
        <td>${datBan.khongGian}</td>
        <td>${datBan.soLuong}</td>
        <td>${datBan.trangThai}</td>
        <td>
          <c:if test="${datBan.trangThai == 'Đang chờ'}">
            <!-- Nút sửa -->
            <button type="button" class="edit-btn" onclick="showEditForm(${datBan.id}, '${datBan.soLuong}', '${datBan.ngayDat}', '${datBan.gioDat}', '${datBan.gioTra}', '${datBan.khongGian}')">Sửa</button>
            <!-- Nút xóa -->
            <form action="${pageContext.request.contextPath}/lichsu" method="post" style="display:inline;">
              <input type="hidden" name="action" value="delete" />
              <input type="hidden" name="id" value="${datBan.id}" />
              <button type="submit" class="cancel-btn">Xóa</button>
            </form>
          </c:if>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
<!-- Biểu mẫu chỉnh sửa -->
<div id="overlay" class="overlay"></div>
<div id="edit-form" class="edit-form">
  <h3>Chỉnh sửa thông tin đặt bàn</h3>
  <form action="${pageContext.request.contextPath}/lichsu" method="post">
    <input type="hidden" name="action" value="edit" />
    <input type="hidden" id="edit-id" name="id" />
    <label for="edit-soLuong">Số lượng:</label>
    <input type="number" id="edit-soLuong" name="soLuong" required />
    <label for="edit-ngayDat">Ngày đặt:</label>
    <input type="date" id="edit-ngayDat" name="ngayDat" required />
    <label for="edit-gioDat">Giờ đặt:</label>
    <input type="time" id="edit-gioDat" name="gioDat" required />
    <label for="edit-gioTra">Giờ trả:</label>
    <input type="time" id="edit-gioTra" name="gioTra" required />
    <label for="edit-khongGian">Không gian:</label>
    <select id="edit-khongGian" name="khongGian" required>
      <option value="Trong nhà">Trong nhà</option>
      <option value="Ngoài trời">Ngoài trời</option>
    </select>
    <button type="submit">Cập nhật</button>
    <button type="button" onclick="hideEditForm()">Hủy</button>
  </form>
</div>
<script src="js/Lich_su_dat_ban.js"></script>
<!-- Footer -->
<jsp:include page="/components/Footer.jsp" />
</body>
</html>