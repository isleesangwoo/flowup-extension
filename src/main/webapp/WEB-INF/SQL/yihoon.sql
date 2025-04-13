-- ?��?��?�� 계정 ?��?��?�� ?��?��?��?�� SYS ?��?�� SYSTEM ?���? ?��결하?�� ?��?��?�� ?��?�� ?��?��?��. [SYS ?��?��] --
show user;
-- USER?��(�?) "SYS"?��?��?��.

-- ?��?��?�� 계정 ?��?��?�� 계정�? ?��?�� c## 붙이�? ?���? ?��?��?��?���? ?��겠습?��?��.
alter session set "_ORACLE_SCRIPT"=true;
-- Session?��(�?) �?경되?��?��?��?��.

-- ?��?��?�� 계정명�? FINAL_ORAUSER3 ?���? ?��?��?�� gclass ?�� ?��?��?�� 계정?�� ?��?��?��?��?��.
create user FINAL_ORAUSER3 identified by gclass default tablespace users; 
-- User FINAL_ORAUSER3?��(�?) ?��?��?��?��?��?��?��.

-- ?��?��?�� ?��?��?��?���? FINAL_ORAUSER3 ?��?��?�� ?��?��?�� ?��반사?��?�� 계정?���? ?��?��?�� ?��버에 ?��?��?�� ?��?���?�?,
-- ?��?���? ?��?�� ?��?��?�� ?�� ?�� ?��?���? ?��?���?�? 권한?�� �??��?��주겠?��?��?��.
grant connect, resource, create view, unlimited tablespace to FINAL_ORAUSER3;
-- Grant?��(�?) ?��공했?��?��?��.



-------------------------------- ?��?��?��?�� ?��?���? ?��?�� --------------------------------

CREATE TABLE tbl_test (
    no number not null,
    name NVARCHAR2(5) not null
    ,CONSTRAINT PK_tbl_test_no PRIMARY KEY(no)  
);
-- Table TBL_TEST?��(�?) ?��?��?��?��?��?��?��.

select *
from tab;

insert into tbl_test(no, name) values(100, '?��?��');
-- 1 ?�� ?��(�?) ?��?��?��?��?��?��?��.

commit;
-- 커밋 ?���?.

select *
from TBL_EMPLOYEE;

drop table tbl_test purge;
-- Table TBL_TEST?��(�?) ?��?��?��?��?��?��?��.

commit;

------------------------------------- 강이?�� ?��?���? 만들�? ?��?�� -------------------------------------



-- ========== 캘린?�� �??�� ?��?���? ?��?�� ========== --
-- 캘린?�� ?��?���?
CREATE TABLE tbl_calendar_schedule (
   calendarNo     NUMBER(6)     NOT NULL,         -- 캘린?�� ID
   fk_employeeNo  NUMBER(6)     NOT NULL,         -- fk_employeeNo
   calendarTitle  NVARCHAR2(50) NOT NULL,         -- 캘린?�� ?��?�� �?
   startDate      DATE          NOT NULL,         -- ?��?�� ?��?�� ?���?
   endDate        DATE          NOT NULL,         -- ?��?�� ?�� ?���?
   bgColor        NVARCHAR2(50) DEFAULT  'red',   -- ?��?�� 배경 ?��?��
   releaseStatus  NUMBER(1)     DEFAULT  0,       -- 공개 비공�? ?���? / 공개:0 비공�?:1
   registerday    DATE          DEFAULT  sysdate  -- ?��?�� ?���? ?���?
   ,CONSTRAINT PK_tbl_calendar_calendarNo PRIMARY KEY(calendarNo)                                             -- 캘린?�� ID PK �??��
   ,CONSTRAINT FK_tbl_calendar_fk_employeeNo FOREIGN KEY(fk_employeeNo) REFERENCES tbl_employee(employeeNo)   -- ?��?��?��?��블에?�� FK �??��?��
   ,CONSTRAINT CK_tbl_calendar_releaseStatus CHECK( releaseStatus In(0, 1))                                -- 공개:0 비공�?:1
); 


create sequence seq_calendarNo
start with 100001
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_CALENDARNO?��(�?) ?��?��?��?��?��?��?��.


