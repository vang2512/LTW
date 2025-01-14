<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Your Page Title Here</title>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Mat_hang.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
</head>
<body>
<!-- Header -->
<jsp:include page="/components/Header.jsp" />
<script src="${pageContext.request.contextPath}/js/Header_Footer.js" defer></script>
<div class="container">
  <!-- Sidebar -->
  <aside class="sidebar">
    <ul>
      <li>Tất Cả</li>
      <li>Cà Phê
        <ul style="list-style-type: disc; padding-left: 25px;">
          <li>Cà Phê Highlight</li>
          <li> Cà Phê Việt Nam</li>
          <li>Cà Phê Máy</li>
          <li> Cold Brew</li>
        </ul>
      </li>
      <li>Trà Trái Cây - HiTea
        <ul style="list-style-type: disc; padding-left: 25px;">
          <li>Trà Trái Cây</li>
          <li>Hi-Tea</li>
        </ul>
      </li>
      <li>Trà Sữa
        <ul style="list-style-type: disc; padding-left: 25px;">
          <li>Trà Sữa</li>
        </ul>
      </li>
      <li>Thức Uống Đá Xay
        <ul style="list-style-type: disc; padding-left: 25px;">
          <li>Đá xay dầm milo</li>
        </ul>
      </li>
      <li>Bánh & Snack
        <ul style="list-style-type: disc; padding-left: 25px;">
          <li>Bánh mặn</li>
          <li> Bánh ngọt</li>
          <li>Bánh Pastry</li>
        </ul>
      </li>
      <li>Thưởng Thức Tại Nhà
        <ul style="list-style-type: disc; padding-left: 25px;">
          <li>Cà phê gói</li>
        </ul>
      </li>
    </ul>
  </aside>
  <!-- Product Grid -->
  <main class="products">
    <div class="filter-product">
      <!-- Thanh lọc -->
      <div class="filter-bar">
        <select id="filter" class="filter-dropdown">
          <option value="default">Sắp xếp</option>
          <option value="popular">Bán chạy</option>
          <option value="price-low-high">Giá: Rẻ tới đắt</option>
          <option value="price-high-low">Giá: Đắt tới rẻ</option>
          <option value="30-40">30,000 VND - 40,000 VND</option>
        </select>
      </div>
      <!-- Lưới sản phẩm -->
    </div>
    <h1>Cà Phê Việt Nam</h1>
    <div class="product-grid" data-price="35000" data-popular="2">
      <c:forEach var="sanPham" items="${cafeList}">
        <div class="product-card">
          <a href="ChiTietSanPhamController?id=${sanPham.id}">
          <img src="${sanPham.hinhAnh}" alt="${sanPham.hinhAnh}">
          </a>
          <h2>${sanPham.tenSanPham}</h2>
          <p>${sanPham.gia}đ</p>
          <a href="../GioHang/index.html">
            <div class="cart-icon">
              <span class="fas fa-shopping-cart"></span>
            </div>
          </a>
        </div>
      </c:forEach>
    </div>
    <h1>Nước Ép</h1>
    <div class="product-grid" data-price="35000" data-popular="2">
      <c:forEach var="sanPham" items="${nuocEpList}">
        <div class="product-card">
          <a href="ChiTietSanPhamController?id=${sanPham.id}">
            <img src="${sanPham.hinhAnh}" alt="${sanPham.hinhAnh}">
          </a>
          <h2>${sanPham.tenSanPham}</h2>
          <p>${sanPham.gia}đ</p>
          <a href="../GioHang/index.html">
            <div class="cart-icon">
              <span class="fas fa-shopping-cart"></span>
            </div>
          </a>
        </div>
      </c:forEach>
    </div>
    <h1>Trà</h1>
    <div class="product-grid" data-price="35000" data-popular="2">
      <c:forEach var="sanPham" items="${traList}">
        <div class="product-card">
          <a href="ChiTietSanPhamController?id=${sanPham.id}">
            <img src="${sanPham.hinhAnh}" alt="${sanPham.hinhAnh}">
          </a>
          <h2>${sanPham.tenSanPham}</h2>
          <p>${sanPham.gia}đ</p>
          <a href="../GioHang/index.html">
            <div class="cart-icon">
              <span class="fas fa-shopping-cart"></span>
            </div>
          </a>
        </div>
      </c:forEach>
    </div>
    <h1>Các Loại Bánh</h1>
    <div class="product-grid" data-price="35000" data-popular="2">
      <c:forEach var="sanPham" items="${banhList}">
        <div class="product-card">
          <a href="ChiTietSanPhamController?id=${sanPham.id}">
            <img src="${sanPham.hinhAnh}" alt="${sanPham.hinhAnh}">
          </a>
          <h2>${sanPham.tenSanPham}</h2>
          <p>${sanPham.gia}đ</p>
          <a href="../GioHang/index.html">
            <div class="cart-icon">
              <span class="fas fa-shopping-cart"></span>
            </div>
          </a>
        </div>
      </c:forEach>
    </div>



  </main>
</div>
<script src="${pageContext.request.contextPath}/js/Mat_hang.js"></script>
<!-- Footer -->
<jsp:include page="/components/Header.jsp" />
</body>