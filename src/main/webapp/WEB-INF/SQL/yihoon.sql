-- ?€?Ό?΄ κ³μ  ??±? ??΄?? SYS ?? SYSTEM ?Όλ‘? ?°κ²°ν?¬ ??? ?΄?Ό ?©??€. [SYS ??] --
show user;
-- USER?΄(κ°?) "SYS"???€.

-- ?€?Ό?΄ κ³μ  ??±? κ³μ λͺ? ?? c## λΆμ΄μ§? ?κ³? ??±??λ‘? ?κ² μ΅??€.
alter session set "_ORACLE_SCRIPT"=true;
-- Session?΄(κ°?) λ³?κ²½λ??΅??€.

-- ?€?Ό?΄ κ³μ λͺμ? FINAL_ORAUSER3 ?΄κ³? ??Έ? gclass ?Έ ?¬?©? κ³μ ? ??±?©??€.
create user FINAL_ORAUSER3 identified by gclass default tablespace users; 
-- User FINAL_ORAUSER3?΄(κ°?) ??±???΅??€.

-- ??? ??±??΄μ§? FINAL_ORAUSER3 ?΄?Ό? ?€?Ό?΄ ?Όλ°μ¬?©? κ³μ ?κ²? ?€?Ό?΄ ?λ²μ ? ??΄ ??΄μ§?κ³?,
-- ??΄λΈ? ??± ?±?±? ?  ? ??λ‘? ?¬?¬κ°?μ§? κΆν? λΆ??¬?΄μ£Όκ² ?΅??€.
grant connect, resource, create view, unlimited tablespace to FINAL_ORAUSER3;
-- Grant?(λ₯?) ?±κ³΅ν?΅??€.



-------------------------------- ??€?Έ?© ??΄λΈ? ??± --------------------------------

CREATE TABLE tbl_test (
    no number not null,
    name NVARCHAR2(5) not null
    ,CONSTRAINT PK_tbl_test_no PRIMARY KEY(no)  
);
-- Table TBL_TEST?΄(κ°?) ??±???΅??€.

select *
from tab;

insert into tbl_test(no, name) values(100, '?΄?');
-- 1 ? ?΄(κ°?) ?½????΅??€.

commit;
-- μ»€λ° ?λ£?.

select *
from TBL_EMPLOYEE;

drop table tbl_test purge;
-- Table TBL_TEST?΄(κ°?) ?­? ???΅??€.

commit;

------------------------------------- κ°μ΄? ??΄λΈ? λ§λ€κΈ? ?? -------------------------------------



-- ========== μΊλ¦°? κ΄?? ¨ ??΄λΈ? ??± ========== --
-- μΊλ¦°? ??΄λΈ?
CREATE TABLE tbl_calendar_schedule (
   calendarNo     NUMBER(6)     NOT NULL,         -- μΊλ¦°? ID
   fk_employeeNo  NUMBER(6)     NOT NULL,         -- fk_employeeNo
   calendarTitle  NVARCHAR2(50) NOT NULL,         -- μΊλ¦°? ?Ό?  λͺ?
   startDate      DATE          NOT NULL,         -- ?Ό?  ?? ? μ§?
   endDate        DATE          NOT NULL,         -- ?Ό?  ? ? μ§?
   bgColor        NVARCHAR2(50) DEFAULT  'red',   -- ?Ό?  λ°°κ²½ ??
   releaseStatus  NUMBER(1)     DEFAULT  0,       -- κ³΅κ° λΉκ³΅κ°? ?¬λΆ? / κ³΅κ°:0 λΉκ³΅κ°?:1
   registerday    DATE          DEFAULT  sysdate  -- ?Ό?  ?±λ‘? ? μ§?
   ,CONSTRAINT PK_tbl_calendar_calendarNo PRIMARY KEY(calendarNo)                                             -- μΊλ¦°? ID PK μ§?? 
   ,CONSTRAINT FK_tbl_calendar_fk_employeeNo FOREIGN KEY(fk_employeeNo) REFERENCES tbl_employee(employeeNo)   -- ?¬???΄λΈμ? FK κ°?? Έ?΄
   ,CONSTRAINT CK_tbl_calendar_releaseStatus CHECK( releaseStatus In(0, 1))                                -- κ³΅κ°:0 λΉκ³΅κ°?:1
); 


