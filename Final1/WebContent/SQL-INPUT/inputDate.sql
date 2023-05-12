-- foreign key 선언 전 --

-- 멤버 테이블 생성
CREATE TABLE member1(
    id VARCHAR2(20),
    pw VARCHAR2(15) NOT NULL,
    name VARCHAR2(12) NOT NULL,
    birth DATE,
    gender VARCHAR2(1) NOT NULL,
    phone VARCHAR2(14),
    adr VARCHAR2(300),
    nik VARCHAR2(50) NOT NULL UNIQUE,
    jdate DATE,
    money NUMBER DEFAULT 0,
    PRIMARY KEY(id)
);

-- room 테이블 생성
CREATE TABLE room (
    num NUMBER(3) PRIMARY KEY,
    area NUMBER(3) NOT NULL,
    capacity NUMBER(2) NOT NULL,
    airConditioner NUMBER(1) DEFAULT 0 not null,
    computer NUMBER(2) DEFAULT 0 not null,
    whiteboard NUMBER(1) DEFAULT 0 not null,
    wifi VARCHAR2(2) not null,
    refrigerator NUMBER(1) DEFAULT 0 not null,
    image VARCHAR2(200),
    price NUMBER(7,2) not null
);

-- 예약 테이블 생성
create table reservation(
    num number(3),
    nik varchar2(50),
    rtime varchar2(10) not null,
    rnum number(20) not null,
    rdate varchar2(10) not null,
    price number(7,2) not null,
    primary key(rnum)
);

-- 문의사항 테이블 생성
create table inquiry(
    title varchar2(60) not null,
    icontent varchar2(3000) not null,
    nik varchar2(50),
    icomment varchar2(300),
    num number(38),
    id varchar(20),
    primary key(num)
);

-- 리뷰 테이블 생성
create table review(
    num number(38),
    nik varchar2(50),
    rnum number(3) not null,
    recomment varchar2(300),
    title varchar2(60) not null,
    recontent varchar2(3000) not null,
    redate date not null,
    rate number(1) not null
);

-- 리뷰 게시판 시퀀스
create sequence seq_review_num;

-- 문의사항 시퀀스
create sequence seq_inquiry_num;


-- 예시 member1 임의의 데이터
insert into member1
values( 'ryan', '1234', '라이언', sysdate, '010-1111-1111', '주소1', '라이언입니다 ', sysdate, 0);

insert into member1
values( 'chunsik', '1234', '춘식이', sysdate, '010-3333-3333', '주소3', '춘식이입니다 ', sysdate, 0);

insert into member1
values( 'admin', '1234', 'admin', sysdate, '010-2222-2222', '주소2', 'admin', sysdate, 0);

-- 예시 room 데이터
insert into room values(101, 10, 10, 1, 5, 1, 'O', 0, '101',15000);

insert into room values(102, 5, 6, 1, 2, 1, 'O', 0, '102',20000);

insert into room values(103, 20, 15, 1, 10, 1, 'O', 1, '103',17000);
