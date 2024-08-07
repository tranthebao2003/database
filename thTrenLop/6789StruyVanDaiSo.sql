-- các câu truy vấn bằng đại số quan hệ nhưng mik test lại bằng
-- sql
--6
select tenDA, maDA, sum(phanCong.thoiGian)
from deAn
join phanCong
on deAn.maDA = phanCong.soDA
group by tenDA, maDA

--7
select honv, tenNV, COUNT(thanNhan.MaNVien)
from nhanvien
join thanNhan
on nhanvien.manv = thanNhan.MaNVien
group by honv, tenNV

--8
select tenPhg, AVG(luong)
from nhanvien
join phongBan
on nhanvien.phg = phongBan.MaPhg
group by tenPhg

--9
select *
from nhanvien
where nhanvien.phai = 'nu'

--10
select tenPhg, count(nhanvien.manv) as 'Số nhân viên', AVG(nhanvien.luong)
from nhanvien
join phongBan
on nhanvien.phg = phongBan.MaPhg
group by MaPhg, tenPhg
having AVG(nhanvien.luong) > 30000