use howAbout;

create table aboutMember(
   userName varchar(10) ,
    userId varchar(20) primary key,
    userPw varchar(20),
    userTel char(12),
    userAddr varchar(100),
    userDate char(10),
    userEamil varchar(100) unique,
    enabled boolean
);

create table schedule_db(
	schedule_id bigint,
    schedule_date char(11),
    schedule_record text,
    weather text
);

create table aboutReview(
	userId varchar(20),
    reviewText varchar(500),
    reviewDate char(10),
    millisId bigint primary key,
    foreign key (userId) references aboutMember(userId) on delete cascade
);

create table aboutPlace(
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

create table IF NOT EXISTS course(
    course_id bigint primary key,
    course_name varchar(20),
    userId varchar(20),
    creation_date datetime(3)
)DEFAULT CHARSET=utf8;
drop table course;
create table IF NOT EXISTS course_location(
	course_id bigint,
    location_name varchar(20),
    location_sequence bigint,
    foreign key(course_id) references course(course_id)
)DEFAULT CHARSET=utf8;
select * from course;
select * from course_location;
drop table course_location;
insert into course (course_id, course_name, userId, creation_date) values(1,"first","user1","2024-12-17");
insert into course_location (course_id, location_name) values(1,"장소3");
select c.course_id, c.course_name, c.userId, c.creation_date, l.location_name, l.location_sequence
from course c
join course_location l on c.course_id = l.course_id
where c.userId = "user1";

create table if not exists schedule(
    schedule_id bigint primary key,
    schedule_record varchar(50),
    schedule_date date,
    weather varchar(30)
);

create table if not exists festival(
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

create table if not exists festival_db(
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

insert into festival(fstvlNm,opar,fstvlStartDate,fstvlEndDate,fstvlCo,mnnstNm,auspcInsttNm,suprtInsttNm,phoneNumber,homepageUrl,relateInfo,rdnmadr,lnmadr,latitude,longitude,referenceDate)
select fstvlNm,opar,fstvlStartDate,fstvlEndDate,fstvlCo,mnnstNm,auspcInsttNm,suprtInsttNm,phoneNumber,homepageUrl,relateInfo,rdnmadr,lnmadr,latitude,longitude,referenceDate from festival_db
where rdnmadr like "경상남도%" or lnmadr like "경상남도%";

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
	 fileurl5 text,
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
	diaryId long,
	userId varchar(20),
    visit_date varchar(20),
    visit_diary varchar(500),
    filename varchar(50)
);

create table diaryimage
(
	diaryId bigint,	-- 이거 다이어리랑 연결할 외래키
    filename varchar(30)
);

create table if not exists gnLatiInfo(
	gsndo varchar(4),
    si varchar(8) default null null,
    dongEupMyeon varchar(5) default null null,
    latiX varchar(3),
    logiY varchar(3),
    latitude varchar(20),
    logitude varchar(20)
);
drop table gnLatiInfo;
select * from gnLatiInfo;
select distinct si from gnLatiInfo where si is not null ;