--i
-- từ bảng order details hãy liệt kê các đơn đặt hàng có Unit Price
-- nằm trong phạm vi từ 100 đến 200
select OrderID
from [Order Details] as od
where od.UnitPrice between 100 and 200


--ii
-- đưa ra các đơn đặt hàng có quantity bằng 10 or 20
select od.OrderID
from [Order Details] as od
where od.Quantity in (10,20)
-- in trong TH này thì nó sẽ hiểu là chọn những dòng nào có quantity = 10 or 20

-- iii = i or ii
select od.*
from [Order Details] as od
where (od.Quantity in (10,20)) or (od.UnitPrice between 100 and 200)

-- iv = iii + distinct
select distinct od.OrderID
from [Order Details] as od
where (od.Quantity in (10,20)) or (od.UnitPrice between 100 and 200)

-- UNION
-- iv = i or ii + distinct
select od.OrderID
from [Order Details] as od
where od.UnitPrice between 100 and 200
union 
select od.OrderID
from [Order Details] as od
where od.Quantity in (10,20)

-- UNION ALL
-- iv = i or ii = 455 = 488 + 7 = số dòng i + ii
select od.OrderID
from [Order Details] as od
where od.UnitPrice between 100 and 200
union all
select od.OrderID
from [Order Details] as od
where od.Quantity in (10,20)


--Hãy liệt kê toàn bộ các thành phố và quốc gia tồn tại trong 2 tables suppliers và  sau đây vs 2 tình huống
-- sử dụng UNION, và UNION ALL
select distinct Country
from Suppliers
union 
select distinct Country
from Customers
-- union ko chấp nhận sự trùng lặp

select distinct Country
from Suppliers
union all
select distinct Country
from Customers
-- union all chấp nhận cả sự trùng lặp