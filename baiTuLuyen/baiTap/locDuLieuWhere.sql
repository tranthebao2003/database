use[NORTHWND]

--Bạn hãy liệt kê all các nhân viên đến từ thành phố LonDon
-- sau đó sắp xếp kết quả theo lastname a->z
select *
from[dbo].[Employees]
where [City] = 'London'-- bắt buộc phải sử dụng dấu nháy đơn
order by [LastName] asc; -- order by bắt buộc phải nằm sau where trog TH này

-- Bạn hãy liệt kê all các đơn hàng bị giao muộn, biết rằng ngày cần phải
-- giao hàng là RequiredDate, ngày giao hàng thực tế là ShippedDate
select count(*) as 'Số đơn giao hàng muộn'
from[dbo].[Orders]
where [ShippedDate] > [RequiredDate] 

-- lấy ra all các đơn hàng chi tiết đc giảm giá nhiều hơn 10% 
-- trog bảng order details
select *
from [Order Details]
where Discount > 0.1

select count(*) as 'Số đơn hàng giảm giá nhiều hơn 10%'
from [Order Details]
where Discount > 0.1

--hãy liệt ke all đơn hàng đc gửi đến quốc gia là "france" trog bảng order
select count(OrderID) as "Số đơn hàng đc gửi đến pháp"
from[dbo].[Orders]
where [ShipCountry] = 'france'