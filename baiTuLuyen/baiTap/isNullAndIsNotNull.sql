-- lấy ra all các đơn hàng chưa đc giao hàng (shippedDate => null)
select *
from Orders
where ShippedDate is null

select count(*) as 'Số đơn hàng chưa được giao cho khách'
from Orders
where ShippedDate is null

--lấy ds các khách hàng có khu vực (Region) không bị null
select CustomerID, Region
from Customers
where Region is not null

-- lấy ds các khách hàng ko có tên công ty (companyName)
select *
from Customers
where CompanyName is null

-- hãy all các đơn hàng chưa đc giao hàng và có khu vực giao hàng (shipRegion) ko bị null
select *
from Orders
where ShippedDate is null and ShipRegion is not null