create sequence seq_calendarNo
start with 100001
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_CALENDARNO?΄(κ°?) ??±???΅??€.


-- μΊλ¦°? ?Ό?  κ³΅μ  ??΄λΈ?
CREATE TABLE tbl_calendar_share (
   calendarShareNo        NUMBER(6)     NOT NULL,         -- κ³΅μ ?μ²? ID
   fk_requestEmployeeNo   NUMBER(6)     NOT NULL,         -- ?Ό?  ?μ²?? ?¬λ²? 
   fk_responseEmployeeNo  NUMBER(6)     NOT NULL,         -- ?Ό?  ??΅? ?¬λ²?
   ShareStatus            NUMBER(1)     DEFAULT  0,       -- ??κΈ?, ??½, κ±°μ  ?¬λΆ? / ??κΈ?:0, ??½:1, κ±°μ :2
   requestDate            DATE          DEFAULT  sysdate, -- ?μ²??Ό?
   responseDate           DATE          NOT NULL          -- ??΅?Ό?
   ,CONSTRAINT PK_calendarShareNo PRIMARY KEY(calendarShareNo)                                             -- μΊλ¦°? ID PK μ§?? 
   ,CONSTRAINT FK_share_fk_requestEmployeeNo FOREIGN KEY(fk_requestEmployeeNo) REFERENCES tbl_employee(employeeNo)     -- ?¬???΄λΈμ? FK κ°?? Έ?΄
   ,CONSTRAINT FK_share_fk_responseEmployeeNo FOREIGN KEY(fk_responseEmployeeNo) REFERENCES tbl_employee(employeeNo)   -- ?¬???΄λΈμ? FK κ°?? Έ?΄
   ,CONSTRAINT CK_share_ShareStatus CHECK( ShareStatus In('0','1','2'))                                          -- ??κΈ?:0, ??½:1, κ±°μ :2
); -- κΈ?? ?λ¬? κΈΈμ΄? μ€μΌ ?? ??


create sequence seq_calendarShareNo
start with 100001
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_CALENDARSHARENO?΄(κ°?) ??±???΅??€.

-- ========== μΊλ¦°? κ΄?? ¨ ??΄λΈ? ??± ========== --











-----------------------------------------------------------------------------------------------
-- ========== ??½ κ΄?? ¨ ??΄λΈ? ??± ========== --
-- ??° ??λΆλ₯ ??΄λΈ?
CREATE TABLE tbl_asset (
   assetNo           NUMBER(6)     NOT NULL,         -- ???€ ID
   assetTitle        NVARCHAR2(50) NOT NULL,         -- ???€ ?₯? ??λΆλ₯ λͺ? (?: 4μΈ? κ³΅μ© κ³΅κ°)
   assetInfo         CLOB          NOT NULL,         -- ???€ ?₯? ? λ³? (?: ??κΈ? λ°°μΉ? λ°? λΉμκ΅? ?μΉ? ?¬μ§?)
   assetRegisterday  DATE          DEFAULT sysdate,  -- ???€ ?±λ‘μΌ?
   assetChangeday    DATE          NULL,             -- ???€ ?? ?Ό?
   classification    NUMBER(6)     NOT NULL,         -- ???€ / ??° κ΅¬λΆ 0 : ???€ 1 : μ°?,λΉνλ‘μ ?Έ
   CONSTRAINT PK_tbl_asset_assetNo PRIMARY KEY(assetNo)  -- ???€ ID PK μ§?? 
);

create sequence seq_assetNo
start with 100001
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_ROOMNO?΄(κ°?) ??±???΅??€.
------------------------------------------------
INSERT INTO tbl_asset (assetNo, assetTitle, assetInfo, assetRegisterday, assetChangeday, classification, asseGroupno, asseDepthno)
VALUES ( seq_assetNo.NEXTVAL, '???€ 1', '??κΈ? λ°°μΉ? λ°? λΉμκ΅? ?μΉ? ?¬μ§?', sysdate, NULL, 1, seq_assetNo.NEXTVAL, 0);

