/* Học phần: Cơ sở dữ liệu
   Người thực hiện: Trần Văn Nam
   MSSV: 2115239
   Lớp: CTK45A
   Ngày bắt đầu: 15/02/2023
   Ngày kết thúc: 5/4/2022
*/	
----------ĐỊNH NGHĨA CƠ SỞ DỮ LIỆU----------------
CREATE DATABASE Lab03_QLHH -- lenh khai bao CSDL
go
--lenh su dung CSDL
use Lab03_QLHH
go
--lenh tao cac bang theo thứ tự đã xác định
create table HANGHOA
(MAHH	char(7) primary key,
TENHH	nvarchar(30) not null,
DVT		nvarchar(30),
SOLUONGTON tinyint 
)

create table DOITAC
(MADT	char(7) primary key,		 
TenDT	nvarchar(30) not null unique, 
DIACHI	nvarchar(50),
DIENTHOAI	char(15)
)


go
create table KHANANGCC
(
MADT char(7) references DOITAC(MADT),
MAHH char(7) references HANGHOA(MAHH),
primary key(MADT,MAHH)
)
go
create table HOADON
(
SOHD char(7) primary key,
NGAYLAPHOADON datetime,
MADT	char(7),
TONGTG int
)
--drop table HOADON
go
create table CT_HOADON
(
SOHD	char(7) references HOADON(SOHD),
MAHH char(7) references HANGHOA(MAHH),
DONGIA int, 
SOLUONG int 
)
go

--drop table CT_HOADON
-------------NHAP DU LIEU CHO CAC BANG-----------
--Nhap du lieu cho cac bang
insert into HANGHOA values('CPU01',N'CPU INTEL,CELERON 600 BOX',N'CÁI',5)
insert into HANGHOA values('CPU02',N'CPU INTEL,PIII 700', N'CÁI',10)
insert into HANGHOA values('CPU03',N'CPU AMD K7 ATHL,ON 600',N'CÁI',8)
insert into HANGHOA values('HDD01',N'HDD 10.2 GB QUANTUM',N'CÁI',10)
insert into HANGHOA values('HDD02',N'HDD 13.6 GB SEAGATE',N'CÁI',15)
insert into HANGHOA values('HDD03',N'HDD 20 GB QUANTUM',N'CÁI',6)
insert into HANGHOA values('KB01',N'KB GENIUS',N'CÁI',12)
insert into HANGHOA values('KB02',N'KB MITSUMIMI',N'CÁI',5)
insert into HANGHOA values('MB01',N'GIGABYTE CHIPSET INTEL',N'CÁI',10)
insert into HANGHOA values('MB02',N'ACOPR BX CHIPSET VIA',N'CÁI',10)
insert into HANGHOA values('MB03',N'INTEL PHI CHIPSET INTEL',N'CÁI',10)
insert into HANGHOA values('MB04',N'ECS CHIPSET SIS',N'CÁI',10)
insert into HANGHOA values('MB05',N'ECS CHIPSET VIA',N'CÁI',10)
insert into HANGHOA values('MNT01',N'SAMSUNG 14" SYNCMASTER',N'CÁI',5)
insert into HANGHOA values('MNT02',N'LG 14"',N'CÁI',5)
insert into HANGHOA values('MNT03',N'ACER 14"',N'CÁI',8)
insert into HANGHOA values('MNT04',N'PHILIPS 14"',N'CÁI',6)
insert into HANGHOA values('MNT05',N'VIEWSONIC 14"',N'CÁI',7)

select * from HANGHOA


insert into DOITAC values('CC001',N'Cty TNC',N'176 BTX Q1 - TPHCM','08.8250259')
insert into DOITAC values('CC002',N'Cty Hoàng Long',N'15A TTT Q1 – TP. HCM','08.8250898')
insert into DOITAC values('CC003',N'Cty Hợp Nhất',N'152 BTX Q1 – TP.HCM','08.8252376')
insert into DOITAC values('K0001',N'Nguyễn Minh Hải',N'91 Nguyễn Văn Trỗi Tp. Đà Lạt','063.831129')
insert into DOITAC values('K0002','Như Quỳnh',N'21 Điện Biên Phủ. N.Trang','058590270')
insert into DOITAC values('K0003',N'Trần nhật Duật',N'Lê Lợi TP. Huế','054.848376')
insert into DOITAC values('K0004','Phan Nguyễn Hùng Anh',N'11 Nam Kỳ Khởi nghĩa- TP. Đà lạt','063.823409')

