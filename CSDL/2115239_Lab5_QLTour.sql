/* Học phần: Cơ sở dữ liệu
   Người thực hiện: Trần Văn Nam
   MSSV: 2115239
   Lớp: CTK45A
   Ngày bắt đầu: 15/02/2023
   Ngày kết thúc: 5/4/2022
*/	
----------ĐỊNH NGHĨA CƠ SỞ DỮ LIỆU----------------
create database Lab5_QLTour
go
use Lab5_QLTour
go
create table Tour
(
MaTour char(4) primary key,
TongSoNgay bigint not null
)

go
create table ThanhPho
(
MaTP char(2) primary key,
TenTP nvarchar(20) not null

)

go
create table Tour_TP
(
MaTour char(4) references Tour( MaTour),
MaTP char(2) references ThanhPho( MaTP),
SoNgay int not null,
primary key(MaTour,MaTP)
)

go 
create table Lich_TourDL
(
MaTour char(4) references Tour(MaTour),
NgayKH datetime,
TenHDV nvarchar(10) ,
SoNguoi int,
TenKH nvarchar(30) 

)
-------------NHAP DU LIEU CHO CAC BANG-----------
--nhap du lieu cho cac bang
insert into Tour values ('T001','3')
insert into Tour values ('T002','4')
insert into Tour values ('T003','5')
insert into Tour values ('T004','7')

--xem bang Tour
select *from Tour

insert into ThanhPho values( '01',N'Đà Lạt')
insert into ThanhPho values( '02',N'Nha TRang')
insert into ThanhPho values( '03',N'PhanThiết')
insert into ThanhPho values( '04',N'Huế')
insert into ThanhPho values( '05',N'Đà Nẵng')

--xem bang thanh pho
select * from ThanhPho

insert into Tour_TP values('T001','01','2')
insert into Tour_TP values('T001','03','1')
insert into Tour_TP values('T002','01','2')
insert into Tour_TP values('T002','02','2')
insert into Tour_TP values('T003','02','2')
insert into Tour_TP values('T003','01','1')
insert into Tour_TP values('T003','04','2')
insert into Tour_TP values('T004','02','2')
insert into Tour_TP values('T004','05','2')
insert into Tour_TP values('T001','04','3')

--xem bang tour_tp
select *from Tour_TP

set dateformat dmy
go
insert into Lich_TourDL values('T001','14/02/2017',N'Vân','20',N'Nguyễn Hoàng')
insert into Lich_TourDL values('T002','14/02/2017',N'Nam','30',N'Lê Ngọc')
insert into Lich_TourDL values('T002','6/03/2017',N'Hùng','20',N'Lý Dũng')
insert into Lich_TourDL values('T003','18/02/2017',N'Dũng','20',N'Lý Dũng')
insert into Lich_TourDL values('T004','18/02/2017',N'Hùng','30',N'Dũng Nam')
insert into Lich_TourDL values('T003','10/03/2017',N'Nam','45',N'Nguyễn An')
insert into Lich_TourDL values('T002','28/04/2017',N'Vân','25',N'Ngọc Dung')
insert into Lich_TourDL values('T004','29/04/2017',N'Dũng','35',N'Lê Ngọc')
insert into Lich_TourDL values('T001','30/04/2017',N'Nam','25',N'Trần Nam')
insert into Lich_TourDL values('T003','15/06/2017',N'Vân','20',N'Trịnh Bá')

--xem bang lich_tourdl
select *from Lich_TourDL
----------------------------------------------------------------------
--Xem tất cả các quan hệ có trong CSDL
select * from Tour
select * from ThanhPho
select * from Tour_TP
select * from Lich_TourDL

----------------------------------------------------------------------
---------------------------TRUY VẤN DỮ LIỆU---------------------------
--a) cho biết các tour du lịch có tổng số ngày của tour từ 3 đến 5 ngày
select *
from Tour
where Tour.TongSoNgay >=3 and Tour.TongSoNgay<=5
--b) Cho biết thông tin các tour được tổ chức trong tháng 2 năm 2017
select A.MaTour, B.NgayKH
from Tour A,Lich_TourDL B
where A.MaTour=B.MaTour  and MONTH(B.ngaykh)=2 and YEAR(B.ngayKh)=2017
--c) Cho biết các tour không đi qua thành phố 'Nha Trang'
select *
from Tour
where tour.MaTour not in (select A.MaTour
							  from Tour_TP A, ThanhPho B
							  where A.MaTP = B.MaTp and B.TenTP= N'Nha Trang')
--d) cho biết số lượng thành phố mà mỗi tour du lịch đi qua
select TenTP,count(A.MaTP) as SoLuongTP
from ThanhPho A, Tour_TP B
where A.MaTP=B.MaTP 
group by TenTP
--(e) Cho biết số lượng tour du lịch mỗi hướng dẫn viên hướng dẫn
select B.TenHDV, count(B.MaTour) as SoLuong
from Lich_TourDL B
group by B.TenHDV
--(f)Cho biết tên thành phố có nhiều tour du lịch nhất
select A.MaTP,TenTP,count(B.MaTour) as SoLuongTour
from ThanhPho A, Tour_TP B
where A.MaTP=B.MaTP
group by A.MaTP, TenTP
having count(MaTour)>= all( select count(MaTour)
							from Tour_TP
							group by MaTP)
--(g) Cho biết thông tin của tour du lịch đi qua tất cả các thành phố
select A.MaTour, TongSoNgay, COUNT(B.MaTP) as SoLuongThanhPho
from Tour A, Tour_TP B
where A.MaTour=B.MaTour
group by A.MaTour,TongSoNgay
having COUNT(MaTP) -
	(select COUNT(*)
	from ThanhPho)=0

--(h) Lập danh sách các tour đi qua thành phố 'Đà Lạt', thông tin cần hiển thị bao gồm: MaTour, SoNgay
select A.MaTour, SoNgay,TenTP
from Tour_TP A,ThanhPho B
where A.MaTP=B.MaTP and B.TenTP=N'Đà Lạt'
--(i) Cho biết thông tin của tour du lịch có tổng số lượng khách tham quan nhiều nhất
select Lich_TourDL.MaTour, SUM(SoNguoi) SoKhach
from Lich_TourDL
group by MaTour
having SUM(SoNguoi)>=all
	(select SUM(SoNguoi)
	from Lich_TourDL
	group by Lich_TourDL.MaTour)
--(j) Cho biết tên thành phố mà tất cả các tour du lịch đều đi qua.
select A.MaTP, TenTP, COUNT(DISTINCT MaTour) as SoLuongTour
from ThanhPho A, Tour_TP B
where A.MaTP=B.MaTP
group by A.MaTP, TenTP
having COUNT(DISTINCT MaTour)-
		(select COUNT(*)
		from Tour)= 0