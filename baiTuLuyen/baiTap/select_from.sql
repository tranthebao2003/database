use[NORTHWND]
--(comment). viet cau lenh sql lay ra ten cua all san pham
select[ProductName]
from[dbo].[Products];

-- viet cau lenh sql lay ra ten san pham, gia ban tren moi don vi, so luong san pham tren don vi
select[ProductName], [UnitPrice], [QuantityPerUnit]
from[dbo].[Products];

-- viet cau lenh sqpl lay ra ten cong ty cua khach hang va quoc gia cua cac khach hang do
select[CompanyName], [Country]
from[dbo].[Customers];

-- viet cau lenh sql lay ra ten va so dien thoai cua all cac nha cung cap hang
select[CompanyName], [Phone]
from[dbo].[Suppliers];

-- viet cau lenh sql lay ra all du lieu tu bang products
select*
from [dbo].[Products];

-- viet cau lenh sql lay ra all du lieu tu bang khach hang
select*
from[dbo].[Customers];

--viet cau lenh lay all du lieu tu bang nha cung cap
select*
from[dbo].[Suppliers];
fff