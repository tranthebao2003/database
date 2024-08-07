use[NORTHWND]
-- viết câu lệnh spl lấy ra 5 dòng đầu tiên trong bảng customers
select top 5 * --lấy 5 dòng đầu tiên của all các cột trong bản customers
from Customers;

-- viết câu lệnh sql lấy ra 30% nhân viên của công ty hiện tại
select top 30 percent * --lấy 30% số nhân viên của all các cột trong bản employees
from Employees

-- viết câu lệnh sql lấy ra các mã khách hàng trong bảng đơn hàng
-- trùng lặp, chỉ lấy 5 dòng dữ liệu đầu tiên 
-- (kết hợp 2 lệnh select distinct và select top)
select distinct top 5[CustomerID]
from Orders

-- viết câu lệnh sql lấy ra các sản phẩm có mã thể loại không bị trùng lặp
-- và chỉ lấy 3 dòng đầu tiên (trong bản product)
select distinct top 3 [CategoryID]
from[dbo].[Products]