-- 캘린?�� ?��?�� 공유 ?��?���?
CREATE TABLE tbl_calendar_share (
   calendarShareNo        NUMBER(6)     NOT NULL,         -- 공유?���? ID
   fk_requestEmployeeNo   NUMBER(6)     NOT NULL,         -- ?��?�� ?���??�� ?���? 
   fk_responseEmployeeNo  NUMBER(6)     NOT NULL,         -- ?��?�� ?��?��?�� ?���?
   ShareStatus            NUMBER(1)     DEFAULT  0,       -- ??�?, ?��?��, 거절 ?���? / ??�?:0, ?��?��:1, 거절:2
   requestDate            DATE          DEFAULT  sysdate, -- ?���??��?��
   responseDate           DATE          NOT NULL          -- ?��?��?��?��
   ,CONSTRAINT PK_calendarShareNo PRIMARY KEY(calendarShareNo)                                             -- 캘린?�� ID PK �??��
   ,CONSTRAINT FK_share_fk_requestEmployeeNo FOREIGN KEY(fk_requestEmployeeNo) REFERENCES tbl_employee(employeeNo)     -- ?��?��?��?��블에?�� FK �??��?��
   ,CONSTRAINT FK_share_fk_responseEmployeeNo FOREIGN KEY(fk_responseEmployeeNo) REFERENCES tbl_employee(employeeNo)   -- ?��?��?��?��블에?�� FK �??��?��
   ,CONSTRAINT CK_share_ShareStatus CHECK( ShareStatus In('0','1','2'))                                          -- ??�?:0, ?��?��:1, 거절:2
); -- �??�� ?���? 길어?�� 줄일 ?��?�� ?��?��


create sequence seq_calendarShareNo
start with 100001
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_CALENDARSHARENO?��(�?) ?��?��?��?��?��?��?��.

-- ========== 캘린?�� �??�� ?��?���? ?��?�� ========== --











-----------------------------------------------------------------------------------------------
-- ========== ?��?�� �??�� ?��?���? ?��?�� ========== --
-- ?��?�� ??분류 ?��?���?
CREATE TABLE tbl_asset (
   assetNo           NUMBER(6)     NOT NULL,         -- ?��?��?�� ID
   assetTitle        NVARCHAR2(50) NOT NULL,         -- ?��?��?�� ?��?�� ??분류 �? (?��: 4�? 공용 공간)
   assetInfo         CLOB          NOT NULL,         -- ?��?��?�� ?��?�� ?���? (?��: ?��?���? 배치?�� �? 비상�? ?���? ?���?)
   assetRegisterday  DATE          DEFAULT sysdate,  -- ?��?��?�� ?��록일?��
   assetChangeday    DATE          NULL,             -- ?��?��?�� ?��?��?��?��
   classification    NUMBER(6)     NOT NULL,         -- ?��?��?�� / ?��?�� 구분 0 : ?��?��?�� 1 : �?,빔프로젝?��
   CONSTRAINT PK_tbl_asset_assetNo PRIMARY KEY(assetNo)  -- ?��?��?�� ID PK �??��
);

create sequence seq_assetNo
start with 100001
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_ROOMNO?��(�?) ?��?��?��?��?��?��?��.
------------------------------------------------
INSERT INTO tbl_asset (assetNo, assetTitle, assetInfo, assetRegisterday, assetChangeday, classification, asseGroupno, asseDepthno)
VALUES ( seq_assetNo.NEXTVAL, '?��?��?�� 1', '?��?���? 배치?�� �? 비상�? ?���? ?���?', sysdate, NULL, 1, seq_assetNo.NEXTVAL, 0);

select * from tbl_asset;
------------------------------------------------
-- ?��?�� ??분류 ?��?���?





