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
    <h1>Cold Brew</h1>
    <div class="product-grid">
      <div class="product-card" data-price="8000000" data-popular="2">
        <img src="assets/images/menu/coffee/bacxiu.jpg" alt="Cold Brew">
        <h2>Cold Brew</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="8000000" data-popular="2">
        <img src="Images/coldbrewkimquat.jpg" alt="Ccoldbrewkimquat">
        <h2>Cold Brew Kim Quất</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="8000000" data-popular="2">
        <img src="Images/coldbrewtruyenthong.jpg" alt="coldbrewtruyenthong">
        <h2>Cold Brew Truyền thống</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="8000000" data-popular="2">
        <img src="Images/coldbrewque.jpg" alt="coldbrewque">
        <h2>Cold Brew Quế</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
    </div>
    <h1>Trái Cây Xay</h1>
    <div class="product-grid">
      <div class="product-card" data-price="800000" data-popular="4">
        <img src="Images/dưahau.jpg" alt="dưahau">
        <h2>Nước dưa hấu</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/grape_juice.jpg" alt="grape_juice">
        <h2>Nước nho </h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/strawberry.jpg" alt="strawberry">
        <h2>Nước dâu tây</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/kiwibanana.jpg" alt="kiwibanana">
        <h2>Sinh tố kiwi Chuối</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/avocadosmoothie.jpg" alt="avocadosmoothie">
        <h2>Sinh tố bơ</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/nuocchanhday.jpg" alt="nuocchanhday">
        <h2>Nước chanh dây</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/cam.jpg" alt="cam">
        <h2>Nước Cam</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/suatuoivietquattranchau.jpg" alt="suatuoivietquattranchau">
        <h2>Sữa tươi việt quất</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/carrotjuice.jpg" alt="carrotjuice">
        <h2>Nước cà rốt</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
    </div>
    <h1>Trà Trái Cây</h1>
    <div class="product-grid">
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/tradao.jpg" alt="tradao">
        <h2>Trà đào</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/tradaocamsa.jpg" alt="tradaocamsa">
        <h2>Trà đào cam sả</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/travai.jpg" alt="travai">
        <h2>Trà vải</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/Oolong.jpg" alt="Oolong">
        <h2>Trà Ô long</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
    </div>
    <h1> Trà Sữa</h1>
    <div class="product-grid">
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/trasuatranchau.jpg" alt="trasuatranchau">
        <h2>Trà sữa trân châu</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/trasuathaixanh.jpg" alt="trasuathaixanh">
        <h2>Trà sữa thái xanh</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/trasuaphomai.jpg" alt="trasuaphomai">
        <h2>Trà sữa phô mai</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/trasuasocola.jpg" alt="trasuasocola">
        <h2>Trà Socola</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/trasuadautay.jpg" alt="trasuadautay">
        <h2>Trà Dâu Tây</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
    </div>
    <h1>Thức uống đá xay</h1>
    <div class="product-grid">
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/Frappuccino-dâu-tây.jpg" alt="Frappuccino-dâu-tây">
        <h2>Frappuccino dâu tây</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/milodambanhflan.jpg" alt="milodambanhflan">
        <h2>Milo dầm bánh flan</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/mocha machiato.jpg" alt="mocha machiato">
        <h2>Mocha Machiato</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/Mocha-Frappuccino.jpg" alt="Mocha-Frappuccino">
        <h2>Mocha Frappuccino</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/trasuadautay.jpg" alt="trasuadautay">
        <h2>Trà Dâu Tây</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
    </div>
    <h1>Bánh mặn</h1>
    <div class="product-grid">
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/banhmiphomaibotoi.jpg" alt="banhmiphomaibotoi">
        <h2>Bánh mì phô mai bơ tỏi</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/Croissant-pho-mai.jpg" alt="Croissant-pho-mai">
        <h2>Croissant phô mai</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/Croissant-salt-eggs.jpg" alt="Croissant-salt-eggs">
        <h2>Croissant trứng muối</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>

      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/banhmique.jpg" alt="banhmique">
        <h2>Bánh mì que</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
    </div>
    <h1>Bánh ngọt</h1>
    <div class="product-grid">
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/mochichocolate.jpg" alt="mochichocolate">
        <h2>Mochi chocolate</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/mochidautaycheese.jpg" alt="mochidautaycheese">
        <h2>Mochi dâu tây phô mai</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/mochitraxanh.jpg" alt="mochitraxanh">
        <h2>Mochi Trà Xanh</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>

      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/mousseChocolate.jpg" alt="mousseChocolate">
        <h2>Mousse Chocolate</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/mousseTiramisu.jpg" alt="mousseTiramisu">
        <h2>Mousse Tiramisu</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
      <div class="product-card" data-price="45000" data-popular="2">
        <img src="Images/tiramisu.jpg" alt="tiramisu">
        <h2>Tiramisu</h2>
        <p>45.000 đ</p>
        <div class="cart-icon">
          <span class="fas fa-shopping-cart"></span>
        </div>
      </div>
    </div>
  </main>
</div>
<script src="${pageContext.request.contextPath}/js/Mat_hang.js"></script>
<!-- Footer -->
<jsp:include page="/components/Header.jsp" />
</body>