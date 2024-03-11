
/*Thành viên nhóm:
				- Phan Thu Hằng
				- Nguyễn Thị Thu Hường
				- Lê Thị Bích Nguyệt
				- Đoàn Minh Tùng 
  Đề tài : QUẢN LÝ BỆNH NHÂN COVID*/

--===============================Phan Thu Hằng - 20A10010086 - 2010A03================================--

---TẠO CƠ SỞ DỮ LIỆU---
create database QuanLyBN_BTL
go

USE QuanLyBN_BTL
GO

create table tblBenhVien
(
iMaBV int primary key,
sTenBV nvarchar(50),
sSDT varchar(12),
sDiachi nvarchar(100)
)
go

create table tblBacSi
(
iMaBS int primary key,
sTenBS nvarchar(20),
sQueQuan nvarchar(50),
dNgaySinh date,
sGioiTinh nvarchar(10),
sChucVu nvarchar(20),
sSDT varchar(12)
)
go

create table tblBenhNhan
(
iMaBN int primary key,
sTenBN nvarchar(50),
sDiaChiThuongTru nvarchar(100),
sSoCMND varchar(15),
dNgaySinh date,
sGioiTinh nvarchar(10),
sSDT varchar(12),
sTinhTrangHienTai nvarchar(20)
)

ALTER TABLE tblBenhNhan
add constraint UQ_SoCMND UNIQUE(sSoCMND)
go

create table tblBenhNhan_BacSi
(
iMaBN int not null,
iMaBS int not null,
dThoiGianCT date,
primary key(iMaBN,iMaBS)
)
go

alter table tblBenhNhan_BacSi
add constraint fk_iMaBN foreign key(iMaBN) references tblBenhNhan
go

alter table tblBenhNhan_BacSi
add constraint fk_iMaBS foreign key(iMaBS) references tblBacSi
go

create table tblPhanKhu
(
iMaPK int primary key,
sTenPK nvarchar(20),
sSDT varchar(12),
sLoaiHinhDieuTri nvarchar(100),
iMaBV int
)
go

alter table tblPhanKhu
add constraint fk_MaBV foreign key(iMaBV) references tblBenhVien
go

create table tblPhong
(
iMaP int primary key ,
iMaPK int
)
go

alter table tblPhong
add constraint fk_MaPK foreign key(iMaPK) references tblPhanKhu
go

create table tblPhong_BenhNhan
(
iMaP int not null,
iMaBN int not null,
dThoigian date,
primary key(iMaP,iMaBN)
)
go

alter table tblPhong_BenhNhan
add constraint fk_MaP foreign key(iMaP) references tblPhong
go

alter table tblPhong_BenhNhan
add constraint fk_MaBN foreign key(iMaBN) references tblBenhNhan
go

create table tblBenhAn
(
iMaBA int primary key,
iMaBN int,
iMaBS int,
dNgaylap date
)
go

alter table tblBenhAn
add constraint fk_MBN foreign key(iMaBN) references tblBenhNhan
go

alter table tblBenhAn
add constraint fk_MaBS foreign key(iMaBS) references tblBacSi
go

create table tblThuoc
(iMaTH int primary key,
sTenTH Nvarchar(50),
sDangTH nvarchar(20),
sCongDung nvarchar(50)
)
go

create table tblKetQuaDieuTri
(
iMaBA int not null,
iMaTH int not null,
primary key(iMaBA,iMaTH)
)
go

alter table tblKetQuaDieuTri
add constraint fk_MaBA foreign key(iMaBA) references tblBenhAn
go

alter table tblKetQuaDieuTri
add constraint fk_MaTH foreign key(iMaTH) references tblThuoc
go

---======NHẬP DỮ LIỆU=======--
insert into tblBenhVien(iMaBV,sTenBV,sSDT,sDiachi)
values
	('01',N'Bệnh viện dã chiến số 1','098777666',N'Số 100-đường Trường Chinh -P.Ba Hàng-TX.Phổ Yên-Tỉnh Thái Nguyên')
insert into tblPhanKhu(iMaPK,sTenPK,sSDT,sLoaiHinhDieuTri,iMaBV) 
values
	('1',N'Bệnh nhân nhẹ','098398888',N'Các ca bệnh có triệu chứng nhẹ','01'),
	('2',N'Bệnh nhân nặng','098399999',N'Các ca bệnh có triệu chứng nặng','01'),
	('3',N'Hồi sức tích cực','098390000',N'Các ca bệnh nguy kịch','01'),
	('4',N'Thoát hồi sức','098396666',N'Các ca bệnh thoát khỏi nguy kịch','01'),
	('5',N'Chuẩn bị ra viện','098398888',N'Các ca bệnh chuẩn bị ra viện','01')


insert into tblPhong(iMaP,iMaPK) 
values
	('10','1'),
	('11','1'),
	('12','1'),
	('13','1'),
	('14','1'),
	('15','1'),
	('16','1'),
	('17','1'),
	('18','1'),
	('19','1'),
	('20','2'),
	('21','2'),
	('22','2'),
	('23','2'),
	('24','2'),
	('25','2'),
	('26','2'),
	('27','2'),
	('28','2'),
	('29','2'),
	('30','3'),
	('31','3'),
	('32','3'),
	('33','3'),
	('34','3'),
	('35','3'),
	('36','3'),
	('37','3'),
	('38','3'),
	('39','3'),
	('40','4'),
	('41','4'),
	('42','4'),
	('43','4'),
	('44','4'),
	('45','4'),
	('46','4'),
	('47','4'),
	('48','4'),
	('49','4'),
	('50','5'),
	('51','5'),
	('52','5'),
	('53','5'),
	('54','5'),
	('55','5'),
	('56','5'),
	('57','5'),
	('58','5'),
	('59','5')