select * from tbl_asset;
------------------------------------------------
-- ??° ??λΆλ₯ ??΄λΈ?





------------------------------------------------
-- ??° ??Έ ??΄λΈ?
CREATE TABLE tbl_assetDetail (
   assetDetailNo           NUMBER(6)     NOT NULL,           -- ???€ ??Έ ID
   fk_assetNo              NUMBER(6)     NOT NULL,           -- tbl_asset ???€ ID pk
   assetName               NVARCHAR2(50) NOT NULL,           -- ???€ ??Έ ?΄λ¦?
   assetDetailRegisterday  DATE          DEFAULT sysdate,   -- ???€ ??Έ ?±λ‘μΌ?
   assetDetailChangeday    DATE          NULL,              -- ???€ ??Έ ?? ?Ό?
   
   CONSTRAINT PK_tbl_assetDetail_assetDeNo PRIMARY KEY(assetDetailNo),  -- ???€ ??Έ ID PK μ§?? 
   CONSTRAINT FK_tbl_assetDetail_fk_assetNo FOREIGN KEY(fk_assetNo) REFERENCES tbl_asset(assetNo) ON DELETE CASCADE  -- ???€ ??΄λΈμ? FK κ°?? Έ?΄
);


create sequence seq_assetDetailNo
start with 100001
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_ASSETDETAILNO?΄(κ°?) ??±???΅??€.
------------------------------------------------

select *
from tbl_assetDetail;

INSERT INTO tbl_assetDetail (assetDetailNo,fk_assetNo,assetName,assetDetailRegisterday,assetDetailChangeday,asseDeGroupno,asseDeDepthno) 
VALUES (seq_assetDetailNo.nextval, 100029, '?λ³?', sysdate, NULL, 100016, 1);

INSERT INTO tbl_assetDetail (assetDetailNo,fk_assetNo,assetName,assetDetailRegisterday,assetDetailChangeday,asseDeGroupno,asseDeDepthno) 
VALUES (seq_assetDetailNo.nextval, 100029, '?¬?', sysdate, NULL, 100016, 1);


INSERT INTO tbl_assetDetail (assetDetailNo,fk_assetNo,assetName,assetDetailRegisterday,assetDetailChangeday,asseDeGroupno,asseDeDepthno) 
VALUES (seq_assetDetailNo.nextval, 100027, '?λ¬?', sysdate, NULL, 100016, 1);

commit;
------------------------------------------------

drop table tbl_assetInformation;

desc tbl_assetDetail;

ALTER TABLE tbl_assetInformation ADD release NUMBER(1) DEFAULT 0 NOT NULL;
desc tbl_assetInformation;


select *
from tbl_assetInformation;

-- λΉν ? λ³? ??΄λΈ?
CREATE TABLE tbl_assetInformation (
   assetInformationNo           NUMBER(6)     NOT NULL,            -- ???€ ?΄?©? λ³? ID
   fk_assetDetailNo             NUMBER(6)     NOT NULL,            -- tbl_assetDetail ??°??Έ ID fk
   fk_assetNo                   NUMBER(6)     NOT NULL,            -- tbl_asset ??° ID fk
   InformationTitle             NVARCHAR2(50) NULL,                 -- ???€ λΉν ?΄λ¦?
   InformationContents          CHAR(1)      DEFAULT 'X',          -- ???€ λΉν ? λ¬?
   CONSTRAINT PK_tbl_assetInfo_assetInfoNo PRIMARY KEY (assetInformationNo),  -- ???€ ID PK μ§?? 
   release                      NUMBER(1)    DEFAULT 0    NOT NULL, -- κ³΅κ°?¬λΆ?
   CONSTRAINT FK_assetInfo_fk_assetDetailNo FOREIGN KEY (fk_assetDetailNo) REFERENCES tbl_assetDetail(assetDetailNo) ON DELETE CASCADE,  -- ???€??Έ??΄λΈμ? FK κ°?? Έ?΄
   CONSTRAINT FK_tbl_assetInfo_fk_assetNo FOREIGN KEY (fk_assetNo) REFERENCES tbl_asset(assetNo) ON DELETE CASCADE  -- ???€ ??΄λΈμ? FK κ°?? Έ?΄
);


