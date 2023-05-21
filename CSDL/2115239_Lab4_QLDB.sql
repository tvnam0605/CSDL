/* Học phần: Cơ sở dữ liệu
   Người thực hiện: Trần Văn Nam
   MSSV: 2115239
   Lớp: CTK45A
   Ngày bắt đầu: 15/02/2023
   Ngày kết thúc: 5/4/2022
*/	
----------ĐỊNH NGHĨA CƠ SỞ DỮ LIỆU----------------
create database Lab4_QLDB
go
use Lab4_QLDB
go

create table BAO_TCHI
(
MaBaoTC	char(4) primary key,		 
Ten	nvarchar(100) not null,
DinhKy nvarchar(20) not null,
SoLuong int,
GiaBan int
)
go
create table PHATHANH
(
MaBaoTC	char(4) references BAO_TCHI(MaBaoTC),
SoBaoTC	int,
NgayPH date,
primary key(MaBaoTC, SoBaoTC)
)
go
create table KHACHHANG
(
MaKH char(4) primary key,
TenKH nvarchar(20),
DiaChi nvarchar(30)
)
go
create table DATBAO
(
MaKH char(4) references KHACHHANG(MaKH),
MaBaoTC char(4) references BAO_TCHI(MaBaoTC),
SLMua bigint,
NgayDM datetime,
primary key(MaKH,MaBaoTC)
)
-------------NHAP DU LIEU CHO CAC BANG-----------
--Nhap du lieu cho cac bang
insert into BAO_TCHI values('TT01',N'Tuổi trẻ',N'Nhật báo','1000','1500')
insert into BAO_TCHI values('KT01',N'Kiến thức ngày nay',N'Bán nguyệt san','3000','6000')
insert into BAO_TCHI values('TN01',N'Thanh niên',N'Nhật báo','1000','2000')
insert into BAO_TCHI values('PN01',N'Phụ nữ',N'Tuần báo','2000','4000')
insert into BAO_TCHI values('PN02',N'Phụ nữ',N'Nhật báo','1000','2000')

--xem bảng Chi nhanh
select * from BAO_TCHI

set dateformat dmy --định dạng nhập dữ liệu ngày tháng theo kiểu ngày tháng năm
go
--Nhap bang PHATHANH
insert into PHATHANH values('TT01','123','15/12/2005')
insert into PHATHANH values('KT01','70','15/12/2005')
insert into PHATHANH values('TT01','124','16/12/2005')
insert into PHATHANH values('TN01','256','17/12/2005')
insert into PHATHANH values('PN01','45','23/12/2005')
insert into PHATHANH values('PN02','111','18/12/2005')
insert into PHATHANH values('PN02','112','19/12/2005')
insert into PHATHANH values('TT01','125','17/12/2005')
insert into PHATHANH values('PN01','46','30/12/2005')

--xem bảng PHATHANH
select * from PHATHANH

--Nhap bang KHACHHANG
insert into KHACHHANG values('KH01',N'LAN',N'2 NCT')
insert into KHACHHANG values('KH02',N'NAM',N'32 THĐ')
insert into KHACHHANG values('KH03',N'NGỌC',N'16 LHĐ')

--xem bang KHACHHANG
select * from KHACHHANG


--nhap bang DATBAO
set dateformat dmy --định dạng nhập dữ liệu ngày tháng theo kiểu ngày tháng năm
go
insert into DATBAO values('KH01','TT01','100','12/01/2000')
insert into DATBAO values('KH02','TN02','150','01/05/2001')
insert into DATBAO values('KH01','PN01','200','25/06/2001')
insert into DATBAO values('KH03','KT01','50','17/03/2002')
insert into DATBAO values('KH03','PN02','200','26/08/2003')
insert into DATBAO values('KH02','TT01','250','15/01/2004')
insert into DATBAO values('KH01','KT01','300','14/10/2004')

--xem bang DATBAO
select * from DATBAO
----------------------------------------------------------------------
--Xem tất cả các quan hệ có trong CSDL
select * from BAO_TCHI
select * from PHATHANH
select * from KHACHHANG
select * from DATBAO
----------------------------------------------------------------------
----------------------------TRUY VẤN DỮ LIỆU--------------------------
--Q1) cho biết các tờ báo, tạp chí có định kì phát hành hàng tuần
select MaBaoTC, Ten,GiaBan
from Bao_TCHI
where BAO_TCHI.DinhKy=N'Tuấn báo'
--Q2) cho biết thông tin về các tờ báo thuộc loại báo phụ nữ( mã bắt đầu bằng PN)
select *
from Bao_Tchi
where BAO_TCHI.MaBaoTC like 'PN%'
--Q3) cho biết tên các khách hàng có đặt mua báo phụ nữ ( mã bắt đầu bằng PN) không liệt kê khách hàng trùng
select TenKH
from KhachHang A, DatBao B
where A.MaKH=B.MaKH and B.MaBaoTC like 'PN%'
--Q4) Cho biết tên khách hàng có đặt mua tất cả các báo phụ nữ (mã báo tạp chí bắt đầu bằng PN)
select A.TenKH as TenKH
from KHACHHANG A, DATBAO B
where A.MaKH=B.MaKH and B.MaBaoTC like 'PN%'
--Q5:Cho biết khách hàng không đặt mua báo thanh niên.
select A.MaKH, TenKH
from KHACHHANG A
where A.MaKH not in (select C.MaKH
					from DATBAO B, KHACHHANG C, BAO_TCHI F
					where B.MaKH=C.MaKH and Ten=N'Thanh niên')

