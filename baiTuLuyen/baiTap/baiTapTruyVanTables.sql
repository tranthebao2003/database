-- từ bảng products và categories, hãy tìm các sp thuộc danh mục 'seafood' (đồ hải sản) in ra
-- các thông tin sau đây
-- mã thể loại
-- tên thể loại
-- mã sp
-- tên sp
select ca.CategoryID, ca.CategoryName, pro.ProductID, pro.ProductName
from Products as pro, Categories as ca
where CategoryName = 'seafood' and ca.CategoryID = pro.CategoryID

-- từ bảng products và suppliers, hãy tìm các sản phẩm được cung cấp từ nước 'germany'
-- mã nhà cung cấp
-- quốc gia
-- mã sản phẩm
-- tên sản phẩm
select sup.SupplierID, sup.Country, pro.ProductID, pro.ProductName
from Products as pro, Suppliers as sup
where sup.SupplierID = pro.SupplierID and sup.Country = 'germany'

--từ 3 bảng customers, shippers, orders hãy in ra các thông tin sau đây:
-- mã đơn hàng
-- tên khách hàng
-- tên công ty vận chuyển 
-- và chỉ ra các đơn hàng của khách hàng đến từ thành phố 'london'
select o.OrderID, cus.ContactName, sh.CompanyName, cus.City
from Customers as cus, Shippers as sh, Orders as o
where cus.City = 'london' and cus.CustomerID = o.CustomerID and sh.ShipperID = o.ShipVia

-- từ 3 bảng customers, shippers, orders hãy in ra các thông tin sau đây
-- mã đơn hàng, tên khách hàng, tên công ty vận chuyển, ngày yêu cầu chuyển hàng, ngày giao hàng
-- và chỉ in ra các đơn hàng bị giao muộn hơn quy định ( requiredDate > shippedDate)
select o.OrderID, cus.ContactName, sh.CompanyName, o.RequiredDate, o.ShippedDate
from Customers as cus, Shippers as sh, Orders as o
where o.RequiredDate < o.ShippedDate and cus.CustomerID = o.CustomerID and sh.ShipperID = o.ShipVia

--give these shippcountries for which customers don't come from the United States
-- select only this countries which is over than 100 orders
-- display shipcountry and number of order
select o.ShipCountry, count(o.OrderID)
from Shippers as sh, Orders as o
where o.ShipCountry <> 'usa'  and o.ShipVia = sh.ShipperID 
group by o.ShipCountry
having count(o.OrderID) > 100