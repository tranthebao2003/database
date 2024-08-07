--bt1(join): liệt kê tên sp và tên nhà cug cấp của sp đc đặt hag trong bảng (ko trung lặp)
-- order datails. Sử dụng join để kết hợp bảng 'order details' vs các bảng liên quan
-- để lấy thông tin sp và nhà cung cấp
select distinct pro.ProductName, Suppliers.CompanyName
from [Order Details] as od
join Products as pro
on od.ProductID = pro.ProductID
join Suppliers
on pro.SupplierID = Suppliers.SupplierID

--bt2(left join): liệt kê tên khách hàng và tên nhân viên phụ trách của các đơn hàng trong bảng
-- order. Bao gồm các đơn hàng ko có nhân viên phụ trách. Sử dùng left join để kết hợp bảng order
-- vs bảng employees để lấy thông tin về khách hàng và nhân viên phụ trách
select em.LastName, em.FirstName, cus.ContactName
from Employees as em --bảng trái
left join Orders as o -- bảng phải
on em.EmployeeID = o.EmployeeID
join Customers as cus
on cus.CustomerID = o.CustomerID


-- bt3(right join): liệt kê tên khách hàng và tên nhân viên phụ trách của các đơn hàng trong bảng
-- order. Bao gồm cả các khách hàng ko có đơn hàng. Sử dụng right join để kết
-- hợp bảng orders vs bảng customers để lấy thông tin về khách hàng và nhân viên phụ trách
-- Bài tập 3 (RIGHT JOIN):
SELECT o.OrderID, e.FirstName, e.LastName, c.CompanyName
FROM [dbo].[Orders] o
RIGHT JOIN [dbo].[Employees] e
ON o.EmployeeID = e.EmployeeID
RIGHT JOIN [dbo].[Customers] c
ON o.CustomerID = c.CustomerID;

-- Bai tap 4:
-- Bài tập 4 (FULL JOIN): Liệt kê tên danh mục và tên 
-- nhà cung cấp của các sản phẩm trong bảng "Products". 
-- Bao gồm cả các danh mục và nhà cung cấp không có sản phẩm. 
-- Sử dụng FULL JOIN hoặc kết hợp LEFT JOIN và RIGHT JOIN để lấy  
-- thông tin về danh mục và nhà cung cấp.
SELECT p.ProductID, p.ProductName, s.CompanyName, c.CategoryName
FROM [dbo].[Products] p
FULL JOIN [dbo].[Suppliers] s
ON p.SupplierID = s.SupplierID
FULL JOIN [dbo].[Categories] c
ON p.CategoryID = c.CategoryID;