select * from DOITAC


set dateformat dmy --định dạng nhập dữ liệu ngày tháng theo kiểu ngày tháng năm
go
insert into HOADON values('N0001','25/01/2006','CC001',NULL)
insert into HOADON values('N0002','01/05/2006','CC002',NULL)
insert into HOADON values('X0001','12/05/2006','K0001',NULL)
insert into HOADON values('X0002','16/06/2006','K0002',NULL)
insert into HOADON values('X0003','20/04/2006','K0001',NULL)

select * from HOADON


insert into KHANANGCC values('CC001','CPU01')
insert into KHANANGCC values('CC001','HDD03')
insert into KHANANGCC values('CC001','KB01')
insert into KHANANGCC values('CC001','MB02')
insert into KHANANGCC values('CC001','MB04')
insert into KHANANGCC values('CC001','MNT01')
insert into KHANANGCC values('CC002','CPU01')
insert into KHANANGCC values('CC002','CPU02')
insert into KHANANGCC values('CC002','CPU03')
insert into KHANANGCC values('CC002','KB02')
insert into KHANANGCC values('CC002','MB01')
insert into KHANANGCC values('CC002','MB05')
insert into KHANANGCC values('CC002','MNT03')
insert into KHANANGCC values('CC003','HDD01')
insert into KHANANGCC values('CC003','HDD02')
insert into KHANANGCC values('CC003','HDD03')
insert into KHANANGCC values('CC003','MB03')
--xem bang NhanVienKyNang
select * from KHANANGCC

insert into CT_HOADON values('N0001','CPU01',63,10)
insert into CT_HOADON values('N0001','HDD03',97,7)
insert into CT_HOADON values('N0001','KB01',3,5)
insert into CT_HOADON values('N0001','MB02',57,5)
insert into CT_HOADON values('N0001','MNT01',112,3)
insert into CT_HOADON values('N0002','CPU02',115,3)
insert into CT_HOADON values('N0002','KB02',5,7)
insert into CT_HOADON values('N0002','MNT03',111,5)
insert into CT_HOADON values('X0001','CPU01',67,2)
insert into CT_HOADON values('X0001','HDD03',100,2)
insert into CT_HOADON values('X0001','KB01',5,2)
insert into CT_HOADON values('X0001','MB02',62,1)
insert into CT_HOADON values('X0002','CPU01',67,1)
insert into CT_HOADON values('X0002','KB02',7,3)
insert into CT_HOADON values('X0002','MNT01',115,2)
insert into CT_HOADON values('X0003','CPU01',67,1)
insert into CT_HOADON values('X0003','MNT03',115,2)
--xem bang NhanVienKyNang
select * from CT_HOADON

----------------------------------------------------------------------
--Xem tất cả các quan hệ có trong CSDL
select * from HANGHOA
select * from DOITAC
select * from HOADON
select * from KHANANGCC
select * from CT_HOADON
----------------------------------------------------------------------



-- 1) Liệt kê các mặt hàng thuộc loại đĩa cứng.
SELECT *
FROM HangHoa
WHERE MaHH LIKE 'HDD%';

-- 2) Liệt kê các mặt hàng có số lượng tồn trên 10.
SELECT *
FROM HangHoa
WHERE soLuongTon > 10;

-- 3) Cho biết thông tin về các nhà cung cấp ở Thành phố Hồ Chí Minh
SELECT *
FROM DoiTac
WHERE diaChi LIKE '%HCM%';
-- 4) Liệt kê các hóa đơn nhập hàng trong tháng 5/2006, thông tin hiển thị gồm: 
-- sohd; ngaylaphd; tên, địa chỉ, và điện thoại của nhà cung cấp; số mặt hàng
select HOADON.SOHD, format(NGAYLAPHOADON,'dd/MM/yyyy') as NGAYLAPHOADON, TENDT, DIACHI, DIENTHOAI, SOLUONG
from HOADON, DOITAC,CT_HOADON
where DOITAC.MADT = HOADON.MADT
and   HOADON.SOHD = CT_HOADON.SOHD
and   MONTH(NGAYLAPHOADON) = 5
and   YEAR(NGAYLAPHOADON) = 2006

