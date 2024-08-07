--liet ke ra toàn bộ sp
use NORTHWND
select ProductID, ProductName, UnitPrice
from Products

-- tìm giá trug bình của các sp
select AVG([UnitPrice])
from [dbo].[Products]

-- lọc những sp có giá lớn hơn giá tb
-- dùng subquery 
select ProductID, ProductName, UnitPrice
from Products
where UnitPrice > (
	select avg (UnitPrice)
	from Products
)

-- lọc ra những khách hàng có số đơn hàng lớn hơn 10
-- c1
 select Customers.CustomerID, count (Orders.OrderID)
 from Customers, Orders
 where Customers.CustomerID = Orders.CustomerID
 group by Customers.CustomerID
 having count (Orders.OrderID) > 10

 --c2
 select cus.CustomerID, cus.ContactName, count(o.OrderID)
 from Customers as cus
 left join Orders as o
 on cus.CustomerID = o.CustomerID
 group by cus.CustomerID, cus.ContactName

 --c3 subquery
 select *
 from Customers
 where CustomerID in (
 -- subquery này: nó lấy ra all mã khách hàng nào có số lượng đơn hàng lớn hơn 10
 select CustomerID
 from Orders 
 group by CustomerID
 having count(OrderID)>10
 )

 -- hãy tính tổng số tiền trong từng đơn hàng
 select o.*, (
	 select sum(od.Quantity * od.UnitPrice)
	 from [Order Details] as od
	 where o.OrderID = od.OrderID
 ) as TotalOrder
 from Orders as o

 select *
 from [Order Details]


 -- lọc ra ten sp và tổng số đơn hàng của sp
 select Products.ProductName, (
	 select count(od.[OrderID])
	 from [dbo].[Order Details] as od
	 where od.ProductID = Products.ProductID
 )
 from Products
 order by Products.ProductName asc

 select p.ProductName, count(od.OrderID)
 from Products as p
 left join [Order Details] as od
 on p.ProductID = od.ProductID
 group by p.ProductName
 order by p.ProductName asc

 -- liệt kê các đơn hàng có ngày đặt hàng gần nhất
 select* 
 from Orders
 where Orders.OrderDate = (select max(OrderDate) from Orders)

 
-- hãy liệt những sp chưa từng đc đặt hàng
select pro.ProductName
from Products as pro
where pro.ProductID not in
(-- subquery: liệt kê những sp đã đc đặt hàng thì tìm những productID đã nằm trong đơn đặt hàng
select distinct od.ProductID
from [Order Details] as od)

-- lấy thông tin về các đơn hàng và tên các sp, thuộc các đơn hàng chưa đc giao cho khách
select od.*, pro.ProductName, o.ShippedDate
from orders as o
join [Order Details] as od
on od.OrderID = o.OrderID
join Products as pro
on pro.ProductID = od.ProductID
where o.OrderID in (
-- subquery này: là những sp chưa đc giao cho khách vì shippedDate nó bằng null
select Orders.OrderID
from Orders
where Orders.ShippedDate is null)
order by pro.ProductName desc

select od.*, pro.ProductName, o.ShippedDate
from orders as o
join [Order Details] as od
on od.OrderID = o.OrderID
join Products as pro
on pro.ProductID = od.ProductID
where o.ShippedDate is null
order by pro.ProductName desc

-- lấy thông tin của những sp có số lượng sp tồn kho 
-- ít hơn số lượng sản phẩm tồn kho trung bình
select *
from Products
where Products.UnitsInStock < ( 
select AVG(UnitsInStock)
from Products)

-- lấy thông tin các khach hàng có tổng giá trị đơn hàng lớn nhất
select cus.*
from Customers as cus
join Orders as o
on o.CustomerID = cus.CustomerID
where o.OrderID = 
(--subquery này để lấy ra orderID có tổng giá trị đơn hàng lớn nhất
select top 1 od.OrderID
from [Order Details] as od
group by od.OrderID
order by sum(od.[UnitPrice] * od.[Quantity]) desc)




