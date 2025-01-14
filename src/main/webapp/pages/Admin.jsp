<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Admin.css">
</head>

<body>
<div class="container">
    <!-- Sidebar Section -->
    <aside>
        <div class="toggle">
            <div class="logo">
                <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="logo">
                <h2>Coffee 3Talents</h2>
            </div>
            <div class="close" id="close-btn">
                <span class="material-symbols-outlined">close</span>
            </div>
        </div>

        <div class="sidebar">
            <a href="#" data-target="analyticsContent" class="active">
                <span>
                    <i class="bi bi-columns-gap"></i>
                </span>
                <h3>Trang chủ</h3>
            </a>
            <a href="#" data-target="usersContent">
                <span>
                   <i class="bi bi-person-square"></i>
                </span>
                <h3>Quản lí khách hàng</h3>
            </a>
            <a href="#" data-target="productsContent">
                    <span class="material-symbols-outlined">
                        local_cafe
                    </span>
                <h3>Quản lí sản phẩm</h3>
            </a>
            <a href="#" data-target="desksContent">
                    <span class="material-symbols-outlined">
                        table_bar
                    </span>
                <h3>Quản lí bàn</h3>
            </a>
            <a href="#" data-target="ordersContent">
                    <span>
                        <i class="bi bi-basket2"></i>
                    </span>
                <h3>Quản lí đơn hàng</h3>
            </a>
            <a href="#" data-target="settingsContent">
                <span class="material-symbols-outlined">settings</span>
                <h3>Cài đặt</h3>
            </a>
        </div>
    </aside>
    <!-- End Of Sidebar Section -->

    <div class="content">
        <!-- Navbar -->
        <div class="nav">
            <div class="search">
                <button>
                    <i class="bi bi-search"></i>
                </button>
                <input type="text" placeholder="Tìm kiếm">
                <i class="bi bi-sliders"></i>
            </div>
            <div class="dark-mode">
                    <span>
                        <i class="bi bi-sun-fill"></i>
                    </span>
                <span>
                        <i class="bi bi-moon-fill"></i>
                    </span>
            </div>
            <div class="profile">
                <div class="icon-btns">
                    <i class="bi bi-bell"></i>
                    <i class="bi bi-chat-dots"></i>
                </div>
                <div class="information">
                    <p>Chào, <b>Anh Tú</b></p>
                    <small class="text-muted">Quản trị viên</small>
                </div>
                <div class="profile-photo">
                    <img src="${pageContext.request.contextPath}/assets/images/managers/admin-1.jpg" alt="Anh Tú">
                </div>
            </div>
        </div>
        <!-- End Of Nav -->

        <!-- Dashboard Content -->
        <div id="dashboardContent" class="content-section">
            <h1>Dashboard Content</h1>
        </div>
        <!-- End Of Dashboard Content -->

        <!-- Users Content -->
        <div id="usersContent" class="content-section">
            <!-- Main Content -->
            <main>
                <div class="users">
                    <div class="top-users-table">
                        <div class="user-text">
                            <h2>Quản lí khách hàng</h2>
                        </div>
                        <div class="user-btn">
                            <div id="delete-user-btn">
                                <a href="#">
                                    <i class="bi bi-dash-circle-fill"></i>
                                    <span>Xóa</span>
                                </a>
                            </div>
                            <div id="add-user-btn">
                                <a href="#">
                                    <i class="bi bi-plus-circle-fill"></i>
                                    <span>Thêm khách hàng mới</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- Users Table -->
                    <div id="users-table">
                        <table>
                            <thead>
                            <tr>
                                <th>STT</th>
                                <th>Tên</th>
                                <th>Địa chỉ</th>
                                <th>Số điện thoại</th>
                                <th>Email</th>
                                <th>Ngày đăng kí</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="user" items="${users}" varStatus="status">
                                <tr>
                                    <!-- Cột STT -->
                                    <td>${status.index + 1}</td>
                                    <td>${user.hoten}</td>
                                    <td>${user.diachi}</td>
                                    <td>${user.sodt}</td>
                                    <td>${user.email}</td>
                                    <td>${user.ngaydk}</td>
                                    <td>
                                        <!-- Nút sửa -->
                                        <button type="button" class="edit-btn"
                                                onclick="showEditForm(${user.id}, '${user.hoten}', '${user.diachi}', '${user.sodt}', '${user.email}', '${user.ngaydk}')">
                                            Sửa
                                        </button>
                                        <!-- Nút xóa -->
                                        <form action="${pageContext.request.contextPath}/users" method="post"
                                              style="display:inline;">
                                            <input type="hidden" name="action" value="delete"/>
                                            <input type="hidden" name="id" value="${user.id}"/>
                                            <button type="submit" class="cancel-btn">Xóa</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- End Of Users Table -->
                </div>
            </main>
            <!-- End Of Main Content -->

            <!-- Add New User -->
            <div id="user-form-modal" class="modal">
                <div class="modal-content">
                    <form id="user-form" action="${pageContext.request.contextPath}/users" method="POST" novalidate>
                        <div class="header-form">
                            <h2>Thêm khách hàng mới</h2>
                            <span class="close-btn">&times;</span>
                        </div>
                        <div class="form-control">
                            <label for="name">Name</label>
                            <input type="text" id="name" placeholder="Nhập tên khách hàng">
                        </div>
                        <div class="form-control">
                            <label for="address">Address</label>
                            <input type="text" id="address" placeholder="Nhập địa chỉ khách hàng"
                                   autocomplete="off">
                        </div>
                        <div class="form-control">
                            <label for="phone">Phone</label>
                            <input type="tel" id="phone" placeholder="Nhập số điện thoại khách hàng"
                                   autocomplete="off">
                        </div>
                        <div class="form-control">
                            <label for="email">Email</label>
                            <input type="email" id="email" placeholder="Nhập email khách hàng" autocomplete="off">
                        </div>
                        <button type="submit">Lưu</button>
                    </form>
                </div>
            </div>
            <!--End Of Add New User -->
        </div>
        <!-- End Of Users Content -->

        <!-- Products Content -->
        <div id="productsContent" class="content-section">
            <main>
                <div class="products">
                    <div class="top-products-table">
                        <div class="product-text">
                            <h2>Quản lí sản phẩm</h2>
                        </div>
                        <div class="product-btn">
                            <div class="product-search">
                                <input type="text" id="searchProduct" placeholder="Tìm kiếm sản phẩm...">
                            </div>
                            <div id="add-product-btn">
                                <a href="#">
                                    <i class="bi bi-plus-circle-fill"></i>
                                    <span>Thêm sản phẩm mới</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- Products Table-->
                    <div id="products-table">
                        <table>
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên sản phẩm</th>
                                <th>Loại sản phẩm</th>
                                <th>Giá</th>
                                <th>Hành động</th>
                            </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                    <!-- End Of Products Table -->
                </div>
            </main>
        </div>
        <!-- End Of Products Content -->

        <!-- Desks Content -->
        <div id="desksContent" class="content-section">
            <main>
                <div class="desks">
                    <div class="top-desks-table">
                        <div class="desk-text">
                            <h2>Quản lí bàn</h2>
                        </div>
                        <div class="desk-btn">
                            <div class="desk-search">
                                <input type="text" id="searchDesk" placeholder="Tìm kiếm bàn...">
                            </div>
                            <div id="add-desk-btn">
                                <a href="#">
                                    <i class="bi bi-plus-circle-fill"></i>
                                    <span>Thêm bàn mới</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- Desks Table-->
                    <div id="desks-table">
                        <table>
                            <thead>
                            <tr>
                                <th>Loại sản phẩm</th>
                                <th>Không gian</th>
                                <th>Số lượng</th>
                                <th>Giá đặt cọc</th>
                                <th>Hành động</th>
                            </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                    <!-- End Of Desks Table -->
                </div>
            </main>
        </div>
        <!-- End Of Desks Content -->

        <!-- Orders Content -->
        <div id="ordersContent" class="content-section">
            <main>
                <div class="orders">
                    <div class="top-orders-table">
                        <div class="order-text">
                            <h2>Quản lí đơn hàng</h2>
                        </div>
                        <div class="order-function">
                            <div class="order-search">
                                <input type="text" id="searchOrder" placeholder="Tìm kiếm đơn hàng...">
                            </div>
                        </div>
                    </div>
                    <!-- Orders Table-->
                    <div id="orders-table">
                        <table>
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên khách hàng</th>
                                <th>Tên sản phẩm</th>
                                <th>Số lượng</th>
                                <th>Giá</th>
                                <th>Trạng thái</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                    <!-- End Of Orders Table -->
                </div>
            </main>
        </div>
        <!-- End OF Orders Content -->

        <!-- Analytics Content -->
        <div id="analyticsContent" class="content-section">
            <!-- Main Content -->
            <main>
                <h1>Phân tích</h1>
                <!-- Analyses -->
                <div class="analyse">
                    <div class="sales">
                        <div class="status">
                            <div class="info">
                                <h3>Tổng danh số</h3>
                                <h1>$65,024</h1>
                            </div>
                            <div class="progress">
                                <svg>
                                    <circle cx="38" cy="38" r="36"></circle>
                                </svg>
                                <div class="percentage">
                                    <p>+81%</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="visits">
                        <div class="status">
                            <div class="info">
                                <h3>Số lần ghé thăm</h3>
                                <h1>24,981</h1>
                            </div>
                            <div class="progress">
                                <svg>
                                    <circle cx="38" cy="38" r="36"></circle>
                                </svg>
                                <div class="percentage">
                                    <p>-48%</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="searches">
                        <div class="status">
                            <div class="info">
                                <h3>Số lượt tìm kiếm</h3>
                                <h1>14,147</h1>
                            </div>
                            <div class="progress">
                                <svg>
                                    <circle cx="38" cy="38" r="36"></circle>
                                </svg>
                                <div class="percentage">
                                    <p>+21%</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Of Analyses -->

                <!-- New Users Section -->
                <div class="new-users">
                    <h2>Khách hàng mới</h2>
                    <div class="user-list">
                        <div class="user">
                            <img src="../assets/images/users/son-tung-mtp.webp" alt="Sơn Tùng M-TP">
                            <h2>Sơn Tùng M-TP</h2>
                            <p>54 phút trước</p>
                        </div>
                        <div class="user">
                            <img src="../assets/images/users/bruno-mars.jpg" alt="Bruno Mars">
                            <h2>Bruno Mars</h2>
                            <p>3 tiếng trước</p>
                        </div>
                        <div class="user">
                            <img src="../assets/images/users/chris-grey.jpg" alt="Chris Grey">
                            <h2>Chris Grey</h2>
                            <p>6 tiếng trước</p>
                        </div>
                        <div class="user">
                            <img src="../assets/images/users/plus.jpg" alt="More Users">
                            <h2>Thêm</h2>
                            <p>Khách hàng mới</p>
                        </div>
                    </div>
                </div>
                <!-- End Of New Users Section -->

                <!-- Recent Orders Table -->
                <div id="recent-orders">
                    <h2>Đơn hàng gần đây</h2>
                    <table>
                        <thead>
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Mã sản phẩm</th>
                            <th>Phương thức thanh toán</th>
                            <th>Trạng thái</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                    <a href="#">Show All</a>
                </div>
                <!-- End Of Recent Orders -->
            </main>
            <!-- End Of Main -->

            <!-- Right Section -->
            <div class="right-section">
                <!-- User Profile -->
                <div class="user-profile">
                    <div class="logo">
                        <img src="images/header/logo.png" alt="logo">
                        <h2>Coffee 3Talents</h2>
                        <p>The coffee house</p>
                    </div>
                </div>
                <!-- End Of User Profile -->

                <!-- Reminders -->
                <div class="reminders">
                    <div class="header">
                        <h2>Lời nhắc nhở</h2>
                        <span>
                            <i class="bi bi-bell"></i>
                        </span>
                    </div>

                    <div class="notification">
                        <div class="icon">
                            <span>
                                <i class="bi bi-volume-up-fill"></i>
                            </span>
                        </div>
                        <div class="content">
                            <div class="information">
                                <h3>Workshop</h3>
                                <small class="text-muted">
                                    08:00 AM - 12:00 PM
                                </small>
                            </div>
                            <span>
                                <i class="bi bi-three-dots-vertical"></i>
                            </span>
                        </div>
                    </div>

                    <div class="notification deactive">
                        <div class="icon">
                            <span>
                                <i class="bi bi-pencil-fill"></i>
                            </span>
                        </div>
                        <div class="content">
                            <div class="info">
                                <h3>Workshop</h3>
                                <small class="text-muted">
                                    08:00 AM - 12:00 PM
                                </small>
                            </div>
                            <span>
                                <i class="bi bi-three-dots-vertical"></i>
                            </span>
                        </div>
                    </div>

                    <div class="notification add-reminder">
                        <div>
                            <span>
                                <i class="bi bi-plus-lg"></i>
                            </span>
                            <h3>Thêm nhắc nhở</h3>
                        </div>
                    </div>
                </div>
                <!-- End Of Reminders -->
            </div>
        </div>
        <!-- End Of Analytics Content -->

        <!-- Settings Content -->
        <div id="settingsContent" class="content-section">
            <h1>Settings Content</h1>
        </div>
        <!-- End Of Settings Content -->
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/Admin.js"></script>
<script>
    //
    const addUserBtn = document.getElementById('add-user-btn');
    const modal = document.getElementById('user-form-modal');
    const closeBtn = document.querySelector('.close-btn');
    addUserBtn.addEventListener('click', function (e) {
        e.preventDefault();
        modal.style.display = 'block';
    });
    closeBtn.addEventListener('click', function () {
        modal.style.display = 'none';
    });
    window.addEventListener('click', function (e) {
        if (e.target === modal) {
            modal.style.display = 'none';
        }
    });
</script>
</body>
</html>