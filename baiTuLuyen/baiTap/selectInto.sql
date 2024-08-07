-- tạo ra bảng mới vs các sp có giá > 50
select *
into HighValueProducts
from Products
where Products.UnitPrice > 50

-- tạo ra bảng vs các đơn hàng dc giao đến usa
select *
into orderUsa
from Orders
where Orders.ShipCountry = 'usa'

drop table orderUsa
drop table HighValueProducts

-- tạo 1 bảng tạm thời "CustomersInLonDon" từ bảng customers để chứa thông
-- tin các khách hàng có địa chỉ ở london
select *
into CustomersInLonDon
from Customers
where Customers.Country = ' london'

-- tạo 1 bảng tạm thời HightValueOrders để chứa thông tin về các đơn
-- hàng có tổng giá trị đặt hàng lớn hơn 100 đôla
select Orders.*
into HightValueOrders
from Orders
where Orders.OrderID in (
select o.OrderID
from Orders as o
join [Order Details] as od
on od.OrderID = o.OrderID
group by o.OrderID
having sum(od.[UnitPrice] * od.[Quantity]) > 1000)