------------------------------------------------
-- ?��?�� ?��?�� ?��?���?
CREATE TABLE tbl_assetDetail (
   assetDetailNo           NUMBER(6)     NOT NULL,           -- ?��?��?�� ?��?�� ID
   fk_assetNo              NUMBER(6)     NOT NULL,           -- tbl_asset ?��?��?�� ID pk
   assetName               NVARCHAR2(50) NOT NULL,           -- ?��?��?�� ?��?�� ?���?
   assetDetailRegisterday  DATE          DEFAULT sysdate,   -- ?��?��?�� ?��?�� ?��록일?��
   assetDetailChangeday    DATE          NULL,              -- ?��?��?�� ?��?�� ?��?��?��?��
   
   CONSTRAINT PK_tbl_assetDetail_assetDeNo PRIMARY KEY(assetDetailNo),  -- ?��?��?�� ?��?�� ID PK �??��
   CONSTRAINT FK_tbl_assetDetail_fk_assetNo FOREIGN KEY(fk_assetNo) REFERENCES tbl_asset(assetNo) ON DELETE CASCADE  -- ?��?��?�� ?��?��블에?�� FK �??��?��
);


create sequence seq_assetDetailNo
start with 100001
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_ASSETDETAILNO?��(�?) ?��?��?��?��?��?��?��.
------------------------------------------------

select *
from tbl_assetDetail;

INSERT INTO tbl_assetDetail (assetDetailNo,fk_assetNo,assetName,assetDetailRegisterday,assetDetailChangeday,asseDeGroupno,asseDeDepthno) 
VALUES (seq_assetDetailNo.nextval, 100029, '?���?', sysdate, NULL, 100016, 1);

INSERT INTO tbl_assetDetail (assetDetailNo,fk_assetNo,assetName,assetDetailRegisterday,assetDetailChangeday,asseDeGroupno,asseDeDepthno) 
VALUES (seq_assetDetailNo.nextval, 100029, '?��?��', sysdate, NULL, 100016, 1);


INSERT INTO tbl_assetDetail (assetDetailNo,fk_assetNo,assetName,assetDetailRegisterday,assetDetailChangeday,asseDeGroupno,asseDeDepthno) 
VALUES (seq_assetDetailNo.nextval, 100027, '?���?', sysdate, NULL, 100016, 1);

commit;
------------------------------------------------

drop table tbl_assetInformation;

desc tbl_assetDetail;

ALTER TABLE tbl_assetInformation ADD release NUMBER(1) DEFAULT 0 NOT NULL;
desc tbl_assetInformation;


select *
from tbl_assetInformation;

-- 비품 ?���? ?��?���?
CREATE TABLE tbl_assetInformation (
   assetInformationNo           NUMBER(6)     NOT NULL,            -- ?��?��?�� ?��?��?���? ID
   fk_assetDetailNo             NUMBER(6)     NOT NULL,            -- tbl_assetDetail ?��?��?��?�� ID fk
   fk_assetNo                   NUMBER(6)     NOT NULL,            -- tbl_asset ?��?�� ID fk
   InformationTitle             NVARCHAR2(50) NULL,                 -- ?��?��?�� 비품 ?���?
   InformationContents          CHAR(1)      DEFAULT 'X',          -- ?��?��?�� 비품 ?���?
   CONSTRAINT PK_tbl_assetInfo_assetInfoNo PRIMARY KEY (assetInformationNo),  -- ?��?��?�� ID PK �??��
   release                      NUMBER(1)    DEFAULT 0    NOT NULL, -- 공개?���?
   CONSTRAINT FK_assetInfo_fk_assetDetailNo FOREIGN KEY (fk_assetDetailNo) REFERENCES tbl_assetDetail(assetDetailNo) ON DELETE CASCADE,  -- ?��?��?��?��?��?��?��블에?�� FK �??��?��
   CONSTRAINT FK_tbl_assetInfo_fk_assetNo FOREIGN KEY (fk_assetNo) REFERENCES tbl_asset(assetNo) ON DELETE CASCADE  -- ?��?��?�� ?��?��블에?�� FK �??��?��
);


create sequence seq_assetInformationNo
start with 100001
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_ASSETINFORMATIONNO?��(�?) ?��?��?��?��?��?��?��.
------------------------------------------------
INSERT INTO tbl_assetInformation (assetInformationNo, fk_assetDetailNo, fk_assetNo, InformationTitle, InformationContents)
VALUES ( seq_assetInformationNo.NEXTVAL, 100014, 100029, '빔프로젝?��', DEFAULT);


