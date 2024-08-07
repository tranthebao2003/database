use QuanLiNhanVien

/** 
1.	Tìm những nhân viên làm việc ở phòng số 4.
2.	Tìm những nhân viên có mức lương trên 30000.
3.	Tìm những nhân viên có mức lương trên 25000 ở phòng số 4 hoặc các nhân viên có mức lương trên 30000 ở phòng số 5.
4.	Cho biết họ tên đầy đủ của các nhân viên ở TPHCM.
5.	Cho biết ngày sinh và địa chỉ của nhân viên Dinh Ba Tien 
**/

select *
from [dbo].[nhanvien]
where[phg] = '4'

select *
from [dbo].[nhanvien]
where luong > 30000

select *
from [dbo].[nhanvien]
where (luong > 25000 and phg = '4') or ( luong > 30000 and phg = '5')

select honv + ' ' + tenLotNv + ' ' + tenNV as 'Họ tên nhân viên'
from nhanvien
where diaChi like '%TPHCM'

select ngSinh, diaChi
from nhanvien
where (honv + ' ' + tenLotNv + ' ' + tenNV) = 'Dinh Ba Tien'


/**
Phép kết
1.	Với mỗi phòng ban, cho biết tên phòng ban và địa điểm phòng.
2.	Tìm tên những người trưởng phòng của từng phòng ban.
3.	Tìm TenDA, MaDA, DdiemDA, Phong, TenPhg, MaPh, TrPhg, NgNhanchuc.
4.	Tìm tên và địa chỉ của tất cả các nhân viên của phòng “Nghien cuu”.
5.	Tìm tên những nữ nhân viên và tên người thân của họ.
6.	Với mọi đề án ở “Ha Noi”, liệt kê các mã số đế án (MaDA), mã số phòng ban chủ trì đề án (Phong), họ tên trưởng phòng (HoNV, TenlotNV, TenNV) cũng như địa chỉ (Dchi) và ngày sinh (NgSinh) của người ấy.
7.	Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý trực tiếp của nhân viên đó.
8.	Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên trưởng phòng của phòng ban mà nhân viên đó làm việc.
9.	Tên những nhân viên phòng số 5 có tham gia vào đề án “San pham X” va những nhân viên này do “Nguyen Thanh Tung” quản lý trực tiếp.
10.	Cho biết họ tên nhân viên (HoNV, TenlotNV, TenNV) và tên các đề án mà nhân viên đó tham gia nếu có.

**/

--1.	Với mỗi phòng ban, cho biết tên phòng ban và địa điểm phòng.
use QuanLiNhanVien
select MaPhg, tenPhg, diaDiem
from phongBan, [dbo].[diaDiem_PHG]
where phongBan.MaPhg = diaDiem_PHG.maPhong

--2.	Tìm tên những người trưởng phòng của từng phòng ban.
select *
from nhanvien as nv
join phongBan as pb
on nv.manv = pb.trPhg

--3.	Tìm TenDA, MaDA, DdiemDA, Phong, TenPhg, MaPh, TrPhg, NgNhanchuc.
select da.*, pb.*
from [dbo].[deAn] as da
join [dbo].[phongBan] as pb
on da.phong = pb.MaPhg

-- 4.	Tìm tên và địa chỉ của tất cả các nhân viên của phòng “Nghien cuu”.
select nv.honv ,nv.tenLotNv, nv.tenNV, nv.diaChi, bp.tenPhg
from phongBan as bp
join nhanvien as nv
on nv.phg = bp.MaPhg
where bp.tenPhg = 'Nghien Cuu'

--5.	Tìm tên những nữ nhân viên và tên người thân của họ.
select nv.honv, nv.tenLotNv, nv.tenNV, tenLotNv, tenTN
from thanNhan as tn
join nhanvien as nv
on tn.MaNVien = nv.manv
where nv.phai = 'nu'


