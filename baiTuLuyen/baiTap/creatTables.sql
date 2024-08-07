create table NhanVien(
	MaNV int not null primary key,
	HoTen varchar(50) not null,
	Phai varchar(50),
	NgaySinh date,
	DiaChi varchar(255),
	sdt varchar(10)
)

--tao table khach hang
create table KhachHang(
	-- câu này Identity (0,1): nghĩa là bắt đầu từ 0 mỗi lần tăn lên 1
	MaKH int Identity (0,1) not null primary key,
	TenKH varchar(50) not null,
	DiaChi varchar(255),
	-- câu này nó sẽ check tưg kí tự của SDT nếu nó LIKE trong khoảng từ 0-9 thì nó mới lưu
	SDT varchar(10) check (SDT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)


-- thêm 1 cột email vào bảng nv
alter table NhanVien
add Email varchar(100)

-- thay đổi cột họ và tên thành varchar(100)
alter table NhanVien
alter column HoTen varchar(100)

-- thêm contrains ràng buộc ngày sinh phải nhỏ thua hoặc bằng ngày hiện tại
alter table NhanVien
add constraint NgaySinhCheck check (NgaySinh <= getDate())

---- xóa dữ liệu
--truncate table nhanvien

---- xóa luôn cấu trúc bảng
--drop table nhanvien

--bt
--yêu cầu 1: tạo bảng sv vs các cột sau:
--MaSV: Kiểu dữ liệu int, khóa chính, ko đc null
--HoTen: kiểu dữ liệu varchar(50), ko đc null
--Lop: Kiểu dữ liệu varchar(20)
--Nganh: kiểu dữ liệu varchar(20)
--DiemTB: kiểu dữ liệu float
create table SinhVien(
	MaSV int not null primary key,
	HoTen varchar(50) not null,
	Lop varchar(20),
	Nganh varchar(20),
	DiemTB float
)
