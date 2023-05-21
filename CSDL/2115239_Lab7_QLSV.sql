/* Học phần: Cơ sở dữ liệu
   Người thực hiện: Trần Văn Nam
   MSSV: 2115239
   Lớp: CTK45A
   Ngày bắt đầu: 15/02/2023
   Ngày kết thúc: 5/4/2022
*/	
create database Lab7_QLSV
go
use Lab7_QLSV
go
--lenh tao cac bang theo thứ tự đã xác định
create table KHOA
(
MSKhoa char (2) primary key,
TenKhoa nvarchar(20),
TenTat char(4)
)
go
create table LOP
(
MSLop char (4) primary key,
TenLop nvarchar(30),
MSKhoa char(2) references KHOA(MSKhoa),
NienKhoa char(4)
)
go
create table TINH
(
MSTinh char (2) primary key,
TenTinh nvarchar(20)
)
go
create table MONHOC
(
MSMH char(4) primary key,
TenMH nvarchar(20),
HeSo tinyint
)
go
create table SINHVIEN
(
MSSV char(7) primary key,
Ho nvarchar(30) not null,
Ten nvarchar(10) not null,
NgaySinh date,
MSTinh char(2) references TINH(MSTinh) ,
NgayNhapHoc date,
MSLop char(4) references LOP(MSLop),
Phai nvarchar(4),
DiaChi nvarchar(30) not null,
DienThoai char(20)
)
go
create table BANGDIEM
(
MSSV char(7),
MSMH char(4),
LanThi tinyint,
Diem float(2),
primary key(MSSV,MSMH,LanThi)
)
go
-------------NHAP DU LIEU CHO CAC BANG-----------
--Nhap du lieu cho cac bang
insert into KHOA values('01', N'Công nghệ thông tin', 'CNTT')
insert into KHOA values('02', N'Điện tử viễn thông', 'DTVT')
insert into KHOA values('03', N'Quản trị kinh doanh', 'QTKD')
insert into KHOA values('04', N'Công nghệ sinh học', 'CNSH')

select * from KHOA

insert into LOP values('98TH', 'Tin hoc khoa 1998', '01','1998')
insert into LOP values('98VT', N'Vien thong khoa 1998', '02','1998')
insert into LOP values('99TH', N'Tin hoc khoa 1999', '01','1999')
insert into LOP values('99VT', N'Vien thong khoa 1999', '02','1999')
insert into LOP values('99QT', N'Quan tri khoa 1999', '03','1999')

select * from LOP

insert into TINH values('01', N'An Giang')
insert into TINH values('02', N'TPHCM')
insert into TINH values('03', N'Dong Nai')
insert into TINH values('04', N'Long An')
insert into TINH values('05', N'Hue')
insert into TINH values('06', N'Ca Mau')

select * from TINH

set dateformat dmy
go