insert into tblBacSi(iMaBS,sTenBS,sQueQuan,dNgaySinh,sGioiTinh,sChucVu,sSDT) 
values
	('111',N'Lê Thị Bích Nguyệt',N'Thành Công-TX Phổ Yên-Tỉnh Thái Nguyên','07-07-1995',N'Nữ',N'Điều dưỡng','098767655'),
	('122',N'Lê Thị Kim Thư',N'Tân Hương-TX Tiền Hải-Tỉnh Thái Bình','07-09-1975',N'Nữ',N'Bác sĩ','0987645353'),
	('133',N'Nguyễn Văn Nam',N'Kim Động-TX Hương Sơn-Tỉnh Ninh Bình','07-07-1980',N'Nam',N'Y tá','0987689989'),
	('144',N'Trần Văn NHâm',N'Đồng Tiến-Hiệp Hòa-Tỉnh Bắc Giang','07-07-1990',N'Nam',N'Điều dưỡng','09865774'),
	('155',N'Lê Thị Như',N'Thành Công-TX Phổ Yên-Tỉnh Thái Nguyên','07-07-1982',N'Nữ',N'Bác sũ','098767666'),
	('211',N'Phan Thu Hằng',N'Tâm Yên-Tp Việt Trì-Tỉnh Phú Thọ','07-07-1981',N'Nữ',N'Bác sĩ','0987999655'),
	('222',N'Lê Thị Bích',N'Thành Công-TX Chợ Mới-Tỉnh Bắc Kạn','06-07-1995',N'Nữ',N'Điều dưỡng','098888655'),
	('233',N'Lê Thị Nguyệt',N'Thành Công-TX Phổ Yên-Tỉnh Thái Nguyên','07-09-1986',N'Nữ',N'Bác Sĩ','098707655'),
	('244',N'Nguyễn Hải Nam',N'Trung Thành-TX Đồ Sơn-Tp Hải Phòng','07-07-1987',N'Nam',N'Bác sĩ','098367650'),
	('255',N'Lý Văn Long',N'Thành Công-TX Lương Sơn-Tỉnh Thanh Hóa','07-07-1977',N'Nam',N'Bác sĩ','0987690955'),
	('311',N'Nguyễn Thị Thu Hường',N'Mai Động-TX Phổ Yên-Tỉnh Hưng Yên','07-08-1995',N'Nữ',N'Điều Dưỡng','0346767655'),
	('322',N'Lê Thị Uyên',N'Thành Công-TX Phổ Yên-Tỉnh Thái Nguyên','07-07-1978',N'Nữ',N'Bác sĩ','0988887655'),
	('333',N'Lê Văn Anh',N'Thành Công-TX Phổ Yên-Tỉnh Thái Nguyên','07-07-1976',N'Nam',N'Bác Sĩ','0788999655'),
	('344',N'Lê Văn Luyện',N'Thanh Mai-TX Phổ Yên-Tỉnh Thái Bình','07-07-1995',N'Nam',N'Điều dưỡng','0987900655'),
	('355',N'Lê Thị Hạnh',N'Mỏ Chè-Tp Sông Công-Tỉnh Thái Nguyên','07-11-1982',N'Nữ',N'Bác sĩ','098777655'),
	('411',N'Hoàng Văn Thụ',N'Thành Công-TX Phú Lương-Tỉnh Bắc Ninh','06-07-1995',N'Nam',N'Điều Dưỡng','032767655'),
	('422',N'Lê Thị Lý',N'Thành Công-TX Phổ Yên-Tỉnh Thái Nguyên','07-07-1977',N'Nữ',N'Bác sĩ','028767655'),
	('443',N'Nguyễn Văn Tú',N'Phú Xuân-TX Phổ Yên-Tỉnh Bắc Ninh','07-07-1977',N'Nam',N'Bác Sĩ','098767888'),
	('444',N'Lê Thị Ninh',N'Thành Công-TX Phổ Yên-Tỉnh Thái Nguyên','02-07-1995',N'Nữ',N'Điều dưỡng','09879955'),
	('455',N'Phạm Sỹ Luân',N'Tân Minh-Sóc Sơn-Tp Hà Nội','07-12-1987',N'Nam',N'Bác sĩ','078767659'),
	('511',N'Trần Lệ Mỹ',N'Thành Công-TX Phổ Yên-Tỉnh Thái Nguyên','07-07-1998',N'Nữ',N'Điều dưỡng','088767655'),
	('522',N'Trần Văn Minh',N'Thành Công-TX Tân Yên-Tỉnh Bắc Giang','08-09-1977',N'Nam',N'Điều dưỡng','08887655'),
	('533',N'Phạm Thị Hoa',N'Tân Kim-TX Phú Bình -Tỉnh Thái Nguyên','07-05-1998',N'Nữ',N'Điều dưỡng','088777775'),
	('544',N'Trần Minh Hải',N'Nam Tiến-TX Phổ Yên-Tỉnh Thái Nguyên','12-11-1979',N'Nữ',N'Bác sĩ','0866667655'),
	('555',N'Trịnh Văn Tú',N'Kim Xuyên-TX Bắc Thái -Tỉnh Bắc Ninh','07-07-1988',N'Nam',N'Điều dưỡng','088767655')
