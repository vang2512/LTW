<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/TrangChu/css/TrangChu.css">
    <title>Your Page Title Here</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Archivo:ital,wght@0,100..900;1,100..900&family=Source+Sans+3:ital,wght@0,200..900;1,200..900&family=Yanone+Kaffeesatz:wght@200..700&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<body>
<!-- Header -->
<jsp:include page="/Header_Footer/jsp/Header.jsp" />
<script src="${pageContext.request.contextPath}/DatBan/js/Header_Footer.js" defer></script>
<!-- Home-->
<div class="home-bg">
    <section class="home" id="home">
        <div class="noi_dung">
            <h3>Coffee 3Talents</h3>
            <p>Hội tụ tài năng - Từ mỗi hạt cà phê đến từng tách cà phê,
                chúng tôi mang đến những hương vị trọn vẹn và những trải nghiệm đáng nhớ.</p>
            <a href="#about" class="btn">about us</a>
        </div>
    </section>
</div>
<!-- New Product-->
<div class="carousel">
    <div class="sp_moi">
        <div class="label">new</div>
        <h3>Cappuccino</h3>
        <a href="../ChiTietSP/ChiTietSP.html">
            <img src="Images/campucio.jpg" alt="Sản phẩm 1">
        </a>
        <div class="container">
            <div class="gia">50,000 VND</div>
            <a href="../GioHang/index.html">
                <div class="giohang">thêm giỏ hàng</div>
            </a>
        </div>
    </div>
    <div class="sp_moi">
        <div class="label">new</div>
        <h3>Bánh Tiramisu</h3>
        <img src="Images/tinavisu.jpg" alt="Sản phẩm 2">
        <div class="container">
            <div class="gia">60,000 VND</div>
            <div class="giohang">thêm giỏ hàng</div>
        </div>
    </div>
    <div class="sp_moi">
        <div class="label">new</div>
        <h3>Trà Chanh Dây</h3>
        <img src="Images/tra.jpg" alt="Sản phẩm 3">
        <div class="container">
            <div class="gia">45,000 VND</div>
            <div class="giohang">thêm giỏ hàng</div>
        </div>
    </div>
    <div class="sp_moi">
        <div class="label">new</div>
        <h3>Nước Ép Ổi</h3>
        <img src="Images/ep.jpg" alt="Sản phẩm 5">
        <div class="container">
            <div class="gia">55,000 VND</div>
            <div class="giohang">thêm giỏ hàng</div>
        </div>
    </div>
</div>
<!--Bestseller Product-->
<div class="best-sellers">
    <h2>Sản phẩm bán chạy</h2>
    <div class="carousel_bt">
        <div class="sp_banchay">
            <div class="label_bt">best seller</div>
            <h3>Bạc xỉu</h3>
            <img src="Images/bacxiu.jpg" alt="Sản phẩm 1">
            <div class="container_bt">
                <div class="gia">45,000 VND</div>
                <div class="giohang">thêm giỏ hàng</div>
            </div>
        </div>
        <div class="sp_banchay">
            <div class ="label_bt">best seller</div>
            <h3>Nước Ép Bơ</h3>
            <img src="Images/BƠ.jpg" alt="Sản phẩm 2">
            <div class="container_bt">
                <div class="gia">55,000 VND</div>
                <div class="giohang">thêm giỏ hàng</div>
            </div>
        </div>
        <div class="sp_banchay">
            <h3>Trà đào</h3>
            <img src="Images/TraDao.jpg" alt="Sản phẩm 3">
            <div class="container_bt">
                <div class="gia">30,000 VND</div>
                <div class="giohang">thêm giỏ hàng</div>
            </div>
        </div>
        <div class="sp_banchay">
            <h3>Bánh Mỳ Bơ tỏi</h3>
            <img src="Images/banhmiphomaibotoi.jpg" alt="Sản phẩm 4">
            <div class="container_bt">
                <div class="gia">40,000 VND</div>
                <div class="giohang">thêm giỏ hàng</div>
            </div>
        </div>
        <div class="sp_banchay">
            <h3>Cafe Đen</h3>
            <img src="Images/cafe_đen.jpg" alt="Sản phẩm 5">
            <div class="container_bt">
                <div class="gia">30,000 VND</div>
                <div class="giohang">thêm giỏ hàng</div>
            </div>
        </div>
        <div class="sp_banchay">
            <h3>Trà sữa phô mai</h3>
            <img src="Images/trasuaphomai.jpg" alt="Sản phẩm 6">
            <div class="container_bt">
                <div class="gia">60,000 VND</div>
                <div class="giohang">thêm giỏ hàng</div>
            </div>
        </div>
        <div class="sp_banchay">
            <h3>Bánh MoChi Trà Xanh</h3>
            <img src="Images/mochitraxanh.jpg" alt="Sản phẩm 7">
            <div class="container_bt">
                <div class="gia">60,000 VND</div>
                <div class="giohang">thêm giỏ hàng</div>
            </div>
        </div>
        <div class="sp_banchay">
            <h3>Trà Sữa Dâu Tây</h3>
            <img src="Images/trasuadautay.jpg" alt="Sản phẩm 8">
            <div class="container_bt">
                <div class="gia">55,000 VND</div>
                <div class="giohang">thêm giỏ hàng</div>
            </div>
        </div>
    </div>