insert into SINHVIEN values('98TH001', 'Nguyen Van', 'An', '06/08/80', '01', '03/09/98', '98TH', 'Yes', '12 Tran Hung Dao, Q.1', '8234512')
insert into SINHVIEN values('98TH002', 'Le Thi', 'An', '17/10/79', '01', '03/09/98', '98TH', 'No', '23 CMT8, Q. Tan Binh', '0303234342')
insert into SINHVIEN values('98VT001', 'Nguyen Duc', 'Binh', '25/11/81', '02', '03/09/98', '98VT', 'Yes', '245 Lac Long Quan, Q.11', '8654323')
insert into SINHVIEN values('98VT002', 'Tran Ngoc', 'Anh', '19/08/80', '02', '03/09/98', '98VT', 'No', '242 Tran Hung Dao, Q.1', NULL)
insert into SINHVIEN values('99TH001', 'Ly Van Hung', 'Dung', '27/09/81', '03', '05/10/99', '99TH', 'Yes', '178 CMT8, Q. Tan Binh', '7563213')
insert into SINHVIEN values('99TH002', 'Van Minh', 'Hoang', '01/01/81', '04', '05/10/99', '99TH', 'Yes', '272 Ly Thuong Kiet, Q.10', '8341234')
insert into SINHVIEN values('99TH003', 'Nguyen', 'Tuan', '12/01/80', '03', '05/10/99', '99TH', 'Yes', '162 Tran Hung Dao, Q.5', NULL)
insert into SINHVIEN values('99TH004', 'Tran Van', 'Minh', '25/06/81', '04', '05/10/99', '99TH', 'Yes', '147 Dien Bien Phu, Q.3', '7236754')
insert into SINHVIEN values('99TH005', 'Nguyen Thai', 'Minh', '01/01/80', '04', '05/10/99', '99TH', 'Yes', '345 Le Dai Hanh, Q.11', NULL)
insert into SINHVIEN values('99VT001', 'Le Ngoc', 'Mai', '21/06/82', '01', '05/10/99', '99VT', 'No', '129 Tran Hung Dao, Q.1', '0903124534')
insert into SINHVIEN values('99QT001', 'Nguyen Thi', 'Oanh', '19/08/73', '04', '05/10/99', '99QT', 'No', '76 Hung Vuong, Q.5', '0901656324')
insert into SINHVIEN values('99QT002', 'Le My', 'Hanh', '20/05/76', '04', '05/10/99', '99QT', 'No', '12 Pham Ngoc Thach, Q.3', NULL)

select * from SINHVIEN

insert into MONHOC values('TA01', 'Nhap mon tin hoc', 2)
insert into MONHOC values('TA02', 'Lap trinh co ban', 3)
insert into MONHOC values('TB01', 'Cau truc du lieu', 2)
insert into MONHOC values('TB02', 'Co so du lieu', 2)
insert into MONHOC values('QA01', 'Kinh te vi mo', 2);
insert into MONHOC values('QA02', 'Quan tri chat luong', 3)
insert into MONHOC values('VA01', 'Dien tu co ban', 2)
insert into MONHOC values('VA02', 'Mach so', 3)
insert into MONHOC values('VB01', 'Truyen so lieu', 3)
insert into MONHOC values('XA01', 'Vat ly dai cuong', 2)

select * from MONHOC

insert into BANGDIEM values('98TH001', 'TA01', 1, 8.5)
insert into BANGDIEM values('98TH001', 'TA02', 1, 8)
insert into BANGDIEM values('98TH002', 'TA01', 1, 4)
insert into BANGDIEM values('98TH002', 'TA01', 2, 5.5)
insert into BANGDIEM values('98TH001', 'TB01', 1, 7.5)
insert into BANGDIEM values('98TH002', 'TB01', 1, 8)
insert into BANGDIEM values('98VT001', 'VA01', 1, 4)
insert into BANGDIEM values('98VT001', 'VA01', 2, 5)
insert into BANGDIEM values('98VT002', 'VA02', 1, 7.5)
insert into BANGDIEM values('99TH001', 'TA01', 1, 4)
insert into BANGDIEM values('99TH001', 'TA01', 2, 6)
insert into BANGDIEM values('99TH001', 'TB01', 1, 6.5)
insert into BANGDIEM values('99TH002', 'TB01', 1, 10)
insert into BANGDIEM values('99TH002', 'TB02', 1, 9)
insert into BANGDIEM values('99TH003', 'TA02', 1, 7.5)
insert into BANGDIEM values('99TH003', 'TB01', 1, 3)
insert into BANGDIEM values('99TH003', 'TB01', 2, 6)
insert into BANGDIEM values('99TH003', 'TB02', 1, 8)
insert into BANGDIEM values('99TH004', 'TB02', 1, 2)
insert into BANGDIEM values('99TH004', 'TB02', 2, 4)
insert into BANGDIEM values('99TH004', 'TB02', 3, 3)
insert into BANGDIEM values('99QT001', 'QA01', 1, 7)
insert into BANGDIEM values('99QT001', 'QA02', 1, 6.5)
insert into BANGDIEM values('99QT002', 'QA01', 1, 8.5)
insert into BANGDIEM values('99QT002', 'QA02', 1, 9)

