<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Boolean success = (Boolean) request.getAttribute("success");
    String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Kết Quả Đặt Bàn</title>
</head>
<body>
<h1>Kết Quả Đặt Bàn</h1>
<p style="color: <%= success ? "green" : "red" %>;">
    <%= message %>
</p>
<a href="pages/Dat_ban.jsp">Quay lại trang đặt bàn</a>
</body>
</html>
