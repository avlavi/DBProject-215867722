prompt PL/SQL Developer Export Tables for user SYSTEM@XE
prompt Created by ashih on Friday, 31 May 2024
set feedback off
set define off

prompt Creating SOLDIER...
create table SOLDIER
(
  id               INTEGER not null,
  idf_num          INTEGER not null,
  name             VARCHAR2(100) not null,
  enlistment_date_ DATE not null,
  rank             VARCHAR2(100) default 'Turai' not null
)
;
alter table SOLDIER
  add primary key (ID);

prompt Creating VEHICLE...
create table VEHICLE
(
  license_num INTEGER not null,
  model       VARCHAR2(100) not null,
  type        VARCHAR2(100) not null
)
;
alter table VEHICLE
  add primary key (LICENSE_NUM);

prompt Creating DRIVER...
create table DRIVER
(
  license      INTEGER not null,
  status       VARCHAR2(100) not null,
  license_type VARCHAR2(100) not null,
  id           INTEGER not null,
  license_num  INTEGER not null
)
;
alter table DRIVER
  add primary key (ID);
alter table DRIVER
  add unique (LICENSE);
alter table DRIVER
  add foreign key (ID)
  references SOLDIER (ID);
alter table DRIVER
  add foreign key (LICENSE_NUM)
  references VEHICLE (LICENSE_NUM);
alter table DRIVER
  add constraint CHECK_LICENSE_KIND
  check (license_type IN ('A', 'B', 'C', 'D'));
alter table DRIVER
  add constraint CHECK_LICENSE_TYPE
  check (license_type IN ('A', 'B', 'C', 'D'));
alter table DRIVER
  add constraint CHK_LICENSE_EXISTS
  check (license_type IN ('A', 'B', 'C', 'D'));
alter table DRIVER
  add constraint CHK_LICENSE_TYPE
  check (license_type IN ('A', 'B', 'C', 'D'));
alter table DRIVER
  add constraint CK_LICENSE_TYPE
  check (license_type IN ('A', 'B', 'C', 'D'));

prompt Creating DELIVERY...
create table DELIVERY
(
  delivery_num  INTEGER not null,
  status        VARCHAR2(100) not null,
  delivery_date DATE not null,
  id            INTEGER not null
)
;
alter table DELIVERY
  add primary key (DELIVERY_NUM);
alter table DELIVERY
  add foreign key (ID)
  references DRIVER (ID);

prompt Creating SHEKEM...
create table SHEKEM
(
  base_name  VARCHAR2(100) not null,
  shekem_num INTEGER not null,
  base_num   INTEGER not null
)
;
alter table SHEKEM
  add primary key (SHEKEM_NUM);
alter table SHEKEM
  add unique (BASE_NUM);

prompt Creating BRINGS_TO...
create table BRINGS_TO
(
  delivery_num INTEGER not null,
  shekem_num   INTEGER not null
)
;
alter table BRINGS_TO
  add primary key (DELIVERY_NUM, SHEKEM_NUM);
alter table BRINGS_TO
  add foreign key (DELIVERY_NUM)
  references DELIVERY (DELIVERY_NUM);
alter table BRINGS_TO
  add foreign key (SHEKEM_NUM)
  references SHEKEM (SHEKEM_NUM);

prompt Creating DEVICE...
create table DEVICE
(
  name  VARCHAR2(50),
  id    NUMBER,
  price NUMBER
)
;

prompt Creating PRODUCT...
create table PRODUCT
(
  product_num   INTEGER not null,
  product_name  VARCHAR2(100) not null,
  manufactoring VARCHAR2(100) not null,
  amount        INTEGER not null
)
;
alter table PRODUCT
  add primary key (PRODUCT_NUM);

prompt Creating HAS...
create table HAS
(
  product_num INTEGER not null,
  shekem_num  INTEGER not null
)
;
alter table HAS
  add primary key (PRODUCT_NUM, SHEKEM_NUM);
alter table HAS
  add foreign key (PRODUCT_NUM)
  references PRODUCT (PRODUCT_NUM);
alter table HAS
  add foreign key (SHEKEM_NUM)
  references SHEKEM (SHEKEM_NUM);

prompt Creating SELLER...
create table SELLER
(
  shift         VARCHAR2(100) not null,
  total_sales_  INTEGER not null,
  supervisor_id INTEGER not null,
  seller_num    INTEGER not null,
  id            INTEGER not null,
  shekem_num    INTEGER not null
)
;
alter table SELLER
  add primary key (ID, SHEKEM_NUM);
alter table SELLER
  add unique (SELLER_NUM);
alter table SELLER
  add foreign key (ID)
  references SOLDIER (ID);
alter table SELLER
  add foreign key (SHEKEM_NUM)
  references SHEKEM (SHEKEM_NUM);
alter table SELLER
  add constraint CHECK_POSITIVE_AMOUNT
  check (total_sales_ >= 0);
alter table SELLER
  add constraint CHECK_POSITIVE_SALES
  check (total_sales_ >= 0);
alter table SELLER
  add constraint CHECK_POSITIVE_SALES_NUM
  check (total_sales_ >= 0);
alter table SELLER
  add constraint CHK_POSITIVE_AMOUNT
  check (total_sales_ >= 0);
alter table SELLER
  add constraint CHK_SALES_POSITIVE
  check (total_sales_ >= 0);

prompt Truncating SELLER...
truncate table SELLER;
prompt Truncating HAS...
truncate table HAS;
prompt Truncating PRODUCT...
truncate table PRODUCT;
prompt Truncating DEVICE...
truncate table DEVICE;
prompt Truncating BRINGS_TO...
truncate table BRINGS_TO;
prompt Truncating SHEKEM...
truncate table SHEKEM;
prompt Truncating DELIVERY...
truncate table DELIVERY;
prompt Truncating DRIVER...
truncate table DRIVER;
prompt Truncating VEHICLE...
truncate table VEHICLE;
prompt Truncating SOLDIER...
truncate table SOLDIER;
prompt Loading SOLDIER...
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (872205343, 981220, 'Brose', to_date('30-03-1986', 'dd-mm-yyyy'), 'Rav Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (708338623, 264985, 'Cherilyn', to_date('24-06-2018', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (694965433, 474798, 'Lelia', to_date('29-07-1983', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (461999971, 334093, 'Joannes', to_date('19-10-1985', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (508353292, 286498, 'Vanda', to_date('27-03-2001', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (899588610, 132137, 'Tabbi', to_date('08-11-2012', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (934269879, 375547, 'Jobie', to_date('27-06-1981', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (123564850, 800088, 'Herman', to_date('23-09-2023', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (249443272, 42273, 'Lothaire', to_date('11-02-1986', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (809069260, 918992, 'Fair', to_date('26-06-2016', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (728544897, 292984, 'Sharity', to_date('23-08-1995', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (129591888, 267249, 'Shannon', to_date('27-01-2019', 'dd-mm-yyyy'), 'Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (668266795, 149178, 'Jorrie', to_date('02-12-2011', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (769472733, 218324, 'Delainey', to_date('10-06-1989', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (607059069, 512097, 'Donni', to_date('18-08-2007', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (970737605, 127090, 'Murvyn', to_date('06-07-2014', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (197190833, 249078, 'Junia', to_date('13-11-1984', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (665115654, 547645, 'Elena', to_date('16-05-1992', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (790271554, 22617, 'Agnes', to_date('17-06-1986', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (168124419, 728670, 'Vassili', to_date('12-10-2016', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (56069798, 288044, 'Elaina', to_date('09-01-1999', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (827096050, 96937, 'Lavinie', to_date('01-11-2013', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (129663591, 195724, 'Tibold', to_date('11-05-1989', 'dd-mm-yyyy'), 'Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (34722088, 186812, 'Orly', to_date('23-10-1987', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (68839870, 969157, 'Ileana', to_date('12-02-2022', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (382652351, 154240, 'Hedvig', to_date('15-07-1995', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (796826082, 96690, 'Trula', to_date('21-08-1993', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (884100519, 567862, 'Peg', to_date('20-01-1998', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (518311081, 543607, 'Bobbie', to_date('20-04-2003', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (162096332, 817094, 'Gui', to_date('13-01-1985', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (403413591, 582955, 'Carol', to_date('31-01-2013', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (993265561, 485304, 'Walton', to_date('05-08-2021', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (907418891, 72636, 'Corrie', to_date('25-10-1985', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (717196325, 550413, 'Teodoro', to_date('30-08-1987', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (95198325, 113805, 'Rudolph', to_date('03-01-2018', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (674388677, 181577, 'Yolanthe', to_date('14-08-2023', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (385937842, 796134, 'Ivie', to_date('31-03-2013', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (826717808, 593897, 'Janetta', to_date('05-06-2001', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (38057264, 87030, 'Hirsch', to_date('02-01-2023', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (170946202, 926361, 'Conroy', to_date('25-01-1998', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (39531344, 26773, 'Callie', to_date('12-04-2014', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (377690437, 571459, 'Goldia', to_date('27-04-1995', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (305312388, 186614, 'Cale', to_date('22-09-2022', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (295528732, 660607, 'Cordula', to_date('08-07-1993', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (113224706, 966691, 'Matthias', to_date('15-12-2007', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (710863046, 302381, 'Sergei', to_date('29-01-2017', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (757831120, 766483, 'Kathi', to_date('30-07-2014', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (134922863, 720963, 'Will', to_date('04-04-2001', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (550520513, 547285, 'Dacia', to_date('08-12-1988', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (85028704, 72311, 'Dell', to_date('05-12-2016', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (447557317, 375080, 'Thibaut', to_date('08-05-1989', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (840760549, 7195, 'Thorndike', to_date('07-09-2020', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (328542395, 986983, 'Viva', to_date('26-02-1988', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (394905067, 294263, 'Kariotta', to_date('29-11-1987', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (645872936, 97419, 'Ted', to_date('25-08-1999', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (39531209, 388819, 'Cherri', to_date('20-08-2000', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (925497353, 208689, 'Peyter', to_date('05-11-2015', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (424362430, 382847, 'Dickie', to_date('25-08-2017', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (599480717, 586713, 'Hetti', to_date('22-02-1998', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (355397965, 88330, 'Aura', to_date('03-07-1991', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (277930044, 206990, 'Mirilla', to_date('19-10-2004', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (99955694, 499085, 'Eloise', to_date('11-06-1989', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (30528986, 413022, 'Pace', to_date('22-02-2000', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (200459920, 502935, 'Inglis', to_date('22-02-2000', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (746625953, 970976, 'Kellina', to_date('16-10-2013', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (473019481, 111329, 'Jammal', to_date('03-10-1996', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (675821836, 957479, 'Lisette', to_date('20-01-1996', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (358145036, 896399, 'Ado', to_date('20-07-2019', 'dd-mm-yyyy'), 'Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (270862332, 291395, 'Colas', to_date('27-07-1994', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (464423876, 712732, 'Meier', to_date('10-11-2003', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (8985748, 431377, 'Jany', to_date('11-01-1987', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (436705936, 260219, 'Jarid', to_date('23-03-1995', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (174066999, 575008, 'Randell', to_date('09-08-2001', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (428357864, 804157, 'Caria', to_date('27-07-1998', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (589450929, 116453, 'Lars', to_date('17-02-2003', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (399386615, 533511, 'Felipa', to_date('07-04-2005', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (71681340, 875743, 'Desi', to_date('18-07-1981', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (667276251, 162359, 'Oralle', to_date('02-03-2013', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (250490156, 671820, 'Jeremy', to_date('13-02-1989', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (274935545, 883586, 'Conni', to_date('23-11-1986', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (614939515, 842554, 'Dana', to_date('25-07-2022', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (695693194, 896988, 'Oneida', to_date('01-11-2006', 'dd-mm-yyyy'), 'Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (814634122, 737636, 'Briant', to_date('12-10-1987', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (83974239, 847938, 'Jacquelin', to_date('07-08-2005', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (267524998, 882348, 'Caren', to_date('23-07-1987', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (395765837, 829774, 'Rosalind', to_date('20-01-2017', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (683655938, 882986, 'Zeb', to_date('25-08-1981', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (263682528, 817326, 'Bibbie', to_date('07-03-2018', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (877493083, 359672, 'Hayward', to_date('05-06-2011', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (763624579, 411027, 'Sondra', to_date('19-05-1994', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (908008170, 80491, 'Ugo', to_date('17-10-1984', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (163740492, 124329, 'Nat', to_date('16-05-2014', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (260844930, 882390, 'Issy', to_date('01-05-1994', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (638293740, 3158, 'Lavena', to_date('21-09-2011', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (164819374, 765857, 'Judy', to_date('08-04-2015', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (751355721, 994563, 'Fairleigh', to_date('19-11-2013', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (353343650, 41775, 'Evangelin', to_date('09-02-1989', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (858873709, 577756, 'Walliw', to_date('30-12-2015', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (476745216, 417301, 'Arlan', to_date('13-12-2016', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (278413709, 27127, 'Jesse', to_date('30-08-1993', 'dd-mm-yyyy'), 'Segen Mishneh');
commit;
prompt 100 records committed...
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (572888847, 913619, 'Joshia', to_date('28-11-1987', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (538200293, 951408, 'Dedie', to_date('25-06-2017', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (861096098, 419659, 'Rice', to_date('13-04-2001', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (757334285, 566029, 'Brandie', to_date('21-01-1980', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (509670721, 32785, 'Otho', to_date('30-01-1995', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (756949281, 531881, 'Rivkah', to_date('03-05-1982', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (379370561, 905982, 'Derwin', to_date('15-05-2004', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (620670112, 503705, 'Giffy', to_date('18-11-1983', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (787587330, 294159, 'Elsinore', to_date('08-07-2020', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (7599704, 323224, 'Horatio', to_date('01-05-2002', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (531484175, 454664, 'Karylin', to_date('20-09-2006', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (512684306, 131217, 'Hillard', to_date('07-03-2021', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (951784274, 720774, 'Ronni', to_date('10-12-2014', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (10319452, 222193, 'Constantine', to_date('23-04-2004', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (301282487, 456577, 'Rollins', to_date('15-12-2005', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (479631212, 549720, 'Elisabetta', to_date('10-03-2010', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (885876699, 795071, 'Rogers', to_date('13-11-2003', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (486557210, 40424, 'Tobye', to_date('29-01-1983', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (506275431, 399698, 'Rosemonde', to_date('21-05-1992', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (614451967, 161425, 'Herold', to_date('18-01-1995', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (580585940, 329501, 'Sharleen', to_date('11-05-1988', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (376376622, 802611, 'Demott', to_date('26-08-2016', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (318224446, 408286, 'Genevieve', to_date('21-04-1986', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (312277675, 967097, 'Magdalen', to_date('31-10-2003', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (999204542, 418974, 'Ysabel', to_date('18-12-1991', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (907355170, 669802, 'Vanni', to_date('31-10-1983', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (880018909, 410790, 'Claudian', to_date('16-05-1980', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (711670666, 737773, 'Nyssa', to_date('24-07-1999', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (452410690, 539400, 'Perry', to_date('26-09-2012', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (355170089, 142716, 'Consuelo', to_date('27-12-1993', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (34887202, 939306, 'Bronnie', to_date('19-09-1996', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (407473605, 696797, 'Catha', to_date('01-02-2023', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (29690111, 771198, 'Hermione', to_date('18-08-1989', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (801184376, 874519, 'Maris', to_date('09-11-1996', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (559298767, 824054, 'Ginger', to_date('15-01-2022', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (375982357, 707260, 'Martin', to_date('12-05-1987', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (123980617, 369992, 'Jessalin', to_date('13-06-2019', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (440460239, 661756, 'Rodolfo', to_date('30-10-2010', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (973344811, 803781, 'Vachel', to_date('18-12-1993', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (951528195, 954544, 'Genni', to_date('26-02-2001', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (943649081, 996174, 'Rozanne', to_date('13-02-2018', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (912128568, 994101, 'Giavani', to_date('09-04-2014', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (251206060, 259704, 'Vinni', to_date('16-05-2012', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (942058810, 302017, 'Vally', to_date('19-08-2004', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (753222074, 552409, 'Gilburt', to_date('25-01-2006', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (235962035, 748686, 'Dyanna', to_date('16-09-1991', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (350918762, 81976, 'Mose', to_date('11-05-2014', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (410431241, 695189, 'Trumann', to_date('15-03-2003', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (40173972, 215640, 'Sapphire', to_date('07-03-1997', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (193961069, 823373, 'Ryon', to_date('13-08-1985', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (905285468, 392939, 'Annette', to_date('22-08-1988', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (150458420, 372670, 'Marietta', to_date('29-01-2017', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (837214354, 365041, 'Fredia', to_date('16-08-2016', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (111354105, 212961, 'Victoria', to_date('16-06-2009', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (804048628, 274531, 'Brandtr', to_date('13-04-2020', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (248583191, 186399, 'Odo', to_date('29-06-1983', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (894902933, 664966, 'Dulcine', to_date('14-02-2013', 'dd-mm-yyyy'), 'Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (118982735, 365399, 'Boris', to_date('29-02-1980', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (307659308, 563832, 'Candie', to_date('15-12-1981', 'dd-mm-yyyy'), 'Rav Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (385633411, 977258, 'Ardisj', to_date('28-11-2019', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (270614414, 934357, 'Kiah', to_date('31-03-1999', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (893730747, 29790, 'Wilton', to_date('07-09-2005', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (771062372, 742587, 'Dyane', to_date('21-12-2015', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (685008059, 666502, 'Pancho', to_date('28-12-2009', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (507297289, 222578, 'Nathaniel', to_date('01-05-2016', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (149082896, 180386, 'Ivett', to_date('22-09-1980', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (203959567, 610386, 'Avram', to_date('27-03-2010', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (665942247, 612102, 'Bibbye', to_date('15-06-2010', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (664965013, 186416, 'Virginia', to_date('22-09-1986', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (18894026, 423782, 'Rabbi', to_date('05-08-2003', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (111331288, 545670, 'Brittani', to_date('24-09-2008', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (373166837, 997418, 'Bancroft', to_date('21-10-2006', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (615724933, 323879, 'Indira', to_date('12-09-2002', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (400189130, 144998, 'Barnabe', to_date('13-05-1986', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (140544361, 757795, 'Crissy', to_date('03-06-2000', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (5489449, 397999, 'Estel', to_date('20-07-1992', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (146679209, 847575, 'Melicent', to_date('18-12-1990', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (425588262, 378728, 'Taylor', to_date('09-06-2015', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (808733085, 61970, 'Benito', to_date('27-12-1982', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (656976380, 636777, 'Barron', to_date('24-09-1993', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (414977157, 835604, 'Phillie', to_date('05-02-1988', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (734254038, 555176, 'Kearney', to_date('30-03-2019', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (727792601, 87628, 'Moshe', to_date('31-10-2011', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (537471, 630293, 'Babara', to_date('26-05-2017', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (165315389, 376229, 'Andras', to_date('13-04-2013', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (70197134, 971294, 'Zabrina', to_date('02-06-2001', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (348688553, 154646, 'Robin', to_date('09-01-1992', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (745499034, 338323, 'Farlie', to_date('11-02-2023', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (748046109, 905363, 'Milicent', to_date('30-12-1988', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (622509736, 89538, 'Rab', to_date('10-07-1983', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (951207632, 271580, 'Ara', to_date('06-04-1990', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (52498515, 922949, 'Becky', to_date('31-12-1984', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (683925016, 421918, 'Shari', to_date('18-05-1991', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (965577538, 90327, 'Cherri', to_date('23-11-1983', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (728995488, 483729, 'Edgard', to_date('31-08-2016', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (239422553, 749797, 'Cully', to_date('08-05-2023', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (15875044, 500654, 'Gabriele', to_date('12-10-1987', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (664342430, 864253, 'Juliann', to_date('18-09-2014', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (712536246, 893538, 'Kelbee', to_date('18-02-2003', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (163297817, 850387, 'Nickey', to_date('30-03-1993', 'dd-mm-yyyy'), 'Rav Samal Rishon');
commit;
prompt 200 records committed...
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (829994890, 800341, 'Jasmin', to_date('25-02-2011', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (240868549, 514016, 'Shantee', to_date('21-12-2008', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (393885274, 977283, 'Hyatt', to_date('14-05-1982', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (587921128, 559475, 'Mandie', to_date('03-11-2003', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (311112051, 486056, 'Trudie', to_date('24-07-2004', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (82734791, 913831, 'Morganne', to_date('24-01-2003', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (375090682, 954209, 'Cariotta', to_date('11-04-2004', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (437092221, 352463, 'Amalea', to_date('08-10-1987', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (556881257, 822800, 'Nicky', to_date('17-02-1985', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (97550001, 108430, 'Jandy', to_date('11-02-2003', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (639291131, 954639, 'Clem', to_date('12-04-1986', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (147034524, 442683, 'Sisely', to_date('10-07-2002', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (901198384, 404749, 'Lazar', to_date('04-10-2009', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (410928055, 107498, 'Gerek', to_date('18-09-1991', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (783584123, 144044, 'Terencio', to_date('31-12-1989', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (674464517, 229740, 'Rodney', to_date('04-11-2012', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (760964428, 927124, 'Yale', to_date('27-07-2013', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (265033501, 188724, 'Helenka', to_date('02-03-2014', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (570499077, 209999, 'Pearce', to_date('20-04-1983', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (149420823, 946345, 'Lynn', to_date('22-05-2002', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (902999774, 81881, 'Ximenes', to_date('12-07-2019', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (827737802, 949009, 'Sylvan', to_date('21-11-2003', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (336805392, 354637, 'Jena', to_date('01-12-2009', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (255650723, 47748, 'Oliver', to_date('08-06-2017', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (400868149, 374306, 'Lissa', to_date('17-02-2013', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (529008738, 342437, 'Janela', to_date('25-11-1983', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (32746142, 954227, 'Barris', to_date('04-04-1997', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (388967420, 674178, 'Rochester', to_date('11-08-2001', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (897575403, 573806, 'Perry', to_date('05-12-2021', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (484993111, 103765, 'Jareb', to_date('17-03-1980', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (798765497, 500695, 'Lauretta', to_date('07-04-1982', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (177565429, 683370, 'Garnette', to_date('01-06-2000', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (668892090, 749455, 'Dredi', to_date('04-04-2021', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (506348064, 85259, 'Hannah', to_date('19-05-2010', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (587892471, 308985, 'Maurizia', to_date('29-04-2017', 'dd-mm-yyyy'), 'Rav Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (149975633, 336619, 'Shane', to_date('27-06-2013', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (576503961, 197518, 'Luisa', to_date('02-03-1986', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (961390047, 677044, 'Ethel', to_date('21-04-1994', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (62379380, 599732, 'Steve', to_date('10-09-1984', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (374084896, 750844, 'Petunia', to_date('22-05-1991', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (354242777, 611714, 'Jennica', to_date('10-05-2004', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (597514278, 957145, 'Marianne', to_date('14-02-2006', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (603739842, 494941, 'Cosetta', to_date('14-06-1991', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (472354570, 907068, 'Jecho', to_date('24-05-1983', 'dd-mm-yyyy'), 'Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (719300252, 134122, 'Shel', to_date('05-12-2008', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (744686974, 692034, 'Rance', to_date('15-05-2003', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (664904645, 945744, 'Yolande', to_date('14-02-1993', 'dd-mm-yyyy'), 'Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (351119461, 800026, 'Tony', to_date('13-01-1987', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (153743714, 961308, 'Holly-anne', to_date('01-05-1981', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (781478541, 818023, 'Faun', to_date('08-06-1993', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (124236762, 574520, 'Rhoda', to_date('24-06-2022', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (117637234, 653581, 'Elwyn', to_date('01-06-2021', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (255313969, 319029, 'Gracie', to_date('02-05-2010', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (579495883, 121259, 'Travers', to_date('19-01-2001', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (509186975, 993821, 'Sheridan', to_date('23-03-1994', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (815317151, 378123, 'Papageno', to_date('08-10-2007', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (224153697, 625636, 'Loralie', to_date('29-12-1999', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (549552636, 400920, 'Boycie', to_date('13-02-1994', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (568695140, 388598, 'Ramon', to_date('11-08-1988', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (177021868, 561141, 'Marinna', to_date('16-10-1987', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (408348291, 60589, 'Ximenez', to_date('17-09-2017', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (65389094, 757164, 'Anastasia', to_date('23-01-1992', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (800241401, 916061, 'Odessa', to_date('12-08-2010', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (133225637, 85569, 'Kerry', to_date('16-12-1995', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (554172508, 449930, 'Eve', to_date('16-02-2016', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (547012693, 776823, 'Vachel', to_date('30-08-1996', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (652359388, 859460, 'Devan', to_date('26-09-2009', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (792383619, 153779, 'Genny', to_date('02-08-1992', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (596600603, 570882, 'Clarence', to_date('07-10-1999', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (59489611, 535937, 'Aveline', to_date('11-06-2015', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (106171803, 636911, 'Simonette', to_date('02-10-1996', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (759962148, 415628, 'Meryl', to_date('19-09-2018', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (710325046, 106908, 'Hakim', to_date('07-05-1987', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (512953161, 336884, 'Darnell', to_date('16-04-2003', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (546809789, 688407, 'Suellen', to_date('09-04-1989', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (596057126, 238362, 'Shari', to_date('09-09-1981', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (944987867, 626334, 'Gunner', to_date('09-12-2014', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (470473923, 911861, 'Talyah', to_date('10-09-1995', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (451053085, 672536, 'Nerissa', to_date('09-07-2018', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (893866746, 705822, 'Alonso', to_date('31-01-1986', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (366389133, 873248, 'Kandy', to_date('30-04-1984', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (973639105, 961856, 'Carita', to_date('19-03-2011', 'dd-mm-yyyy'), 'Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (588319047, 597985, 'Darlleen', to_date('11-03-2007', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (603847885, 645531, 'Alvie', to_date('17-05-1983', 'dd-mm-yyyy'), 'Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (804219893, 913775, 'Gloriana', to_date('31-10-2014', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (572588497, 805214, 'Kelsey', to_date('27-06-1980', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (988601317, 658356, 'Karna', to_date('23-07-2007', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (446063611, 180254, 'Tarrah', to_date('08-09-1997', 'dd-mm-yyyy'), 'Rav Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (805337368, 995483, 'Maybelle', to_date('09-10-1985', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (978519037, 186198, 'Jonell', to_date('22-10-2000', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (798501887, 608074, 'Alf', to_date('05-09-2014', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (550458823, 30499, 'Fey', to_date('15-05-1991', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (825739352, 29777, 'Rudy', to_date('17-08-2016', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (611948480, 949018, 'Blair', to_date('15-04-2004', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (519611001, 585296, 'Celestina', to_date('20-05-1994', 'dd-mm-yyyy'), 'Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (487913724, 439381, 'Ennis', to_date('27-09-2019', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (3559427, 113683, 'Babita', to_date('17-09-1992', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (737200868, 227098, 'Charmian', to_date('03-04-2019', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (477609634, 494036, 'Aigneis', to_date('11-06-2000', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (787260560, 284887, 'Hort', to_date('07-08-1988', 'dd-mm-yyyy'), 'Samal');
commit;
prompt 300 records committed...
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (572090388, 620185, 'Fernandina', to_date('23-12-2010', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (34384593, 427904, 'Heida', to_date('12-10-1989', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (589728367, 112586, 'Gabrielle', to_date('29-10-1985', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (533702029, 214569, 'Jeannine', to_date('15-12-2005', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (76592836, 43382, 'Bram', to_date('01-02-2009', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (49253606, 772165, 'Euphemia', to_date('26-12-1988', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (780217178, 556154, 'Aindrea', to_date('02-06-1989', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (233690997, 700012, 'Ertha', to_date('12-04-1985', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (560457180, 953836, 'Borden', to_date('03-09-2021', 'dd-mm-yyyy'), 'Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (603182544, 865, 'Sapphira', to_date('13-05-2002', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (3568320, 240581, 'Shantee', to_date('12-09-2010', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (693674427, 3691, 'Kathleen', to_date('06-05-1986', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (58875248, 998413, 'Cordelie', to_date('16-12-2017', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (594100772, 360481, 'Saree', to_date('30-09-1998', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (147049999, 146387, 'Demetri', to_date('15-06-2014', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (427521663, 233296, 'Sibby', to_date('01-05-2019', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (491732575, 349248, 'Patrick', to_date('10-06-1992', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (506221412, 393670, 'Vin', to_date('17-05-2002', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (626347171, 410762, 'Aleta', to_date('04-05-1999', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (543649717, 449967, 'Elyn', to_date('07-11-1981', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (501899535, 187736, 'Ferdie', to_date('27-06-1991', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (685009900, 648092, 'Cordey', to_date('06-03-1996', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (9750344, 394796, 'Travus', to_date('24-02-2003', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (77624168, 105047, 'Rip', to_date('17-11-2022', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (20742820, 551505, 'Karly', to_date('01-08-2007', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (994812657, 776381, 'Alasdair', to_date('17-11-2023', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (166977539, 720227, 'Eliot', to_date('12-09-2001', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (727004712, 523958, 'Genni', to_date('04-01-2003', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (697150986, 390841, 'Marlene', to_date('26-12-1995', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (308445258, 18797, 'Winna', to_date('20-10-1997', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (855586390, 869986, 'Urban', to_date('28-02-1984', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (695960687, 689953, 'Gregg', to_date('25-10-1989', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (644427789, 154825, 'Egor', to_date('01-11-1987', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (90329559, 799624, 'Barri', to_date('22-12-2020', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (775676071, 64920, 'Rikki', to_date('27-08-2010', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (497885636, 492718, 'Lucien', to_date('09-10-1981', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (557416789, 658690, 'Torrin', to_date('20-06-2000', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (404780867, 633624, 'Layton', to_date('02-10-1988', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (557584288, 233447, 'Tresa', to_date('07-01-1986', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (117236664, 833462, 'Nickola', to_date('28-12-2004', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (476305335, 377392, 'Mariam', to_date('17-04-2019', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (36557042, 141132, 'Sandy', to_date('02-06-1999', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (869381600, 303051, 'Devonne', to_date('11-01-2010', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (739693447, 400368, 'Tremaine', to_date('15-03-1991', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (722415582, 642698, 'Stan', to_date('28-08-2001', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (98834617, 144897, 'Ranice', to_date('06-05-1993', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (686520084, 518571, 'Cyndie', to_date('13-12-2009', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (771626857, 276107, 'Baron', to_date('11-05-1992', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (30470247, 387510, 'Krissie', to_date('14-07-1996', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (177682741, 152041, 'Leonardo', to_date('16-06-2010', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (928290803, 502697, 'Farica', to_date('12-01-1980', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (374273610, 421616, 'Fanny', to_date('04-02-1993', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (377244895, 656447, 'Amalie', to_date('16-06-1988', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (698719894, 32135, 'Dael', to_date('14-07-1990', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (993883372, 839, 'Linc', to_date('25-05-1994', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (232814851, 906478, 'Oralle', to_date('24-04-2015', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (330381310, 18919, 'Maggee', to_date('02-03-1987', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (298319988, 407929, 'Rheba', to_date('30-06-1994', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (758992323, 827085, 'Kirstin', to_date('08-10-1992', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (135231662, 300942, 'Robinett', to_date('10-11-2023', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (321241789, 106595, 'Phedra', to_date('30-01-1986', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (202783445, 416220, 'Moses', to_date('27-02-2008', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (628600454, 845954, 'Inness', to_date('17-03-1985', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (721293901, 508435, 'Dorella', to_date('28-04-2010', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (576563496, 85480, 'Shadow', to_date('04-10-2020', 'dd-mm-yyyy'), 'Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (435483177, 632087, 'Boyd', to_date('23-11-1983', 'dd-mm-yyyy'), 'Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (857964382, 473891, 'Alysia', to_date('22-03-2016', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (3719936, 744004, 'Claudina', to_date('18-06-2001', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (250713580, 854698, 'Waylin', to_date('03-01-2000', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (290383382, 773931, 'Marchall', to_date('27-01-2006', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (79899163, 689943, 'Cornie', to_date('30-01-1996', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (733217108, 700190, 'Dallis', to_date('27-08-1994', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (862916677, 829378, 'Bianca', to_date('15-10-1987', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (859228917, 690603, 'Ailis', to_date('28-05-1983', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (471573222, 943351, 'Patience', to_date('04-09-2013', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (617857020, 995914, 'Annetta', to_date('20-12-1998', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (68831150, 833549, 'Liane', to_date('19-01-1993', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (856928435, 342798, 'Ame', to_date('12-01-1995', 'dd-mm-yyyy'), 'Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (682647633, 178486, 'Danya', to_date('09-12-2010', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (464145195, 477812, 'Ashia', to_date('18-11-1983', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (136157547, 559811, 'Debora', to_date('25-07-1999', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (662739749, 974279, 'Ham', to_date('21-07-1985', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (473765382, 127620, 'Krystalle', to_date('02-07-1982', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (906843751, 448307, 'Adella', to_date('17-02-2005', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (283963005, 939274, 'Gennifer', to_date('30-05-2006', 'dd-mm-yyyy'), 'Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (92057408, 31036, 'Hatty', to_date('02-07-2010', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (630030334, 960139, 'Erie', to_date('18-02-1998', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (713326269, 307340, 'Ester', to_date('15-11-2009', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (265895682, 711655, 'Hillyer', to_date('06-11-2002', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (71558043, 455207, 'Carmine', to_date('15-06-1998', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (782517633, 887179, 'Jeddy', to_date('16-07-1990', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (939716730, 192166, 'Giselbert', to_date('04-05-2007', 'dd-mm-yyyy'), 'Rav Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (543444956, 433909, 'Kimbra', to_date('04-07-2006', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (801831686, 219440, 'Gertrude', to_date('20-12-1999', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (821679082, 632579, 'Tarah', to_date('08-09-2008', 'dd-mm-yyyy'), 'Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (757571536, 997356, 'Skipton', to_date('17-02-2023', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (110717978, 253239, 'Coralyn', to_date('25-10-2008', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (944593121, 962416, 'Witty', to_date('25-09-2002', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (567591573, 907589, 'Christie', to_date('25-01-1982', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (520460997, 431157, 'Ruggiero', to_date('31-12-2011', 'dd-mm-yyyy'), 'Segen Rishon');
commit;
prompt 400 records committed...
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (851802090, 885090, 'Godfree', to_date('10-08-2020', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (255310381, 374536, 'Farand', to_date('09-02-2021', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (631119749, 378119, 'Lilah', to_date('28-05-2013', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (952923472, 733548, 'Karolina', to_date('11-11-2007', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (988666139, 15714, 'Jdavie', to_date('11-09-2019', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (735380075, 780902, 'Ashil', to_date('08-04-1982', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (968119630, 510592, 'Jamal', to_date('26-05-1986', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (347580048, 845459, 'Wolfie', to_date('14-01-1996', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (574033117, 406395, 'Fabian', to_date('13-02-1982', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (694758482, 197176, 'Kermie', to_date('18-09-1983', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (650566673, 706559, 'Hi', to_date('27-11-1997', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (612402527, 390448, 'Ramsay', to_date('27-12-2006', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (634634560, 271707, 'Juliana', to_date('28-04-2000', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (436514206, 841970, 'Helena', to_date('16-03-2004', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (483890780, 893857, 'Margarethe', to_date('18-05-2017', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (834318574, 113406, 'Isabeau', to_date('03-02-2002', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (778359024, 912124, 'Caesar', to_date('14-12-1981', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (320991254, 21640, 'Garik', to_date('07-03-2023', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (50952234, 665103, 'Ulrika', to_date('01-07-1982', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (730507007, 768790, 'Othello', to_date('05-07-2003', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (569367284, 269531, 'Liv', to_date('10-10-2021', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (958874023, 683854, 'Gertrud', to_date('26-08-1988', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (372399632, 750717, 'Merrel', to_date('17-09-2000', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (881550437, 574023, 'Dudley', to_date('16-02-2019', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (171569151, 549425, 'Philip', to_date('22-02-2018', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (952138335, 582668, 'Mattias', to_date('16-08-2009', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (121432782, 966661, 'Cointon', to_date('29-06-2006', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (316595208, 950634, 'Mitchael', to_date('12-07-1980', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (6704962, 117540, 'Kaleena', to_date('21-04-1999', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (484930729, 259506, 'Tamiko', to_date('08-12-2022', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (458417974, 332942, 'Verina', to_date('30-05-2005', 'dd-mm-yyyy'), 'Rav Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (217256349, 272710, 'Silas', to_date('28-07-2005', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (721688496, 724173, 'Lenard', to_date('28-06-2017', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (50055848, 788983, 'Hector', to_date('29-08-1983', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (290559328, 835615, 'Claudie', to_date('11-12-2012', 'dd-mm-yyyy'), 'Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (123456368, 995574, 'Rodd', to_date('18-09-1990', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (268924335, 361189, 'Finley', to_date('06-05-1987', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (946188340, 588291, 'Gaven', to_date('22-06-1981', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (139827450, 177481, 'Rosemonde', to_date('29-12-2020', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (114571110, 131997, 'Elly', to_date('15-05-1990', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (936696442, 96779, 'Clarabelle', to_date('23-05-1990', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (233777116, 726386, 'Eula', to_date('22-11-1997', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (804029926, 20662, 'Clarissa', to_date('02-02-2021', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (940034758, 950542, 'Gennifer', to_date('09-12-2001', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (513140717, 198593, 'Norean', to_date('04-03-2007', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (585899415, 166751, 'Bambi', to_date('15-03-1990', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (632371458, 140548, 'Jocelyn', to_date('29-01-1984', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (214209410, 695252, 'Alli', to_date('09-05-2009', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (623375199, 747361, 'Mufinella', to_date('18-05-1989', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (596858560, 833895, 'Cam', to_date('14-10-2022', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (118475647, 195289, 'Leeanne', to_date('12-04-2017', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (130945021, 209908, 'Vinson', to_date('08-12-2014', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (90908276, 586996, 'Merrel', to_date('02-03-2013', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (464944035, 803038, 'Marketa', to_date('23-08-2004', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (822002397, 340409, 'Arluene', to_date('09-07-1999', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (600178114, 617713, 'Cyb', to_date('02-05-1992', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (786332167, 265735, 'Melinda', to_date('01-09-1992', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (283200270, 990284, 'Vincents', to_date('27-01-2015', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (332883077, 153323, 'Kelcie', to_date('01-03-1992', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (876993532, 375471, 'Noami', to_date('08-07-1985', 'dd-mm-yyyy'), 'Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (910304063, 879946, 'Helaina', to_date('18-05-2009', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (965238249, 950934, 'Marijo', to_date('30-06-1982', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (442075679, 586428, 'Lorant', to_date('19-06-2010', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (617344527, 969792, 'Andrea', to_date('28-12-2011', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (568384995, 770887, 'Kalie', to_date('21-02-1993', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (904161703, 572285, 'Jaquenette', to_date('14-02-2005', 'dd-mm-yyyy'), 'Aluf Mishne');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (992494804, 168240, 'Goldie', to_date('11-07-1995', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (173238993, 154519, 'Alikee', to_date('10-03-2004', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (38178459, 908852, 'Godard', to_date('17-10-2022', 'dd-mm-yyyy'), 'Rav Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (67209238, 978845, 'Brigg', to_date('13-04-2020', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (850294879, 367784, 'Alberto', to_date('03-09-2002', 'dd-mm-yyyy'), 'Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (895532177, 276496, 'Felicia', to_date('29-08-1998', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (994893233, 519535, 'Nike', to_date('13-05-2000', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (566843828, 417508, 'Shandra', to_date('18-06-2020', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (369296479, 300874, 'Aldo', to_date('03-09-1998', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (391203824, 76163, 'Amye', to_date('05-02-2001', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (723951031, 813977, 'Saxon', to_date('25-04-2011', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (218477177, 233560, 'Brendan', to_date('03-09-1990', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (442774733, 725019, 'Joyann', to_date('27-12-2022', 'dd-mm-yyyy'), 'Tat Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (312125671, 345360, 'Stirling', to_date('21-08-2008', 'dd-mm-yyyy'), 'Turai Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (672039858, 329437, 'Clyde', to_date('11-03-1980', 'dd-mm-yyyy'), 'Rav Seren');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (168559157, 205177, 'Rabi', to_date('05-06-2004', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (870770849, 782796, 'Neysa', to_date('31-07-1981', 'dd-mm-yyyy'), 'Segen Mishneh');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (191220474, 11086, 'Eva', to_date('06-06-2000', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (19126397, 384078, 'Dixie', to_date('15-11-1998', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (440780791, 673024, 'Fiorenze', to_date('12-05-2001', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (83938648, 441774, 'Aloysia', to_date('06-08-1996', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (721207030, 273979, 'Shell', to_date('20-12-2012', 'dd-mm-yyyy'), 'Segen');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (555621587, 718813, 'Trevor', to_date('08-04-1993', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (533247878, 763862, 'Codie', to_date('06-08-1999', 'dd-mm-yyyy'), 'Rav Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (191421024, 37815, 'Amalle', to_date('14-04-2002', 'dd-mm-yyyy'), 'Turai');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (695145415, 784408, 'Mayor', to_date('12-07-1999', 'dd-mm-yyyy'), 'Samal');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (745802224, 714021, 'Seymour', to_date('19-11-1999', 'dd-mm-yyyy'), 'Rav Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (268587294, 642656, 'Gerianne', to_date('05-06-1988', 'dd-mm-yyyy'), 'Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (259237484, 371016, 'Ezri', to_date('05-05-2015', 'dd-mm-yyyy'), 'Rav Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (794740915, 74471, 'Willette', to_date('10-04-1993', 'dd-mm-yyyy'), 'Sgan Aluf');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (847664668, 522382, 'Jaimie', to_date('07-11-1985', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (709984281, 69747, 'Petronille', to_date('05-01-2013', 'dd-mm-yyyy'), 'Samal Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (958585013, 692058, 'Stephanus', to_date('19-07-2017', 'dd-mm-yyyy'), 'Segen Rishon');
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (748921375, 816914, 'Tatiania', to_date('06-01-1988', 'dd-mm-yyyy'), 'Rav Samal Mitkadem');
commit;
prompt 500 records committed...
insert into SOLDIER (id, idf_num, name, enlistment_date_, rank)
values (869363085, 444444, 'Shalom', to_date('01-01-2000', 'dd-mm-yyyy'), 'Turai');
commit;
prompt 501 records loaded
prompt Loading VEHICLE...
insert into VEHICLE (license_num, model, type)
values (9213814, 'Maxima', 'Mazzanti');
insert into VEHICLE (license_num, model, type)
values (2913116, 'RS7', 'Lada');
insert into VEHICLE (license_num, model, type)
values (1443207, 'B-Class', 'Radical');
insert into VEHICLE (license_num, model, type)
values (5487537, 'Golf', 'AMC');
insert into VEHICLE (license_num, model, type)
values (5588517, 'Turbo', 'Farbio');
insert into VEHICLE (license_num, model, type)
values (661480, 'Aygo', 'AMC');
insert into VEHICLE (license_num, model, type)
values (2070525, 'Zetao', 'Morgan');
insert into VEHICLE (license_num, model, type)
values (6148532, 'Bronco', 'Audi');
insert into VEHICLE (license_num, model, type)
values (5379078, 'Highlander', 'Hennessey');
insert into VEHICLE (license_num, model, type)
values (8696175, 'Patrol', 'Bristol');
insert into VEHICLE (license_num, model, type)
values (3457125, 'Ruby', 'NIO');
insert into VEHICLE (license_num, model, type)
values (9764203, 'Espace', 'Yes');
insert into VEHICLE (license_num, model, type)
values (5004504, 'Cerato', 'Martin');
insert into VEHICLE (license_num, model, type)
values (3116273, 'Bluebird', 'Aurus');
insert into VEHICLE (license_num, model, type)
values (4784396, 'Seltos', 'Ken Okuyama');
insert into VEHICLE (license_num, model, type)
values (6809897, 'Legacy', 'Bugatti');
insert into VEHICLE (license_num, model, type)
values (7860361, 'RS7', 'Gemballa');
insert into VEHICLE (license_num, model, type)
values (2724348, 'Town & Country', 'Subaru');
insert into VEHICLE (license_num, model, type)
values (3071803, 'Territory', 'Plymouth');
insert into VEHICLE (license_num, model, type)
values (9000534, 'Explorer', 'Mazzanti');
insert into VEHICLE (license_num, model, type)
values (7460745, 'Genesis', 'FAW');
insert into VEHICLE (license_num, model, type)
values (4088898, 'Lancer', 'Fiat');
insert into VEHICLE (license_num, model, type)
values (4954909, 'Charger', 'Eagle');
insert into VEHICLE (license_num, model, type)
values (6894593, 'Legacy', 'Fab Design');
insert into VEHICLE (license_num, model, type)
values (1915830, 'Bora', 'Lexus');
insert into VEHICLE (license_num, model, type)
values (5644052, 'Sportage', 'Saipa');
insert into VEHICLE (license_num, model, type)
values (2819106, 'Cadenza', 'Farboud');
insert into VEHICLE (license_num, model, type)
values (1712880, 'Logan', 'DS Automobiles');
insert into VEHICLE (license_num, model, type)
values (2995613, 'Edge', 'BMW');
insert into VEHICLE (license_num, model, type)
values (252525, 'Endeavour', 'Lancia');
insert into VEHICLE (license_num, model, type)
values (2954049, 'Seltos', 'Honda');
insert into VEHICLE (license_num, model, type)
values (1006807, 'E-Pace', 'Caterham');
insert into VEHICLE (license_num, model, type)
values (9555869, 'Figo', 'Inferno');
insert into VEHICLE (license_num, model, type)
values (3362566, 'Verna', 'Audi');
insert into VEHICLE (license_num, model, type)
values (5196610, 'Aviator', 'Spyker');
insert into VEHICLE (license_num, model, type)
values (5371333, 'Rajdoot', 'Skoda');
insert into VEHICLE (license_num, model, type)
values (5268197, 'Atlas', 'Citroen');
insert into VEHICLE (license_num, model, type)
values (4206040, 'Navara', 'Maserati');
insert into VEHICLE (license_num, model, type)
values (6858460, 'Carina', 'De Tomaso');
insert into VEHICLE (license_num, model, type)
values (6640162, 'Cascada', 'Rimac');
insert into VEHICLE (license_num, model, type)
values (5881430, 'Rogue', 'Westfield');
insert into VEHICLE (license_num, model, type)
values (2645152, 'Aygo', 'Volkswagen');
insert into VEHICLE (license_num, model, type)
values (6153270, 'Rogue', 'Proton');
insert into VEHICLE (license_num, model, type)
values (2494350, 'Crossland', 'Chrysler');
insert into VEHICLE (license_num, model, type)
values (2252607, 'Levante', 'Holden');
insert into VEHICLE (license_num, model, type)
values (204661, 'Endeavour', 'Westfield');
insert into VEHICLE (license_num, model, type)
values (6371476, 'Sapphire', 'DFSK');
insert into VEHICLE (license_num, model, type)
values (6333363, 'Torres', 'Ferris');
insert into VEHICLE (license_num, model, type)
values (8868055, 'Quattroporte', 'Lamborghini');
insert into VEHICLE (license_num, model, type)
values (5162280, 'Rainier', 'Plymouth');
insert into VEHICLE (license_num, model, type)
values (2655453, 'Sonic', 'Homark');
insert into VEHICLE (license_num, model, type)
values (8212464, 'Telluride', 'Perodua');
insert into VEHICLE (license_num, model, type)
values (7462969, 'i30', 'Fiat');
insert into VEHICLE (license_num, model, type)
values (3884043, 'Legacy', 'TVR');
insert into VEHICLE (license_num, model, type)
values (135871, 'Escalade', 'Hyundai');
insert into VEHICLE (license_num, model, type)
values (7338084, 'i8', 'Aspark');
insert into VEHICLE (license_num, model, type)
values (116953, 'Ranger', 'Farbio');
insert into VEHICLE (license_num, model, type)
values (9204246, 'Raider', 'Pininfarina');
insert into VEHICLE (license_num, model, type)
values (8398550, 'Avancier', 'Bollinger');
insert into VEHICLE (license_num, model, type)
values (2362871, 'Cayman', 'Microcar');
insert into VEHICLE (license_num, model, type)
values (5233360, 'E-Class', 'Brabus');
insert into VEHICLE (license_num, model, type)
values (4788455, 'Tharson', 'Yes');
insert into VEHICLE (license_num, model, type)
values (8631686, 'Caprice', 'Caterham');
insert into VEHICLE (license_num, model, type)
values (2332287, 'Scorpio', 'Borgward');
insert into VEHICLE (license_num, model, type)
values (5132586, 'Avalon', 'Mitsuoka');
insert into VEHICLE (license_num, model, type)
values (197504, 'Ruby', 'Praga');
insert into VEHICLE (license_num, model, type)
values (218182, 'Outlander', 'Toyota');
insert into VEHICLE (license_num, model, type)
values (8574769, 'Safari', 'Gemballa');
insert into VEHICLE (license_num, model, type)
values (2618123, 'Timor', 'Zagato');
insert into VEHICLE (license_num, model, type)
values (2151917, 'QX70', 'Trion');
insert into VEHICLE (license_num, model, type)
values (8575589, 'Ranger', 'IKCO');
insert into VEHICLE (license_num, model, type)
values (406334, 'Premio', 'Marussia');
insert into VEHICLE (license_num, model, type)
values (7434482, 'Land Cruiser', 'Vector Motors');
insert into VEHICLE (license_num, model, type)
values (3437143, 'Tucson', 'Volvo');
insert into VEHICLE (license_num, model, type)
values (4614465, 'Cefiro', 'BAIC');
insert into VEHICLE (license_num, model, type)
values (6940155, 'Defender', 'KTM');
insert into VEHICLE (license_num, model, type)
values (6074945, 'Monte Carlo', 'GAC');
insert into VEHICLE (license_num, model, type)
values (2546532, 'Nubira', 'Oldsmobile');
insert into VEHICLE (license_num, model, type)
values (415094, 'Transit', 'Voyah');
insert into VEHICLE (license_num, model, type)
values (7516609, 'Telluride', 'Honda');
insert into VEHICLE (license_num, model, type)
values (5874843, 'NV200', 'Gemballa');
insert into VEHICLE (license_num, model, type)
values (5346614, 'Timor', 'Dacia');
insert into VEHICLE (license_num, model, type)
values (3368686, 'Kontur', 'Fisker');
insert into VEHICLE (license_num, model, type)
values (1888784, 'Evoque', 'Levdeo');
insert into VEHICLE (license_num, model, type)
values (4218696, 'Grand Vitara', 'XPeng');
insert into VEHICLE (license_num, model, type)
values (8587560, 'Santana', 'Victor');
insert into VEHICLE (license_num, model, type)
values (7111966, 'Zohr', 'Roewe');
insert into VEHICLE (license_num, model, type)
values (8281810, 'Navigator', 'Kleemann');
insert into VEHICLE (license_num, model, type)
values (4871686, 'Escalade', 'UAZ');
insert into VEHICLE (license_num, model, type)
values (5483407, 'Telcoline', 'Westfield');
insert into VEHICLE (license_num, model, type)
values (5188709, 'Durango', 'Voyah');
insert into VEHICLE (license_num, model, type)
values (9778096, 'Tharson', 'Martin');
insert into VEHICLE (license_num, model, type)
values (6329709, 'Cullinan', 'Volkswagen');
insert into VEHICLE (license_num, model, type)
values (1575152, 'Testarossa', 'VINFAST');
insert into VEHICLE (license_num, model, type)
values (9027330, 'Romeo', 'Eagle');
insert into VEHICLE (license_num, model, type)
values (4565017, 'Bolero', 'GMC');
insert into VEHICLE (license_num, model, type)
values (5308933, 'Verna', 'Rimac');
insert into VEHICLE (license_num, model, type)
values (4003936, 'Elantra', 'Rezvani');
insert into VEHICLE (license_num, model, type)
values (8650551, 'Colorado', 'Tesla');
insert into VEHICLE (license_num, model, type)
values (1805858, 'Impreza', 'Hennessey');
commit;
prompt 100 records committed...
insert into VEHICLE (license_num, model, type)
values (7491469, 'Ateca', 'Honda');
insert into VEHICLE (license_num, model, type)
values (7696769, 'Lodgy', 'IKCO');
insert into VEHICLE (license_num, model, type)
values (1200643, 'Ignis', 'Mini');
insert into VEHICLE (license_num, model, type)
values (2392403, 'Volvo V40', 'Pininfarina');
insert into VEHICLE (license_num, model, type)
values (7683993, 'Disco Volante', 'Vauxhall');
insert into VEHICLE (license_num, model, type)
values (5150716, 'Town & Country', 'Hispano-Suiza');
insert into VEHICLE (license_num, model, type)
values (2579625, 'Maxima', 'Mitsubishi');
insert into VEHICLE (license_num, model, type)
values (1143545, 'Innova', 'Victor');
insert into VEHICLE (license_num, model, type)
values (3281978, 'Zetao', 'Jaguar');
insert into VEHICLE (license_num, model, type)
values (7077980, 'Fit', 'Pininfarina');
insert into VEHICLE (license_num, model, type)
values (1903009, 'Durango', 'Farboud');
insert into VEHICLE (license_num, model, type)
values (4448179, 'Ghibli', 'Fab Design');
insert into VEHICLE (license_num, model, type)
values (1957212, 'Rush', 'Great Wall');
insert into VEHICLE (license_num, model, type)
values (1534113, 'Spyder', 'Italdesign');
insert into VEHICLE (license_num, model, type)
values (4999949, 'Sienna', 'Mercedes-Benz');
insert into VEHICLE (license_num, model, type)
values (2229266, 'Twingo', 'Rolls-Royce');
insert into VEHICLE (license_num, model, type)
values (9597274, 'C-HR', 'Zotye');
insert into VEHICLE (license_num, model, type)
values (8694325, 'Amaze', 'Volvo');
insert into VEHICLE (license_num, model, type)
values (765730, 'Indigo', 'Roewe');
insert into VEHICLE (license_num, model, type)
values (3679440, 'Genesis', 'Spyker');
insert into VEHICLE (license_num, model, type)
values (1997649, 'Vision', 'Vector Motors');
insert into VEHICLE (license_num, model, type)
values (9262116, 'Thar', 'NIO');
insert into VEHICLE (license_num, model, type)
values (2797464, 'Outback', 'Mini');
insert into VEHICLE (license_num, model, type)
values (8913831, 'Liana', 'Hyundai');
insert into VEHICLE (license_num, model, type)
values (5311259, 'Koenigsegg', 'EdisonFuture');
insert into VEHICLE (license_num, model, type)
values (9248844, 'Town & Country', 'Faraday Future');
insert into VEHICLE (license_num, model, type)
values (6249419, 'Jimny', 'Vector Motors');
insert into VEHICLE (license_num, model, type)
values (18564, 'Jimny', 'FAW');
insert into VEHICLE (license_num, model, type)
values (1713552, 'C-HR', 'Subaru');
insert into VEHICLE (license_num, model, type)
values (2730787, 'Macan', 'Mitsubishi');
insert into VEHICLE (license_num, model, type)
values (6674751, 'Cefiro', 'Jimenez');
insert into VEHICLE (license_num, model, type)
values (4543635, 'Pathfinder', 'Vencer');
insert into VEHICLE (license_num, model, type)
values (6781773, 'Grand Vitara', 'Vector Motors');
insert into VEHICLE (license_num, model, type)
values (9276052, 'Sapphire', 'Ford');
insert into VEHICLE (license_num, model, type)
values (6221120, 'Space', 'Lexus');
insert into VEHICLE (license_num, model, type)
values (100977, 'Cullinan', 'Brilliance');
insert into VEHICLE (license_num, model, type)
values (7708792, 'Altima', 'Daihatsu');
insert into VEHICLE (license_num, model, type)
values (8373865, 'H1', 'Maxus');
insert into VEHICLE (license_num, model, type)
values (5761529, 'Matrix', 'Westfield');
insert into VEHICLE (license_num, model, type)
values (1126683, 'Delica', 'Haval');
insert into VEHICLE (license_num, model, type)
values (4085184, 'Bora', 'Hispano-Suiza');
insert into VEHICLE (license_num, model, type)
values (6111247, 'Picanto', 'Hyundai');
insert into VEHICLE (license_num, model, type)
values (1847320, 'Safari', 'Shelby');
insert into VEHICLE (license_num, model, type)
values (2835877, 'Telcoline', 'Pure');
insert into VEHICLE (license_num, model, type)
values (9574341, 'Civic', 'Jeep');
insert into VEHICLE (license_num, model, type)
values (3396764, 'Evoque', 'Lexus');
insert into VEHICLE (license_num, model, type)
values (1730552, 'Cayenne', 'NIO');
insert into VEHICLE (license_num, model, type)
values (5007144, 'Flex', 'Hispano-Suiza');
insert into VEHICLE (license_num, model, type)
values (989137, 'QQ', 'MW Motors');
insert into VEHICLE (license_num, model, type)
values (3052344, 'Picanto', 'Noble');
insert into VEHICLE (license_num, model, type)
values (5231289, 'Amaze', 'Ruf');
insert into VEHICLE (license_num, model, type)
values (7395195, 'Strada', 'KTM');
insert into VEHICLE (license_num, model, type)
values (9681666, 'Kodiaq', 'Mercedes-Benz');
insert into VEHICLE (license_num, model, type)
values (7831879, 'Tharson', 'GTA Hispano');
insert into VEHICLE (license_num, model, type)
values (9732096, 'Carnival', 'Proton');
insert into VEHICLE (license_num, model, type)
values (7178751, 'Maranello', 'Mahindra');
insert into VEHICLE (license_num, model, type)
values (89585, 'Indigo', 'Lightyear');
insert into VEHICLE (license_num, model, type)
values (9804519, 'Disco Volante', 'Changan');
insert into VEHICLE (license_num, model, type)
values (2121369, 'Model Y', 'Daewoo');
insert into VEHICLE (license_num, model, type)
values (2462661, 'Vanquish', 'Land Rover');
insert into VEHICLE (license_num, model, type)
values (5303297, 'Camaro', 'Maybach');
insert into VEHICLE (license_num, model, type)
values (2641663, 'Cefiro', 'Chevrolet');
insert into VEHICLE (license_num, model, type)
values (9039434, 'Logan', 'NIO');
insert into VEHICLE (license_num, model, type)
values (1033990, 'Galant', 'Karma');
insert into VEHICLE (license_num, model, type)
values (4931859, 'Vision', 'Rolls-Royce');
insert into VEHICLE (license_num, model, type)
values (3369190, 'XL6', 'Leblanc');
insert into VEHICLE (license_num, model, type)
values (9566053, 'Camaro', 'Peugeot');
insert into VEHICLE (license_num, model, type)
values (7151509, 'Rally', 'Lancia');
insert into VEHICLE (license_num, model, type)
values (1308246, 'Teramont', 'Ascari');
insert into VEHICLE (license_num, model, type)
values (1626339, 'Tiago', 'Buick');
insert into VEHICLE (license_num, model, type)
values (6154995, 'ProAce', 'Studebaker');
insert into VEHICLE (license_num, model, type)
values (6267406, 'Onix', 'Spyker Cars');
insert into VEHICLE (license_num, model, type)
values (3939143, 'TaTa', 'Lamborghini');
insert into VEHICLE (license_num, model, type)
values (1768309, 'Bullet', 'Hispano-Suiza');
insert into VEHICLE (license_num, model, type)
values (1252307, 'Kuga', 'Audi');
insert into VEHICLE (license_num, model, type)
values (568058, 'C-Class', 'Volga');
insert into VEHICLE (license_num, model, type)
values (6282853, 'Nutme', 'RAM');
insert into VEHICLE (license_num, model, type)
values (7353779, 'Amaze', 'Iveco');
insert into VEHICLE (license_num, model, type)
values (3950898, 'Velar', 'Skoda');
insert into VEHICLE (license_num, model, type)
values (3871155, 'Tharson', 'Lincoln');
insert into VEHICLE (license_num, model, type)
values (8355091, 'Delta', 'Roewe');
insert into VEHICLE (license_num, model, type)
values (548411, 'Cruze', 'Skoda');
insert into VEHICLE (license_num, model, type)
values (781546, 'Rebel', 'Lucid');
insert into VEHICLE (license_num, model, type)
values (9882079, 'Chevelle', 'Koenigsegg');
insert into VEHICLE (license_num, model, type)
values (9451417, 'Revero', 'Mazda');
insert into VEHICLE (license_num, model, type)
values (4466407, 'Mustang', 'Plymouth');
insert into VEHICLE (license_num, model, type)
values (801159, 'Lucerne', 'KTec');
insert into VEHICLE (license_num, model, type)
values (223090, 'Picanto', 'Aspark');
insert into VEHICLE (license_num, model, type)
values (6162191, 'B-Class', 'Geely');
insert into VEHICLE (license_num, model, type)
values (7975109, 'Savana', 'Vauxhall Motors');
insert into VEHICLE (license_num, model, type)
values (6863704, 'Indigo', 'Shuanghuan');
insert into VEHICLE (license_num, model, type)
values (4963651, 'Model X', 'Vauxhall Motors');
insert into VEHICLE (license_num, model, type)
values (914210, 'Model X', 'Vauxhall');
insert into VEHICLE (license_num, model, type)
values (9367111, 'Chevelle', 'Buick');
insert into VEHICLE (license_num, model, type)
values (17769, 'Koenigsegg', 'KTM');
insert into VEHICLE (license_num, model, type)
values (3584819, 'Thunderbird', 'IKCO');
insert into VEHICLE (license_num, model, type)
values (9478204, 'Ignis', 'Volvo');
insert into VEHICLE (license_num, model, type)
values (2320681, 'C-HR', 'Leblanc');
insert into VEHICLE (license_num, model, type)
values (9277874, 'Corolla', 'Honda');
insert into VEHICLE (license_num, model, type)
values (845731, 'Zonda', 'Koenigsegg');
commit;
prompt 200 records committed...
insert into VEHICLE (license_num, model, type)
values (1008835, 'Kicks', 'Fiat');
insert into VEHICLE (license_num, model, type)
values (5167531, 'Legacy', 'Seat');
insert into VEHICLE (license_num, model, type)
values (5544329, 'Cefiro', 'Ken Okuyama');
insert into VEHICLE (license_num, model, type)
values (2089203, 'Aygo', 'Venucia');
insert into VEHICLE (license_num, model, type)
values (2239582, 'Ka', 'Maxus');
insert into VEHICLE (license_num, model, type)
values (1453977, 'Glanza', 'Vanda Electrics');
insert into VEHICLE (license_num, model, type)
values (3515883, 'Fleetwood', 'Seat');
insert into VEHICLE (license_num, model, type)
values (9168398, 'Verna', 'RAM');
insert into VEHICLE (license_num, model, type)
values (948978, 'Centodieci', 'Brilliance');
insert into VEHICLE (license_num, model, type)
values (5017272, 'Storm', 'GMC');
insert into VEHICLE (license_num, model, type)
values (6588610, 'Miata', 'Zagato');
insert into VEHICLE (license_num, model, type)
values (6164738, 'Durango', 'Hispano-Suiza');
insert into VEHICLE (license_num, model, type)
values (2222070, 'Storm', 'Mazda');
insert into VEHICLE (license_num, model, type)
values (9136483, 'Puma', 'Citroen');
insert into VEHICLE (license_num, model, type)
values (1725118, 'Cascada', 'Polestar');
insert into VEHICLE (license_num, model, type)
values (760298, 'Thunderbird', 'Dacia');
insert into VEHICLE (license_num, model, type)
values (2010544, 'Forte', 'Polestar');
insert into VEHICLE (license_num, model, type)
values (9106467, 'D-Max', 'Bugatti');
insert into VEHICLE (license_num, model, type)
values (9710338, 'Yukon', 'Bizzarrini');
insert into VEHICLE (license_num, model, type)
values (4504165, 'i10', 'Josse');
insert into VEHICLE (license_num, model, type)
values (6491976, 'Gladiator', 'Borgward');
insert into VEHICLE (license_num, model, type)
values (7220653, 'Rosso', 'Mazzanti');
insert into VEHICLE (license_num, model, type)
values (9365587, 'California', 'Roewe');
insert into VEHICLE (license_num, model, type)
values (3863706, 'Model 3', 'Polestar');
insert into VEHICLE (license_num, model, type)
values (8254949, 'E-Class', 'Bentley');
insert into VEHICLE (license_num, model, type)
values (1536470, 'Ecosport', 'DFSK');
insert into VEHICLE (license_num, model, type)
values (2398431, 'Inspire', 'Rolls-Royce');
insert into VEHICLE (license_num, model, type)
values (7973139, 'Zafira', 'Ruf');
insert into VEHICLE (license_num, model, type)
values (6096947, 'Sportage', 'Cadillac');
insert into VEHICLE (license_num, model, type)
values (9929993, 'Tiguan', 'Polestar');
insert into VEHICLE (license_num, model, type)
values (8778511, 'Reno', 'Pi?ch');
insert into VEHICLE (license_num, model, type)
values (6528854, 'Durango', 'Land Rover');
insert into VEHICLE (license_num, model, type)
values (820497, 'TaTa', 'Cadillac');
insert into VEHICLE (license_num, model, type)
values (122858, 'Zohr', 'Fiat');
insert into VEHICLE (license_num, model, type)
values (3518868, 'Sunny', 'Chrysler');
insert into VEHICLE (license_num, model, type)
values (7388583, 'FJ Cruiser', 'Citroen');
insert into VEHICLE (license_num, model, type)
values (2097159, 'Samara', 'DS Automobiles');
insert into VEHICLE (license_num, model, type)
values (6506708, 'Crossland', 'AMC');
insert into VEHICLE (license_num, model, type)
values (2656307, 'Challenger', 'Perodua');
insert into VEHICLE (license_num, model, type)
values (5748523, 'Disco Volante', 'Hispano-Suiza');
insert into VEHICLE (license_num, model, type)
values (6402619, 'Durango', 'Audi');
insert into VEHICLE (license_num, model, type)
values (1129276, 'Mirage', 'Lincoln');
insert into VEHICLE (license_num, model, type)
values (70044, 'Kuga', 'Jimenez');
insert into VEHICLE (license_num, model, type)
values (2189909, 'Levante', 'Oldsmobile');
insert into VEHICLE (license_num, model, type)
values (3140620, 'Pathfinder', 'UAZ');
insert into VEHICLE (license_num, model, type)
values (3748349, 'Compass', 'Ascari');
insert into VEHICLE (license_num, model, type)
values (400137, 'Twingo', 'DFSK');
insert into VEHICLE (license_num, model, type)
values (1053593, 'Impreza', 'Daihatsu');
insert into VEHICLE (license_num, model, type)
values (3174874, 'Range Rover', 'Shanghai Maple');
insert into VEHICLE (license_num, model, type)
values (5245138, 'B-Class', 'De Tomaso');
insert into VEHICLE (license_num, model, type)
values (3019313, 'Fusion', 'Bugatti');
insert into VEHICLE (license_num, model, type)
values (6178197, 'Phaeton', 'PGO');
insert into VEHICLE (license_num, model, type)
values (9445722, 'Velar', 'Ford Performance');
insert into VEHICLE (license_num, model, type)
values (9997443, 'Encore', 'Brilliance');
insert into VEHICLE (license_num, model, type)
values (7879457, 'Beetle', 'Rezvani');
insert into VEHICLE (license_num, model, type)
values (203913, 'Sienna', 'Donkervoort');
insert into VEHICLE (license_num, model, type)
values (2263322, 'Scudo', 'Gumper');
insert into VEHICLE (license_num, model, type)
values (2540131, 'F-Type', 'Dacia');
insert into VEHICLE (license_num, model, type)
values (3968386, 'Granta', 'Rivian');
insert into VEHICLE (license_num, model, type)
values (9728706, 'Torres', 'Citroen');
insert into VEHICLE (license_num, model, type)
values (9789043, 'Levante', 'Chrysler');
insert into VEHICLE (license_num, model, type)
values (85780, 'Bolero', 'DFSK');
insert into VEHICLE (license_num, model, type)
values (7216173, 'Telluride', 'Vauxhall Motors');
insert into VEHICLE (license_num, model, type)
values (9518051, 'Tacoma', 'McLaren');
insert into VEHICLE (license_num, model, type)
values (6970240, 'Wrangler', 'Bugatti');
insert into VEHICLE (license_num, model, type)
values (4836045, 'Escalade', 'Plymouth');
insert into VEHICLE (license_num, model, type)
values (228432, 'Replay', 'Mini');
insert into VEHICLE (license_num, model, type)
values (6224996, 'March', 'Prodrive');
insert into VEHICLE (license_num, model, type)
values (5560877, 'Innova', 'Laffite');
insert into VEHICLE (license_num, model, type)
values (3464330, 'Pathfinder', 'Vencer');
insert into VEHICLE (license_num, model, type)
values (2716400, 'Savana', 'Voyah');
insert into VEHICLE (license_num, model, type)
values (958320, 'Amaze', 'Local Motors');
insert into VEHICLE (license_num, model, type)
values (5273188, 'Corsa', 'Noble');
insert into VEHICLE (license_num, model, type)
values (7005595, 'Crossland', 'Pagani');
insert into VEHICLE (license_num, model, type)
values (421486, 'Vision', 'Brilliance');
insert into VEHICLE (license_num, model, type)
values (2092727, 'Touran', 'IKCO');
insert into VEHICLE (license_num, model, type)
values (9007554, 'Explorer', 'Peugeot');
insert into VEHICLE (license_num, model, type)
values (6684349, 'Vivio', 'Victor');
insert into VEHICLE (license_num, model, type)
values (7514218, 'Galant', 'Superformance');
insert into VEHICLE (license_num, model, type)
values (5570660, 'Courier', 'Tata');
insert into VEHICLE (license_num, model, type)
values (1602833, 'Venue', 'Proton');
insert into VEHICLE (license_num, model, type)
values (7680457, 'Panamera', 'Pi?ch');
insert into VEHICLE (license_num, model, type)
values (2673535, 'RS8', 'Hispano-Suiza');
insert into VEHICLE (license_num, model, type)
values (8659729, 'i8', 'KTM');
insert into VEHICLE (license_num, model, type)
values (7923744, 'Neo', 'Radical');
insert into VEHICLE (license_num, model, type)
values (5393808, 'Terracan', 'Hyundai');
insert into VEHICLE (license_num, model, type)
values (9155046, 'Crosspolo', 'Nissan');
insert into VEHICLE (license_num, model, type)
values (7556867, 'Caprice', 'Shanghai Maple');
insert into VEHICLE (license_num, model, type)
values (1678269, 'Replay', 'Kleemann');
insert into VEHICLE (license_num, model, type)
values (7344918, 'Avensis', 'TechArt');
insert into VEHICLE (license_num, model, type)
values (8160283, 'Santana', 'Toyota');
insert into VEHICLE (license_num, model, type)
values (8968330, 'Regal', 'Ariel');
insert into VEHICLE (license_num, model, type)
values (6713792, 'Escort', 'Daewoo');
insert into VEHICLE (license_num, model, type)
values (1156648, 'Portofino', 'Ford Performance');
insert into VEHICLE (license_num, model, type)
values (8656979, 'BrZ', 'Bristol');
insert into VEHICLE (license_num, model, type)
values (5112669, 'Qashqai', 'Lamborghini');
insert into VEHICLE (license_num, model, type)
values (2390000, 'Rexton', 'Chrysler');
insert into VEHICLE (license_num, model, type)
values (9167596, 'Esprit', 'Noble');
insert into VEHICLE (license_num, model, type)
values (2622417, 'Trailblazer', 'Westfield');
insert into VEHICLE (license_num, model, type)
values (9579981, 'Tiago', 'Studebaker');
commit;
prompt 300 records committed...
insert into VEHICLE (license_num, model, type)
values (8218771, 'Replay', 'Homark');
insert into VEHICLE (license_num, model, type)
values (6255461, 'Grand Vitara', 'Infiniti');
insert into VEHICLE (license_num, model, type)
values (7193252, 'Optima', 'Infiniti');
insert into VEHICLE (license_num, model, type)
values (1063472, 'Pilot', 'Ferris');
insert into VEHICLE (license_num, model, type)
values (5593265, 'Turismo', 'Nissan');
insert into VEHICLE (license_num, model, type)
values (8126623, 'Rosso', 'Saipa');
insert into VEHICLE (license_num, model, type)
values (1703700, 'Cayman', 'RAM');
insert into VEHICLE (license_num, model, type)
values (6702873, 'Jimny', 'Gumper');
insert into VEHICLE (license_num, model, type)
values (7152297, 'Accord Crosstour', 'JAC');
insert into VEHICLE (license_num, model, type)
values (5817082, 'Novus', 'OSCA');
insert into VEHICLE (license_num, model, type)
values (5985783, 'Legacy', 'Isuzu');
insert into VEHICLE (license_num, model, type)
values (9145834, 'Compass', 'Seat');
insert into VEHICLE (license_num, model, type)
values (34587, 'RS8', 'Alpina');
insert into VEHICLE (license_num, model, type)
values (5891204, 'Turismo', 'Brilliance');
insert into VEHICLE (license_num, model, type)
values (7728328, 'Orion', 'Bizzarrini');
insert into VEHICLE (license_num, model, type)
values (3571268, 'Malibu', 'GMC');
insert into VEHICLE (license_num, model, type)
values (7984675, 'Telcoline', 'Ferrari');
insert into VEHICLE (license_num, model, type)
values (6082583, 'Bullet', 'Zagato');
insert into VEHICLE (license_num, model, type)
values (9445036, 'Pilot', 'Holden');
insert into VEHICLE (license_num, model, type)
values (9977894, 'Quattroporte', 'Scion');
insert into VEHICLE (license_num, model, type)
values (1181309, 'Outback', 'AMC');
insert into VEHICLE (license_num, model, type)
values (7715405, 'B-Series', 'Superformance');
insert into VEHICLE (license_num, model, type)
values (1705521, 'Brio', 'GMC');
insert into VEHICLE (license_num, model, type)
values (7830525, 'Malibu', 'Dacia');
insert into VEHICLE (license_num, model, type)
values (7407158, 'Charger', 'Aspark');
insert into VEHICLE (license_num, model, type)
values (9112542, 'Camaro', 'Lincoln');
insert into VEHICLE (license_num, model, type)
values (1852051, 'Terracan', 'FAW');
insert into VEHICLE (license_num, model, type)
values (7882275, 'Vitara', 'Noble');
insert into VEHICLE (license_num, model, type)
values (1564809, 'GranTurismo', 'Genesis');
insert into VEHICLE (license_num, model, type)
values (8599728, 'Picanto', 'Bristol');
insert into VEHICLE (license_num, model, type)
values (5666700, 'Magnum', 'Pagani');
insert into VEHICLE (license_num, model, type)
values (7952222, 'March', 'Farbio');
insert into VEHICLE (license_num, model, type)
values (8004359, 'Picanto', 'Radical');
insert into VEHICLE (license_num, model, type)
values (1661610, 'Explorer', 'Nissan');
insert into VEHICLE (license_num, model, type)
values (4938651, 'Matrix', 'Spectre');
insert into VEHICLE (license_num, model, type)
values (8916145, 'Civic', 'Polestar');
insert into VEHICLE (license_num, model, type)
values (8389979, 'Dart', 'Opel');
insert into VEHICLE (license_num, model, type)
values (4498357, 'Kolasin', 'Lexus');
insert into VEHICLE (license_num, model, type)
values (8439543, 'Maxima', 'Mini');
insert into VEHICLE (license_num, model, type)
values (9737638, 'Orion', 'Bentley');
insert into VEHICLE (license_num, model, type)
values (1332611, 'Santa Fe', 'Martin');
insert into VEHICLE (license_num, model, type)
values (1081215, 'Cullinan', 'Rezvani');
insert into VEHICLE (license_num, model, type)
values (8360925, 'Compass', 'Radical Sportscars');
insert into VEHICLE (license_num, model, type)
values (6788092, 'Grand Vitara', 'Scuderia Cameron');
insert into VEHICLE (license_num, model, type)
values (3265026, 'Figo', 'Ferrari');
insert into VEHICLE (license_num, model, type)
values (9499895, 'Durango', 'Ariel');
insert into VEHICLE (license_num, model, type)
values (346877, 'Kicks', 'Ruf');
insert into VEHICLE (license_num, model, type)
values (9862635, 'Land Cruiser', 'Saturn');
insert into VEHICLE (license_num, model, type)
values (803994, 'Santana', 'Seat');
insert into VEHICLE (license_num, model, type)
values (9209256, 'Voyager', 'SSC North America');
insert into VEHICLE (license_num, model, type)
values (833752, 'Kolasin', 'IKCO');
insert into VEHICLE (license_num, model, type)
values (7710773, 'Kuga', 'Proton');
insert into VEHICLE (license_num, model, type)
values (4494514, 'Accord Crosstour', 'Huansu');
insert into VEHICLE (license_num, model, type)
values (9244233, 'Turismo', 'Ginetta');
insert into VEHICLE (license_num, model, type)
values (5240524, 'QX60', 'Lincoln');
insert into VEHICLE (license_num, model, type)
values (6780405, 'Ranger', 'Bugatti');
insert into VEHICLE (license_num, model, type)
values (9392390, 'TaTa', 'Vector Motors');
insert into VEHICLE (license_num, model, type)
values (3445558, 'Pilot', 'Audi');
insert into VEHICLE (license_num, model, type)
values (7342564, 'Challenger', 'KTec');
insert into VEHICLE (license_num, model, type)
values (2718272, 'Puma', 'Thunder Power');
insert into VEHICLE (license_num, model, type)
values (2207771, 'C-HR', 'Ascari');
insert into VEHICLE (license_num, model, type)
values (3113119, 'Rosso', 'Volkswagen');
insert into VEHICLE (license_num, model, type)
values (7706558, 'QX50', 'Jaguar');
insert into VEHICLE (license_num, model, type)
values (6434088, 'Premio', 'Alpina');
insert into VEHICLE (license_num, model, type)
values (3903350, 'Encore', 'Honda');
insert into VEHICLE (license_num, model, type)
values (7042045, 'Orion', 'Toyota');
insert into VEHICLE (license_num, model, type)
values (94216, 'Pulsar', 'Honda');
insert into VEHICLE (license_num, model, type)
values (4285963, 'Datsun', 'Buick');
insert into VEHICLE (license_num, model, type)
values (8730888, 'Fiesta', 'Peugeot');
insert into VEHICLE (license_num, model, type)
values (7480798, 'Espace', 'Maserati');
insert into VEHICLE (license_num, model, type)
values (7692374, 'Evoque', 'TVR');
insert into VEHICLE (license_num, model, type)
values (6354532, 'i30', 'Hispano-Suiza');
insert into VEHICLE (license_num, model, type)
values (4158507, 'Palisa', 'Venucia');
insert into VEHICLE (license_num, model, type)
values (7885686, 'Aviator', 'Bugatti');
insert into VEHICLE (license_num, model, type)
values (1526809, 'Suburban', 'Aspark');
insert into VEHICLE (license_num, model, type)
values (917703, 'Ka', 'Alpina');
insert into VEHICLE (license_num, model, type)
values (8915351, 'Zonda', 'Saturn');
insert into VEHICLE (license_num, model, type)
values (7098505, 'Carrera', 'KTM');
insert into VEHICLE (license_num, model, type)
values (9878547, 'Carens', 'Marussia');
insert into VEHICLE (license_num, model, type)
values (3689717, 'Touran', 'Maybach');
insert into VEHICLE (license_num, model, type)
values (259810, 'Bullet', 'Donkervoort');
insert into VEHICLE (license_num, model, type)
values (2528944, 'Suburban', 'Fab Design');
insert into VEHICLE (license_num, model, type)
values (7246071, 'Highlander', 'Jimenez');
insert into VEHICLE (license_num, model, type)
values (6106673, 'Rexton', 'Koenigsegg');
insert into VEHICLE (license_num, model, type)
values (4766570, 'Tracker', 'Yes');
insert into VEHICLE (license_num, model, type)
values (8204852, 'Caliber', 'Radical');
insert into VEHICLE (license_num, model, type)
values (2989832, 'Tahoe', 'Spectre');
insert into VEHICLE (license_num, model, type)
values (5115512, 'Tomahawk', 'RAM');
insert into VEHICLE (license_num, model, type)
values (5035527, 'Navara', 'Volkswagen');
insert into VEHICLE (license_num, model, type)
values (9817323, 'Bullet', 'Bentley');
insert into VEHICLE (license_num, model, type)
values (4452431, 'Dart', 'Westfield');
insert into VEHICLE (license_num, model, type)
values (9317135, 'Matrix', 'Heuliez');
insert into VEHICLE (license_num, model, type)
values (5405666, 'QX70', 'Great Wall');
insert into VEHICLE (license_num, model, type)
values (6457605, 'Mii', 'Spyker Cars');
insert into VEHICLE (license_num, model, type)
values (8630751, 'Tucson', 'KTec');
insert into VEHICLE (license_num, model, type)
values (754427, 'Maruti', 'Roewe');
insert into VEHICLE (license_num, model, type)
values (6675376, 'Grandis', 'Mahindra');
insert into VEHICLE (license_num, model, type)
values (7436002, 'Passat', 'Mitsuoka');
insert into VEHICLE (license_num, model, type)
values (8473645, 'ProAce', 'Icona');
insert into VEHICLE (license_num, model, type)
values (8280458, 'Yaris', 'King Long');
commit;
prompt 400 records committed...
insert into VEHICLE (license_num, model, type)
values (1580910, 'Palio', 'NIO');
insert into VEHICLE (license_num, model, type)
values (3778321, 'Espace', 'Subaru');
insert into VEHICLE (license_num, model, type)
values (148396, 'Grand Vitara', 'Mazda');
insert into VEHICLE (license_num, model, type)
values (8412670, 'C-Class', 'Spectre');
insert into VEHICLE (license_num, model, type)
values (3369165, 'Nutme', 'Audi');
insert into VEHICLE (license_num, model, type)
values (1259046, 'Taigun', 'McLaren');
insert into VEHICLE (license_num, model, type)
values (8276339, 'Turismo', 'Aspark');
insert into VEHICLE (license_num, model, type)
values (68968, 'ProAce', 'Victor');
insert into VEHICLE (license_num, model, type)
values (9740302, 'Stelvio', 'Kleemann');
insert into VEHICLE (license_num, model, type)
values (4312065, 'BrZ', 'Volkswagen');
insert into VEHICLE (license_num, model, type)
values (9470733, 'Torres', 'Opel');
insert into VEHICLE (license_num, model, type)
values (3746681, 'Raider', 'Westfield');
insert into VEHICLE (license_num, model, type)
values (8862863, 'Boxer', 'Aspark');
insert into VEHICLE (license_num, model, type)
values (9390267, 'Kuga', 'Farbio');
insert into VEHICLE (license_num, model, type)
values (6331745, 'Ka', 'Hummer');
insert into VEHICLE (license_num, model, type)
values (6970869, 'Regal', 'Daihatsu');
insert into VEHICLE (license_num, model, type)
values (8038158, 'Tracker', 'Hummer');
insert into VEHICLE (license_num, model, type)
values (9186864, 'Wrangler', 'Pi?ch');
insert into VEHICLE (license_num, model, type)
values (954045, 'i10', 'Vauxhall Motors');
insert into VEHICLE (license_num, model, type)
values (5217624, 'Santana', 'Subaru');
insert into VEHICLE (license_num, model, type)
values (6205163, 'Strada', 'Mercedes-Benz');
insert into VEHICLE (license_num, model, type)
values (44600, 'Staria', 'Venucia');
insert into VEHICLE (license_num, model, type)
values (904377, 'Nubira', 'Superformance');
insert into VEHICLE (license_num, model, type)
values (1290249, 'RS8', 'Microcar');
insert into VEHICLE (license_num, model, type)
values (9149633, 'Testarossa', 'AMC');
insert into VEHICLE (license_num, model, type)
values (9038481, 'Continental', 'DFSK');
insert into VEHICLE (license_num, model, type)
values (5525245, 'Renegade', 'WEY');
insert into VEHICLE (license_num, model, type)
values (614088, 'Speeder', 'Laffite');
insert into VEHICLE (license_num, model, type)
values (1073491, 'Trezia', 'Luxgen');
insert into VEHICLE (license_num, model, type)
values (2637384, 'Zetao', 'Huansu');
insert into VEHICLE (license_num, model, type)
values (8685211, 'Cybertruck', 'Scuderia Cameron');
insert into VEHICLE (license_num, model, type)
values (3461197, 'Touran', 'SSC North America');
insert into VEHICLE (license_num, model, type)
values (9701936, 'ProAce', 'Nissan');
insert into VEHICLE (license_num, model, type)
values (4160015, 'Rogue', 'Volkswagen');
insert into VEHICLE (license_num, model, type)
values (882842, 'Altima', 'Lucid');
insert into VEHICLE (license_num, model, type)
values (3981658, 'Rosso', 'Honda');
insert into VEHICLE (license_num, model, type)
values (1841907, 'Escape', 'Bollinger');
insert into VEHICLE (license_num, model, type)
values (8589674, 'Silk', 'Shuanghuan');
insert into VEHICLE (license_num, model, type)
values (2558760, 'Granta', 'Gemballa');
insert into VEHICLE (license_num, model, type)
values (4242384, 'Talisman', 'Westfield');
insert into VEHICLE (license_num, model, type)
values (4064445, 'Rio', 'Marussia');
insert into VEHICLE (license_num, model, type)
values (7826899, 'Orion', 'Chery');
insert into VEHICLE (license_num, model, type)
values (1286143, 'Model X', 'FAW');
insert into VEHICLE (license_num, model, type)
values (9981940, 'Pilot', 'Proton');
insert into VEHICLE (license_num, model, type)
values (3598065, 'Telluride', 'Seat');
insert into VEHICLE (license_num, model, type)
values (7557672, 'Romeo', 'Fab Design');
insert into VEHICLE (license_num, model, type)
values (9106645, 'Rhino', 'Bugatti');
insert into VEHICLE (license_num, model, type)
values (9338906, 'Cefiro', 'Prodrive');
insert into VEHICLE (license_num, model, type)
values (6280402, 'Range Rover', 'Honda');
insert into VEHICLE (license_num, model, type)
values (7540447, 'Rush', 'Vanda Electrics');
insert into VEHICLE (license_num, model, type)
values (2996886, 'GT-R', 'HKS');
insert into VEHICLE (license_num, model, type)
values (8833337, 'Escalade', 'Proton');
insert into VEHICLE (license_num, model, type)
values (9026510, 'Arona', 'Eagle');
insert into VEHICLE (license_num, model, type)
values (5013867, 'Kontur', 'FAW');
insert into VEHICLE (license_num, model, type)
values (477353, 'Cybertruck', 'Mitsuoka');
insert into VEHICLE (license_num, model, type)
values (2128387, 'March', 'Lincoln');
insert into VEHICLE (license_num, model, type)
values (6891284, 'Sonic', 'HKS');
insert into VEHICLE (license_num, model, type)
values (178532, 'Urban Cruiser', 'Pi?ch');
insert into VEHICLE (license_num, model, type)
values (7995720, 'Timor', 'Isuzu');
insert into VEHICLE (license_num, model, type)
values (468949, 'Urban Cruiser', 'Shuanghuan');
insert into VEHICLE (license_num, model, type)
values (3652508, 'Phantom', 'Saturn');
insert into VEHICLE (license_num, model, type)
values (476357, 'E-Type', 'Changan');
insert into VEHICLE (license_num, model, type)
values (9000548, 'Velar', 'Chery');
insert into VEHICLE (license_num, model, type)
values (51694, 'Odyssey', 'Pi?ch');
insert into VEHICLE (license_num, model, type)
values (5067549, 'Cullinan', 'Tesla');
insert into VEHICLE (license_num, model, type)
values (7545826, 'Nexon', 'Kleemann');
insert into VEHICLE (license_num, model, type)
values (3086877, 'Tiago', 'Lexus');
insert into VEHICLE (license_num, model, type)
values (6080905, 'Explorer', 'Saturn');
insert into VEHICLE (license_num, model, type)
values (5888939, 'Fiesta', 'RAM');
insert into VEHICLE (license_num, model, type)
values (7245510, 'Rogue', 'TVR');
insert into VEHICLE (license_num, model, type)
values (3790664, 'Raum', 'Kia');
insert into VEHICLE (license_num, model, type)
values (7281353, 'Timor', 'Saipa');
insert into VEHICLE (license_num, model, type)
values (6605013, 'Malibu', 'Proton');
insert into VEHICLE (license_num, model, type)
values (4426687, 'Navara', 'Jimenez');
insert into VEHICLE (license_num, model, type)
values (8697338, 'Forte', 'Alpina');
insert into VEHICLE (license_num, model, type)
values (728928, 'Golf', 'Aspark');
insert into VEHICLE (license_num, model, type)
values (5332375, 'i8', 'Audi');
insert into VEHICLE (license_num, model, type)
values (4193758, 'Clio', 'Skoda');
insert into VEHICLE (license_num, model, type)
values (1134050, 'Turbo', 'Laffite');
insert into VEHICLE (license_num, model, type)
values (2480998, 'Grandis', 'OSCA');
insert into VEHICLE (license_num, model, type)
values (1050003, 'Pilot', 'Roewe');
insert into VEHICLE (license_num, model, type)
values (8101870, 'Novus', 'Microcar');
insert into VEHICLE (license_num, model, type)
values (3267903, 'Yukon', 'Shanghai Maple');
insert into VEHICLE (license_num, model, type)
values (6701159, 'Maruti', 'KTM');
insert into VEHICLE (license_num, model, type)
values (7956075, 'Thunderbird', 'Jimenez');
insert into VEHICLE (license_num, model, type)
values (7360303, 'Novus', 'Rolls-Royce');
insert into VEHICLE (license_num, model, type)
values (8966429, 'Passat', 'Jeep');
insert into VEHICLE (license_num, model, type)
values (4166002, 'Boxster', 'Shuanghuan');
insert into VEHICLE (license_num, model, type)
values (9734599, 'Stratos', 'HKS');
insert into VEHICLE (license_num, model, type)
values (3450908, 'Replay', 'EdisonFuture');
insert into VEHICLE (license_num, model, type)
values (1351269, 'Tomahawk', 'Morgan');
insert into VEHICLE (license_num, model, type)
values (107225, 'Inspire', 'Leblanc');
insert into VEHICLE (license_num, model, type)
values (6330012, 'Enzo', 'Peugeot');
insert into VEHICLE (license_num, model, type)
values (1920004, 'Challenger', 'Tesla');
insert into VEHICLE (license_num, model, type)
values (216642, 'Urus', 'Heuliez');
insert into VEHICLE (license_num, model, type)
values (4314274, 'Tiago', 'Trion');
insert into VEHICLE (license_num, model, type)
values (8870711, 'Silk', 'Citroen');
insert into VEHICLE (license_num, model, type)
values (8299737, 'Outlander', 'Tesla');
insert into VEHICLE (license_num, model, type)
values (7536614, 'Datsun', 'PGO');
insert into VEHICLE (license_num, model, type)
values (221902, 'Swift', 'Heuliez');
commit;
prompt 500 records loaded
prompt Loading DRIVER...
insert into DRIVER (license, status, license_type, id, license_num)
values (1101309519, 'Suspended', 'C', 461999971, 3515883);
insert into DRIVER (license, status, license_type, id, license_num)
values (189632420, 'Probationary', 'B', 508353292, 5067549);
insert into DRIVER (license, status, license_type, id, license_num)
values (1869363085, 'Inactive', 'A', 899588610, 3362566);
insert into DRIVER (license, status, license_type, id, license_num)
values (1720000860, 'Revoked', 'A', 934269879, 2480998);
insert into DRIVER (license, status, license_type, id, license_num)
values (1989086065, 'Suspended', 'A', 123564850, 6249419);
insert into DRIVER (license, status, license_type, id, license_num)
values (957914005, 'Provisional', 'A', 249443272, 2263322);
insert into DRIVER (license, status, license_type, id, license_num)
values (1665332462, 'Revoked', 'A', 809069260, 5303297);
insert into DRIVER (license, status, license_type, id, license_num)
values (1303596186, 'Active', 'C', 728544897, 8696175);
insert into DRIVER (license, status, license_type, id, license_num)
values (1120100397, 'Pending', 'C', 129591888, 9277874);
insert into DRIVER (license, status, license_type, id, license_num)
values (1020910243, 'Denied', 'C', 668266795, 2494350);
insert into DRIVER (license, status, license_type, id, license_num)
values (1506921813, 'Inactive', 'C', 769472733, 3679440);
insert into DRIVER (license, status, license_type, id, license_num)
values (402632564, 'Restricted', 'C', 607059069, 8004359);
insert into DRIVER (license, status, license_type, id, license_num)
values (976196433, 'Suspended', 'A', 970737605, 8439543);
insert into DRIVER (license, status, license_type, id, license_num)
values (1296122088, 'Denied', 'D', 197190833, 9039434);
insert into DRIVER (license, status, license_type, id, license_num)
values (874482087, 'Provisional', 'D', 665115654, 7879457);
insert into DRIVER (license, status, license_type, id, license_num)
values (1090175244, 'UnderReview', 'A', 790271554, 5525245);
insert into DRIVER (license, status, license_type, id, license_num)
values (216407618, 'Invalid', 'C', 168124419, 9518051);
insert into DRIVER (license, status, license_type, id, license_num)
values (94878344, 'ConditionallyValid', 'A', 56069798, 5240524);
insert into DRIVER (license, status, license_type, id, license_num)
values (122612929, 'RestrictedConditional', 'C', 827096050, 3174874);
insert into DRIVER (license, status, license_type, id, license_num)
values (2066306548, 'Temporary', 'D', 129663591, 5233360);
insert into DRIVER (license, status, license_type, id, license_num)
values (1614991388, 'Restricted', 'D', 34722088, 8204852);
insert into DRIVER (license, status, license_type, id, license_num)
values (467627900, 'Active', 'B', 68839870, 2996886);
insert into DRIVER (license, status, license_type, id, license_num)
values (554625380, 'Pending', 'D', 382652351, 9478204);
insert into DRIVER (license, status, license_type, id, license_num)
values (979032066, 'Temporary', 'B', 796826082, 6154995);
insert into DRIVER (license, status, license_type, id, license_num)
values (1125227483, 'Denied', 'A', 884100519, 2398431);
insert into DRIVER (license, status, license_type, id, license_num)
values (1434415648, 'Revoked', 'A', 518311081, 7923744);
insert into DRIVER (license, status, license_type, id, license_num)
values (1059506660, 'ConditionallyValid', 'C', 162096332, 8101870);
insert into DRIVER (license, status, license_type, id, license_num)
values (1423747645, 'Temporary', 'A', 403413591, 7952222);
insert into DRIVER (license, status, license_type, id, license_num)
values (1526240947, 'Restricted', 'B', 993265561, 5487537);
insert into DRIVER (license, status, license_type, id, license_num)
values (1075859180, 'UnderReview', 'D', 907418891, 1678269);
insert into DRIVER (license, status, license_type, id, license_num)
values (54702433, 'RestrictedConditional', 'C', 717196325, 989137);
insert into DRIVER (license, status, license_type, id, license_num)
values (1064843697, 'Disqualified', 'A', 95198325, 2618123);
insert into DRIVER (license, status, license_type, id, license_num)
values (1156970430, 'Pending', 'B', 674388677, 5007144);
insert into DRIVER (license, status, license_type, id, license_num)
values (201263646, 'RenewalRequired', 'A', 385937842, 6096947);
insert into DRIVER (license, status, license_type, id, license_num)
values (798983550, 'ConditionallyValid', 'C', 826717808, 4466407);
insert into DRIVER (license, status, license_type, id, license_num)
values (1021468862, 'ConditionallyValid', 'C', 38057264, 4565017);
insert into DRIVER (license, status, license_type, id, license_num)
values (134822882, 'ConditionallyValid', 'B', 170946202, 8398550);
insert into DRIVER (license, status, license_type, id, license_num)
values (2028474302, 'Pending', 'A', 39531344, 6354532);
insert into DRIVER (license, status, license_type, id, license_num)
values (58278607, 'Inactive', 'B', 377690437, 7245510);
insert into DRIVER (license, status, license_type, id, license_num)
values (1138031862, 'Expired', 'A', 305312388, 2835877);
insert into DRIVER (license, status, license_type, id, license_num)
values (1428655881, 'Restricted', 'A', 295528732, 8656979);
insert into DRIVER (license, status, license_type, id, license_num)
values (1070504426, 'UnderReview', 'B', 113224706, 8659729);
insert into DRIVER (license, status, license_type, id, license_num)
values (32186828, 'Pending', 'B', 710863046, 9106645);
insert into DRIVER (license, status, license_type, id, license_num)
values (27326762, 'Pending', 'B', 757831120, 2222070);
insert into DRIVER (license, status, license_type, id, license_num)
values (1727035203, 'Inactive', 'C', 134922863, 661480);
insert into DRIVER (license, status, license_type, id, license_num)
values (1831517387, 'Probationary', 'A', 550520513, 203913);
insert into DRIVER (license, status, license_type, id, license_num)
values (208275326, 'Active', 'A', 85028704, 6154995);
insert into DRIVER (license, status, license_type, id, license_num)
values (1646095182, 'RestrictedConditional', 'B', 447557317, 3437143);
insert into DRIVER (license, status, license_type, id, license_num)
values (753453962, 'Invalid', 'B', 840760549, 4565017);
insert into DRIVER (license, status, license_type, id, license_num)
values (253036851, 'Restricted', 'B', 328542395, 135871);
insert into DRIVER (license, status, license_type, id, license_num)
values (1364698272, 'ConditionallyValid', 'D', 394905067, 5888939);
insert into DRIVER (license, status, license_type, id, license_num)
values (1763278273, 'Probationary', 'A', 645872936, 3903350);
insert into DRIVER (license, status, license_type, id, license_num)
values (1437986658, 'Inactive', 'A', 39531209, 1712880);
insert into DRIVER (license, status, license_type, id, license_num)
values (1483293273, 'Temporary', 'A', 925497353, 2320681);
insert into DRIVER (license, status, license_type, id, license_num)
values (1991974764, 'Suspended', 'B', 424362430, 6178197);
insert into DRIVER (license, status, license_type, id, license_num)
values (1847187042, 'Pending', 'C', 599480717, 7692374);
insert into DRIVER (license, status, license_type, id, license_num)
values (1624246275, 'Cancelled', 'C', 355397965, 9728706);
insert into DRIVER (license, status, license_type, id, license_num)
values (1559479103, 'Active', 'B', 277930044, 845731);
insert into DRIVER (license, status, license_type, id, license_num)
values (1408476839, 'Invalid', 'C', 99955694, 1008835);
insert into DRIVER (license, status, license_type, id, license_num)
values (1851225534, 'Probationary', 'B', 30528986, 5188709);
insert into DRIVER (license, status, license_type, id, license_num)
values (228019081, 'Suspended', 'B', 200459920, 2716400);
insert into DRIVER (license, status, license_type, id, license_num)
values (348833287, 'Valid', 'B', 746625953, 8373865);
insert into DRIVER (license, status, license_type, id, license_num)
values (797341652, 'Revoked', 'C', 473019481, 7995720);
insert into DRIVER (license, status, license_type, id, license_num)
values (351244372, 'Inactive', 'A', 675821836, 2540131);
insert into DRIVER (license, status, license_type, id, license_num)
values (1554171781, 'Expired', 'B', 358145036, 8696175);
insert into DRIVER (license, status, license_type, id, license_num)
values (1255321788, 'Temporary', 'D', 270862332, 4312065);
insert into DRIVER (license, status, license_type, id, license_num)
values (1273429469, 'ConditionallyValid', 'D', 464423876, 3396764);
insert into DRIVER (license, status, license_type, id, license_num)
values (13621434, 'Disqualified', 'B', 8985748, 2263322);
insert into DRIVER (license, status, license_type, id, license_num)
values (1603503653, 'ConditionallyValid', 'A', 436705936, 7683993);
insert into DRIVER (license, status, license_type, id, license_num)
values (1841684851, 'RenewalRequired', 'D', 174066999, 6713792);
insert into DRIVER (license, status, license_type, id, license_num)
values (812881251, 'Inactive', 'C', 428357864, 6457605);
insert into DRIVER (license, status, license_type, id, license_num)
values (1348325266, 'Expired', 'C', 589450929, 5217624);
insert into DRIVER (license, status, license_type, id, license_num)
values (1813674433, 'RestrictedConditional', 'D', 399386615, 44600);
insert into DRIVER (license, status, license_type, id, license_num)
values (1827832552, 'Provisional', 'B', 71681340, 9789043);
insert into DRIVER (license, status, license_type, id, license_num)
values (1682476937, 'Active', 'D', 667276251, 803994);
insert into DRIVER (license, status, license_type, id, license_num)
values (1309466763, 'Disqualified', 'B', 250490156, 6640162);
insert into DRIVER (license, status, license_type, id, license_num)
values (83375374, 'Inactive', 'C', 274935545, 9451417);
insert into DRIVER (license, status, license_type, id, license_num)
values (291786290, 'Temporary', 'B', 614939515, 5067549);
insert into DRIVER (license, status, license_type, id, license_num)
values (410734783, 'Denied', 'B', 695693194, 8587560);
insert into DRIVER (license, status, license_type, id, license_num)
values (1019296372, 'Suspended', 'C', 814634122, 1915830);
insert into DRIVER (license, status, license_type, id, license_num)
values (683977907, 'Denied', 'A', 83974239, 2819106);
insert into DRIVER (license, status, license_type, id, license_num)
values (962355680, 'Disqualified', 'D', 267524998, 4614465);
insert into DRIVER (license, status, license_type, id, license_num)
values (1991902959, 'Invalid', 'C', 395765837, 9026510);
insert into DRIVER (license, status, license_type, id, license_num)
values (1434854896, 'Temporary', 'B', 683655938, 6506708);
insert into DRIVER (license, status, license_type, id, license_num)
values (1522070822, 'Cancelled', 'C', 263682528, 4543635);
insert into DRIVER (license, status, license_type, id, license_num)
values (1931351339, 'Invalid', 'D', 877493083, 2718272);
insert into DRIVER (license, status, license_type, id, license_num)
values (2084269451, 'Valid', 'D', 763624579, 1033990);
insert into DRIVER (license, status, license_type, id, license_num)
values (1530891503, 'Probationary', 'A', 908008170, 8685211);
insert into DRIVER (license, status, license_type, id, license_num)
values (590920788, 'Temporary', 'A', 163740492, 7042045);
insert into DRIVER (license, status, license_type, id, license_num)
values (735390362, 'Denied', 'C', 260844930, 1050003);
insert into DRIVER (license, status, license_type, id, license_num)
values (527775508, 'Active', 'D', 638293740, 6970240);
insert into DRIVER (license, status, license_type, id, license_num)
values (755529204, 'RestrictedConditional', 'B', 164819374, 8473645);
insert into DRIVER (license, status, license_type, id, license_num)
values (1774438282, 'Cancelled', 'B', 751355721, 1957212);
insert into DRIVER (license, status, license_type, id, license_num)
values (2009121277, 'Probationary', 'B', 373166837, 7860361);
insert into DRIVER (license, status, license_type, id, license_num)
values (1376393748, 'Restricted', 'D', 615724933, 7710773);
insert into DRIVER (license, status, license_type, id, license_num)
values (1371308557, 'Expired', 'C', 400189130, 7984675);
insert into DRIVER (license, status, license_type, id, license_num)
values (1633858022, 'Active', 'B', 140544361, 9817323);
insert into DRIVER (license, status, license_type, id, license_num)
values (1817995353, 'Revoked', 'B', 5489449, 7098505);
insert into DRIVER (license, status, license_type, id, license_num)
values (339857038, 'Disqualified', 'C', 146679209, 9000534);
insert into DRIVER (license, status, license_type, id, license_num)
values (880306631, 'Suspended', 'C', 425588262, 9209256);
commit;
prompt 100 records committed...
insert into DRIVER (license, status, license_type, id, license_num)
values (1970937182, 'Expired', 'B', 808733085, 8126623);
insert into DRIVER (license, status, license_type, id, license_num)
values (795113157, 'Expired', 'D', 656976380, 1841907);
insert into DRIVER (license, status, license_type, id, license_num)
values (760490949, 'ConditionallyValid', 'B', 414977157, 6891284);
insert into DRIVER (license, status, license_type, id, license_num)
values (1626935969, 'Expired', 'C', 734254038, 6111247);
insert into DRIVER (license, status, license_type, id, license_num)
values (1614673419, 'RestrictedConditional', 'C', 727792601, 9701936);
insert into DRIVER (license, status, license_type, id, license_num)
values (510347915, 'Invalid', 'D', 537471, 5346614);
insert into DRIVER (license, status, license_type, id, license_num)
values (1636316425, 'Expired', 'B', 165315389, 9929993);
insert into DRIVER (license, status, license_type, id, license_num)
values (1433458862, 'Disqualified', 'C', 70197134, 765730);
insert into DRIVER (license, status, license_type, id, license_num)
values (428315823, 'Active', 'D', 348688553, 5379078);
insert into DRIVER (license, status, license_type, id, license_num)
values (1713126227, 'Cancelled', 'B', 745499034, 5035527);
insert into DRIVER (license, status, license_type, id, license_num)
values (713799619, 'Invalid', 'B', 748046109, 2462661);
insert into DRIVER (license, status, license_type, id, license_num)
values (1974378110, 'Provisional', 'C', 622509736, 6280402);
insert into DRIVER (license, status, license_type, id, license_num)
values (2042483055, 'Suspended', 'D', 951207632, 6640162);
insert into DRIVER (license, status, license_type, id, license_num)
values (1654598228, 'Expired', 'B', 52498515, 9574341);
insert into DRIVER (license, status, license_type, id, license_num)
values (579941179, 'Provisional', 'C', 683925016, 4788455);
insert into DRIVER (license, status, license_type, id, license_num)
values (621925253, 'Denied', 'C', 353343650, 5881430);
insert into DRIVER (license, status, license_type, id, license_num)
values (1047199520, 'Invalid', 'A', 858873709, 8038158);
insert into DRIVER (license, status, license_type, id, license_num)
values (2134192591, 'Inactive', 'C', 476745216, 2070525);
insert into DRIVER (license, status, license_type, id, license_num)
values (619613627, 'Cancelled', 'A', 278413709, 7395195);
insert into DRIVER (license, status, license_type, id, license_num)
values (649708092, 'ConditionallyValid', 'C', 572888847, 8389979);
insert into DRIVER (license, status, license_type, id, license_num)
values (1840132101, 'Restricted', 'A', 538200293, 122858);
insert into DRIVER (license, status, license_type, id, license_num)
values (1413989817, 'Disqualified', 'A', 861096098, 2718272);
insert into DRIVER (license, status, license_type, id, license_num)
values (373958388, 'Provisional', 'B', 757334285, 17769);
insert into DRIVER (license, status, license_type, id, license_num)
values (364208206, 'Expired', 'C', 509670721, 7516609);
insert into DRIVER (license, status, license_type, id, license_num)
values (1502442967, 'Valid', 'D', 756949281, 7831879);
insert into DRIVER (license, status, license_type, id, license_num)
values (796605740, 'Cancelled', 'A', 379370561, 4312065);
insert into DRIVER (license, status, license_type, id, license_num)
values (206733726, 'Inactive', 'B', 620670112, 6249419);
insert into DRIVER (license, status, license_type, id, license_num)
values (966588751, 'RestrictedConditional', 'C', 787587330, 3748349);
insert into DRIVER (license, status, license_type, id, license_num)
values (936736989, 'Probationary', 'A', 7599704, 8915351);
insert into DRIVER (license, status, license_type, id, license_num)
values (1196521257, 'Restricted', 'D', 531484175, 89585);
insert into DRIVER (license, status, license_type, id, license_num)
values (1935568065, 'Pending', 'D', 512684306, 5888939);
insert into DRIVER (license, status, license_type, id, license_num)
values (1662324954, 'Inactive', 'C', 951784274, 4448179);
insert into DRIVER (license, status, license_type, id, license_num)
values (1263247331, 'Restricted', 'B', 10319452, 5240524);
insert into DRIVER (license, status, license_type, id, license_num)
values (185125728, 'Revoked', 'C', 301282487, 8966429);
insert into DRIVER (license, status, license_type, id, license_num)
values (1586934922, 'Invalid', 'B', 479631212, 1290249);
insert into DRIVER (license, status, license_type, id, license_num)
values (247518816, 'Restricted', 'A', 885876699, 2579625);
insert into DRIVER (license, status, license_type, id, license_num)
values (821180429, 'Denied', 'D', 486557210, 7434482);
insert into DRIVER (license, status, license_type, id, license_num)
values (1767433388, 'Probationary', 'D', 506275431, 5112669);
insert into DRIVER (license, status, license_type, id, license_num)
values (416981070, 'Revoked', 'C', 614451967, 2462661);
insert into DRIVER (license, status, license_type, id, license_num)
values (679317565, 'Pending', 'D', 580585940, 8833337);
insert into DRIVER (license, status, license_type, id, license_num)
values (2055817738, 'Expired', 'C', 376376622, 4954909);
insert into DRIVER (license, status, license_type, id, license_num)
values (93845073, 'Temporary', 'A', 318224446, 7516609);
insert into DRIVER (license, status, license_type, id, license_num)
values (2954624, 'Probationary', 'A', 312277675, 5346614);
insert into DRIVER (license, status, license_type, id, license_num)
values (492231257, 'RestrictedConditional', 'C', 999204542, 989137);
insert into DRIVER (license, status, license_type, id, license_num)
values (1412548243, 'Cancelled', 'D', 907355170, 4836045);
insert into DRIVER (license, status, license_type, id, license_num)
values (1907461335, 'RestrictedConditional', 'C', 880018909, 4614465);
insert into DRIVER (license, status, license_type, id, license_num)
values (1026870809, 'Expired', 'C', 711670666, 100977);
insert into DRIVER (license, status, license_type, id, license_num)
values (1497217184, 'Temporary', 'B', 452410690, 9681666);
insert into DRIVER (license, status, license_type, id, license_num)
values (1857750844, 'Disqualified', 'C', 355170089, 9392390);
insert into DRIVER (license, status, license_type, id, license_num)
values (445846577, 'Pending', 'B', 34887202, 9740302);
insert into DRIVER (license, status, license_type, id, license_num)
values (357853383, 'Probationary', 'A', 407473605, 9878547);
insert into DRIVER (license, status, license_type, id, license_num)
values (1153392102, 'Active', 'A', 29690111, 421486);
insert into DRIVER (license, status, license_type, id, license_num)
values (174139014, 'Provisional', 'A', 801184376, 8589674);
insert into DRIVER (license, status, license_type, id, license_num)
values (2015883527, 'Disqualified', 'A', 559298767, 1957212);
insert into DRIVER (license, status, license_type, id, license_num)
values (1926316488, 'Suspended', 'B', 375982357, 2494350);
insert into DRIVER (license, status, license_type, id, license_num)
values (758435545, 'Active', 'D', 123980617, 7860361);
insert into DRIVER (license, status, license_type, id, license_num)
values (147189799, 'Active', 'D', 440460239, 2121369);
insert into DRIVER (license, status, license_type, id, license_num)
values (531136776, 'Suspended', 'A', 973344811, 4003936);
insert into DRIVER (license, status, license_type, id, license_num)
values (1767172719, 'RenewalRequired', 'A', 951528195, 9145834);
insert into DRIVER (license, status, license_type, id, license_num)
values (20305049, 'Provisional', 'B', 943649081, 4466407);
insert into DRIVER (license, status, license_type, id, license_num)
values (1683989994, 'Pending', 'A', 912128568, 9106467);
insert into DRIVER (license, status, license_type, id, license_num)
values (29874655, 'Denied', 'C', 251206060, 7516609);
insert into DRIVER (license, status, license_type, id, license_num)
values (1830194095, 'Expired', 'C', 942058810, 8968330);
insert into DRIVER (license, status, license_type, id, license_num)
values (1693753010, 'Provisional', 'D', 753222074, 5346614);
insert into DRIVER (license, status, license_type, id, license_num)
values (2023026396, 'Denied', 'D', 235962035, 477353);
insert into DRIVER (license, status, license_type, id, license_num)
values (1613557066, 'Inactive', 'C', 350918762, 5888939);
insert into DRIVER (license, status, license_type, id, license_num)
values (1995932518, 'UnderReview', 'D', 410431241, 3950898);
insert into DRIVER (license, status, license_type, id, license_num)
values (1829939329, 'Probationary', 'A', 40173972, 3086877);
insert into DRIVER (license, status, license_type, id, license_num)
values (641873897, 'Temporary', 'B', 193961069, 1143545);
insert into DRIVER (license, status, license_type, id, license_num)
values (1418007861, 'Provisional', 'C', 905285468, 8038158);
insert into DRIVER (license, status, license_type, id, license_num)
values (1631329271, 'Revoked', 'A', 150458420, 94216);
insert into DRIVER (license, status, license_type, id, license_num)
values (1872126142, 'Pending', 'A', 837214354, 5332375);
insert into DRIVER (license, status, license_type, id, license_num)
values (240378642, 'ConditionallyValid', 'A', 111354105, 6402619);
insert into DRIVER (license, status, license_type, id, license_num)
values (1413454404, 'Temporary', 'C', 804048628, 4466407);
insert into DRIVER (license, status, license_type, id, license_num)
values (1569967177, 'Probationary', 'A', 248583191, 5240524);
insert into DRIVER (license, status, license_type, id, license_num)
values (1006166740, 'ConditionallyValid', 'A', 894902933, 6178197);
insert into DRIVER (license, status, license_type, id, license_num)
values (496362343, 'Suspended', 'A', 118982735, 5196610);
insert into DRIVER (license, status, license_type, id, license_num)
values (493297503, 'Active', 'B', 307659308, 5268197);
insert into DRIVER (license, status, license_type, id, license_num)
values (506468824, 'Provisional', 'B', 385633411, 9167596);
insert into DRIVER (license, status, license_type, id, license_num)
values (243857464, 'Inactive', 'D', 270614414, 8281810);
insert into DRIVER (license, status, license_type, id, license_num)
values (1256650549, 'Inactive', 'A', 893730747, 8685211);
insert into DRIVER (license, status, license_type, id, license_num)
values (1825765382, 'Active', 'D', 771062372, 2797464);
insert into DRIVER (license, status, license_type, id, license_num)
values (1652943561, 'Expired', 'A', 685008059, 989137);
insert into DRIVER (license, status, license_type, id, license_num)
values (1377421158, 'RenewalRequired', 'B', 507297289, 9392390);
insert into DRIVER (license, status, license_type, id, license_num)
values (822637945, 'Inactive', 'A', 149082896, 3174874);
insert into DRIVER (license, status, license_type, id, license_num)
values (144462209, 'Suspended', 'A', 203959567, 7728328);
insert into DRIVER (license, status, license_type, id, license_num)
values (1627023719, 'ConditionallyValid', 'B', 665942247, 4088898);
insert into DRIVER (license, status, license_type, id, license_num)
values (308018030, 'Expired', 'C', 664965013, 4314274);
insert into DRIVER (license, status, license_type, id, license_num)
values (902144045, 'Expired', 'B', 18894026, 2239582);
insert into DRIVER (license, status, license_type, id, license_num)
values (630532283, 'Temporary', 'B', 111331288, 476357);
insert into DRIVER (license, status, license_type, id, license_num)
values (227350315, 'Probationary', 'A', 872205343, 3863706);
insert into DRIVER (license, status, license_type, id, license_num)
values (1812600470, 'Disqualified', 'C', 708338623, 7545826);
insert into DRIVER (license, status, license_type, id, license_num)
values (1710760595, 'RenewalRequired', 'D', 694965433, 4498357);
insert into DRIVER (license, status, license_type, id, license_num)
values (233425138, 'RenewalRequired', 'A', 92057408, 116953);
insert into DRIVER (license, status, license_type, id, license_num)
values (939768528, 'Revoked', 'B', 630030334, 7683993);
insert into DRIVER (license, status, license_type, id, license_num)
values (280271362, 'Restricted', 'A', 713326269, 7885686);
insert into DRIVER (license, status, license_type, id, license_num)
values (819993650, 'Expired', 'D', 265895682, 2819106);
insert into DRIVER (license, status, license_type, id, license_num)
values (1508752513, 'Probationary', 'A', 71558043, 5240524);
insert into DRIVER (license, status, license_type, id, license_num)
values (1736820588, 'Disqualified', 'C', 782517633, 2229266);
insert into DRIVER (license, status, license_type, id, license_num)
values (190750870, 'Invalid', 'B', 939716730, 9451417);
commit;
prompt 200 records committed...
insert into DRIVER (license, status, license_type, id, license_num)
values (1745245679, 'Suspended', 'D', 543444956, 6491976);
insert into DRIVER (license, status, license_type, id, license_num)
values (1423926589, 'Inactive', 'A', 801831686, 1286143);
insert into DRIVER (license, status, license_type, id, license_num)
values (897757592, 'Denied', 'D', 821679082, 3369165);
insert into DRIVER (license, status, license_type, id, license_num)
values (2062897226, 'Suspended', 'B', 757571536, 9038481);
insert into DRIVER (license, status, license_type, id, license_num)
values (145804642, 'Provisional', 'A', 110717978, 3863706);
insert into DRIVER (license, status, license_type, id, license_num)
values (519119774, 'Disqualified', 'A', 944593121, 9277874);
insert into DRIVER (license, status, license_type, id, license_num)
values (1425693827, 'Disqualified', 'A', 567591573, 5881430);
insert into DRIVER (license, status, license_type, id, license_num)
values (41431736, 'Valid', 'C', 520460997, 1332611);
insert into DRIVER (license, status, license_type, id, license_num)
values (1256724041, 'Temporary', 'C', 851802090, 9248844);
insert into DRIVER (license, status, license_type, id, license_num)
values (243752640, 'RestrictedConditional', 'D', 255310381, 476357);
insert into DRIVER (license, status, license_type, id, license_num)
values (1423946387, 'Restricted', 'D', 631119749, 7111966);
insert into DRIVER (license, status, license_type, id, license_num)
values (1323632858, 'Disqualified', 'C', 952923472, 2252607);
insert into DRIVER (license, status, license_type, id, license_num)
values (1006049987, 'UnderReview', 'D', 988666139, 1805858);
insert into DRIVER (license, status, license_type, id, license_num)
values (78183163, 'Restricted', 'A', 735380075, 4498357);
insert into DRIVER (license, status, license_type, id, license_num)
values (543937298, 'RenewalRequired', 'A', 968119630, 7545826);
insert into DRIVER (license, status, license_type, id, license_num)
values (934740023, 'Revoked', 'C', 347580048, 5112669);
insert into DRIVER (license, status, license_type, id, license_num)
values (709116819, 'Disqualified', 'C', 574033117, 882842);
insert into DRIVER (license, status, license_type, id, license_num)
values (1926970327, 'Suspended', 'A', 694758482, 1156648);
insert into DRIVER (license, status, license_type, id, license_num)
values (722464972, 'Temporary', 'B', 650566673, 1126683);
insert into DRIVER (license, status, license_type, id, license_num)
values (682064305, 'Inactive', 'D', 612402527, 5544329);
insert into DRIVER (license, status, license_type, id, license_num)
values (1508681684, 'Inactive', 'A', 634634560, 5371333);
insert into DRIVER (license, status, license_type, id, license_num)
values (1548010275, 'Inactive', 'B', 436514206, 7556867);
insert into DRIVER (license, status, license_type, id, license_num)
values (1808930061, 'Disqualified', 'C', 483890780, 107225);
insert into DRIVER (license, status, license_type, id, license_num)
values (1150784059, 'Valid', 'A', 834318574, 5196610);
insert into DRIVER (license, status, license_type, id, license_num)
values (330011131, 'Pending', 'A', 778359024, 1852051);
insert into DRIVER (license, status, license_type, id, license_num)
values (121732926, 'Cancelled', 'D', 320991254, 94216);
insert into DRIVER (license, status, license_type, id, license_num)
values (351742704, 'Invalid', 'D', 50952234, 6781773);
insert into DRIVER (license, status, license_type, id, license_num)
values (296384952, 'UnderReview', 'B', 730507007, 9262116);
insert into DRIVER (license, status, license_type, id, license_num)
values (273726178, 'UnderReview', 'A', 569367284, 1888784);
insert into DRIVER (license, status, license_type, id, license_num)
values (1338931498, 'Suspended', 'A', 958874023, 3748349);
insert into DRIVER (license, status, license_type, id, license_num)
values (1925685312, 'Revoked', 'C', 372399632, 4314274);
insert into DRIVER (license, status, license_type, id, license_num)
values (210638765, 'Temporary', 'B', 881550437, 6940155);
insert into DRIVER (license, status, license_type, id, license_num)
values (487906766, 'Disqualified', 'D', 171569151, 765730);
insert into DRIVER (license, status, license_type, id, license_num)
values (488577993, 'RenewalRequired', 'D', 952138335, 7995720);
insert into DRIVER (license, status, license_type, id, license_num)
values (1865973031, 'Denied', 'C', 121432782, 5405666);
insert into DRIVER (license, status, license_type, id, license_num)
values (1546509971, 'Probationary', 'D', 316595208, 3265026);
insert into DRIVER (license, status, license_type, id, license_num)
values (1402048041, 'Disqualified', 'D', 6704962, 5588517);
insert into DRIVER (license, status, license_type, id, license_num)
values (1072261010, 'Suspended', 'B', 484930729, 7956075);
insert into DRIVER (license, status, license_type, id, license_num)
values (1982863398, 'Disqualified', 'B', 458417974, 4085184);
insert into DRIVER (license, status, license_type, id, license_num)
values (748178509, 'Temporary', 'B', 217256349, 9112542);
insert into DRIVER (license, status, license_type, id, license_num)
values (1145529057, 'Cancelled', 'D', 721688496, 5371333);
insert into DRIVER (license, status, license_type, id, license_num)
values (737212754, 'UnderReview', 'B', 50055848, 8730888);
insert into DRIVER (license, status, license_type, id, license_num)
values (1874540839, 'Revoked', 'B', 290559328, 1768309);
insert into DRIVER (license, status, license_type, id, license_num)
values (1976533907, 'Revoked', 'B', 123456368, 1008835);
insert into DRIVER (license, status, license_type, id, license_num)
values (415313362, 'Valid', 'C', 268924335, 1626339);
insert into DRIVER (license, status, license_type, id, license_num)
values (430761100, 'UnderReview', 'A', 946188340, 9710338);
insert into DRIVER (license, status, license_type, id, license_num)
values (1745488984, 'Cancelled', 'C', 139827450, 8575589);
insert into DRIVER (license, status, license_type, id, license_num)
values (901530761, 'Invalid', 'B', 114571110, 6154995);
insert into DRIVER (license, status, license_type, id, license_num)
values (1194721230, 'RenewalRequired', 'D', 936696442, 2718272);
insert into DRIVER (license, status, license_type, id, license_num)
values (1128767263, 'Inactive', 'D', 233777116, 1903009);
insert into DRIVER (license, status, license_type, id, license_num)
values (2023655921, 'RenewalRequired', 'B', 804029926, 3863706);
insert into DRIVER (license, status, license_type, id, license_num)
values (926763254, 'ConditionallyValid', 'B', 940034758, 51694);
insert into DRIVER (license, status, license_type, id, license_num)
values (65013886, 'Suspended', 'B', 513140717, 2913116);
insert into DRIVER (license, status, license_type, id, license_num)
values (2011756407, 'Active', 'C', 585899415, 9728706);
insert into DRIVER (license, status, license_type, id, license_num)
values (680476139, 'Expired', 'D', 632371458, 7178751);
insert into DRIVER (license, status, license_type, id, license_num)
values (1553618788, 'Expired', 'D', 214209410, 8280458);
insert into DRIVER (license, status, license_type, id, license_num)
values (1658927707, 'Provisional', 'D', 623375199, 1252307);
insert into DRIVER (license, status, license_type, id, license_num)
values (41450524, 'Disqualified', 'A', 596858560, 6891284);
insert into DRIVER (license, status, license_type, id, license_num)
values (863016311, 'RenewalRequired', 'B', 118475647, 8373865);
insert into DRIVER (license, status, license_type, id, license_num)
values (1465572190, 'UnderReview', 'A', 130945021, 4938651);
insert into DRIVER (license, status, license_type, id, license_num)
values (1190265755, 'Suspended', 'D', 90908276, 107225);
insert into DRIVER (license, status, license_type, id, license_num)
values (1040987745, 'Expired', 'B', 464944035, 8913831);
insert into DRIVER (license, status, license_type, id, license_num)
values (998164276, 'Suspended', 'D', 822002397, 5188709);
insert into DRIVER (license, status, license_type, id, license_num)
values (957442768, 'UnderReview', 'C', 600178114, 9000534);
insert into DRIVER (license, status, license_type, id, license_num)
values (1262717302, 'UnderReview', 'A', 786332167, 259810);
insert into DRIVER (license, status, license_type, id, license_num)
values (1846216699, 'Disqualified', 'D', 283200270, 760298);
insert into DRIVER (license, status, license_type, id, license_num)
values (1206568043, 'Provisional', 'B', 332883077, 4836045);
insert into DRIVER (license, status, license_type, id, license_num)
values (164861654, 'Active', 'C', 876993532, 2462661);
insert into DRIVER (license, status, license_type, id, license_num)
values (713968977, 'Disqualified', 'B', 910304063, 3113119);
insert into DRIVER (license, status, license_type, id, license_num)
values (153018009, 'Valid', 'C', 965238249, 3019313);
insert into DRIVER (license, status, license_type, id, license_num)
values (814747679, 'Denied', 'A', 442075679, 6434088);
insert into DRIVER (license, status, license_type, id, license_num)
values (1084383059, 'Provisional', 'C', 617344527, 8833337);
insert into DRIVER (license, status, license_type, id, license_num)
values (2120694002, 'Invalid', 'C', 568384995, 4871686);
insert into DRIVER (license, status, license_type, id, license_num)
values (1415695065, 'Disqualified', 'B', 904161703, 3071803);
insert into DRIVER (license, status, license_type, id, license_num)
values (368653088, 'Revoked', 'A', 992494804, 9000534);
insert into DRIVER (license, status, license_type, id, license_num)
values (1050171766, 'Provisional', 'D', 173238993, 5233360);
insert into DRIVER (license, status, license_type, id, license_num)
values (1858730522, 'Suspended', 'C', 38178459, 1200643);
insert into DRIVER (license, status, license_type, id, license_num)
values (1379351786, 'Probationary', 'D', 67209238, 9149633);
insert into DRIVER (license, status, license_type, id, license_num)
values (375864976, 'Disqualified', 'D', 850294879, 820497);
insert into DRIVER (license, status, license_type, id, license_num)
values (669901805, 'Suspended', 'A', 895532177, 94216);
insert into DRIVER (license, status, license_type, id, license_num)
values (661756311, 'Revoked', 'B', 994893233, 252525);
insert into DRIVER (license, status, license_type, id, license_num)
values (62329180, 'RenewalRequired', 'C', 566843828, 4166002);
insert into DRIVER (license, status, license_type, id, license_num)
values (1378994393, 'Cancelled', 'B', 369296479, 100977);
insert into DRIVER (license, status, license_type, id, license_num)
values (689695530, 'Restricted', 'D', 391203824, 221902);
insert into DRIVER (license, status, license_type, id, license_num)
values (1549784372, 'Disqualified', 'A', 723951031, 4448179);
insert into DRIVER (license, status, license_type, id, license_num)
values (1623203976, 'Suspended', 'B', 218477177, 116953);
insert into DRIVER (license, status, license_type, id, license_num)
values (1328243004, 'Pending', 'C', 442774733, 5013867);
insert into DRIVER (license, status, license_type, id, license_num)
values (749489345, 'RenewalRequired', 'B', 312125671, 476357);
insert into DRIVER (license, status, license_type, id, license_num)
values (1160809711, 'Restricted', 'D', 672039858, 781546);
insert into DRIVER (license, status, license_type, id, license_num)
values (375757379, 'Revoked', 'A', 168559157, 8204852);
insert into DRIVER (license, status, license_type, id, license_num)
values (1293607052, 'UnderReview', 'A', 870770849, 6111247);
insert into DRIVER (license, status, license_type, id, license_num)
values (1268763038, 'RestrictedConditional', 'C', 191220474, 2546532);
insert into DRIVER (license, status, license_type, id, license_num)
values (896553585, 'Expired', 'D', 19126397, 5593265);
insert into DRIVER (license, status, license_type, id, license_num)
values (125437062, 'RenewalRequired', 'A', 440780791, 5560877);
insert into DRIVER (license, status, license_type, id, license_num)
values (1308802667, 'Denied', 'A', 83938648, 6154995);
insert into DRIVER (license, status, license_type, id, license_num)
values (2004813096, 'Provisional', 'D', 721207030, 7111966);
insert into DRIVER (license, status, license_type, id, license_num)
values (2044117929, 'RenewalRequired', 'C', 555621587, 5525245);
insert into DRIVER (license, status, license_type, id, license_num)
values (1804299088, 'Invalid', 'A', 533247878, 1143545);
insert into DRIVER (license, status, license_type, id, license_num)
values (422271102, 'Expired', 'C', 191421024, 421486);
insert into DRIVER (license, status, license_type, id, license_num)
values (889364249, 'Cancelled', 'C', 695145415, 7826899);
commit;
prompt 300 records committed...
insert into DRIVER (license, status, license_type, id, license_num)
values (1198771119, 'Temporary', 'A', 745802224, 760298);
insert into DRIVER (license, status, license_type, id, license_num)
values (893068634, 'Expired', 'D', 268587294, 3790664);
insert into DRIVER (license, status, license_type, id, license_num)
values (326048853, 'Valid', 'A', 259237484, 5888939);
insert into DRIVER (license, status, license_type, id, license_num)
values (1447005198, 'Suspended', 'C', 794740915, 8276339);
insert into DRIVER (license, status, license_type, id, license_num)
values (276930578, 'Disqualified', 'D', 847664668, 9862635);
insert into DRIVER (license, status, license_type, id, license_num)
values (1883387269, 'ConditionallyValid', 'D', 709984281, 1063472);
insert into DRIVER (license, status, license_type, id, license_num)
values (1343126131, 'Restricted', 'B', 958585013, 8599728);
insert into DRIVER (license, status, license_type, id, license_num)
values (2038435854, 'Cancelled', 'C', 748921375, 6080905);
insert into DRIVER (license, status, license_type, id, license_num)
values (1090722072, 'Temporary', 'B', 965577538, 2716400);
insert into DRIVER (license, status, license_type, id, license_num)
values (1451274450, 'Provisional', 'B', 728995488, 6330012);
insert into DRIVER (license, status, license_type, id, license_num)
values (22864473, 'Restricted', 'B', 239422553, 8574769);
insert into DRIVER (license, status, license_type, id, license_num)
values (2767290, 'Invalid', 'C', 15875044, 1678269);
insert into DRIVER (license, status, license_type, id, license_num)
values (506904326, 'Probationary', 'C', 664342430, 4931859);
insert into DRIVER (license, status, license_type, id, license_num)
values (1940115116, 'Cancelled', 'B', 712536246, 4788455);
insert into DRIVER (license, status, license_type, id, license_num)
values (462775100, 'RenewalRequired', 'B', 163297817, 6970869);
insert into DRIVER (license, status, license_type, id, license_num)
values (1674718816, 'Revoked', 'C', 829994890, 4836045);
insert into DRIVER (license, status, license_type, id, license_num)
values (1024996004, 'Provisional', 'B', 240868549, 9701936);
insert into DRIVER (license, status, license_type, id, license_num)
values (343170096, 'UnderReview', 'B', 393885274, 8473645);
insert into DRIVER (license, status, license_type, id, license_num)
values (994099301, 'Revoked', 'D', 587921128, 2320681);
insert into DRIVER (license, status, license_type, id, license_num)
values (1554523384, 'ConditionallyValid', 'D', 311112051, 6434088);
insert into DRIVER (license, status, license_type, id, license_num)
values (1256566881, 'Invalid', 'D', 82734791, 3396764);
insert into DRIVER (license, status, license_type, id, license_num)
values (341483523, 'Expired', 'A', 375090682, 8870711);
insert into DRIVER (license, status, license_type, id, license_num)
values (768954799, 'Disqualified', 'B', 437092221, 3368686);
insert into DRIVER (license, status, license_type, id, license_num)
values (517080026, 'Denied', 'C', 556881257, 6282853);
insert into DRIVER (license, status, license_type, id, license_num)
values (1932333839, 'RenewalRequired', 'D', 97550001, 5593265);
insert into DRIVER (license, status, license_type, id, license_num)
values (201521465, 'Temporary', 'A', 639291131, 4160015);
insert into DRIVER (license, status, license_type, id, license_num)
values (606456348, 'UnderReview', 'A', 147034524, 2189909);
insert into DRIVER (license, status, license_type, id, license_num)
values (1638681209, 'ConditionallyValid', 'B', 901198384, 5240524);
insert into DRIVER (license, status, license_type, id, license_num)
values (628601809, 'Active', 'C', 410928055, 1957212);
insert into DRIVER (license, status, license_type, id, license_num)
values (1947052963, 'Inactive', 'D', 783584123, 5483407);
insert into DRIVER (license, status, license_type, id, license_num)
values (852756579, 'Valid', 'B', 674464517, 948978);
insert into DRIVER (license, status, license_type, id, license_num)
values (354527758, 'Pending', 'B', 760964428, 6675376);
insert into DRIVER (license, status, license_type, id, license_num)
values (161762771, 'Denied', 'C', 265033501, 5379078);
insert into DRIVER (license, status, license_type, id, license_num)
values (1534282892, 'UnderReview', 'C', 570499077, 5112669);
insert into DRIVER (license, status, license_type, id, license_num)
values (828953423, 'RestrictedConditional', 'B', 149420823, 8697338);
insert into DRIVER (license, status, license_type, id, license_num)
values (1272262967, 'Probationary', 'D', 902999774, 5017272);
insert into DRIVER (license, status, license_type, id, license_num)
values (546007707, 'Valid', 'B', 827737802, 5217624);
insert into DRIVER (license, status, license_type, id, license_num)
values (1992293505, 'Temporary', 'A', 336805392, 1053593);
insert into DRIVER (license, status, license_type, id, license_num)
values (1374200992, 'UnderReview', 'D', 255650723, 4064445);
insert into DRIVER (license, status, license_type, id, license_num)
values (1726660903, 'Suspended', 'D', 400868149, 3113119);
insert into DRIVER (license, status, license_type, id, license_num)
values (1336637888, 'Provisional', 'A', 529008738, 5268197);
insert into DRIVER (license, status, license_type, id, license_num)
values (772322470, 'Disqualified', 'C', 32746142, 9277874);
insert into DRIVER (license, status, license_type, id, license_num)
values (1404695581, 'RestrictedConditional', 'A', 388967420, 2819106);
insert into DRIVER (license, status, license_type, id, license_num)
values (1980203691, 'Valid', 'B', 897575403, 5245138);
insert into DRIVER (license, status, license_type, id, license_num)
values (1879973980, 'Active', 'D', 484993111, 7152297);
insert into DRIVER (license, status, license_type, id, license_num)
values (191448228, 'Invalid', 'B', 798765497, 3437143);
insert into DRIVER (license, status, license_type, id, license_num)
values (1910074743, 'UnderReview', 'D', 177565429, 7860361);
insert into DRIVER (license, status, license_type, id, license_num)
values (1716343658, 'Provisional', 'D', 668892090, 3368686);
insert into DRIVER (license, status, license_type, id, license_num)
values (1039574398, 'Probationary', 'A', 506348064, 94216);
insert into DRIVER (license, status, license_type, id, license_num)
values (415254800, 'Probationary', 'B', 587892471, 1575152);
insert into DRIVER (license, status, license_type, id, license_num)
values (1698800132, 'Restricted', 'B', 149975633, 8697338);
insert into DRIVER (license, status, license_type, id, license_num)
values (905478202, 'RestrictedConditional', 'D', 576503961, 2579625);
insert into DRIVER (license, status, license_type, id, license_num)
values (709474238, 'Inactive', 'B', 961390047, 3968386);
insert into DRIVER (license, status, license_type, id, license_num)
values (1173567187, 'ConditionallyValid', 'A', 62379380, 5874843);
insert into DRIVER (license, status, license_type, id, license_num)
values (2033398875, 'Pending', 'D', 374084896, 2637384);
insert into DRIVER (license, status, license_type, id, license_num)
values (1048439661, 'Restricted', 'B', 354242777, 6809897);
insert into DRIVER (license, status, license_type, id, license_num)
values (2100312994, 'Temporary', 'A', 597514278, 1712880);
insert into DRIVER (license, status, license_type, id, license_num)
values (1034379381, 'Valid', 'A', 603739842, 2540131);
insert into DRIVER (license, status, license_type, id, license_num)
values (719313032, 'ConditionallyValid', 'C', 472354570, 8398550);
insert into DRIVER (license, status, license_type, id, license_num)
values (2037214540, 'Temporary', 'B', 719300252, 2392403);
insert into DRIVER (license, status, license_type, id, license_num)
values (695294248, 'Invalid', 'D', 744686974, 5544329);
insert into DRIVER (license, status, license_type, id, license_num)
values (339023914, 'Invalid', 'C', 664904645, 9155046);
insert into DRIVER (license, status, license_type, id, license_num)
values (1450839444, 'Restricted', 'C', 351119461, 2637384);
insert into DRIVER (license, status, license_type, id, license_num)
values (480716906, 'Disqualified', 'D', 153743714, 6162191);
insert into DRIVER (license, status, license_type, id, license_num)
values (20045316, 'Denied', 'C', 781478541, 9106467);
insert into DRIVER (license, status, license_type, id, license_num)
values (360889518, 'RenewalRequired', 'B', 124236762, 3396764);
insert into DRIVER (license, status, license_type, id, license_num)
values (1564707923, 'Probationary', 'C', 117637234, 2089203);
insert into DRIVER (license, status, license_type, id, license_num)
values (823364104, 'Active', 'B', 255313969, 9574341);
insert into DRIVER (license, status, license_type, id, license_num)
values (839244235, 'Disqualified', 'A', 579495883, 6491976);
insert into DRIVER (license, status, license_type, id, license_num)
values (1796085785, 'Expired', 'D', 509186975, 1852051);
insert into DRIVER (license, status, license_type, id, license_num)
values (1552276526, 'UnderReview', 'C', 815317151, 1847320);
insert into DRIVER (license, status, license_type, id, license_num)
values (89785866, 'UnderReview', 'D', 224153697, 5013867);
insert into DRIVER (license, status, license_type, id, license_num)
values (511840008, 'Valid', 'B', 549552636, 5483407);
insert into DRIVER (license, status, license_type, id, license_num)
values (67468251, 'Disqualified', 'A', 568695140, 3174874);
insert into DRIVER (license, status, license_type, id, license_num)
values (685121955, 'Active', 'A', 177021868, 9186864);
insert into DRIVER (license, status, license_type, id, license_num)
values (1266724821, 'Expired', 'B', 408348291, 2462661);
insert into DRIVER (license, status, license_type, id, license_num)
values (974241540, 'Provisional', 'A', 65389094, 7151509);
insert into DRIVER (license, status, license_type, id, license_num)
values (541257064, 'Active', 'C', 800241401, 9112542);
insert into DRIVER (license, status, license_type, id, license_num)
values (256301332, 'RestrictedConditional', 'D', 133225637, 6255461);
insert into DRIVER (license, status, license_type, id, license_num)
values (205909580, 'Cancelled', 'C', 554172508, 2989832);
insert into DRIVER (license, status, license_type, id, license_num)
values (2094126539, 'Restricted', 'A', 547012693, 1053593);
insert into DRIVER (license, status, license_type, id, license_num)
values (1662455864, 'Suspended', 'C', 652359388, 4614465);
insert into DRIVER (license, status, license_type, id, license_num)
values (1889482279, 'Expired', 'C', 792383619, 89585);
insert into DRIVER (license, status, license_type, id, license_num)
values (446689816, 'Cancelled', 'C', 596600603, 8631686);
insert into DRIVER (license, status, license_type, id, license_num)
values (808665642, 'Probationary', 'C', 59489611, 5004504);
insert into DRIVER (license, status, license_type, id, license_num)
values (1897341158, 'Suspended', 'A', 106171803, 8004359);
insert into DRIVER (license, status, license_type, id, license_num)
values (1915458105, 'Inactive', 'C', 759962148, 845731);
insert into DRIVER (license, status, license_type, id, license_num)
values (203808266, 'Probationary', 'A', 710325046, 5666700);
insert into DRIVER (license, status, license_type, id, license_num)
values (633367938, 'Denied', 'C', 512953161, 6082583);
insert into DRIVER (license, status, license_type, id, license_num)
values (1456643083, 'Revoked', 'B', 546809789, 6491976);
insert into DRIVER (license, status, license_type, id, license_num)
values (1662426626, 'Suspended', 'D', 596057126, 7708792);
insert into DRIVER (license, status, license_type, id, license_num)
values (1950804119, 'Expired', 'B', 944987867, 7434482);
insert into DRIVER (license, status, license_type, id, license_num)
values (168867748, 'ConditionallyValid', 'D', 470473923, 1957212);
insert into DRIVER (license, status, license_type, id, license_num)
values (692769976, 'UnderReview', 'B', 451053085, 8587560);
insert into DRIVER (license, status, license_type, id, license_num)
values (667692504, 'Inactive', 'D', 893866746, 4452431);
insert into DRIVER (license, status, license_type, id, license_num)
values (194239633, 'Probationary', 'D', 366389133, 9167596);
insert into DRIVER (license, status, license_type, id, license_num)
values (664905995, 'Expired', 'A', 973639105, 203913);
insert into DRIVER (license, status, license_type, id, license_num)
values (1700245064, 'Temporary', 'C', 588319047, 1181309);
insert into DRIVER (license, status, license_type, id, license_num)
values (579583182, 'Denied', 'B', 603847885, 754427);
insert into DRIVER (license, status, license_type, id, license_num)
values (755693393, 'Inactive', 'D', 804219893, 5245138);
commit;
prompt 400 records committed...
insert into DRIVER (license, status, license_type, id, license_num)
values (128039459, 'Pending', 'A', 572588497, 9168398);
insert into DRIVER (license, status, license_type, id, license_num)
values (1713490841, 'Suspended', 'A', 988601317, 8254949);
insert into DRIVER (license, status, license_type, id, license_num)
values (619217864, 'Provisional', 'A', 446063611, 4766570);
insert into DRIVER (license, status, license_type, id, license_num)
values (1588318531, 'UnderReview', 'A', 805337368, 7460745);
insert into DRIVER (license, status, license_type, id, license_num)
values (1629934079, 'Expired', 'D', 978519037, 7710773);
insert into DRIVER (license, status, license_type, id, license_num)
values (317243768, 'Expired', 'A', 798501887, 9007554);
insert into DRIVER (license, status, license_type, id, license_num)
values (2091345319, 'Valid', 'D', 550458823, 1661610);
insert into DRIVER (license, status, license_type, id, license_num)
values (1321095328, 'Denied', 'B', 825739352, 5888939);
insert into DRIVER (license, status, license_type, id, license_num)
values (1074469983, 'RenewalRequired', 'B', 611948480, 9737638);
insert into DRIVER (license, status, license_type, id, license_num)
values (1199670383, 'Inactive', 'A', 519611001, 2656307);
insert into DRIVER (license, status, license_type, id, license_num)
values (1046522281, 'Denied', 'A', 487913724, 845731);
insert into DRIVER (license, status, license_type, id, license_num)
values (1831016190, 'Revoked', 'D', 3559427, 5311259);
insert into DRIVER (license, status, license_type, id, license_num)
values (1519717431, 'Probationary', 'D', 737200868, 6674751);
insert into DRIVER (license, status, license_type, id, license_num)
values (475774927, 'Disqualified', 'D', 477609634, 7360303);
insert into DRIVER (license, status, license_type, id, license_num)
values (807197374, 'ConditionallyValid', 'C', 787260560, 4836045);
insert into DRIVER (license, status, license_type, id, license_num)
values (1403924332, 'Disqualified', 'C', 572090388, 7342564);
insert into DRIVER (license, status, license_type, id, license_num)
values (412598772, 'RenewalRequired', 'B', 34384593, 85780);
insert into DRIVER (license, status, license_type, id, license_num)
values (98772500, 'Expired', 'C', 589728367, 1768309);
insert into DRIVER (license, status, license_type, id, license_num)
values (1505499735, 'UnderReview', 'B', 533702029, 6148532);
insert into DRIVER (license, status, license_type, id, license_num)
values (1443839464, 'ConditionallyValid', 'B', 76592836, 7111966);
insert into DRIVER (license, status, license_type, id, license_num)
values (451374265, 'Inactive', 'A', 49253606, 3950898);
insert into DRIVER (license, status, license_type, id, license_num)
values (1681064234, 'Temporary', 'C', 780217178, 8833337);
insert into DRIVER (license, status, license_type, id, license_num)
values (1515714407, 'Provisional', 'B', 233690997, 7885686);
insert into DRIVER (license, status, license_type, id, license_num)
values (1250428668, 'Pending', 'B', 560457180, 3113119);
insert into DRIVER (license, status, license_type, id, license_num)
values (95113114, 'Restricted', 'A', 603182544, 845731);
insert into DRIVER (license, status, license_type, id, license_num)
values (1052244698, 'Probationary', 'D', 3568320, 8696175);
insert into DRIVER (license, status, license_type, id, license_num)
values (881957292, 'RestrictedConditional', 'A', 693674427, 221902);
insert into DRIVER (license, status, license_type, id, license_num)
values (104463538, 'ConditionallyValid', 'D', 58875248, 7879457);
insert into DRIVER (license, status, license_type, id, license_num)
values (1475200395, 'Pending', 'D', 594100772, 2390000);
insert into DRIVER (license, status, license_type, id, license_num)
values (59765391, 'Invalid', 'C', 147049999, 9000548);
insert into DRIVER (license, status, license_type, id, license_num)
values (663320660, 'Provisional', 'A', 427521663, 2641663);
insert into DRIVER (license, status, license_type, id, license_num)
values (2023018670, 'Pending', 'A', 491732575, 1073491);
insert into DRIVER (license, status, license_type, id, license_num)
values (412210114, 'Revoked', 'D', 506221412, 7708792);
insert into DRIVER (license, status, license_type, id, license_num)
values (34885777, 'RenewalRequired', 'B', 626347171, 1332611);
insert into DRIVER (license, status, license_type, id, license_num)
values (1060092408, 'Disqualified', 'C', 543649717, 5162280);
insert into DRIVER (license, status, license_type, id, license_num)
values (982912362, 'Inactive', 'B', 501899535, 346877);
insert into DRIVER (license, status, license_type, id, license_num)
values (447673077, 'Inactive', 'C', 685009900, 2189909);
insert into DRIVER (license, status, license_type, id, license_num)
values (194375266, 'Invalid', 'C', 9750344, 2645152);
insert into DRIVER (license, status, license_type, id, license_num)
values (1055538621, 'Temporary', 'C', 77624168, 6434088);
insert into DRIVER (license, status, license_type, id, license_num)
values (1801362415, 'ConditionallyValid', 'C', 20742820, 6402619);
insert into DRIVER (license, status, license_type, id, license_num)
values (1952940812, 'Invalid', 'D', 994812657, 7545826);
insert into DRIVER (license, status, license_type, id, license_num)
values (183651719, 'RenewalRequired', 'B', 166977539, 8281810);
insert into DRIVER (license, status, license_type, id, license_num)
values (2049633427, 'Expired', 'D', 727004712, 9038481);
insert into DRIVER (license, status, license_type, id, license_num)
values (136496604, 'Invalid', 'B', 697150986, 4193758);
insert into DRIVER (license, status, license_type, id, license_num)
values (1636126152, 'Disqualified', 'B', 308445258, 6331745);
insert into DRIVER (license, status, license_type, id, license_num)
values (1541433621, 'Probationary', 'A', 855586390, 6640162);
insert into DRIVER (license, status, license_type, id, license_num)
values (726182945, 'Valid', 'B', 695960687, 2641663);
insert into DRIVER (license, status, license_type, id, license_num)
values (156017552, 'Expired', 'C', 644427789, 1957212);
insert into DRIVER (license, status, license_type, id, license_num)
values (1849107498, 'Suspended', 'C', 90329559, 754427);
insert into DRIVER (license, status, license_type, id, license_num)
values (1806594090, 'Cancelled', 'D', 775676071, 8650551);
insert into DRIVER (license, status, license_type, id, license_num)
values (992050052, 'Pending', 'D', 497885636, 1852051);
insert into DRIVER (license, status, license_type, id, license_num)
values (945500412, 'Probationary', 'C', 557416789, 2622417);
insert into DRIVER (license, status, license_type, id, license_num)
values (1446911398, 'RestrictedConditional', 'A', 404780867, 7826899);
insert into DRIVER (license, status, license_type, id, license_num)
values (1358944075, 'Suspended', 'B', 557584288, 218182);
insert into DRIVER (license, status, license_type, id, license_num)
values (1921677727, 'RestrictedConditional', 'A', 117236664, 3086877);
insert into DRIVER (license, status, license_type, id, license_num)
values (1379607128, 'UnderReview', 'D', 476305335, 9213814);
insert into DRIVER (license, status, license_type, id, license_num)
values (1099408970, 'Disqualified', 'D', 36557042, 7708792);
insert into DRIVER (license, status, license_type, id, license_num)
values (483340737, 'Probationary', 'D', 869381600, 6675376);
insert into DRIVER (license, status, license_type, id, license_num)
values (2061700128, 'UnderReview', 'A', 739693447, 7005595);
insert into DRIVER (license, status, license_type, id, license_num)
values (1179226717, 'Active', 'B', 722415582, 6809897);
insert into DRIVER (license, status, license_type, id, license_num)
values (1791160326, 'Expired', 'B', 98834617, 7353779);
insert into DRIVER (license, status, license_type, id, license_num)
values (132215469, 'Cancelled', 'D', 686520084, 44600);
insert into DRIVER (license, status, license_type, id, license_num)
values (477411324, 'Probationary', 'A', 771626857, 8696175);
insert into DRIVER (license, status, license_type, id, license_num)
values (1200199625, 'Inactive', 'D', 30470247, 4003936);
insert into DRIVER (license, status, license_type, id, license_num)
values (457909207, 'Valid', 'A', 177682741, 8968330);
insert into DRIVER (license, status, license_type, id, license_num)
values (672307762, 'Inactive', 'A', 928290803, 4614465);
insert into DRIVER (license, status, license_type, id, license_num)
values (796565370, 'Probationary', 'C', 374273610, 5217624);
insert into DRIVER (license, status, license_type, id, license_num)
values (2003478630, 'Revoked', 'D', 377244895, 3267903);
insert into DRIVER (license, status, license_type, id, license_num)
values (853862130, 'Provisional', 'C', 698719894, 1841907);
insert into DRIVER (license, status, license_type, id, license_num)
values (1437319265, 'RenewalRequired', 'A', 993883372, 9778096);
insert into DRIVER (license, status, license_type, id, license_num)
values (1886865647, 'RestrictedConditional', 'C', 232814851, 568058);
insert into DRIVER (license, status, license_type, id, license_num)
values (689647339, 'Pending', 'C', 330381310, 2398431);
insert into DRIVER (license, status, license_type, id, license_num)
values (1389820535, 'Pending', 'D', 298319988, 6154995);
insert into DRIVER (license, status, license_type, id, license_num)
values (1887151807, 'RenewalRequired', 'C', 758992323, 2989832);
insert into DRIVER (license, status, license_type, id, license_num)
values (1425767807, 'Pending', 'B', 135231662, 8589674);
insert into DRIVER (license, status, license_type, id, license_num)
values (2088391225, 'Active', 'A', 321241789, 904377);
insert into DRIVER (license, status, license_type, id, license_num)
values (615661763, 'Expired', 'A', 202783445, 3369165);
insert into DRIVER (license, status, license_type, id, license_num)
values (326232416, 'Inactive', 'B', 628600454, 5379078);
insert into DRIVER (license, status, license_type, id, license_num)
values (1634982114, 'Active', 'C', 721293901, 8696175);
insert into DRIVER (license, status, license_type, id, license_num)
values (1239014651, 'Revoked', 'C', 576563496, 5761529);
insert into DRIVER (license, status, license_type, id, license_num)
values (93721473, 'ConditionallyValid', 'D', 435483177, 7220653);
insert into DRIVER (license, status, license_type, id, license_num)
values (637224802, 'Restricted', 'A', 857964382, 9878547);
insert into DRIVER (license, status, license_type, id, license_num)
values (2051568378, 'Temporary', 'C', 3719936, 1661610);
insert into DRIVER (license, status, license_type, id, license_num)
values (2112593983, 'Temporary', 'A', 250713580, 6434088);
insert into DRIVER (license, status, license_type, id, license_num)
values (320562319, 'Suspended', 'B', 290383382, 6891284);
insert into DRIVER (license, status, license_type, id, license_num)
values (1777705250, 'UnderReview', 'C', 79899163, 3450908);
insert into DRIVER (license, status, license_type, id, license_num)
values (829473766, 'Revoked', 'C', 733217108, 5112669);
insert into DRIVER (license, status, license_type, id, license_num)
values (111837992, 'Pending', 'D', 862916677, 8575589);
insert into DRIVER (license, status, license_type, id, license_num)
values (433730409, 'Expired', 'A', 859228917, 4085184);
insert into DRIVER (license, status, license_type, id, license_num)
values (681867494, 'Temporary', 'B', 471573222, 8126623);
insert into DRIVER (license, status, license_type, id, license_num)
values (1157402691, 'Disqualified', 'A', 617857020, 2797464);
insert into DRIVER (license, status, license_type, id, license_num)
values (64636561, 'Pending', 'A', 68831150, 954045);
insert into DRIVER (license, status, license_type, id, license_num)
values (16457682, 'Active', 'C', 856928435, 1081215);
insert into DRIVER (license, status, license_type, id, license_num)
values (879493008, 'Valid', 'B', 682647633, 1575152);
insert into DRIVER (license, status, license_type, id, license_num)
values (1890301022, 'Suspended', 'B', 464145195, 9155046);
insert into DRIVER (license, status, license_type, id, license_num)
values (1192469643, 'Invalid', 'D', 136157547, 9204246);
insert into DRIVER (license, status, license_type, id, license_num)
values (1063184211, 'Provisional', 'D', 662739749, 4206040);
insert into DRIVER (license, status, license_type, id, license_num)
values (1842222397, 'ConditionallyValid', 'D', 473765382, 7353779);
insert into DRIVER (license, status, license_type, id, license_num)
values (125676926, 'Probationary', 'A', 906843751, 7098505);
insert into DRIVER (license, status, license_type, id, license_num)
values (1705866989, 'Probationary', 'A', 283963005, 9737638);
commit;
prompt 500 records loaded
prompt Loading DELIVERY...
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (974411995, 'Processing', to_date('27-11-2012', 'dd-mm-yyyy'), 894902933);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (665905799, 'AwaitingPayment', to_date('14-01-2005', 'dd-mm-yyyy'), 118982735);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (942080309, 'Packaging', to_date('31-01-2016', 'dd-mm-yyyy'), 307659308);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (309814093, 'Delayed', to_date('04-03-2007', 'dd-mm-yyyy'), 385633411);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (714871492, 'Canceled', to_date('31-03-2028', 'dd-mm-yyyy'), 270614414);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (23183536, 'Packaging', to_date('17-03-2028', 'dd-mm-yyyy'), 893730747);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (157898080, 'AwaitingPayment', to_date('13-09-2027', 'dd-mm-yyyy'), 771062372);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (611802530, 'Delayed', to_date('06-07-2000', 'dd-mm-yyyy'), 685008059);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (39781438, 'DeliveryFailed', to_date('27-03-2028', 'dd-mm-yyyy'), 507297289);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (21218242, 'AwaitingPickup', to_date('05-02-2019', 'dd-mm-yyyy'), 149082896);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (34673859, 'Processing', to_date('12-02-2004', 'dd-mm-yyyy'), 203959567);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (27754962, 'PaymentConfirmed', to_date('27-09-2008', 'dd-mm-yyyy'), 665942247);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (540045184, 'InTransit', to_date('09-02-2027', 'dd-mm-yyyy'), 664965013);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (553541233, 'ReadyforPickup', to_date('09-05-2013', 'dd-mm-yyyy'), 18894026);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (260466551, 'InTransit', to_date('14-03-2007', 'dd-mm-yyyy'), 111331288);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (524416792, 'Lost', to_date('06-11-2029', 'dd-mm-yyyy'), 872205343);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (622330858, 'ReturnedtoSender', to_date('21-10-2009', 'dd-mm-yyyy'), 708338623);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (938836155, 'AttemptedDelivery', to_date('20-05-2004', 'dd-mm-yyyy'), 694965433);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (978864928, 'OnHold', to_date('10-04-2013', 'dd-mm-yyyy'), 461999971);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (311687454, 'Canceled', to_date('14-12-2023', 'dd-mm-yyyy'), 508353292);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (319441714, 'InTransit', to_date('15-08-2006', 'dd-mm-yyyy'), 899588610);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (192387701, 'AwaitingShipment', to_date('15-04-2003', 'dd-mm-yyyy'), 934269879);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (707991536, 'AwaitingPayment', to_date('20-12-2022', 'dd-mm-yyyy'), 123564850);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (825864885, 'Processing', to_date('04-08-2025', 'dd-mm-yyyy'), 249443272);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (957946257, 'ReadyforPickup', to_date('19-04-2006', 'dd-mm-yyyy'), 809069260);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (239855454, 'Delivered', to_date('01-05-2027', 'dd-mm-yyyy'), 728544897);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (716592922, 'PaymentConfirmed', to_date('19-11-2026', 'dd-mm-yyyy'), 129591888);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (353299927, 'Packaging', to_date('30-09-2010', 'dd-mm-yyyy'), 668266795);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (581501136, 'Canceled', to_date('26-11-2018', 'dd-mm-yyyy'), 769472733);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (631152786, 'Delivered', to_date('29-04-2022', 'dd-mm-yyyy'), 607059069);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (99970129, 'Delivered', to_date('22-08-2007', 'dd-mm-yyyy'), 970737605);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (247507119, 'Canceled', to_date('01-07-2015', 'dd-mm-yyyy'), 197190833);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (922926488, 'InTransit', to_date('08-09-2022', 'dd-mm-yyyy'), 665115654);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (186576752, 'OrderReceived', to_date('09-04-2000', 'dd-mm-yyyy'), 790271554);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (385340334, 'Lost', to_date('10-11-2002', 'dd-mm-yyyy'), 168124419);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (720443770, 'AwaitingPickup', to_date('18-03-2016', 'dd-mm-yyyy'), 56069798);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (328518990, 'Delayed', to_date('15-07-2024', 'dd-mm-yyyy'), 827096050);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (561315226, 'Shipped', to_date('19-08-2027', 'dd-mm-yyyy'), 129663591);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (423481843, 'DeliveryFailed', to_date('14-02-2019', 'dd-mm-yyyy'), 34722088);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (669686117, 'AwaitingShipment', to_date('24-10-2028', 'dd-mm-yyyy'), 68839870);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (587394812, 'InTransit', to_date('13-02-2015', 'dd-mm-yyyy'), 382652351);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (624834333, 'Damaged', to_date('04-01-2013', 'dd-mm-yyyy'), 796826082);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (299037245, 'AwaitingShipment', to_date('08-10-2011', 'dd-mm-yyyy'), 884100519);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (594111153, 'ReturnedtoSender', to_date('22-04-2022', 'dd-mm-yyyy'), 518311081);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (482432133, 'Canceled', to_date('08-03-2017', 'dd-mm-yyyy'), 162096332);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (443404612, 'Delayed', to_date('24-04-2005', 'dd-mm-yyyy'), 403413591);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (710547219, 'AwaitingPickup', to_date('24-12-2005', 'dd-mm-yyyy'), 993265561);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (158196430, 'InTransit', to_date('19-11-2003', 'dd-mm-yyyy'), 907418891);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (197842405, 'AttemptedDelivery', to_date('27-04-2002', 'dd-mm-yyyy'), 717196325);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (208117942, 'AttemptedDelivery', to_date('02-08-2026', 'dd-mm-yyyy'), 95198325);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (892518240, 'Shipped', to_date('03-03-2006', 'dd-mm-yyyy'), 674388677);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (774571268, 'Delivered', to_date('06-09-2010', 'dd-mm-yyyy'), 385937842);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (482684058, 'AttemptedDelivery', to_date('25-10-2019', 'dd-mm-yyyy'), 826717808);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (463351895, 'ReadyforPickup', to_date('10-10-2028', 'dd-mm-yyyy'), 38057264);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (109274934, 'Packaging', to_date('27-05-2003', 'dd-mm-yyyy'), 170946202);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (138421709, 'PickedUp', to_date('12-08-2017', 'dd-mm-yyyy'), 39531344);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (256330836, 'AwaitingPickup', to_date('06-04-2016', 'dd-mm-yyyy'), 377690437);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (911042038, 'Delayed', to_date('17-08-2001', 'dd-mm-yyyy'), 305312388);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (321400811, 'ReturnedtoSender', to_date('03-08-2024', 'dd-mm-yyyy'), 295528732);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (55685159, 'ReadyforPickup', to_date('12-11-2025', 'dd-mm-yyyy'), 113224706);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (865661316, 'AwaitingShipment', to_date('03-11-2017', 'dd-mm-yyyy'), 710863046);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (636492151, 'AwaitingPayment', to_date('30-07-2021', 'dd-mm-yyyy'), 757831120);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (530250028, 'Damaged', to_date('23-07-2010', 'dd-mm-yyyy'), 134922863);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (278328377, 'ReturnedtoSender', to_date('10-05-2004', 'dd-mm-yyyy'), 550520513);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (20346635, 'Packaging', to_date('24-08-2006', 'dd-mm-yyyy'), 85028704);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (903280385, 'AwaitingShipment', to_date('30-07-2030', 'dd-mm-yyyy'), 447557317);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (600122160, 'DeliveryFailed', to_date('29-08-2001', 'dd-mm-yyyy'), 840760549);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (653417462, 'Damaged', to_date('22-12-2018', 'dd-mm-yyyy'), 328542395);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (492450568, 'AwaitingPayment', to_date('20-07-2009', 'dd-mm-yyyy'), 394905067);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (117742169, 'DeliveryFailed', to_date('28-09-2013', 'dd-mm-yyyy'), 645872936);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (501673515, 'InTransit', to_date('28-09-2024', 'dd-mm-yyyy'), 39531209);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (900727218, 'Shipped', to_date('25-02-2024', 'dd-mm-yyyy'), 925497353);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (196528364, 'OrderReceived', to_date('18-03-2025', 'dd-mm-yyyy'), 424362430);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (6739377, 'Shipped', to_date('14-04-2018', 'dd-mm-yyyy'), 599480717);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (876061885, 'OnHold', to_date('11-06-2003', 'dd-mm-yyyy'), 355397965);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (353902981, 'PaymentConfirmed', to_date('23-02-2012', 'dd-mm-yyyy'), 277930044);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (684960856, 'OutforDelivery', to_date('13-11-2016', 'dd-mm-yyyy'), 99955694);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (47136846, 'DeliveryFailed', to_date('02-11-2020', 'dd-mm-yyyy'), 30528986);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (30871478, 'OutforDelivery', to_date('13-03-2003', 'dd-mm-yyyy'), 200459920);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (576825837, 'Processing', to_date('06-05-2014', 'dd-mm-yyyy'), 746625953);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (732773626, 'Lost', to_date('22-03-2011', 'dd-mm-yyyy'), 473019481);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (898161890, 'ReturnedtoSender', to_date('17-06-2018', 'dd-mm-yyyy'), 675821836);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (102500026, 'ReadyforPickup', to_date('09-04-2011', 'dd-mm-yyyy'), 358145036);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (63405643, 'Processing', to_date('09-05-2010', 'dd-mm-yyyy'), 270862332);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (126514562, 'Delivered', to_date('27-06-2001', 'dd-mm-yyyy'), 464423876);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (612180413, 'AwaitingShipment', to_date('08-02-2001', 'dd-mm-yyyy'), 8985748);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (769524144, 'OutforDelivery', to_date('20-06-2002', 'dd-mm-yyyy'), 436705936);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (693325338, 'OnHold', to_date('26-03-2020', 'dd-mm-yyyy'), 174066999);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (394586719, 'ReturnedtoSender', to_date('28-09-2014', 'dd-mm-yyyy'), 428357864);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (557638478, 'Shipped', to_date('21-10-2004', 'dd-mm-yyyy'), 589450929);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (216458401, 'OnHold', to_date('02-11-2017', 'dd-mm-yyyy'), 399386615);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (10514381, 'Canceled', to_date('02-06-2001', 'dd-mm-yyyy'), 71681340);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (70551524, 'AttemptedDelivery', to_date('20-11-2023', 'dd-mm-yyyy'), 667276251);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (795016641, 'Shipped', to_date('13-09-2008', 'dd-mm-yyyy'), 250490156);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (900659192, 'Delivered', to_date('24-01-2003', 'dd-mm-yyyy'), 274935545);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (90225680, 'ReadyforPickup', to_date('04-08-2028', 'dd-mm-yyyy'), 614939515);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (547501364, 'OnHold', to_date('18-11-2005', 'dd-mm-yyyy'), 695693194);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (802242748, 'OutforDelivery', to_date('21-09-2008', 'dd-mm-yyyy'), 814634122);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (921615759, 'DeliveryFailed', to_date('25-05-2019', 'dd-mm-yyyy'), 83974239);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (380794299, 'OrderReceived', to_date('08-08-2029', 'dd-mm-yyyy'), 267524998);
commit;
prompt 100 records committed...
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (978128953, 'ReturnedtoSender', to_date('19-09-2017', 'dd-mm-yyyy'), 395765837);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (632872677, 'AwaitingPickup', to_date('30-07-2003', 'dd-mm-yyyy'), 683655938);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (585212320, 'Damaged', to_date('08-08-2012', 'dd-mm-yyyy'), 263682528);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (567957067, 'Damaged', to_date('26-10-2029', 'dd-mm-yyyy'), 877493083);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (339832730, 'Delivered', to_date('05-04-2028', 'dd-mm-yyyy'), 763624579);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (87499878, 'PaymentConfirmed', to_date('16-08-2014', 'dd-mm-yyyy'), 908008170);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (601219584, 'PickedUp', to_date('28-04-2012', 'dd-mm-yyyy'), 163740492);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (328805418, 'Shipped', to_date('17-09-2011', 'dd-mm-yyyy'), 260844930);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (191255122, 'Shipped', to_date('12-09-2016', 'dd-mm-yyyy'), 638293740);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (172734561, 'Canceled', to_date('22-02-2010', 'dd-mm-yyyy'), 164819374);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (586565840, 'OnHold', to_date('31-08-2012', 'dd-mm-yyyy'), 751355721);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (244233263, 'Lost', to_date('18-05-2025', 'dd-mm-yyyy'), 373166837);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (253395703, 'Lost', to_date('31-01-2018', 'dd-mm-yyyy'), 615724933);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (602709559, 'AwaitingShipment', to_date('08-01-2015', 'dd-mm-yyyy'), 400189130);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (382091155, 'AwaitingPickup', to_date('18-09-2021', 'dd-mm-yyyy'), 140544361);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (768699432, 'PickedUp', to_date('07-06-2025', 'dd-mm-yyyy'), 5489449);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (823212240, 'AttemptedDelivery', to_date('25-07-2030', 'dd-mm-yyyy'), 146679209);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (150163683, 'OutforDelivery', to_date('21-11-2011', 'dd-mm-yyyy'), 425588262);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (799332538, 'ReturnedtoSender', to_date('13-10-2008', 'dd-mm-yyyy'), 808733085);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (889973798, 'OrderReceived', to_date('18-07-2026', 'dd-mm-yyyy'), 656976380);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (67878075, 'Damaged', to_date('23-01-2015', 'dd-mm-yyyy'), 414977157);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (400849184, 'InTransit', to_date('20-04-2023', 'dd-mm-yyyy'), 734254038);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (424691668, 'OrderReceived', to_date('05-08-2010', 'dd-mm-yyyy'), 727792601);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (207255506, 'ReadyforPickup', to_date('17-03-2024', 'dd-mm-yyyy'), 537471);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (75501761, 'AwaitingPickup', to_date('22-10-2022', 'dd-mm-yyyy'), 165315389);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (429208211, 'AttemptedDelivery', to_date('08-05-2027', 'dd-mm-yyyy'), 70197134);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (32285915, 'Packaging', to_date('16-02-2025', 'dd-mm-yyyy'), 353343650);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (531756019, 'PickedUp', to_date('14-01-2003', 'dd-mm-yyyy'), 858873709);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (926925120, 'OutforDelivery', to_date('05-02-2019', 'dd-mm-yyyy'), 476745216);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (450092955, 'Delivered', to_date('17-09-2013', 'dd-mm-yyyy'), 278413709);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (32108321, 'ReturnedtoSender', to_date('20-05-2002', 'dd-mm-yyyy'), 572888847);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (953866905, 'Delayed', to_date('24-04-2000', 'dd-mm-yyyy'), 538200293);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (773048663, 'Shipped', to_date('30-12-2000', 'dd-mm-yyyy'), 861096098);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (453521520, 'ReturnedtoSender', to_date('10-07-2001', 'dd-mm-yyyy'), 757334285);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (572284234, 'AttemptedDelivery', to_date('09-02-2003', 'dd-mm-yyyy'), 509670721);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (403985452, 'Packaging', to_date('27-11-2021', 'dd-mm-yyyy'), 756949281);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (200955157, 'Shipped', to_date('11-05-2017', 'dd-mm-yyyy'), 379370561);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (485340533, 'PickedUp', to_date('25-07-2018', 'dd-mm-yyyy'), 620670112);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (270974268, 'PickedUp', to_date('23-11-2019', 'dd-mm-yyyy'), 787587330);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (712643220, 'PickedUp', to_date('10-02-2020', 'dd-mm-yyyy'), 7599704);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (314827948, 'AwaitingShipment', to_date('20-11-2026', 'dd-mm-yyyy'), 531484175);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (80633889, 'AttemptedDelivery', to_date('27-06-2004', 'dd-mm-yyyy'), 512684306);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (868254824, 'OrderReceived', to_date('17-05-2010', 'dd-mm-yyyy'), 951784274);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (631256085, 'AwaitingPickup', to_date('30-09-2011', 'dd-mm-yyyy'), 10319452);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (517789692, 'OrderReceived', to_date('10-07-2011', 'dd-mm-yyyy'), 301282487);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (162199645, 'Shipped', to_date('20-07-2028', 'dd-mm-yyyy'), 479631212);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (672913711, 'ReadyforPickup', to_date('19-05-2013', 'dd-mm-yyyy'), 885876699);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (663274409, 'OutforDelivery', to_date('26-09-2008', 'dd-mm-yyyy'), 486557210);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (50620830, 'PickedUp', to_date('26-10-2019', 'dd-mm-yyyy'), 506275431);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (559581073, 'AttemptedDelivery', to_date('23-08-2017', 'dd-mm-yyyy'), 614451967);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (513823860, 'AwaitingShipment', to_date('18-05-2029', 'dd-mm-yyyy'), 580585940);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (892246686, 'OnHold', to_date('14-04-2010', 'dd-mm-yyyy'), 376376622);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (206734897, 'InTransit', to_date('26-08-2022', 'dd-mm-yyyy'), 318224446);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (685854958, 'AwaitingPayment', to_date('12-03-2011', 'dd-mm-yyyy'), 312277675);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (419115466, 'Processing', to_date('09-05-2014', 'dd-mm-yyyy'), 999204542);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (625844693, 'PaymentConfirmed', to_date('28-05-2019', 'dd-mm-yyyy'), 907355170);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (28767362, 'Shipped', to_date('09-04-2012', 'dd-mm-yyyy'), 880018909);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (824404708, 'AwaitingPayment', to_date('27-10-2005', 'dd-mm-yyyy'), 711670666);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (81611201, 'Processing', to_date('24-03-2030', 'dd-mm-yyyy'), 452410690);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (695858061, 'AttemptedDelivery', to_date('11-02-2017', 'dd-mm-yyyy'), 355170089);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (445605262, 'PickedUp', to_date('02-04-2000', 'dd-mm-yyyy'), 34887202);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (333668741, 'DeliveryFailed', to_date('19-11-2001', 'dd-mm-yyyy'), 407473605);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (674725971, 'PickedUp', to_date('03-11-2006', 'dd-mm-yyyy'), 29690111);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (700925681, 'Lost', to_date('29-10-2029', 'dd-mm-yyyy'), 801184376);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (994483344, 'Packaging', to_date('07-10-2029', 'dd-mm-yyyy'), 559298767);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (134975104, 'Packaging', to_date('03-12-2021', 'dd-mm-yyyy'), 375982357);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (391082107, 'ReadyforPickup', to_date('28-07-2012', 'dd-mm-yyyy'), 123980617);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (160391381, 'Processing', to_date('12-02-2030', 'dd-mm-yyyy'), 440460239);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (643395256, 'Packaging', to_date('05-04-2021', 'dd-mm-yyyy'), 973344811);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (261252499, 'PaymentConfirmed', to_date('12-02-2025', 'dd-mm-yyyy'), 951528195);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (907612285, 'Canceled', to_date('03-03-2008', 'dd-mm-yyyy'), 943649081);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (167342068, 'ReadyforPickup', to_date('20-05-2009', 'dd-mm-yyyy'), 912128568);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (816108994, 'Damaged', to_date('24-03-2013', 'dd-mm-yyyy'), 251206060);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (310324538, 'PickedUp', to_date('11-06-2006', 'dd-mm-yyyy'), 942058810);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (817610900, 'ReturnedtoSender', to_date('25-11-2022', 'dd-mm-yyyy'), 753222074);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (2594763, 'InTransit', to_date('31-07-2010', 'dd-mm-yyyy'), 235962035);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (241332086, 'Delivered', to_date('28-01-2016', 'dd-mm-yyyy'), 350918762);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (128432781, 'ReadyforPickup', to_date('16-09-2014', 'dd-mm-yyyy'), 410431241);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (607186354, 'Processing', to_date('05-01-2022', 'dd-mm-yyyy'), 40173972);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (273926250, 'Packaging', to_date('30-08-2019', 'dd-mm-yyyy'), 193961069);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (615362870, 'Processing', to_date('10-09-2020', 'dd-mm-yyyy'), 905285468);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (409011329, 'Processing', to_date('15-12-2007', 'dd-mm-yyyy'), 150458420);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (1299954, 'Packaging', to_date('24-05-2024', 'dd-mm-yyyy'), 837214354);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (759817502, 'Processing', to_date('25-02-2022', 'dd-mm-yyyy'), 111354105);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (618298852, 'ReturnedtoSender', to_date('07-09-2016', 'dd-mm-yyyy'), 804048628);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (674443537, 'ReadyforPickup', to_date('10-12-2024', 'dd-mm-yyyy'), 248583191);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (887006366, 'Processing', to_date('23-06-2021', 'dd-mm-yyyy'), 348688553);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (142541076, 'Shipped', to_date('27-07-2019', 'dd-mm-yyyy'), 745499034);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (787037003, 'AwaitingPayment', to_date('13-11-2030', 'dd-mm-yyyy'), 748046109);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (139437451, 'ReadyforPickup', to_date('07-06-2009', 'dd-mm-yyyy'), 622509736);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (470727703, 'OutforDelivery', to_date('19-08-2014', 'dd-mm-yyyy'), 951207632);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (674116070, 'Canceled', to_date('07-08-2030', 'dd-mm-yyyy'), 52498515);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (159412920, 'Delayed', to_date('05-11-2011', 'dd-mm-yyyy'), 683925016);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (512312611, 'Shipped', to_date('26-08-2009', 'dd-mm-yyyy'), 965577538);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (169788622, 'Damaged', to_date('05-06-2017', 'dd-mm-yyyy'), 728995488);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (427081751, 'Delayed', to_date('12-04-2026', 'dd-mm-yyyy'), 239422553);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (791974292, 'DeliveryFailed', to_date('25-07-2018', 'dd-mm-yyyy'), 15875044);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (516991005, 'AwaitingPayment', to_date('20-05-2022', 'dd-mm-yyyy'), 664342430);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (597309343, 'OutforDelivery', to_date('08-12-2017', 'dd-mm-yyyy'), 712536246);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (224813406, 'DeliveryFailed', to_date('04-02-2005', 'dd-mm-yyyy'), 163297817);
commit;
prompt 200 records committed...
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (471310030, 'InTransit', to_date('16-09-2026', 'dd-mm-yyyy'), 829994890);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (276035161, 'ReturnedtoSender', to_date('19-10-2020', 'dd-mm-yyyy'), 240868549);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (230704500, 'Processing', to_date('13-02-2005', 'dd-mm-yyyy'), 393885274);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (622490882, 'Canceled', to_date('08-04-2028', 'dd-mm-yyyy'), 587921128);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (622345335, 'InTransit', to_date('13-06-2007', 'dd-mm-yyyy'), 311112051);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (938380892, 'AwaitingPickup', to_date('12-01-2019', 'dd-mm-yyyy'), 82734791);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (432471537, 'DeliveryFailed', to_date('29-03-2003', 'dd-mm-yyyy'), 375090682);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (680022395, 'ReadyforPickup', to_date('11-09-2027', 'dd-mm-yyyy'), 437092221);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (801893633, 'PickedUp', to_date('10-10-2017', 'dd-mm-yyyy'), 556881257);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (351104331, 'OnHold', to_date('28-01-2015', 'dd-mm-yyyy'), 97550001);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (157203476, 'Delivered', to_date('18-10-2017', 'dd-mm-yyyy'), 639291131);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (55503136, 'OrderReceived', to_date('08-07-2023', 'dd-mm-yyyy'), 147034524);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (962509906, 'DeliveryFailed', to_date('10-04-2025', 'dd-mm-yyyy'), 901198384);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (593512482, 'AwaitingPayment', to_date('08-05-2001', 'dd-mm-yyyy'), 410928055);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (579302013, 'Packaging', to_date('12-09-2001', 'dd-mm-yyyy'), 783584123);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (947900036, 'Lost', to_date('16-01-2020', 'dd-mm-yyyy'), 674464517);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (69748883, 'ReturnedtoSender', to_date('04-03-2021', 'dd-mm-yyyy'), 760964428);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (444803357, 'OnHold', to_date('09-11-2007', 'dd-mm-yyyy'), 265033501);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (489090636, 'PickedUp', to_date('25-01-2029', 'dd-mm-yyyy'), 570499077);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (686530112, 'AwaitingPickup', to_date('06-06-2013', 'dd-mm-yyyy'), 149420823);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (564610960, 'Shipped', to_date('04-07-2018', 'dd-mm-yyyy'), 902999774);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (862046253, 'InTransit', to_date('10-11-2004', 'dd-mm-yyyy'), 827737802);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (268958981, 'Processing', to_date('16-03-2000', 'dd-mm-yyyy'), 336805392);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (433688167, 'AwaitingPickup', to_date('10-11-2024', 'dd-mm-yyyy'), 255650723);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (686964668, 'ReturnedtoSender', to_date('11-01-2025', 'dd-mm-yyyy'), 400868149);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (393883600, 'PickedUp', to_date('05-07-2020', 'dd-mm-yyyy'), 529008738);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (761866300, 'Lost', to_date('09-08-2015', 'dd-mm-yyyy'), 32746142);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (97100328, 'ReturnedtoSender', to_date('07-08-2017', 'dd-mm-yyyy'), 388967420);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (642328646, 'ReturnedtoSender', to_date('12-09-2027', 'dd-mm-yyyy'), 897575403);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (293648109, 'OrderReceived', to_date('26-02-2006', 'dd-mm-yyyy'), 484993111);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (166083104, 'OutforDelivery', to_date('20-08-2019', 'dd-mm-yyyy'), 798765497);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (206287023, 'Processing', to_date('14-09-2021', 'dd-mm-yyyy'), 177565429);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (559573630, 'Delivered', to_date('09-02-2028', 'dd-mm-yyyy'), 668892090);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (709889974, 'DeliveryFailed', to_date('11-11-2021', 'dd-mm-yyyy'), 506348064);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (41768173, 'Canceled', to_date('01-02-2015', 'dd-mm-yyyy'), 587892471);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (141068280, 'Shipped', to_date('09-01-2009', 'dd-mm-yyyy'), 149975633);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (98219675, 'Lost', to_date('05-07-2005', 'dd-mm-yyyy'), 576503961);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (268114527, 'Packaging', to_date('10-03-2002', 'dd-mm-yyyy'), 961390047);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (632776873, 'AwaitingShipment', to_date('17-02-2014', 'dd-mm-yyyy'), 62379380);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (209403450, 'Processing', to_date('26-02-2017', 'dd-mm-yyyy'), 374084896);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (258546901, 'Shipped', to_date('26-03-2008', 'dd-mm-yyyy'), 354242777);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (551111993, 'Packaging', to_date('22-04-2020', 'dd-mm-yyyy'), 597514278);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (166900714, 'AwaitingPayment', to_date('07-02-2017', 'dd-mm-yyyy'), 603739842);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (126021436, 'ReadyforPickup', to_date('30-09-2010', 'dd-mm-yyyy'), 472354570);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (212112928, 'InTransit', to_date('24-01-2025', 'dd-mm-yyyy'), 719300252);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (286862740, 'ReturnedtoSender', to_date('23-10-2000', 'dd-mm-yyyy'), 744686974);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (505299671, 'OutforDelivery', to_date('15-12-2024', 'dd-mm-yyyy'), 664904645);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (913422893, 'Packaging', to_date('16-06-2023', 'dd-mm-yyyy'), 351119461);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (569297471, 'Delivered', to_date('18-09-2000', 'dd-mm-yyyy'), 153743714);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (857502507, 'Damaged', to_date('28-07-2000', 'dd-mm-yyyy'), 781478541);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (642449859, 'AttemptedDelivery', to_date('07-06-2009', 'dd-mm-yyyy'), 124236762);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (195925510, 'AwaitingShipment', to_date('10-02-2026', 'dd-mm-yyyy'), 117637234);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (551159271, 'OrderReceived', to_date('25-11-2001', 'dd-mm-yyyy'), 255313969);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (503980455, 'Delivered', to_date('11-11-2022', 'dd-mm-yyyy'), 579495883);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (927448727, 'Processing', to_date('21-10-2030', 'dd-mm-yyyy'), 509186975);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (101359723, 'Delivered', to_date('11-08-2027', 'dd-mm-yyyy'), 815317151);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (19444204, 'OutforDelivery', to_date('11-09-2001', 'dd-mm-yyyy'), 224153697);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (428409136, 'DeliveryFailed', to_date('05-07-2009', 'dd-mm-yyyy'), 549552636);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (29461976, 'PaymentConfirmed', to_date('10-04-2013', 'dd-mm-yyyy'), 568695140);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (248719913, 'OnHold', to_date('16-06-2017', 'dd-mm-yyyy'), 177021868);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (597311616, 'Delivered', to_date('25-11-2022', 'dd-mm-yyyy'), 408348291);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (535392367, 'Packaging', to_date('02-07-2007', 'dd-mm-yyyy'), 65389094);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (531008466, 'OutforDelivery', to_date('18-04-2020', 'dd-mm-yyyy'), 800241401);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (321736116, 'OutforDelivery', to_date('06-04-2011', 'dd-mm-yyyy'), 133225637);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (749728947, 'Delivered', to_date('13-06-2001', 'dd-mm-yyyy'), 554172508);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (872201202, 'OutforDelivery', to_date('17-07-2011', 'dd-mm-yyyy'), 547012693);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (32982538, 'InTransit', to_date('28-06-2015', 'dd-mm-yyyy'), 652359388);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (497521791, 'OrderReceived', to_date('05-03-2002', 'dd-mm-yyyy'), 792383619);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (987465668, 'ReadyforPickup', to_date('17-09-2029', 'dd-mm-yyyy'), 596600603);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (901545149, 'PickedUp', to_date('25-05-2026', 'dd-mm-yyyy'), 59489611);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (312794050, 'Canceled', to_date('05-07-2028', 'dd-mm-yyyy'), 106171803);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (966590091, 'Canceled', to_date('18-08-2024', 'dd-mm-yyyy'), 759962148);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (959812633, 'OutforDelivery', to_date('24-10-2028', 'dd-mm-yyyy'), 710325046);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (965308062, 'AttemptedDelivery', to_date('26-10-2008', 'dd-mm-yyyy'), 512953161);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (260875938, 'AwaitingShipment', to_date('10-02-2029', 'dd-mm-yyyy'), 546809789);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (605926120, 'Delivered', to_date('28-05-2007', 'dd-mm-yyyy'), 596057126);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (280695206, 'AwaitingPickup', to_date('06-02-2026', 'dd-mm-yyyy'), 944987867);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (738081458, 'OrderReceived', to_date('17-01-2021', 'dd-mm-yyyy'), 470473923);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (907364520, 'Delayed', to_date('05-10-2026', 'dd-mm-yyyy'), 451053085);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (537608934, 'InTransit', to_date('12-09-2004', 'dd-mm-yyyy'), 893866746);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (695689706, 'Canceled', to_date('03-03-2030', 'dd-mm-yyyy'), 366389133);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (398139643, 'Packaging', to_date('06-01-2020', 'dd-mm-yyyy'), 973639105);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (200437369, 'Delivered', to_date('05-07-2011', 'dd-mm-yyyy'), 588319047);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (362349794, 'Lost', to_date('02-02-2020', 'dd-mm-yyyy'), 603847885);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (329716523, 'InTransit', to_date('16-04-2004', 'dd-mm-yyyy'), 804219893);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (648288838, 'Delayed', to_date('30-07-2009', 'dd-mm-yyyy'), 572588497);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (928041225, 'ReadyforPickup', to_date('03-01-2010', 'dd-mm-yyyy'), 988601317);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (227297545, 'PickedUp', to_date('12-10-2025', 'dd-mm-yyyy'), 446063611);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (816686831, 'DeliveryFailed', to_date('02-06-2025', 'dd-mm-yyyy'), 805337368);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (161188506, 'AwaitingPayment', to_date('19-12-2004', 'dd-mm-yyyy'), 978519037);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (826560035, 'ReadyforPickup', to_date('08-01-2026', 'dd-mm-yyyy'), 798501887);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (800438139, 'AwaitingPickup', to_date('27-12-2027', 'dd-mm-yyyy'), 550458823);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (895995256, 'ReturnedtoSender', to_date('18-11-2012', 'dd-mm-yyyy'), 825739352);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (406749374, 'Processing', to_date('27-11-2018', 'dd-mm-yyyy'), 611948480);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (879565359, 'InTransit', to_date('31-05-2019', 'dd-mm-yyyy'), 519611001);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (919390223, 'Processing', to_date('19-10-2027', 'dd-mm-yyyy'), 487913724);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (565423181, 'Delayed', to_date('30-11-2000', 'dd-mm-yyyy'), 3559427);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (999252132, 'Canceled', to_date('27-10-2010', 'dd-mm-yyyy'), 737200868);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (561887842, 'Processing', to_date('20-03-2029', 'dd-mm-yyyy'), 477609634);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (328936409, 'Lost', to_date('30-10-2007', 'dd-mm-yyyy'), 787260560);
commit;
prompt 300 records committed...
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (998118263, 'AwaitingPickup', to_date('03-06-2016', 'dd-mm-yyyy'), 572090388);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (79726362, 'Packaging', to_date('31-08-2017', 'dd-mm-yyyy'), 34384593);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (710430975, 'OutforDelivery', to_date('11-09-2028', 'dd-mm-yyyy'), 589728367);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (798975875, 'DeliveryFailed', to_date('29-11-2028', 'dd-mm-yyyy'), 533702029);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (241262498, 'AwaitingPayment', to_date('14-06-2016', 'dd-mm-yyyy'), 76592836);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (883328392, 'PaymentConfirmed', to_date('26-02-2015', 'dd-mm-yyyy'), 49253606);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (418761123, 'Lost', to_date('27-04-2009', 'dd-mm-yyyy'), 780217178);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (153210079, 'AttemptedDelivery', to_date('18-03-2022', 'dd-mm-yyyy'), 233690997);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (560327262, 'ReadyforPickup', to_date('13-12-2030', 'dd-mm-yyyy'), 560457180);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (171281783, 'Packaging', to_date('25-08-2009', 'dd-mm-yyyy'), 603182544);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (74883513, 'Shipped', to_date('27-12-2025', 'dd-mm-yyyy'), 3568320);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (36611334, 'Shipped', to_date('16-07-2006', 'dd-mm-yyyy'), 693674427);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (947863173, 'AwaitingPayment', to_date('08-12-2019', 'dd-mm-yyyy'), 58875248);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (467487972, 'OutforDelivery', to_date('14-08-2020', 'dd-mm-yyyy'), 594100772);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (976750743, 'AwaitingShipment', to_date('02-12-2013', 'dd-mm-yyyy'), 147049999);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (543512055, 'PaymentConfirmed', to_date('14-02-2025', 'dd-mm-yyyy'), 427521663);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (493762843, 'Delayed', to_date('11-05-2000', 'dd-mm-yyyy'), 491732575);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (312941610, 'ReturnedtoSender', to_date('24-02-2011', 'dd-mm-yyyy'), 506221412);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (601642008, 'Processing', to_date('08-03-2016', 'dd-mm-yyyy'), 626347171);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (180208142, 'Packaging', to_date('21-09-2025', 'dd-mm-yyyy'), 543649717);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (121294776, 'Damaged', to_date('11-02-2002', 'dd-mm-yyyy'), 501899535);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (31103953, 'Lost', to_date('12-11-2025', 'dd-mm-yyyy'), 685009900);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (297474494, 'Delayed', to_date('31-07-2021', 'dd-mm-yyyy'), 9750344);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (674833230, 'OutforDelivery', to_date('13-02-2020', 'dd-mm-yyyy'), 77624168);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (449677851, 'Delayed', to_date('06-09-2005', 'dd-mm-yyyy'), 20742820);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (850699459, 'OnHold', to_date('13-11-2015', 'dd-mm-yyyy'), 994812657);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (208150529, 'Shipped', to_date('01-02-2001', 'dd-mm-yyyy'), 166977539);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (42771120, 'AwaitingPayment', to_date('28-09-2002', 'dd-mm-yyyy'), 727004712);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (848435238, 'OutforDelivery', to_date('22-07-2001', 'dd-mm-yyyy'), 697150986);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (201831903, 'AwaitingShipment', to_date('30-06-2009', 'dd-mm-yyyy'), 308445258);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (611465807, 'Processing', to_date('13-09-2029', 'dd-mm-yyyy'), 855586390);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (636470098, 'Canceled', to_date('14-02-2002', 'dd-mm-yyyy'), 695960687);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (605017117, 'Delivered', to_date('07-02-2023', 'dd-mm-yyyy'), 644427789);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (687067837, 'ReturnedtoSender', to_date('28-04-2022', 'dd-mm-yyyy'), 90329559);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (202638170, 'OrderReceived', to_date('26-05-2011', 'dd-mm-yyyy'), 775676071);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (398360509, 'OrderReceived', to_date('17-09-2005', 'dd-mm-yyyy'), 497885636);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (779109626, 'Lost', to_date('14-04-2025', 'dd-mm-yyyy'), 557416789);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (757748766, 'AwaitingPayment', to_date('30-01-2021', 'dd-mm-yyyy'), 404780867);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (866504121, 'OutforDelivery', to_date('28-06-2025', 'dd-mm-yyyy'), 557584288);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (671220785, 'Delivered', to_date('05-11-2020', 'dd-mm-yyyy'), 117236664);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (269617424, 'ReadyforPickup', to_date('14-05-2021', 'dd-mm-yyyy'), 476305335);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (781297440, 'Lost', to_date('05-05-2014', 'dd-mm-yyyy'), 36557042);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (75244610, 'DeliveryFailed', to_date('29-11-2009', 'dd-mm-yyyy'), 869381600);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (434574684, 'Damaged', to_date('03-10-2027', 'dd-mm-yyyy'), 739693447);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (647222172, 'OrderReceived', to_date('21-11-2006', 'dd-mm-yyyy'), 722415582);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (571851940, 'PickedUp', to_date('27-06-2025', 'dd-mm-yyyy'), 98834617);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (239759926, 'Packaging', to_date('13-02-2003', 'dd-mm-yyyy'), 686520084);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (797066071, 'Processing', to_date('25-08-2026', 'dd-mm-yyyy'), 771626857);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (387261730, 'Lost', to_date('10-01-2027', 'dd-mm-yyyy'), 30470247);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (236570216, 'Damaged', to_date('22-05-2021', 'dd-mm-yyyy'), 177682741);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (909872428, 'AttemptedDelivery', to_date('28-07-2023', 'dd-mm-yyyy'), 928290803);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (861676245, 'Damaged', to_date('18-08-2023', 'dd-mm-yyyy'), 374273610);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (674305264, 'Damaged', to_date('22-01-2008', 'dd-mm-yyyy'), 377244895);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (524417270, 'Delayed', to_date('04-10-2026', 'dd-mm-yyyy'), 698719894);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (760812015, 'ReturnedtoSender', to_date('02-04-2020', 'dd-mm-yyyy'), 993883372);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (909098523, 'OrderReceived', to_date('09-02-2025', 'dd-mm-yyyy'), 232814851);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (372468770, 'Shipped', to_date('21-08-2010', 'dd-mm-yyyy'), 330381310);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (329973702, 'OrderReceived', to_date('11-03-2010', 'dd-mm-yyyy'), 298319988);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (643603893, 'OnHold', to_date('19-11-2023', 'dd-mm-yyyy'), 758992323);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (345855702, 'AwaitingPayment', to_date('28-05-2007', 'dd-mm-yyyy'), 135231662);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (975538712, 'AwaitingPayment', to_date('03-09-2003', 'dd-mm-yyyy'), 321241789);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (184453720, 'Canceled', to_date('23-03-2011', 'dd-mm-yyyy'), 202783445);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (713852406, 'AwaitingPickup', to_date('11-08-2006', 'dd-mm-yyyy'), 628600454);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (228277140, 'AttemptedDelivery', to_date('28-11-2003', 'dd-mm-yyyy'), 721293901);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (393544263, 'DeliveryFailed', to_date('26-05-2004', 'dd-mm-yyyy'), 576563496);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (751174911, 'InTransit', to_date('18-05-2012', 'dd-mm-yyyy'), 435483177);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (80776691, 'DeliveryFailed', to_date('15-02-2001', 'dd-mm-yyyy'), 857964382);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (95890874, 'Canceled', to_date('12-11-2004', 'dd-mm-yyyy'), 3719936);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (671315820, 'OnHold', to_date('07-08-2028', 'dd-mm-yyyy'), 250713580);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (284783860, 'Processing', to_date('19-11-2006', 'dd-mm-yyyy'), 290383382);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (785019509, 'PickedUp', to_date('20-06-2008', 'dd-mm-yyyy'), 79899163);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (126950072, 'ReturnedtoSender', to_date('10-11-2027', 'dd-mm-yyyy'), 733217108);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (14466645, 'AwaitingPayment', to_date('08-07-2011', 'dd-mm-yyyy'), 862916677);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (122820495, 'OutforDelivery', to_date('03-11-2019', 'dd-mm-yyyy'), 859228917);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (969679265, 'AwaitingPayment', to_date('31-08-2028', 'dd-mm-yyyy'), 471573222);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (102691838, 'Damaged', to_date('28-12-2024', 'dd-mm-yyyy'), 617857020);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (808132067, 'Packaging', to_date('26-08-2010', 'dd-mm-yyyy'), 68831150);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (495285961, 'Delayed', to_date('19-10-2021', 'dd-mm-yyyy'), 856928435);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (629866583, 'Delayed', to_date('29-08-2004', 'dd-mm-yyyy'), 682647633);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (18447993, 'Delivered', to_date('29-05-2005', 'dd-mm-yyyy'), 464145195);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (592663017, 'AwaitingPayment', to_date('11-03-2012', 'dd-mm-yyyy'), 136157547);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (477924694, 'AwaitingPayment', to_date('08-07-2024', 'dd-mm-yyyy'), 662739749);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (947051626, 'Processing', to_date('27-01-2020', 'dd-mm-yyyy'), 473765382);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (289459231, 'Processing', to_date('28-07-2000', 'dd-mm-yyyy'), 906843751);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (677551768, 'Processing', to_date('27-01-2012', 'dd-mm-yyyy'), 283963005);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (451020958, 'OnHold', to_date('30-06-2021', 'dd-mm-yyyy'), 92057408);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (658898641, 'Canceled', to_date('15-04-2030', 'dd-mm-yyyy'), 630030334);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (563496790, 'OnHold', to_date('14-02-2005', 'dd-mm-yyyy'), 713326269);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (33775453, 'PickedUp', to_date('13-03-2005', 'dd-mm-yyyy'), 265895682);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (100964575, 'Delayed', to_date('31-10-2022', 'dd-mm-yyyy'), 71558043);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (486845524, 'AttemptedDelivery', to_date('01-01-2008', 'dd-mm-yyyy'), 782517633);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (239986191, 'AttemptedDelivery', to_date('01-02-2022', 'dd-mm-yyyy'), 939716730);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (518354641, 'AttemptedDelivery', to_date('09-02-2015', 'dd-mm-yyyy'), 543444956);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (506112680, 'Delivered', to_date('10-02-2028', 'dd-mm-yyyy'), 801831686);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (850429984, 'Delivered', to_date('01-05-2030', 'dd-mm-yyyy'), 821679082);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (370907172, 'Packaging', to_date('02-11-2009', 'dd-mm-yyyy'), 757571536);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (279066083, 'Lost', to_date('07-11-2002', 'dd-mm-yyyy'), 110717978);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (443787644, 'Canceled', to_date('14-04-2009', 'dd-mm-yyyy'), 944593121);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (279391852, 'Processing', to_date('09-09-2013', 'dd-mm-yyyy'), 567591573);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (279707023, 'OnHold', to_date('06-01-2013', 'dd-mm-yyyy'), 520460997);
commit;
prompt 400 records committed...
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (816453596, 'DeliveryFailed', to_date('02-01-2025', 'dd-mm-yyyy'), 851802090);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (710404488, 'InTransit', to_date('22-04-2022', 'dd-mm-yyyy'), 255310381);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (571392445, 'Packaging', to_date('11-11-2008', 'dd-mm-yyyy'), 631119749);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (677002381, 'PickedUp', to_date('28-02-2000', 'dd-mm-yyyy'), 952923472);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (968116472, 'PickedUp', to_date('23-10-2027', 'dd-mm-yyyy'), 988666139);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (935507432, 'Canceled', to_date('22-07-2013', 'dd-mm-yyyy'), 735380075);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (922533647, 'InTransit', to_date('19-05-2009', 'dd-mm-yyyy'), 968119630);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (456414233, 'Processing', to_date('24-06-2024', 'dd-mm-yyyy'), 347580048);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (757299496, 'Damaged', to_date('05-05-2013', 'dd-mm-yyyy'), 574033117);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (241273696, 'PickedUp', to_date('28-03-2006', 'dd-mm-yyyy'), 694758482);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (512477564, 'Packaging', to_date('22-02-2023', 'dd-mm-yyyy'), 650566673);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (444990279, 'Damaged', to_date('20-11-2013', 'dd-mm-yyyy'), 612402527);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (562805227, 'AwaitingPickup', to_date('20-07-2025', 'dd-mm-yyyy'), 634634560);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (327785983, 'Delayed', to_date('07-12-2028', 'dd-mm-yyyy'), 436514206);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (534470534, 'Canceled', to_date('17-10-2008', 'dd-mm-yyyy'), 483890780);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (168127030, 'OutforDelivery', to_date('28-12-2016', 'dd-mm-yyyy'), 834318574);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (933853156, 'DeliveryFailed', to_date('09-02-2019', 'dd-mm-yyyy'), 778359024);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (105688744, 'AwaitingPickup', to_date('04-07-2025', 'dd-mm-yyyy'), 320991254);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (510568173, 'Shipped', to_date('22-09-2024', 'dd-mm-yyyy'), 50952234);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (617654662, 'OutforDelivery', to_date('29-09-2019', 'dd-mm-yyyy'), 730507007);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (137358588, 'AwaitingPickup', to_date('29-12-2003', 'dd-mm-yyyy'), 569367284);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (173714361, 'ReturnedtoSender', to_date('20-09-2023', 'dd-mm-yyyy'), 958874023);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (735781187, 'AwaitingPayment', to_date('26-09-2011', 'dd-mm-yyyy'), 372399632);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (928886588, 'Packaging', to_date('08-06-2007', 'dd-mm-yyyy'), 881550437);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (625627223, 'OutforDelivery', to_date('11-11-2011', 'dd-mm-yyyy'), 171569151);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (685209095, 'AwaitingPickup', to_date('14-12-2027', 'dd-mm-yyyy'), 952138335);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (221496303, 'Delivered', to_date('09-04-2020', 'dd-mm-yyyy'), 121432782);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (660386116, 'Delayed', to_date('26-03-2017', 'dd-mm-yyyy'), 316595208);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (785241786, 'ReturnedtoSender', to_date('03-02-2011', 'dd-mm-yyyy'), 6704962);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (823604629, 'AwaitingShipment', to_date('22-03-2014', 'dd-mm-yyyy'), 484930729);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (504788043, 'InTransit', to_date('11-06-2020', 'dd-mm-yyyy'), 458417974);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (464924472, 'AwaitingPickup', to_date('06-09-2027', 'dd-mm-yyyy'), 217256349);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (711288214, 'Delayed', to_date('03-06-2010', 'dd-mm-yyyy'), 721688496);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (271912352, 'AwaitingPickup', to_date('22-12-2007', 'dd-mm-yyyy'), 50055848);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (500383655, 'Damaged', to_date('07-02-2027', 'dd-mm-yyyy'), 290559328);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (30838049, 'Delivered', to_date('12-09-2004', 'dd-mm-yyyy'), 123456368);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (86450874, 'OutforDelivery', to_date('11-07-2005', 'dd-mm-yyyy'), 268924335);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (639049681, 'AttemptedDelivery', to_date('10-11-2004', 'dd-mm-yyyy'), 946188340);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (593201890, 'DeliveryFailed', to_date('07-07-2013', 'dd-mm-yyyy'), 139827450);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (541198735, 'Damaged', to_date('08-07-2014', 'dd-mm-yyyy'), 114571110);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (92177958, 'Delayed', to_date('29-09-2028', 'dd-mm-yyyy'), 936696442);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (260920743, 'ReturnedtoSender', to_date('25-07-2000', 'dd-mm-yyyy'), 233777116);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (577338385, 'AwaitingPayment', to_date('22-12-2019', 'dd-mm-yyyy'), 804029926);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (246160419, 'OrderReceived', to_date('18-10-2017', 'dd-mm-yyyy'), 940034758);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (296336709, 'Delayed', to_date('14-01-2015', 'dd-mm-yyyy'), 513140717);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (952345616, 'Processing', to_date('27-11-2028', 'dd-mm-yyyy'), 585899415);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (230232011, 'AwaitingShipment', to_date('03-02-2016', 'dd-mm-yyyy'), 632371458);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (159657389, 'AwaitingPayment', to_date('28-05-2010', 'dd-mm-yyyy'), 214209410);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (10354527, 'OutforDelivery', to_date('04-04-2001', 'dd-mm-yyyy'), 623375199);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (618381362, 'Shipped', to_date('18-04-2021', 'dd-mm-yyyy'), 596858560);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (822009332, 'ReturnedtoSender', to_date('13-05-2010', 'dd-mm-yyyy'), 118475647);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (79201875, 'OrderReceived', to_date('11-11-2002', 'dd-mm-yyyy'), 130945021);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (621146194, 'AttemptedDelivery', to_date('30-06-2018', 'dd-mm-yyyy'), 90908276);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (249764386, 'DeliveryFailed', to_date('12-11-2030', 'dd-mm-yyyy'), 464944035);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (641985537, 'AwaitingPickup', to_date('20-02-2021', 'dd-mm-yyyy'), 822002397);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (716394240, 'AwaitingPickup', to_date('06-04-2015', 'dd-mm-yyyy'), 600178114);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (108296159, 'PickedUp', to_date('18-05-2008', 'dd-mm-yyyy'), 786332167);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (691240895, 'OrderReceived', to_date('21-12-2008', 'dd-mm-yyyy'), 283200270);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (452561778, 'ReadyforPickup', to_date('14-04-2027', 'dd-mm-yyyy'), 332883077);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (953024161, 'Damaged', to_date('14-04-2021', 'dd-mm-yyyy'), 876993532);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (160936436, 'Packaging', to_date('17-05-2019', 'dd-mm-yyyy'), 910304063);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (689574319, 'PickedUp', to_date('13-04-2000', 'dd-mm-yyyy'), 965238249);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (625254708, 'AttemptedDelivery', to_date('11-06-2012', 'dd-mm-yyyy'), 442075679);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (27980305, 'OutforDelivery', to_date('28-03-2019', 'dd-mm-yyyy'), 617344527);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (58533328, 'OrderReceived', to_date('15-11-2004', 'dd-mm-yyyy'), 568384995);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (523067053, 'Packaging', to_date('23-12-2003', 'dd-mm-yyyy'), 904161703);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (901397137, 'Canceled', to_date('04-09-2005', 'dd-mm-yyyy'), 992494804);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (780978100, 'Damaged', to_date('27-09-2000', 'dd-mm-yyyy'), 173238993);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (848302830, 'Lost', to_date('25-08-2027', 'dd-mm-yyyy'), 38178459);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (281136368, 'DeliveryFailed', to_date('05-01-2007', 'dd-mm-yyyy'), 67209238);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (76762557, 'Shipped', to_date('26-11-2028', 'dd-mm-yyyy'), 850294879);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (382114368, 'AttemptedDelivery', to_date('21-03-2000', 'dd-mm-yyyy'), 895532177);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (296214848, 'AttemptedDelivery', to_date('04-03-2009', 'dd-mm-yyyy'), 994893233);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (48393636, 'OnHold', to_date('06-04-2024', 'dd-mm-yyyy'), 566843828);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (619250143, 'OrderReceived', to_date('11-02-2027', 'dd-mm-yyyy'), 369296479);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (669114933, 'Shipped', to_date('10-10-2009', 'dd-mm-yyyy'), 391203824);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (738514145, 'Lost', to_date('25-09-2028', 'dd-mm-yyyy'), 723951031);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (899649109, 'OnHold', to_date('14-03-2009', 'dd-mm-yyyy'), 218477177);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (486028629, 'AttemptedDelivery', to_date('18-06-2002', 'dd-mm-yyyy'), 442774733);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (848584643, 'InTransit', to_date('03-10-2013', 'dd-mm-yyyy'), 312125671);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (495787410, 'AttemptedDelivery', to_date('23-08-2015', 'dd-mm-yyyy'), 672039858);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (299023803, 'AwaitingPickup', to_date('25-02-2015', 'dd-mm-yyyy'), 168559157);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (479431245, 'Damaged', to_date('07-07-2012', 'dd-mm-yyyy'), 870770849);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (690473172, 'Packaging', to_date('14-11-2002', 'dd-mm-yyyy'), 191220474);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (485079930, 'AwaitingPayment', to_date('04-04-2022', 'dd-mm-yyyy'), 19126397);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (136486235, 'OrderReceived', to_date('21-02-2026', 'dd-mm-yyyy'), 440780791);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (26017048, 'ReturnedtoSender', to_date('03-09-2030', 'dd-mm-yyyy'), 83938648);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (195136916, 'Canceled', to_date('07-05-2028', 'dd-mm-yyyy'), 721207030);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (964163982, 'AwaitingPayment', to_date('06-12-2009', 'dd-mm-yyyy'), 555621587);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (985901847, 'Damaged', to_date('22-03-2027', 'dd-mm-yyyy'), 533247878);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (615452779, 'Processing', to_date('17-04-2005', 'dd-mm-yyyy'), 191421024);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (104679052, 'Lost', to_date('21-11-2020', 'dd-mm-yyyy'), 695145415);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (744280409, 'ReadyforPickup', to_date('02-04-2028', 'dd-mm-yyyy'), 745802224);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (478130968, 'AwaitingShipment', to_date('26-12-2007', 'dd-mm-yyyy'), 268587294);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (497940357, 'Lost', to_date('12-01-2004', 'dd-mm-yyyy'), 259237484);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (55687186, 'AwaitingPickup', to_date('25-09-2024', 'dd-mm-yyyy'), 794740915);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (769547431, 'AwaitingPayment', to_date('26-12-2027', 'dd-mm-yyyy'), 847664668);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (272346946, 'ReadyforPickup', to_date('05-04-2013', 'dd-mm-yyyy'), 709984281);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (896161191, 'Packaging', to_date('10-06-2016', 'dd-mm-yyyy'), 958585013);
insert into DELIVERY (delivery_num, status, delivery_date, id)
values (137392037, 'InTransit', to_date('25-12-2003', 'dd-mm-yyyy'), 748921375);
commit;
prompt 500 records loaded
prompt Loading SHEKEM...
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArmoredCorps', 747814, 562329);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachEngineering', 404678, 757263);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('ArielSharonCamp', 46492, 119680);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Kirya', 918882, 808309);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArmoredCorps', 835158, 573305);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp7', 512856, 430570);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit8200Base', 771672, 647631);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachKfir', 495176, 966827);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit8200Base', 794650, 15801);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('EilatNavalBase', 227942, 196801);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('NevatimAirbase', 646209, 916628);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp1', 375208, 766730);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzrifinBase', 36688, 842632);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachTzanchanim', 555809, 72369);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Bahad1', 915664, 727855);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp80', 965410, 99323);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelHashomerBase', 1377, 846655);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('PalmachimAirbase', 567128, 603803);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachGolani', 249018, 635277);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachNachal', 216089, 562690);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArtillery', 709289, 381515);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('OfficerTrainingSchool', 336930, 148346);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachTzanchanim', 902768, 198407);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp3', 423857, 235610);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Shayetet13Base', 954574, 586464);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzeelimTrainingBase', 104117, 600730);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzeelimTrainingBase', 309688, 171938);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachGivati', 753048, 307850);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SdeDovAirport', 178432, 782141);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp80', 721523, 692237);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('AshdodNavalBase', 90392, 880637);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('KiryatMalakhiLogisticsBase', 835498, 566132);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp1', 819566, 201391);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelNofAirbase', 514715, 956451);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('EilatNavalBase', 669599, 24916);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArtillery', 86278, 809999);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachEngineering', 402617, 880511);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('NevatimAirbase', 26317, 503347);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HaifaNavalBase', 878965, 994826);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachNachal', 202460, 128002);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp80', 776699, 513202);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelAviv', 29372, 900080);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp3', 852015, 145395);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzeelimTrainingBase', 302605, 12924);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp21', 246156, 1965);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzrifinBase', 980376, 527819);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachTzanchanim', 929595, 781377);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp3', 749326, 324886);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp7', 800998, 581812);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArmoredCorps', 332175, 149363);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp14', 342218, 778510);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelNofAirbase', 589790, 325460);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SdeDovAirport', 31963, 330525);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp16', 144328, 662536);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SdeDovAirport', 553442, 252963);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachKfir', 198343, 468906);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzeelimTrainingBase', 950646, 985957);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('RamatDavidAirbase', 866480, 694572);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('OfficerTrainingSchool', 224207, 285093);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GlilotBase', 220923, 377884);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('PalmachimAirbase', 83204, 140085);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit81Base', 426630, 464159);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('ArielSharonCamp', 477692, 102388);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArmoredCorps', 918536, 803397);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SayeretMatkalTrainingBase', 787557, 377783);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('EilatNavalBase', 824502, 249902);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('OfficerTrainingSchool', 707711, 608211);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelHashomerBase', 730761, 364155);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelHashomerBase', 984720, 633397);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelAviv', 854532, 756599);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HatzorAirbase', 235197, 939591);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit8200Base', 706204, 331467);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('OfficerTrainingSchool', 537899, 89035);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachGivati', 640054, 869672);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HaifaNavalBase', 259586, 541518);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelNofAirbase', 939397, 228806);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelNofAirbase', 785594, 107731);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('OfficerTrainingSchool', 124710, 824634);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Kirya', 898675, 357091);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GeneralStaffHeadquarters', 214408, 536154);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit8200Base', 30974, 468040);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SayeretMatkalTrainingBase', 27622, 637909);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzrifinBase', 584952, 100511);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GlilotBase', 619045, 464200);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp14', 288814, 231191);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp1', 367209, 511770);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp7', 163293, 858889);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp6', 849759, 253431);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('OfficerTrainingSchool', 561038, 738757);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Shayetet13Base', 988718, 330557);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp16', 38715, 48731);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('AshdodNavalBase', 182079, 262891);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HatzerimAirbase', 115763, 345732);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('NevatimAirbase', 813595, 665574);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachEngineering', 822002, 318486);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GlilotBase', 53734, 119965);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp6', 861980, 54881);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SayeretMatkalTrainingBase', 702657, 688839);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SdeDovAirport', 179442, 590212);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelHashomerBase', 390633, 673181);
commit;
prompt 100 records committed...
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Kirya', 598513, 791112);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp14', 475710, 956222);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HatzorAirbase', 890809, 836504);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArmoredCorps', 99473, 699645);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp21', 416923, 869142);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('PalmachimAirbase', 357050, 473984);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelHashomerBase', 98055, 699801);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('AshdodNavalBase', 936852, 23212);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit8200Base', 69195, 736114);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachTzanchanim', 85921, 136582);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachGivati', 278807, 916870);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArmoredCorps', 775780, 317257);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp7', 61503, 980659);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp14', 506073, 344159);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp14', 444711, 845646);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Bahad1', 964677, 940415);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelHashomerBase', 934093, 552405);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit8200Base', 380225, 33272);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('ArielSharonCamp', 603074, 181711);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('RamatDavidAirbase', 955685, 659113);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('RamatDavidAirbase', 166411, 455207);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachGolani', 834044, 835718);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzrifinBase', 232522, 280729);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzrifinBase', 120096, 992279);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachGolani', 6281, 182997);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachEngineering', 910236, 510717);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelHashomerBase', 862350, 517486);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('NevatimAirbase', 870935, 935828);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('OfficerTrainingSchool', 333533, 266806);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp16', 277250, 3635);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp21', 683722, 285231);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('KiryatMalakhiLogisticsBase', 311430, 331657);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Kirya', 534431, 890854);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp14', 117546, 233436);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelNofAirbase', 822088, 268927);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArmoredCorps', 182540, 765542);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('RamatDavidAirbase', 9775, 10114);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp14', 112131, 456188);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp16', 67018, 562377);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachNachal', 21822, 939878);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp14', 946871, 124876);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp6', 385915, 817896);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('AshdodNavalBase', 868389, 163087);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelHashomerBase', 911795, 626230);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SayeretMatkalTrainingBase', 111963, 769246);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SdeDovAirport', 890952, 401990);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('RamatDavidAirbase', 6884, 696755);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('OfficerTrainingSchool', 235796, 667749);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('ArielSharonCamp', 510914, 924606);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SayeretMatkalTrainingBase', 355764, 841559);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp3', 92578, 7996);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelNofAirbase', 691892, 973216);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachTzanchanim', 34806, 728240);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit8200Base', 341455, 846479);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp3', 470253, 599564);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('RamatDavidAirbase', 825788, 775700);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('NevatimAirbase', 206434, 574110);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzeelimTrainingBase', 680665, 347368);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit81Base', 494341, 730631);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit81Base', 449564, 582340);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('NevatimAirbase', 531168, 538653);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('KiryatMalakhiLogisticsBase', 809984, 788748);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('EilatNavalBase', 936634, 106293);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp80', 506461, 325353);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzrifinBase', 723754, 259750);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HatzerimAirbase', 659905, 212127);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelAviv', 125991, 861155);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachGolani', 119379, 296304);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelNofAirbase', 541579, 51204);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SayeretMatkalTrainingBase', 806906, 757501);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit81Base', 13565, 743278);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GeneralStaffHeadquarters', 704294, 463997);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('OfficerTrainingSchool', 994313, 771690);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HaifaNavalBase', 473878, 660322);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SayeretMatkalTrainingBase', 626949, 374119);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp21', 789811, 380529);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('ArielSharonCamp', 605339, 127606);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HaifaNavalBase', 312840, 331801);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp14', 654538, 214955);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzeelimTrainingBase', 67634, 330975);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzrifinBase', 472186, 858323);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('EilatNavalBase', 945198, 49556);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp3', 612827, 907413);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp16', 893177, 510330);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('RamatDavidAirbase', 446882, 390179);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzrifinBase', 662787, 838476);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachKfir', 187103, 148022);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachTzanchanim', 159698, 419568);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('NevatimAirbase', 654899, 402823);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Bahad1', 453313, 85446);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Shayetet13Base', 32118, 866429);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp3', 783786, 801104);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HatzorAirbase', 234507, 197145);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachNachal', 494340, 14446);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp16', 326682, 654424);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp14', 32399, 24761);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('NevatimAirbase', 567171, 112184);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp1', 746984, 252548);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('ArielSharonCamp', 934668, 57574);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelAviv', 766176, 532569);
commit;
prompt 200 records committed...
insert into SHEKEM (base_name, shekem_num, base_num)
values ('EilatNavalBase', 852776, 449198);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp3', 54537, 312574);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachEngineering', 781711, 631905);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit8200Base', 463791, 670065);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArtillery', 944486, 799136);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit8200Base', 678984, 151734);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArtillery', 828748, 699497);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp1', 407393, 584560);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HaifaNavalBase', 909445, 213627);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SdeDovAirport', 634115, 529131);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp6', 597469, 787841);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp21', 211566, 619141);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit8200Base', 773548, 994341);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('PalmachimAirbase', 156762, 300515);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('PalmachimAirbase', 163511, 374846);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Shayetet13Base', 49448, 643985);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp14', 714421, 165071);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GeneralStaffHeadquarters', 255560, 182543);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('PalmachimAirbase', 428126, 950340);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GlilotBase', 978599, 645061);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HatzerimAirbase', 727827, 615528);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit81Base', 252409, 936391);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzeelimTrainingBase', 458375, 788910);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Bahad1', 855109, 468560);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp6', 259254, 846566);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GeneralStaffHeadquarters', 713863, 41577);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit8200Base', 602079, 168555);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HatzerimAirbase', 964228, 543787);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp6', 174595, 628667);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('PalmachimAirbase', 265983, 114810);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachEngineering', 194256, 456347);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('RamatDavidAirbase', 509566, 755471);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzeelimTrainingBase', 954673, 144190);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Shayetet13Base', 60217, 680303);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('RamatDavidAirbase', 350312, 549076);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachNachal', 453024, 582094);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit8200Base', 986327, 27346);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('NevatimAirbase', 639525, 674374);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HaifaNavalBase', 684100, 943764);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp21', 224921, 503716);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachNachal', 306020, 343092);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachGivati', 434188, 301909);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp1', 258417, 977034);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp6', 880920, 545479);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GlilotBase', 540901, 900931);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Bahad1', 850426, 420419);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp14', 624180, 152069);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachEngineering', 436659, 992049);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('KiryatMalakhiLogisticsBase', 873452, 156918);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('NevatimAirbase', 75849, 627328);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArtillery', 32784, 474232);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit8200Base', 637105, 789192);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachTzanchanim', 487546, 212108);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachGivati', 639021, 674624);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzrifinBase', 146053, 921087);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachTzanchanim', 897814, 378589);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('AshdodNavalBase', 858926, 62035);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArtillery', 362001, 929160);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelAviv', 54887, 108985);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachKfir', 615120, 73401);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('RamatDavidAirbase', 795166, 797123);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('RamatDavidAirbase', 365167, 669602);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('KiryatMalakhiLogisticsBase', 426026, 433885);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp7', 828501, 862380);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Shayetet13Base', 294982, 342971);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('EilatNavalBase', 832018, 368968);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachEngineering', 823981, 616993);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Kirya', 505657, 102788);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzrifinBase', 169492, 817869);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArtillery', 385400, 259425);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachEngineering', 530960, 257344);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachKfir', 370765, 744688);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp14', 21345, 569234);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HatzerimAirbase', 551870, 748702);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('AshdodNavalBase', 295612, 996162);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp3', 418104, 265603);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('RamatDavidAirbase', 53907, 552808);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachKfir', 880761, 159965);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GeneralStaffHeadquarters', 658611, 445250);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('EilatNavalBase', 762459, 838907);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('OfficerTrainingSchool', 825133, 839550);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HatzerimAirbase', 786579, 339132);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp14', 960070, 50218);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelNofAirbase', 464219, 366798);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('EilatNavalBase', 401700, 737798);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Shayetet13Base', 688844, 384688);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Kirya', 105059, 911339);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('ArielSharonCamp', 728265, 762364);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelAviv', 674568, 867216);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('RamatDavidAirbase', 445570, 324798);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp1', 167604, 571396);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzrifinBase', 206281, 852361);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GlilotBase', 862693, 384170);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Kirya', 205387, 680795);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('KiryatMalakhiLogisticsBase', 903976, 892376);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelNofAirbase', 116562, 177465);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArtillery', 302032, 21511);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp1', 416781, 826580);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('PalmachimAirbase', 944851, 564986);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachEngineering', 820599, 700777);
commit;
prompt 300 records committed...
insert into SHEKEM (base_name, shekem_num, base_num)
values ('AshdodNavalBase', 564329, 519779);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp16', 30282, 555701);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachGolani', 907451, 840310);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzrifinBase', 587751, 812072);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp6', 558498, 111093);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachTzanchanim', 202872, 314765);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SdeDovAirport', 765825, 257191);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HatzorAirbase', 593333, 232886);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HaifaNavalBase', 457324, 797235);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Bahad1', 115298, 536855);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzrifinBase', 534968, 27148);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachEngineering', 467896, 904219);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('NevatimAirbase', 726939, 170224);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp6', 891043, 619036);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelNofAirbase', 500441, 184717);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('KiryatMalakhiLogisticsBase', 40200, 442314);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('RamatDavidAirbase', 111503, 817114);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Bahad1', 821401, 420286);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('RamatDavidAirbase', 902709, 147064);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp16', 926701, 639301);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Bahad1', 877710, 700548);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp3', 73382, 731750);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('RamatDavidAirbase', 838693, 13947);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp21', 459731, 182313);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GlilotBase', 471559, 280253);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SayeretMatkalTrainingBase', 186507, 771679);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('OfficerTrainingSchool', 168940, 928324);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachKfir', 735853, 204754);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SayeretMatkalTrainingBase', 933449, 516706);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachEngineering', 772487, 49675);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp21', 123815, 106856);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('NevatimAirbase', 626780, 267415);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachNachal', 353815, 23640);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp3', 333527, 764217);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelNofAirbase', 777634, 578459);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('ArielSharonCamp', 399955, 263562);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArtillery', 975287, 766209);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit81Base', 16536, 145422);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('AshdodNavalBase', 758846, 45506);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HatzorAirbase', 353601, 871302);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachTzanchanim', 67910, 824299);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('NevatimAirbase', 410160, 199739);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HaifaNavalBase', 881509, 504058);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArtillery', 189226, 596849);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp80', 343421, 76246);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachGolani', 100245, 182916);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachKfir', 482899, 448183);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelHashomerBase', 666022, 678808);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp3', 17527, 1774);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GlilotBase', 29474, 527367);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('OfficerTrainingSchool', 320651, 730377);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Bahad1', 669525, 667697);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp1', 667026, 200327);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp21', 871088, 518993);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzrifinBase', 437234, 37085);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HatzerimAirbase', 148413, 828179);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzrifinBase', 482641, 293593);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('OfficerTrainingSchool', 6059, 12198);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('AshdodNavalBase', 369488, 564534);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachTzanchanim', 423443, 702027);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('EilatNavalBase', 461499, 86074);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SayeretMatkalTrainingBase', 189157, 219804);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('ArielSharonCamp', 300345, 41428);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('NevatimAirbase', 42429, 478962);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp7', 362745, 818969);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelHashomerBase', 185155, 997417);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit8200Base', 522565, 343091);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelHashomerBase', 522483, 373778);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('EilatNavalBase', 126293, 404026);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('RamatDavidAirbase', 594348, 542177);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SayeretMatkalTrainingBase', 300686, 319541);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit81Base', 733741, 135620);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp7', 607022, 438966);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp16', 86497, 159414);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachKfir', 641353, 287049);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HaifaNavalBase', 719600, 510798);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SayeretMatkalTrainingBase', 669718, 850190);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelAviv', 213758, 276924);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit81Base', 840988, 710886);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('ArielSharonCamp', 495164, 634124);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp80', 852890, 273005);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Shayetet13Base', 433289, 257510);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit8200Base', 217552, 414331);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('PalmachimAirbase', 772538, 781680);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArtillery', 463067, 284737);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzeelimTrainingBase', 934906, 570913);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp14', 782140, 941013);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('OfficerTrainingSchool', 135537, 440529);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArtillery', 98391, 378824);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp1', 945179, 130908);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelAviv', 677788, 938147);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachKfir', 595804, 690431);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit81Base', 95394, 856617);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp3', 878781, 302536);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachEngineering', 484227, 798523);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('EilatNavalBase', 573448, 209667);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelHashomerBase', 286585, 929329);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('NevatimAirbase', 924261, 538474);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit81Base', 676549, 570852);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('RamatDavidAirbase', 895850, 992474);
commit;
prompt 400 records committed...
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArmoredCorps', 945055, 45081);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachGivati', 121857, 968239);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('KiryatMalakhiLogisticsBase', 93569, 405804);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp16', 69289, 249953);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp14', 995631, 261274);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HatzorAirbase', 897319, 260083);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp6', 60114, 838461);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachGivati', 973668, 469297);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelAviv', 132149, 391307);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HatzerimAirbase', 243176, 889231);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzrifinBase', 604098, 405905);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelHashomerBase', 210587, 201395);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelNofAirbase', 353172, 611140);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('RamatDavidAirbase', 780847, 764800);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachGolani', 494111, 61349);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Shayetet13Base', 148848, 358366);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp3', 480529, 360812);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachGolani', 901196, 612156);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GlilotBase', 773916, 639667);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelAviv', 861376, 456769);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachTzanchanim', 492865, 683905);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachTzanchanim', 314852, 531361);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('EilatNavalBase', 129818, 932814);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('NevatimAirbase', 576820, 175928);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HatzerimAirbase', 885130, 437224);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('OfficerTrainingSchool', 116470, 857384);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp80', 421324, 869648);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('KiryatMalakhiLogisticsBase', 612115, 781578);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GeneralStaffHeadquarters', 701180, 151814);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelAviv', 78497, 182706);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GeneralStaffHeadquarters', 870232, 169256);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('ArielSharonCamp', 105361, 710037);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('OfficerTrainingSchool', 932946, 821596);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HaifaNavalBase', 285989, 614598);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HatzorAirbase', 240346, 757204);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachGivati', 339089, 637390);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp21', 827429, 7601);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachGolani', 278016, 995168);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GlilotBase', 100590, 812058);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp21', 172760, 552353);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp7', 660801, 561549);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArtillery', 771092, 292268);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelHashomerBase', 806208, 339863);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelHashomerBase', 324604, 2481);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('AshdodNavalBase', 777092, 24210);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachTzanchanim', 963178, 670230);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Shayetet13Base', 958851, 398425);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp16', 895789, 274607);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('OfficerTrainingSchool', 133291, 632096);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GlilotBase', 505247, 18429);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit81Base', 278261, 499550);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp7', 342568, 796977);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArmoredCorps', 905496, 251868);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachKfir', 7226, 233513);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp7', 964981, 980887);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp6', 648401, 887076);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp80', 141170, 103309);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachEngineering', 556726, 77197);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachGolani', 356194, 185801);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GlilotBase', 173567, 104018);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('EilatNavalBase', 327997, 308054);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit8200Base', 573374, 590150);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Bahad1', 960282, 166411);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('KiryatMalakhiLogisticsBase', 860861, 485235);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('PalmachimAirbase', 195052, 391025);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelAviv', 924702, 73935);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HaifaNavalBase', 51546, 826869);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzeelimTrainingBase', 526590, 168567);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Bahad1', 408311, 590796);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachGivati', 678942, 921303);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArmoredCorps', 292797, 895336);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelHashomerBase', 518538, 880423);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HaifaNavalBase', 90109, 417794);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachArtillery', 979697, 700593);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit81Base', 831820, 232341);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzeelimTrainingBase', 750094, 859321);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('HatzerimAirbase', 31520, 258608);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp7', 815753, 144094);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachKfir', 929827, 50585);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp1', 506918, 753552);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TzeelimTrainingBase', 122076, 643585);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('KiryatMalakhiLogisticsBase', 520028, 17029);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachKfir', 556444, 5545);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachTzanchanim', 68336, 938469);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('EilatNavalBase', 596328, 827814);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SayeretMatkalTrainingBase', 515523, 179413);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SdeDovAirport', 934156, 432675);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('EilatNavalBase', 260659, 71289);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SdeDovAirport', 543392, 742987);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('EilatNavalBase', 809238, 88077);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SayeretMatkalTrainingBase', 179903, 836414);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('SdeDovAirport', 865569, 714482);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('KiryatMalakhiLogisticsBase', 577013, 23832);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Camp7', 155408, 87370);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('NevatimAirbase', 594795, 17780);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('Unit8200Base', 430268, 294573);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('TelHashomerBase', 288285, 380652);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('GeneralStaffHeadquarters', 188285, 593789);
insert into SHEKEM (base_name, shekem_num, base_num)
values ('BachEngineering', 326401, 310684);
commit;
prompt 499 records loaded
prompt Loading BRINGS_TO...
prompt Table is empty
prompt Loading DEVICE...
insert into DEVICE (name, id, price)
values ('Wiko Bloom2', 1, 1325.33);
insert into DEVICE (name, id, price)
values ('iNQ Cloud Touch', 2, 180.09);
insert into DEVICE (name, id, price)
values ('Gionee F103', 3, 658.71);
insert into DEVICE (name, id, price)
values ('Wiko Bloom2', 1, 1325.33);
insert into DEVICE (name, id, price)
values ('iNQ Cloud Touch', 2, 180.09);
insert into DEVICE (name, id, price)
values ('Gionee F103', 3, 658.71);
insert into DEVICE (name, id, price)
values ('Acer Liquid mt', 5, 1611.42);
insert into DEVICE (name, id, price)
values ('Archos 50c Oxygen', 6, 699.17);
insert into DEVICE (name, id, price)
values ('Microsoft Surface', 7, 374.79);
insert into DEVICE (name, id, price)
values ('Samsung E1085T', 8, 871.87);
insert into DEVICE (name, id, price)
values ('Prestigio MultiPad Note 8.0 3G', 9, 1564.7);
insert into DEVICE (name, id, price)
values ('Motorola MT810lx', 10, 751.77);
insert into DEVICE (name, id, price)
values ('Samsung R210', 11, 113.01);
insert into DEVICE (name, id, price)
values ('Micromax A100', 12, 1705.82);
insert into DEVICE (name, id, price)
values ('Samsung L320', 13, 1925.16);
insert into DEVICE (name, id, price)
values ('Haier Z7000', 14, 1154.89);
insert into DEVICE (name, id, price)
values ('Sonim XP3300 Force', 15, 1395.06);
insert into DEVICE (name, id, price)
values ('Sagem my150X', 16, 1510.59);
insert into DEVICE (name, id, price)
values ('Ericsson I 888', 17, 1426.66);
insert into DEVICE (name, id, price)
values ('Huawei Ascend W2', 18, 515.51);
insert into DEVICE (name, id, price)
values ('Sony Xperia XZ2', 19, 337.48);
insert into DEVICE (name, id, price)
values ('Honor 8A 2020', 20, 1157.15);
insert into DEVICE (name, id, price)
values ('Lenovo Vibe Shot', 21, 1172.02);
insert into DEVICE (name, id, price)
values ('Motorola WX265', 22, 350.84);
insert into DEVICE (name, id, price)
values ('Allview Viva i8', 23, 1364.36);
insert into DEVICE (name, id, price)
values ('Acer Iconia B1-720', 24, 1424.16);
insert into DEVICE (name, id, price)
values ('Xiaomi Redmi Note 9T', 25, 651.37);
insert into DEVICE (name, id, price)
values ('verykool s450', 26, 795.47);
insert into DEVICE (name, id, price)
values ('Samsung Gear Live', 27, 543.86);
insert into DEVICE (name, id, price)
values ('Xiaomi Mi 8 Explorer', 28, 1229.68);
insert into DEVICE (name, id, price)
values ('Acer Liquid E700', 29, 874.49);
insert into DEVICE (name, id, price)
values ('NEC e101', 30, 254.88);
insert into DEVICE (name, id, price)
values ('LG CU500', 31, 103.3);
insert into DEVICE (name, id, price)
values ('Samsung A837 Rugby', 32, 851.55);
insert into DEVICE (name, id, price)
values ('Allview Soul X5 Style', 33, 1104.56);
insert into DEVICE (name, id, price)
values ('ZTE S213', 34, 1473);
insert into DEVICE (name, id, price)
values ('Ulefone Armor 8', 35, 32.41);
insert into DEVICE (name, id, price)
values ('Gionee A1 Plus', 36, 957.32);
insert into DEVICE (name, id, price)
values ('Realme V3', 37, 481.5);
insert into DEVICE (name, id, price)
values ('Amoi 2560', 38, 599.51);
insert into DEVICE (name, id, price)
values ('vivo Y30', 39, 982.27);
insert into DEVICE (name, id, price)
values ('Siemens AL21', 40, 287.1);
insert into DEVICE (name, id, price)
values ('Motorola V3688', 41, 1297.79);
insert into DEVICE (name, id, price)
values ('alcatel OT-292', 42, 1738.13);
insert into DEVICE (name, id, price)
values ('Nokia 215', 43, 337.93);
insert into DEVICE (name, id, price)
values ('Sagem MY C-1', 44, 606.73);
insert into DEVICE (name, id, price)
values ('ZTE Axon 7s', 45, 1871.61);
insert into DEVICE (name, id, price)
values ('Sony Ericsson P990', 46, 1811.21);
insert into DEVICE (name, id, price)
values ('LG G5200', 47, 1798.01);
insert into DEVICE (name, id, price)
values ('Garmin-Asus nuvifone M10', 48, 1490.69);
insert into DEVICE (name, id, price)
values ('Samsung Ch@t 527', 49, 1254.21);
insert into DEVICE (name, id, price)
values ('Sony CMD J5', 50, 744.24);
insert into DEVICE (name, id, price)
values ('Dell Venue', 51, 641.08);
insert into DEVICE (name, id, price)
values ('ZTE Kis V788', 52, 647.47);
insert into DEVICE (name, id, price)
values ('Samsung R580 Profile', 53, 828.67);
insert into DEVICE (name, id, price)
values ('O2 XDA Stealth', 54, 809.92);
insert into DEVICE (name, id, price)
values ('Nokia 5530 XpressMusic', 55, 1078.99);
insert into DEVICE (name, id, price)
values ('BlackBerry Torch 9810', 56, 1203.16);
insert into DEVICE (name, id, price)
values ('Innostream INNO P10', 57, 493);
insert into DEVICE (name, id, price)
values ('Nokia 6120 classic', 58, 869.92);
insert into DEVICE (name, id, price)
values ('Acer Iconia Tab A500', 59, 120.17);
insert into DEVICE (name, id, price)
values ('Siemens S10 active', 60, 1415.56);
insert into DEVICE (name, id, price)
values ('Micromax X78', 61, 1904.02);
insert into DEVICE (name, id, price)
values ('Motorola MOTO XT702', 62, 112.72);
insert into DEVICE (name, id, price)
values ('Samsung J800 Luxe', 63, 911.87);
insert into DEVICE (name, id, price)
values ('Xiaomi Redmi Note 4G', 64, 1932.59);
insert into DEVICE (name, id, price)
values ('Samsung M6710 Beat DISC', 65, 367.52);
insert into DEVICE (name, id, price)
values ('Motorola C117', 66, 907.35);
insert into DEVICE (name, id, price)
values ('Samsung D900', 67, 71.5);
insert into DEVICE (name, id, price)
values ('LG KH5200 Andro-1', 68, 1502.25);
insert into DEVICE (name, id, price)
values ('LG KT770', 69, 403.75);
insert into DEVICE (name, id, price)
values ('i-mate JAM Black', 70, 1872.58);
insert into DEVICE (name, id, price)
values ('Motorola Electrify M XT905', 71, 1202.94);
insert into DEVICE (name, id, price)
values ('Celkon A27', 72, 315.15);
insert into DEVICE (name, id, price)
values ('Micromax Bharat 2+', 73, 1847.7);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy Light', 74, 855.94);
insert into DEVICE (name, id, price)
values ('Gionee S6', 75, 863.96);
insert into DEVICE (name, id, price)
values ('alcatel 2010', 76, 821.34);
insert into DEVICE (name, id, price)
values ('Samsung X680', 77, 1024.39);
insert into DEVICE (name, id, price)
values ('NEC N401i', 78, 620.94);
insert into DEVICE (name, id, price)
values ('Yezz Andy 3.5EI2', 79, 811.66);
insert into DEVICE (name, id, price)
values ('Motorola Moto G4', 80, 1199.54);
insert into DEVICE (name, id, price)
values ('Huawei U8850 Vision', 81, 340.56);
insert into DEVICE (name, id, price)
values ('Samsung A837 Rugby', 82, 937.71);
insert into DEVICE (name, id, price)
values ('HP Pro Slate 12', 83, 645.8);
insert into DEVICE (name, id, price)
values ('Honor Holly 2 Plus', 84, 1529.23);
insert into DEVICE (name, id, price)
values ('Celkon C63', 85, 610.5);
insert into DEVICE (name, id, price)
values ('Apple iPad mini 3', 86, 435.98);
insert into DEVICE (name, id, price)
values ('LG KG130', 87, 875.8);
insert into DEVICE (name, id, price)
values ('Micromax A61 Bolt', 88, 1665.28);
insert into DEVICE (name, id, price)
values ('QMobile Linq X70', 89, 706.41);
insert into DEVICE (name, id, price)
values ('vivo Y83', 90, 729.36);
insert into DEVICE (name, id, price)
values ('Asus Zenfone Go ZC451TG', 91, 680.45);
insert into DEVICE (name, id, price)
values ('Archos 40 Titanium', 92, 620.03);
insert into DEVICE (name, id, price)
values ('Motorola XOOM 2 MZ615', 93, 246.36);
insert into DEVICE (name, id, price)
values ('QMobile Noir S9', 94, 407.82);
insert into DEVICE (name, id, price)
values ('Casio G''zOne Brigade', 95, 893.24);
insert into DEVICE (name, id, price)
values ('BlackBerry Pearl 8130', 96, 897.58);
insert into DEVICE (name, id, price)
values ('Asus Zenfone 5z ZS620KL', 97, 1796.87);
insert into DEVICE (name, id, price)
values ('Icemobile Apollo Touch', 98, 1186.04);
commit;
prompt 100 records committed...
insert into DEVICE (name, id, price)
values ('Philips X312', 99, 455.13);
insert into DEVICE (name, id, price)
values ('Samsung Watch Phone', 100, 695.39);
insert into DEVICE (name, id, price)
values ('Celkon C3000', 101, 1988.09);
insert into DEVICE (name, id, price)
values ('Sony Ericsson Xperia Arc S', 102, 525.77);
insert into DEVICE (name, id, price)
values ('Samsung B5310 CorbyPRO', 103, 1404.3);
insert into DEVICE (name, id, price)
values ('Spice Mi-437 Stellar Nhance 2', 104, 1976.69);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy Tab Active Pro', 105, 727.4);
insert into DEVICE (name, id, price)
values ('LG GT500 Puccini', 106, 324.28);
insert into DEVICE (name, id, price)
values ('Samsung S8000 Jet', 107, 849.47);
insert into DEVICE (name, id, price)
values ('Motorola DEFY+', 108, 347.23);
insert into DEVICE (name, id, price)
values ('Sony Ericsson Xperia X10 mini', 109, 614.09);
insert into DEVICE (name, id, price)
values ('Meizu C9', 110, 389.56);
insert into DEVICE (name, id, price)
values ('Samsung E3210', 111, 1656.62);
insert into DEVICE (name, id, price)
values ('Micromax X099', 112, 255.74);
insert into DEVICE (name, id, price)
values ('ZTE Blade X5', 113, 889.49);
insert into DEVICE (name, id, price)
values ('HTC Desire 825', 114, 1572.16);
insert into DEVICE (name, id, price)
values ('Siemens SL45i', 115, 345.03);
insert into DEVICE (name, id, price)
values ('Yezz Ritmo 3 TV YZ433', 116, 217.43);
insert into DEVICE (name, id, price)
values ('Siemens U10', 117, 664.1);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy J3 Emerge', 118, 914.14);
insert into DEVICE (name, id, price)
values ('Energizer Ultimate U710S', 119, 1736.9);
insert into DEVICE (name, id, price)
values ('XOLO A600', 120, 892.59);
insert into DEVICE (name, id, price)
values ('LG KP215', 121, 1884.72);
insert into DEVICE (name, id, price)
values ('Huawei G7010', 122, 1665.68);
insert into DEVICE (name, id, price)
values ('NEC e949/L1', 123, 1898.14);
insert into DEVICE (name, id, price)
values ('Archos Diamond Tab', 124, 898.2);
insert into DEVICE (name, id, price)
values ('YU Yureka Note', 125, 702.66);
insert into DEVICE (name, id, price)
values ('Lenovo M10 FHD REL', 126, 732.48);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy A8 (2018)', 127, 1924.37);
insert into DEVICE (name, id, price)
values ('Casio G''zOne Brigade', 128, 976.24);
insert into DEVICE (name, id, price)
values ('Yezz LIV1', 129, 1300.11);
insert into DEVICE (name, id, price)
values ('Emporia Solid Plus', 130, 792.56);
insert into DEVICE (name, id, price)
values ('Nokia 301', 131, 1187.86);
insert into DEVICE (name, id, price)
values ('Nokia X+', 132, 458.93);
insert into DEVICE (name, id, price)
values ('Samsung Vodafone 360 H1', 133, 1890.57);
insert into DEVICE (name, id, price)
values ('QMobile Noir A550', 134, 1538.83);
insert into DEVICE (name, id, price)
values ('Nokia X2-05', 135, 1776.8);
insert into DEVICE (name, id, price)
values ('Lava Iris Fuel 50', 136, 671.32);
insert into DEVICE (name, id, price)
values ('Lenovo Tab3 8 Plus', 137, 1827.34);
insert into DEVICE (name, id, price)
values ('Sony Xperia T LTE', 138, 114.19);
insert into DEVICE (name, id, price)
values ('Tecno Pop 2 Plus', 139, 420.5);
insert into DEVICE (name, id, price)
values ('Samsung T369', 140, 262.23);
insert into DEVICE (name, id, price)
values ('BLU Vivo 5', 141, 613.02);
insert into DEVICE (name, id, price)
values ('Motorola C113a', 142, 684.83);
insert into DEVICE (name, id, price)
values ('Yezz Art 1 Pro', 143, 1172.88);
insert into DEVICE (name, id, price)
values ('Motorola V690', 144, 1827.19);
insert into DEVICE (name, id, price)
values ('Sony Xperia XZ1 Compact', 145, 1918.01);
insert into DEVICE (name, id, price)
values ('Huawei Mate 30 Lite', 146, 1144.15);
insert into DEVICE (name, id, price)
values ('Honor Play 8A', 147, 786.05);
insert into DEVICE (name, id, price)
values ('Spice QT-65', 149, 1776.48);
insert into DEVICE (name, id, price)
values ('Motorola RAZR XT910', 150, 290.5);
insert into DEVICE (name, id, price)
values ('ZTE Kis 3', 151, 734.13);
insert into DEVICE (name, id, price)
values ('Lenovo Vibe Z K910', 152, 1444.42);
insert into DEVICE (name, id, price)
values ('Intex Aqua Power +', 153, 489.89);
insert into DEVICE (name, id, price)
values ('Siemens Xelibri 2', 154, 627.12);
insert into DEVICE (name, id, price)
values ('Amoi A210', 155, 286.27);
insert into DEVICE (name, id, price)
values ('Samsung B210', 156, 1487.71);
insert into DEVICE (name, id, price)
values ('Siemens C35i', 157, 1257.5);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy Core Prime', 158, 867.08);
insert into DEVICE (name, id, price)
values ('Haier U69', 159, 1308.46);
insert into DEVICE (name, id, price)
values ('HTC One X10', 160, 1427.36);
insert into DEVICE (name, id, price)
values ('Lenovo S5000', 161, 904.32);
insert into DEVICE (name, id, price)
values ('Siemens A50', 162, 665.49);
insert into DEVICE (name, id, price)
values ('Micromax X550 Qube', 163, 1928.59);
insert into DEVICE (name, id, price)
values ('BlackBerry Storm2 9550', 164, 1530.35);
insert into DEVICE (name, id, price)
values ('LG X350', 165, 1795.12);
insert into DEVICE (name, id, price)
values ('Energizer Power Max P20', 166, 882.15);
insert into DEVICE (name, id, price)
values ('Motorola Moto G Pro', 167, 1417.16);
insert into DEVICE (name, id, price)
values ('Ulefone S11', 168, 1001.91);
insert into DEVICE (name, id, price)
values ('Samsung A177', 169, 1953.79);
insert into DEVICE (name, id, price)
values ('LG Enact VS890', 170, 114.58);
insert into DEVICE (name, id, price)
values ('Plum Boom', 171, 1454.73);
insert into DEVICE (name, id, price)
values ('Fujitsu Siemens T810', 172, 1323.5);
insert into DEVICE (name, id, price)
values ('Energizer Energy E10+', 173, 655.26);
insert into DEVICE (name, id, price)
values ('LG Stylo 2', 174, 1220.75);
insert into DEVICE (name, id, price)
values ('Lava A68', 175, 602.27);
insert into DEVICE (name, id, price)
values ('Samsung P850', 176, 790.42);
insert into DEVICE (name, id, price)
values ('HTC Desire 816 dual sim', 177, 1853.16);
insert into DEVICE (name, id, price)
values ('Micromax X246', 178, 1509.93);
insert into DEVICE (name, id, price)
values ('Nokia 150', 179, 1210.47);
insert into DEVICE (name, id, price)
values ('Samsung I8530 Galaxy Beam', 181, 638.58);
insert into DEVICE (name, id, price)
values ('HTC One M9+ Supreme Camera', 183, 907.57);
insert into DEVICE (name, id, price)
values ('Samsung E720', 184, 847.81);
insert into DEVICE (name, id, price)
values ('alcatel One Touch Idol', 185, 209.46);
insert into DEVICE (name, id, price)
values ('Huawei MediaPad 10 Link+', 186, 166.98);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy Rush M830', 187, 58.19);
insert into DEVICE (name, id, price)
values ('LG Nitro HD', 188, 1306.58);
insert into DEVICE (name, id, price)
values ('LG Optimus G E975', 189, 343.72);
insert into DEVICE (name, id, price)
values ('Celkon C509', 190, 1745.67);
insert into DEVICE (name, id, price)
values ('Sony Tablet P', 191, 530.68);
insert into DEVICE (name, id, price)
values ('Infinix Hot 10', 192, 1405.82);
insert into DEVICE (name, id, price)
values ('Micromax X368', 193, 1994.15);
insert into DEVICE (name, id, price)
values ('Micromax X500', 194, 1855.28);
insert into DEVICE (name, id, price)
values ('BLU Studio J8M LTE', 195, 1740.9);
insert into DEVICE (name, id, price)
values ('verykool i410', 197, 1488.34);
insert into DEVICE (name, id, price)
values ('Sony CMD Z7', 198, 1796.66);
insert into DEVICE (name, id, price)
values ('XOLO Q3000', 199, 28.01);
insert into DEVICE (name, id, price)
values ('Xiaomi Redmi 9C NFC', 200, 1422.74);
insert into DEVICE (name, id, price)
values ('Wiko Bloom2', 1, 1325.33);
insert into DEVICE (name, id, price)
values ('iNQ Cloud Touch', 2, 180.09);
commit;
prompt 200 records committed...
insert into DEVICE (name, id, price)
values ('Gionee F103', 3, 658.71);
insert into DEVICE (name, id, price)
values ('Acer Liquid mt', 5, 1611.42);
insert into DEVICE (name, id, price)
values ('Archos 50c Oxygen', 6, 699.17);
insert into DEVICE (name, id, price)
values ('Microsoft Surface', 7, 374.79);
insert into DEVICE (name, id, price)
values ('Samsung E1085T', 8, 871.87);
insert into DEVICE (name, id, price)
values ('Prestigio MultiPad Note 8.0 3G', 9, 1564.7);
insert into DEVICE (name, id, price)
values ('Motorola MT810lx', 10, 751.77);
insert into DEVICE (name, id, price)
values ('Samsung R210', 11, 113.01);
insert into DEVICE (name, id, price)
values ('Micromax A100', 12, 1705.82);
insert into DEVICE (name, id, price)
values ('Samsung L320', 13, 1925.16);
insert into DEVICE (name, id, price)
values ('Haier Z7000', 14, 1154.89);
insert into DEVICE (name, id, price)
values ('Sonim XP3300 Force', 15, 1395.06);
insert into DEVICE (name, id, price)
values ('Sagem my150X', 16, 1510.59);
insert into DEVICE (name, id, price)
values ('Ericsson I 888', 17, 1426.66);
insert into DEVICE (name, id, price)
values ('Huawei Ascend W2', 18, 515.51);
insert into DEVICE (name, id, price)
values ('Sony Xperia XZ2', 19, 337.48);
insert into DEVICE (name, id, price)
values ('Honor 8A 2020', 20, 1157.15);
insert into DEVICE (name, id, price)
values ('Lenovo Vibe Shot', 21, 1172.02);
insert into DEVICE (name, id, price)
values ('Motorola WX265', 22, 350.84);
insert into DEVICE (name, id, price)
values ('Allview Viva i8', 23, 1364.36);
insert into DEVICE (name, id, price)
values ('Acer Iconia B1-720', 24, 1424.16);
insert into DEVICE (name, id, price)
values ('Xiaomi Redmi Note 9T', 25, 651.37);
insert into DEVICE (name, id, price)
values ('verykool s450', 26, 795.47);
insert into DEVICE (name, id, price)
values ('Samsung Gear Live', 27, 543.86);
insert into DEVICE (name, id, price)
values ('Xiaomi Mi 8 Explorer', 28, 1229.68);
insert into DEVICE (name, id, price)
values ('Acer Liquid E700', 29, 874.49);
insert into DEVICE (name, id, price)
values ('NEC e101', 30, 254.88);
insert into DEVICE (name, id, price)
values ('LG CU500', 31, 103.3);
insert into DEVICE (name, id, price)
values ('Samsung A837 Rugby', 32, 851.55);
insert into DEVICE (name, id, price)
values ('Allview Soul X5 Style', 33, 1104.56);
insert into DEVICE (name, id, price)
values ('ZTE S213', 34, 1473);
insert into DEVICE (name, id, price)
values ('Ulefone Armor 8', 35, 32.41);
insert into DEVICE (name, id, price)
values ('Gionee A1 Plus', 36, 957.32);
insert into DEVICE (name, id, price)
values ('Realme V3', 37, 481.5);
insert into DEVICE (name, id, price)
values ('Amoi 2560', 38, 599.51);
insert into DEVICE (name, id, price)
values ('vivo Y30', 39, 982.27);
insert into DEVICE (name, id, price)
values ('Siemens AL21', 40, 287.1);
insert into DEVICE (name, id, price)
values ('Motorola V3688', 41, 1297.79);
insert into DEVICE (name, id, price)
values ('alcatel OT-292', 42, 1738.13);
insert into DEVICE (name, id, price)
values ('Nokia 215', 43, 337.93);
insert into DEVICE (name, id, price)
values ('Sagem MY C-1', 44, 606.73);
insert into DEVICE (name, id, price)
values ('ZTE Axon 7s', 45, 1871.61);
insert into DEVICE (name, id, price)
values ('Sony Ericsson P990', 46, 1811.21);
insert into DEVICE (name, id, price)
values ('LG G5200', 47, 1798.01);
insert into DEVICE (name, id, price)
values ('Garmin-Asus nuvifone M10', 48, 1490.69);
insert into DEVICE (name, id, price)
values ('Samsung Ch@t 527', 49, 1254.21);
insert into DEVICE (name, id, price)
values ('Sony CMD J5', 50, 744.24);
insert into DEVICE (name, id, price)
values ('Dell Venue', 51, 641.08);
insert into DEVICE (name, id, price)
values ('ZTE Kis V788', 52, 647.47);
insert into DEVICE (name, id, price)
values ('Samsung R580 Profile', 53, 828.67);
insert into DEVICE (name, id, price)
values ('O2 XDA Stealth', 54, 809.92);
insert into DEVICE (name, id, price)
values ('Nokia 5530 XpressMusic', 55, 1078.99);
insert into DEVICE (name, id, price)
values ('BlackBerry Torch 9810', 56, 1203.16);
insert into DEVICE (name, id, price)
values ('Innostream INNO P10', 57, 493);
insert into DEVICE (name, id, price)
values ('Nokia 6120 classic', 58, 869.92);
insert into DEVICE (name, id, price)
values ('Acer Iconia Tab A500', 59, 120.17);
insert into DEVICE (name, id, price)
values ('Siemens S10 active', 60, 1415.56);
insert into DEVICE (name, id, price)
values ('Micromax X78', 61, 1904.02);
insert into DEVICE (name, id, price)
values ('Motorola MOTO XT702', 62, 112.72);
insert into DEVICE (name, id, price)
values ('Samsung J800 Luxe', 63, 911.87);
insert into DEVICE (name, id, price)
values ('Xiaomi Redmi Note 4G', 64, 1932.59);
insert into DEVICE (name, id, price)
values ('Samsung M6710 Beat DISC', 65, 367.52);
insert into DEVICE (name, id, price)
values ('Motorola C117', 66, 907.35);
insert into DEVICE (name, id, price)
values ('Samsung D900', 67, 71.5);
insert into DEVICE (name, id, price)
values ('LG KH5200 Andro-1', 68, 1502.25);
insert into DEVICE (name, id, price)
values ('LG KT770', 69, 403.75);
insert into DEVICE (name, id, price)
values ('i-mate JAM Black', 70, 1872.58);
insert into DEVICE (name, id, price)
values ('Motorola Electrify M XT905', 71, 1202.94);
insert into DEVICE (name, id, price)
values ('Celkon A27', 72, 315.15);
insert into DEVICE (name, id, price)
values ('Micromax Bharat 2+', 73, 1847.7);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy Light', 74, 855.94);
insert into DEVICE (name, id, price)
values ('Gionee S6', 75, 863.96);
insert into DEVICE (name, id, price)
values ('alcatel 2010', 76, 821.34);
insert into DEVICE (name, id, price)
values ('Samsung X680', 77, 1024.39);
insert into DEVICE (name, id, price)
values ('NEC N401i', 78, 620.94);
insert into DEVICE (name, id, price)
values ('Yezz Andy 3.5EI2', 79, 811.66);
insert into DEVICE (name, id, price)
values ('Motorola Moto G4', 80, 1199.54);
insert into DEVICE (name, id, price)
values ('Huawei U8850 Vision', 81, 340.56);
insert into DEVICE (name, id, price)
values ('Samsung A837 Rugby', 82, 937.71);
insert into DEVICE (name, id, price)
values ('HP Pro Slate 12', 83, 645.8);
insert into DEVICE (name, id, price)
values ('Honor Holly 2 Plus', 84, 1529.23);
insert into DEVICE (name, id, price)
values ('Celkon C63', 85, 610.5);
insert into DEVICE (name, id, price)
values ('Apple iPad mini 3', 86, 435.98);
insert into DEVICE (name, id, price)
values ('LG KG130', 87, 875.8);
insert into DEVICE (name, id, price)
values ('Micromax A61 Bolt', 88, 1665.28);
insert into DEVICE (name, id, price)
values ('QMobile Linq X70', 89, 706.41);
insert into DEVICE (name, id, price)
values ('vivo Y83', 90, 729.36);
insert into DEVICE (name, id, price)
values ('Asus Zenfone Go ZC451TG', 91, 680.45);
insert into DEVICE (name, id, price)
values ('Archos 40 Titanium', 92, 620.03);
insert into DEVICE (name, id, price)
values ('Motorola XOOM 2 MZ615', 93, 246.36);
insert into DEVICE (name, id, price)
values ('QMobile Noir S9', 94, 407.82);
insert into DEVICE (name, id, price)
values ('Casio G''zOne Brigade', 95, 893.24);
insert into DEVICE (name, id, price)
values ('BlackBerry Pearl 8130', 96, 897.58);
insert into DEVICE (name, id, price)
values ('Asus Zenfone 5z ZS620KL', 97, 1796.87);
insert into DEVICE (name, id, price)
values ('Icemobile Apollo Touch', 98, 1186.04);
insert into DEVICE (name, id, price)
values ('Philips X312', 99, 455.13);
insert into DEVICE (name, id, price)
values ('Samsung Watch Phone', 100, 695.39);
insert into DEVICE (name, id, price)
values ('Celkon C3000', 101, 1988.09);
insert into DEVICE (name, id, price)
values ('Sony Ericsson Xperia Arc S', 102, 525.77);
insert into DEVICE (name, id, price)
values ('Samsung B5310 CorbyPRO', 103, 1404.3);
commit;
prompt 300 records committed...
insert into DEVICE (name, id, price)
values ('Spice Mi-437 Stellar Nhance 2', 104, 1976.69);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy Tab Active Pro', 105, 727.4);
insert into DEVICE (name, id, price)
values ('LG GT500 Puccini', 106, 324.28);
insert into DEVICE (name, id, price)
values ('Samsung S8000 Jet', 107, 849.47);
insert into DEVICE (name, id, price)
values ('Motorola DEFY+', 108, 347.23);
insert into DEVICE (name, id, price)
values ('Sony Ericsson Xperia X10 mini', 109, 614.09);
insert into DEVICE (name, id, price)
values ('Meizu C9', 110, 389.56);
insert into DEVICE (name, id, price)
values ('Samsung E3210', 111, 1656.62);
insert into DEVICE (name, id, price)
values ('Micromax X099', 112, 255.74);
insert into DEVICE (name, id, price)
values ('ZTE Blade X5', 113, 889.49);
insert into DEVICE (name, id, price)
values ('HTC Desire 825', 114, 1572.16);
insert into DEVICE (name, id, price)
values ('Siemens SL45i', 115, 345.03);
insert into DEVICE (name, id, price)
values ('Yezz Ritmo 3 TV YZ433', 116, 217.43);
insert into DEVICE (name, id, price)
values ('Siemens U10', 117, 664.1);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy J3 Emerge', 118, 914.14);
insert into DEVICE (name, id, price)
values ('Energizer Ultimate U710S', 119, 1736.9);
insert into DEVICE (name, id, price)
values ('XOLO A600', 120, 892.59);
insert into DEVICE (name, id, price)
values ('LG KP215', 121, 1884.72);
insert into DEVICE (name, id, price)
values ('Huawei G7010', 122, 1665.68);
insert into DEVICE (name, id, price)
values ('NEC e949/L1', 123, 1898.14);
insert into DEVICE (name, id, price)
values ('Archos Diamond Tab', 124, 898.2);
insert into DEVICE (name, id, price)
values ('YU Yureka Note', 125, 702.66);
insert into DEVICE (name, id, price)
values ('Lenovo M10 FHD REL', 126, 732.48);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy A8 (2018)', 127, 1924.37);
insert into DEVICE (name, id, price)
values ('Casio G''zOne Brigade', 128, 976.24);
insert into DEVICE (name, id, price)
values ('Yezz LIV1', 129, 1300.11);
insert into DEVICE (name, id, price)
values ('Emporia Solid Plus', 130, 792.56);
insert into DEVICE (name, id, price)
values ('Nokia 301', 131, 1187.86);
insert into DEVICE (name, id, price)
values ('Nokia X+', 132, 458.93);
insert into DEVICE (name, id, price)
values ('Samsung Vodafone 360 H1', 133, 1890.57);
insert into DEVICE (name, id, price)
values ('QMobile Noir A550', 134, 1538.83);
insert into DEVICE (name, id, price)
values ('Nokia X2-05', 135, 1776.8);
insert into DEVICE (name, id, price)
values ('Lava Iris Fuel 50', 136, 671.32);
insert into DEVICE (name, id, price)
values ('Lenovo Tab3 8 Plus', 137, 1827.34);
insert into DEVICE (name, id, price)
values ('Sony Xperia T LTE', 138, 114.19);
insert into DEVICE (name, id, price)
values ('Tecno Pop 2 Plus', 139, 420.5);
insert into DEVICE (name, id, price)
values ('Samsung T369', 140, 262.23);
insert into DEVICE (name, id, price)
values ('BLU Vivo 5', 141, 613.02);
insert into DEVICE (name, id, price)
values ('Motorola C113a', 142, 684.83);
insert into DEVICE (name, id, price)
values ('Yezz Art 1 Pro', 143, 1172.88);
insert into DEVICE (name, id, price)
values ('Motorola V690', 144, 1827.19);
insert into DEVICE (name, id, price)
values ('Sony Xperia XZ1 Compact', 145, 1918.01);
insert into DEVICE (name, id, price)
values ('Huawei Mate 30 Lite', 146, 1144.15);
insert into DEVICE (name, id, price)
values ('Honor Play 8A', 147, 786.05);
insert into DEVICE (name, id, price)
values ('Spice QT-65', 149, 1776.48);
insert into DEVICE (name, id, price)
values ('Motorola RAZR XT910', 150, 290.5);
insert into DEVICE (name, id, price)
values ('ZTE Kis 3', 151, 734.13);
insert into DEVICE (name, id, price)
values ('Lenovo Vibe Z K910', 152, 1444.42);
insert into DEVICE (name, id, price)
values ('Intex Aqua Power +', 153, 489.89);
insert into DEVICE (name, id, price)
values ('Siemens Xelibri 2', 154, 627.12);
insert into DEVICE (name, id, price)
values ('Amoi A210', 155, 286.27);
insert into DEVICE (name, id, price)
values ('Samsung B210', 156, 1487.71);
insert into DEVICE (name, id, price)
values ('Siemens C35i', 157, 1257.5);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy Core Prime', 158, 867.08);
insert into DEVICE (name, id, price)
values ('Haier U69', 159, 1308.46);
insert into DEVICE (name, id, price)
values ('HTC One X10', 160, 1427.36);
insert into DEVICE (name, id, price)
values ('Lenovo S5000', 161, 904.32);
insert into DEVICE (name, id, price)
values ('Siemens A50', 162, 665.49);
insert into DEVICE (name, id, price)
values ('Micromax X550 Qube', 163, 1928.59);
insert into DEVICE (name, id, price)
values ('BlackBerry Storm2 9550', 164, 1530.35);
insert into DEVICE (name, id, price)
values ('LG X350', 165, 1795.12);
insert into DEVICE (name, id, price)
values ('Energizer Power Max P20', 166, 882.15);
insert into DEVICE (name, id, price)
values ('Motorola Moto G Pro', 167, 1417.16);
insert into DEVICE (name, id, price)
values ('Ulefone S11', 168, 1001.91);
insert into DEVICE (name, id, price)
values ('Samsung A177', 169, 1953.79);
insert into DEVICE (name, id, price)
values ('LG Enact VS890', 170, 114.58);
insert into DEVICE (name, id, price)
values ('Plum Boom', 171, 1454.73);
insert into DEVICE (name, id, price)
values ('Fujitsu Siemens T810', 172, 1323.5);
insert into DEVICE (name, id, price)
values ('Energizer Energy E10+', 173, 655.26);
insert into DEVICE (name, id, price)
values ('LG Stylo 2', 174, 1220.75);
insert into DEVICE (name, id, price)
values ('Lava A68', 175, 602.27);
insert into DEVICE (name, id, price)
values ('Samsung P850', 176, 790.42);
insert into DEVICE (name, id, price)
values ('HTC Desire 816 dual sim', 177, 1853.16);
insert into DEVICE (name, id, price)
values ('Micromax X246', 178, 1509.93);
insert into DEVICE (name, id, price)
values ('Nokia 150', 179, 1210.47);
insert into DEVICE (name, id, price)
values ('Samsung I8530 Galaxy Beam', 181, 638.58);
insert into DEVICE (name, id, price)
values ('HTC One M9+ Supreme Camera', 183, 907.57);
insert into DEVICE (name, id, price)
values ('Samsung E720', 184, 847.81);
insert into DEVICE (name, id, price)
values ('alcatel One Touch Idol', 185, 209.46);
insert into DEVICE (name, id, price)
values ('Huawei MediaPad 10 Link+', 186, 166.98);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy Rush M830', 187, 58.19);
insert into DEVICE (name, id, price)
values ('LG Nitro HD', 188, 1306.58);
insert into DEVICE (name, id, price)
values ('LG Optimus G E975', 189, 343.72);
insert into DEVICE (name, id, price)
values ('Celkon C509', 190, 1745.67);
insert into DEVICE (name, id, price)
values ('Sony Tablet P', 191, 530.68);
insert into DEVICE (name, id, price)
values ('Infinix Hot 10', 192, 1405.82);
insert into DEVICE (name, id, price)
values ('Micromax X368', 193, 1994.15);
insert into DEVICE (name, id, price)
values ('Micromax X500', 194, 1855.28);
insert into DEVICE (name, id, price)
values ('BLU Studio J8M LTE', 195, 1740.9);
insert into DEVICE (name, id, price)
values ('verykool i410', 197, 1488.34);
insert into DEVICE (name, id, price)
values ('Sony CMD Z7', 198, 1796.66);
insert into DEVICE (name, id, price)
values ('XOLO Q3000', 199, 28.01);
insert into DEVICE (name, id, price)
values ('Xiaomi Redmi 9C NFC', 200, 1422.74);
insert into DEVICE (name, id, price)
values ('Wiko Bloom2', 1, 1325.33);
insert into DEVICE (name, id, price)
values ('iNQ Cloud Touch', 2, 180.09);
insert into DEVICE (name, id, price)
values ('Gionee F103', 3, 658.71);
insert into DEVICE (name, id, price)
values ('Acer Liquid mt', 5, 1611.42);
insert into DEVICE (name, id, price)
values ('Archos 50c Oxygen', 6, 699.17);
insert into DEVICE (name, id, price)
values ('Microsoft Surface', 7, 374.79);
insert into DEVICE (name, id, price)
values ('Samsung E1085T', 8, 871.87);
commit;
prompt 400 records committed...
insert into DEVICE (name, id, price)
values ('Prestigio MultiPad Note 8.0 3G', 9, 1564.7);
insert into DEVICE (name, id, price)
values ('Motorola MT810lx', 10, 751.77);
insert into DEVICE (name, id, price)
values ('Samsung R210', 11, 113.01);
insert into DEVICE (name, id, price)
values ('Micromax A100', 12, 1705.82);
insert into DEVICE (name, id, price)
values ('Samsung L320', 13, 1925.16);
insert into DEVICE (name, id, price)
values ('Haier Z7000', 14, 1154.89);
insert into DEVICE (name, id, price)
values ('Sonim XP3300 Force', 15, 1395.06);
insert into DEVICE (name, id, price)
values ('Sagem my150X', 16, 1510.59);
insert into DEVICE (name, id, price)
values ('Ericsson I 888', 17, 1426.66);
insert into DEVICE (name, id, price)
values ('Huawei Ascend W2', 18, 515.51);
insert into DEVICE (name, id, price)
values ('Sony Xperia XZ2', 19, 337.48);
insert into DEVICE (name, id, price)
values ('Honor 8A 2020', 20, 1157.15);
insert into DEVICE (name, id, price)
values ('Lenovo Vibe Shot', 21, 1172.02);
insert into DEVICE (name, id, price)
values ('Motorola WX265', 22, 350.84);
insert into DEVICE (name, id, price)
values ('Allview Viva i8', 23, 1364.36);
insert into DEVICE (name, id, price)
values ('Acer Iconia B1-720', 24, 1424.16);
insert into DEVICE (name, id, price)
values ('Xiaomi Redmi Note 9T', 25, 651.37);
insert into DEVICE (name, id, price)
values ('verykool s450', 26, 795.47);
insert into DEVICE (name, id, price)
values ('Samsung Gear Live', 27, 543.86);
insert into DEVICE (name, id, price)
values ('Xiaomi Mi 8 Explorer', 28, 1229.68);
insert into DEVICE (name, id, price)
values ('Acer Liquid E700', 29, 874.49);
insert into DEVICE (name, id, price)
values ('NEC e101', 30, 254.88);
insert into DEVICE (name, id, price)
values ('LG CU500', 31, 103.3);
insert into DEVICE (name, id, price)
values ('Samsung A837 Rugby', 32, 851.55);
insert into DEVICE (name, id, price)
values ('Allview Soul X5 Style', 33, 1104.56);
insert into DEVICE (name, id, price)
values ('ZTE S213', 34, 1473);
insert into DEVICE (name, id, price)
values ('Ulefone Armor 8', 35, 32.41);
insert into DEVICE (name, id, price)
values ('Gionee A1 Plus', 36, 957.32);
insert into DEVICE (name, id, price)
values ('Realme V3', 37, 481.5);
insert into DEVICE (name, id, price)
values ('Amoi 2560', 38, 599.51);
insert into DEVICE (name, id, price)
values ('vivo Y30', 39, 982.27);
insert into DEVICE (name, id, price)
values ('Siemens AL21', 40, 287.1);
insert into DEVICE (name, id, price)
values ('Motorola V3688', 41, 1297.79);
insert into DEVICE (name, id, price)
values ('alcatel OT-292', 42, 1738.13);
insert into DEVICE (name, id, price)
values ('Nokia 215', 43, 337.93);
insert into DEVICE (name, id, price)
values ('Sagem MY C-1', 44, 606.73);
insert into DEVICE (name, id, price)
values ('ZTE Axon 7s', 45, 1871.61);
insert into DEVICE (name, id, price)
values ('Sony Ericsson P990', 46, 1811.21);
insert into DEVICE (name, id, price)
values ('LG G5200', 47, 1798.01);
insert into DEVICE (name, id, price)
values ('Garmin-Asus nuvifone M10', 48, 1490.69);
insert into DEVICE (name, id, price)
values ('Samsung Ch@t 527', 49, 1254.21);
insert into DEVICE (name, id, price)
values ('Sony CMD J5', 50, 744.24);
insert into DEVICE (name, id, price)
values ('Dell Venue', 51, 641.08);
insert into DEVICE (name, id, price)
values ('ZTE Kis V788', 52, 647.47);
insert into DEVICE (name, id, price)
values ('Samsung R580 Profile', 53, 828.67);
insert into DEVICE (name, id, price)
values ('O2 XDA Stealth', 54, 809.92);
insert into DEVICE (name, id, price)
values ('Nokia 5530 XpressMusic', 55, 1078.99);
insert into DEVICE (name, id, price)
values ('BlackBerry Torch 9810', 56, 1203.16);
insert into DEVICE (name, id, price)
values ('Innostream INNO P10', 57, 493);
insert into DEVICE (name, id, price)
values ('Nokia 6120 classic', 58, 869.92);
insert into DEVICE (name, id, price)
values ('Acer Iconia Tab A500', 59, 120.17);
insert into DEVICE (name, id, price)
values ('Siemens S10 active', 60, 1415.56);
insert into DEVICE (name, id, price)
values ('Micromax X78', 61, 1904.02);
insert into DEVICE (name, id, price)
values ('Motorola MOTO XT702', 62, 112.72);
insert into DEVICE (name, id, price)
values ('Samsung J800 Luxe', 63, 911.87);
insert into DEVICE (name, id, price)
values ('Xiaomi Redmi Note 4G', 64, 1932.59);
insert into DEVICE (name, id, price)
values ('Samsung M6710 Beat DISC', 65, 367.52);
insert into DEVICE (name, id, price)
values ('Motorola C117', 66, 907.35);
insert into DEVICE (name, id, price)
values ('Samsung D900', 67, 71.5);
insert into DEVICE (name, id, price)
values ('LG KH5200 Andro-1', 68, 1502.25);
insert into DEVICE (name, id, price)
values ('LG KT770', 69, 403.75);
insert into DEVICE (name, id, price)
values ('i-mate JAM Black', 70, 1872.58);
insert into DEVICE (name, id, price)
values ('Motorola Electrify M XT905', 71, 1202.94);
insert into DEVICE (name, id, price)
values ('Celkon A27', 72, 315.15);
insert into DEVICE (name, id, price)
values ('Micromax Bharat 2+', 73, 1847.7);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy Light', 74, 855.94);
insert into DEVICE (name, id, price)
values ('Gionee S6', 75, 863.96);
insert into DEVICE (name, id, price)
values ('alcatel 2010', 76, 821.34);
insert into DEVICE (name, id, price)
values ('Samsung X680', 77, 1024.39);
insert into DEVICE (name, id, price)
values ('NEC N401i', 78, 620.94);
insert into DEVICE (name, id, price)
values ('Yezz Andy 3.5EI2', 79, 811.66);
insert into DEVICE (name, id, price)
values ('Motorola Moto G4', 80, 1199.54);
insert into DEVICE (name, id, price)
values ('Huawei U8850 Vision', 81, 340.56);
insert into DEVICE (name, id, price)
values ('Samsung A837 Rugby', 82, 937.71);
insert into DEVICE (name, id, price)
values ('HP Pro Slate 12', 83, 645.8);
insert into DEVICE (name, id, price)
values ('Honor Holly 2 Plus', 84, 1529.23);
insert into DEVICE (name, id, price)
values ('Celkon C63', 85, 610.5);
insert into DEVICE (name, id, price)
values ('Apple iPad mini 3', 86, 435.98);
insert into DEVICE (name, id, price)
values ('LG KG130', 87, 875.8);
insert into DEVICE (name, id, price)
values ('Micromax A61 Bolt', 88, 1665.28);
insert into DEVICE (name, id, price)
values ('QMobile Linq X70', 89, 706.41);
insert into DEVICE (name, id, price)
values ('vivo Y83', 90, 729.36);
insert into DEVICE (name, id, price)
values ('Asus Zenfone Go ZC451TG', 91, 680.45);
insert into DEVICE (name, id, price)
values ('Archos 40 Titanium', 92, 620.03);
insert into DEVICE (name, id, price)
values ('Motorola XOOM 2 MZ615', 93, 246.36);
insert into DEVICE (name, id, price)
values ('QMobile Noir S9', 94, 407.82);
insert into DEVICE (name, id, price)
values ('Casio G''zOne Brigade', 95, 893.24);
insert into DEVICE (name, id, price)
values ('BlackBerry Pearl 8130', 96, 897.58);
insert into DEVICE (name, id, price)
values ('Asus Zenfone 5z ZS620KL', 97, 1796.87);
insert into DEVICE (name, id, price)
values ('Icemobile Apollo Touch', 98, 1186.04);
insert into DEVICE (name, id, price)
values ('Philips X312', 99, 455.13);
insert into DEVICE (name, id, price)
values ('Samsung Watch Phone', 100, 695.39);
insert into DEVICE (name, id, price)
values ('Celkon C3000', 101, 1988.09);
insert into DEVICE (name, id, price)
values ('Sony Ericsson Xperia Arc S', 102, 525.77);
insert into DEVICE (name, id, price)
values ('Samsung B5310 CorbyPRO', 103, 1404.3);
insert into DEVICE (name, id, price)
values ('Spice Mi-437 Stellar Nhance 2', 104, 1976.69);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy Tab Active Pro', 105, 727.4);
insert into DEVICE (name, id, price)
values ('LG GT500 Puccini', 106, 324.28);
insert into DEVICE (name, id, price)
values ('Samsung S8000 Jet', 107, 849.47);
insert into DEVICE (name, id, price)
values ('Motorola DEFY+', 108, 347.23);
commit;
prompt 500 records committed...
insert into DEVICE (name, id, price)
values ('Sony Ericsson Xperia X10 mini', 109, 614.09);
insert into DEVICE (name, id, price)
values ('Meizu C9', 110, 389.56);
insert into DEVICE (name, id, price)
values ('Samsung E3210', 111, 1656.62);
insert into DEVICE (name, id, price)
values ('Micromax X099', 112, 255.74);
insert into DEVICE (name, id, price)
values ('ZTE Blade X5', 113, 889.49);
insert into DEVICE (name, id, price)
values ('HTC Desire 825', 114, 1572.16);
insert into DEVICE (name, id, price)
values ('Siemens SL45i', 115, 345.03);
insert into DEVICE (name, id, price)
values ('Yezz Ritmo 3 TV YZ433', 116, 217.43);
insert into DEVICE (name, id, price)
values ('Siemens U10', 117, 664.1);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy J3 Emerge', 118, 914.14);
insert into DEVICE (name, id, price)
values ('Energizer Ultimate U710S', 119, 1736.9);
insert into DEVICE (name, id, price)
values ('XOLO A600', 120, 892.59);
insert into DEVICE (name, id, price)
values ('LG KP215', 121, 1884.72);
insert into DEVICE (name, id, price)
values ('Huawei G7010', 122, 1665.68);
insert into DEVICE (name, id, price)
values ('NEC e949/L1', 123, 1898.14);
insert into DEVICE (name, id, price)
values ('Archos Diamond Tab', 124, 898.2);
insert into DEVICE (name, id, price)
values ('YU Yureka Note', 125, 702.66);
insert into DEVICE (name, id, price)
values ('Lenovo M10 FHD REL', 126, 732.48);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy A8 (2018)', 127, 1924.37);
insert into DEVICE (name, id, price)
values ('Casio G''zOne Brigade', 128, 976.24);
insert into DEVICE (name, id, price)
values ('Yezz LIV1', 129, 1300.11);
insert into DEVICE (name, id, price)
values ('Emporia Solid Plus', 130, 792.56);
insert into DEVICE (name, id, price)
values ('Nokia 301', 131, 1187.86);
insert into DEVICE (name, id, price)
values ('Nokia X+', 132, 458.93);
insert into DEVICE (name, id, price)
values ('Samsung Vodafone 360 H1', 133, 1890.57);
insert into DEVICE (name, id, price)
values ('QMobile Noir A550', 134, 1538.83);
insert into DEVICE (name, id, price)
values ('Nokia X2-05', 135, 1776.8);
insert into DEVICE (name, id, price)
values ('Lava Iris Fuel 50', 136, 671.32);
insert into DEVICE (name, id, price)
values ('Lenovo Tab3 8 Plus', 137, 1827.34);
insert into DEVICE (name, id, price)
values ('Sony Xperia T LTE', 138, 114.19);
insert into DEVICE (name, id, price)
values ('Tecno Pop 2 Plus', 139, 420.5);
insert into DEVICE (name, id, price)
values ('Samsung T369', 140, 262.23);
insert into DEVICE (name, id, price)
values ('BLU Vivo 5', 141, 613.02);
insert into DEVICE (name, id, price)
values ('Motorola C113a', 142, 684.83);
insert into DEVICE (name, id, price)
values ('Yezz Art 1 Pro', 143, 1172.88);
insert into DEVICE (name, id, price)
values ('Motorola V690', 144, 1827.19);
insert into DEVICE (name, id, price)
values ('Sony Xperia XZ1 Compact', 145, 1918.01);
insert into DEVICE (name, id, price)
values ('Huawei Mate 30 Lite', 146, 1144.15);
insert into DEVICE (name, id, price)
values ('Honor Play 8A', 147, 786.05);
insert into DEVICE (name, id, price)
values ('Spice QT-65', 149, 1776.48);
insert into DEVICE (name, id, price)
values ('Motorola RAZR XT910', 150, 290.5);
insert into DEVICE (name, id, price)
values ('ZTE Kis 3', 151, 734.13);
insert into DEVICE (name, id, price)
values ('Lenovo Vibe Z K910', 152, 1444.42);
insert into DEVICE (name, id, price)
values ('Intex Aqua Power +', 153, 489.89);
insert into DEVICE (name, id, price)
values ('Siemens Xelibri 2', 154, 627.12);
insert into DEVICE (name, id, price)
values ('Amoi A210', 155, 286.27);
insert into DEVICE (name, id, price)
values ('Samsung B210', 156, 1487.71);
insert into DEVICE (name, id, price)
values ('Siemens C35i', 157, 1257.5);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy Core Prime', 158, 867.08);
insert into DEVICE (name, id, price)
values ('Haier U69', 159, 1308.46);
insert into DEVICE (name, id, price)
values ('HTC One X10', 160, 1427.36);
insert into DEVICE (name, id, price)
values ('Lenovo S5000', 161, 904.32);
insert into DEVICE (name, id, price)
values ('Siemens A50', 162, 665.49);
insert into DEVICE (name, id, price)
values ('Micromax X550 Qube', 163, 1928.59);
insert into DEVICE (name, id, price)
values ('BlackBerry Storm2 9550', 164, 1530.35);
insert into DEVICE (name, id, price)
values ('LG X350', 165, 1795.12);
insert into DEVICE (name, id, price)
values ('Energizer Power Max P20', 166, 882.15);
insert into DEVICE (name, id, price)
values ('Motorola Moto G Pro', 167, 1417.16);
insert into DEVICE (name, id, price)
values ('Ulefone S11', 168, 1001.91);
insert into DEVICE (name, id, price)
values ('Samsung A177', 169, 1953.79);
insert into DEVICE (name, id, price)
values ('LG Enact VS890', 170, 114.58);
insert into DEVICE (name, id, price)
values ('Plum Boom', 171, 1454.73);
insert into DEVICE (name, id, price)
values ('Fujitsu Siemens T810', 172, 1323.5);
insert into DEVICE (name, id, price)
values ('Energizer Energy E10+', 173, 655.26);
insert into DEVICE (name, id, price)
values ('LG Stylo 2', 174, 1220.75);
insert into DEVICE (name, id, price)
values ('Lava A68', 175, 602.27);
insert into DEVICE (name, id, price)
values ('Samsung P850', 176, 790.42);
insert into DEVICE (name, id, price)
values ('HTC Desire 816 dual sim', 177, 1853.16);
insert into DEVICE (name, id, price)
values ('Micromax X246', 178, 1509.93);
insert into DEVICE (name, id, price)
values ('Nokia 150', 179, 1210.47);
insert into DEVICE (name, id, price)
values ('Samsung I8530 Galaxy Beam', 181, 638.58);
insert into DEVICE (name, id, price)
values ('HTC One M9+ Supreme Camera', 183, 907.57);
insert into DEVICE (name, id, price)
values ('Samsung E720', 184, 847.81);
insert into DEVICE (name, id, price)
values ('alcatel One Touch Idol', 185, 209.46);
insert into DEVICE (name, id, price)
values ('Huawei MediaPad 10 Link+', 186, 166.98);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy Rush M830', 187, 58.19);
insert into DEVICE (name, id, price)
values ('LG Nitro HD', 188, 1306.58);
insert into DEVICE (name, id, price)
values ('LG Optimus G E975', 189, 343.72);
insert into DEVICE (name, id, price)
values ('Celkon C509', 190, 1745.67);
insert into DEVICE (name, id, price)
values ('Sony Tablet P', 191, 530.68);
insert into DEVICE (name, id, price)
values ('Infinix Hot 10', 192, 1405.82);
insert into DEVICE (name, id, price)
values ('Micromax X368', 193, 1994.15);
insert into DEVICE (name, id, price)
values ('Micromax X500', 194, 1855.28);
insert into DEVICE (name, id, price)
values ('BLU Studio J8M LTE', 195, 1740.9);
insert into DEVICE (name, id, price)
values ('verykool i410', 197, 1488.34);
insert into DEVICE (name, id, price)
values ('Sony CMD Z7', 198, 1796.66);
insert into DEVICE (name, id, price)
values ('XOLO Q3000', 199, 28.01);
insert into DEVICE (name, id, price)
values ('Xiaomi Redmi 9C NFC', 200, 1422.74);
insert into DEVICE (name, id, price)
values ('Wiko Bloom2', 1, 1325.33);
insert into DEVICE (name, id, price)
values ('iNQ Cloud Touch', 2, 180.09);
insert into DEVICE (name, id, price)
values ('Gionee F103', 3, 658.71);
insert into DEVICE (name, id, price)
values ('Spice Mi-535 Stellar Pinnacle Pro', 4, 960.51);
insert into DEVICE (name, id, price)
values ('Acer Liquid mt', 5, 1611.42);
insert into DEVICE (name, id, price)
values ('Archos 50c Oxygen', 6, 699.17);
insert into DEVICE (name, id, price)
values ('Microsoft Surface', 7, 374.79);
insert into DEVICE (name, id, price)
values ('Samsung E1085T', 8, 871.87);
insert into DEVICE (name, id, price)
values ('Prestigio MultiPad Note 8.0 3G', 9, 1564.7);
insert into DEVICE (name, id, price)
values ('Motorola MT810lx', 10, 751.77);
insert into DEVICE (name, id, price)
values ('Samsung R210', 11, 113.01);
insert into DEVICE (name, id, price)
values ('Micromax A100', 12, 1705.82);
commit;
prompt 600 records committed...
insert into DEVICE (name, id, price)
values ('Samsung L320', 13, 1925.16);
insert into DEVICE (name, id, price)
values ('Haier Z7000', 14, 1154.89);
insert into DEVICE (name, id, price)
values ('Sonim XP3300 Force', 15, 1395.06);
insert into DEVICE (name, id, price)
values ('Sagem my150X', 16, 1510.59);
insert into DEVICE (name, id, price)
values ('Ericsson I 888', 17, 1426.66);
insert into DEVICE (name, id, price)
values ('Huawei Ascend W2', 18, 515.51);
insert into DEVICE (name, id, price)
values ('Sony Xperia XZ2', 19, 337.48);
insert into DEVICE (name, id, price)
values ('Honor 8A 2020', 20, 1157.15);
insert into DEVICE (name, id, price)
values ('Lenovo Vibe Shot', 21, 1172.02);
insert into DEVICE (name, id, price)
values ('Motorola WX265', 22, 350.84);
insert into DEVICE (name, id, price)
values ('Allview Viva i8', 23, 1364.36);
insert into DEVICE (name, id, price)
values ('Acer Iconia B1-720', 24, 1424.16);
insert into DEVICE (name, id, price)
values ('Xiaomi Redmi Note 9T', 25, 651.37);
insert into DEVICE (name, id, price)
values ('verykool s450', 26, 795.47);
insert into DEVICE (name, id, price)
values ('Samsung Gear Live', 27, 543.86);
insert into DEVICE (name, id, price)
values ('Xiaomi Mi 8 Explorer', 28, 1229.68);
insert into DEVICE (name, id, price)
values ('Acer Liquid E700', 29, 874.49);
insert into DEVICE (name, id, price)
values ('NEC e101', 30, 254.88);
insert into DEVICE (name, id, price)
values ('LG CU500', 31, 103.3);
insert into DEVICE (name, id, price)
values ('Samsung A837 Rugby', 32, 851.55);
insert into DEVICE (name, id, price)
values ('Allview Soul X5 Style', 33, 1104.56);
insert into DEVICE (name, id, price)
values ('ZTE S213', 34, 1473);
insert into DEVICE (name, id, price)
values ('Ulefone Armor 8', 35, 32.41);
insert into DEVICE (name, id, price)
values ('Gionee A1 Plus', 36, 957.32);
insert into DEVICE (name, id, price)
values ('Realme V3', 37, 481.5);
insert into DEVICE (name, id, price)
values ('Amoi 2560', 38, 599.51);
insert into DEVICE (name, id, price)
values ('vivo Y30', 39, 982.27);
insert into DEVICE (name, id, price)
values ('Siemens AL21', 40, 287.1);
insert into DEVICE (name, id, price)
values ('Motorola V3688', 41, 1297.79);
insert into DEVICE (name, id, price)
values ('alcatel OT-292', 42, 1738.13);
insert into DEVICE (name, id, price)
values ('Nokia 215', 43, 337.93);
insert into DEVICE (name, id, price)
values ('Sagem MY C-1', 44, 606.73);
insert into DEVICE (name, id, price)
values ('ZTE Axon 7s', 45, 1871.61);
insert into DEVICE (name, id, price)
values ('Sony Ericsson P990', 46, 1811.21);
insert into DEVICE (name, id, price)
values ('LG G5200', 47, 1798.01);
insert into DEVICE (name, id, price)
values ('Garmin-Asus nuvifone M10', 48, 1490.69);
insert into DEVICE (name, id, price)
values ('Samsung Ch@t 527', 49, 1254.21);
insert into DEVICE (name, id, price)
values ('Sony CMD J5', 50, 744.24);
insert into DEVICE (name, id, price)
values ('Dell Venue', 51, 641.08);
insert into DEVICE (name, id, price)
values ('ZTE Kis V788', 52, 647.47);
insert into DEVICE (name, id, price)
values ('Samsung R580 Profile', 53, 828.67);
insert into DEVICE (name, id, price)
values ('O2 XDA Stealth', 54, 809.92);
insert into DEVICE (name, id, price)
values ('Nokia 5530 XpressMusic', 55, 1078.99);
insert into DEVICE (name, id, price)
values ('BlackBerry Torch 9810', 56, 1203.16);
insert into DEVICE (name, id, price)
values ('Innostream INNO P10', 57, 493);
insert into DEVICE (name, id, price)
values ('Nokia 6120 classic', 58, 869.92);
insert into DEVICE (name, id, price)
values ('Acer Iconia Tab A500', 59, 120.17);
insert into DEVICE (name, id, price)
values ('Siemens S10 active', 60, 1415.56);
insert into DEVICE (name, id, price)
values ('Micromax X78', 61, 1904.02);
insert into DEVICE (name, id, price)
values ('Motorola MOTO XT702', 62, 112.72);
insert into DEVICE (name, id, price)
values ('Samsung J800 Luxe', 63, 911.87);
insert into DEVICE (name, id, price)
values ('Xiaomi Redmi Note 4G', 64, 1932.59);
insert into DEVICE (name, id, price)
values ('Samsung M6710 Beat DISC', 65, 367.52);
insert into DEVICE (name, id, price)
values ('Motorola C117', 66, 907.35);
insert into DEVICE (name, id, price)
values ('Samsung D900', 67, 71.5);
insert into DEVICE (name, id, price)
values ('LG KH5200 Andro-1', 68, 1502.25);
insert into DEVICE (name, id, price)
values ('LG KT770', 69, 403.75);
insert into DEVICE (name, id, price)
values ('i-mate JAM Black', 70, 1872.58);
insert into DEVICE (name, id, price)
values ('Motorola Electrify M XT905', 71, 1202.94);
insert into DEVICE (name, id, price)
values ('Celkon A27', 72, 315.15);
insert into DEVICE (name, id, price)
values ('Micromax Bharat 2+', 73, 1847.7);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy Light', 74, 855.94);
insert into DEVICE (name, id, price)
values ('Gionee S6', 75, 863.96);
insert into DEVICE (name, id, price)
values ('alcatel 2010', 76, 821.34);
insert into DEVICE (name, id, price)
values ('Samsung X680', 77, 1024.39);
insert into DEVICE (name, id, price)
values ('NEC N401i', 78, 620.94);
insert into DEVICE (name, id, price)
values ('Yezz Andy 3.5EI2', 79, 811.66);
insert into DEVICE (name, id, price)
values ('Motorola Moto G4', 80, 1199.54);
insert into DEVICE (name, id, price)
values ('Huawei U8850 Vision', 81, 340.56);
insert into DEVICE (name, id, price)
values ('Samsung A837 Rugby', 82, 937.71);
insert into DEVICE (name, id, price)
values ('HP Pro Slate 12', 83, 645.8);
insert into DEVICE (name, id, price)
values ('Honor Holly 2 Plus', 84, 1529.23);
insert into DEVICE (name, id, price)
values ('Celkon C63', 85, 610.5);
insert into DEVICE (name, id, price)
values ('Apple iPad mini 3', 86, 435.98);
insert into DEVICE (name, id, price)
values ('LG KG130', 87, 875.8);
insert into DEVICE (name, id, price)
values ('Micromax A61 Bolt', 88, 1665.28);
insert into DEVICE (name, id, price)
values ('QMobile Linq X70', 89, 706.41);
insert into DEVICE (name, id, price)
values ('vivo Y83', 90, 729.36);
insert into DEVICE (name, id, price)
values ('Asus Zenfone Go ZC451TG', 91, 680.45);
insert into DEVICE (name, id, price)
values ('Archos 40 Titanium', 92, 620.03);
insert into DEVICE (name, id, price)
values ('Motorola XOOM 2 MZ615', 93, 246.36);
insert into DEVICE (name, id, price)
values ('QMobile Noir S9', 94, 407.82);
insert into DEVICE (name, id, price)
values ('Casio G''zOne Brigade', 95, 893.24);
insert into DEVICE (name, id, price)
values ('BlackBerry Pearl 8130', 96, 897.58);
insert into DEVICE (name, id, price)
values ('Asus Zenfone 5z ZS620KL', 97, 1796.87);
insert into DEVICE (name, id, price)
values ('Icemobile Apollo Touch', 98, 1186.04);
insert into DEVICE (name, id, price)
values ('Philips X312', 99, 455.13);
insert into DEVICE (name, id, price)
values ('Samsung Watch Phone', 100, 695.39);
insert into DEVICE (name, id, price)
values ('Celkon C3000', 101, 1988.09);
insert into DEVICE (name, id, price)
values ('Sony Ericsson Xperia Arc S', 102, 525.77);
insert into DEVICE (name, id, price)
values ('Samsung B5310 CorbyPRO', 103, 1404.3);
insert into DEVICE (name, id, price)
values ('Spice Mi-437 Stellar Nhance 2', 104, 1976.69);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy Tab Active Pro', 105, 727.4);
insert into DEVICE (name, id, price)
values ('LG GT500 Puccini', 106, 324.28);
insert into DEVICE (name, id, price)
values ('Samsung S8000 Jet', 107, 849.47);
insert into DEVICE (name, id, price)
values ('Motorola DEFY+', 108, 347.23);
insert into DEVICE (name, id, price)
values ('Sony Ericsson Xperia X10 mini', 109, 614.09);
insert into DEVICE (name, id, price)
values ('Meizu C9', 110, 389.56);
insert into DEVICE (name, id, price)
values ('Samsung E3210', 111, 1656.62);
insert into DEVICE (name, id, price)
values ('Micromax X099', 112, 255.74);
commit;
prompt 700 records committed...
insert into DEVICE (name, id, price)
values ('ZTE Blade X5', 113, 889.49);
insert into DEVICE (name, id, price)
values ('HTC Desire 825', 114, 1572.16);
insert into DEVICE (name, id, price)
values ('Siemens SL45i', 115, 345.03);
insert into DEVICE (name, id, price)
values ('Yezz Ritmo 3 TV YZ433', 116, 217.43);
insert into DEVICE (name, id, price)
values ('Siemens U10', 117, 664.1);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy J3 Emerge', 118, 914.14);
insert into DEVICE (name, id, price)
values ('Energizer Ultimate U710S', 119, 1736.9);
insert into DEVICE (name, id, price)
values ('XOLO A600', 120, 892.59);
insert into DEVICE (name, id, price)
values ('LG KP215', 121, 1884.72);
insert into DEVICE (name, id, price)
values ('Huawei G7010', 122, 1665.68);
insert into DEVICE (name, id, price)
values ('NEC e949/L1', 123, 1898.14);
insert into DEVICE (name, id, price)
values ('Archos Diamond Tab', 124, 898.2);
insert into DEVICE (name, id, price)
values ('YU Yureka Note', 125, 702.66);
insert into DEVICE (name, id, price)
values ('Lenovo M10 FHD REL', 126, 732.48);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy A8 (2018)', 127, 1924.37);
insert into DEVICE (name, id, price)
values ('Casio G''zOne Brigade', 128, 976.24);
insert into DEVICE (name, id, price)
values ('Yezz LIV1', 129, 1300.11);
insert into DEVICE (name, id, price)
values ('Emporia Solid Plus', 130, 792.56);
insert into DEVICE (name, id, price)
values ('Nokia 301', 131, 1187.86);
insert into DEVICE (name, id, price)
values ('Nokia X+', 132, 458.93);
insert into DEVICE (name, id, price)
values ('Samsung Vodafone 360 H1', 133, 1890.57);
insert into DEVICE (name, id, price)
values ('QMobile Noir A550', 134, 1538.83);
insert into DEVICE (name, id, price)
values ('Nokia X2-05', 135, 1776.8);
insert into DEVICE (name, id, price)
values ('Lava Iris Fuel 50', 136, 671.32);
insert into DEVICE (name, id, price)
values ('Lenovo Tab3 8 Plus', 137, 1827.34);
insert into DEVICE (name, id, price)
values ('Sony Xperia T LTE', 138, 114.19);
insert into DEVICE (name, id, price)
values ('Tecno Pop 2 Plus', 139, 420.5);
insert into DEVICE (name, id, price)
values ('Samsung T369', 140, 262.23);
insert into DEVICE (name, id, price)
values ('BLU Vivo 5', 141, 613.02);
insert into DEVICE (name, id, price)
values ('Motorola C113a', 142, 684.83);
insert into DEVICE (name, id, price)
values ('Yezz Art 1 Pro', 143, 1172.88);
insert into DEVICE (name, id, price)
values ('Motorola V690', 144, 1827.19);
insert into DEVICE (name, id, price)
values ('Sony Xperia XZ1 Compact', 145, 1918.01);
insert into DEVICE (name, id, price)
values ('Huawei Mate 30 Lite', 146, 1144.15);
insert into DEVICE (name, id, price)
values ('Honor Play 8A', 147, 786.05);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy Tab 3 10.1 P5210', 148, 1561.49);
insert into DEVICE (name, id, price)
values ('Spice QT-65', 149, 1776.48);
insert into DEVICE (name, id, price)
values ('Motorola RAZR XT910', 150, 290.5);
insert into DEVICE (name, id, price)
values ('ZTE Kis 3', 151, 734.13);
insert into DEVICE (name, id, price)
values ('Lenovo Vibe Z K910', 152, 1444.42);
insert into DEVICE (name, id, price)
values ('Intex Aqua Power +', 153, 489.89);
insert into DEVICE (name, id, price)
values ('Siemens Xelibri 2', 154, 627.12);
insert into DEVICE (name, id, price)
values ('Amoi A210', 155, 286.27);
insert into DEVICE (name, id, price)
values ('Samsung B210', 156, 1487.71);
insert into DEVICE (name, id, price)
values ('Siemens C35i', 157, 1257.5);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy Core Prime', 158, 867.08);
insert into DEVICE (name, id, price)
values ('Haier U69', 159, 1308.46);
insert into DEVICE (name, id, price)
values ('HTC One X10', 160, 1427.36);
insert into DEVICE (name, id, price)
values ('Lenovo S5000', 161, 904.32);
insert into DEVICE (name, id, price)
values ('Siemens A50', 162, 665.49);
insert into DEVICE (name, id, price)
values ('Micromax X550 Qube', 163, 1928.59);
insert into DEVICE (name, id, price)
values ('BlackBerry Storm2 9550', 164, 1530.35);
insert into DEVICE (name, id, price)
values ('LG X350', 165, 1795.12);
insert into DEVICE (name, id, price)
values ('Energizer Power Max P20', 166, 882.15);
insert into DEVICE (name, id, price)
values ('Motorola Moto G Pro', 167, 1417.16);
insert into DEVICE (name, id, price)
values ('Ulefone S11', 168, 1001.91);
insert into DEVICE (name, id, price)
values ('Samsung A177', 169, 1953.79);
insert into DEVICE (name, id, price)
values ('LG Enact VS890', 170, 114.58);
insert into DEVICE (name, id, price)
values ('Plum Boom', 171, 1454.73);
insert into DEVICE (name, id, price)
values ('Fujitsu Siemens T810', 172, 1323.5);
insert into DEVICE (name, id, price)
values ('Energizer Energy E10+', 173, 655.26);
insert into DEVICE (name, id, price)
values ('LG Stylo 2', 174, 1220.75);
insert into DEVICE (name, id, price)
values ('Lava A68', 175, 602.27);
insert into DEVICE (name, id, price)
values ('Samsung P850', 176, 790.42);
insert into DEVICE (name, id, price)
values ('HTC Desire 816 dual sim', 177, 1853.16);
insert into DEVICE (name, id, price)
values ('Micromax X246', 178, 1509.93);
insert into DEVICE (name, id, price)
values ('Nokia 150', 179, 1210.47);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy Victory 4G LTE L300', 180, 163.53);
insert into DEVICE (name, id, price)
values ('Samsung I8530 Galaxy Beam', 181, 638.58);
insert into DEVICE (name, id, price)
values ('Motorola Moto 360 46mm (2nd gen)', 182, 371.75);
insert into DEVICE (name, id, price)
values ('HTC One M9+ Supreme Camera', 183, 907.57);
insert into DEVICE (name, id, price)
values ('Samsung E720', 184, 847.81);
insert into DEVICE (name, id, price)
values ('alcatel One Touch Idol', 185, 209.46);
insert into DEVICE (name, id, price)
values ('Huawei MediaPad 10 Link+', 186, 166.98);
insert into DEVICE (name, id, price)
values ('Samsung Galaxy Rush M830', 187, 58.19);
insert into DEVICE (name, id, price)
values ('LG Nitro HD', 188, 1306.58);
insert into DEVICE (name, id, price)
values ('LG Optimus G E975', 189, 343.72);
insert into DEVICE (name, id, price)
values ('Celkon C509', 190, 1745.67);
insert into DEVICE (name, id, price)
values ('Sony Tablet P', 191, 530.68);
insert into DEVICE (name, id, price)
values ('Infinix Hot 10', 192, 1405.82);
insert into DEVICE (name, id, price)
values ('Micromax X368', 193, 1994.15);
insert into DEVICE (name, id, price)
values ('Micromax X500', 194, 1855.28);
insert into DEVICE (name, id, price)
values ('BLU Studio J8M LTE', 195, 1740.9);
insert into DEVICE (name, id, price)
values ('LG Watch Urbane 2nd Edition LTE', 196, 967.64);
insert into DEVICE (name, id, price)
values ('verykool i410', 197, 1488.34);
insert into DEVICE (name, id, price)
values ('Sony CMD Z7', 198, 1796.66);
insert into DEVICE (name, id, price)
values ('XOLO Q3000', 199, 28.01);
insert into DEVICE (name, id, price)
values ('Xiaomi Redmi 9C NFC', 200, 1422.74);
commit;
prompt 788 records loaded
prompt Loading PRODUCT...
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (72242, 'InstantCrepeMix', 'InstantKornMix', 9469);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (95228, 'OrangeJuice', 'Honeydew', 3388);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (36405, 'InstantMashedPotatoes', 'DriedAlmonds', 3338);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (52612, 'Cereal', 'AlmondExtract', 5546);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (28039, 'Salad', 'Sandwiches', 1839);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (2413, 'InstantKhinkaliMix', 'DriedBlackberries', 5551);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (72512, 'CranberryJuice', 'Flour', 799);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (19248, 'Pizza/Apples?', 'VanillaExtract', 1981);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (58434, 'Chicken', 'Tempura', 5885);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (85850, 'Pizza/Apples?', 'Soup', 3307);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (44829, 'InstantBagelMix', 'InstantProfiteroleMix', 102);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (97804, 'InstantGyozaMix', 'Strawberry', 2747);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (73777, 'InstantRevaniMix', 'InstantArrackMix', 4987);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (39655, 'GrapeJuice', 'GrapeJuice', 9640);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (86943, 'GreenBeans', 'InstantQuittenbrandMix', 4875);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (18510, 'InstantMetaxaMix', 'Syrup', 4293);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (33697, 'DriedBasil', 'Nuts', 3497);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (38180, 'ChiliPeppers', 'AppleJuice', 5792);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (31484, 'DriedChickpeas', 'DriedCashews', 4272);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (89415, 'RiceVinegar', 'InstantSouvlakiMix', 9693);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (17571, 'InstantBagelMix', 'InstantKoftaMix', 7450);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (96785, 'InstantChurroMix', 'Honey', 170);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (78190, 'InstantGenepiMix', 'Zucchini', 5601);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (44091, 'InstantRizogaloMix', 'Avocado', 149);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (89157, 'Vinegar', 'InstantCheburekiMix', 1801);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (1400, 'Pork', 'Oatmeal', 1844);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (34906, 'DriedQuinoa', 'GammaLaptopPro', 9272);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (59874, 'GroundGinger', 'DriedChives', 6496);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (89454, 'CranberryJuice', 'RedWineVinegar', 4514);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (69363, 'Rice', 'ChiliPeppers', 6338);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (6468, 'Vodka', 'Peach', 7203);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (44929, 'Marmalade', 'BetaElectricScooter', 8111);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (95015, 'Carrot', 'InstantLatschenkiefergeistMix', 7149);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (50635, 'RedWineVinegar', 'Water', 7035);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (53912, 'InstantKoumbaraMix', 'InstantRakomeloMix', 670);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (99807, 'InstantFalafelMix', 'InstantTresterschnappsMix', 7995);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (52644, 'GroundCumin', 'InstantKhachapuriMix', 6815);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (95088, 'InstantFattoushMix', 'InstantSpanakopitaMix', 966);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (76221, 'DriedPineapple', 'Flour', 6015);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (42657, 'Muffins', 'Cornstarch', 5764);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (94711, 'DriedChiaSeeds', 'InstantKaurmaMix', 9131);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (77717, 'Cheese', 'InstantFajitaMix', 397);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (12274, 'Hamburgers', 'Grape', 9143);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (42630, 'InstantPreiselbeergeistMix', 'DriedPineapple', 226);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (26488, 'InstantMarcMix', 'Chocolate', 4910);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (57829, 'InstantSeasoningMix', 'InstantCakeMix', 4073);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (74760, 'InstantSchnappsMix', 'InstantBeignetMix', 6712);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (74912, 'HotDogs', 'InstantEauDeVieMix', 7671);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (2527, 'InstantKataifiMix', 'CanolaOil', 7690);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (38985, 'InstantMacaronMix', 'Pear', 9422);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (77133, 'RiceVinegar', 'GroundNutmeg', 6714);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (70962, 'InstantKaridopitaMix', 'InstantGyroMix', 8210);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (50856, 'InstantBagelMix', 'Onion', 1606);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (51816, 'InstantShawarmaMix', 'InstantSoup', 4583);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (44296, 'InstantCookieMix', 'InstantBlinchikMix', 6201);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (16981, 'InstantOuzoMix', 'Jelly', 7749);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (72526, 'InstantEnzianMix', 'InstantPierogiMix', 1452);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (27248, 'DriedAniseSeeds', 'InstantAquavitMix', 8366);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (73549, 'Cheese', 'RedWineVinegar', 5541);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (20613, 'PeanutButter', 'AppleSauce', 3764);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (33431, 'InstantQuittenbrandMix', 'InstantSoup', 4245);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (24609, 'Meatloaf', 'SpringRolls', 7511);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (72328, 'InstantChouxMix', 'InstantZwetschgenbrandMix', 7350);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (36591, 'Honeydew', 'InstantPastryMix', 4902);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (72505, 'InstantWacholdergeistMix', 'Ketchup', 772);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (653, 'DriedAlmonds', 'Corn', 8663);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (31896, 'InstantQutabMix', 'Chili', 8559);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (99345, 'InstantBabaGhanoushMix', 'InstantEnzianMix', 2702);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (25667, 'Gelatin', 'InstantMoussakaMix', 208);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (33104, 'GroundAllspice', 'Cake', 8333);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (61415, 'DriedTarragon', 'Pretzels', 1832);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (37508, 'InstantBozbashMix', 'InstantCookieMix', 4405);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (90072, 'Artichokes', 'IceCream', 7991);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (68009, 'Cherry', 'InstantKornMix', 4264);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (36022, 'DriedPumpkinSeeds', 'Raspberry', 1083);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (56222, 'InstantSamosaMix', 'GroundOnionPowder', 2479);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (1976, 'InstantSconeMix', 'InstantGutabMix', 1188);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (51950, 'Mango', 'InstantSpanakopitaMix', 9400);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (33944, 'DriedCoconut', 'DriedMarjoram', 1393);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (18554, 'Fish', 'Garlic', 9982);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (5819, 'BakingSoda', 'Eggs', 2734);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (1441, 'InstantKornelkirschengeistMix', 'Yeast', 4648);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (81267, 'Spaghetti', 'SigmaSpeakerBoom', 6191);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (83711, 'InstantFalafelMix', 'DeltaTabletPro', 4635);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (97588, 'InstantGutabMix', 'InstantPastryMix', 6389);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (13582, 'DriedSesameSeeds', 'InstantGrappaMix', 7748);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (76308, 'DriedPineapple', 'InstantQuetschMix', 5492);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (84434, 'GroundMustardPowder', 'InstantPreiselbeergeistMix', 7790);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (33990, 'Cheese', 'InstantSchlehengeistMix', 224);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (82106, 'AgarAgar', 'Vinegar', 3670);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (70621, 'InstantMarcMix', 'InstantHolundergeistMix', 8213);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (89218, 'Vodka', 'GroundCoriander', 1947);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (66106, 'Strawberry', 'DriedDates', 3279);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (47691, 'InstantStuffingMix', 'DriedCherries', 4004);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (81897, 'GrapeJuice', 'InstantAprikosenwasserMix', 9834);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (6768, 'InstantQuittenbrandMix', 'Lasagna', 7411);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (46041, 'Pasta', 'SigmaGamingConsole', 9725);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (96226, 'InstantLoukoumadesMix', 'InstantDoughMix', 252);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (22346, 'InstantChikhirtmaMix', 'InstantKirschwasserMix', 4758);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (56462, 'InstantQuittenwasserMix', 'InstantShurpaMix', 1753);
commit;
prompt 100 records committed...
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (4708, 'InstantKornelkirschengeistMix', 'Spaghetti', 1266);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (75791, 'DriedPoppySeeds', 'Soda', 1869);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (29758, 'GroundCoriander', 'InstantArakMix', 1392);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (53125, 'InstantWaffleMix', 'InstantBrownieMix', 358);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (19707, 'Garlic', 'InstantKebabMix', 4150);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (70558, 'Tempura', 'InstantVarenikiMix', 677);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (26452, 'DriedLentils', 'InstantPizzaMix', 4329);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (14976, 'Beef', 'Pear', 4643);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (77053, 'InstantGalaktobourekoMix', 'InstantHerbMix', 3654);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (273, 'TeriyakiSauce', 'Candy', 2761);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (23912, 'TrailMix', 'DriedPapaya', 5632);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (1005, 'DriedSoybeans', 'Hamburgers', 6588);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (74921, 'InstantShawarmaMix', 'Cherry', 4892);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (47400, 'InstantBliniMix', 'VanillaExtract', 6977);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (52312, 'Gin', 'InstantKaurmaMix', 6601);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (56787, 'InstantStachelbeergeistMix', 'InstantEclairMix', 1367);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (70283, 'InstantRollMix', 'DriedApples', 870);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (75938, 'GroundCloves', 'DriedApples', 7416);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (2406, 'Margarine', 'RoastBeef', 2126);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (82297, 'Papaya', 'DriedAniseSeeds', 7489);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (6720, 'InstantLagmanMix', 'Plum', 1941);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (68059, 'DriedMint', 'BBQSauce', 6276);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (26340, 'GroundAllspice', 'InstantKubdariMix', 5780);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (52819, 'Marmalade', 'GreenBeans', 3509);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (18877, 'FrozenYogurt', 'DriedBrazilNuts', 1913);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (89235, 'DriedCilantro', 'Bagels', 6279);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (98302, 'InstantWaffleMix', 'InstantCureMix', 4367);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (6312, 'Spinach', 'DriedBananas', 1823);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (551, 'Marmalade', 'InstantOatmeal', 9977);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (65869, 'Peas', 'InstantBlinchikMix', 1477);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (89314, 'Marmalade', 'InstantHimbeergeistMix', 3630);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (20657, 'InstantGalaktobourekoMix', 'Potato', 2400);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (43742, 'InstantMirabellenbrandMix', 'InstantCroissantMix', 1584);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (14445, 'InstantCheburekiMix', 'InstantStuffingMix', 5967);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (33995, 'Jam', 'ZetaHeadphonesX', 3156);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (80951, 'FriedRice', 'Cauliflower', 2901);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (34488, 'Chili', 'Pizza', 5178);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (63093, 'Blackberry', 'DriedPistachios', 6779);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (12145, 'DriedThyme', 'InstantPflaumenbrandMix', 326);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (86056, 'DriedSesameSeeds', 'DriedApples', 7150);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (77786, 'InstantArrackMix', 'Peas', 1423);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (47171, 'InstantJostabeergeistMix', 'InstantFattoushMix', 2169);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (23321, 'DriedCherries', 'InstantPretzelMix', 9744);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (68701, 'InstantKazyMix', 'InstantRevaniMix', 9331);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (23973, 'BakingSoda', 'DriedHazelnuts', 2853);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (28135, 'HotDogs', 'SpringRolls', 3183);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (78849, 'Strawberry', 'InstantFattoushMix', 7290);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (81713, 'SpringRolls', 'InstantKazyMix', 3109);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (27510, 'DriedPineapple', 'AlphaSmartTV', 9629);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (1103, 'InstantShashlikMix', 'BrusselsSprouts', 9089);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (64432, 'InstantPancakeMix', 'InstantWilliamsbirneMix', 9021);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (99318, 'Kiwi', 'GroundChiliPowder', 2527);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (8034, 'InstantMirabellenbrandMix', 'InstantCupcakeMix', 7362);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (39397, 'InstantGutabMix', 'Udon', 9703);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (52686, 'InstantRizogaloMix', 'DriedCranberries', 6131);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (51656, 'InstantKubdariMix', 'GroundMustardPowder', 1526);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (38969, 'InstantTsipouroMix', 'InstantMarinadeMix', 7312);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (63537, 'Candy', 'DriedCashews', 4544);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (1581, 'DriedBlackberries', 'InstantFattoushMix', 8211);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (59232, 'InstantZwets', 'InstantKubdariMix', 1531);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (1789, 'DriedKiwi', 'InstantKataifiMix', 9847);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (16927, 'DriedHazelnuts', 'DriedStrawberries', 3398);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (43425, 'InstantRakomeloMix', 'Wine', 7915);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (16168, 'InstantKirschwasserMix', 'InstantYiaourtiMix', 7159);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (15361, 'GroundPaprika', 'GroundCardamom', 4885);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (21324, 'Mango', 'InstantEauDeVieMix', 5400);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (27674, 'Chili', 'InstantPieMix', 1663);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (86897, 'InstantTartMix', 'Rice', 3669);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (26455, 'GroundCloves', 'Meatloaf', 7470);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (62888, 'InstantHolundergeistMix', 'Orange', 1774);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (5561, 'StirFry', 'InstantLoukoumadesMix', 5217);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (85182, 'InstantQuittenwasserMix', 'InstantSanddorngeistMix', 557);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (88172, 'Zucchini', 'InstantCheeseMix', 9726);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (11547, 'Water', 'InstantMashedPotatoes', 8733);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (35121, 'OrangeExtract', 'InstantEmpanadaMix', 3762);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (76473, 'InstantMarillenbrandMix', 'InstantBeshbarmakMix', 8733);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (35558, 'StirFry', 'Curry', 5587);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (10917, 'InstantMuffinMix', 'Chili', 6367);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (3544, 'Cucumber', 'InstantApfelwasserMix', 3951);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (40638, 'InstantTartMix', 'InstantPflaumenbrandMix', 3229);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (56350, 'Soup', 'CocoaPowder', 3626);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (80211, 'DriedMint', 'InstantStachelbeergeistMix', 2044);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (92616, 'GroundBlackPepper', 'InstantSchlehengeistMix', 9732);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (13556, 'InstantKourabiedesMix', 'Salad', 9501);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (90651, 'InstantTiropitaMix', 'InstantKartaMix', 3579);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (53968, 'GreenBeans', 'DriedFigs', 9410);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (20285, 'Stew', 'InstantMetaxaMix', 861);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (26617, 'InstantQuittenbrandMix', 'Salad', 1030);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (15768, 'InstantYogurtMix', 'InstantHimbeergeistMix', 4825);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (12447, 'InstantTiropitaMix', 'InstantHaselnussgeistMix', 5100);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (66132, 'Soda', 'SoySauce', 118);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (84260, 'CoconutOil', 'InstantBagelMix', 7029);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (49308, 'InstantMantyMix', 'Gelatin', 6133);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (7295, 'DriedApples', 'FriedRice', 9144);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (69203, 'InstantAprikosenbrandMix', 'InstantCrepeMix', 1148);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (79512, 'Watermelon', 'DriedDates', 57);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (26349, 'Ketchup', 'InstantCrepeMix', 4236);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (79897, 'Mustard', 'NuFitnessTracker', 2682);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (73332, 'Broccoli', 'GroundCinnamon', 3193);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (2485, 'InstantNarynMix', 'Chicken', 939);
commit;
prompt 200 records committed...
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (79721, 'InstantSamosaMix', 'Soda', 4229);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (70734, 'InstantBunMix', 'DriedCoconut', 4543);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (75441, 'InstantJostabeergeistMix', 'Turkey', 6304);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (9155, 'InstantZwetschgenbrandMix', 'GroundGarlicPowder', 164);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (45725, 'InstantKoumbaraMix', 'DriedPrunes', 2214);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (32805, 'Grape', 'InstantOuzoMix', 9215);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (89867, 'InstantLoukoumadesMix', 'DriedCherries', 3918);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (30975, 'DriedPlums', 'InstantKharchoMix', 3187);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (30478, 'GroundCloves', 'InstantPotstickerMix', 6367);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (67201, 'Soda', 'Lettuce', 2493);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (1861, 'Pear', 'GroundOnionPowder', 2050);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (61781, 'InstantMuffinMix', 'DriedCashews', 5758);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (13084, 'InstantSchnappsMix', 'OmicronRouterMax', 1175);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (13995, 'InstantYiaourtiMix', 'BellPeppers', 6754);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (59708, 'CoconutOil', 'Sugar', 3049);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (85120, 'InstantKebabMix', 'Vodka', 9279);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (30626, 'InstantGenepiMix', 'Pork', 8172);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (79116, 'InstantBirnenwasserMix', 'Artichokes', 5309);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (34318, 'Asparagus', 'InstantShurpaMix', 1685);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (11969, 'DriedPeanuts', 'Enchiladas', 1669);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (92723, 'InstantApfelbrandMix', 'InstantPflaumenbrandMix', 5177);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (68174, 'Kiwi', 'InstantYogurtMix', 8671);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (4273, 'Cheese', 'Gnocchi', 8116);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (30432, 'InstantVarenikiMix', 'Lasagna', 757);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (73312, 'DriedApples', 'InstantGravyMix', 5137);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (16266, 'TrailMix', 'Beer', 7209);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (28582, 'BBQ', 'DriedApples', 6802);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (18388, 'InstantShurpaMix', 'InstantPierogiMix', 7514);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (55891, 'Honeydew', 'GroundCoriander', 8354);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (57215, 'DriedMacadamiaNuts', 'InstantMetaxaMix', 1178);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (69060, 'Grape', 'InstantGenepiMix', 3743);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (62889, 'InstantLoukoumadesMix', 'HotChocolate', 4499);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (91671, 'InstantPastaMix', 'Sorbet', 5558);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (47336, 'InstantQutabMix', 'InstantEmpanadaMix', 4911);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (14611, 'Sorbet', 'DriedMarjoram', 8790);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (48287, 'Strawberry', 'Candy', 5148);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (62819, 'InstantBozbashMix', 'InstantBreadMix', 3406);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (48229, 'InstantStrudelMix', 'InstantChouxMix', 596);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (40754, 'Beer', 'Raspberry', 4915);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (33524, 'InstantCrepeMix', 'DriedPeanuts', 8493);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (9953, 'Ham', 'Blackberry', 6954);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (66905, 'Bread', 'Ravioli', 7638);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (99677, 'InstantBeshbarmakMix', 'TeriyakiSauce', 8133);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (2968, 'InstantSconeMix', 'InstantOuzoMix', 6652);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (81420, 'DriedOregano', 'Vodka', 8977);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (53231, 'Blueberry', 'InstantLagmanMix', 9194);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (86448, 'MapleExtract', 'InstantSauceMix', 6422);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (85054, 'InstantPreiselbeergeistMix', 'DriedPistachios', 2151);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (19641, 'DriedChiaSeeds', 'DriedAniseSeeds', 7611);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (82857, 'InstantEnzianMix', 'InstantHummusMix', 89);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (13120, 'InstantPickleMix', 'Salt', 9063);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (38637, 'InstantPfirsichbrandMix', 'InstantGrappaMix', 9096);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (74804, 'InstantSanddorngeistMix', 'InstantMarinadeMix', 8551);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (81607, 'Blueberry', 'InstantWeintraubenbrandMix', 2133);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (48062, 'InstantPickleMix', 'InstantBBQMix', 8881);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (71603, 'InstantRetsinaMix', 'SigmaSpeakerBoom', 6909);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (12151, 'InstantKornelkirschengeistMix', 'InstantEmpanadaMix', 8863);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (58653, 'GroundCloves', 'InstantKartaMix', 4289);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (67248, 'InstantPizzaMix', 'InstantCakePopMix', 2225);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (87396, 'Chili', 'InstantMarinadeMix', 1189);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (46631, 'InstantKazyMix', 'Salad', 8697);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (51117, 'InstantDoughMix', 'Pineapple', 7663);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (33902, 'GroundGarlicPowder', 'DriedHazelnuts', 5664);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (94760, 'InstantMetaxaMix', 'Meatloaf', 3890);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (92135, 'Banana', 'LambdaThermostatPro', 6737);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (36956, 'HotSauce', 'BetaElectricScooter', 5181);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (66323, 'InstantKataifiMix', 'InstantKartaMix', 1965);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (77558, 'Enchiladas', 'InstantSpiceMix', 6631);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (72639, 'DriedHazelnuts', 'InstantZeppoleMix', 3140);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (23742, 'InstantBaklavaMix', 'GammaPhone12', 5338);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (45332, 'InstantWaffleMix', 'AlmondExtract', 3517);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (73249, 'InstantEclairMix', 'Artichokes', 9081);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (92138, 'InstantKourabiedesMix', 'InstantPastaMix', 7707);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (70579, 'InstantZwetschgenbrandMix', 'VanillaExtract', 5141);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (79740, 'DriedCelerySeeds', 'Blueberry', 9941);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (55856, 'InstantPudding', 'InstantMirabellenwasserMix', 9930);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (97820, 'DijonMustard', 'InstantChouxMix', 262);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (69287, 'InstantSanddorngeistMix', 'LambdaThermostatPro', 91);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (71671, 'InstantZwetschgenbrandMix', 'BalsamicVinegar', 5310);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (86743, 'Blackberry', 'PiPortableSSD', 7594);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (40081, 'DriedPineNuts', 'Whiskey', 3997);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (8780, 'GroundCoriander', 'Steak', 445);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (79991, 'InstantPancakeMix', 'GroundNutmeg', 2205);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (53012, 'DriedSoybeans', 'InstantArmagnacMix', 5027);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (92570, 'GroundTurmeric', 'InstantKoumbaraMix', 2013);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (40001, 'DriedChickpeas', 'Salt', 1085);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (98971, 'InstantKubdariMix', 'InstantZwetschgenwasserMix', 3023);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (58468, 'Pasta', 'GroundMustardPowder', 8977);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (30985, 'HotSauce', 'Turkey', 2684);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (59900, 'Curry', 'Honeydew', 5539);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (2967, 'InstantTabboulehMix', 'MacaroniCheese', 2055);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (86899, 'Stuffing', 'InstantKubdariMix', 6179);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (58628, 'InstantBreadMix', 'InstantLobianiMix', 8601);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (8091, 'InstantChikhirtmaMix', 'NuFitnessTracker', 4595);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (47362, 'InstantHummusMix', 'Lettuce', 2244);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (2682, 'GrilledChicken', 'Mustard', 2733);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (15661, 'BBQ', 'InstantKirschwasserMix', 3664);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (70001, 'Jam', 'InstantRevaniMix', 7870);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (53095, 'Sherbet', 'Honeydew', 3414);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (82326, 'GroundCinnamon', 'InstantBiscuitMix', 132);
commit;
prompt 300 records committed...
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (79458, 'DriedFennelSeeds', 'DriedPineNuts', 5923);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (6507, 'DriedHempSeeds', 'InstantKaridopitaMix', 1647);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (83810, 'Peas', 'InstantPlovMix', 7039);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (84652, 'DriedRosemary', 'InstantPancakeMix', 712);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (68266, 'InstantCookieMix', 'DriedMarjoram', 6368);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (47407, 'Mustard', 'InstantKazyMix', 6903);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (48499, 'TomatoJuice', 'Donuts', 5672);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (74316, 'InstantBliniMix', 'GroundCayennePepper', 5977);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (81591, 'Cider', 'Yeast', 1152);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (36274, 'Cauliflower', 'InstantKazyMix', 1259);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (87968, 'GroundCoriander', 'Nuts', 9725);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (96983, 'InstantJostabeergeistMix', 'InstantSchwarzbeergeistMix', 392);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (94326, 'InstantBBQMix', 'Gnocchi', 2478);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (42591, 'InstantNektarinenbrandMix', 'HotDogs', 6513);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (26278, 'DriedSoybeans', 'Peach', 2886);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (32897, 'BrusselsSprouts', 'Turkey', 1266);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (89799, 'Sorbet', 'InstantKartaMix', 6988);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (6776, 'InstantOatmeal', 'InstantAquavitMix', 5561);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (74625, 'MaltVinegar', 'InstantMantiMix', 4442);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (57103, 'InstantHaselnussgeistMix', 'SigmaGamingConsole', 1899);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (22139, 'Jam', 'InstantGrappaMix', 3326);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (10266, 'VegetableOil', 'MaltVinegar', 6724);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (71927, 'InstantSauceMix', 'InstantKoftaMix', 4962);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (28317, 'Mustard', 'DriedCoconut', 6361);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (35815, 'InstantHerbMix', 'Steak', 2249);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (80413, 'Cauliflower', 'InstantKornMix', 6661);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (85018, 'InstantKartaMix', 'InstantPieMix', 8629);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (7233, 'Vinegar', 'Stuffing', 9148);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (71981, 'Soup', 'AlphaSmartTV', 3938);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (28786, 'DriedBasil', 'Syrup', 9149);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (28266, 'GroundNutmeg', 'HotChocolate', 3365);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (89742, 'InstantShurpaMix', 'GammaPhone12', 6554);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (72090, 'DriedPineapple', 'Blackberry', 5509);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (47478, 'InstantHalvaMix', 'Beef', 1857);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (20895, 'InstantPfirsichbrandMix', 'InstantPancakeMix', 3339);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (41890, 'DriedBasil', 'Spinach', 9962);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (44664, 'Plum', 'InstantKirschwasserMix', 391);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (81071, 'GroundWhitePepper', 'Cider', 550);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (34505, 'GrilledChicken', 'Brownies', 7086);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (86605, 'InstantMacaronMix', 'AlphaTechKeyboard', 7770);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (69291, 'Spinach', 'InstantFermentMix', 8338);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (2108, 'Chips', 'InstantPieMix', 2110);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (96687, 'Nachos', 'Spaghetti', 6029);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (77453, 'InstantDiplesMix', 'LambdaThermostatPro', 8234);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (87935, 'InstantSyrnikiMix', 'InstantGrappaMix', 9276);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (51270, 'Jam', 'InstantCalvadosMix', 5384);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (84391, 'InstantTamaleMix', 'BrusselsSprouts', 4781);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (49579, 'InstantFermentMix', 'InstantQutabMix', 949);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (29441, 'InstantMarinadeMix', 'AlphaTechKeyboard', 3148);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (94666, 'InstantChouxMix', 'InstantBlinchikMix', 8000);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (86515, 'InstantBrownieMix', 'InstantGutabMix', 4661);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (65798, 'InstantBliniMix', 'DriedCelerySeeds', 2778);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (17355, 'Cheese', 'DriedPineNuts', 5396);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (73998, 'DriedHempSeeds', 'InstantBabaGhanoushMix', 716);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (38952, 'InstantQuittenwasserMix', 'Beef', 7947);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (1145, 'InstantCureMix', 'DriedDill', 956);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (99730, 'InstantZirbenschnapsMix', 'InstantPieMix', 8020);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (25008, 'InstantQuittenbrandMix', 'InstantKaurmaMix', 2774);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (25236, 'Jelly', 'InstantSchladererMix', 3709);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (15585, 'InstantObstlerMix', 'InstantHolundergeistMix', 2468);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (23056, 'GroundCumin', 'InstantKornMix', 5265);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (13321, 'TomatoJuice', 'Jelly', 9952);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (69385, 'InstantStrudelMix', 'InstantKartaMix', 3563);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (42223, 'InstantShashlikMix', 'Enchiladas', 4398);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (64861, 'BakingPowder', 'InstantBozbashMix', 9659);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (56927, 'MisoSoup', 'InstantKoumbaraMix', 4017);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (45226, 'InstantMoussakaMix', 'BakingSoda', 5174);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (5277, 'Gnocchi', 'InstantSchwarzbeergeistMix', 1607);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (29038, 'Curry', 'InstantChouxMix', 4408);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (80471, 'InstantVogelbeergeistMix', 'InstantArmagnacMix', 3348);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (57565, 'InstantRakomeloMix', 'InstantSpanakopitaMix', 9318);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (63975, 'DriedPapaya', 'TrailMix', 753);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (80759, 'InstantBatterMix', 'GroundNutmeg', 3994);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (10521, 'InstantPudding', 'Eggs', 4284);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (32091, 'InstantKharchoMix', 'Sashimi', 234);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (68160, 'Fish', 'InstantStuffingMix', 6216);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (95346, 'DriedPapaya', 'Gnocchi', 1420);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (78247, 'Rum', 'DriedRaisins', 6381);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (37452, 'InstantWaffleMix', 'InstantSanddorngeistMix', 3349);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (27454, 'BalsamicVinegar', 'MashedPotatoes', 4343);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (26018, 'Tempura', 'XiVRHeadset', 4035);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (19323, 'InstantMoussakaMix', 'InstantKirschenbrandMix', 7560);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (45552, 'DriedRaspberries', 'InstantOatmeal', 833);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (65685, 'GroundNutmeg', 'Candy', 2662);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (95428, 'GroundCayennePepper', 'InstantPastryMix', 6193);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (42837, 'Marmalade', 'InstantGenepiMix', 9992);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (11814, 'DriedQuinoa', 'Pork', 7324);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (3016, 'InstantBrandyMix', 'SigmaGamingConsole', 5940);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (20830, 'InstantHolundergeistMix', 'InstantKartaMix', 7733);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (12625, 'InstantBrownieMix', 'DriedAlmonds', 2543);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (81515, 'DriedChickpeas', 'InstantSchnappsMix', 4549);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (83068, 'DriedRaspberries', 'InstantKartaMix', 5555);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (66587, 'InstantSeasoningMix', 'InstantSauceMix', 9463);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (87603, 'InstantArmagnacMix', 'Spaghetti', 4349);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (17511, 'DriedPeanuts', 'ZetaHeadphonesX', 2022);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (88738, 'InstantSeasoningMix', 'InstantPancakeMix', 5905);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (53772, 'InstantMoussakaMix', 'InstantPickleMix', 3997);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (95665, 'DriedRosemary', 'InstantQuetschMix', 1664);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (40298, 'HotChocolate', 'Soda', 5615);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (63039, 'DriedBrazilNuts', 'Crackers', 2904);
commit;
prompt 400 records committed...
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (27155, 'InstantGrappaMix', 'AppleJuice', 5705);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (10372, 'InstantTsipouroMix', 'Donuts', 5699);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (80714, 'Cherry', 'InstantMantyMix', 281);
insert into PRODUCT (product_num, product_name, manufactoring, amount)
values (9137, 'InstantMastikaMix', 'InstantMacaronMix', 8004);
commit;
prompt 404 records loaded
prompt Loading HAS...
insert into HAS (product_num, shekem_num)
values (273, 506073);
insert into HAS (product_num, shekem_num)
values (551, 534431);
insert into HAS (product_num, shekem_num)
values (653, 854532);
insert into HAS (product_num, shekem_num)
values (1005, 964677);
insert into HAS (product_num, shekem_num)
values (1103, 341455);
insert into HAS (product_num, shekem_num)
values (1145, 148413);
insert into HAS (product_num, shekem_num)
values (1400, 721523);
insert into HAS (product_num, shekem_num)
values (1441, 367209);
insert into HAS (product_num, shekem_num)
values (1581, 624180);
insert into HAS (product_num, shekem_num)
values (1789, 873452);
insert into HAS (product_num, shekem_num)
values (1861, 852776);
insert into HAS (product_num, shekem_num)
values (1976, 30974);
insert into HAS (product_num, shekem_num)
values (2108, 410160);
insert into HAS (product_num, shekem_num)
values (2406, 232522);
insert into HAS (product_num, shekem_num)
values (2413, 227942);
insert into HAS (product_num, shekem_num)
values (2485, 453313);
insert into HAS (product_num, shekem_num)
values (2527, 31963);
insert into HAS (product_num, shekem_num)
values (2682, 116562);
insert into HAS (product_num, shekem_num)
values (2967, 167604);
insert into HAS (product_num, shekem_num)
values (2968, 60217);
insert into HAS (product_num, shekem_num)
values (3016, 135537);
insert into HAS (product_num, shekem_num)
values (3544, 541579);
insert into HAS (product_num, shekem_num)
values (4273, 773548);
insert into HAS (product_num, shekem_num)
values (4708, 416923);
insert into HAS (product_num, shekem_num)
values (5277, 522483);
insert into HAS (product_num, shekem_num)
values (5561, 531168);
insert into HAS (product_num, shekem_num)
values (5819, 288814);
insert into HAS (product_num, shekem_num)
values (6312, 311430);
insert into HAS (product_num, shekem_num)
values (6468, 669599);
insert into HAS (product_num, shekem_num)
values (6507, 30282);
insert into HAS (product_num, shekem_num)
values (6720, 6281);
insert into HAS (product_num, shekem_num)
values (6768, 390633);
insert into HAS (product_num, shekem_num)
values (6776, 821401);
insert into HAS (product_num, shekem_num)
values (7233, 735853);
insert into HAS (product_num, shekem_num)
values (7295, 893177);
insert into HAS (product_num, shekem_num)
values (8034, 206434);
insert into HAS (product_num, shekem_num)
values (8091, 205387);
insert into HAS (product_num, shekem_num)
values (8780, 786579);
insert into HAS (product_num, shekem_num)
values (9137, 69289);
insert into HAS (product_num, shekem_num)
values (9155, 494340);
insert into HAS (product_num, shekem_num)
values (9953, 194256);
insert into HAS (product_num, shekem_num)
values (10266, 73382);
insert into HAS (product_num, shekem_num)
values (10372, 121857);
insert into HAS (product_num, shekem_num)
values (10521, 86497);
insert into HAS (product_num, shekem_num)
values (10917, 119379);
insert into HAS (product_num, shekem_num)
values (11547, 506461);
insert into HAS (product_num, shekem_num)
values (11814, 782140);
insert into HAS (product_num, shekem_num)
values (11969, 634115);
insert into HAS (product_num, shekem_num)
values (12145, 868389);
insert into HAS (product_num, shekem_num)
values (12151, 858926);
insert into HAS (product_num, shekem_num)
values (12274, 929595);
insert into HAS (product_num, shekem_num)
values (12447, 67634);
insert into HAS (product_num, shekem_num)
values (12625, 945179);
insert into HAS (product_num, shekem_num)
values (13084, 781711);
insert into HAS (product_num, shekem_num)
values (13120, 306020);
insert into HAS (product_num, shekem_num)
values (13321, 189157);
insert into HAS (product_num, shekem_num)
values (13556, 473878);
insert into HAS (product_num, shekem_num)
values (13582, 988718);
insert into HAS (product_num, shekem_num)
values (13995, 463791);
insert into HAS (product_num, shekem_num)
values (14445, 112131);
insert into HAS (product_num, shekem_num)
values (14611, 259254);
insert into HAS (product_num, shekem_num)
values (14976, 775780);
insert into HAS (product_num, shekem_num)
values (15361, 487546);
insert into HAS (product_num, shekem_num)
values (15585, 423443);
insert into HAS (product_num, shekem_num)
values (15661, 302032);
insert into HAS (product_num, shekem_num)
values (15768, 654538);
insert into HAS (product_num, shekem_num)
values (16168, 637105);
insert into HAS (product_num, shekem_num)
values (16266, 49448);
insert into HAS (product_num, shekem_num)
values (16927, 75849);
insert into HAS (product_num, shekem_num)
values (16981, 220923);
insert into HAS (product_num, shekem_num)
values (17355, 667026);
insert into HAS (product_num, shekem_num)
values (17511, 484227);
insert into HAS (product_num, shekem_num)
values (17571, 954574);
insert into HAS (product_num, shekem_num)
values (18388, 255560);
insert into HAS (product_num, shekem_num)
values (18510, 216089);
insert into HAS (product_num, shekem_num)
values (18554, 619045);
insert into HAS (product_num, shekem_num)
values (18877, 333533);
insert into HAS (product_num, shekem_num)
values (19248, 375208);
insert into HAS (product_num, shekem_num)
values (19323, 433289);
insert into HAS (product_num, shekem_num)
values (19641, 684100);
insert into HAS (product_num, shekem_num)
values (19707, 69195);
insert into HAS (product_num, shekem_num)
values (20285, 605339);
insert into HAS (product_num, shekem_num)
values (20613, 918536);
insert into HAS (product_num, shekem_num)
values (20657, 182540);
insert into HAS (product_num, shekem_num)
values (20830, 98391);
insert into HAS (product_num, shekem_num)
values (20895, 777634);
insert into HAS (product_num, shekem_num)
values (21324, 639021);
insert into HAS (product_num, shekem_num)
values (22139, 877710);
insert into HAS (product_num, shekem_num)
values (22346, 890809);
insert into HAS (product_num, shekem_num)
values (23056, 461499);
insert into HAS (product_num, shekem_num)
values (23321, 6884);
insert into HAS (product_num, shekem_num)
values (23742, 385400);
insert into HAS (product_num, shekem_num)
values (23912, 444711);
insert into HAS (product_num, shekem_num)
values (23973, 510914);
insert into HAS (product_num, shekem_num)
values (24609, 824502);
insert into HAS (product_num, shekem_num)
values (25008, 6059);
insert into HAS (product_num, shekem_num)
values (25236, 369488);
insert into HAS (product_num, shekem_num)
values (25667, 537899);
insert into HAS (product_num, shekem_num)
values (26018, 852890);
insert into HAS (product_num, shekem_num)
values (26278, 500441);
commit;
prompt 100 records committed...
insert into HAS (product_num, shekem_num)
values (26340, 862350);
insert into HAS (product_num, shekem_num)
values (26349, 187103);
insert into HAS (product_num, shekem_num)
values (26452, 278807);
insert into HAS (product_num, shekem_num)
values (26455, 46492);
insert into HAS (product_num, shekem_num)
values (26488, 800998);
insert into HAS (product_num, shekem_num)
values (26617, 312840);
insert into HAS (product_num, shekem_num)
values (27155, 945055);
insert into HAS (product_num, shekem_num)
values (27248, 426630);
insert into HAS (product_num, shekem_num)
values (27454, 495164);
insert into HAS (product_num, shekem_num)
values (27510, 34806);
insert into HAS (product_num, shekem_num)
values (27674, 747814);
insert into HAS (product_num, shekem_num)
values (28039, 794650);
insert into HAS (product_num, shekem_num)
values (28135, 355764);
insert into HAS (product_num, shekem_num)
values (28266, 123815);
insert into HAS (product_num, shekem_num)
values (28317, 459731);
insert into HAS (product_num, shekem_num)
values (28582, 714421);
insert into HAS (product_num, shekem_num)
values (28786, 772487);
insert into HAS (product_num, shekem_num)
values (29038, 126293);
insert into HAS (product_num, shekem_num)
values (29441, 17527);
insert into HAS (product_num, shekem_num)
values (29758, 98055);
insert into HAS (product_num, shekem_num)
values (30432, 156762);
insert into HAS (product_num, shekem_num)
values (30478, 934668);
insert into HAS (product_num, shekem_num)
values (30626, 828748);
insert into HAS (product_num, shekem_num)
values (30975, 746984);
insert into HAS (product_num, shekem_num)
values (30985, 674568);
insert into HAS (product_num, shekem_num)
values (31484, 902768);
insert into HAS (product_num, shekem_num)
values (31896, 235197);
insert into HAS (product_num, shekem_num)
values (32091, 641353);
insert into HAS (product_num, shekem_num)
values (32805, 32399);
insert into HAS (product_num, shekem_num)
values (32897, 40200);
insert into HAS (product_num, shekem_num)
values (33104, 640054);
insert into HAS (product_num, shekem_num)
values (33431, 787557);
insert into HAS (product_num, shekem_num)
values (33524, 265983);
insert into HAS (product_num, shekem_num)
values (33697, 709289);
insert into HAS (product_num, shekem_num)
values (33902, 426026);
insert into HAS (product_num, shekem_num)
values (33944, 584952);
insert into HAS (product_num, shekem_num)
values (33990, 115763);
insert into HAS (product_num, shekem_num)
values (33995, 67018);
insert into HAS (product_num, shekem_num)
values (34318, 909445);
insert into HAS (product_num, shekem_num)
values (34488, 946871);
insert into HAS (product_num, shekem_num)
values (34505, 758846);
insert into HAS (product_num, shekem_num)
values (34906, 90392);
insert into HAS (product_num, shekem_num)
values (35121, 723754);
insert into HAS (product_num, shekem_num)
values (35558, 125991);
insert into HAS (product_num, shekem_num)
values (35815, 471559);
insert into HAS (product_num, shekem_num)
values (36022, 898675);
insert into HAS (product_num, shekem_num)
values (36274, 115298);
insert into HAS (product_num, shekem_num)
values (36405, 771672);
insert into HAS (product_num, shekem_num)
values (36591, 730761);
insert into HAS (product_num, shekem_num)
values (36956, 832018);
insert into HAS (product_num, shekem_num)
values (37452, 840988);
insert into HAS (product_num, shekem_num)
values (37508, 939397);
insert into HAS (product_num, shekem_num)
values (38180, 336930);
insert into HAS (product_num, shekem_num)
values (38637, 434188);
insert into HAS (product_num, shekem_num)
values (38952, 437234);
insert into HAS (product_num, shekem_num)
values (38969, 540901);
insert into HAS (product_num, shekem_num)
values (38985, 144328);
insert into HAS (product_num, shekem_num)
values (39397, 680665);
insert into HAS (product_num, shekem_num)
values (39655, 567128);
insert into HAS (product_num, shekem_num)
values (40001, 688844);
insert into HAS (product_num, shekem_num)
values (40081, 825133);
insert into HAS (product_num, shekem_num)
values (40298, 676549);
insert into HAS (product_num, shekem_num)
values (40638, 806906);
insert into HAS (product_num, shekem_num)
values (40754, 174595);
insert into HAS (product_num, shekem_num)
values (41890, 399955);
insert into HAS (product_num, shekem_num)
values (42223, 42429);
insert into HAS (product_num, shekem_num)
values (42591, 891043);
insert into HAS (product_num, shekem_num)
values (42630, 749326);
insert into HAS (product_num, shekem_num)
values (42657, 302605);
insert into HAS (product_num, shekem_num)
values (42837, 934906);
insert into HAS (product_num, shekem_num)
values (43425, 32784);
insert into HAS (product_num, shekem_num)
values (43742, 9775);
insert into HAS (product_num, shekem_num)
values (44091, 753048);
insert into HAS (product_num, shekem_num)
values (44296, 224207);
insert into HAS (product_num, shekem_num)
values (44664, 975287);
insert into HAS (product_num, shekem_num)
values (44829, 915664);
insert into HAS (product_num, shekem_num)
values (44929, 86278);
insert into HAS (product_num, shekem_num)
values (45226, 522565);
insert into HAS (product_num, shekem_num)
values (45332, 530960);
insert into HAS (product_num, shekem_num)
values (45552, 217552);
insert into HAS (product_num, shekem_num)
values (45725, 326682);
insert into HAS (product_num, shekem_num)
values (46041, 598513);
insert into HAS (product_num, shekem_num)
values (46631, 795166);
insert into HAS (product_num, shekem_num)
values (47171, 890952);
insert into HAS (product_num, shekem_num)
values (47336, 855109);
insert into HAS (product_num, shekem_num)
values (47362, 903976);
insert into HAS (product_num, shekem_num)
values (47400, 380225);
insert into HAS (product_num, shekem_num)
values (47407, 202872);
insert into HAS (product_num, shekem_num)
values (47478, 333527);
insert into HAS (product_num, shekem_num)
values (47691, 702657);
insert into HAS (product_num, shekem_num)
values (48062, 146053);
insert into HAS (product_num, shekem_num)
values (48229, 964228);
insert into HAS (product_num, shekem_num)
values (48287, 713863);
insert into HAS (product_num, shekem_num)
values (48499, 765825);
insert into HAS (product_num, shekem_num)
values (49308, 612827);
insert into HAS (product_num, shekem_num)
values (49579, 666022);
insert into HAS (product_num, shekem_num)
values (50635, 26317);
insert into HAS (product_num, shekem_num)
values (50856, 950646);
insert into HAS (product_num, shekem_num)
values (51117, 365167);
insert into HAS (product_num, shekem_num)
values (51270, 100245);
commit;
prompt 200 records committed...
insert into HAS (product_num, shekem_num)
values (51656, 449564);
insert into HAS (product_num, shekem_num)
values (51816, 866480);
insert into HAS (product_num, shekem_num)
values (51950, 27622);
insert into HAS (product_num, shekem_num)
values (52312, 603074);
insert into HAS (product_num, shekem_num)
values (52612, 495176);
insert into HAS (product_num, shekem_num)
values (52644, 776699);
insert into HAS (product_num, shekem_num)
values (52686, 494341);
insert into HAS (product_num, shekem_num)
values (52819, 870935);
insert into HAS (product_num, shekem_num)
values (53012, 464219);
insert into HAS (product_num, shekem_num)
values (53095, 944851);
insert into HAS (product_num, shekem_num)
values (53125, 936852);
insert into HAS (product_num, shekem_num)
values (53231, 453024);
insert into HAS (product_num, shekem_num)
values (53772, 286585);
insert into HAS (product_num, shekem_num)
values (53912, 878965);
insert into HAS (product_num, shekem_num)
values (53968, 789811);
insert into HAS (product_num, shekem_num)
values (55856, 418104);
insert into HAS (product_num, shekem_num)
values (55891, 428126);
insert into HAS (product_num, shekem_num)
values (56222, 214408);
insert into HAS (product_num, shekem_num)
values (56350, 13565);
insert into HAS (product_num, shekem_num)
values (56462, 99473);
insert into HAS (product_num, shekem_num)
values (56787, 955685);
insert into HAS (product_num, shekem_num)
values (56927, 185155);
insert into HAS (product_num, shekem_num)
values (57103, 926701);
insert into HAS (product_num, shekem_num)
values (57215, 978599);
insert into HAS (product_num, shekem_num)
values (57565, 300686);
insert into HAS (product_num, shekem_num)
values (57829, 332175);
insert into HAS (product_num, shekem_num)
values (58434, 36688);
insert into HAS (product_num, shekem_num)
values (58468, 728265);
insert into HAS (product_num, shekem_num)
values (58628, 862693);
insert into HAS (product_num, shekem_num)
values (58653, 362001);
insert into HAS (product_num, shekem_num)
values (59232, 436659);
insert into HAS (product_num, shekem_num)
values (59708, 944486);
insert into HAS (product_num, shekem_num)
values (59874, 835498);
insert into HAS (product_num, shekem_num)
values (59900, 445570);
insert into HAS (product_num, shekem_num)
values (61415, 259586);
insert into HAS (product_num, shekem_num)
values (61781, 54537);
insert into HAS (product_num, shekem_num)
values (62819, 602079);
insert into HAS (product_num, shekem_num)
values (62888, 918882);
insert into HAS (product_num, shekem_num)
values (62889, 252409);
insert into HAS (product_num, shekem_num)
values (63039, 895850);
insert into HAS (product_num, shekem_num)
values (63093, 385915);
insert into HAS (product_num, shekem_num)
values (63537, 850426);
insert into HAS (product_num, shekem_num)
values (63975, 733741);
insert into HAS (product_num, shekem_num)
values (64432, 470253);
insert into HAS (product_num, shekem_num)
values (64861, 362745);
insert into HAS (product_num, shekem_num)
values (65685, 772538);
insert into HAS (product_num, shekem_num)
values (65798, 669525);
insert into HAS (product_num, shekem_num)
values (65869, 117546);
insert into HAS (product_num, shekem_num)
values (66106, 861980);
insert into HAS (product_num, shekem_num)
values (66132, 472186);
insert into HAS (product_num, shekem_num)
values (66323, 823981);
insert into HAS (product_num, shekem_num)
values (66587, 95394);
insert into HAS (product_num, shekem_num)
values (66905, 509566);
insert into HAS (product_num, shekem_num)
values (67201, 766176);
insert into HAS (product_num, shekem_num)
values (67248, 54887);
insert into HAS (product_num, shekem_num)
values (68009, 124710);
insert into HAS (product_num, shekem_num)
values (68059, 910236);
insert into HAS (product_num, shekem_num)
values (68160, 719600);
insert into HAS (product_num, shekem_num)
values (68174, 211566);
insert into HAS (product_num, shekem_num)
values (68266, 558498);
insert into HAS (product_num, shekem_num)
values (68701, 235796);
insert into HAS (product_num, shekem_num)
values (69060, 727827);
insert into HAS (product_num, shekem_num)
values (69203, 446882);
insert into HAS (product_num, shekem_num)
values (69287, 880761);
insert into HAS (product_num, shekem_num)
values (69291, 67910);
insert into HAS (product_num, shekem_num)
values (69363, 514715);
insert into HAS (product_num, shekem_num)
values (69385, 300345);
insert into HAS (product_num, shekem_num)
values (70001, 416781);
insert into HAS (product_num, shekem_num)
values (70283, 166411);
insert into HAS (product_num, shekem_num)
values (70558, 85921);
insert into HAS (product_num, shekem_num)
values (70579, 551870);
insert into HAS (product_num, shekem_num)
values (70621, 822002);
insert into HAS (product_num, shekem_num)
values (70734, 783786);
insert into HAS (product_num, shekem_num)
values (70962, 198343);
insert into HAS (product_num, shekem_num)
values (71603, 897814);
insert into HAS (product_num, shekem_num)
values (71671, 658611);
insert into HAS (product_num, shekem_num)
values (71927, 838693);
insert into HAS (product_num, shekem_num)
values (71981, 933449);
insert into HAS (product_num, shekem_num)
values (72090, 353815);
insert into HAS (product_num, shekem_num)
values (72242, 835158);
insert into HAS (product_num, shekem_num)
values (72328, 707711);
insert into HAS (product_num, shekem_num)
values (72505, 984720);
insert into HAS (product_num, shekem_num)
values (72512, 646209);
insert into HAS (product_num, shekem_num)
values (72526, 83204);
insert into HAS (product_num, shekem_num)
values (72639, 169492);
insert into HAS (product_num, shekem_num)
values (73249, 370765);
insert into HAS (product_num, shekem_num)
values (73312, 163511);
insert into HAS (product_num, shekem_num)
values (73332, 654899);
insert into HAS (product_num, shekem_num)
values (73549, 477692);
insert into HAS (product_num, shekem_num)
values (73777, 1377);
insert into HAS (product_num, shekem_num)
values (73998, 871088);
insert into HAS (product_num, shekem_num)
values (74316, 593333);
insert into HAS (product_num, shekem_num)
values (74625, 902709);
insert into HAS (product_num, shekem_num)
values (74760, 342218);
insert into HAS (product_num, shekem_num)
values (74804, 258417);
insert into HAS (product_num, shekem_num)
values (74912, 589790);
insert into HAS (product_num, shekem_num)
values (74921, 934093);
insert into HAS (product_num, shekem_num)
values (75441, 234507);
insert into HAS (product_num, shekem_num)
values (75791, 357050);
insert into HAS (product_num, shekem_num)
values (75938, 834044);
commit;
prompt 300 records committed...
insert into HAS (product_num, shekem_num)
values (76221, 852015);
insert into HAS (product_num, shekem_num)
values (76308, 38715);
insert into HAS (product_num, shekem_num)
values (76473, 659905);
insert into HAS (product_num, shekem_num)
values (77053, 61503);
insert into HAS (product_num, shekem_num)
values (77133, 553442);
insert into HAS (product_num, shekem_num)
values (77453, 189226);
insert into HAS (product_num, shekem_num)
values (77558, 505657);
insert into HAS (product_num, shekem_num)
values (77717, 980376);
insert into HAS (product_num, shekem_num)
values (77786, 111963);
insert into HAS (product_num, shekem_num)
values (78190, 309688);
insert into HAS (product_num, shekem_num)
values (78247, 213758);
insert into HAS (product_num, shekem_num)
values (78849, 92578);
insert into HAS (product_num, shekem_num)
values (79116, 407393);
insert into HAS (product_num, shekem_num)
values (79458, 564329);
insert into HAS (product_num, shekem_num)
values (79512, 662787);
insert into HAS (product_num, shekem_num)
values (79721, 32118);
insert into HAS (product_num, shekem_num)
values (79740, 295612);
insert into HAS (product_num, shekem_num)
values (79897, 159698);
insert into HAS (product_num, shekem_num)
values (79991, 960070);
insert into HAS (product_num, shekem_num)
values (80211, 704294);
insert into HAS (product_num, shekem_num)
values (80413, 186507);
insert into HAS (product_num, shekem_num)
values (80471, 594348);
insert into HAS (product_num, shekem_num)
values (80714, 93569);
insert into HAS (product_num, shekem_num)
values (80759, 607022);
insert into HAS (product_num, shekem_num)
values (80951, 21822);
insert into HAS (product_num, shekem_num)
values (81071, 16536);
insert into HAS (product_num, shekem_num)
values (81267, 163293);
insert into HAS (product_num, shekem_num)
values (81420, 350312);
insert into HAS (product_num, shekem_num)
values (81515, 677788);
insert into HAS (product_num, shekem_num)
values (81591, 457324);
insert into HAS (product_num, shekem_num)
values (81607, 880920);
insert into HAS (product_num, shekem_num)
values (81713, 691892);
insert into HAS (product_num, shekem_num)
values (81897, 179442);
insert into HAS (product_num, shekem_num)
values (82106, 813595);
insert into HAS (product_num, shekem_num)
values (82297, 120096);
insert into HAS (product_num, shekem_num)
values (82326, 820599);
insert into HAS (product_num, shekem_num)
values (82857, 224921);
insert into HAS (product_num, shekem_num)
values (83068, 595804);
insert into HAS (product_num, shekem_num)
values (83711, 849759);
insert into HAS (product_num, shekem_num)
values (83810, 907451);
insert into HAS (product_num, shekem_num)
values (84260, 945198);
insert into HAS (product_num, shekem_num)
values (84391, 482899);
insert into HAS (product_num, shekem_num)
values (84434, 182079);
insert into HAS (product_num, shekem_num)
values (84652, 587751);
insert into HAS (product_num, shekem_num)
values (85018, 168940);
insert into HAS (product_num, shekem_num)
values (85054, 639525);
insert into HAS (product_num, shekem_num)
values (85120, 678984);
insert into HAS (product_num, shekem_num)
values (85182, 809984);
insert into HAS (product_num, shekem_num)
values (85850, 555809);
insert into HAS (product_num, shekem_num)
values (86056, 911795);
insert into HAS (product_num, shekem_num)
values (86448, 986327);
insert into HAS (product_num, shekem_num)
values (86515, 320651);
insert into HAS (product_num, shekem_num)
values (86605, 353601);
insert into HAS (product_num, shekem_num)
values (86743, 762459);
insert into HAS (product_num, shekem_num)
values (86897, 404678);
insert into HAS (product_num, shekem_num)
values (86899, 206281);
insert into HAS (product_num, shekem_num)
values (86943, 249018);
insert into HAS (product_num, shekem_num)
values (87396, 615120);
insert into HAS (product_num, shekem_num)
values (87603, 878781);
insert into HAS (product_num, shekem_num)
values (87935, 343421);
insert into HAS (product_num, shekem_num)
values (87968, 534968);
insert into HAS (product_num, shekem_num)
values (88172, 936634);
insert into HAS (product_num, shekem_num)
values (88738, 573448);
insert into HAS (product_num, shekem_num)
values (89157, 178432);
insert into HAS (product_num, shekem_num)
values (89218, 53734);
insert into HAS (product_num, shekem_num)
values (89235, 277250);
insert into HAS (product_num, shekem_num)
values (89314, 822088);
insert into HAS (product_num, shekem_num)
values (89415, 423857);
insert into HAS (product_num, shekem_num)
values (89454, 819566);
insert into HAS (product_num, shekem_num)
values (89742, 626780);
insert into HAS (product_num, shekem_num)
values (89799, 111503);
insert into HAS (product_num, shekem_num)
values (89867, 567171);
insert into HAS (product_num, shekem_num)
values (90072, 785594);
insert into HAS (product_num, shekem_num)
values (90651, 626949);
insert into HAS (product_num, shekem_num)
values (91671, 458375);
insert into HAS (product_num, shekem_num)
values (92135, 294982);
insert into HAS (product_num, shekem_num)
values (92138, 21345);
insert into HAS (product_num, shekem_num)
values (92570, 401700);
insert into HAS (product_num, shekem_num)
values (92616, 994313);
insert into HAS (product_num, shekem_num)
values (92723, 597469);
insert into HAS (product_num, shekem_num)
values (94326, 726939);
insert into HAS (product_num, shekem_num)
values (94666, 29474);
insert into HAS (product_num, shekem_num)
values (94711, 246156);
insert into HAS (product_num, shekem_num)
values (94760, 828501);
insert into HAS (product_num, shekem_num)
values (95015, 402617);
insert into HAS (product_num, shekem_num)
values (95088, 29372);
insert into HAS (product_num, shekem_num)
values (95228, 512856);
insert into HAS (product_num, shekem_num)
values (95346, 669718);
insert into HAS (product_num, shekem_num)
values (95428, 463067);
insert into HAS (product_num, shekem_num)
values (95665, 924261);
insert into HAS (product_num, shekem_num)
values (96226, 475710);
insert into HAS (product_num, shekem_num)
values (96687, 881509);
insert into HAS (product_num, shekem_num)
values (96785, 104117);
insert into HAS (product_num, shekem_num)
values (96983, 467896);
insert into HAS (product_num, shekem_num)
values (97588, 561038);
insert into HAS (product_num, shekem_num)
values (97804, 965410);
insert into HAS (product_num, shekem_num)
values (97820, 53907);
insert into HAS (product_num, shekem_num)
values (98302, 683722);
insert into HAS (product_num, shekem_num)
values (98971, 105059);
insert into HAS (product_num, shekem_num)
values (99318, 825788);
commit;
prompt 400 records committed...
insert into HAS (product_num, shekem_num)
values (99345, 706204);
insert into HAS (product_num, shekem_num)
values (99677, 954673);
insert into HAS (product_num, shekem_num)
values (99730, 482641);
insert into HAS (product_num, shekem_num)
values (99807, 202460);
commit;
prompt 404 records loaded
prompt Loading SELLER...
insert into SELLER (shift, total_sales_, supervisor_id, seller_num, id, shekem_num)
values ('NIght', 6106, 3745933, 98322, 994812657, 186507);
insert into SELLER (shift, total_sales_, supervisor_id, seller_num, id, shekem_num)
values ('NIght', 9514, 196828766, 44693, 135231662, 369488);
commit;
prompt 2 records loaded

set feedback on
set define on
prompt Done