insert into tblBenhNhan(iMaBN,sTenBN,sDiaCHiThuongTru,sSoCMND,dNgaySinh,sSDT,sGioiTinh,sTinhTrangHienTai) 
values
	('1000',N'Lê Công Thành',N'229 Trần Đại Nghĩa-Hai Bà Trưng-Hà Nội','097688899','12-12-1980','098786557',N'Nam',N'Viêm phổi'),
	('1001',N'Lê Thị Trang',N'Trần Khát Chân-Hoài Đức-Hà Nội','09098899','12-12-1999','098786787',N'Nữ',N'Viêm phổi nặng'),
	('1002',N'Lê Công Minh',N'229 Trần Nhật-TX Phổ Yên-Thái Nguyên','097399','11-12-1988','095586557',N'Nam',N'Viêm phổi'),
	('1003',N'Lê Công Khánh',N'229 Trần Nhật-TX Phổ Yên-Thái Nguyên','09454499','11-12-1990','095776557',N'Nam',N'Viêm phổi-Suy hô hấp'),
	('1004',N'Lê Công Huệ',N'229 Trần Nhật-TX Phổ Yên-Thái Nguyên','09832889','11-12-1988','095586557',N'Nam',N'Ho-Sốt '),
	('1005',N'Nguyễn Thị Minh',N'270Trần Nhật-TX Phổ Yên-Thái Nguyên','0983349','10-12-1998','095886557',N'Nữ',N'Khó thở'),
	('1006',N'Lý Quốc An',N'289 Trần Nhật-TX Phổ Yên-Thái Nguyên','098727399','11-09-1988','09776557',N'Nam',N'Viêm phổi'),
	('1007',N'Mai Văn Anh',N'289 Trần Nhật-TX Phổ Yên-Thái Nguyên','07712399','09-12-1978','09550057',N'Nam',N'Sốt'),
	('1008',N'Lê Minh Khôi',N'229 Trường Chinh-TX Phổ Yên-Thái Nguyên','0215599','11-02-1988','098586557',N'Nam',N'Viêm phổi'),
	('1009',N'Lê Thị Chinh',N'40 Minh Khai-TP Sông Công-Thái Nguyên','08332300','01-12-1980','09558997',N'Nữ',N'Đau họng-Sốt'),
	('1010',N'Nguyễn Thị Hoa',N'220 Trần Nhật-TX Phổ Yên-Thái Nguyên','028387899','11-12-1999','095586557',N'Nữ',N'Viêm phổi'),
	('1011',N'Trần Quốc Toản',N'211 Trần Nhật-TX Phổ Yên-Thái Nguyên','03899399','11-02-2000','085586557',N'Nam',N'Suy hô hấp'),
	('1012',N'Lê Công Khanh',N'229 Trần Nhật-Tp Sông Công-Thái Nguyên','009832399','11-12-1988','032586557',N'Nam',N'Viêm phổi'),
	('1013',N'Trần Thị Lệ',N'331 Tân Phú-Phú Bình-Thái Nguyên','068802399','11-02-1999','095588557',N'Nữ',N'Đau họng'),
	('1014',N'Chu Thùy Linh' ,N'210 Thanh Trì-Hà Nội','048009399','01-02-1988','0988786557',N'Nữ',N'Sốt'),
	('1015',N'Lý Văn An',N'Từ Sơn-Bắc Ninh','08832399','11-09-1999','0458886557',N'Nam',N'Viêm phổi'),
	('1016',N'Lý Văn An',N'22 Phan Bội Châu- Bắc Giang','045892009','11-07-1988','095096557',N'Nam',N'Sốt nhẹ'),
	('1017',N'Nguyễn Xuân Thùy',N'229 Trần Nhật-TX Phổ Yên-Thái Nguyên','097868799','11-09-1988','095887557',N'Nam',N'Viêm phổi'),
	('1018',N'Lê Văn Hà',N'225 Minh Khai-Bắc Giang ','00032898399','11-04-1990','09586557',N'Nam',N'Sốt nhẹ'),
	('1019',N'Trần Thái Anh',N'225 Minh Khai-Bắc Giang ','0077762399','04-04-1990','095876557',N'Nam',N'Sốt nhẹ'),
	('1020',N'Lê Thị Ánh',N'23-Minh Khai-tp Sông Công-Thái Nguyên','0348388799','11-10-2001','027586557',N'Nữ',N'Đau họng'),
	('1021',N'Trần Văn Khang',N'225 Minh Khai-Bắc Giang ','0772900399','01-04-1970','09586557',N'Nam',N'Sốt nhẹ')
insert into tblBenhNhan_BacSi(iMaBN,iMaBS,dThoiGianCT) 
values
	('1000','311','03-09-2021'),
	('1000','322','03-09-2021'),
	('1001','311','03-09-2021'),
	('1001','333','03-09-2021'),
	('1001','322','03-10-2021'),
	('1002','311','10-09-2021'),
	('1002','344','10-09-2021'),
	('1003','311','03-09-2021'),
	('1003','333','03-10-2021'),
	('1004','311','12-09-2021'),
	('1004','355','12-09-2021'),
	('1005','122','07-09-2021'),
	('1005','144','03-09-2021'),
	('1006','211','03-10-2021'),
	('1006','311','03-11-2021'),
	('1006','333','03-11-2021'),
	('1007','233','03-09-2021'),
	('1007','211','03-09-2021'),
	('1008','155','03-09-2021'),
	('1008','322','08-10-2021'),
	('1008','344','08-10-2021'),
	('1009','333','03-09-2021'),
	('1009','411','03-10-2021'),
	('1009','422','03-10-2021'),
	('1010','144','03-09-2021'),
	('1010','111','03-09-2021'),
	('1010','222','03-10-2021'),
	('1011','333','10-09-2021'),
	('1011','311','10-09-2021'),
	('1011','444','03-11-2021'),
	('1012','322','07-10-2021'),
	('1012','311','07-10-2021'),
	('1012','355','07-10-2021'),
	('1013','211','09-09-2021'),
	('1013','311','03-10-2021'),
	('1013','411','03-11-2021'),
	('1014','133','10-09-2021'),
	('1014','144','10-09-2021'),
	('1015','122','12-09-2021'),
	('1015','155','12-09-2021'),
	('1016','311','10-10-2021'),
	('1016','355','10-10-2021'),
	('1017','333','10-09-2021'),
	('1018','222','11-09-2021'),
	('1018','311','09-10-2021'),
	('1018','411','12-10-2021'),
	('1019','155','03-09-2021'),
	('1019','144','03-09-2021'),
	('1019','311','10-09-2021'),
	('1019','511','03-10-2021'),
	('1019','533','03-10-2021'),
	('1020','144','10-09-2021'),
	('1020','522','03-10-2021'),
	('1021','122','03-09-2021'),
	('1021','533','10-09-2021'),
	('1021','544','12-09-2021')
insert into tblBenhAn(iMaBA,iMaBN,iMaBS,dNgaylap) 
values
	('10000','1000','311','03-09-2021'),
	('10001','1001','311','03-09-2021'),
	('10002','1002','311','10-09-2021'),
	('10003','1003','311','03-09-2021'),
	('10004','1004','311','12-09-2021'),
	('10005','1005','122','07-09-2021'),
	('10006','1006','211','03-10-2021'),
	('10007','1007','233','03-09-2021'),
	('10008','1008','155','03-09-2021'),
	('10009','1009','333','03-09-2021'),
	('10010','1010','144','03-10-2021'),
	('10011','1011','333','10-09-2021'),
	('10012','1012','322','07-10-2021'),
	('10013','1013','211','09-09-2021'),
	('10014','1014','133','10-09-2021'),
	('10015','1015','122','12-09-2021'),
	('10016','1016','311','10-10-2021'),
	('10017','1017','333','10-09-2021'),
	('10018','1018','222','11-09-2021'),
	('10019','1019','155','03-09-2021'),
	('10020','1020','144','10-09-2021'),
	('10021','1021','122','03-09-2021')
insert into tblThuoc(iMaTH,sTenTH,sDangTH,sCongDung) 
values
	('1234','Remdesivir',N'Lỏng',N'Kháng virus'),
	('1235','Favipiravir',N'Viên',N'Kháng virus'),
	('1236','Monuloiravir',N'Viên',N'Kháng virus'),
	('1237','Paracetamol',N'Bột',N'Hạ sốt,giảm đau'),
	('1242','Oresol',N'Dung dịch',N'Cân bằng điện giải'),
	('1238','Natri clorit',N'Dung dịch',N'Sát khuẩn'),
	('1239','Cotricosteroid',N'Viên',N'Chống viêm'),
	('1240','Rivaroxaban',N'Viên',N'Chống đông máu'),
	('1241','Prednisolon',N'Viên',N'Chống đông máu')