--Q5) Cho biết tên nhà cung cấp có thể cung cấp đĩa cứng
select TenDT
from HangHoa, DoiTac, KhanangCC
where HANGHOA.MAHH=KHANANGCC.MAHH and DOITAC.MADT=KHANANGCC.MADT
group by TenDT
--Q6) cho biết tên nhà cung cấp được tất cả các loại đĩa cứng
select TenDT, DIACHI, DIENTHOAI, COUNT(*) as SoLoaiDiaCung
from DoiTac, KhanangCC
where DOITAC.MADT=KHANANGCC.MADT and MAHH like 'HDD%'
group by DOITAC.MADT, DOITAC.TenDT, DIACHI, DIENTHOAI
having COUNT (*) = (select COUNT(*)
					from HANGHOA
					where MAHH like 'HDD%')
--Q7) Cho biết tên nhà cung cấp không cung cấp đĩa cứng
select TenDT, DIACHI, DIENTHOAI
from DoiTac, KhaNangCC
where DOITAC.MADT=KHANANGCC.MADT and DOITAC.MADT not in (select MADT
														from KHANANGCC
														where MAHH like 'HDD%')
--Q8) cho biết thông tin mặt hàng chưa bán được
select *
from HangHoa
where HANGHOA.MAHH not in (select DISTINCT MAHH
							from HOADON, CT_HOADON
							where HOADON.SOHD = CT_HOADON.SOHD AND HOADON.SOHD like 'X%')

 ----Q9: Cho biết tên và tổng số lượng bán của mặt hàng bán chạy nhất (tính theo số lượng)
select HANGHOA.MAHH, TENHH, SUM(SOLUONG) as SoLuongBan
from HANGHOA, HOADON, CT_HOADON
where HANGHOA.MAHH = CT_HOADON.MAHH AND HOADON.SOHD = CT_HOADON.SOHD
	AND HOADON.SOHD like 'X%'
group by HANGHOA.MAHH, TENHH
having SUM(CT_HOADON.SOLUONG) >= ALL 
				(select SUM(SOLUONG)
				from HOADON, CT_HOADON
				where HOADON.SOHD = CT_HOADON.SOHD AND HOADON.SOHD like 'X%'
				group by CT_HOADON.MAHH)
-----Q10: Cho biết tên và tổng số lượng bán của mặt hàng nhập về ít nhất
select HANGHOA.TENHH, SUM(CT_HOADON.SOLUONG) as TongSoLuong
from HANGHOA, CT_HOADON
where  HANGHOA.MAHH = CT_HOADON.MAHH
group by HANGHOA.TENHH
having SUM(CT_HOADON.SOLUONG) <= ALL 
					(select SUM(CT_HOADON.SOLUONG)
					from HANGHOA, CT_HOADON
					where HANGHOA.MAHH = CT_HOADON.MAHH
					group by HANGHOA.TENHH)
-----Q11: Cho biết hóa đơn nhập nhập nhiều mặt hàng nhất
select HOADON.SOHD, NGAYLAPHOADON, DOITAC.TenDT, COUNT(*)SoLuongMatHang
from HOADON, DOITAC, CT_HOADON
where HOADON.SOHD = CT_HOADON.SOHD AND HOADON.MADT = DOITAC.MADT AND HOADON.SOHD like 'N%'
group by HOADON.SOHD, NGAYLAPHOADON, DOITAC.TenDT
having count(*) >= all
				(select count(*)
				from HOADON, CT_HOADON
				where HOADON.SOHD = CT_HOADON.SOHD AND HOADON.SOHD like 'N%'
				group by HOADON.SOHD)
----Q12: Cho biết các mặt hàng không được nhập hàng trong tháng 1/2006
select MAHH, TENHH, DVT, SOLUONGTON
from HANGHOA
where HANGHOA.MAHH not in (select distinct MAHH	
							from HOADON, CT_HOADON
							where HOADON.SOHD = CT_HOADON.SOHD
							AND HOADON.SOHD like 'N%' 
							AND MONTH(NGAYLAPHOADON) = 1
							AND year(NGAYLAPHOADON) = 2006)
