<!DOCTYPE html>
<html lang="en">
<head>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/LichSuDatBan/css/LichSuDatBan.css">
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <title>Title</title>
  <link rel="stylesheet" href="lichsudatban.css">
</head>
<body>
<!-- Header -->
<div data-include="Header_Footer/jsp/Header.jsp"></div>
<script src="LichSuDatBan/js/Header_Footer.js" defer></script>
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
            <button class="edit-btn">Sửa</button>
            <button class="cancel-btn">Hủy</button>
            <button class="return">Trả</button>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>


<script src="LichSuDatBan/js/LichSuDatBan.js"></script>
<!-- Footer -->
<div data-include="Header_Footer/jsp/Footer.jsp"></div>
</body>
</html>