-- 6. Với mọi đề án ở “Ha Noi”, liệt kê các mã số đế án (MaDA), 
-- mã số phòng ban chủ trì đề án (Phong),
-- họ tên trưởng phòng (HoNV, TenlotNV, TenNV) cũng như địa chỉ (Dchi) 
-- và ngày sinh (NgSinh) của người ấy.
select da.maDA, da.phong, nv.honv, nv.tenLotNv, nv.tenNV, nv.diaChi, nv.ngSinh
from deAn as da
join phongBan as pb
on pb.MaPhg = da.phong
join nhanvien as nv
on nv.manv = pb.trPhg
where da.diaDiemDA = 'ha noi'


----7.	Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người 
----    quản lý trực tiếp của nhân viên đó.
select nv1.honv, nv1.tenLotNv, nv1.tenNV, nv2.honv, nv2.tenLotNv, nv2.tenNV  
from nhanvien as nv1
left join nhanvien as nv2
on nv2.manv = nv1.maNGS
-- nv2.manv = nv1.maNGS: để là tìm ng giám sát

--8.	Với mỗi nhân viên, cho biết họ tên nhân viên và 
--họ tên trưởng phòng của phòng ban mà nhân viên đó làm việc.
select nv.honv, nv.tenLotNv, nv.tenNV, nv.phg, nv2.honv, nv2.tenLotNv, nv2.tenNV
from nhanvien as nv
join phongBan as pb
on pb.MaPhg = nv.phg
join nhanvien as nv2
on nv2.manv = pb.trPhg

--9.	Tên những nhân viên phòng số 5 có tham gia vào đề án “San pham X” va 
-- những nhân viên này do “Nguyen Thanh Tung” quản lý trực tiếp.
select nv.honv, nv.tenLotNv, nv.tenNV
from nhanvien as nv
join phanCong as pc
on pc.maNhanVien = nv.manv
-- join 1 để mik tìm đc nv nào lm đề án nào ( tìm đc số đề án tương ứng tug nv)
join deAn as da
on da.maDA = pc.soDA
-- join 2 để mik tìm đc mã đề án tương ứng với từng nhân viên
join nhanvien as nv2
on nv2.manv = nv.maNGS
-- join 3 với chính bảng nhan vien để tìm đc NGS của những nhân viên
where nv.phg = 5 and da.tenDA = 'san pham x'and nv2.honv + ' ' + nv2.tenLotNv + ' ' + nv2.tenNV = 'Nguyen Thanh Tung'


--10 Cho biết họ tên nhân viên (HoNV, TenlotNV, TenNV) và tên các đề 
--án mà nhân viên đó tham gia nếu có.
select nv.honv, nv.tenLotNv, nv.tenNV, da.tenDA
from nhanvien as nv
join phanCong as pc
on pc.maNhanVien = nv.manv
join deAn as da
on da.maDA = pc.soDA


--Gom nhóm
--1.	Với mỗi đề án, liệt kê tên đề án, và tổng số giờ làm việc một tuần của tất cả các nhân viên tham gia đề án đó.
--2.	Với mỗi nhân viên, cho biết họ và tên nhân viên và nhân viên đó có bao nhiêu thân nhân.
--3.	Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc cho phòng ban đó.
--4.	Lương trung bình của tất cả các nữ nhân viên.
--5.	Với các phòng ban có mức lương trung bình trên 30000, liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó.


--1.	Với mỗi đề án, liệt kê tên đề án, và tổng số giờ làm việc
-- một tuần của tất cả các nhân viên tham gia đề án đó.

select da.tenDA, sum(pc.[thoiGian])
from deAn as da, nhanvien as nv, phanCong as pc
where nv.manv = pc.maNhanVien and pc.soDA = da.maDA
group by da.tenDA, maDA

select tenDA, sum(thoiGian)
from deAn as da
join phanCong as pc
on da.maDA = pc.soDA
group by tenDA, maDA

--2. Với mỗi nhân viên, cho biết họ và tên nhân viên và nhân viên đó có bao nhiêu thân nhân.
select nv.honv, nv.tenLotNv, nv.tenNV, COUNT(tn.MaNVien)
from nhanvien as nv , thanNhan as tn
where nv.manv = tn.MaNVien
group by nv.honv, nv.tenLotNv, nv.tenNV, nv.manv