----Q13: Cho biết tên các mặt hàng không bán được trong tháng 6/2006
select MAHH, TENHH, DVT, SOLUONGTON
from HANGHOA
where HANGHOA.MAHH not in (select distinct MAHH
							from HOADON, CT_HOADON
							where HOADON.SOHD = CT_HOADON.SOHD 
							AND MONTH(NGAYLAPHOADON) = 6
							AND YEAR(NGAYLAPHOADON) = 2006)
-----Q14: Cho biết cửa hàng bán được bao nhiêu mặt hàng
select COUNT(*) as SoLuongMatHang
from HANGHOA
-----Q15: Cho biết số mặt hàng mà từng nhà cung cấp có khả năng cung cấp
select DOITAC.MADT, TenDT, DIACHI, DIENTHOAI, COUNT(*) as SoLuongMatHang
from DOITAC, KHANANGCC
where DOITAC.MADT = KHANANGCC.MADT
group by DOITAC.MADT, TenDT, DIACHI, DIENTHOAI
order by SoLuongMatHang desc
----Q16: Cho biết thông tin của khách hàng có giao dịch với cửa hàng nhiều nhất
select DOITAC.MADT, TenDT, DIACHI, DIENTHOAI, COUNT(*) as SoLanGiaoDich
from DOITAC, HOADON, CT_HOADON
where DOITAC.MADT = HOADON.MADT AND HOADON.SOHD = CT_HOADON.SOHD
	AND DOITAC.MADT like 'K%'
group by DOITAC.MADT, TenDT, DIACHI, DIENTHOAI
having COUNT(*) >= ALL (select COUNT(*)
						from HOADON, CT_HOADON
						where HOADON.MADT like 'K%'
						group by MADT)
----Q17: Tính tổng doanh thu năm 2006
select SUM(DONGIA*SOLUONG) as TongDoanhThu
from HOADON, CT_HOADON
where HOADON.SOHD = CT_HOADON.SOHD AND YEAR(NGAYLAPHOADON) = 2006
		AND HOADON.SOHD like 'X%'
----Q18: Cho biết loại mặt hàng bán chạy nhất
select HANGHOA.MAHH, TENHH, SUM(SOLUONG) as SoLuongBan
from HANGHOA, HOADON, CT_HOADON
where HANGHOA.MAHH = CT_HOADON.MAHH AND HOADON.SOHD = CT_HOADON.SOHD
	AND HOADON.SOHD like 'X%'
group by HANGHOA.MAHH, TENHH
having SUM(SOLUONG) >= all (select SUM(SOLUONG)
							from HOADON, CT_HOADON
							where HOADON.SOHD = CT_HOADON.SOHD 
							AND HOADON.SOHD like 'X%'
							group by CT_HOADON.MAHH)
----Q19: Liệt kê thông tin bán hàng của tháng 5/2006 bao gồm: mahh, tenhh, dvt, tổng số lượng, tổng thành tiền
select HANGHOA.MAHH, TENHH, DVT, SUM(SOLUONG) as TongSoLuong, SUM(DONGIA*SOLUONG) as TongThanhTien
from HANGHOA, HOADON, CT_HOADON
where HANGHOA.MAHH = CT_HOADON.MAHH AND HOADON.SOHD = CT_HOADON.SOHD AND MONTH(HOADON.NGAYLAPHOADON) = 5 AND YEAR(HOADON.NGAYLAPHOADON) = 2006
group by HANGHOA.MAHH, TENHH, DVT
order by TongSoLuong desc
----Q20: Liệt kê thông tin của mặt hàng có nhiều người mua nhất
select HANGHOA.MAHH, TENHH, SUM(CT_HOADON.SOLUONG) as SoLuongBan
from HANGHOA, HOADON, CT_HOADON
where HANGHOA.MAHH = CT_HOADON.MAHH AND HOADON.SOHD = CT_HOADON.SOHD
		AND HOADON.SOHD like 'X%'
