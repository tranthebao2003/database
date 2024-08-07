use QuanLiNhanVien
insert into [dbo].[deAn]([maDA], [tenDA], [diaDiemDA], [phong])
values
('1', 'San pham X', 'Vung Tau', '5'),
('2', 'San pham Y', 'Nha Trang', '5'),
('3', 'San pham Z', 'TPHCM', '5'),
('10', 'Tin hoc hoa', 'Ha Noi', '5'),
('20', 'Cap quang', 'TPHCM', '5'),
('30', 'Dao tao', 'Ha Noi', '5')


insert into [dbo].[diaDiem_PHG]([maPhong], [diaDiem])
values
('1', 'TPHCM'),
('4', 'Ha Noi'),
('5', 'Vung Tau'),
('5', 'Nha Trang'),
('5', 'TPHCM')

insert into[dbo].[phongBan]([MaPhg], [tenPhg], [trPhg], [NgNhanChuc])
values 
('5', 'Nghien cuu', '333445555', '1978-05-22'),
('4', 'Dieu hanh', '987987987', '1985-01-01'),
('1', 'Quan ly', '888665555', '1971-06-19')

insert into [dbo].[nhanvien]([manv], [honv], [tenLotNv], [tenNV], [ngSinh], [diaChi], [phai], [luong], [phg], [maNGS]) -- chua đc
values
('123456789', 'Dinh', 'Ba', 'Tien', '1995-01-09', '731 Tran Hung Dao, Q.1, TPHCM', 0, '30000', 5, null),
('333445555', 'Nguyen', 'Thanh', 'Tung', '1945-12-08', '638 Nguyen Van Cu, Q.5, TPHCM', 0, '40000', 5, '888665555'),
('999887777', 'Bui', 'Thuy', 'Vu', '1958-07-19', '332 Nguyen Thai Hoc, Q.1, TPHCM', 0, '25000', 4, '987654321'),
('987654321', 'Le', 'Thi', 'Nhan', '1931-06-20', '291 Ho Van Hue, Q.PN, TPHCM', 1, '43000', 4, '888665555'),
('66688444', 'Nguyen', 'Manh', 'Hung', '1952-09-15', '975 Ba Ria Vung Tau', 0, '38000', 5, '333445555'),
('453453453', 'Tran', 'Thanh', 'Tam', '1962-07-31', '543 Mai Thi Luu, Q.1, TPHCM', 0, '25000', 5, '333445555'),
('987987987', 'Tran', 'Hong', 'Quang', '1959-03-29', '980 Le Hong Phong, Q.10, TPHCM', 0, '25000', 4, '987654321'),
('888665555', 'Vuong', 'Ngoc', 'Quyen', '1927-10-10', '450 Trung Vuong, Ha Noi', 1, '55000', 1, null)

insert into [dbo].[phanCong]([maNhanVien], [soDA], [thoiGian])
values
('123456789', 1, 32.5),
('123456789', 2, 7.5),
-- ('666884444', 3, 40.0), lỗi tại đây
('453453453', 1, 20.0),
('453453453', 2, 20.0),
('333445555', 3, 10.0),
('333445555', 10, 10.0),
('333445555', 20, 10.0),
('999887777', 30, 30.0),
('999887777', 10, 10.0),
('987987987', 10, 35.0),
('987987987', 30, 5.0),
('987654321', 30, 20.0),
('987654321', 20, 15.0),
('888665555', 20, null)

insert into [dbo].[thanNhan]([MaNVien], [tenTN], [phai], [NgSinh], [quanHe]) -- chua đc
values
('333445555', 'Quang', 1, '1976-04-05', 'Con trai'),
('333445555', 'Khang', 0, '1973-10-25', 'Con trai'),
('333445555', 'Duong', 1, '1984-05-03', 'Vo chong'),
('987654321', 'Dang', 0, '1932-02-29', 'Vo chong'),
('123456789', 'Duy', 0, '1978-01-01', 'Con trai'),
('123456789', 'Chau', 1, '1978-12-31', 'Con trai'),
('123456789', 'Phuong', 1, '1957-05-05', 'Vo chong')
