--hãy lọc ra all các đơn hàng vs đk:
--a + đơn hàng đc giao đến germany, uk, brazil
--b + đơn hàng đc giao đến các quốc gia khác ngoài 3 nước trên
--a)
select ShipCountry
from Orders
where ShipCountry in ('germany', 'uk', 'brazil')

--b)
select ShipCountry
from Orders
where ShipCountry not in ('germany', 'uk', 'brazil')

-- lấy ra all sp có mã thể loại khác với 2,3 và 4
select *
from Products
where CategoryID not in ('2', '3', '4')


-- 1.hãy liệt ke các nhân viên ko phải là nữ từ bảng nhân viên
-- 2. hãy liệt kê các nhân viên là nữ trong bảng nhân viên
--1)
select *
from Employees
where TitleOfCourtesy not in ('ms.', 'mrs.', 'dr.')
--2)
select *
from Employees
where TitleOfCourtesy in ('ms.', 'mrs.', 'dr.')