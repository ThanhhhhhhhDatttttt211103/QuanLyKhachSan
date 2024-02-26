create database BTL_QuanLyKhachSan
Go

use BTL_QuanLyKhachSan
go

CREATE TABLE tNhanVien(
	MaNhanVien nvarchar(20) NOT NULL,
	TenNhanVien nvarchar(50) NOT NULL,
	CCCD nvarchar(20) NOT NULL,
	GioiTinh nvarchar(10),
	DiaChi nvarchar(50),
	DienThoai nvarchar(10),
	NgaySinh date,
	Anh nvarchar(max),
	ChucVu nvarchar(max),
	Luong int
	CONSTRAINT PK_NV PRIMARY KEY(MaNhanVien),
)
Go


CREATE TABLE tUSer(
	MaNhanVien nvarchar(20) NOT NULL,
	Username nvarchar(20) NOT NULL,
	Pass nvarchar(max) NOT NULL,
	Quyen int,
	CONSTRAINT PK_User PRIMARY KEY(MaNhanVien),
	CONSTRAINT FK_User FOREIGN KEY(MaNhanVien) REFERENCES tNhanVien(MaNhanVien),	
)
Go


CREATE TABLE tKhachHang(
	MaKhachHang nvarchar(20) NOT NULL,
	TenKhachHang nvarchar(200),
	NgaySinh Date,
	GioiTinh real,
	DiaChi nvarchar(50),
	DienThoai nvarchar(20),
	CCCD nvarchar(20),
	NgayThue date,
	GhiChu nvarchar(200)
	CONSTRAINT PK_KH PRIMARY KEY(MaKhachHang)
)
Go

CREATE TABLE tLoaiPhong(
	MaLoai nvarchar(20) NOT NULL,
	TenLoaiPhong nvarchar(50),
	CONSTRAINT PK_LP PRIMARY KEY(MaLoai),
)
Go

CREATE TABLE tPhong(
	MaPhong nvarchar(20) NOT NULL,
	MaLoai nvarchar(20)  NOT NULL,
	DonGiaPhong int
	CONSTRAINT PK_Phong PRIMARY KEY(MaPhong),
	CONSTRAINT FK_Phong FOREIGN KEY(MaLoai) REFERENCES tLoaiPhong(MaLoai),
)
Go
CREATE TABLE tPhieuDat(
	MaPhieuDat nvarchar(20) NOT NULL,
	MaKhachHang nvarchar(20) NOT NULL,
	NgayDenDuKien datetime,
	NgayDiDuKien datetime,
	CONSTRAINT PK_PD PRIMARY KEY(MaPhieuDat),
	CONSTRAINT FK_PD FOREIGN KEY(MaKhachHang) REFERENCES tKhachHang(MaKhachHang),
)
Go

CREATE TABLE tPhieuThue(
	MaPhieuThue nvarchar(20) NOT NULL,
	MaPHieuDat nvarchar(20) NOT NULL,
	MaPhong nvarchar(20) NOT NULL,
	ThoiGianLapPT datetime,
	ThoiGianCheckIn datetime,
	ThoiGianCheckOut datetime,
	CONSTRAINT PK_PT PRIMARY KEY(MaPhieuThue),
	CONSTRAINT FK_PT1 FOREIGN KEY(MaPhong) REFERENCES tPhong(MaPhong),
	CONSTRAINT FK_PT2 FOREIGN KEY(MaPHieuDat) REFERENCES tPhieuDat(MaPHieuDat),
)
Go

CREATE TABLE tChiTietPhongDat(
	MaPhieuDat nvarchar(20) NOT NULL,
	MaPhong nvarchar(20)  NOT NULL,
	SoLuong int
	CONSTRAINT PK_CTPD PRIMARY KEY(MaPhieuDat, MaPhong),
	CONSTRAINT FK_CTPD1 FOREIGN KEY(MaPhong) REFERENCES tPhong(MaPhong),
	CONSTRAINT FK_CTPD2 FOREIGN KEY(MaPhieuDat) REFERENCES tPhieuDat(MaPhieuDat),
)
Go

CREATE TABLE tDichVu(
	MaDichVu nvarchar(20) NOT NULL,
	TenDichVu nvarchar(50) NOT NULL,
	CONSTRAINT PK_LoaiDV PRIMARY KEY(MaDichVu),
)
Go

CREATE TABLE tSanPham(
	MaSanPham nvarchar(20) NOT NULL,
	MaDichVu nvarchar(20) NOT NULL,
	TenSanPham nvarchar(50),
	DonGiaSP int,
	DonViTinh nvarchar(50),
	CONSTRAINT PK_DV PRIMARY KEY(MaSanPham),
	CONSTRAINT FK_DV FOREIGN KEY(MaDichVu) REFERENCES tDichVu(MaDichVu),
)
Go




CREATE TABLE tHoaDon(
	MaHoaDon nvarchar(20) NOT NULL,
	MaNhanVien nvarchar(20) NOT NULL,
	MaPhieuDat nvarchar(20) NOT NULL,
	TongTien int,
	NgayLapHoaDon datetime,
	GhiChu nvarchar(max),
	CONSTRAINT PK_HD PRIMARY KEY(MaHoaDon),
	CONSTRAINT FK_HD1 FOREIGN KEY(MaPhieuDat) REFERENCES tPhieuDat(MaPhieuDat),
	CONSTRAINT FK_HD2 FOREIGN KEY(MaNhanVien) REFERENCES tNhanVien(MaNhanVien),
)
Go


CREATE TABLE tChiTietSanPham(
	MaPhieuThue nvarchar(20) NOT NULL,
	MaSanPham nvarchar(20) NOT NULL,
	SoLuong int,
	CONSTRAINT PK_CTHD PRIMARY KEY(MaPhieuThue,MaSanPham),
	CONSTRAINT FK_CTHD2 FOREIGN KEY(MaSanPham) REFERENCES tSanPham(MaSanPham),
	CONSTRAINT FK_CTHD3 FOREIGN KEY(MaPhieuThue) REFERENCES tPhieuThue(MaPhieuThue),
)
Go