insert into tblKetQuaDieuTri(iMaBA,iMaTH) 
values 
	('10000','1234'),
	('10000','1240'),
	('10000','1242'),
	('10001','1234'),
	('10001','1240'),
	('10001','1242'),
	('10002','1234'),
	('10002','1240'),
	('10002','1242'),
	('10003','1234'),
	('10003','1240'),
	('10003','1242'),
	('10004','1234'),
	('10004','1240'),
	('10004','1242'),
	('10005','1237'),
	('10005','1238'),
	('10005','1242'),
	('10006','1234'),
	('10006','1240'),
	('10006','1242'),
	('10007','1236'),
	('10007','1237'),
	('10007','1242'),
	('10008','1236'),
	('10008','1234'),
	('10008','1242'),
	('10009','1234'),
	('10009','1240'),
	('10009','1242'),
	('10010','1237'),
	('10010','1240'),
	('10010','1239'),
	('10011','1234'),
	('10011','1240'),
	('10011','1242'),
	('10012','1234'),
	('10012','1240'),
	('10012','1242'),
	('10013','1236'),
	('10013','1234'),
	('10013','1242'),
	('10013','1239'),
	('10013','1241'),
	('10014','1236'),
	('10014','1237'),
	('10014','1239'),
	('10015','1236'),
	('10015','1240'),
	('10015','1242'),
	('10016','1234'),
	('10016','1240'),
	('10016','1242'),
	('10017','1234'),
	('10017','1240'),
	('10017','1242'),
	('10018','1234'),
	('10018','1240'),
	('10018','1242'),
	('10018','1239'),
	('10018','1237'),
	('10019','1242'),
	('10019','1234'),
	('10019','1240'),
	('10019','1238'),
	('10020','1236'),
	('10020','1240'),
	('10020','1239'),
	('10021','1236'),
	('10021','1240'),
	('10021','1242')
insert into tblPhong_BenhNhan(iMaP,iMaBN,dThoigian) 
values
	('31','1000','03-09-2021'),
	('31','1001','03-09-2021'),
	('32','1002','10-09-2021'),
	('32','1003','03-09-2021'),
	('33','1004','12-09-2021'),
	('11','1005','03-09-2021'),
	('21','1006','03-10-2021'),
	('33','1006','03-11-2021'),
	('21','1007','03-09-2021'),
	('11','1008','03-09-2021'),
	('34','1008','08-10-2021'),
	('34','1009','03-09-2021'),
	('41','1009','03-10-2021'),
	('11','1010','03-09-2021'),
	('22','1010','03-10-2021'),
	('35','1011','10-09-2021'),
	('42','1011','03-11-2021'),
	('35','1012','07-10-2021'),
	('22','1013','09-09-2021'),
	('36','1013','03-10-2021'),
	('42','1013','03-11-2021'),
	('12','1014','10-09-2021'),
	('13','1015','12-09-2021'),
	('36','1016','10-10-2021'),
	('37','1017','10-09-2021'),
	('23','1018','11-09-2021'),
	('43','1018','12-09-2021'),
	('14','1019','03-09-2021'),
	('38','1019','10-09-2021'),
	('51','1019','03-10-2021'),
	('15','1020','10-09-2021'),
	('52','1020','03-10-2021'),
	('15','1021','03-09-2021'),
	('52','1021','12-09-2021')

go
SELECT * FROM dbo.tblBenhVien
SELECT * FROM dbo.tblBacSi
SELECT * FROM dbo.tblBenhNhan
SELECT * FROM dbo.tblBenhNhan_BacSi 
SELECT * FROM dbo.tblPhong
SELECT * FROM dbo.tblPhanKhu
SELECT * FROM dbo.tblKetQuaDieuTri
SELECT * FROM dbo.tblThuoc
SELECT * FROM dbo.tblPhong_BenhNhan
SELECT * FROM dbo.tblBenhAn
go

-------********************************************************************************----------
--- TRUY VẤN THỰC HIỆN DỮ LIỆU ---
--lấy DL từ 1 bảng:
	--1.lấy thông tin của bệnh nhân có tình trạng hiện tại bị viêm phổi
		select * from tblBenhNhan where sTinhTrangHienTai=N'viêm phổi'
	--2.lấy thông tin của bác sĩ có chức vụ là bác sĩ
		select * from tblBacSi where sChucVu=N'bác sĩ'
	--3.lấy thông tin của thuốc có công dụng kháng virus
		select * from tblThuoc where sCongDung=N'kháng virus'
	--4.lấy bệnh án được lập trong tháng 10
		select iMaBA, dNgaylap from tblBenhAn
		where month(dNgaylap)=10
	--5.đếm số bệnh nhân có địa chỉ thường trú ở Hà Nội
		select count(iMaBN) as [Số bệnh nhân] from tblBenhNhan
		where sDiaChiThuongTru like N'%Hà Nội'
--lấy DL từ nhiều bảng:
	--1.lấy ra bệnh nhân thuộc phòng x
		select tblBenhNhan.iMaBN, sTenBN from tblPhong_BenhNhan, tblBenhNhan
		where tblBenhNhan.iMaBN=tblPhong_BenhNhan.iMaBN and iMaP=11
	--2.lấy ra số bệnh án mà mỗi bác sĩ lập
		select tblBacSi.iMaBS, sTenBS, count(iMaBA) as [Số Bệnh Án] 
		from tblBenhAn, tblBacSi
		where tblBacSi.iMaBS=tblBenhAn.iMaBS 
		group by tblBacSi.iMaBS, sTenBS
	--3.lấy ra bệnh nhân dùng > 3 loại thuốc 
		select tblBenhNhan.iMaBN, sTenBN, count(tblKetQuaDieuTri.iMaTH) as [Số thuốc sử dụng] 
		from tblBenhAn 
		right join tblKetQuaDieuTri on tblBenhAn.iMaBA=tblKetQuaDieuTri.iMaBA
		left join tblBenhNhan on tblBenhAn.iMaBN=tblBenhNhan.iMaBN
		group by tblBenhNhan.iMaBN, sTenBN
		having count(tblKetQuaDieuTri.iMaTH)>3
	--4.lấy ra tên các bệnh nhân mà bác sĩ x điều trị trong tháng 7/2021
		select bn.stenBN, stenBS, dThoiGianCT
		from tblBenhNhan bn, tblBenhNhan_BacSi bnbs, tblBacSi bs
		where bn.iMaBN=bnbs.iMaBN and bnbs.iMaBS=bs.imaBS
		and month(dThoiGianCT)=7 and year(dThoiGianCT)=2021
		and  sTenBS=N'Lê Thị Uyên'
	--5.lấy ra số phòng mỗi phân khu
		select stenPK, count(p.imaP) as [tổng số phòng]
		from tblPhanKhu pk
		right join tblphong p on pk.imaPK=p.iMaPK
		group by stenPK
		go

