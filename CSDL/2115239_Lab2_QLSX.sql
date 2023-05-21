/* Học phần: Cơ sở dữ liệu
   Người thực hiện: Trần Văn Nam
   MSSV: 2115239
   Lớp: CTK45A
   Ngày bắt đầu: 15/02/2023
   Ngày kết thúc: 5/4/2022
*/	
CREATE DATABASE Lab02_QLSX -- lenh khai bao CSDL
go
-- lenh su dung CSDL
use Lab02_QLSX
go
create table ToSanXuat
(MaTSX nchar(4) primary key,
TenTSX	nvarchar(20) not null
);
go
create table SanPham
(MaSP	char(5) primary key,
TenSP	nvarchar(20) not null,
DVT nvarchar(5) not null,
TienCong money
);
go
create table CongNhan
(MaCN char(5) primary key,
Ho	nvarchar(30) not null,
Ten nvarchar(10)	not null,
Ngaysinh	date not null,
Phai nvarchar(5) not null,
MaTSX	nchar(4)	references ToSanXuat(MaTSX)
);
go
create table ThanhPham
(MaCN char(5) references CongNhan(MaCN),
MaSP char(5 ) references SanPham(MaSP),
Ngay date ,
SoLuong integer not null,
primary key(MaCN,MaSP,Ngay)
);

-------------NHAP DU LIEU CHO CAC BANG-----------
--Nhap du lieu cho cac bang
insert into ToSanXuat values('TS01',N'Tổ 1')
insert into ToSanXuat values('TS02',N'Tổ 2')

--Nhap bang SanPham
insert into SanPham values('SP001',N'Nồi đất',N'cái',N'10,000')
insert into SanPham values('SP002',N'Chén',N'cái',N'2,000')
insert into SanPham values('SP003',N'Bình gốm nhỏ',N'cái',N'20,000')
insert into SanPham values('SP004',N'Bình gốm lớn',N'cái',N'25,000')

--Nhap bang CongNhan
set dateformat dmy --định dạng nhập dữ liệu ngày tháng theo kiểu ngày tháng năm
go
insert into CongNhan values('CN001',N'Nguyễn Trường',N'An','10/06/1960','Nam','TS01')
insert into CongNhan values('CN002',N'Lê Thị Hồng',N'Gấm','20/04/1970',N'Nữ','TS01')
insert into CongNhan values('CN003',N'Nguyễn Công',N'Thành','25/06/1975','Nam','TS02')
insert into CongNhan values('CN004',N'Võ Hữu',N'Hạnh','25/03/1975','Nam','TS02')
insert into CongNhan values('CN005',N'Lý Thanh',N'Hân','01/12/1980',N'Nữ','TS01')

