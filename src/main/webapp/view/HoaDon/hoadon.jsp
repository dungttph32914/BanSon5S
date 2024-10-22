<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Quản lý Hóa Đơn</title>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 20px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            margin-bottom: 20px;
            text-align: center;
        }
        /* Hiệu ứng cho nút */
        .btn-primary {
            transition: background-color 0.3s, transform 0.2s;
        }
        .btn-primary:hover {
            background-color: #0056b3; /* Màu nền khi hover */
            transform: scale(1.05); /* Tăng kích thước một chút */
        }

        /* Hiệu ứng cho ô chọn */
        .form-select:hover {
            border-color: #80bdff; /* Thay đổi màu viền khi hover */
            box-shadow: 0 0 5px rgba(0, 123, 255, .25); /* Thêm bóng đổ nhẹ */
        }

        /* Hiệu ứng cho hàng bảng */
        .table tbody tr:hover {
            background-color: #f1f1f1; /* Màu nền khi hover trên hàng bảng */
            transition: background-color 0.3s; /* Hiệu ứng chuyển màu */
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Thêm Hóa Đơn</h1>
    <form action="/hien-thi/hoa-don/add" method="post">
        <div class="mb-3">
            <label for="khachHang" class="form-label">Khách Hàng:</label>
            <select class="form-select" name="khachHang" id="khachHang" required>
                <c:forEach items="${dskh}" var="l">
                    <option value="${l.id}">${l.hoTen}</option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label for="nhanVien" class="form-label">Nhân Viên:</label>
            <select class="form-select" name="nhanVien" id="nhanVien" required>
                <c:forEach items="${dsnv}" var="l">
                    <option value="${l.id}">${l.tenNhanVien}</option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label for="phuongThucThanhToan" class="form-label">Phương Thức Thanh Toán:</label>
            <select class="form-select" name="phuongThucThanhToan" id="phuongThucThanhToan" required>
                <c:forEach items="${dspttt}" var="l">
                    <option value="${l.id}">${l.ten}</option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label for="maHD" class="form-label">Mã:</label>
            <input type="text" class="form-control" name="maHD" id="maHD" required>
        </div>

        <div class="mb-3">
            <label for="tongTien" class="form-label">Tổng Tiền:</label>
            <input type="number" class="form-control" name="tongTien" id="tongTien" required>
        </div>

        <div class="mb-3">
            <label for="ngayTao" class="form-label">Ngày Tạo:</label>
            <input type="date" class="form-control" name="ngayTao" id="ngayTao" required>
        </div>

        <div class="mb-3">
            <label for="ngaySua" class="form-label">Ngày Sửa:</label>
            <input type="date" class="form-control" name="ngaySua" id="ngaySua">
        </div>

        <div class="mb-3">
            <label for="ngayThanhToan" class="form-label">Ngày Thanh Toán:</label>
            <input type="date" class="form-control" name="ngayThanhToan" id="ngayThanhToan">
        </div>

        <fieldset class="mb-3">
            <legend class="col-form-label pt-0">Trạng Thái:</legend>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="trangThai" id="trangThai1" value="1">
                <label class="form-check-label" for="trangThai1">Đã Thanh Toán</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="trangThai" id="trangThai2" value="0" checked>
                <label class="form-check-label" for="trangThai2">Chưa Thanh Toán</label>
            </div>
        </fieldset>

        <button type="submit" class="btn btn-primary">Gửi</button>
    </form>
</div>

<div class="container mt-5">
    <h1>Danh Sách Hóa Đơn</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Khách Hàng</th>
            <th scope="col">Nhân Viên</th>
            <th scope="col">PTTT</th>
            <th scope="col">Ma</th>
            <th scope="col">Tổng Tiền</th>
            <th scope="col">Thành Tiền</th>
            <th scope="col">Ngày Tạo</th>
            <th scope="col">Ngày Sửa</th>
            <th scope="col">Ngày Thanh Toán</th>
            <th scope="col">Trạng Thái</th>
            <th scope="col">Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${dshd}" var="hd" varStatus="i">
            <tr>
                <th scope="row">${i.index + 1}</th>
                <td>${hd.khachHang.hoTen}</td>
                <td>${hd.nhanVien.tenNhanVien}</td>
                <td>${hd.phuongThucThanhToan.ten}</td>
                <td>${hd.maHD}</td>
                <td>${hd.tongTien}</td>
                <td>${hd.thanhTien}</td>
                <td><fmt:formatDate value="${hd.ngayTao}" pattern="dd/MM/yyyy"/></td>
                <td><fmt:formatDate value="${hd.ngaySua}" pattern="dd/MM/yyyy"/></td>
                <td><fmt:formatDate value="${hd.ngayThanhToan}" pattern="dd/MM/yyyy"/></td>
x
                <td>
                    <c:if test="${hd.trangThai == 1}">Đã Thanh Toán</c:if>
                    <c:if test="${hd.trangThai == 0}">Chưa Thanh Toán</c:if>
                </td>
                <td>
                    <a class="btn btn-info" href="/hien-thi/hoa-don/detail/${hd.id}">Chi Tiết</a>
                    <a class="btn btn-danger" href="/hien-thi/hoa-don/remove/${hd.id}">Xoa </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-7mNSRPxGqqDO6mP1Bhv12R9en4eTB3twK26PV2ddmkwElzRVXg2jAVTAu7WwG3Ff" crossorigin="anonymous"></script>
</body>
</html>