-------********************************************************************************----------	
--- TẠO VIEW ---
	--1.lấy DL iMaBS, sTenBS, sChucVu từ bảng Bác Sĩ
	 Create view DLBacSi as
	 select iMaBS, sTenBS, sChucVu from tblBacSi

	 select * from DLBacSi
	 go
	 --2.lấy ra các iMaBS, sTenBS có chức vụ làm điều dưỡng
	create view DLChucVu as
	select iMaBS, sTenBS from tblBacSi
	where sChucVu=N'điều dưỡng'

	select * from DLChucVu
	go
	--3.tính tuổi trung bình của bệnh nhân 
	create view tuoiTB_BN as
	select round(avg(year(getdate())-year(dNgaySinh)),2) as [Tuổi trung bình]
	from tblBenhNhan

	select * from tuoiTB_BN
	go
	--4.lấy danh sách bệnh nhân và sắp xếp tăng dần theo tên
	create view SX_Tang_TenBN as
	select top 100 percent iMaBN, sTenBN from tblBenhNhan
	order by sTenBN asc

	select * from SX_Tang_TenBN
	go
	--5.lấy iMaBN, sTenBN của bệnh nhân mà bác sĩ x điều trị
	create view DLBenhNhan as
	select tblBenhNhan.iMaBN, sTenBN from tblBenhNhan, tblBenhNhan_BacSi, tblBacSi
	where tblBenhNhan.iMaBN=tblBenhNhan_BacSi.iMaBN 
	and tblBenhNhan_BacSi.iMaBS=tblBacSi.iMaBS and sTenBS=N'Lê Văn Anh'

	select * from DLBenhNhan
	go
	--6.lấy iMaP và cho biết số lượng phòng mỗi phân khu
	create view DLPhong as
	select tblPhanKhu.iMaPK, count(iMaP) as [Số lượng phòng]
	from tblPhong, tblPhanKhu
	where tblPhong.iMaPK=tblPhanKhu.iMaPK
	group by tblPhanKhu.iMaPK

	select * from DLPhong
	go
	--7.lấy tên thuốc mà bệnh nhân x đã dùng
	create view DLThuoc as
	select tblThuoc.iMaTH, sTenTH
	from tblThuoc inner join tblKetQuaDieuTri on tblThuoc.iMaTH=tblKetQuaDieuTri.iMaTH
				 inner join tblBenhAn on tblKetQuaDieuTri.iMaBA=tblBenhAn.iMaBA
				 inner join tblBenhNhan on tblBenhAn.iMaBN=tblBenhNhan.iMaBN
	where sTenBN=N'Lê Thị Trang'

	select * from DLThuoc
	go
	--8.tính số bệnh nhân nam từng phòng
	create view GioiTinh_Phong as
	select tblPhong_BenhNhan.iMaP, count(tblBenhNhan.iMaBN) as [Số bệnh nhân nam]
	from tblBenhNhan, tblPhong_BenhNhan
	where tblBenhNhan.iMaBN=tblPhong_BenhNhan.iMaBN and sGioiTinh=N'nam'
	group by tblPhong_BenhNhan.iMaP

	select * from GioiTinh_Phong
	go
	--9.lấy ra iMaBS, sTenBS đã chữa trị cho >3 bệnh nhân
	create view BS_BN as
	select tblBacSi.iMaBS, sTenBS, count(tblBenhNhan_BacSi.iMaBN) as [Số bệnh nhân]
	from tblBacSi, tblBenhNhan_BacSi
	where tblBacSi.iMaBS=tblBenhNhan_BacSi.iMaBS
	group by tblBacSi.iMaBS, sTenBS
	having count(tblBenhNhan_BacSi.iMaBN)>3
	
	select * from BS_BN
	go
	--10.cho biết sTenBN được lập bệnh án trong t10/2021 và cho biết sTenBS lập bệnh án
	create view DLBenhAn as
	select sTenBN, sTenBS, dNgayLap 
	from tblBenhNhan, tblBacSi, tblBenhAn
	where tblBenhNhan.iMaBN=tblBenhAn.iMaBN and tblBacSi.iMaBS=tblBenhAn.iMaBS
	and month(dNgaylap)=10 and year(dNgaylap)=2021

	select * from DLBenhAn
	go