select assetInformationNo, fk_assetDetailNo, fk_assetNo, InformationTitle, InformationContents
from tbl_assetInformation
where fk_assetNo = 100029;

commit;

select * from tbl_asset;
------------------------------------------------
select *
from tbl_employee;

select *
from tbl_post;

25/02/15 
25/02/19
insert into tbl_assetReservation(assetReservationNo, fk_assetDetailNo, fk_employeeNo, reservationStart, reservationEnd, reservationDay)
values(seq_roomReservationNo.nextval, 100009, 100012, to_date('2025/02/19 09:00:00', 'yyyy/mm/dd HH24:mi:ss'), to_date('2025/02/19 13:00:00', 'yyyy/mm/dd HH24:mi:ss'), sysdate);

commit;

select *
from tbl_assetDetail;


assetname

select assetNo, assetTitle, assetInfo, assetRegisterday, assetChangeday, classification
		from tbl_asset
        
select * 
from tbl_assetReservation Re join tbl_assetDetail De
on Re.fk_assetdetailno = De.assetdetailno
left join tbl_asset_class ass
on De.fk_assetno = ass.assetno
where Re.fk_employeeno = 100012;



-- ?��?�� ?��?�� ?��?���?
CREATE TABLE tbl_assetReservation (
   assetReservationNo           NUMBER(6)     NOT NULL,          -- ?��?��?�� ?��?��?���? ID
   fk_assetDetailNo             NUMBER(6)     NOT NULL,          -- tbl_roomDetail ?��?��?�� ?��?�� ID fk
   fk_employeeNo               NUMBER(6)     NOT NULL,          -- tbl_employee ?��?�� ID fk
   reservationStart            DATE          NULL,              -- ?��?��?��?��?���?
   reservationEnd              DATE          NULL,              -- ?��?��?��?���?
   reservationDay              DATE          NULL,              -- ?��?��?�� ?���?
   reservationContents         NVARCHAR2(50) NULL               -- ?��?��?�� ?��?��
   ,CONSTRAINT PK_Reservation_ReservaNo PRIMARY KEY(assetReservationNo)                           -- ?��?��?�� ID PK �??��
   ,CONSTRAINT FK_assetInfo_fk_assetDeNo FOREIGN KEY(fk_assetDetailNo) REFERENCES tbl_assetDetail(assetDetailNo) ON DELETE CASCADE    -- ?��?��?��?��?��?��?��블에?�� FK �??��?��
   ,CONSTRAINT FK_Reservation_fk_employeeNo FOREIGN KEY(fk_employeeNo) REFERENCES tbl_employee(employeeNo)   -- ?��?��?��?��블에?�� FK �??��?��
); 

drop table tbl_assetReservation purge;

select assetReservationNo, fk_assetDetailNo, fk_employeeNo, 
       to_char(reservationStart, 'yyyy.mm.dd hh24:mi') as reservationStart, 
       to_char(reservationEnd, 'yyyy.mm.dd hh24:mi') as reservationEnd, 
       to_char(reservationDay, 'yyyy.mm.dd hh24:mi'), 
       reservationContents
from tbl_assetReservation
where to_char(reservationEnd, 'yyyy.mm.dd') between '2025.02.24' and '2025.02.28'
order by assetReservationNo;


12:00
14:30



2:30

5

(reservationStart * 60) - (reservationEnd * 60) / 30 = 30�? ?��?���? ?��?? 것의 개수


create sequence seq_roomReservationNo
start with 100001
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- 
-- ============= ?��?��?�� ?��?�� ?��?�� ============= --

-- ========== ?��?�� �??�� ?��?���? ?��?�� ========== --



insert into tbl_assetReservation(assetReservationNo, fk_assetDetailNo, fk_employeeNo, reservationStart, reservationEnd, reservationContents, reservationDay)
values(seq_roomReservationNo.nextval, 100014, 100012, to_date('2025-02-25 12:00', 'yyyy-mm-dd hh24:mi'), to_date('2025-02-25 14:30', 'yyyy-mm-dd hh24:mi'), '그냥~',  sysdate);