--Q6: Cho biết số tờ báo mà mỗi khách hàng mua đã dặt mua.
select A.MaKH, A.TenKH,  A.DiaChi, SUM( SLMua) as TongSoLuong
from KHACHHANG A, DATBAO B
where A.MaKH=B.MaKH
group by A.MaKH, TenKH, DiaChi
--Q7: Cho biết số khách hàng đặt mua báo trong năm 2004.
select COUNT(DISTINCT MaKH) as SoKhachHang
from DATBAO
where YEAR(NgayDM)=2004
--Q8: Cho biết thông tin đặt mua báo của khách hàng ( TenKH, Ten, DinhKy, SLMua, So Tien), trong đó SoTien=SLMua*DonGia.
select A.TenKH, B.Ten, A.DiaChi, B.DinhKy,C.SLMua *GiaBan as SoTien
from KHACHHANG A, BAO_TCHI B, DATBAO C
where B.MaBaoTC=C.MaBaoTC and C.MaKH=A.MaKH

--Q9: Cho biết các tờ báo, tạp chí ( Ten, DinhKy) và tổng số lượng đặt mua của các khách hàng đối với tờ báo, tạp chí đó.
select Ten, DinhKy, SUM(SLMua) as TongSoLuongMua
from BAO_TCHI,DATBAO
where BAO_TCHI.MaBaoTC=DATBAO.MaBaoTC
group by Ten, DinhKy
order by TongSoLuongMua DESC
--Q10: Cho biết tên các tờ báo dành cho học sinh, sinh viên( có mã báo tạp chí bắt đầu bằng HS)
select *
from BAO_TCHI
where BAO_TCHI.MaBaoTC like 'HS%'
--Q11: Cho biết những tờ báo không có người đặt mua 
select *
from BAO_TCHI
where BAO_TCHI.MaBaoTC not in(
			select distinct MaBaoTC
			from DATBAO)
--Q12: Cho biết tên, định kỳ của những tờ báo có nhiều người đặt mua nhất.
select A.MaBaoTC, Ten, DinhKy, SUM(B.SLMua) as TongSoLuongMua
from BAO_TCHI A, DATBAO B
where A.MaBaoTC=B.MaBaoTC
group by  A.MaBaoTC, Ten, DinhKy
having SUM(SLMua)>=all (
		select SUM(SLMua)
		from DATBAO,BAO_TCHI
		where DATBAO.MaBaoTC=BAO_TCHI.MaBaoTC
		group by BAO_TCHI.MaBaoTC, BAO_TCHI.DinhKy)

--Q13: Cho biết khách hàng đặt mua nhiều báo, tạp chí nhất.
select A.MaKH, TenKH, DiaChi, SUM(SLMua) as TongSoluongMua
from KHACHHANG A, DATBAO B
where A.MaKH=B.MaKH
group by A.MaKH, TenKH, DiaChi
having SUM(SLMua)>= all(
		select SUM(SLMua)
		from DATBAO
		group by DATBAO.MaKH)
--Q14: Cho biết các tờ báo phát hành định kỳ một tháng 2 lần.
select *
from BAO_TCHI
where BAO_TCHI.DinhKy=N'Bán nguyệt san'
--Q15: Cho biết các tờ báo, tạp chi có từ 3 khách hàng đặt mua trở lên.
select A.MaBaoTC,Ten, DinhKy, count(DISTINCT MaKH) as SoLuongKhachDatMua
from BAO_TCHI A,DATBAO
group by A.MaBaoTC, Ten, DinhKy
having count(DISTINCT MaKH)>=3

---III) Hàm, thủ tục
--A) viết các hàm sau
---a) TÍnh tổng số tiền mua báo/tạp chí của một khách hàng cho trước
create function udf_TinhTongTien_MAKH(@MAKH char(4))
returns bigint
as
begin
declare @TongTienMua bigint
select @TongTienMua = sum(SOLUONG*GIABAN)
from BAO_TCHI, DATBAO
where MaKH=@MAKH
return @TongTienMua
end
select dbo.udf_TinhTongTien_MAKH('KH01') as 'TongTienMua'
---b) TÍnh tổng số tiền thu được của một tờ báo/tạp chí cho trước
create function udf_TongTienThuDuoc_SOBAOTC(@MABAOTC char(4))
returns bigint
as
begin
declare @TongTienThu bigint
select @TongTienThu = sum(SOLUONG*GiaBan)
from BAO_TCHI
where MaBaoTC=@MABAOTC
return @TongTienThu
end

select dbo.udf_TongTienThuDuoc_SOBAOTC('PN02') as 'TongTienThuDuoc'
--B) Viết các thủ tục sau
---a) in danh mục báo, tạp chí phải giao cho một khách hàng cho trước
drop proc usp_InDSTC_MAKH
go
create proc usp_InDSTC_MAKH(@MAKH char(4))
as
select * from DATBAO,BAO_TCHI 
where MaKH = @MAKH

--group by DATBAO.MaBaoTC,Ten,DinhKy,SoLuong,GiaBan, DATBAO.MaKH,SLMua,NgayDM,DATBAO.MaBaoTC
go
exec dbo.usp_InDSTC_MAKH 'KH01'

---b) in danh sách khách hàng đặt mua báo/Tạp chí cho trước
create proc usp_InDSKH_MABAOTC(@MABaoTC char(4))
as
select * from DATBAO, KHACHHANG
where MaBaoTC=@MABaoTC
go
exec dbo.usp_InDSKH_MABAOTC 'TT01'