USE [NORTHWND]
-- lấy ra những tên quốc gia khác nhau trong bảng customers
select distinct [Country]
from[dbo].[Customers]

-- viết câu lệnh sql lấy ra tên các mã số bưu điện (postalCode) khác nhau
--từ bảng nhà cung cấp
select distinct [PostalCode]
from[dbo].[Suppliers]

-- viết câu lệnh spl lấy ra các dữ liệu khác nhau về họ của nhân viên (lastName) và
-- cách gọi danh hiệu lịch sự (titlOfCourtesy) của nhân viên từ bảng Employees

select distinct LastName, TitleOfCourtesy
from Employees

--Viết câu lệnh spl lấy ra mã đơn vị vận chuyển (shipVia) khác nhau của các đơn hàng
-- orders
select distinct ShipVia
from Orders