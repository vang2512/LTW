<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
    <title>Login Page</title>
    <link rel="stylesheet" href="../css/style_login.css">
</head>

<body>
<div class="login-container">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="">
    </div>
    <form class="login-form" action="${pageContext.request.contextPath}/login" method="post">
        <input type="text" name="email" placeholder="Email or Phone" required>
        <input type="password" name="password" placeholder="Password" required>
        <div class="form-links">
            <a href="forgot_password.html" class="forgot-password">Quên mật khẩu?</a>
            <a href="SignUp.html" class="sign-up">Đăng ký</a>
        </div>
        <button type="submit">Đăng nhập</button>
        <!-- Hiển thị thông báo lỗi bên dưới nút Đăng nhập -->
        <c:if test="${not empty errorMessage}">
            <div class="error-message">
                    ${errorMessage}
            </div>
        </c:if>
    </form>
</div>
</body>

</html>