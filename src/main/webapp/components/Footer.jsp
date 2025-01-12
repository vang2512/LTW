<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <title>Title</title>
</head>
<style>
  @import url('https://fonts.googleapis.com/css?family=Merienda+One&family=Nunito:wght@200; 300;400;500;600&display=swap');
  *{
    font-family: 'Yanone', sans-serif ;
    margin:0;
    box-sizing: border-box;
    outline: none; border: none;
    text-decoration: none;
    text-transform: capitalize;

  }
  :root{
    --main-color: #be9c79;
    --black: #333;
    --white: #fff;
    --light-color: #666;
    --border: 2rem solid var(--black);
    --box-shadow:0 .5rem 1rem rgba(0,0,0,.1);
  }
  html{
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
    background-image: url("${pageContext.request.contextPath}/assets/images/header/header.jpg");
    color: #eee;
    margin-top: 50px;
    padding: 20px;
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
    margin-bottom: 10px;
    font-size: 18px;
    margin-left: 38px;
    color: #fff;
  }
  .footer-section ul {
    list-style-type: none;
  }

  .footer-section ul li {
    margin-bottom: 5px;

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
  .social-media-icons a{
    width: 20px;
    height: 50px;
    color:#fff
  }
  .footer-bottom {
    border-top: 1px solid #555;
    margin-top: 20px;
    padding-top: 10px;
    font-size: 12px;
    text-align: center;
    color: #999;
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
        Đặt hàng: <a href="tel:18006936">1800 6936</a><br>
        Địa chỉ: 67 Đinh Bộ Lĩnh, P.26, Q.Bình Thạnh, TP.Hồ Chí Minh
      </p>
      <div class="social-media-icons">
        <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook"></i></a>
        <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
      </div>
    </div>
  </div>
  <div class="footer-bottom">
    Công ty cổ phần thương mại dịch vụ Trà Cà Phê VN<br>
    Mã số DN: 0312867172 do Sở Kế hoạch và Đầu tư TP. HCM cấp ngày 23/07/2014.<br>
    Người đại diện: NGÔ NGUYỄN KHA<br>
    Địa chỉ: 86-88 Cao Thắng, Phường 04, Quận 3, TP Hồ Chí Minh &nbsp; | &nbsp;
    Điện thoại: (028) 7107 8079 &nbsp; | &nbsp; Email: <a href="mailto:hi@coffee3talents.vn">hi@coffee3talents.vn</a><br>
    © 2014-2022 Công ty cổ phần thương mại dịch vụ Trà Cà Phê VN. Mọi quyền bảo lưu.
  </div>
</footer>
</body>
</html>