select nv.honv, nv.tenNV, count (tn.MaNVien )
from nhanvien as nv
join thanNhan as tn
on manv = MaNVien
group by nv.honv, nv.tenNV,manv

--3.	Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những
-- nhân viên làm việc cho phòng ban đó.

select pb.tenPhg, avg(nv.luong)
from phongBan as pb
join nhanvien as nv
on pb.MaPhg = nv.phg
group by pb.tenPhg, pb.MaPhg

--4. Lương trung bình của tất cả các nữ nhân viên.
 

--5. Với các phòng ban có mức lương trung bình trên 30000, 
--liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó.
select phongBan.tenPhg, count(nhanvien.manv)
from phongBan, nhanvien
where phongBan.MaPhg = nhanvien.phg
group by phongBan.tenPhg, phongBan.MaPhg
having AVG(nhanvien.luong) > 3000

--Truy vấn lồng
--1.	Cho biết danh sách các đề án (MaDA) có nhân viên với họ là 
--Dinh hoặc có người trưởng phòng chủ trì đề án với họ là Dinh.
select deAn.maDA
from nhanvien as nv
join phanCong as pc
on pc.maNhanVien = nv.manv
join deAn
on deAn.maDA = pc.soDA
join phongBan
on phongBan.MaPhg = deAn.phong
where nv.honv = 'dinh' or phongBan.trPhg = 'dinh'

--	Tổng hợp:
--1.	Cho biết họ tên và địa chỉ của các nhân viên sống ở TPHCM, sắp xếp tăng dần theo tên, lót, họ.
--2.	Cho biết họ tên và mức lương các nhân viên trên 40 tuổi, sắp xếp tăng dần theo lương.
--3.	Liệt kê danh sách những nhân viên (tên đầy đủ) có cùng tên với người thân.
--4.	Cho biết tên những nhân viên phòng số 5 có tham gia đề án “San pham X” với số giờ làm việc trên 10 giờ/tuần.
--5.	Cho biết danh sách những nhân viên (tên đầy đủ) không có thân nhân nào.
--6.	Cho biết danh sách những trưởng phòng có tối thiểu một thân nhân.
--7.	Cho biết danh sách những nhân viên (tên đầy đủ) không làm việc cho bất cứ đề án nào.
--8.	Cho biết danh sách những nhân viên (tên đầy đủ) có trên 2 thân nhân.
--9.	Tìm tên đầy đủ và địa chỉ của những nhân viên làm việc cho một đề án ở TPHCM nhưng phòng ban mà họ trực thuộc tất 
--		cả không tọa lạc ở TPHCM.
--10.	Tăng mức lương lên 10% cho những nhân viên có thân nhân.
--11.	Tăng mức lương thêm 20% cho những nhân viên là trưởng phòng và đồng thời có thân nhân.
--12.	Tăng mức lương thêm 30% cho những nhân viên là trưởng phòng và có tuổi trên 50.
--13.	Xóa những nhân viên ra khỏi danh sách nếu là phái nam và đến tuổi về hưu (giả sử trên 60 tuổi).
--14.	Hãy cập nhật lại địa điểm làm đề án và địa điểm phòng là cùng một nơi.
--15.	Hãy loai bỏ những đề án có thời gian làm việc trên 30 giờ/tuần.
--16.	Hãy cập nhật lại những đề án có thời gian làm việc chưa xác định thành có thời gian mặc định là 5 giờ/tuần.
--17.	Cho biết phòng ban, họ tên trưởng phòng của phòng ban có đông nhân viên nhất.
--18.	Cho biết danh sách các nhân viên và tên các phòng ban mà họ phụ trách nếu có.
--19.	Cho biết 3 nhân viên lớn tuổi nhất công ty.
--20.	Cho biết danh sách những nhân viên (tên đầy đủ) làm việc trong mọi đề án.