select * from BANGDIEM

select * from KHOA
select * from LOP
select * from TINH
select * from MONHOC
select * from SINHVIEN
select * from BANGDIEM
----------------------------------------------------------------------
					------TRUY VẤN ĐƠN GẢN-------
-- 1) Liệt kê MSSV, Họ, Tên, Địa chỉ của tất cả các sinh viên
select MSSV, Ho,Ten,DiaChi
from SINHVIEN

-- 2) Liệt kê MSSV, Họ, Tên, MS Tỉnh của tất cả các sinh viên. 
-- Sắp xếp kết quả theo MS tỉnh, trong cùng tỉnh sắp xếp theo họ tên của sinh viên.
SELECT a.MSSV, a.Ho,a.Ten,a.DiaChi, b.MSTinh
FROM SINHVIEN a, TINH b
ORDER BY b.MSTinh, a.Ten, a.Ho

-- 3) Liệt kê các sinh viên nữ của tỉnh Long An
SELECT *
FROM SINHVIEN a, TINH b
WHERE a.MSTinh = b.MSTinh and Phai = 'No' AND b.TenTinh = 'Long An'

-- 4) Liệt kê các sinh viên có sinh nhật trong tháng giêng.
SELECT *
FROM SINHVIEN
WHERE MONTH(NgaySinh) = 1

-- 5) Liệt kê các sinh viên có sinh nhật nhằm ngày 1/1.
SELECT *
FROM SINHVIEN
WHERE MONTH(NgaySinh) = 1 AND DAY(NgaySinh) = 1

-- 6) Liệt kê các sinh viên có số điện thoại.
SELECT *
FROM SINHVIEN
WHERE DienThoai IS NOT NULL

-- 7) Liệt kê các sinh viên có số điện thoại di động.
SELECT *
FROM SINHVIEN 
WHERE DienThoai like '0%'

-- 8) Liệt kê các sinh viên tên ‘Minh’ học lớp ’99TH’
SELECT *
FROM SINHVIEN, LOP
WHERE Ten = 'Minh' AND LOP.MSLop = '99TH'

-- 9) Liệt kê các sinh viên có địa chỉ ở đường ‘Tran Hung Dao’
SELECT *
FROM SINHVIEN
WHERE DiaChi LIKE '%Tran Hung Dao%'

-- 10) Liệt kê các sinh viên có tên lót chữ ‘Van’ (không liệt kê người họ ‘Van’)
SELECT *
FROM SINHVIEN
WHERE Ho LIKE '% Van%'

-- 11) Liệt kê MSSV, Họ Ten (ghép họ và tên thành một cột), Tuổi của các sinh viên ở tỉnh Long An.
SELECT SINHVIEN.MSSV AS MSSV, Ho + ' ' + SINHVIEN.Ten AS HoTen, YEAR(GETDATE()) - YEAR(NgaySinh) AS Tuoi,
       TINH.TenTinh AS Tinh
FROM SINHVIEN, TINH
WHERE SINHVIEN.MSTinh = TINH.MSTinh
	and TINH.TenTinh = 'Long An'

-- 12) Liệt kê các sinh viên nam từ 23 đến 28 tuổi.
SELECT a.MSSV AS MSSV, Ho + ' ' + a.Ten AS HoTen,YEAR(GETDATE()) - YEAR(a.NgaySinh) AS Tuoi
FROM SINHVIEN a
WHERE a.Phai = 'Yes'
  AND YEAR(GETDATE()) - YEAR(a.NgaySinh) BETWEEN 23 AND 28

-- 13) Liệt kê các sinh viên nam từ 32 tuổi trở lên và các sinh viên nữ từ 27 tuổi trở lên.
SELECT MSSV AS MSSV, Ho + ' ' + Ten AS HoTen, YEAR(GETDATE()) - YEAR(NgaySinh) AS Tuoi
FROM SINHVIEN
WHERE (Phai = 'Yes'
       AND YEAR(GETDATE()) - YEAR(NgaySinh) >= 32)
  OR (Phai = 'No'
      AND YEAR(GETDATE()) - YEAR(NgaySinh) >= 27)

