use [NORTHWND]

-- hãy lọc ra all các khách hàng đến từ các quốc gia (country) bắt đầu bằng
-- 'A' trong bảng customers
select[ContactName], [Country]
from Customers
where [Country] like 'a%' -- bắt đầu nó phải là chữ a còn % đại diện cho 
-- khúc sau nó có chữ j cũng đc

--lấy ds các đơn đặt hàng đc gửi đến các thành phố có chứa chứ 'a'
-- trong bảng orders
select [OrderID], [ShipCity]
from Orders
where ShipCity like '%a%'
--%a%: khúc đầu nó có cái j cũng đc, khúc sau nó có cái j cũng đc miễn là
-- nó có chứa chữ a

-- hãy lọc ra all đơn hàng với đk: 
-- shipCountry LIKE 'U_'
-- shipCountry LIKE 'U%'
select OrderID, ShipCountry
from Orders
where ShipCountry like 'U_'

select OrderID, ShipCountry
from Orders
where ShipCountry like 'U%'

--hãy lấy ra all các nhà cung cấp hàng có chữ 'b' trong tên của công ty
select CompanyName
from Suppliers
where CompanyName like '%b%'