create sequence seq_assetInformationNo
start with 100001
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- Sequence SEQ_ASSETINFORMATIONNO?΄(κ°?) ??±???΅??€.
------------------------------------------------
INSERT INTO tbl_assetInformation (assetInformationNo, fk_assetDetailNo, fk_assetNo, InformationTitle, InformationContents)
VALUES ( seq_assetInformationNo.NEXTVAL, 100014, 100029, 'λΉνλ‘μ ?Έ', DEFAULT);


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



-- ??Έ ??½ ??΄λΈ?
CREATE TABLE tbl_assetReservation (
   assetReservationNo           NUMBER(6)     NOT NULL,          -- ???€ ?΄?©? λ³? ID
   fk_assetDetailNo             NUMBER(6)     NOT NULL,          -- tbl_roomDetail ???€ ??Έ ID fk
   fk_employeeNo               NUMBER(6)     NOT NULL,          -- tbl_employee ?¬? ID fk
   reservationStart            DATE          NULL,              -- ?΄?©???κ°?
   reservationEnd              DATE          NULL,              -- ?΄?©??κ°?
   reservationDay              DATE          NULL,              -- ??½? ? μ§?
   reservationContents         NVARCHAR2(50) NULL               -- ??½? ?΄? 
   ,CONSTRAINT PK_Reservation_ReservaNo PRIMARY KEY(assetReservationNo)                           -- ???€ ID PK μ§?? 
   ,CONSTRAINT FK_assetInfo_fk_assetDeNo FOREIGN KEY(fk_assetDetailNo) REFERENCES tbl_assetDetail(assetDetailNo) ON DELETE CASCADE    -- ???€??Έ??΄λΈμ? FK κ°?? Έ?΄
   ,CONSTRAINT FK_Reservation_fk_employeeNo FOREIGN KEY(fk_employeeNo) REFERENCES tbl_employee(employeeNo)   -- ?¬???΄λΈμ? FK κ°?? Έ?΄
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

(reservationStart * 60) - (reservationEnd * 60) / 30 = 30λΆ? ?¨?λ‘? ??? κ²μ κ°μ


create sequence seq_roomReservationNo
start with 100001
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- 
-- ============= ???€ ??½ ??± ============= --

-- ========== ??½ κ΄?? ¨ ??΄λΈ? ??± ========== --



insert into tbl_assetReservation(assetReservationNo, fk_assetDetailNo, fk_employeeNo, reservationStart, reservationEnd, reservationContents, reservationDay)
values(seq_roomReservationNo.nextval, 100014, 100012, to_date('2025-02-25 12:00', 'yyyy-mm-dd hh24:mi'), to_date('2025-02-25 14:30', 'yyyy-mm-dd hh24:mi'), 'κ·Έλ₯~',  sysdate);


commit;





desc tbl_assetInformation;



select ASSETINFORMATIONNO, FK_ASSETDETAILNO, INFORMATIONTITLE, INFORMATIONCONTENTS, RELEASE
from tbl_assetInformation
where FK_ASSETDETAILNO = 100030;

insert into tbl_assetInformation(ASSETINFORMATIONNO, FK_ASSETDETAILNO, INFORMATIONTITLE, INFORMATIONCONTENTS, RELEASE)
values(seq_assetInformationNo.nextval, 100030, '??΄?Έλ³΄λ', 'O', 0);


insert into tbl_assetInformation(ASSETINFORMATIONNO, FK_ASSETDETAILNO, INFORMATIONTITLE, INFORMATIONCONTENTS, RELEASE)
values(seq_assetInformationNo.nextval, 100030, 'λΉνλ‘μ ?Έ', 'X', 1);

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
        
        
        
        
