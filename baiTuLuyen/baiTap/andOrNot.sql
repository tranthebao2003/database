use [NORTHWND]

-- Bạn hãy liệt kê all các sp có số lượng trong kho (unitsInStock) thuộc khoảng
-- nhỏ hơn 50 hoặc lớn hơn 100 trong bảng products
select *
from[dbo].[Products]
where UnitsInStock < 50 or UnitsInStock > 100

-- Hãy liệt kê all các đơn hàng đc giao đến brazil, đã bị giao muộn, biết
-- rằng ngày cần phải giao hàng là RequiredDate, ngày giao hàng thực tế
-- shippedDate trong bảng order
select OrderID, ShipCountry, RequiredDate, ShippedDate
from Orders
where ShipCountry = 'brazil' and (ShippedDate > RequiredDate)

-- lấy ra all sp có giá dưới 100$ và mã thể loại khác 1, dùng not trong bảng 
--products
select ProductName, UnitPrice, CategoryID
from[dbo].[Products]
where not (CategoryID = 1) and [UnitPrice] < 100 

-- hãy liệt ke all đơn hàng có giá vận chuyển freight trong khoảng [50,100] đô
select Freight
from[dbo].[Orders]
where Freight >= 50 and Freight <= 100

-- hãy liệt kê các sp có số lượng hàng trong kho (unitsInStock) lớn hơn 20
-- và số lượng hàng trong đơn hàng (unitsOnOrder) nhỏ hơn 20
select UnitsInStock, UnitsOnOrder
from[dbo].[Products]
where UnitsInStock > 20 and UnitsOnOrder <20