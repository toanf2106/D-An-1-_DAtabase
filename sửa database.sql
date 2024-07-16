create database test_da_2
use test_da_2
go
create table NhanHang_SP(
Id_Nh int identity(1,1)   primary key,
TenNhanHang nvarchar(100)  ,
);
go
create table size_SP(
Id_Sz int identity(1,1)   primary key ,
Size varchar(10)  ,
);
go
create table color_SP(
Id_Mau int identity(1,1)   primary key,
color nvarchar(100)  
);
go
create table ChatLieu_SP(
Id_Cl int identity(1,1)   primary key,
ChatLieu nvarchar(100)
);
go
create table sanPham(
IdSanPham int identity(1,1)   primary key,
TenSP nvarchar(50)  ,
Gia money  ,
MoTa nvarchar(200) ,
soLuong int  ,
TrangThai bit ,
Id_NhanHang int   references NhanHang_SP(Id_Nh),
Id_Size int   references size_SP(Id_Sz),
Id_Color int   references color_SP(Id_Mau),
Id_ChatLieu int   references ChatLieu_SP(Id_Cl),
);
Create table NhanVien(
	Id_NVien int identity(1,1) primary key,
	Id_Taikhoan int references Taikhoan(ID_Taikhoan),
	HoTen nvarchar(50),
	NgaySinh date,
	Email nvarchar(50),
	SDT nvarchar(13),
	DiaChi nvarchar(100),
);
go
create table Taikhoan(
	ID_Taikhoan int identity(1,1) primary key,
	Taikhoan nvarchar(20),
	Matkhau nvarchar(20),
	chucvu nvarchar(50),
);
go
create table KhachHang(
	Id_KhachHang int identity(1,1) primary key,
	HoTen nvarchar(50),
	SDT nvarchar(10),
);
create table GioHang(
    Id_GioHang int identity(1,1) primary key,
	Id_SanPham int references sanPham(IdSanPham),
	TenSP nvarchar(max),
	SoLuong int,
    DonGia money,
	TrangThai bit default(0),
);

create table HoaDonChiTiet (
    Id_HDCT int identity(1,1) primary key,
    Id_SanPham int references sanPham(IdSanPham),
	TenCuaHang nvarchar(max),
	Hotline nvarchar(10),
	TenSP nvarchar(max),
	SoLuong int,
    DonGia money,
    --Id_HoaDon int references HoaDon(Id_HoaDon),
	Id_NhanVien int references NhanVien(Id_NVien), 
	Id_KhachHang int references KhachHang(Id_KhachHang),
	ChietKhau money,
    GhiChu nvarchar(100),
    TrangThai bit default(0),
	NgayTao date default getdate(),
	TongTien Money,
);
go
create table DoiTra(
	Id_DoiTra int identity(1,1) primary key,
	Id_NhanVien int references NhanVien(Id_NVien), 
	Id_KhachHang int references KhachHang(Id_KhachHang),
	Id_SanPham int references sanPham(IdSanPham),
	Id_HDCT int references HoaDonChiTiet(Id_HDCT),
	TenSP nvarchar(max),
	SoLuong int,
    DonGia money,
	TrangThai bit default(0),
	NgayTao date default getdate(),
	TongTien Money,
);
insert into size_SP values
('XS'),
('S'),
('M'),
('L'),
('Xl'),
('XXL'),
('3XL')

insert into color_SP values
(N'Xanh'),
(N'Đỏ'),
(N'Tím'),
(N'Vàng'),
(N'Hồng pastel'),
(N'Hồng Đậm'),
(N'Nâu'),
(N'Đen'),
(N'Đỏ Đô'),
(N'Xanh Coban'),
(N'Xanh Navy'),
(N'Xanh Chuối'),
(N'Xám'),
(N'Be'),
(N'Xanh Rêu'),
(N'Cam')

insert into NhanHang_SP values
(N'Julido'),
(N'levents'),
(N'ADNV'),
(N'BBR'),
(N'Thome')

insert into ChatLieu_SP values
(N'3158'),
(N'Cotton 100%'),
(N'Lanh'),
(N'')





ALTER TABLE sanPham add  Hinh nvarchar(max) 