-- 14) Liệt kê các sinh viên khi nhập học còn dưới 18 tuổi, hoặc đã trên 25 tuổi.
SELECT SINHVIEN.MSSV AS MSSV,
       Ho + ' ' + Ten AS HoTen,
       YEAR(GETDATE()) - YEAR(NgaySinh) AS Tuoi
FROM SINHVIEN
WHERE (YEAR(NgayNhapHoc) - YEAR(NgaySinh) < 18)
  OR (YEAR(NgayNhapHoc) - YEAR(NgaySinh) > 25)

-- 15) Liệt kê danh sách các sinh viên của khóa 99 (MSSV có 2 ký tự đầu là ‘99’).
SELECT *
FROM SINHVIEN
WHERE MSSV LIKE '99%'

-- 16) Liệt kê MSSV, Điểm thi lần 1 môn ‘Co so du lieu’ của lớp ’99TH’
SELECT a.MSSV, b.Diem, b.LanThi, c.TenMH
FROM SINHVIEN a, BANGDIEM b, MONHOC c
WHERE b.MSSV = a.MSSV and c.MSMH=b.MSMH and b.MSSV like '99TH%' and LanThi = 1 and c.TenMH = 'Co so du lieu' 

-- 17) Liệt kê MSSV, Họ tên của các sinh viên lớp ’99TH’ thi không đạt lần 1 môn ‘Co so du lieu’
SELECT a.MSSV, b.Diem, b.LanThi, c.TenMH
FROM SINHVIEN a, BANGDIEM b, MONHOC c
WHERE b.MSSV = a.MSSV and c.MSMH=b.MSMH and b.MSSV like '99TH%' and LanThi = 1 and c.TenMH = 'Co so du lieu' AND b.Diem < 4

-- 18) Liệt kê tất cả các điểm thi của sinh viên có mã số ’99TH001’ theo mẫu sau:
SELECT b.MSMH,c.TenMH as 'Tên MH', b.LanThi as'Lần thi', b.Diem as 'Điểm'
FROM SINHVIEN a, BANGDIEM b, MONHOC c
WHERE b.MSSV = a.MSSV and c.MSMH=b.MSMH 
	and a.MSSV = '99TH001'

-- 19) Liệt kê MSSV, họ tên, MSLop của các sinh viên có điểm thi lần 1 môn 
-- ‘Co so du lieu’ từ 8 điểm trở lên
SELECT a.MSSV,  a.Ho + ' ' + a.Ten as HoTen, a.MSLop
FROM SINHVIEN a, BANGDIEM b, MONHOC c
WHERE b.MSSV = a.MSSV and c.MSMH=b.MSMH and b.MSSV like '99TH%' and LanThi = 1 and c.TenMH = 'Co so du lieu' 
	and CAST(Diem as float) >= 8.0
-- 20) Liệt kê các tỉnh không có sinh viên theo học
SELECT *
FROM TINH
WHERE TINH.MSTinh NOT IN
    (SELECT DISTINCT SINHVIEN.MSTinh
     FROM SINHVIEN)

-- 21) Liệt kê các sinh viên hiện chưa có điểm môn thi nào.
SELECT *
FROM SINHVIEN
WHERE SINHVIEN.MSSV NOT IN
    (SELECT DISTINCT BANGDIEM.MSSV
     FROM BANGDIEM)

-- 22) Thống kê số lượng sinh viên ở mỗi lớp theo mẫu sau: MSLop, TenLop, SoLuongSV
SELECT b.MSLop, b.TenLop, COUNT(*) AS SoLuongSV
FROM SINHVIEN a, LOP b
WHERE b.MSLop = a.MSLop
GROUP BY b.MSLop, b.TenLop
ORDER BY SoLuongSV

