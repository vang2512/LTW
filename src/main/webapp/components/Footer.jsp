<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
</head>
<style>
    @import url('https://fonts.googleapis.com/css?family=Merienda+One&family=Nunito:wght@200; 300;400;500;600&display=swap');

    * {
        font-family: "Google Sans", roboto, "Noto Sans Mynamar UI", sans-serif, Tahoma;
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

    footer {
        background-image: url("http://localhost:8080/LTW_war/assets/images/header/header.jpg");
        color: #eee;
        padding-top: 30px;
        font-family: Arial, sans-serif;
    }

    .footer-container {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
        padding: 10px 100px;
    }

    .footer-section {
        margin: 10px;
        flex: 1;
        min-width: 150px;
    }

    .footer-section h4 {
        font-size: 20px;
        margin-bottom: 18px;
        margin-left: 39px;
    }

    .footer-section p {
        margin-bottom: 10px;
    }

    .footer-section p i {
        margin-right: 4px;
    }

    .footer-section ul {
        list-style-type: none;
    }

    .footer-section ul li {
        margin-bottom: 10px;
    }

    .footer-section ul li a {
        color: #eee;
        text-decoration: none;
        font-size: 14px;
    }

    .contact-info {
        font-size: 14px;
        color: #eee;
        margin-left: 40px;
    }

    .contact-info a {
        color: #eee;
        text-decoration: none;
    }

    .social-media-icons {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-top: 10px;
        margin-left: 40px;

    }

    .social-media-icons a {
        width: 20px;
        height: 50px;
        color: #fff
    }

    .social-media-icons a i {
        font-size: 16px;
    }

    .footer-bottom {
        width: 100%;
        border-top: solid 1px #A7815C;
        font-size: 10px;
        color: #999;
        line-height: 1.5;
        text-align: center;
        padding-top: 10px;
        padding-bottom: 15px;
    }
</style>
<body>
<!-- Header-->
<footer>
    <div class="footer-container">
        <div class="footer-section">
            <h4>Giới thiệu</h4>
            <ul>
                <li><a href="#">Về Chúng Tôi</a></li>
                <li><a href="#">Sản phẩm</a></li>
                <li><a href="#">Khuyến mãi</a></li>
                <li><a href="#">Chuyện cà phê</a></li>
                <li><a href="#">Cửa Hàng</a></li>
                <li><a href="#">Tuyển dụng</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h4>Điều khoản</h4>
            <ul>
                <li><a href="#">Điều khoản sử dụng</a></li>
                <li><a href="#">Chính sách bảo mật thông tin</a></li>
                <li><a href="#">Hướng dẫn xuất hóa đơn GTGT</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h4>Liên hệ</h4>
            <p class="contact-info">
                <i class="bi bi-geo-alt-fill"></i>
                Địa chỉ: 67 Đinh Bộ Lĩnh, Q.Bình Thạnh, Hồ Chí Minh
            </p>
            <p class="contact-info">
                <i class="bi bi-telephone-fill"></i>
                Điện thoại: 1800 6936
            </p>
            <p class="contact-info">
                <i class="bi bi-envelope-fill"></i>
                Email: hi@coffee3talents.vn
            </p>
            <div class="social-media-icons">
                <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook"></i></a>
                <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        Công ty cổ phần thương mại dịch vụ Trà Cà Phê VN<br>
        Mã số DN: 0627849892 do Sở Kế hoạch và Đầu tư TP.HCM cấp ngày 15/06/2012. Người đại diện: TRẦN VĂN AN<br>
        Địa chỉ: 86-88 Cao Thắng, Phường 04, Quận 3, TP Hồ Chí Minh &nbsp; | &nbsp;
        Điện thoại: (028) 7024 8089 &nbsp;<br>
        © 2012-2021 Công ty cổ phần thương mại dịch vụ Trà Cà Phê VN mọi quyền bảo lưu.
    </div>
</footer>
</body>
</html>