</div>
<!--Product Category-->
<section class="about" id="about" >
    <div class="image">
        <img src="${pageContext.request.contextPath}/Images/food.jpg" alt="">
    </div>
    <div class="noi_dung">
        <h3>A cup of coffee can complete your day</h3>
        <p>Hãy đến với Coffee 3Talents, nơi mỗi tách cà phê không chỉ là thức uống mà còn là trải nghiệm.
            Không gian ấm cúng và thân thiện sẽ biến mỗi khoảnh khắc của bạn thành những kỷ niệm đáng nhớ.
            Một tách cà phê ở đây có thể hoàn thiện cả ngày của bạn!</p>
        <a href="#menu" class="btn">our menu</a>
    </div>
</section>
<section class="menu">
    <div class="box-container">
        <div class="box">
            <img src="${pageContext.request.contextPath}/Images/icon1.jpg" alt="" class="ic">
            <h3>cafe</h3>
            <p>
                Cà phê không chỉ là thức uống mà là trải nghiệm. Với hương vị đa dạng, mỗi tách cà phê mang đến sự kết nối và cảm hứng.
                Hãy để cà phê là phần không thể thiếu trong hành trình thưởng thức của bạn!
            </p>
        </div>
        <div class="box">
            <img src="${pageContext.request.contextPath}/Images/icon4.jpg" alt="">
            <h3>trà</h3>
            <p>
                Trà là thức uống mà còn là nghệ thuật. Từ trà xanh đến trà thảo mộc, mỗi tách trà mang lại cảm giác thư giãn và kết nối.
                Hãy để trà đồng hành cùng bạn trong những khoảnh khắc yên bình của cuộc sống.
            </p>
        </div>
        <div class="box">
            <img src="${pageContext.request.contextPath}/Images/icon3.jpg" alt="" class="ic">
            <h3>Bánh Ngọt</h3>
            <p>
                Bánh không chỉ mang lại cho chúng ta những hương vị đa dạng thỏa mãn vị giác, mà còn cho ta thấy được vẻ đẹp sáng tạo dưới nhiều
                thức khác nhau.
            </p>
        </div>
        <div class="box">
            <img src="${pageContext.request.contextPath}/Images/icon4.jpg" alt="">
            <h3>nước ép</h3>
            <p>
                Nước ép là thức uống từ trái cây hoặc rau củ tươi, giàu vitamin và dưỡng chất,
                vừa giải khát vừa hỗ trợ sức khỏe, làm đẹp da và thanh lọc cơ thể.
            </p>
        </div>
    </div>
</section>
<!--Space Shop-->
<div class="title">Không Gian Quán</div>
<div class="space">
    <div class="image_space_1">
        <div class="image-container">
            <img src="Images/ngoai.jpg" class="sp_1">
            <div class="overlay">
                <span class="overlay-text">Ngoài Trời</span>
            </div>
        </div>
        <div class="image-container">
            <img src="Images/trongnha.jpg" class="sp_2">
            <div class="overlay">
                <span class="overlay-text">Trong Quán</span>
            </div>
        </div>
    </div>
    <div class="image_space_2">
        <div class="image-container">
            <img src="Images/phongrieng.png" class="sp_3">
            <div class="overlay">
                <span class="overlay-text">Phòng Riêng</span>
            </div>
        </div>
    </div>
</div>
<!--Event News-->
<div class="carousel-title" id="contact">Tin Tức & Sự Kiện</div>
<section class="tintuc_sk">
    <div class="section-content">
        <div class="slider-container swiper">
            <div class="slider-wrapper">
                <ul class="list swiper-wrapper">
                    <li class="item_ttsk swiper-slide">
                        <img src="${pageContext.request.contextPath}/Images/tintuc_2.jpg" alt="ảnh" class="tintuc">
                        <p class="nd_sk">
                            Thương hiệu cafe của chúng tôi chính thức ra mắt trên thị trường quốc tế, đánh dấu bước phát triển mới trong hành trình vươn tầm thế giới.
                        </p>
                    </li>
                    <li class="item_ttsk swiper-slide">
                        <img src="Images/tintuc_4.jpg" alt="ảnh" class="tintuc">
                        <p class="nd_sk">
                            Mùa Giáng sinh rộn ràng: khi tổng hóa đơn trên 120K, nhận ngay một ly đá thiết kế độc quyền để trang trí Giáng sinh.
                        </p>
                    </li>
                    <li class="item_ttsk swiper-slide">
                        <img src="Images/tintuc_!.jpg" alt="ảnh" class="tintuc">
                        <p class="nd_sk">
                            Chào đón Tết: Từ ngày 29/1 đến 1/2, mua một loại Cafe ngẫu nhiên sẽ được tặng một ly nước theo yêu cầu.
                        </p>
                    </li>
                    <li class="item_ttsk swiper-slide">
                        <img src="Images/tintuc_3.jpg" alt="ảnh" class="tintuc">
                        <p class="nd_sk">
                            Cùng bạn bè đón Giáng Sinh: chỉ cần có Một bánh Mochi trà xanh trong giỏ hàng, bạn sẽ được giảm 30% trên tổng hóa đơn!</p>
                    </li>
                    <li class="item_ttsk swiper-slide">
                        <img src="Images/tintuc_5.jpg" alt="ảnh" class="tintuc">
                        <p class="nd_sk">
                            Trải nghiệm vị cafe mới lạ với dòng sản phẩm giới hạn, chỉ có tại cửa hàng trong tháng 12.
                        </p>
                    </li>
                </ul>
                <div class="swiper-pagination"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/TrangChu/js/TrangChu.js"></script>
<!-- Footer -->
<jsp:include page="/Header_Footer/jsp/Footer.jsp" />
</body>
</html>
