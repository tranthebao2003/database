select *
into customers_2
from Customers

-- cập nhật thông tin 1 khách hàng trong bảng customers.
-- dưới đây là cách cập nhật địa chỉ của khách hàng có 
-- customerID là "ALFKI"
update customers_2 
set customers_2.Address = 'New address'
where customers_2.CustomerID = 'ALFKI'


select *
into product_2
from Products
-- tăng toàn bộ sp trong bảng product lên 10%
update product_2
set UnitPrice = UnitPrice * 1.1 

--cập nhật thông tin của sp có productID
-- là 7 trong bảng products để thay đổi tên sp
-- "Máy tính xách tay mới" và cập nhật giá bán thành 
-- 999.99 đô la
update product_2
set ProductName = 'Máy tính xách tay mới', UnitPrice = 999.99
where ProductID = 7

-- hãy cập nhật thông tin của all các khách hàng trong bảng customers
-- có thành phố là paris để thay đổi quốc gia của họ thành pháp
update customers_2
set Country = 'Pháp'
where City = 'paris'
