--Tính số lượng sản phẩm còn lại trong kho (UnitsInStock) sau khi bán hết các
-- sản phẩm đã đc đặt hàng (UnitsOnOrder)
-- số hàng tồn kho = số hàng trong kho - số hàng trong đơn đặt hàng
select[ProductID], [ProductName], [UnitsInStock],[UnitsOnOrder],
([UnitsInStock] - [UnitsOnOrder]) as "StockRemaining"
from[dbo].[Products]

-- tính giá trị đơn hàng chi tiết cho all các sp trong bảng orderDetails
-- orderDetailValue = UnitPrice * Quantity
select *, 
([UnitPrice] * [Quantity]) as "orderDetailValue"
from[dbo].[Order Details]

--Tính tỷ lệ giá vận chuyển đơn đặt hàng (freight) trung bình của các đơn
-- đặt hàng trong bảng Orders so với giá trị vận chuyển của đơn hàng lớn nhất
-- (MaxFreight). FreightRadio = avg(freight)/max(freight)

select AVG([Freight]) as "Giá vận chuyển trung bình",
	  MAX([Freight]) as "Giá vận chuyển lớn nhất", 
	  (AVG([Freight]) / MAX([Freight])) as "Tỉ lệ"
from[dbo].[Orders]

-- hãy liệt kê ds các sp, và giá (UnitPrice) của từng sp sẽ đc giảm đi 10%
-- trog bảng product
select[ProductName], [UnitPrice], 
	([UnitPrice] - ([UnitPrice] * 0.1)) as "Giá sau khi giảm 10%"
from[dbo].[Products]