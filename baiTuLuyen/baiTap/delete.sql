use NORTHWND
select *
into customers_1
from Customers

-- xóa đi khách hàng 'ALFKI'
delete from [dbo].[customers_1]
where [dbo].[customers_1].CustomerID like 'ALFKI'

-- xóa đi toàn bộ khách hàng bắt đầu bằng chữ u
delete from [dbo].[customers_1]
where customers_1.Country like 'u%'

-- từ database northwind sử dụng select into để tạo ra bảng tạm thời trx
-- khi thực hành câu lệnh delete
--1. làm thế nào để xóa 1 đơn đặt hàng cụ thể dựa trên orderID?
-- vd: xóa đơn đặt hàng có orderID là 10248
select *
into orders_1
from Orders

delete from orders_1
where orders_1.OrderID like '10248'

--2. Xóa all sp từ bảng products có số lượng tồn kho (unitsInStock) bằng 0
select *
into products_1
from Products

delete from products_1
where products_1.UnitsInStock = 0

