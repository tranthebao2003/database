use[NORTHWND]
-- Viết câu lệnh sql lấy "CompanyName" và đặt tên thay thế là "Công ty"
-- và "PostalCode" và đặt tên thay thế là "Mã bưu điện" trong bảng customers
select CompanyName as "Công ty",
	   PostalCode as "Mã bưu điện"
from Customers

-- Viết câu lệnh lấy ra "LastName" và đặt tên thay thế là "họ"; "FirstName" và 
-- đặt tên thay thế là "Tên" của bảng employees
select LastName as "Họ", FirstName as "Tên"
from Employees

-- Viết câu lệnh sql lấy ra 15 dòng đầu tiên all các cột trong bảng Orders,
-- đặt tên thay thế cho bảng Orders là "o"
select top 15 o.*  --(sử dụng tên thay thế cho bảng order để truy vấn 15 dòng đầu tiên)
from Orders as "o"

-- Viết câu lệnh sql lấy ra các cột và đặt tên thay thế như sau:
-- productName => Tên sản phẩm, SupplierID => Mã nhà cung cấp, CategoryID => Mã thể loại
-- và đặt tên thay thế cho bảng Products là "p", sử dụng tên thay thế khi truy vấn các
-- cột bên trên. Và chỉ lấy ra 5 sản phẩm đầu tiên trong bảng

-- note: lệnh nó sẽ chạy từ trong ra ngoài
select top 5 ProductName as "Tên sản phẩm", SupplierID as "Mã nhà cung cấp",
	   CategoryID as "Mã thể loại" 
from Products as "p"