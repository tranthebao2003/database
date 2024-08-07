--sử dụng inner join (join)
-- Từ bảng Products và categories, hãy in ra các thông tin sau đây
-- Mã thể loại, Tên thể loại, Mã sp, tên sp

select c.CategoryID, c.CategoryName, pro.ProductID, pro.ProductName
from Categories as c
join Products as pro
on c.CategoryID = pro.CategoryID

--sử dụng inner join (join)
-- Từ bảng Products và categories, hãy in ra các thông tin sau đây
-- Mã thể loại, Tên thể loại, số lượng sp
select c.CategoryID, c.CategoryName, count(pro.ProductID) as 'sum'
from Categories as c
join Products as pro
on c.CategoryID = pro.CategoryID
group by c.CategoryID, c.CategoryName

-- khi sử dụng left join
select c.CategoryID, c.CategoryName, count(pro.ProductID) as 'sum'
from Categories as c
left join Products as pro
on c.CategoryID = pro.CategoryID
group by c.CategoryID, c.CategoryName

--sử dụng inner join (join)
-- Từ bảng order và customers, hãy in ra các thông tin sau đây
-- mã đơn hàng, tên công ty khách hàng
select o.CustomerID, cus.CompanyName
from Orders as o
join Customers as cus
on o.CustomerID = cus.CustomerID

-- câu này lm sau khi đã thêm 2 loại sp vào categories nên ko thể sử dụng join đc
-- vì trong bảng product sẽ ko có 2 sp mới thêm vào
--Từ bảng products và categories, hãy đưa ra các thông tin sau
-- mã thể loại
-- tên thể loại
-- tên sp
select c.CategoryID, c.CategoryName, pro.ProductName
from Categories as c
join Products as pro
on c.CategoryID = pro.CategoryID

select c.CategoryID, c.CategoryName, pro.ProductName
from Categories as c
left join Products as pro
on c.CategoryID = pro.CategoryID


-- sử dụng right join, hãy in ra các thông tin sau đây:
-- mã đơn hàng
-- tên công ty khách hàng
-- khi sử dụng join sẽ ko tìm thấy dòng mới thêm vì chưa có đơn hàng nào của khách hàng mới cả
select o.CustomerID, cus.CompanyName
from Orders as o
join Customers as cus
on o.CustomerID = cus.CustomerID

select o.CustomerID, cus.CompanyName
from Orders as o
right join Customers as cus
on o.CustomerID = cus.CustomerID


--sử dụng full join (join)
-- Từ bảng Products và categories, hãy in ra các thông tin sau đây
-- Mã thể loại, Tên thể loại, Mã sp, tên sp
select c.CategoryID, c.CategoryName, pro.ProductID, pro.ProductName
from Categories as c
full join Products as pro
on c.CategoryID = pro.CategoryID