--1.	Cho biết họ tên và địa chỉ của các nhân viên sống ở TPHCM, 
-- sắp xếp tăng dần theo tên, lót, họ.
select honv, tenLotNv, tenNV, diaChi
from nhanvien
where diaChi like '%tphcm%'
order by tenNV, tenLotNv, honv asc

--2.	Cho biết họ tên và mức lương các nhân viên trên 40 tuổi, sắp xếp tăng dần theo lương.
select  honv, tenLotNv, tenNV, luong
from nhanvien
where datediff(year,[ngSinh], getdate()) > 40
order by luong asc

--3.	Liệt kê danh sách những nhân viên (tên đầy đủ) có cùng tên với người thân.
select honv + ' ' + tenLotNv + ' ' + tenNV
from nhanvien
join thanNhan
on thanNhan.MaNVien = nhanvien.manv
where nhanvien.tenNV = thanNhan.tenTN

--4.	Cho biết tên những nhân viên phòng số 5 có tham gia
--đề án “San pham X” với số giờ làm việc trên 10 giờ/tuần.
select tenNV
from nhanvien as nv
join phanCong as pc
on nv.manv = pc.maNhanVien
join deAn as da
on da.maDA = pc.soDA
where nv.phg = 5 and da.tenDA = 'san pham x' and pc.thoiGian > 10

--5.	Cho biết danh sách những nhân viên (tên đầy đủ) không có thân nhân nào.
select distinct honv + ' ' + tenLotNv + ' ' + tenNV
from nhanvien, thanNhan
where nhanvien.manv not in 
(select thanNhan.MaNVien
from thanNhan )

--6.	Cho biết danh sách những trưởng phòng có tối thiểu một thân nhân.
select trPhg
from nhanvien as nv
join phongBan as pb
on nv.manv = pb.trPhg
where pb.trPhg in 
(select distinct thanNhan.MaNVien
from thanNhan )

use [QuanLiNhanVien]
select trPhg
from nhanvien as nv
join phongBan as pb
on nv.manv = pb.trPhg
join thanNhan
on MaNVien = manv
group by trPhg
having count(MaNVien) >= 1

--7.	Cho biết danh sách những nhân viên (tên đầy đủ) không làm việc cho bất cứ đề án nào.
select honv + ' ' + tenLotNv + ' ' + tenNV 
from nhanvien as nv
where nv.manv not in (select distinct phanCong.maNhanVien from phanCong)

--8.	Cho biết danh sách những nhân viên (tên đầy đủ) có trên 2 thân nhân.
use [QuanLiNhanVien]
select honv + ' ' + tenLotNv + ' ' + tenNV, COUNT (tn.MaNVien)
from [dbo].[nhanvien] as nv, [dbo].[thanNhan] as tn
where nv.manv = tn.MaNVien
group by  honv + ' ' + tenLotNv + ' ' + tenNV
having COUNT (tn.MaNVien) > 2

--9.	Tìm tên đầy đủ và địa chỉ của những nhân viên làm việc cho một đề án ở TPHCM nhưng phòng 
-- ban mà họ trực thuộc tất cả không tọa lạc ở TPHCM.
select nv.honv + ' ' + nv.tenLotNv + ' ' + nv.tenNV, nv.diaChi as 'địa chỉ nhân viên'
, da.maDA, da.diaDiemDA, dd_PHG.diaDiem, nv.phg
from nhanvien as nv

join phanCong as pc
on pc.maNhanVien = nv.manv

join deAn as da
on da.maDA = pc.soDA

join phongBan as pb
on pb.MaPhg = nv.phg

join diaDiem_PHG as dd_PHG
on dd_PHG.maPhong = pb.MaPhg

