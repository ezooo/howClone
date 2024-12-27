-- drop database howAbout;
create database howAbout;
use howAbout;

create table aboutMember(
	userName varchar(16) ,
    userId varchar(50) primary key,
    userPw varchar(30),
    userTel char(12),
    userAddr varchar(30),
    nx int,
    ny int,
    userDate char(10),
    userEmail varchar(100) unique,
    enabled boolean,
    iconName text
);

create table schedule_db
(
	schedule_id bigint,
    schedule_date char(11),
    schedule_record text,
    weather text
);

create table aboutReview
(
	userId varchar(20),
    reviewText varchar(500),
    reviewDate char(10),
    millisId bigint primary key,
    foreign key (userId) references aboutMember(userId) on delete cascade
);

create table aboutPlace
(
	juso text,
    jibun text,
    category varchar(20),
    title varchar(50),
    status varchar(10),
    foodCategory varchar(20),
    latitude double,
    longitude double,
    updateNum INT AUTO_INCREMENT PRIMARY KEY
);

create table IF NOT EXISTS course
(
    course_id bigint primary key,
    course_name varchar(20),
    userId varchar(20),
    creation_date datetime(3)
)DEFAULT CHARSET=utf8;

create table IF NOT EXISTS course_location
(
	course_id bigint,
    location_name varchar(20),
    location_sequence bigint,
    foreign key(course_id) references course(course_id)
)DEFAULT CHARSET=utf8;

select * from course;
select * from course_location;

create table if not exists schedule(
    schedule_id bigint primary key,
    schedule_record varchar(50),
    schedule_date date,
    weather varchar(30)
);

create table if not exists festival
(
    fesNo bigint auto_increment primary key,
    fstvlNm text,
    opar text,
    fstvlStartDate date,
    fstvlEndDate date,
    fstvlCo text,
    mnnstNm    text,
    auspcInsttNm text,
    suprtInsttNm text,
    phoneNumber text,
    homepageUrl text,
    relateInfo text,
    rdnmadr text,
    lnmadr text,
    latitude text,
    longitude text,     
    referenceDate date
)CHARACTER SET utf8mb4;

create table if not exists festival_db
(
    fesNo bigint auto_increment primary key,
    fstvlNm text,
    opar text,
    fstvlStartDate date,
    fstvlEndDate date,
    fstvlCo text,
    mnnstNm    text,
    auspcInsttNm text,
    suprtInsttNm text,
    phoneNumber text,
    homepageUrl text,
    relateInfo text,
    rdnmadr text,
    lnmadr text,
    latitude text,
    longitude text,     
    referenceDate date
)CHARACTER SET utf8mb4;

create table location
(
	 data_title varchar(20), -- 이름
	 user_address varchar(50), -- 주소
	 latitude varchar(50), -- 위도
	 logitude varchar(50), -- 경도
	 insttnm varchar(20), -- 관리자 기관명
	 category_name1 varchar(20), -- 카테고리1
	 category_name2 varchar(20), -- 카테고리2 (미사용)
	 data_content text, -- 소개
	 telno varchar(20), -- 전화
	 fileurl1 text, -- 사진
	 fileurl2 text,
	 fileurl3 text,
	 fileurl4 text,
     num int primary key auto_increment -- 순번
);
select * from location;

create table recommendation
(
	recommendId bigint primary key,
    userId varchar(20),
    recommendTitle varchar(40),
	recommendContent varchar(500),
	recommendDate varchar(20)
);

create table diary
(
	diaryId bigint primary key,
	userId varchar(20),
    visit_date varchar(20),
    visit_location text,
    address text,
    visit_diary text,
    filename0 varchar(50),
    filename1 varchar(50),
    filename2 varchar(50),
    filename3 varchar(50),
    isopen varchar(5),
    foreign key(userId) references aboutMember(userId)
);

create table if not exists gnLatiInfo
(
	gsndo varchar(4),
    si varchar(8) default null null,
    dongEupMyeon varchar(5) default null null,
    latiX varchar(3),
    logiY varchar(3),
    latitude varchar(20),
    logitude varchar(20)
);

CREATE TABLE addrLocation 
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255),
    longitude DOUBLE,
    latitude DOUBLE,
    x INT,
    y INT
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/longlatList.csv'
INTO TABLE addrLocation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(address, longitude, latitude, x, y);
select * from addrLocation;

create table weatherarea
(
	areaname char(2),
    areacode varchar(10)
);
insert into weatherarea values('거제','11H20403');
insert into weatherarea values('거창','11H20502');
insert into weatherarea values('고성','11H20404');
insert into weatherarea values('김해','11H20304');
insert into weatherarea values('남해','11H20405');
insert into weatherarea values('밀양','11H20601');
insert into weatherarea values('사천','11H20402');
insert into weatherarea values('산청','11H20703');
insert into weatherarea values('양산','11H20102');
insert into weatherarea values('의령','11H20602');
insert into weatherarea values('진주','11H20701');
insert into weatherarea values('창녕','11H20604');
insert into weatherarea values('창원','11H20301');
insert into weatherarea values('통영','11H20401');
insert into weatherarea values('하동','11H20704');
insert into weatherarea values('함안','11H20603');
insert into weatherarea values('함양','11H20501');
insert into weatherarea values('합천','11H20503');
select * from weatherarea;