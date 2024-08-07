-- thêm 1 khách hàng mới
insert into Customers([CustomerID], [CompanyName], [ContactName], [Phone])
values('KH123', 'TITV.VN', 'Tran The Bao', '0123456789')

-- thêm nhìu khách hàng cùng 1 lúc
insert into Customers([CustomerID], [CompanyName], [ContactName], [Phone])
values 
('KH125', 'TITV.VN', 'Tran The Hai', '0123456789'),
('KH124', 'TITV.VN', 'Tran Hung', '0123459841'),
('KH126', 'TITV.VN', 'Tran Bay', '0123459456')

-- thêm 1 sp mới
insert into Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock)
values ('New product', 1, 2, '24 bottles', 10.99, 100)