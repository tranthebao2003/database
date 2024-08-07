use NORTHWND
-- từ bảng products và categories, hãy in ra các thông tin sau đây:
-- mã thể loại
-- tên thể loại
-- mã sản phẩm
-- tên sản phẩm
select p.ProductID, p.ProductName, c.CategoryName, c.CategoryID
from Products as p, Categories as c
where p.CategoryID = c.CategoryID

--từ bảng employess và orders, hãy in ra các thông tin sau đây:
--mã nhân viên
--tên nhân viên
--số lượng đơn hàng mà nhân viên đã bán được
select o.EmployeeID, e.[LastName] +' '+e.[FirstName] as 'Họ tên nhân viên',
		count (o.OrderID) as 'Tổng số đơn'
from Employees as e, Orders as o
where e.EmployeeID = o.EmployeeID
group by o.EmployeeID, e.[LastName] +' '+e.[FirstName] 

-- Từ bảng customers and orders, hãy in ra các thông tin sau đây
-- Mã số khách hàng
-- tên công ty
-- tên liên hệ
-- số lượng đơn hàng đã mua
-- với đk: quốc gia của khách hàng là uk
select cus.CustomerID, cus.CompanyName, cus.ContactName, count(OrderID) as 'Tổng đơn hàng đã mua'
from[dbo].[Customers] as cus, [dbo].[Orders] as o
where cus.Country = 'uk' and cus.CustomerID = o.CustomerID
group by cus.CustomerID, cus.CompanyName, cus.ContactName

-- Từ bảng order va shippers, hãy in ra các thông tin sau đây:
-- mã nhà vận chuyển
-- tên công ty vận chuyển
-- Tổng số tiền đc vận chuyển (sum Frieght)
-- và in ra màn hình theo thứ tự sắp xếp tổng số tiền vận chuyển giảm dần
select sh.ShipperID, sh.CompanyName, sum(o.Freight) as 'Tổng số tiền vận chuyển'
from [dbo].[Orders] as o, [dbo].[Shippers] as sh
where sh.ShipperID = o.ShipVia
group by sh.ShipperID, sh.CompanyName
order by sum(o.Freight) desc

-- từ bảng products và suppliers, hãy in ra các thông tin sau đây:
-- Mã nhà cung cấp
-- Tên công ty
-- Tổng số các sp khác nhau đã cung cấp
-- và chỉ in ra màn hình duy nhất 1 nhà cung cấp có số lượng sản phẩm khác nhau nhìu nhất
select top 1 sup.SupplierID, sup.CompanyName, count(pro.ProductID) as 'Các loại sản phẩm'
from Products as pro, Suppliers as sup
where sup.SupplierID = pro.SupplierID
group by sup.SupplierID, sup.CompanyName
order by count(pro.ProductID) desc
-- sau khi lấy ra đc số sản phẩm của từng nhà cug cấp sau đó ta sắp xếp giảm dần rồi lấy ra select top 1 là ok

-- từ bảng orders và orders De tails hãy in ra các thông tin sau đây
-- Mã đơn hàng
-- tổng số tiền sp của đơn hàng đó
select o.OrderID, sum (od.UnitPrice * od.Quantity) as 'Tổng số tiền sp của 1 đơn hàng'
from Orders as o, [Order Details] as od
where o.OrderID = od.OrderID
group by o.OrderID, od.UnitPrice
-- od.UnitPrice * od.Quantity: giá trị của 1 đơn hàng

--từ 3 bảng order Details, orders, employees hãy in ra các thông tin sau:
-- mã đơn hàng
-- tên nhân viên
-- tổng số tiền sp của đơn hàng
select o.OrderID, em.LastName + ' ' + em.FirstName, sum(od.[UnitPrice] * od.[Quantity])
from [Order Details] as od, Orders as o, Employees as em
where od.OrderID = o.OrderID and o.EmployeeID = em.EmployeeID
group by  o.OrderID, em.LastName + ' ' + em.FirstName

-- Từ 3 bảng customers, orders, shippers hãy in ra các thông tin sau đây:
-- mã đơn hàng, tên khách hàng, tên công ty vận chuyển
-- Và chỉ in ra các đơn hàng đc giao đến 'uk' trong năm 1997
select o.OrderID, cus.ContactName, sh.CompanyName, ShipCountry
from Customers as cus, Orders as o, Shippers as sh
where ShipCountry = 'uk' and o.CustomerID = cus.CustomerID and o.ShipVia = sh.ShipperID