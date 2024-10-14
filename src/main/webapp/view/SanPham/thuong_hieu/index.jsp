<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SanPham</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body>
<h1>Quản lý thương hiệu</h1>
<form method="post" action="/thuong-hieu/add">
    <div>
        <label>Tên Thương Hiệu</label>
        <input type="text" name="tenThuongHieu" value="${data1.tenThuongHieu}">
    </div>
    <div>
        <div>
            <label>Trạng Thái</label>
            <div>
                <input type="radio" id="active" name="trangThai" value="1"
                       <c:if test="${data1.trangThai == 1}">checked</c:if> >
                <label for="active">Đang hoạt động</label>
            </div>
            <div>
                <input type="radio" id="inactive" name="trangThai" value="0"
                       <c:if test="${data1.trangThai == 0}">checked</c:if> >
                <label for="inactive">Ngừng hoạt động</label>
            </div>
        </div>
    <div>
        <button type="submit">Thêm</button>
        <button type="submit">Sửa</button>
    </div>
</form>
<table class="table" border="1">
    <tr>
        <th>STT</th>
        <th>Tên Thương Hiệu</th>
        <th>Trạng Thái</th>
    </tr>
    <c:forEach items="${dsth}" var="th" varStatus="i">
        <tr>
            <td scope="row">${i.index + 1}</td>
            <td>${th.tenThuongHieu}</td>
            <td>${th.trangThai == 1 ? "Đang hoạt động" : "Ngừng hoạt động"}</td> <!-- Thay sv thành sp -->
        </tr>
    </c:forEach>
</table>

</body>
</html>