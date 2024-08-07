use [NORTHWND]

--Bạn hãy liệt kê all các nhà cung cấp theo thứ tự tên đơn vị (companyName)
-- trong bảng suppliers
select *
from Suppliers
order by CompanyName asc 

-- hãy liệt kê all các sản phẩm theo thứ tự giá giảm dần trong bảng pruducts
select *
from Products
order by UnitPrice desc

-- hãy liệt kê all các nhân viên theo thứ tự họ và tên đệm a-z trong bảng employees
select *
from Employees
order by LastName asc, FirstName asc; -- như vầy nó sẽ ưu tiên sắp theo lastName tr
-- sau đó nếu trùng lastName thì nó sẽ sắp xếp theo firstName

-- hãy lấy ra 1 sp có số lượng bán cao (quantity) nhất từ bảng order details
-- ko đc dùng max
select top 1 *
from [Order Details]
order by Quantity desc

-- hãy liệt kê danh sách các đơn đặt hàng (orderID) trong bảng orders theo thứ
-- tự giảm dần của ngày đặt hàng (orderDate)

select *
from Orders
order by OrderDate desc

-- hãy liệt kê tên, đơn giá, số lượng trong kho (unitsInStock) của all sp
-- trong bảng products, theo thứ tự giảm dần của UnitsInStock

select ProductName, UnitPrice, UnitsInStock
from Products
order by UnitsInStock desc