commit;





desc tbl_assetInformation;



select ASSETINFORMATIONNO, FK_ASSETDETAILNO, INFORMATIONTITLE, INFORMATIONCONTENTS, RELEASE
from tbl_assetInformation
where FK_ASSETDETAILNO = 100030;

insert into tbl_assetInformation(ASSETINFORMATIONNO, FK_ASSETDETAILNO, INFORMATIONTITLE, INFORMATIONCONTENTS, RELEASE)
values(seq_assetInformationNo.nextval, 100030, '?��?��?��보드', 'O', 0);


insert into tbl_assetInformation(ASSETINFORMATIONNO, FK_ASSETDETAILNO, INFORMATIONTITLE, INFORMATIONCONTENTS, RELEASE)
values(seq_assetInformationNo.nextval, 100030, '빔프로젝?��', 'X', 1);

commit;







desc tbl_calendar_schedule;


select FK_EMPLOYEENO, SUBJECT, to_char(STARTDATE, 'yyyyMMdd HH24mi') as STARTDATE, to_char(ENDDATE, 'yyyyMMdd HH24mi') as ENDDATE
from tbl_calendar_schedule;





select fk_employeeno, subject, 
       to_char(startdate, 'YYYYMMDD HH24MI') as startdate, 
       to_char(enddate, 'YYYYMMDD HH24MI') as enddate
from tbl_calendar_schedule
where fk_employeeno = 100012
and (
    (startdate between to_date('20250312 0900', 'YYYY-MM-DD HH24:MI') 
                   and to_date('20250312 2130', 'YYYY-MM-DD HH24:MI'))
    or 
    (enddate between to_date('20250312 0900', 'YYYY-MM-DD HH24:MI') 
                 and to_date('20250312 2130', 'YYYY-MM-DD HH24:MI'))
    or 
    (startdate <= to_date('20250312 0900', 'YYYY-MM-DD HH24:MI') 
     and enddate >= to_date('20250312 2130', 'YYYY-MM-DD HH24:MI'))
);



select distinct name, fk_employeeno, subject, 
       to_char(startdate, 'YYYY-MM-DD HH24:MI') as startdate, 
       to_char(enddate, 'YYYY-MM-DD HH24:MI') as enddate
from tbl_calendar_schedule cs join tbl_employee em
on cs.fk_employeeno = em.employeeno
where 
    (startdate <= to_date('20250312 235959', 'YYYY-MM-DD HH24:MI:SS') 
     and enddate >= to_date('20250312 000000', 'YYYY-MM-DD HH24:MI:SS'));













--------------------------------------------------------
--  DDL for Table TBL_LOGINHISTORY
--------------------------------------------------------
drop table TBL_LOGINHISTORY purge;

select HISTORYNO, FK_EMPLOYEENO, to_char(LOGINDATE, 'yyyy-MM-dd HH24:mi:ss') as LOGINDATE, CLIENTIP
from TBL_LOGINHISTORY
where fk_employeeno = 100012
order by LOGINDATE desc;

CREATE TABLE TBL_LOGINHISTORY
("HISTORYNO" NUMBER NOT NULL, 
 "FK_EMPLOYEENO" NUMBER(6) NOT NULL, 
 "LOGINDATE" DATE DEFAULT sysdate, 
 "CLIENTIP" VARCHAR2(20),
 CONSTRAINT PK_TBL_LOGINHISTORY_HISTORYNO PRIMARY KEY(HISTORYNO),
 CONSTRAINT FK_TBL_LOGINHISTORY_EMPLOYEENO FOREIGN KEY (FK_EMPLOYEENO) REFERENCES TBL_EMPLOYEE(EMPLOYEENO) ON DELETE CASCADE
)

CREATE SEQUENCE historyno;

commit;

