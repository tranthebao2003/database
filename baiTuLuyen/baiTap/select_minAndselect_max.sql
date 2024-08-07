use [NORTHWND]

-- Viết câu lệnh sql tìm giá thấp nhất của các sản phẩm trong bảng products
select min([UnitPrice]) as "MinPrice" -- nếu ko đặt tên MinPrice thì cột min mik lấy ra nó ko có tên
from[dbo].[Products]

-- viết câu lệnh lấy ra ngày đặt hàng gần đây nhất từ bảng orders
select max([ShippedDate]) as "Ngày đặt hàng gần đây nhất"
from[dbo].[Orders]

-- viết câu lệnh tìm ra số lượng hàng tồn kho lớn nhất trong bảng products
select max([UnitsInStock]) as "Số lượng hàng tồn kho lớn nhất"
from [dbo].[Products]

-- hãy cho biết ngày sinh của nhân viên có tuổi đời lớn nhất công ty trong bảng
-- employees
select min([BirthDate]) as "Nhân viên lớn tuổi nhất"
from[dbo].[Employees]