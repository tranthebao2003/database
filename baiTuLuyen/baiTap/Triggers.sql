-- trigger khi insert sẽ chuyển productName về viết hoa toàn bộ
create trigger makeProductNameUpperCase
on [dbo].[Products] 
after insert -- sau sự kiện thêm dòng vào
as
begin
	update Products
	set ProductName = UPPER(i.ProductName)
	from inserted as i 
	-- inserted: dòng ta vừa mới thêm
	where Products.ProductID = i.ProductID
end

-- chặn ko cho phép cập nhật discount sp nhỏ hơn 0
create trigger preventNegativeDiscount
on [dbo].[Order Details]
for update --trx khi dữ liệu thay đổi thì nó chạy cái đoạn bên dưới rồi
as
begin
	-- nếu tồn tại 1 dòng từ inserted (dòng mới update) mà [Discount] < 0
	-- thì ta sẽ chạy đoạn begin and ở dưới
	-- select 1 from inserted: này là chọn trả về giá trị 1 cột với số dòng đc chọn đầu tiên từ bảng inserted
	if exists (select 1 from inserted where [Discount] < 0) 
	begin
		rollback -- quay trở lại ko cho thực hiện
		raiserror('Discount không thể nhỏ hơn 0', 16, 1)
		-- raiserror('message text', severity, state)
	end
end

update [Order Details]
set Discount = -1
where [OrderID] = 10625 and [ProductID] = 60


--Viết 1 trigger trong cở sở dữ liệu để đảm bảo
-- rằng mỗi khi có 1 chi tiết đơn hàng mới đc thêm vào
-- số lượng tồn kho phải đc giảm đi

create trigger updateProductInventory
on [dbo].[Order Details]
after insert 
as
begin
	update [dbo].[Products]
	set UnitsInStock = UnitsInStock - i.[Quantity]
	from inserted as i
	where i.ProductID = Products.ProductID
end

--bt1
-- bổ xung thêm cột lastModified và tạo 1 trigger để sau khi 1 sp đc
-- thêm or cập nhật vào bảng "product" tự động cập nhật trường "LastModified"
-- với ngày và giờ hiện tại
alter table [dbo].[Products]
add lastModified date


create trigger addAndUpdateProtuct
on [dbo].[Products]
after insert, update --sau khi them hoặc cập nhật dữ liệu trong bản products
as
begin 
	update [dbo].[Products]
	set [lastModified] = getdate()
	from inserted
	where Products.ProductID = inserted.ProductID
	--Có điều kiện: Trigger chỉ áp dụng cập nhật cho các dòng dữ liệu đã được thêm mới hoặc cập nhật.
	--Không có điều kiện: Trigger sẽ áp dụng cập nhật cho tất cả các dòng trong bảng product
	--tóm lại nếu có điều kiện where thì khi update hay add 1 dòng nào thì nó sẽ cập nhật thời gian của dòng đó vào cột 
	--lasModified thôi còn nếu không có where thì khi mình sửa 1 dòng thì nó cập nhật toàn bộ dòng trong cột 
	--lastModified luôn
end



--bt2
-- tạo 1 trigger "instead of delete" để ktra xem khách hàng có đơn hàng
-- (orders) không. Nếu có, trigger không cho phép xóa khách hàng. Nếu không
-- có đơn hàng liên quan, trigger thực hiện xóa khách hàng
select *
into Orders_1
from Orders

create trigger insteadOfDelete
on [dbo].[customer_1]
instead of delete -- đây là trigger của sql thay cho vc xóa mặc định thì nó sẽ ktra những đk dưới rồi mới xóa hay ko
as 
begin 
	IF EXISTS (SELECT OrderID FROM Orders
				WHERE Orders.CustomerID IN (SELECT CustomerID FROM deleted))
				--SELECT CustomerID FROM deleted: chọn ra những customerID đang nằm
				--trong một bảng tạm(deleted) chứa dữ liệu về các khách hàng sẽ bị xóa
    BEGIN
        RAISERROR ('Không thể xóa khách hàng có đơn hàng.', 16, 1)
    END

    ELSE
    BEGIN
        DELETE FROM Customers WHERE CustomerID IN (SELECT CustomerID FROM deleted)
    END
end