-- 23) Thống kê số lượng sinh viên ở mỗi tỉnh theo mẫu sau:
SELECT b.MSTinh, b.TenTinh AS 'Tên Tỉnh',
    SUM(CASE Phai
        WHEN 'Yes' THEN 1
        ELSE 0
    END) AS N'Số SV Nam',
SUM(CASE Phai
        WHEN 'No' THEN 1
        ELSE 0
    END) AS N'Số SV Nữ',
    COUNT(*) AS N'Tổng cộng'
FROM SINHVIEN a, TINH b
WHERE a.MSTinh = b.MSTinh
GROUP BY b.MSTinh,
         b.TenTinh

-- 24) Thống kê kết quả thi lần 1 môn ‘Co so du lieu’ ở các lớp, theo mẫu sau
SELECT a.MSLop, a.TenLop,
    COUNT(CASE
        WHEN b.Diem >= 4 THEN 1
        ELSE NULL
    END) AS N'Số SV đạt',
    (COUNT(CASE
        WHEN b.Diem >= 4 THEN 1
        ELSE NULL
    END) * 100 / COUNT(*)) AS N'Tỉ lệ đạt (%)',
    COUNT(CASE
        WHEN b.Diem < 4 THEN 1
        ELSE NULL
    END) AS N'Số SV không đạt',
    (COUNT(CASE
        WHEN Diem < 4 THEN 1
        ELSE NULL
    END) * 100 / COUNT(*)) AS N'Tỉ lệ không đạt '
FROM LOP a,BANGDIEM b, SINHVIEN c, MONHOC d
WHERE d.MSMH = b.MSMH
	AND c.MSSV = b.MSSV
	AND a.MSLop = c.MSLop
	AND LanThi = 1
	AND d.TenMH = 'Co so du lieu'
GROUP BY a.MSLop,a.TenLop

-- 25) Lọc ra điểm cao nhất trong các lần thi cho các sinh viên theo mẫu sau (điểm in ra của mỗi môn là điểm cao nhất trong các lần thi của môn đó):
SELECT a.MSSV ,c.MSMH ,c.TenMH ,c.HeSo AS N'Hệ số',MAX(a.Diem) AS 'Điểm x hệ số'
FROM BANGDIEM a, MONHOC c
where a.MSMH  = c.MSMH 
GROUP BY a.MSSV, c.MSMH,c.TenMH,c.HeSo
order by c.TenMH
-- 26) Lập bảng tổng kết theo mẫu
select	c.MSSV
,	c.Ho as N'Họ'
,	c.Ten as N'Tên'
,	sum(c.DiemxHeSo)/sum(c.HeSo) as N'ĐTB'
from	(
	select	a.MSSV
	,	Ho
	,	Ten
	,	HeSo
	,	Diem*HeSo as 'DiemxHeSo'
	from	(BANGDIEM a join MONHOC on a.MSMH=MONHOC.MSMH
	)join	SINHVIEN on a.MSSV=SINHVIEN.MSSV
	where	Diem>=all(
		select	max(Diem)
		from	BANGDIEM b
		where	a.MSMH=b.MSMH
		group by	b.MSMH
	)
) c
group by	c.MSSV,c.Ho,c.Ten

-- 27) Thống kê số lượng sinh viên tỉnh ‘Long An’ đang theo học ở các khoa, theo mẫu sau:
SELECT LOP.NienKhoa AS N'Năm học',
                        KHOA.MSKhoa AS 'MSKhoa',
                        KHOA.TenKhoa AS 'TenKhoa',
                        COUNT(*) AS N'Số lượng SV'
FROM SINHVIEN, TINH, LOP, KHOA
WHERE SINHVIEN.MSTinh = TINH.MSTinh
	and SINHVIEN.MSLop = LOP.MSLop
	and LOP.MSKhoa = KHOA.MSKhoa
	and TINH.TenTinh = 'Long An'
GROUP BY LOP.NienKhoa,
         KHOA.MSKhoa,
         KHOA.TenKhoa
go
-- 28) Nhập vào MSSV, in ra bảng điểm của sinh viên đó

