-- tính số lượng đơn đặt hàng trong năm 1997 của từng khách hàng
select CustomerID,
		count([OrderID]) as 'Đơn đặt hàng trong năm 1997 của từng khách hàng', 
		year(OrderDate) as'year' 
from Orders
where YEAR(OrderDate) = '1997'
group by CustomerID, year(OrderDate)
-- ý nghĩa ta sẽ group by theo mã khách hàng và theo năm trong đó năm phải thỏa
-- đk là 1997

--hãy lọc ra các đơn hàng đc đặt hàng vào tháng 5 năm 1997
select OrderDate
from Orders
where MONTH(OrderDate) = '5' and YEAR(OrderDate) = '1997'

-- lấy ds các đơn hàng được đạt hàng vào ngày 4 tháng 9 năm 1996
select OrderDate
from Orders
where OrderDate = '1996-9-4'

--lấy ds khách hàng đặt hàng trog năm 1998 và số đơn hàng mỗi tháng, sắp xếp tháng tăng dần
select CustomerID, MONTH(OrderDate) as 'Tháng', count(OrderID) as 'Số đơn'
from Orders
where year(OrderDate) = '1998'
group by CustomerID, MONTH(OrderDate)
order by MONTH(OrderDate) asc

--hãy lọc ra các đơn đặt hàng đã đc giao vào tháng 5, và sắp xếp tăng dần theo năm
select *
from Orders
where MONTH([ShippedDate]) = '5'
order by YEAR([ShippedDate]) asc