-------********************************************************************************----------
---TẠO CÁC Stored Procedure----
	--1. Tạo Proc cho biết thông tin của 1 bác sĩ nào đó theo iMaBS
	Create proc sp_ThongTin_1BS(@maBS int)
	as 
	begin
		select * from tblBacSi where iMaBS=@maBS
	end
	go
	--
	exec sp_ThongTin_1BS @maBS=111
	go
	--2. Tạo Proc cho biết thông tin của bệnh nhân với tham số truyền vào là năm sinh
	Create proc sp_ThongTin_BenhNhan(@nam int)
	as
	begin
		select * from tblBenhNhan
		where year(dNgaySinh)=@nam
	end
	go
	--
	exec sp_ThongTin_BenhNhan @nam=1999
	go
	--3. Tạo Proc tổng số bệnh nhân nam, nữ
	create proc sp_TongSoBN_theoGT
	@nam int output, 
	@nu int output
	as
	begin
		set @nam=0
		set @nu=0
		select @nam=count(*) from tblBenhNhan where sGioiTinh=N'nam'
		select @nu=count(*) from tblBenhNhan where sGioiTinh=N'nữ'
	end
	go
	--gọi thủ tục
	declare @a nvarchar(10), @b nvarchar(10)
	exec sp_TongSoBN_theoGT 
	@nam=@a output, 
	@nu=@b output

	SELECT @a as [Nam], @b as [Nữ]
	go
	--4. Tạo Proc lấy ra tên bác sĩ có tuổi cao nhất
	create proc sp_tenBS_tuoimax
	@tenBS nvarchar(20) output,
	@tuoimax int output
	as
	begin
		select @tuoimax= max((year(getdate()))-(year(dngaysinh))) 
		from tblBacSi
		select @tenBS=stenBS from tblBacSi
	end
	go
	--gọi thủ tục
	declare @tenbacsi nvarchar(20), @tuoilonnhat int 
	exec sp_tenBS_tuoimax 
	@tenBS=@tenbacsi output,
	@tuoimax=@tuoilonnhat output

	select @tenbacsi as [BS có tuổi lớn nhất ], @tuoilonnhat as [Tuổi]
	go
	--5. Tạo Proc cho biết công dụng của thuốc theo tên thuốc
	Create proc sp_CongDungThuoc_theoTen(@tenthuoc nvarchar(50))
	as
	begin
		select sCongDung from tblThuoc
		where @tenthuoc=stenTH
	end
	go
	--
	exec sp_CongDungThuoc_theoTen @tenthuoc =N'Oresol'
	go
	--6. Tạo Proc cho biết thông tin của bênh viện với tên phân khu là tham số truyền vào
	Create proc sp_TTBenhVien(@tenPK nvarchar(20))
	as
	begin
		select * from tblBenhVien bv, tblPhanKhu pk
		where bv.imaBV=pk.imaBV
		and @tenPK=stenPK
	end
	go
	--
	exec sp_TTBenhVien @tenPK=N'Bệnh nhân nhẹ'
	go
	--7. Tao Proc lấy ra mã phòng với tên phân khu là tham số truyền vào
	Create proc sp_Phong(@tenPK nvarchar(20))
	as
	begin
		select imaP from tblPhong p, tblPhanKhu pk
		where p.imaPK=pk.imaPK
		and @tenPK=stenPK
	end
	go
	--
	exec sp_Phong @tenPK=N'Bệnh nhân nhẹ'
	go
	--8. Tạo Proc cho biết Kết quả điều trị theo tên Bênh nhân
	Create proc sp_KQDT_BN(@tenBN nvarchar(50))
	as
	begin
		select * from tblKetQuaDieuTri kqdt
		join tblBenhAn ba on ba.iMaBA=kqdt.iMaBA
		join tblBenhNhan bn on bn.iMaBN=ba.iMaBN
		and @tenBN=stenBN
	end
	go
	--
	exec sp_KQDT_BN @tenBN =N'Lê Thị Chinh'
	go
	--9. Tạo Proc cho biết ten bác sĩ và tháng lập của 1 bệnh nhân theo tên bệnh nhân 
		--Tham số truyền vào là tên bệnh nhân
	create proc sp_TTBSvaNgaylap_1BN(@tenBN nvarchar(50))
	as
	begin
		select bs.stenBS, month(ba.dNgaylap) as[Tháng lập]
		from tblBacSi bs
		join tblBenhAn ba on ba.iMaBS=bs.iMaBS
		join tblBenhNhan bn on bn.iMaBN=ba.imaBN
		and @tenBN=bn.stenBN
	end
	go
	--
	exec sp_TTBSvaNgaylap_1BN @tenBN =N'Lê Công Minh'
	go
	--10. Tạo Proc cho biết số lượng bệnh nhân trong tháng 
		--Tháng là tham số truyền vào
		--Số lượng là tham số trả về
	Create proc sp_ThongKeBN_trongthang
	@thang int,
	@sl int output
	as
	begin
		select @sl=count(bn.imaBN) 
		from tblBenhNhan bn, tblBenhAn ba
		where bn.iMaBN=ba.iMaBN
		and month(ba.Dngaylap)=@thang
	end
	--gọi thủ tục
	declare @soluong int
	exec sp_ThongKeBN_trongthang @thang=10, @sl=@soluong output

	SELECT @soluong as [SL BN trong tháng]
	go
	--11. Tạo Proc thêm bệnh nhân
		--Nếu trùng mã Bệnh nhân thì thông báo
		--Nếu không trùng thì lưu lại
	Create proc sp_ThemBN
	(@maBN int, @tenBN nvarchar(50), @diachiTT nvarchar(100), @CMND varchar(15), @NS date, @GT nvarchar(10), @SDT varchar(12), @TTHT nvarchar(20))
	as
	begin
		if exists(select * from tblBenhNhan where iMaBN=@maBN)
		begin
			print N'Mã bênh nhân đã có'
			print N'Mời nhập mã mới!'
			return
		end
		else
		insert into tblBenhNhan(imaBN,sTenBN,sDiaChiThuongTru,sSoCMND,dNgaySinh,sGioiTinh,sSDT,sTinhTrangHienTai)
		values(@maBN,@tenBN,@DiaChiTT,@CMND,@NS,@GT,@SDT,@TTHT)
	end
	go
	--
	exec sp_ThemBN '111',N'Nguyễn Văn A',N'Giáp Bát - Hoàng Mai','132435678',N'2001-09-22',N'Nam',N'098765749',N'Đau đầu'
	select *from tblBenhNhan
	go
	--12. Tạo Proc thêm thuốc
		--Nếu trùng mã thuốc thì thông báo
		--Nếu không trùng thì lưu lại
	Create proc sp_ThemThuoc
	(@maT int, @tenT nvarchar(50),@dangTH nvarchar(20),@congdung nvarchar(50))
	as
	begin
		if exists(select * from tblThuoc where imaTH=@maT)
		begin
			Print N'Mã thuốc đã tồn tại'
			print N'Mời bạn nhập mã mới!'
			return
		end
		else
			insert into tblThuoc(iMaTH,sTenTH,sDangTH,sCongDung)
			values(@maT,@tenT,@dangTH,@congDung)
	end
	go
	--
	exec sp_themThuoc '1333', N'PPP',N'Vien',N'Kháng Khuẩn'
	SELECT *FROM tblThuoc
	go
	--13. Tạo Proc có tham số truyền vào là tháng cho biết các bênh nhân không điều trị tại phòng trong tháng đó
	create proc sp_KiemtraQuatrinhDTBN(@thang int)
	as
	begin
		select @thang as [Tháng], stenBN as [BN không điều trị trong tháng] 
		from tblBenhNhan
		where stenBN not in(
			select bn.stenBN from tblBenhNhan bn
			join tblPhong_BenhNhan pbn on pbn.iMaBN=bn.imaBN
			and month(pbn.dThoiGian)=@thang
		)
	end
	go
	--
	exec sp_KiemtraQuaTrinhDTBN @thang=3
	go
	--14. Tạo proc có 
		-- Tham số truyền vào là tháng và tenBN
		--Cho biết tổng số bác sĩ điều trị cho bệnh nhân 
		create proc sp_ThongkeBSDieuTri_benhnhan
		@thang int,
		@tenBN nvarchar(50)
		as
		begin
			select bn.stenBN, count(bnbs.imaBS) as [Tổng số BS điều trị]
			from tblBenhNhan bn, tblBenhNhan_BacSi bnbs
			where bn.iMaBN=bnbs.imaBN 
			and month(dThoiGianCT)=@thang
			and sTenBN=@tenBN
			group by bn.stenBN
		end
		go
		--
		exec sp_ThongkeBSDieuTri_benhnhan @thang=3, @tenBN=N'Lê Thị Trang'
		go
		--15.Tao proc thực hiện đếm số bác sĩ nam, nữ và return tổng số bác sĩ
			--Tham số trả về tổng nam, tổng nữ
			create proc sp_TongSoBS_theoGT
			@nam int output,
			@nu  int output
			as
			begin
				set @nam=0
				set @nu=0
				select @nam=count(*) from tblBacSi where sGioiTinh=N'Nam'
				select @nu=count(*) from tblBacSi where sGioiTinh=N'Nữ'
				
				return @nam+@nu
			end
			go
			-- gọi thủ tục
			declare @tongnam int, @tongnu int, @tongnamnu int
			exec @tongnamnu=sp_TongSoBS_theoGT 
			@nam=@tongnam output, 
			@nu=@tongnu output

			select @tongnam as [Tổng số BS nam], @tongnu as [Tổng số BS nữ ], @tongnamnu as [Tổng số ]
			go

