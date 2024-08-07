--hãy cho biết những khách hag nào đã đặt nhìu hơn 20 đơn hàng, sắp xếp theo thứ tự
-- tổng số đơn hàng giảm dần
select CustomerID, COUNT(OrderID) as 'Tổng đơn hàng lớn hớn 20'
from Orders
group by CustomerID
having COUNT(OrderID) > 20
order by COUNT(OrderID) desc


-- hãy lọc ra những nhà cug cấp sp có tổng số lượng hàng trong kho (UnitsInStock) lớn
-- hơn 30 và có trung bình đơn giá (UnitPrice) có giá trị dưới 50
select  SupplierID, avg(UnitPrice) as 'Trung bình giá' ,sum(UnitsInStock) as 'Hàng trong kho'
from Products
group by SupplierID
having sum(UnitsInStock) > 30 and avg(UnitPrice) < 50

--hãy cho bít tổng số tiền vận chuyển của từng tháng, trong nữa năm sau của năm 1996
-- sắp xếp theo tháng tăng dần. Tổng tiền vận chuyển lớn hơn 1000 đô
select month(ShippedDate) as 'Thang', sum(Freight) as 'Tổng tiền vận chuyển'
from Orders
where month(ShippedDate) > 6 and year(ShippedDate) = '1996'
group by month(ShippedDate)
having sum(Freight) > 1000
order by month(ShippedDate) asc

-- hãy lọc ra những thành phố có số lượng đơn hàng > 16 và sắp xếp theo tổng số lượng
-- giảm dần
select ShipCity, count(OrderID) as 'Tổng đơn hàng'
from Orders
group by ShipCity
having count(OrderID) > 16
order by count(OrderID) desc