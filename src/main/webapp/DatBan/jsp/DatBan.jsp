<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DatBan/css/DatBan.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt bàn</title>
</head>
<body>
<!-- Header -->
<!-- Header -->
<jsp:include page="/Header_Footer/jsp/Header.jsp" />
<script src="${pageContext.request.contextPath}/DatBan/js/Header_Footer.js" defer></script>
<!-- Container -->
<div class="container">
    <div class="image">
        <img src="${pageContext.request.contextPath}/Images/DatBan.png" alt="Hình minh họa bàn ăn">
        <i>Chú ý: Chỉ được phép sửa và hủy thông tin đặt bàn trong 30' kể từ khi đặt</i>
    </div>
    <div class="form-section">
        <h2>Thông tin đặt bàn</h2>
        <form id="booking-form" method="post" action="${pageContext.request.contextPath}/DatBanServlet">
            <label for="khongGian">Không gian:</label>
            <select id="khongGian" name="khongGian">
                <option value="Ngoài Trời">Ngoài Trời</option>
                <option value="Trong Quán">Trong Quán</option>
                <option value="Phòng Riêng">Phòng Riêng</option>
            </select>

            <label for="soLuong">Số lượng:</label>
            <input type="number" id="soLuong" name="soLuong" min="1" required>

            <label for="ngayDat">Ngày đặt:</label>
            <input type="date" id="ngayDat" name="ngayDat" required>

            <label for="gioDat">Giờ:</label>
            <input type="time" id="gioDat" name="gioDat" required>

            <button id="submit-button" type="submit" disabled>Tiếp tục</button>
        </form>
    </div>

    <!-- Overlay & Popup -->
    <div id="overlay" class="overlay"></div> <!-- Lớp phủ -->
    <div id="confirmation-popup" class="popup">
        <h3>Bạn muốn đặt bàn không?</h3>
        <div class="radio-group">
            <label>
                <input type="radio" name="orderChoice" value="wantOrder">
                Muốn Order
            </label>
            <label>
                <input type="radio" name="orderChoice" value="noOrder">
                Không muốn Order
            </label>
        </div>
        <div class="action-buttons">
            <button id="exit-button" type="button">Thoát</button>
            <button id="continue-button" type="button" disabled>Tiếp tục</button>
        </div>
    </div>
    <div id="message-box" class="message-box"></div>
    <!-- Loading Overlay -->
    <div id="loading-overlay" class="loading-overlay">
        <div class="loading-spinner"></div>
    </div>
</div>
<!-- Footer -->
<script src="${pageContext.request.contextPath}/DatBan/js/DatBan.js"></script>
<jsp:include page="/Header_Footer/jsp/Footer.jsp" />
</body>
</html>