group by HANGHOA.MAHH, TENHH
having SUM(SOLUONG) >= all (select SUM(SOLUONG)
							from HOADON, CT_HOADON
							where HOADON.SOHD = CT_HOADON.SOHD
							AND HOADON.SOHD like 'X%'
							group by CT_HOADON.MAHH)
----Q21: Tính và cập nhật tổng giá trị của các hóa đơn

-----
--III) Thủ tục, hàm
--Hàm)
---a) tính tổng só lượng nhập trong một khoảng thời gian của một mặt hàng cho trước
create function udf_TinhTongSLNhap_MaHH(@MAHH char(7),@TGBD datetime, @TGKT datetime)
returns bigint
as
begin
declare @TongSLNhap bigint
select @TongSLNhap = sum(SoLuong)
from HoaDon, CT_HOADON
where CT_HOADON.SOHD like 'N%'
and MAHH=@MAHH 
and NGAYLAPHOADON between @TGBD and @TGKT
return @TongSLNhap
end
set dateformat dmy
select dbo.udf_TinhTongSLNhap_MaHH('KB01','24/01/2006','1/5/2006') as 'TongSLNhap'
---c) tính tổng doanh thu trong một tháng cho trước
create function udf_TinhTongDoanhThuThang(@SOHD char(7),@Thang tinyint)
returns bigint
as
begin
declare @TongDoanhThu bigint
select @TongDoanhThu = sum(DONGIA*SoLuong)
from CT_HOADON, HOADON
where CT_HOADON.SOHD=@SOHD
and MONTH(NGAYLAPHOADON)=@Thang
return @TongDoanhThu
end
select dbo.udf_TinhTongDoanhThuThang('X0001',5) as 'TongDoanhThu'
---d) Tổng doanh thu của một mặt hàng trong một khoảng thời gian cho trước
create function udf_TongDoanhThuKTG_MAHH(@MAHH char(7),@TGBD datetime, @TGKT datetime)
returns bigint
as
begin
	declare @TongDT int
	select @TongDT = sum(DONGIA*SOLUONG)
	from CT_HOADON, HOADON
	where CT_HOADON.MAHH=@MAHH
	and NGAYLAPHOADON between @TGBD and @TGKT
	return @TongDT
end

---e) tính tổng số tiền nhập hàng trong một khoảng thời gian cho trước
drop function udf_TongSLNhap_SOHD
go
create function udf_TongSLNhap_SOHD(@TGBD datetime, @TGKT datetime)
returns bigint
as
begin
	declare @TongSLNhap bigint
	select @TongSLNhap= sum(SOLUONG)
	from CT_HOADON, HOADON
	where CT_HOADON.SOHD like 'N%'
	and NGAYLAPHOADON between @TGBD and @TGKT
	return @TongSLNhap
end
set dateformat dmy
select dbo.udf_TongSLNhap_SOHD('24/01/2006', '26/01/2006') as 'TongSLNhap'
--f) tính tổng số tiền của một hóa đơn cho trước
create function udf_TinhTongTienHD_SOHD(@SOHD char(7))
returns bigint
as
begin
declare @TongTienHD bigint
select @TongTienHD = sum(DONGIA*SOLUONG)
from CT_HOADON
where SOHD=@SOHD
return @TongTienHD

end
select dbo.udf_TinhTongTienHD_SOHD('N0002') as 'TongTienHD'
--B) Thủ tục
---a) cập nhật số lượng tồn của một mặt hangfkhi nhập hàng hoặc xuất hàng
create proc usp_CapNhatSLTon
			@MAHH char(7),
			@SOLUONGTON tinyint
as
		begin
			update HANGHOA
			set SOLUONGTON=@SOLUONGTON
			where MAHH=@MAHH
		end
go		

---b) cập nhật tổng trị giá của một hóa đơn
create proc usp_CapNhatTongTriGia
			@SOHD char(7),
			@TONGTG int
as
		begin
			update HOADON
			set TONGTG=@TONGTG
			where SOHD=@SOHD
		end
go	
---c) in đầy đủ thông tin của một hóa đơn
drop proc usp_InTTHoaDon

go
create proc usp_InTTHoaDon
			@SOHD char(7)
as
begin
select * 
from HOADON  
where SOHD=@SOHD
end
go
exec dbo.usp_InTTHoaDon 'X0001'