--------------------------------------------------------
--  DDL for Index PK_TBL_LOGINHISTORY
--------------------------------------------------------

  CREATE UNIQUE INDEX "MYMVC_USER"."PK_TBL_LOGINHISTORY" ON "MYMVC_USER"."TBL_LOGINHISTORY" ("HISTORYNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table TBL_LOGINHISTORY
--------------------------------------------------------

  ALTER TABLE "MYMVC_USER"."TBL_LOGINHISTORY" MODIFY ("FK_USERID" NOT NULL ENABLE);
  ALTER TABLE "MYMVC_USER"."TBL_LOGINHISTORY" MODIFY ("LOGINDATE" NOT NULL ENABLE);
  ALTER TABLE "MYMVC_USER"."TBL_LOGINHISTORY" MODIFY ("CLIENTIP" NOT NULL ENABLE);
  ALTER TABLE "MYMVC_USER"."TBL_LOGINHISTORY" ADD CONSTRAINT "PK_TBL_LOGINHISTORY" PRIMARY KEY ("HISTORYNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBL_LOGINHISTORY
--------------------------------------------------------

  ALTER TABLE "MYMVC_USER"."TBL_LOGINHISTORY" ADD CONSTRAINT "FK_TBL_LOGINHISTORY_FK_USERID" FOREIGN KEY ("FK_USERID")
	  REFERENCES "MYMVC_USER"."TBL_MEMBER" ("USERID") ENABLE;


select BOARDNO, BOARDNAME, BOARDDESC, ISPUBLIC, CREATEDBY, CREATEDAT, STATUS
from tbl_board
order by CREATEDBY desc;

desc tbl_board;







select V.postNo, V.fk_boardNo, V.fk_employeeNo, V.name, V.subject,V.content, 

            V.readCount, V.regDate, V.commentCount, V.allowComments,
            V.isNotice, V.noticeEndDate, V.likeCount,
            b.boardNo, b.boardName,B.createdBy,sysdate AS currentDate,
            ps.positionName
from
(
    SELECT  V.postNo, V.fk_boardNo, V.fk_employeeNo, V.name, V.subject,V.content, 
            V.readCount, V.regDate, V.commentCount, V.allowComments,
            V.isNotice, V.noticeEndDate, V.likeCount,
            b.boardNo, b.boardName,B.createdBy,sysdate AS currentDate ,
            ps.positionName,
            row_number() over(order by postNo desc) AS rno
    FROM tbl_post V
    JOIN tbl_board b 
    ON V.fk_boardNo = b.boardNo
    join tbl_employee E 
    on v.fk_employeeNo = E.employeeNo
    JOIN tbl_position ps 
    on e.FK_positionNo = ps.positionNo
    order by V.postNo;
) V
where rno Between 1 and 5;







SELECT 
    V.postNo, V.fk_boardNo, V.fk_employeeNo, V.name, V.subject, V.content, 
    V.readCount, V.regDate, V.commentCount, V.allowComments,
    V.isNotice, V.noticeEndDate, V.likeCount,
    V.boardNo, V.boardName, V.createdBy, V.currentDate,
    V.positionName
FROM (
    SELECT  
        P.postNo, P.fk_boardNo, P.fk_employeeNo, P.name, P.subject, P.content, 
        P.readCount, P.regDate, P.commentCount, P.allowComments,
        P.isNotice, P.noticeEndDate, P.likeCount,
        B.boardNo, B.boardName, B.createdBy, 
        SYSDATE AS currentDate,
        PS.positionName,
        ROW_NUMBER() OVER (ORDER BY P.postNo DESC) AS rno
    FROM tbl_post P
    JOIN tbl_board B ON P.fk_boardNo = B.boardNo
    JOIN tbl_employee E ON P.fk_employeeNo = E.employeeNo
    JOIN tbl_position PS ON E.FK_positionNo = PS.positionNo
) V
WHERE V.rno BETWEEN 1 AND 5;





select seq, fk_userid, name, content, regdate, fileName, orgFilename, fileSize
from
(
    select seq, fk_userid, name, content, to_char(regdate, 'yyyy-mm-dd hh24:mi:ss') AS regdate
         , row_number() over(order by seq desc) AS rno
         , nvl(fileName, ' ') AS fileName, nvl(orgFilename, ' ') AS orgFilename, nvl(to_char(fileSize), ' ') AS fileSize
    from tbl_comment
    where parentSeq = to_number(#{parentSeq})
) V
where rno Between #{startRno} and #{endRno}
        
        
        
        
