-- ȸ�� ���̺�
create table member(
	id		    varchar2(30) primary key,
	password	varchar2(40) not null,
	nickname	varchar2(40) not null,
    email       varchar2(80) not null,
    inputdate   date    default sysdate,
    birthdate        number,
    image       varchar2(30) default 'user.png',
    verify      varchar2(1) default 'n',
    signout  date
);

-- ���� ���̺�
create table message(
    num            number   primary key,  
    sender          varchar2(30) not null,
    reader       varchar2(30) not null,
    detail          varchar2(3000) not null,
    send_date       date        default sysdate,
    read_date       date        
);
create sequence message_seq; 

-- ģ�� ���̺�
create table friend(
    id1 varchar2(30) not null,
    id2 varchar2(30) not null,
    code number not null            -- 1 ģ�� 
);

 drop table room;

commit;

-- ���͵�� ���̺�
create table room(
    num             number   primary key,
    id              varchar2(30) not null,   -- ����
    title           varchar2(100) not null,
    comments          varchar2(1000) not null,
    goal            number not null,
    code            number default 0,         --0 ������ 1 ��
    inputdate       date        default sysdate,
    constraint room_fk foreign key(id)
		references member(id) on delete cascade
);
create sequence room_seq;

--���͵�� ���̺�
 create table room_member(
    num        number not null,
    id              varchar2(30),
    code            number default 0,               -- 0 ��û ��� 1 ���
    constraint room_member_fk foreign key(num)
		references room(num) on delete cascade
 );

 
 -- ���͵�� ���� ���̺�
create table board(
    num     number primary key,
    room_num number not null,
    id      varchar2(30) not null,
    title   varchar2(100) not null,
    detail  varchar2(4000) not null,
    originalfile varchar2(200),
    savedfile   varchar2(100),
    code    number default 0,   -- 0 �ϹݰԽñ� 2 Q&A  3 ���� 
    inputdate date default sysdate,
    constraint room_board_fk foreign key(room_num)
		references room(num) on delete cascade
);
create sequence board_seq;

 
 -- Ķ���� sql
create table calendar(
member_Id    	VARCHAR2(100)  	not null,
title       		VARCHAR2(100)   	not null,
schedule_no 	NUMBER         	PRIMARY key,
contents    	VARCHAR2(100)   	not null,
startDT      	VARCHAR2(50)   	NOT NULL,
endDT       	 VARCHAR2(50)   	NOT NULL,
color           VARCHAR2(50),
constraint calendar_fk foreign key(member_id)
		references member(id) on delete cascade
);
create sequence calendar_seq;


-- �ð�(�����ġ)
create table clock(
num     number          primary key,
id      varchar2(30)    not null,
title   varchar2(100)      not null,
inputdate   date        default sysdate,
startT      varchar2(30)    not null,
endT        varchar(30),
total      number,  --�� ����
hcount      number default 0,
scount      number default 0,
 constraint clock_fk foreign key(id)
		references member(id) on delete cascade
);
create sequence clock_seq;

-- �ϱ� ���̺�
create table diary(
num      number  primary key,
id       varchar2(30) not null,   
title   varchar2(50) not null,
detail    varchar2(3000),
star    number not null,
code    number  default 0,
image   varchar2(100) default 'white.jpg',
inputdate date default sysdate,
sentiment varchar2(30),
 constraint diary_fk foreign key(id)
		references member(id) on delete cascade
);
create sequence diary_seq;

-- ��õ ���̺�
create table recommend(
id      varchar2(30) not null,
detail  varchar2(100) not null,
inputdate date default sysdate,
 constraint recommend_fk foreign key(id)
		references member(id) on delete cascade
);
