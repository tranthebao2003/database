-- hãy cho bít những khách hàng nào đã đặt nhiều hơn 20 đơn hàng, sắp xếp theo thứ tự
-- tổng số đơn hàng giảm dần
use [NORTHWND]
select CustomerID, COUNT(OrderID) as 'Tổng đơn hàng'
from Orders
group by CustomerID
having COUNT(OrderID) > 20
order by COUNT(OrderID) desc

-- hãy lọc ra các nhân viên (employeeID) có tổng số đơn hàng lớn hơn or bằng 100
-- sắp xếp theo tổng số đơn hàng giảm dần
select EmployeeID, count(OrderID) as 'Tổng đơn hàng'
from Orders
group by EmployeeID
having count(OrderID) >= 100
order by count(OrderID) desc

-- hãy cho biết những thể loại nào (CategoryID) có số sản phẩm khác nhau lớn hơn 11
select CategoryID, count(ProductID)
from [dbo].[Products]
group by CategoryID
having count(ProductID) > 11

--hãy cho biết những thể loại nào có tổng số lượng sản phẩm trong kho (UnitsInStock) lớn
-- hơn 350
select CategoryID, sum(UnitsInStock)
from Products
group by CategoryID
having sum(UnitsInStock) > 350

-- hãy cho biết những quốc gia nào có nhiều hơn 7 đơn hàng
select  ShipCountry, count(OrderID) as 'Đơn hàng ở mỗi quốc gia'
from Orders
group by ShipCountry
having count(CustomerID) > 7

-- hãy cho biết những ngày nào có nhiều hơn 5 đơn hàng đc giao, sắp xếp tăng dần theo 
-- ngày giao hàng
select day([ShippedDate]), count([OrderID])
from Orders
group by day([ShippedDate])
having count([OrderID]) > 5
order by day([ShippedDate]) asc
-- có 1 dòng null nghĩa là những đơn hàng chưa đc giao

-- hãy cho biết những quốc gia bắt đầu bằng chữ 'a' or 'g'
-- và có số lượng đơn hàng lớn hơn 29, sắp xếp theo số lượng đơn hàng giảm dần
select [ShipCountry], count(OrderID)
from Orders
where [ShipCountry] like 'a%' or [ShipCountry] like 'g%'
group by ShipCountry
having count(OrderID) > 29
order by count(OrderID) desc

--hãy cho biết những thành phố nào có (shipVia) là khác 1 và 2, 
-- ngày đặt hàng từ ngày '1997-04-01' đến ngày '1997-08-31'
select [ShipCity], ShipVia, OrderDate
from Orders
where ShipVia <> '1' and ShipVia <> '2' and (OrderDate between '1997-04-01' and '1997-08-31')