--nhap bang ThanhPham
insert into ThanhPham values('CN001','SP001','01/02/2007','10')
insert into ThanhPham values('CN002','SP001','01/02/2007','5')
insert into ThanhPham values('CN003','SP002','12/01/2007','50')
insert into ThanhPham values('CN004','SP003','12/01/2007','10')
insert into ThanhPham values('CN005','SP002','13/01/2007','100')
insert into ThanhPham values('CN002','SP004','14/02/2007','10')
insert into ThanhPham values('CN001','SP003','15/02/2007','15')
insert into ThanhPham values('CN003','SP001','14/01/2007','20')
insert into ThanhPham values('CN003','SP004','19/02/2007','15')
insert into ThanhPham values('CN004','SP002','14/01/2007','100')
insert into ThanhPham values('CN005','SP003','01/02/2007','50')
insert into ThanhPham values('CN001','SP001','20/02/2007','30')
----------------------------------------------------------------------
--Xem tất cả các quan hệ có trong CSDL
select * from ToSanXuat
select * from SanPham
select * from ThanhPham
select * from CongNhan
----------------------------------------------------------------------
--Q1: Liệt kê các công nhân theo tổ sản xuất gồm các thông tin: TSX, HoTen, NgaySinh, Phai (xếp thứ tự tăng dần của tên tổ sản xuất, Tên của công nhân)
select a.TenTSX, b.Ho + ' ' + b.Ten as HoTen, b.Ngaysinh, b.Phai
from ToSanXuat a, CongNhan  b
where a.MaTSX=b.MaTSX
order by a.TenTSX, b.Ten
go
--Q2: Liệt kê các thành phẩm mà công nhân 'Nguyễn Tường An' đã làm được gồm các thông tin: TenSP, Ngay, SoLuong, ThanhTien (xếp theo thứ tự tăng dần của ngày)
select a.TenSP, b.Ngay, b.SoLuong, b.SoLuong * a.TienCong as ThanhTien
from SanPham a, ThanhPham b, CongNhan c
where a.MaSP=b.MaSP and c.MaCN=b.MaCN and Ho+' '+Ten=N'Nguyễn Trường An'
order by b.Ngay
go
--Q5: Thống kê số lượng công nhân theo từng tổ sản xuất
select	a.MaTSX, TenTSX, COUNT(MaCN) as SoLuongCN
from ToSanXuat a, CongNhan b
where a.MaTSX=b.MaTSX
group by a.MaTSX, a.TenTSX
go
--Q6: Tổng số lượng thành phẩm theo từng loại mà mỗi nhân viên làm được
select Ho, Ten, TenSP, SUM(SoLuong) as TongSLThanhPham, SUM(TienCong*SoLuong) as TongThanhTien
from ThanhPham a, CongNhan b, SanPham c
where a.MaCN=b.MaCN and c.MaSP=a.MaSP
group by Ho, Ten, c.TenSP
go
--Q7: Tổng số tiền công đã trả cho công nhân trong tháng 1 năm 2007
select SUM(soluong*tiencong) as ThanhTien
from ThanhPham a, SanPham b
where b.MaSP=a.MaSP and MONTH(a.ngay)=1 and YEAR(a.Ngay)='2007'
go
--Q10: Tiền công tháng 2/2006 của công nhân viên có mã số 'CN002'
select MaCN, SUM(Tien) as TienCong
from(select (SoLuong * TienCong) as Tien, a.MaSP, MaCN 
from ThanhPham a, SanPham b
where a.MaSP=b.MaSP and MaCN='CN002' and MONTH(a.Ngay) =2 and YEAR(a.ngay)='2007'
group by MaCN, a.MaSP,TienCong,SoLuong) as a
group by MaCN
go
--Q11: Liệt kê các công nhân có sản xuất từ 3 loại sản phẩm trở lên
select MaCn, COUNT(MaSP) as LoaiSP
from ThanhPham
group by MaCN
having COUNT(MaSp)>=3
go
--Q12: Cập nhật giá tiền công của các loại bình gốm thêm 1000
update SanPham
set TienCong=TienCong+1000
where TenSP like N'Bình gốm %'
go
--Q13: Thêm bộ <'CN006','Lê Thị','Lan','Nữ','TS02'> vào bảng CongNhan
insert into CongNhan
values('CN006', N'Lê Thị', N'Lan', '10/10/2001',N'Nữ', N'TS02')
select *from CongNhan
go
-------------------------------------------------------------------------
--Q3: Liệt kê các nhân viên không sản xuất sảng phẩm 'Bình gốm lớn'
select a.MaCN, a.Ho+' '+a.Ten as HoTen
from CongNhan a
where a.MaCN not in (select c.MaCN
from SanPham b, ThanhPham c
where b.MaSP=c.MaSP and b.TenSP=N'Bình gốm lớn')
go
--Q4: Liệt kê các thông tin các công nhân có sản xuất cả 'Nồi đất' và 'Bình gốm nhỏ'
select a.MaCN, Ho+' '+Ten as HoTen
from CongNhan a, ThanhPham b, SanPham c
where a.MaCN=b.MaCN and b.MaSP =c.MaSP and c.TenSP=N'Nồi đất' and a.MaCN in 
		(select d.MaCN
	from ThanhPham d, SanPham e
	where d.MaSP=e.MaSP and e.TenSP=N'Bình gốm nhỏ')
group by a.MaCN, Ho, Ten
go	
--Q8: Cho biết sản phẩm được sản xuất nhiều nhất trong tháng 2/2007
select TenSP
from ThanhPham a, SanPham b
where a.MaSP=b.MaSP and MONTH(a.Ngay)=2 and year(a.Ngay)=2007
group by b.MaSp, TenSP
having sum(SoLuong)>=all(select sum(SoLuong)
from ThanhPham c, SanPham d
where c.MaSP=d.MaSP and month(Ngay)=2 and year(Ngay)=2007
group by d.MaSP)
go
--Q9: Cho biết công nhân sản xuất được nhiều 'Chén' nhất
select B.MaCN, Ho+' ' + Ten as HoTen
from SanPham A, ThanhPham B, CongNhan E
where A.MaSP=B.MaSP AND A.TenSP = N'Chén' AND B.MACN=E.MACN
group by B.MaCN, Ho,Ten
having SUM(SoLuong)>=ALL(select SUM(SoLuong) as TONGSOLUONG
from SanPham C, ThanhPham D
where C.MaSP=D.MaSP AND C.TenSP = N'Chén'
group by MaCN)
go