create	proc usp_InBangDiem_MSSV
@MSSV	char(7)
as
begin
	select	MONHOC.MSMH
	,	TenMH as N'Tên MH'
	,	HeSo as N'Hệ số'
	,	Diem as N'Điểm'
	from	BANGDIEM a join MONHOC on a.MSMH=MONHOC.MSMH
	where	MSSV=@MSSV
	and	Diem>=all(
		select	max(Diem)
		from	BANGDIEM b
		where	a.MSMH=b.MSMH
		group by	b.MSMH
	)
end
;

execute	usp_InBangDiem_MSSV	'98TH001';

-- 29) Nhập vào MS lớp, in ra bảng tổng kết của lớp đó

create	procedure	usp_InBangTongKetLop_MSLop
@MSLop	char(4)
as
begin
	select	c.MSSV
	,	c.Ho as N'Họ'
	,	c.Ten as N'Tên'
	,	sum(c.DiemxHeSo)/sum(c.HeSo) as N'ĐTB'
	,	(
		case	when	sum(c.DiemxHeSo)/sum(c.HeSo)>=8.0
			then	N'Giỏi'
		else
			case	when	sum(c.DiemxHeSo)/sum(c.HeSo)>=6.5
				then	N'Khá'
			else
				case	when	sum(c.DiemxHeSo)/sum(c.HeSo)>=5
					then	N'Trung bình'
				else
					case	when	sum(c.DiemxHeSo)/sum(c.HeSo)>=3.5
						then	N'Yếu'
					else	N'Kém'
					end
				end
			end
		end
		)as	N'Xếp loại'
	from	(
		select	a.MSSV
		,	MSLop
		,	Ho
		,	Ten
		,	HeSo
		,	Diem*HeSo as 'DiemxHeSo'
		from	(BANGDIEM a join MONHOC on a.MSMH=MONHOC.MSMH
		)join	SINHVIEN on a.MSSV=SINHVIEN.MSSV
		where	Diem>=all(
			select	max(Diem)
			from	BANGDIEM b
			where	a.MSMH=b.MSMH
			group by	b.MSMH
		)
	) c
	where	c.MSLop=@MSLop
	group by	c.MSSV,c.Ho,c.Ten
end
;

execute	usp_InBangTongKetLop_MSLop	'98VT';

-------------------------------------------------------
-- Cập nhật dữ liệu
-- 30a) Tạo bảng SinhVienTinh trong đó chứa hồ sơ của các sinh viên (lấy từ table SinhVien) có quê quán không phải ở TPHCM.

drop table if exists SinhVienTinh;
create table SinhVienTinh
(	MSSV	char(7)	primary key
,	Ho	varchar(20)	not null
,	Ten	varchar(9)	not null
,	NgaySinh	datetime	not null
,	MSTinh	char(2)	references	TINH(MSTinh)
,	NgayNhapHoc	datetime	not null
,	MSLop	char(4)	references	LOP(MSLop)
,	Phai	char(3)	not null
,	DiaChi	varchar(35)	not null
,	DienThoai	varchar(10)
);

insert into SinhVienTinh
select	*
from	SINHVIEN
where	MSTinh not in (
	select	MSTinh
	from	TINH
	where	TenTinh='TPHCM'
)
;

-- 30b) Thêm thuộc tính HBONG (học bổng) cho table SinhVienTinh

alter table SinhVienTinh
add HBONG bigint
;

-- 31) Cập nhật thuộc tính HBONG trong table SinhVienTinh

update	SinhVienTinh
set	HBONG=10000
;

-- 32) Tăng HBONG lên 10% cho các sinh viên nữ

update	SinhVienTinh
set	HBONG=cast(HBONG*1.1 as bigint)
where	Phai='No'
;

-- 33) Xóa tất cả các sinh viên có quê quán ở Long An

delete from SinhVienTinh
where	MSTinh in (
	select	MSTinh
	from	TINH
	where	TenTinh='Long An'
)
;

select * from SinhVienTinh;