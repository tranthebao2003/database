use [NORTHWND]

-- hãy đếm số lượng khác hàng có trong bảng customers
-- c1
select count(*) as "Số lượng khách hàng"
from[dbo].[Customers]
-- c2
select count([CustomerID])
from [dbo].[Customers]

-- tính tổng số tiền vận chuyển (freight) của all các đơn đặt hàng 
-- trong bảng orders
select sum([Freight]) as "Tổng số tiền vận chuyển"
from[dbo].[Orders]

-- tính trung bình số lượng đặt hàng (Quantity)
-- của all các sp trong bảng [order Details]
select avg(Quantity) as "Trung bình số lượng đặt hàng"
from [Order Details]

-- đếm số lượng mặt hàng, tính tổng số lượng hàng trong kho và trung bình 
-- giá của các sp có trong bảng Product
select	count(*) as "Số lượng mặt hàng hàng trong kho"
		, sum([UnitsInStock]) as "Tổng số lượng hàng tồn kho"
		, avg([UnitPrice]) as "Trung bình giá của các sản phẩm"
from[dbo].[Products]

-- hãy đếm số lượng đơn hàng từ bảng order với 2 cách:
-- c1: dùng dấu *
-- c2: dùng mã đơn hàng
-- c1
select count(*) as "Cách 1"
from Orders
--c2
select count(OrderID) as "Cách 2"
from Orders

--từ bảng order details hãy tính trung bình cho cột UnitPrice và tính tổng cho
-- cột Quantity
select	AVG([UnitPrice]) as "Giá trung bình"
		, SUM (Quantity) as "Tổng số lượng đặt hàng"
from [Order Details]