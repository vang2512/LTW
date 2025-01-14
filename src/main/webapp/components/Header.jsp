<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Archivo:ital,wght@0,100..900;1,100..900&family=Source+Sans+3:ital,wght@0,200..900;1,200..900&family=Yanone+Kaffeesatz:wght@200..700&display=swap"
          rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<style>
    @import url('https://fonts.googleapis.com/css?family=Merienda+One&family=Nunito:wght@200; 300;400;500;600&display=swap');
    * {
        font-family: 'Yanone', sans-serif;
        margin: 0;
        box-sizing: border-box;
        outline: none;
        border: none;
        text-decoration: none;
        text-transform: capitalize;
    }

    :root {
        --main-color: #be9c79;
        --black: #333;
        --white: #fff;
        --light-color: #666;
        --border: 2rem solid var(--black);
        --box-shadow: 0 .5rem 1rem rgba(0, 0, 0, .1);
    }

    html {
        font-size: 60%;
        overflow-x: hidden;
        scroll-padding-top: 6rem;
    }

    section {
        padding: 3rem 2rem;
        max-width: 1200px;
        margin: 0 auto;
    }

    /*Thanh dieu huong trang chu*/
    .header {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        background-image: url("${pageContext.request.contextPath}/assets/images/header/header.jpg");
        background-size: cover;
        z-index: 1000;
    }

    .header .flex {
        display: flex;
        align-items: center;
        justify-content: space-between;
        position: relative;
        padding: 1.5rem 1rem;
    }

    .header .flex .logo img {
        height: 4.8rem;
        margin-right: 2rem;
        border-radius: 30%;
        object-fit: cover;
    }

    .header .flex .navbar {
        display: flex;
        align-items: center;
        width: 100%;
        justify-content: space-between;
    }

    .header .flex .navbar .left a,
    .header .flex .navbar .right a {
        margin: 0 1rem;
        font-size: 1.68rem;
        color: var(--white);
        text-decoration: none;
        transition: color 0.3s ease, text-decoration 0.3s ease;
    }

    .header .flex .navbar .left a:not(:last-child)::after,
    .header .flex .navbar .right a:not(:last-child):not(.user-avatar):not(.dropdown-content a)::after {
        content: "/";
        color: #ccc;
        margin-left: 10px;
    }


    #menu-btn {
        display: none;
        font-size: 1.68rem;
        color: var(--white);
        cursor: pointer;
    }

    .header .flex .navbar .left a:hover,
    .header .flex .navbar .right a:not(.icon):hover {
        color: #d6b38e;
        cursor: pointer;
    }

    .right {
        display: flex;
        align-items: center;
        gap: 1.5rem; /* Khoảng cách giữa các nút */
    }

    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: block;
        position: absolute;
        background-image: url("${pageContext.request.contextPath}/assets/images/header/header.jpg");
        width: 200px;
        box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
        z-index: 1;
        border-radius: 10px;
        opacity: 0;
        transform: translateY(10px);
        transition: opacity 0.55s ease, transform 0.55s ease;
        pointer-events: none;
    }

    .dropdown-content .datban {
        width: 200px;
    }

    .dropdown:hover .dropdown-content {
        opacity: 1;
        transform: translateY(0) translateX(-40%);
        pointer-events: auto;
    }

    .user-avatar:hover + .dropdown-content {
        opacity: 1;
        transform: translateY(0) translateX(-40%);
        pointer-events: auto;
    }

    .dropdown-content a {
        color: var(--white);
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .dropdown-content a:hover {
        color: #757575;
    }

    #search-input {
        width: 0;
        padding: 0.5rem;
        border-radius: 5px;
        background-color: #fff;
        color: #333;
        transition: width 0.5s ease, opacity 0.5s ease;
        opacity: 0;
        position: relative;
        top: -3px;
    }

    #search-icon.active #search-input {
        width: 200px;
        margin-left: 10px;
        padding: 0.5rem;
        opacity: 1;
        top: -3px;
    }

    #clear-btn {
        position: absolute;
        right: 305px;
        top: 48%;
        transform: translateY(-50%);
        font-size: 2rem;
        cursor: pointer;
        color: rgba(19, 19, 19, 0.75);
        display: none;
    }

    #search-icon.active #clear-btn {
        display: block;
    }

    /* Avatar Styles */

    .user-avatar::after {
        content: none;
    }

    .user-avatar img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        border: 2px solid var(--main-color);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        cursor: pointer;
    }

    .user-avatar img:hover {
        transform: scale(1.1);
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    }


</style>
<body>
<!-- Header-->
<header class="header">
    <section class="flex">
        <a href="#home" class="logo">
            <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="">
        </a>
        <nav class="navbar">
            <div class="left">
                <a href="${pageContext.request.contextPath}/pages/Trang_chu.jsp">Trang Chủ</a>
                <a href="#about">About</a>
                <!-- Menu with dropdown options -->
                <div class="dropdown">
                    <a href="${pageContext.request.contextPath}/sanpham" class="mn">Menu</a>
                    <div class="dropdown-content">
                        <a href="../MatHang/matHang.html">Coffee</a>
                        <a href="../MatHang/matHang.html">Trà</a>
                        <a href="../MatHang/matHang.html">Bánh Ngọt</a>
                        <a href="../MatHang/matHang.html">Nước Ép</a>
                    </div>
                </div>
                <div class="dropdown">
                    <a href="${pageContext.request.contextPath}/pages/Dat_ban.jsp">Đặt Bàn</a>
                    <div class="dropdown-content">
                        <a href="${pageContext.request.contextPath}/lichsu" class="datban">Lịch Sử Đặt Bàn</a>
                    </div>
                </div>
                <a href="#contact">Tin Tức & Sự Kiện</a>
            </div>
            <div class="right">
                <a href="#search" class="icon" id="search-icon">
                    <i class="fas fa-search"></i>
                    <input type="text" id="search-input" placeholder="Search...">
                    <span id="clear-btn">&times;</span>
                </a>
                <a href="#giohang" class="icon">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                <div class="dropdown">
                    <a href="#" class="icon user-avatar">
                        <img src="${pageContext.request.contextPath}/assets/images/users/avatar_male.png" alt="User Avatar">
                    </a>
                    <div class="dropdown-content user-menu">
                        <a href="../CaiDat/thongtincanhan.html">Thông tin cá nhân</a>
                        <a href="../CaiDat/lichsuthanhtoan.html">Lịch sử mua hàng</a>
                        <a href="../CaiDat/thaydoimatkhau.html">Thay đổi mật khẩu</a>
                        <a href="../Login/login.html">Đăng Xuất</a>
                    </div>
                </div>
            </div>
        </nav>
        <div id="menu-btn" class="fas fa-bars"></div>
    </section>
</header>
</body>
</html>