-- sau khi chọn những nhân viên tham gia đề án có địa điểm đề án ở tphcm rồi thì mik
-- chỉ cần and nv.phg nằm trong những phòng có địa điểm ko phải ở tphcm
where da.diaDiemDA = 'tphcm' and nv.phg in (
select phongBan.MaPhg
from phongBan
except(
select phongBan.MaPhg
from phongBan, diaDiem_PHG
where phongBan.MaPhg = diaDiem_PHG.maPhong and diaDiem_PHG.diaDiem = 'tphcm')
--Đoạn sql trên trả về mã phog ban từ bảng phòng ban ngoại trừ những mã phòng 
--từ bảng phòng ban và bảng diaDiem_PHG vs đk là 2 cái mã phòng ở 2 bảng phải 
--bằng nhau và diaDiem_PHG.diaDiem = 'tphcm'. Tóm lại subquery nó sẽ trả về 
--những mã phòng có địa điểm là ở tphcm và except loại trừ những phòng đó đi
)

--10.	Tăng mức lương lên 10% cho những nhân viên có thân nhân.
update nhanvien
set luong = luong * 1.1
where nhanvien.manv in (select distinct thanNhan.MaNVien from thanNhan)

--11.	Tăng mức lương thêm 20% cho những nhân viên là trưởng phòng và đồng thời có thân nhân.
update nhanvien
set luong = luong * 1.2
where nhanvien.manv in (select distinct thanNhan.MaNVien from thanNhan) and nhanvien.manv in(
select nhanvien.manv
from nhanvien
join phongBan
on nhanvien.manv = phongBan.trPhg)

--12.	Tăng mức lương thêm 30% cho những nhân viên là trưởng phòng và có tuổi trên 50.
update nhanvien
set luong = luong * 1.3
where datediff(year, nhanvien.ngSinh, getdate()) > 50 and
nhanvien.manv in(
select nhanvien.manv
from nhanvien
join phongBan
on nhanvien.manv = phongBan.trPhg)

--13.	Xóa những nhân viên ra khỏi danh sách nếu là phái nam và đến tuổi về hưu (giả sử trên 60 tuổi).
delete
from nhanvien
where nhanvien.phai = 'nam' and datediff(year, nhanvien.ngSinh, getdate()) > 60 
-- lỗi này do ràng buộc khóa ngoại giữa bảng nhân viên và bảng phân công, bảng phân công sẽ tham
-- chiếu đến bảng nhân viên, nên nếu ta xóa nhân viên ở bảng nv thì bảng phân công sẽ ko còn mã nv
-- để tham chiếu và khi đó nó bị lỗi này. Muốn xử lí lỗi này ta chỉ cần xóa hết all những mã nv mún xóa
-- trong bảng phân công trước rồi sau đó mới xóa trong bảng nv

-- câu 13 lm trên các bản sao lưu
select *
into nhanvien_1
from nhanvien

select *
into phanCong_2
from [dbo].[phanCong]

delete
from nhanvien_1
where nhanvien_1.phai = 'nam' and datediff(year, nhanvien_1.ngSinh, getdate()) > 60 


delete 
from phanCong_2
where phanCong_2.maNhanVien in (
select nhanvien_1.manv
from nhanvien_1
where nhanvien_1.phai = 'nam' and datediff(year, nhanvien_1.ngSinh, getdate()) > 60)

-- 14.	Hãy cập nhật lại địa điểm làm đề án và địa điểm phòng là cùng một nơi.
	select *
	into deAn_1
	from deAn

	select *
	into diaDiem_PHG_1
	from diaDiem_PHG

	
	update deAn_1  
	set diaDiemDA = diaDiem_PHG_1.diaDiem
	from diaDiem_PHG_1
	where deAn_1.phong = diaDiem_PHG_1.maPhong
	

--15.	Hãy loai bỏ những đề án có thời gian làm việc trên 30 giờ/tuần.	
	select *
	into deAn_2
	from deAn

	delete
	from deAn 
	where deAn.maDA in (
	select deAn.maDA
	from deAn  
	join phanCong
	on phanCong.soDA = deAn.maDA
	group by deAn.maDA
	having sum(phanCong.[thoiGian]) > 30
	)
	-- tương tự nó cũng bị lỗi constraint giữa bảng phân công và bảng đề án

--18.	Cho biết danh sách các nhân viên và tên các phòng ban mà họ phụ trách nếu có.
select nhanvien.*, pb.trPhg
from nhanvien
left join phongBan as pb
on pb.trPhg = nhanvien.manv