-- a. Tinh tong so cong nhan cua mot to san xuat cho truoc
create function udf_TongSoCongNhan(@matsx char(4)) returns bigint
As
begin
	declare @SoCongNhan int
	begin
	select @SoCongNhan = count(MaCN)
	from CongNhan
	where  MaTSX = @matsx
	end
return @SoCongNhan
end

-- b. Tinh tong san luong san xuat trong mot thang cua mot loai san pham cho truoc
create function udf_TongSanLuong(@masp char(4), @thang tinyint) returns bigint
As
Begin
	declare @SanLuong int
		Begin
		select @SanLuong = sum(SoLuong)
		from	SanPham A, ThanhPham B	
		where	A.MaSP = B.MaSP
			and month(Ngay) = @thang
			and B.MaSP = @masp
		End	
	 	
return @SanLuong
End
-- c. Tinh tong tien cong thang cua mot cong nhan cho truoc
create function udf_TongTienCong(@macn char(4), @thang tinyint) returns int
As
Begin
	declare @TongTien int
	begin
	select @TongTien = sum(TienCong * SoLuong)
	from	SanPham A, CongNhan B, ThanhPham C
	where	A.MaSP = C.MaSP
		and C.MaCN = B.MaCN
		and B.MaCN = @macn
		and month(Ngay) = @thang
	end
return @TongTien
End
select dbo.udf_TongTienCong('SP001', 1) as TongTienCong
-- d. Tinh tong thu nhap trong nam cua mot to san xuat cho truoc
create function udf_TongThuNhap(@matsx char(4), @nam int) returns int
As
Begin
	declare @ThuNhap int
	begin
	select @ThuNhap = sum(TienCong * SoLuong)
	from	SanPham A, CongNhan B, ThanhPham C, ToSanXuat D
	where	A.MaSP = C.MaSP
		and C.MaCN = B.MaCN
		and B.MaTSX = D.MaTSX
		and D.MaTSX = @matsx
		and year(ngay) = @nam
	end
return @ThuNhap
End
-- e. Tinh tong san luong san xuat cua mot loai san pham trong mot khoang thoi gian cho truoc
create function udf_TongSanLuong_KhoangTG(@matsx char(4), @bd int, @kt int) returns int
As
Begin
	declare @SanLuong_TG int
	begin
	select @SanLuong_TG = sum(TienCong * SoLuong)
	from	SanPham A, CongNhan B, ThanhPham C, ToSanXuat D
	where	A.MaSP = C.MaSP
		and C.MaCN = B.MaCN
		and B.MaTSX = D.MaTSX
		and D.MaTSX = @matsx
		and ngay >= @bd
		and ngay <= @kt
	end
return @SanLuong_TG
End
-- In danh sach cac cong nhan cua mot to san xuat cho truoc
create procedure usp_InCongNhan_MaTSX
@MaTSX	char(4)
as
begin
	select	MACN,Ho,Ten,Phai,NgaySinh
	from	CongNhan
	where	MaTSX=@MaTSX;
end

execute usp_InCongNhan_MaTSX 'TS01';
-- In bang cham cong san xuat trong thang cua mot cong nhan cho truoc
-- (bao gom Ten san pham, don vi tinh, so luong san xuat trong thang,
-- don gia, thanh tien)
create procedure usp_InBangChamCong_MACN_Thang
@MACN	char(5),
@Thang	tinyint
as
begin
	select	TenSP,DVT,sum(SoLuong) as 'TongSoLuong',TienCong as 'DonGia',sum(SoLuong*TienCong) as 'ThanhTien'
	from	ThanhPham join SanPham on ThanhPham.MaSP=SanPham.MaSP
	where	MACN=@MACN
	and	month(Ngay)=@Thang
	group by	TenSP,DVT,TienCong;
end;

execute usp_InBangChamCong_MACN_Thang 'CN003', 1;