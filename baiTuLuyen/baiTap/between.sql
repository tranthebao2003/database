--lấy ds các sp có giá bán trong khoảng từ 10 đến 20 đô la trong bảng products
select [ProductName], [UnitPrice]
from Products
where UnitPrice between 10 and 20

--lấy ds các đơn đặt hàng đc đặt trong khoảng tg từ ngày 1996-07-01
-- đến ngày 1996-07-31 trong bảng orders
select [OrderID], [OrderDate]
from Orders
where [OrderDate] between '1996-07-01' and '1996-07-31'

-- Tính tổng số tiền vận chuyển (Freight) của các đơn đặt hàng đc đặt
-- trong khoảng thời gian từ ngày 1996-07-01 đến ngày 1996-07-31 trong bảng
-- orders

select sum([Freight]) as 'Tổng số tiền vận chuyển trong tháng 7'
from Orders
where [OrderDate] between '1996-07-01' and '1996-07-31'

--lấy ds các đơn đặt hàng có ngày đặt hàng trong khoảng từ ngày 1/1/1997
--đến ngày 31/12/1997 và đc vận chuyển bằng phương thức tàu thủy (shipVia = 3)
-- trong bảng order
select OrderID, ShipVia, [OrderDate]
from Orders
where  [ShipVia] = 3 and [OrderDate] between '1997-1-1' and ' 1997-12-31' 