--19.	Cho biết 3 nhân viên lớn tuổi nhất công ty.
select top 3 *
from nhanvien
order by datediff(year, nhanvien.ngSinh, getdate()) desc

--20.	Cho biết danh sách những nhân viên (tên đầy đủ) làm việc trong mọi đề án.
select *
from nhanvien
where 
(select count(*)
from deAn) in (select count(phanCong.soDA) as 'Số lượng dự án của mỗi nhân viên'
from nhanvien
join phanCong
on phanCong.maNhanVien = nhanvien.manv
group by nhanvien.manv)

select honv, tenLotNv, tenNV
from nhanvien
join phanCong
on maNhanVien = manv
group by honv, tenLotNv, tenNV, maNhanVien
having count(soDA) = (select count(maDA) from deAn)

use QuanLiNhanVien
--Cài đặt một số ràng buộc toàn vẹn
--1.	Tạo các table và các ràng buộc toàn vẹn về khóa chính, khóa ngoại, not null, miền giá trị. (xong rồi)

--2.	Tạo các ràng buộc trên table NHANVIEN để những nhân viên vào làm việc phải có tuổi trên 18.
alter table nhanvien
add constraint [ngSinh] check (datediff(year, nhanvien.[ngSinh], getdate()) > 18)

--3.	Tạo ràng buộc trên table PHONGBAN để ngày nhận chức trưởng phòng của nhân viên 
-- không nhỏ hơn ngày sinh của người ấy.
create trigger ngayNhanChuc
on [dbo].[phongBan]
after insert, update
as
begin
	if exists (select 1
				from inserted
				join nhanvien
				on nhanvien.manv = inserted.trPhg
				where nhanvien.ngSinh > inserted.NgNhanChuc)
	begin
		rollback
		raiserror('Ngày nhận chức không thể bé hơn ngày sinh', 16, 1)
	end
end

--4.	Tạo ràng buộc trên bảng DEAN trên cột DdiemDA chỉ thuộc các khu vực trong phạm vi cho trước.
create trigger locationAllow
on [dbo].[deAn]
instead of insert, update
as
begin
	if exists (select 1 
				from inserted
				where inserted.diaDiemDA not in (select [dbo].[deAn].diaDiemDA from [dbo].[deAn])
	)
	begin
		rollback
		raiserror ('Địa điểm chỉ nằm trong phạm vi cho trước', 16, 1)
	end
end


--5.	Tạo ràng buộc trên table DIADIEM_PHG trên cột Diadiem chi thuộc các khu vực trong phạm vi cho trước. (tương tự 4)


--6.	Tạo ràng buộc trên table THANNHAN để nếu một thân nhân là con của nhân viên thì có ngày sinh nhỏ hơn ngày sinh của nhân viên,
-- đồng thời nếu là con trai thì phái là “Nam” và con gái thì phái là “Nữ”.

use QuanLiNhanVien
create trigger relativesAndEmployee
on [dbo].[thanNhan]
for insert, update
as 
begin
	select i.MaNVien
	from inserted as i
	join nhanvien as nv
	on nv.manv = i.MaNVien
	declare @quanHe nchar(10) = (select i.quanHe from inserted as i)
	declare @phai nvarchar(10) = (select i.phai from inserted as i)

	if exists (
		
		select 1
		from inserted as i, nhanvien as nv
		where i.MaNVien = nv.manv and i.quanHe like 'con%' and i.NgSinh < nv.ngSinh
		and ((@quanHe = 'con gai' and @phai = 'nu') or (@quanHe = 'con trai' and @phai = 'nam'))
		
	)
	begin
		rollback
		raiserror ('Thân nhân không hợp lệ', 16, 1)
	end
	if exists (
		
		select 1
		from inserted as i, nhanvien as nv
		where i.MaNVien = nv.manv and ((@quanHe = 'con gai' and @phai <> 'nu') or (@quanHe = 'con trai' and @phai <> 'nam'))
		
	)
	begin
		rollback
		raiserror ('Thân nhân không hợp lệ', 16, 1)
	end

end

