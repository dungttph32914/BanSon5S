create database DATN_5SShop
use DATN_5SShop

-- Table: khach_hang
CREATE TABLE khach_hang (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ma_khach_hang VARCHAR(50),
    ho_va_ten NVARCHAR(255),
    ngay_sinh DATE,
    gioi_tinh NVARCHAR(10),
    email NVARCHAR(255),
    so_dien_thoai NVARCHAR(50),
    mat_khau NVARCHAR(255),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: dia_chi
CREATE TABLE dia_chi (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_khach_hang INT FOREIGN KEY REFERENCES khach_hang(id),
    ten_nguoi_nhan NVARCHAR(255),
    dien_thoai_nguoi_nhan NVARCHAR(50),
    dia_chi_chi_tiet NVARCHAR(255),
    xa NVARCHAR(100),
    huyen NVARCHAR(100),
    tinh NVARCHAR(100),
    dia_chi_mac_dinh BIT,
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: xuat_xu
CREATE TABLE xuat_xu (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ten_xuat_xu NVARCHAR(255),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: doanh_muc
CREATE TABLE doanh_muc (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ten_danh_muc NVARCHAR(255),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: thuong_hieu
CREATE TABLE thuong_hieu (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ten_thuong_hieu NVARCHAR(255),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: san_pham
CREATE TABLE san_pham (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_xuat_xu INT FOREIGN KEY REFERENCES xuat_xu(id),
    id_danh_muc INT FOREIGN KEY REFERENCES doanh_muc(id),
    id_thuong_hieu INT FOREIGN KEY REFERENCES thuong_hieu(id),
    ten_san_pham NVARCHAR(255),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT,
    so_luong_da_ban INT
);

-- Table: mau_sac
CREATE TABLE mau_sac (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ten_mau_sac NVARCHAR(50),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: khoi_luong
CREATE TABLE khoi_luong (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ten_khoi_luong NVARCHAR(50),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: san_pham_chi_tiet
CREATE TABLE san_pham_chi_tiet (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_mau_sac INT FOREIGN KEY REFERENCES mau_sac(id),
    id_khoi_luong INT FOREIGN KEY REFERENCES khoi_luong(id),
    id_san_pham INT FOREIGN KEY REFERENCES san_pham(id),
    url_anh NVARCHAR(255),
    so_luong INT,
    ma_vach NVARCHAR(50),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    trang_thai NVARCHAR(50),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    xoa_mem BIT,
    gia_ban DECIMAL(18, 2)
);

-- Table: gio_hang
CREATE TABLE gio_hang (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_khach_hang INT FOREIGN KEY REFERENCES khach_hang(id)
);

-- Table: gio_hang_chi_tiet
CREATE TABLE gio_hang_chi_tiet (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_san_pham_chi_tiet INT FOREIGN KEY REFERENCES san_pham_chi_tiet(id),
    id_gio_hang INT FOREIGN KEY REFERENCES gio_hang(id),
    so_luong INT,
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: chuc_vu
CREATE TABLE chuc_vu (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ten_chuc_vu NVARCHAR(50)
);

-- Table: nhan_vien
CREATE TABLE nhan_vien (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_chuc_vu INT FOREIGN KEY REFERENCES chuc_vu(id),
    ten_nhan_vien NVARCHAR(255),
    sdt NVARCHAR(50),
    dia_chi NVARCHAR(255),
    email NVARCHAR(255),
    ngay_sinh DATE,
    gioi_tinh NVARCHAR(10),
    mat_khau NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    xoa_mem BIT
);

-- Table: phuong_thuc_thanh_toan
CREATE TABLE phuong_thuc_thanh_toan (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ma NVARCHAR(50),
    ten NVARCHAR(255),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: hoa_don
CREATE TABLE hoa_don (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_khach_hang INT FOREIGN KEY REFERENCES khach_hang(id),
    id_nhan_vien INT FOREIGN KEY REFERENCES nhan_vien(id),
    id_phuong_thuc_thanh_toan INT FOREIGN KEY REFERENCES phuong_thuc_thanh_toan(id),
    ma_hoa_don NVARCHAR(50),
    loai_hoa_don NVARCHAR(50),
    dinh_dang_hoa_don NVARCHAR(50),
    tong_tien DECIMAL(18, 2),
    thanh_tien DECIMAL(18, 2),
	phi_van_chuyen DECIMAL(18, 2),
    ten_phieu_giam_gia NVARCHAR(255),
	dia_chi_nguoi_nhan NVARCHAR(255),
    ngay_dat DATETIME,
    trang_thai NVARCHAR(50),
    mo_ta NVARCHAR(255),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: hoa_don_chi_tiet
CREATE TABLE hoa_don_chi_tiet (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_hoa_don INT FOREIGN KEY REFERENCES hoa_don(id),
    id_san_pham_chi_tiet INT FOREIGN KEY REFERENCES san_pham_chi_tiet(id),
    ma_hoa_don_chi_tiet NVARCHAR(50),
    gia_ban DECIMAL(18, 2),
    so_luong INT,
    mo_ta NVARCHAR(255),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Table: phieu_giam_gia
CREATE TABLE phieu_giam_gia (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ma_phieu_giam_gia NVARCHAR(50),
    ten_phieu_giam_gia NVARCHAR(255),
    loai_phieu_giam_gia NVARCHAR(50),
    gia_tri_giam DECIMAL(18, 2),
    dieu_kien_ap_dung NVARCHAR(255),
    ngay_bat_dau DATETIME,
    ngay_ket_thuc DATETIME,
    id_hoa_don INT FOREIGN KEY REFERENCES hoa_don(id),
    so_luong INT,
    mo_ta NVARCHAR(255),
    trang_thai NVARCHAR(50),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    xoa_mem BIT
);

-- Table: lich_su_thanh_toan
CREATE TABLE lich_su_thanh_toan (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_hoa_don INT FOREIGN KEY REFERENCES hoa_don(id),
    loai_thanh_toan NVARCHAR(50),
    so_tien_thanh_toan DECIMAL(18, 2),
    mo_ta NVARCHAR(255),
    nguoi_tao NVARCHAR(255),
    nguoi_sua NVARCHAR(255),
    ngay_tao DATETIME,
    ngay_sua DATETIME,
    xoa_mem BIT
);

-- Bảng khach_hang
INSERT INTO khach_hang (ma_khach_hang, ho_va_ten, ngay_sinh, gioi_tinh, email, so_dien_thoai, mat_khau, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
('KH001', 'Nguyen Van A', '1990-01-01', 'Nam', 'nguyenvana@gmail.com', '0909123456', 'pass123', 'admin', 'admin', '2023-10-10', '2023-10-11', 0),
('KH002', 'Tran Thi B', '1992-05-05', 'Nu', 'tranthib@gmail.com', '0909234567', 'pass456', 'admin', 'admin', '2023-10-12', '2023-10-13', 0);

-- Bảng dia_chi
INSERT INTO dia_chi (id_khach_hang, ten_nguoi_nhan, dien_thoai_nguoi_nhan, dia_chi_chi_tiet, xa, huyen, tinh, dia_chi_mac_dinh, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
(1, 'Nguyen Van A', '0909123456', '123 Nguyen Trai', 'Xa 1', 'Huyen 1', 'Tinh 1', 1, 'admin', 'admin', '2023-10-10', '2023-10-11', 0),
(2, 'Tran Thi B', '0909234567', '456 Le Loi', 'Xa 2', 'Huyen 2', 'Tinh 2', 1, 'admin', 'admin', '2023-10-12', '2023-10-13', 0);

-- Bảng xuat_xu
INSERT INTO xuat_xu (ten_xuat_xu, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
('Viet Nam', 'admin', 'admin', '2023-10-10', '2023-10-11', 0),
('Han Quoc', 'admin', 'admin', '2023-10-12', '2023-10-13', 0);

-- Bảng doanh_muc
INSERT INTO doanh_muc (ten_danh_muc, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
('Son', 'admin', 'admin', '2023-10-10', '2023-10-11', 0);

-- Bảng thuong_hieu
INSERT INTO thuong_hieu (ten_thuong_hieu, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
('MAC', 'admin', 'admin', '2023-10-10', '2023-10-11', 0),
('3CE', 'admin', 'admin', '2023-10-12', '2023-10-13', 0);

-- Bảng san_pham
INSERT INTO san_pham (id_xuat_xu, id_danh_muc, id_thuong_hieu, ten_san_pham, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem, so_luong_da_ban)
VALUES 
(1, 1, 1, 'Son MAC Ruby Woo', 'admin', 'admin', '2023-10-10', '2023-10-11', 0, 100),
(2, 1, 2, 'Son 3CE Mood Recipe', 'admin', 'admin', '2023-10-12', '2023-10-13', 0, 50);

-- Bảng mau_sac
INSERT INTO mau_sac (ten_mau_sac, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
('Đỏ', 'admin', 'admin', '2023-10-10', '2023-10-11', 0),
('Cam', 'admin', 'admin', '2023-10-12', '2023-10-13', 0);

-- Bảng khoi_luong
INSERT INTO khoi_luong (ten_khoi_luong, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
('3.5g', 'admin', 'admin', '2023-10-10', '2023-10-11', 0),
('4g', 'admin', 'admin', '2023-10-12', '2023-10-13', 0);

-- Bảng san_pham_chi_tiet
INSERT INTO san_pham_chi_tiet (id_mau_sac, id_khoi_luong, id_san_pham, url_anh, so_luong, ma_vach, ngay_tao, ngay_sua, trang_thai, nguoi_tao, nguoi_sua, xoa_mem, gia_ban)
VALUES 
(1, 1, 1, 'https://example.com/mac_ruby_woo.jpg', 100, '1234567890', '2023-10-10', '2023-10-11', 'Available', 'admin', 'admin', 0, 350000),
(2, 2, 2, 'https://example.com/3ce_mood_recipe.jpg', 50, '0987654321', '2023-10-12', '2023-10-13', 'Available', 'admin', 'admin', 0, 400000);

-- Bảng gio_hang
INSERT INTO gio_hang (id_khach_hang)
VALUES 
(1),
(2);

-- Bảng gio_hang_chi_tiet
INSERT INTO gio_hang_chi_tiet (id_san_pham_chi_tiet, id_gio_hang, so_luong, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
(1, 1, 2, 'admin', 'admin', '2023-10-10', '2023-10-11', 0),
(2, 2, 1, 'admin', 'admin', '2023-10-12', '2023-10-13', 0);

-- Bảng chuc_vu
INSERT INTO chuc_vu (ten_chuc_vu)
VALUES 
('Admin'),
('Nhan Vien');

-- Bảng nhan_vien
INSERT INTO nhan_vien (id_chuc_vu, ten_nhan_vien, sdt, dia_chi, email, ngay_sinh, gioi_tinh, mat_khau, ngay_tao, ngay_sua, nguoi_tao, nguoi_sua, xoa_mem)
VALUES 
(1, 'Nguyen Van C', '0909345678', '789 Pham Van Dong', 'nguyenvanc@gmail.com', '1980-01-01', 'Nam', 'pass789', '2023-10-10', '2023-10-11', 'admin', 'admin', 0),
(2, 'Le Thi D', '0909456789', '123 Hoang Hoa Tham', 'lethid@gmail.com', '1995-03-05', 'Nu', 'pass321', '2023-10-12', '2023-10-13', 'admin', 'admin', 0);

-- Bảng phuong_thuc_thanh_toan
INSERT INTO phuong_thuc_thanh_toan (ma, ten, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
('COD', 'Thanh toán khi nhận hàng', 'admin', 'admin', '2023-10-10', '2023-10-11', 0),
('Online', 'Thanh toán online', 'admin', 'admin', '2023-10-12', '2023-10-13', 0);

-- Bảng hoa_don
INSERT INTO hoa_don (id_khach_hang, id_nhan_vien, id_phuong_thuc_thanh_toan, ma_hoa_don, loai_hoa_don, dinh_dang_hoa_don, tong_tien, phi_van_chuyen, ten_phieu_giam_gia, ngay_dat, trang_thai, mo_ta, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
(1, 1, 1, 'HD001', 'Ban le', 'Online', 700000, 20000, 'SALE2023', '2023-10-10', 'Processed', 'Hoa don thanh toan', 'admin', 'admin', '2023-10-10', '2023-10-11', 0);

-- Bảng hoa_don_chi_tiet
INSERT INTO hoa_don_chi_tiet (id_hoa_don, id_san_pham_chi_tiet, ma_hoa_don_chi_tiet, gia_ban, so_luong, mo_ta, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
(1, 1, 'HDCT001', 350000, 2, 'Son MAC Ruby Woo', 'admin', 'admin', '2023-10-10', '2023-10-11', 0),
(1, 2, 'HDCT002', 400000, 1, 'Son 3CE Mood Recipe', 'admin', 'admin', '2023-10-12', '2023-10-13', 0);

-- Bảng phieu_giam_gia
INSERT INTO phieu_giam_gia (ma_phieu_giam_gia, ten_phieu_giam_gia, loai_phieu_giam_gia, gia_tri_giam, dieu_kien_ap_dung, ngay_bat_dau, ngay_ket_thuc, id_hoa_don, so_luong, mo_ta, trang_thai, ngay_tao, ngay_sua, nguoi_tao, nguoi_sua, xoa_mem)
VALUES 
('SALE2023', 'Khuyen mai cuoi nam', 'Phieu giam gia', 50000, 'Don tren 500K', '2023-09-01', '2023-12-31', 1, 10, 'Giam gia cuoi nam', 'Active', '2023-10-10', '2023-10-11', 'admin', 'admin', 0);

-- Bảng lich_su_thanh_toan
INSERT INTO lich_su_thanh_toan (id_hoa_don, loai_thanh_toan, so_tien_thanh_toan, mo_ta, nguoi_tao, nguoi_sua, ngay_tao, ngay_sua, xoa_mem)
VALUES 
(1, 'COD', 720000, 'Thanh toan khi nhan hang', 'admin', 'admin', '2023-10-10', '2023-10-11', 0),
(1, 'Online', 720000, 'Thanh toan online', 'admin', 'admin', '2023-10-12', '2023-10-13', 0);
