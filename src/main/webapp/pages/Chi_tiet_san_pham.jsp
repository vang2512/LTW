<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Chi_tiet_san_pham.css">
  <title>Title</title>
</head>
<body>
<!-- Header-->
<jsp:include page="/components/Header.jsp" />
<script src="${pageContext.request.contextPath}/js/Header_Footer.js" defer></script>
<!--Detail Product-->
<div class="container">
  <div class="image-section">
    <img src="${sanPham.hinhAnh}" alt="Image of drink">
  </div>
  <div class="details-section">
    <h1>${sanPham.tenSanPham}</h1>
    <div class="price">${sanPham.gia}đ</div>
    <div class="size-selection">
      <label class="tex">Chọn size (bắt buộc)</label>
      <div class="size-options">
        <button>Nhỏ + 0 đ</button>
        <button>Vừa + 4.000 đ</button>
        <button>Lớn + 14.000 đ</button>
      </div>
    </div>
    <div class="topping-selection">
      <label class="tex">Mô Tả</label>
      <p class="description">${sanPham.moTa}</p>
    </div>
    <p class="voucher-description">Nhận giảm giá 10% khi mua từ 2 sản phẩm trở lên!</p>
    <div class="order-button">
      <a href="GioHang.html">
        <button>Thêm Giỏ Hàng</button>
      </a>
    </div>
  </div>
</div>
<div class="carousel-container">
  <h1>Sản Phẩm Liên Quan</h1>
  <div class="carousel">
    <div class="sp_moi">
      <h3>Cafe đen</h3>
      <img src="../ChiTietSP/Images/cafe_đen.jpg" alt="Sản phẩm 1">
      <div class="container_gg">
        <div class="gia">30,000 VND</div>
        <div class="giohang">thêm giỏ hàng</div>
      </div>
    </div>
    <div class="sp_moi">
      <h3>Cafe sữa muối</h3>
      <img src="../assets/images/menu/coffee/cafe_sua_muoi.jpg" alt="Sản phẩm 2">
      <div class="container_gg">
        <div class="gia">50,000 VND</div>
        <div class="giohang">thêm giỏ hàng</div>
      </div>
    </div>
    <div class="sp_moi">
      <h3>Bạc Xỉu</h3>
      <img src="../ChiTietSP/Images/bacxiu.jpg" alt="Sản phẩm 3">
      <div class="container_gg">
        <div class="gia">45,000 VND</div>
        <div class="giohang">thêm giỏ hàng</div>
      </div>
    </div>
    <div class="sp_moi">
      <h3>Cafe Phin</h3>
      <img src="../assets/images/menu/coffee/caffeephinnong.jpg" alt="Sản phẩm 4">
      <div class="container_gg">
        <div class="gia">30,000 VND</div>
        <div class="giohang">thêm giỏ hàng</div>
      </div>
    </div>
  </div>
</div>
<script src="${pageContext.request.contextPath}/js/Chi_tiet_san_pham.js"></script>
<!-- Footer -->
<jsp:include page="/components/Footer.jsp" />
</body>
</html>