-------********************************************************************************----------
/*Viết các TRIGGER kiểm soát ràng buộc dữ liệu
	Các trigger được viết: 
- 1.Kiểm soát không cho thay đổi công dụng thuốc
- 2.Kiểm soát không cho thay đổi loại hình điều trị của phân khu
- 3.Kiểm soát khi nhập hoặc thay đổi số điện thoại của bác sĩ phải bắt buộc bắt đầu bằng số 0 và có 10 số
- 4.Kiểm soát khi nhập bác sĩ thì phải có tuổi từ 20 trở lên
- 5.Tạo thêm cột số bệnh nhân (int) trong bảng tblPhong, tự động tăng khi có bệnh nhân chuyển vào
- 6.Tạo thêm cột số phòng (int) trong bảng tblPhanKhu, tự động tăng khi có phòng mới của phân khu
- 7.Kiểm soát 1 phòng không quá 5 bệnh nhân
- 8.Kiểm soát 1 bác sĩ chữa trị không quá 10 bệnh nhân
- 9.Kiểm soát 1 phân khu không quá 20 phòng
- 10.Khi 1 bác sĩ bị xóa thì tự động chuyển đều bệnh nhân đến bác sĩ đang chữa trị ít bệnh nhân nhất
*/
	-- 1.Kiểm soát không cho thay đổi công dụng thuốc
	Create trigger tg_KiemSoatThuoc
	on tblThuoc
	for update
	as
	begin
		if(update(sCongDung))
		begin
		print N'Khong duoc thay doi cong dung thuoc!'
		rollback tran
		end
	end
	--
	update tblThuoc
	set sCongDung=N'Kháng khuẩn'
	where sTenTH=N'Remdesivir'
	go
	--2.Kiểm soát không cho thay đổi loại hình điều trị của phân khu
	Create trigger tg_KiemSoatLHDT_PhanKhu
	on tblPhanKhu
	for update
	as
	begin
		if(update(sLoaiHinhDieuTri))
		begin
			Print N'Khong duoc thay doi LHDT cua Phan Khu!'
			rollback tran
		end
	end
	--
	update tblPhanKhu
	set sLoaiHinhDieuTri=N'Các ca bệnh nguye kịch'
	where stenPK=N'Bệnh nhân nhẹ'
	go
	--3.Kiểm soát khi nhập hoặc thay đổi số điện thoại của bác sĩ
		--phải bắt buộc bắt đầu bằng số 0 và có 10 số
	create trigger KiemTraTinhChinhXacSDTBS
	on tblBacSi
	for insert, update
	as
	begin
		if(update(sSDT))
		declare @MaBS int
		declare @SDT nvarchar(20)
		select @MaBS = iMaBS, @SDT = sSDT from inserted
		if(len(@SDT) != 10)
		begin
			print N'SĐT phải có 10 số'
			rollback tran
		end
		if(@SDT not like '0%')
		begin
			print N'SĐT bắt đầu bằng số 0'
			rollback tran
		end
	end
	--
	insert into tblBacSi 
	values(1,N'NVA',N'HN',N'2002-09-08',N'Nữ',N'Y tá',N'0989734129')
	go
	--4.Kiểm soát khi nhập bác sĩ thì phải có tuổi từ 20 trở lên
	Create trigger tg_KiemSoatTuoi_BacSi
	on tblBacSi
	for insert 
	as
	begin
		declare @tuoi date
		select @tuoi=dNgaySinh from inserted
		if(datediff(d,@tuoi, getdate())<20*365)
		begin
			print N'Bac si phai co tuoi > 20 !'
			rollback tran
		end
	end
	--
	insert into tblBacSi 
	values(2,N'NV Hân',N'HN',N'1997-09-08',N'Nữ',N'Y tá',N'0999734129')
	go
	--5.Tạo thêm cột số bệnh nhân (int) trong bảng tblPhong, tự động tăng khi có bệnh nhân chuyển vào
	alter table tblphong 
	add iSoBN int default 0

	create view vw_SoBenhNhanMoi
	as
	select p.imaP as [Mã phòng], count(pbn.imaBN) as [Tổng BN]
	from tblPhong p
	inner join tblphong_benhNhan pbn on pbn.imaP=p.imaP
	group by p.imaP
	go

	update tblPhong
	set iSoBN =0
	where iSoBN is NULL

	update tblphong
	set iSoBN = [Tổng BN]
	from tblPhong p
	inner join vw_SoBenhNhanMoi vw on vw.[Mã phòng]=p.imaP
	where p.imaP = [Mã phòng]

	select * from tblPhong

	create trigger tg_TuDongTangBN
	on tblPhong_benhNhan
	for insert, update
	as
	begin
		declare @maP int
		if(update(imaP))
		select @maP=imaP from inserted
			update tblPhong
			set iSoBN=iSoBN+1
			where @maP=imaP
	end
	go

	--6.Tạo thêm cột số phòng (int) trong bảng tblPhanKhu, tự động tăng khi có phòng mới của phân khu
	alter table tblPhanKhu
	add iSoP int default 0

	--tao View dem SoP 
	alter view vw_tongSoPhongMoi
	as
	select pk.imaPK as [Mã Phân Khu], count(p.imaP) as [Tổng số phòng]
	from tblPhanKhu pk
	inner join tblPhong p on p.imaPK=pk.imaPK
	group by pk.imaPK
	go
	--
	update tblPhanKhu
	set iSoP=0
	where iSoP is null
	--
	update tblPhanKhu
	set iSoP =[Tổng số phòng]
	from tblPhanKhu pk
	inner join vw_tongSoPhongMoi  on vw_tongSoPhongMoi.[Mã Phân Khu]=pk.imaPK
	where pk.imaPK=[Mã Phân Khu]
	go
	--
	Create trigger tg_TuDongTangSP
	on tblPhanKhu
	for update, insert
	as
	begin
		declare @maPK int
		if(update(imaPK))
		select @maPK=imaPK from inserted
		update tblPhanKhu
			set iSoP=iSoP+1
			where @maPK=imaPK
	end
	go
	--7.Kiểm soát 1 phòng không quá 5 bệnh nhân
	create trigger PhongKhongQua5BenhNhan
	on tblPhong_BenhNhan
	for insert, update
	as
	begin
		if(update(iMaP))
		declare @MaP int
		declare @SoBN int 
		select @MaP = iMaP from inserted
		select @SoBN = iSoBN from tblPhong where @MaP = iMaP
		if(@SoBN > 5)
		begin
			print N'1 phòng không quá 5 bệnh nhân'
			rollback tran
		end
	end
	go

	-- 8.Kiểm soát 1 bác sĩ chữa trị không quá 10 bệnh nhân
	create view vw_SoBNChuaTriCuaBS
	as
	select iMaBS as [Mã BS], count(iMaBN) as [Số BN]
	from tblBenhNhan_BacSi
	group by iMaBS
	go

	create trigger tg_KiemSoat1BS_Khongqua10BN
	on tblBenhNhan_BacSi
	for insert, update
	as
	begin
		if(update(imaBS))
		declare @maBS int, @soBN int
		select @maBS=imaBS from inserted
		select @soBN = [Tổng BN]
			from vw_SoBNmaBSCT
			where @maBS=[Mã BS]
		if(@soBN>10)
			begin
			print N'1 Bac si chua tri khong qua 10 BN!'
			rollback tran
		end
	end
	go
	--- 9.Kiểm soát 1 phân khu không quá 20 phòng
	create view vw_DemSoPhong
	as
	select pk.imaPK as [Mã PK], count(iSoP) as [Số phòng]
	from tblPhanKhu pk
	inner join tblPhong p on p.imaPK=pk.imaPK
	group by pk.imaPK
	-- 
	create trigger tg_KiemSoat1PK_Khongqua20P
	on tblPhanKhu
	for insert, update
	as
	begin
		if(update(imaPK))
		declare @maPK int, @soP int
		select @maPK=imaPK from inserted
		select @soP= [Số phòng] from vw_DemSoPhong
			where @maPK = [Mã PK]
		if(@soP >20)
		begin
			print N'Moi phan khu khong qua 20 phong!'
			rollback tran
		end
	end
	go
	--- 10.Khi 1 bác sĩ bị xóa thì tự động chuyển đều bệnh nhân đến bác sĩ đang chữa trị ít bệnh nhân nhất
	/*create view vw_SoBNChuaTriCuaBS
	as
	select iMaBS as [Mã BS], count(iMaBN) as [Số BN]
	from tblBenhNhan_BacSi
	group by iMaBS
	go*/
	create view vw_BSchuatri_min
	as
	select top 1 [Mã BS]
	from vw_SoBNChuaTriCuaBS
	order by [Số BN] asc
	go
	--
	create trigger ChuyenBNKhiBacSiBiXoa
	on tblBacSi
	for delete
	as
	begin
		declare @MaBSXoa int, @SoBN int, @MaBSChuyen int
		select @MaBSXoa = iMaBS from deleted
		select @SoBN = [Số BN] from vw_SoBNChuaTriCuaBS where @MaBSXoa = [Mã BS]
		declare @i int 
		set @i = 0
		while @i < @SoBN
		begin
			select @MaBSChuyen = [Mã BS] from vw_BSChuaTri_min
			update tblBenhAn
				set iMaBS = @MaBSChuyen
				where iMaBS = @MaBSXoa
			update tblBenhNhan_BacSi
				set iMaBS = @MaBSChuyen
				where iMaBS = @MaBSXoa
			set @i = @i + 1
		end
	end	
-------********************************************************************************----------
---CẤP QUYỀN TRUY CẬP....
--Tạo tài khoản cho các thành viên trong nhóm, cấp, thu hồi, cầm quyền cho từng tài khoản
	Create login phanthuhang
	with password = '12354',
	default_database = master

	create user hang
	for login phanthuhang
	with default_schema = QuanLyBN_BTL

	Grant select, update, insert
	on tblBacSi
	to hang

	Deny delete, update 
	on tblBenhNhan
	to hang
-----------
	Create login nguyenthithuhuong
	with password ='12345',
	default_database = master

	Create user huong
	for login nguyenthithuhuong
	with default_schema=QuanLyBN_BTL

	Grant all
	on tblBenhNhan
	to huong

	revoke insert, update, select
	on tblBenhNhan
	to huong
------------
	create login nguyenthibichnguyet
	with password ='12345',
	default_database = master

	create user nguyet
	for login nguyenthibichnguyet
	with default_schema =QuanLyBN_BTL

	
	grant insert, select, delete
	on tblKetQuaDieuTri
	to nguyet

	grant insert, select, delete
	on tblBenhAn
	to nguyet

	deny update 
	on tblKetQuaDieuTri
	to nguyet
------------
	create login dangminhtung
	with
		password = '12345',
		default_database = master

	create user tung
	for login dangminhtung
	with default_schema = baitaplon

	grant select
	on tblThuoc
	to tung

	grant all 
	on tblPhong
	to tung

	deny delete
	on tblPhong
	to tung

----***********************************************************************----------
--Phân tán bảng bệnh nhân theo chiều ngang. Bệnh nhân nam ở trạm 1, bệnh nhân nữ ở trạm 2.
--Thực hiện làm phân tán trên database baitaplonphantan
-- Tạo 1 bảng bệnh nhân y hệt như database gốc và ở trên máy ảo

