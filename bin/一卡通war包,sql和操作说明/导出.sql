--------------------------------------------------------
--  文件已创建 - 星期二-十二月-18-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table STAFF_TABLE
--------------------------------------------------------

  CREATE TABLE jx180718."STAFF_TABLE" 
   (	"S_ID" VARCHAR2(20 BYTE), 
	"S_NUMBER" VARCHAR2(20 BYTE), 
	"S_PWD" VARCHAR2(20 BYTE), 
	"S_NAME" VARCHAR2(20 BYTE), 
	"S_KESHI" VARCHAR2(20 BYTE), 
	"S_STATE" VARCHAR2(20 BYTE), 
	"R_ID" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table SCHETABLE
--------------------------------------------------------

  CREATE TABLE jx180718."SCHETABLE" 
   (	"SC_ID" VARCHAR2(20 BYTE), 
	"S_ID" VARCHAR2(20 BYTE), 
	"SC_DATE" VARCHAR2(20 BYTE), 
	"SCHE_TIME" VARCHAR2(20 BYTE)
   );
--------------------------------------------------------
--  DDL for Table SALERULE
--------------------------------------------------------

  CREATE TABLE jx180718."SALERULE" 
   (	"STARTPRICE" VARCHAR2(100 BYTE), 
	"RAISEPRICE0" NUMBER, 
	"RAISEPRICE1" NUMBER, 
	"RAISEPRICE2" NUMBER, 
	"DEPOSIT" NUMBER, 
	"STARTTIME" VARCHAR2(100 BYTE), 
	"R_ID" NUMBER, 
	"OVERTIME" VARCHAR2(100 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table ROLETABLE
--------------------------------------------------------

  CREATE TABLE jx180718."ROLETABLE" 
   (	"R_ID" VARCHAR2(20 BYTE), 
	"R_NAME" VARCHAR2(20 BYTE), 
	"D_ID" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table ROLE_MENU
--------------------------------------------------------

  CREATE TABLE jx180718."ROLE_MENU" 
   (	"R_ID" VARCHAR2(20 BYTE), 
	"M_ID" VARCHAR2(20 BYTE), 
	"M_NAME" VARCHAR2(20 BYTE), 
	"M_STATE" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table PRESTABLE
--------------------------------------------------------

  CREATE TABLE jx180718."PRESTABLE" 
   (	"P_ID" VARCHAR2(20 BYTE), 
	"C_ID" VARCHAR2(20 BYTE), 
	"P_NAME" VARCHAR2(20 BYTE), 
	"P_TAKE" VARCHAR2(20 BYTE), 
	"P_NUMBER" VARCHAR2(20 BYTE), 
	"P_UNIT" VARCHAR2(20 BYTE), 
	"P_PRICE" VARCHAR2(20 BYTE), 
	"P_TOTAL" VARCHAR2(20 BYTE), 
	"S_ID" VARCHAR2(20 BYTE)
   )  ;
--------------------------------------------------------
--  DDL for Table PATIENTTABLE
--------------------------------------------------------

  CREATE TABLE jx180718."PATIENTTABLE" 
   (	"C_ID" VARCHAR2(50 BYTE), 
	"P_NAME" VARCHAR2(20 BYTE), 
	"P_SEX" VARCHAR2(20 BYTE), 
	"P_AGE" VARCHAR2(20 BYTE), 
	"P_CITY" VARCHAR2(20 BYTE), 
	"P_IDCARD" VARCHAR2(20 BYTE), 
	"P_PHONE" VARCHAR2(20 BYTE), 
	"P_ADDRESS" VARCHAR2(20 BYTE), 
	"C_BALANCE" VARCHAR2(20 BYTE), 
	"C_DEPOSIT" VARCHAR2(20 BYTE)
   )  ;
 

   COMMENT ON COLUMN jx180718."PATIENTTABLE"."C_ID" IS '病人编号';
 
   COMMENT ON COLUMN jx180718."PATIENTTABLE"."P_NAME" IS '姓名';
 
   COMMENT ON COLUMN jx180718."PATIENTTABLE"."P_SEX" IS '性别';
 
   COMMENT ON COLUMN jx180718."PATIENTTABLE"."P_AGE" IS '年龄';
 
   COMMENT ON COLUMN jx180718."PATIENTTABLE"."P_CITY" IS '籍贯';
 
   COMMENT ON COLUMN jx180718."PATIENTTABLE"."P_IDCARD" IS '身份证';
 
   COMMENT ON COLUMN jx180718."PATIENTTABLE"."P_PHONE" IS '联系电话';
 
   COMMENT ON COLUMN jx180718."PATIENTTABLE"."P_ADDRESS" IS '现住址';
 
   COMMENT ON COLUMN jx180718."PATIENTTABLE"."C_BALANCE" IS '卡余额';
 
   COMMENT ON COLUMN jx180718."PATIENTTABLE"."C_DEPOSIT" IS '卡押金';
--------------------------------------------------------
--  DDL for Table PARAMETER
--------------------------------------------------------

  CREATE TABLE jx180718."PARAMETER" 
   (	"PA_ID" VARCHAR2(20 BYTE), 
	"PA_NAME" VARCHAR2(20 BYTE), 
	"PA_TYPE" VARCHAR2(20 BYTE), 
	"PA_STATE" VARCHAR2(20 BYTE), 
	"PA_FID" VARCHAR2(20 BYTE)
   )  ;
--------------------------------------------------------
--  DDL for Table LOGTABLE
--------------------------------------------------------

  CREATE TABLE jx180718."LOGTABLE" 
   (	"L_ID" VARCHAR2(20 BYTE), 
	"U_ID" VARCHAR2(20 BYTE), 
	"L_TIME" VARCHAR2(20 BYTE), 
	"L_EVEN" VARCHAR2(20 BYTE)
   )  ;
--------------------------------------------------------
--  DDL for Table MENU_TREE
--------------------------------------------------------

  CREATE TABLE jx180718."MENU_TREE" 
   (	"M_ID" VARCHAR2(20 BYTE), 
	"L_MID" VARCHAR2(20 BYTE), 
	"MT_ID" VARCHAR2(20 BYTE), 
	"M_STATE" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table MENUTABLE
--------------------------------------------------------

  CREATE TABLE jx180718."MENUTABLE" 
   (	"M_ID" VARCHAR2(20 BYTE), 
	"M_NAME" VARCHAR2(20 BYTE), 
	"M_URL" VARCHAR2(100 BYTE), 
	"L_MID" VARCHAR2(20 BYTE), 
	"M_STATE" VARCHAR2(20 BYTE)
   )  ;
--------------------------------------------------------
--  DDL for Table APPLYTABLE
--------------------------------------------------------

  CREATE TABLE jx180718."APPLYTABLE" 
   (	"A_ID" VARCHAR2(20 BYTE), 
	"A_AUDITOR" VARCHAR2(20 BYTE), 
	"A_AUTIME" VARCHAR2(20 BYTE), 
	"C_APPLYER" VARCHAR2(20 BYTE), 
	"A_APPNUMBER" VARCHAR2(20 BYTE), 
	"C_IMPTIME" VARCHAR2(20 BYTE), 
	"STATE" VARCHAR2(20 BYTE)
   )  ;
 

   COMMENT ON COLUMN jx180718."APPLYTABLE"."A_ID" IS '编号';
 
   COMMENT ON COLUMN jx180718."APPLYTABLE"."A_AUDITOR" IS '领用人';
 
   COMMENT ON COLUMN jx180718."APPLYTABLE"."A_AUTIME" IS '审核时间';
 
   COMMENT ON COLUMN jx180718."APPLYTABLE"."C_APPLYER" IS 'c_applyer';
 
   COMMENT ON COLUMN jx180718."APPLYTABLE"."A_APPNUMBER" IS '申请数量';
--------------------------------------------------------
--  DDL for Table APPOINTMENT_TABLE
--------------------------------------------------------

  CREATE TABLE jx180718."APPOINTMENT_TABLE" 
   (	"APP_ID" VARCHAR2(20 BYTE), 
	"SC_ID" VARCHAR2(20 BYTE), 
	"APP_STATE" VARCHAR2(20 BYTE), 
	"P_ID" VARCHAR2(20 BYTE), 
	"APP_TIME" VARCHAR2(20 BYTE), 
	"DOC_TIME" VARCHAR2(20 BYTE), 
	"DOC_NAME" VARCHAR2(20 BYTE), 
	"P_NAME" VARCHAR2(20 BYTE), 
	"DOC_DEPT" VARCHAR2(20 BYTE), 
	"DOC_DATE" VARCHAR2(20 BYTE)
   )  ;
 

   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."APP_ID" IS '挂号编号';
 
   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."SC_ID" IS '排班编号';
 
   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."APP_STATE" IS '取号状态';
 
   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."P_ID" IS '病人编号';
 
   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."APP_TIME" IS '预约时间';
 
   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."DOC_TIME" IS '门诊时间';
 
   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."DOC_NAME" IS '医生';
 
   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."P_NAME" IS '病人';
 
   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."DOC_DEPT" IS '科室';
 
   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."DOC_DATE" IS '门诊日期';
--------------------------------------------------------
--  DDL for Table CARD_MSG
--------------------------------------------------------

  CREATE TABLE jx180718."CARD_MSG" 
   (	"C_ID" VARCHAR2(20 BYTE), 
	"C_PREFIX" VARCHAR2(20 BYTE), 
	"C_NUMBER" VARCHAR2(20 BYTE), 
	"C_STATE" VARCHAR2(20 BYTE), 
	"C_APPLYER" VARCHAR2(20 BYTE), 
	"C_IMPTIME" VARCHAR2(20 BYTE), 
	"C_APPID" VARCHAR2(50 BYTE)
   )  ;
 

   COMMENT ON COLUMN jx180718."CARD_MSG"."C_ID" IS '卡编号';
 
   COMMENT ON COLUMN jx180718."CARD_MSG"."C_PREFIX" IS '前缀';
 
   COMMENT ON COLUMN jx180718."CARD_MSG"."C_NUMBER" IS '卡号';
 
   COMMENT ON COLUMN jx180718."CARD_MSG"."C_STATE" IS '卡状态';
 
   COMMENT ON COLUMN jx180718."CARD_MSG"."C_APPLYER" IS '申请人';
 
   COMMENT ON COLUMN jx180718."CARD_MSG"."C_IMPTIME" IS '申请数量';
 
   COMMENT ON COLUMN jx180718."CARD_MSG"."C_APPID" IS '申请id';
--------------------------------------------------------
--  DDL for Table CARD_EVENT
--------------------------------------------------------

  CREATE TABLE jx180718."CARD_EVENT" 
   (	"E_ID" NUMBER, 
	"C_ID" VARCHAR2(20 BYTE), 
	"E_EVENT" VARCHAR2(20 BYTE), 
	"E_TIME" VARCHAR2(20 BYTE), 
	"S_ID" VARCHAR2(20 BYTE), 
	"E_MONEY" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table DEPTTABLE
--------------------------------------------------------

  CREATE TABLE jx180718."DEPTTABLE" 
   (	"D_ID" VARCHAR2(20 BYTE), 
	"D_NAME" VARCHAR2(20 BYTE), 
	"D_TYPE" VARCHAR2(20 BYTE)
   )  ;
--------------------------------------------------------
--  DDL for Table DOCTORTABLE
--------------------------------------------------------

  CREATE TABLE jx180718."DOCTORTABLE" 
   (	"DOC_ID" VARCHAR2(20 BYTE), 
	"DOC_DATE" VARCHAR2(60 BYTE), 
	"DOC_NAME" VARCHAR2(20 BYTE), 
	"S_ID" VARCHAR2(20 BYTE), 
	"XINGQI" VARCHAR2(20 BYTE), 
	"DOC_DEPT" VARCHAR2(20 BYTE), 
	"TIME" VARCHAR2(20 BYTE)
   ) ;
REM INSERTING into jx180718.STAFF_TABLE
SET DEFINE OFF;
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('1','张三','123','123','Tom','男','1');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('2','123','123','123','001','已删除','1');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('21','1234','123','不修边','1','启用','1');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('22','12345','123','网无','1','启用','1');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('23','12345','123','网无','1','启用','1');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('24','12345','123','网无','1','启用','1');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('25','111','123','网无','内科','启用','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('26','aa1','123','网无','内科','启用','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('61','1Q2W243','123','MM','002','001','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('62','1Q2W243','123','MM','002','001','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('63','1Q2W243','123','MM','002','001','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('64','1Q2W243','123','MM','002','001','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('65','1Q2W243','123','MM','002','001','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('81','5555','123','12-6版','001','启用',null);
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('82','666','123','河鲈为','001','启用',null);
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('83','999','123','何炉啊','001','启用',null);
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('84','444','123','HEWLEU ','001','启用',null);
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('85','S1S1','123','SDASD','001','启用',null);
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('86','wqwqw','wqwqw','人才何','001','已删除','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('87','wqwqw11','123456','123','001','启用','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('88','xxx','123','123','001','启用','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('89','888','123','123','001','启用','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('90','11','123','hed ','001','启用','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('91','mmm','123','123','001','启用','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('92','ddd','123','123','001','禁用','2');
REM INSERTING into jx180718.SCHETABLE
SET DEFINE OFF;
REM INSERTING into jx180718.SALERULE
SET DEFINE OFF;
Insert into jx180718.SALERULE (STARTPRICE,RAISEPRICE0,RAISEPRICE1,RAISEPRICE2,DEPOSIT,STARTTIME,R_ID,OVERTIME) values ('100',1,20,100,1000,'456',2,'456');
Insert into jx180718.SALERULE (STARTPRICE,RAISEPRICE0,RAISEPRICE1,RAISEPRICE2,DEPOSIT,STARTTIME,R_ID,OVERTIME) values ('15',12121,12122,1111,12,'12',14,'12');
Insert into jx180718.SALERULE (STARTPRICE,RAISEPRICE0,RAISEPRICE1,RAISEPRICE2,DEPOSIT,STARTTIME,R_ID,OVERTIME) values ('100',1,20,100,1000,'ss',21,'sda');
REM INSERTING into jx180718.ROLETABLE
SET DEFINE OFF;
Insert into jx180718.ROLETABLE (R_ID,R_NAME,D_ID) values ('4','管理员','001');
Insert into jx180718.ROLETABLE (R_ID,R_NAME,D_ID) values ('1','超级管理员','001');
Insert into jx180718.ROLETABLE (R_ID,R_NAME,D_ID) values ('2','收费员','001');
Insert into jx180718.ROLETABLE (R_ID,R_NAME,D_ID) values ('3','医生','001');
REM INSERTING into jx180718.ROLE_MENU
SET DEFINE OFF;
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('1','30','卡片管理','启用');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('1','31','系统管理','启用');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('1','32','卡片业务','启用');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('1','33','日常事务','启用');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('1','34','统计查询','启用');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('2','35','卡片管理','禁止');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('2','36','系统管理','禁止');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('2','37','卡片业务','启用');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('2','38','日常事务','启用');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('2','39','统计查询','启用');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('3','40','卡片管理','禁止');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('3','41','系统管理','禁止');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('3','42','卡片业务','启用');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('3','43','日常事务','启用');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('3','44','统计查询','启用');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('4','45','卡片管理','启用');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('4','46','系统管理','启用');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('4','47','卡片业务','禁止');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('4','48','日常事务','禁止');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('4','49','统计查询','禁止');
REM INSERTING into jx180718.PRESTABLE
SET DEFINE OFF;
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('1','ss0000003','白路湾','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('2','ss0000003','白路湾','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('3','ss0000003','白路湾','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('4','ss0000003','白路湾','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('5','ss0000003','白路湾','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('6','ss0000003','白路湾','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('7','ss0000003','白路湾','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('8','ss0000003','白路湾','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('9','ss0000003','白路湾','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('10','ss0000003','白路湾','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('21','ss0000003','白路湾','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('22','ss0000003','sddsdsd','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('23','ss0000003','sddsdsd','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('24','ss0000003','sddsdsd','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('25','ss0000003','sddsdsd','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('26','ss0000003','sddsdsd','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('27','ss0000003','wewwwwwwwwwwwq','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('28','ss0000003','wewwwwwwwwwwwq','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('29','ss0000003','wewwwwwwwwwwwq','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('30','ss0000003','wewwwwwwwwwwwq','口服','3','盒','150','450','张医生');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('31','ss0000003','wewwwwwwwwwwwq','口服','3','盒','150','450','张医生');
REM INSERTING into jx180718.PATIENTTABLE
SET DEFINE OFF;
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss0000007','sdsa','ss','ss','ss','ss','ss','ss','ss','ss');
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss0000003','何炉伟','女','10岁1周','福州','562711892039876542','15890987654','福建省福州市仓山区','120','5');
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss00000012','1','男','1岁1周','1','1','1','1','1106','5');
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss0000021','1','男','1岁1周','1','1','1','1','-4','5');
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss0000008',null,null,null,null,null,null,null,null,null);
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss0000006',null,null,null,null,null,null,null,null,null);
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss00000010','1','男','1岁1周','1','1','1','1','-4','5');
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss0000020','1','男','1岁1周','1','1','1','1','6','5');
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss0000016','q','男','q岁q周','q','q','q','q','-4','5');
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss0000018','ss0000018','男','1岁1周','11111','11','1','1','-4','5');
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('dd0000033','1','男','21岁21周','2','121','21','21','212116','5');
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('dd0000034','1','男','1212岁2周','11','1','1','1','-4','5');
REM INSERTING into jx180718.PARAMETER
SET DEFINE OFF;
REM INSERTING into jx180718.LOGTABLE
SET DEFINE OFF;
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('70','ss0000003','2018年12月17日','充值');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('71','ss0000003','2018年12月17日','充值');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('81','不修边','2018年12月18日','医生排班');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('82','不修边','2018年12月18日','医生排班');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('83','不修边','2018年12月18日','医生排班');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('84','不修边','2018年12月18日','医生排班');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('85','不修边','2018年12月18日','医生排班');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('86','不修边','2018年12月18日','医生排班');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('87','不修边','2018年12月18日','医生排班');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('101','不修边','2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('102','不修边','2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('103','不修边','2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('104','不修边','2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('105',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('106',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('107',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('108',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('109',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('110',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('111',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('112',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('113',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('114',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('115',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('116',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('117',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('118',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('119',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('120',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('68','不修边','2018年12月17日','医生排班');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('69','不修边','2018年12月17日','医生排班');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('121',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('122',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('123',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('124','不修边','2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('125','不修边','2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('126',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('127','不修边','2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('128','不修边','2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('129','不修边','2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('130',null,'2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('131','不修边','2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('132','不修边','2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('133','不修边','2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('134','不修边','2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('135','不修边','2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('136','不修边','2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('137','不修边','2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('138','不修边','2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('139','不修边','2018年12月18日','修改权限');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('140','不修边','2018年12月18日','卡入库');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('141','不修边','2018年12月18日','卡入库');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('142','不修边','2018年12月18日','卡入库');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('143','不修边','2018年12月18日','卡入库');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('144','不修边','2018年12月18日','卡入库');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('145','不修边','2018年12月18日','卡入库');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('146','不修边','2018年12月18日','卡入库');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('147','不修边','2018年12月18日','卡入库');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('148','不修边','2018年12月18日','卡入库');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('149','不修边','2018年12月18日','卡入库');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('150','不修边','2018年12月18日','卡入库');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('151','不修边','2018年12月18日','卡入库');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('152','不修边','2018年12月18日','卡入库');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('153','不修边','2018年12月18日','卡入库');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('154','不修边','2018年12月18日','卡入库');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('155','不修边','2018年12月18日','卡入库');
REM INSERTING into jx180718.MENU_TREE
SET DEFINE OFF;
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('9','30','3','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('10','30','4','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('16','31','5','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('17','31','6','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('18','31','7','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('19','31','8','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('20','31','9','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('21','31','10','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('11','32','11','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('12','32','12','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('13','32','13','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('14','32','14','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('15','33','15','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('22','34','16','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('23','34','17','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('7','35','18','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('8','35','19','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('9','35','20','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('10','35','21','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('16','36','22','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('17','36','23','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('18','36','24','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('19','36','25','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('20','36','26','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('21','36','27','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('11','37','28','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('12','37','29','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('13','37','30','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('14','37','31','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('15','38','32','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('22','39','33','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('23','39','34','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('7','30','1','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('8','30','2','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('7','40','35','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('8','40','36','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('9','40','37','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('10','40','38','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('16','41','39','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('17','41','40','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('18','41','41','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('19','41','42','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('20','41','43','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('21','41','44','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('11','42','45','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('12','42','46','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('13','42','47','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('14','42','48','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('15','43','49','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('22','44','50','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('23','44','51','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('7','45','52','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('8','45','53','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('9','45','54','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('10','45','55','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('16','46','56','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('17','46','57','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('18','46','58','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('19','46','59','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('20','46','60','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('21','46','61','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('11','47','62','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('12','47','63','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('13','47','64','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('14','47','65','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('15','48','66','禁用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('22','49','67','启用');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('23','49','68','启用');
REM INSERTING into jx180718.MENUTABLE
SET DEFINE OFF;
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('1',null,null,'#','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('2','卡片业务',null,'1','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('3','卡片管理',null,'1','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('4','系统管理',null,'1','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('5','统计查询',null,'1','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('6','日常事务',null,'1','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('7','卡入库','CardInServlet?action=addCardManage&currentPage=1','3','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('8','卡查询','ModifyCardServlet?action=modify&currentPage=1','3','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('9','领卡审批','ExamineApplyServlet?action=enter_exam&currentPage=1','3','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('10','卡注销','CancleCardServlet?action=cancle_Main&currentPage=1','3','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('11','领卡','Collar_CardServlet?action=enter_apply&currentPage=1','2','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('12','售卡','brower/charge_net/applycard/sell_Card.jsp','2','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('13','换卡','brower/charge_net/applycard/changeCard.jsp','2','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('14','退卡','brower/charge_net/applycard/retreatCard.jsp','2','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('15','处方退费','brower/charge_net/manageCard/permissionmanage.jsp','6','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('16','人员管理','ManageServlet?action=staffManage','4','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('17','权限管理','Permi_ManageServlet?action=enter_permi&current_id=1','4','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('18','菜单管理','brower/charge_net/welcome.jsp','4','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('19','医生排班','Doctor_Servlet?action=enter_doct&current_id=1','4','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('20','日志查看','LogServlet?action=enter_log&current_id=1&currentPage=1','4','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('21','参数管理','brower/charge_net/welcome.jsp','4','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('22','领卡查询','SearchServlet?action=card_search&currentPage=1','5','启用');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('23','工作量统计','SearchServlet?action=works&currentPage=1','5','启用');
REM INSERTING into jx180718.APPLYTABLE
SET DEFINE OFF;
Insert into jx180718.APPLYTABLE (A_ID,A_AUDITOR,A_AUTIME,C_APPLYER,A_APPNUMBER,C_IMPTIME,STATE) values ('1','sdsda','13465','不修边','1','2018年12月11日','车市');
Insert into jx180718.APPLYTABLE (A_ID,A_AUDITOR,A_AUTIME,C_APPLYER,A_APPNUMBER,C_IMPTIME,STATE) values ('2','网无','2018年12月11日','不修边','2','2018年12月11日','已审核');
Insert into jx180718.APPLYTABLE (A_ID,A_AUDITOR,A_AUTIME,C_APPLYER,A_APPNUMBER,C_IMPTIME,STATE) values ('3',null,null,'不修边','3','2018年12月11日','待审核');
Insert into jx180718.APPLYTABLE (A_ID,A_AUDITOR,A_AUTIME,C_APPLYER,A_APPNUMBER,C_IMPTIME,STATE) values ('4',null,null,'不修边','4','2018年12月11日','待审核');
Insert into jx180718.APPLYTABLE (A_ID,A_AUDITOR,A_AUTIME,C_APPLYER,A_APPNUMBER,C_IMPTIME,STATE) values ('5',null,null,'不修边','5','2018年12月11日','待审核');
Insert into jx180718.APPLYTABLE (A_ID,A_AUDITOR,A_AUTIME,C_APPLYER,A_APPNUMBER,C_IMPTIME,STATE) values ('6',null,null,'不修边','6','2018年12月11日','待审核');
Insert into jx180718.APPLYTABLE (A_ID,A_AUDITOR,A_AUTIME,C_APPLYER,A_APPNUMBER,C_IMPTIME,STATE) values ('7',null,null,'不修边','7','2018年12月11日','待审核');
Insert into jx180718.APPLYTABLE (A_ID,A_AUDITOR,A_AUTIME,C_APPLYER,A_APPNUMBER,C_IMPTIME,STATE) values ('8',null,null,'不修边','8','2018年12月11日','待审核');
REM INSERTING into jx180718.APPOINTMENT_TABLE
SET DEFINE OFF;
Insert into jx180718.APPOINTMENT_TABLE (APP_ID,SC_ID,APP_STATE,P_ID,APP_TIME,DOC_TIME,DOC_NAME,P_NAME,DOC_DEPT,DOC_DATE) values ('1','ss','ss','ss','ss','ss','ss','ss','ss','ss');
Insert into jx180718.APPOINTMENT_TABLE (APP_ID,SC_ID,APP_STATE,P_ID,APP_TIME,DOC_TIME,DOC_NAME,P_NAME,DOC_DEPT,DOC_DATE) values ('2',null,null,null,null,'00:00','何炉啊',null,'内科','2018-12-18');
Insert into jx180718.APPOINTMENT_TABLE (APP_ID,SC_ID,APP_STATE,P_ID,APP_TIME,DOC_TIME,DOC_NAME,P_NAME,DOC_DEPT,DOC_DATE) values ('3',null,null,null,null,'09:00','何炉啊',null,'内科','2018-12-01');
Insert into jx180718.APPOINTMENT_TABLE (APP_ID,SC_ID,APP_STATE,P_ID,APP_TIME,DOC_TIME,DOC_NAME,P_NAME,DOC_DEPT,DOC_DATE) values ('4',null,null,null,null,'12:00','何炉啊',null,'内科','2018-12-01');
Insert into jx180718.APPOINTMENT_TABLE (APP_ID,SC_ID,APP_STATE,P_ID,APP_TIME,DOC_TIME,DOC_NAME,P_NAME,DOC_DEPT,DOC_DATE) values ('5',null,null,null,null,'15:30','何炉啊',null,'内科','2018-12-01');
Insert into jx180718.APPOINTMENT_TABLE (APP_ID,SC_ID,APP_STATE,P_ID,APP_TIME,DOC_TIME,DOC_NAME,P_NAME,DOC_DEPT,DOC_DATE) values ('6',null,null,null,null,'08:00--9:00','人才何',null,'内科','2018-12-17');
Insert into jx180718.APPOINTMENT_TABLE (APP_ID,SC_ID,APP_STATE,P_ID,APP_TIME,DOC_TIME,DOC_NAME,P_NAME,DOC_DEPT,DOC_DATE) values ('7',null,'预约','ss0000003','2018-12-18','10:00--11:00','123','何炉伟','内科','2018-12-19');
Insert into jx180718.APPOINTMENT_TABLE (APP_ID,SC_ID,APP_STATE,P_ID,APP_TIME,DOC_TIME,DOC_NAME,P_NAME,DOC_DEPT,DOC_DATE) values ('8',null,null,null,null,'10:00--11:00','123',null,'内科','2018-12-18');
REM INSERTING into jx180718.CARD_MSG
SET DEFINE OFF;
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000003','ss','0000003','已注销','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000004','ss','0000004','已注销','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000005','ss','0000005','已注销','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000010','AA','0000010','待领用','不修边','2018年12月18日','AA0000010');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000011','AA','0000011','待领用','不修边','2018年12月18日','AA0000011');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000012','AA','0000012','待领用','不修边','2018年12月18日','AA0000012');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000013','AA','0000013','待领用','不修边','2018年12月18日','AA0000013');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000014','AA','0000014','待领用','不修边','2018年12月18日','AA0000014');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000015','AA','0000015','待领用','不修边','2018年12月18日','AA0000015');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000016','AA','0000016','待领用','不修边','2018年12月18日','AA0000016');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000017','AA','0000017','待领用','不修边','2018年12月18日','AA0000017');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000018','AA','0000018','待领用','不修边','2018年12月18日','AA0000018');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000019','AA','0000019','待领用','不修边','2018年12月18日','AA0000019');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000016','ss','0000016','已领用','网无','2018年12月08日','1');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000017','ss','0000017','已领用','网无','2018年12月08日','2');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000018','ss','0000018','已领用','网无','2018年12月08日','3');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000019','ss','0000019','已领用','网无','2018年12月08日','2');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000020','ss','0000020','已领用','网无','2018年12月08日','2');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000021','ss','0000021','已领用','网无','2018年12月08日','2');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000022','ss','0000022','已领用','网无','2018年12月08日','2');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000033','dd','0000033','已售出','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000034','dd','0000034','已售出','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000035','dd','0000035','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000036','dd','0000036','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000037','dd','0000037','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000038','dd','0000038','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000039','dd','0000039','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000040','dd','0000040','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000041','dd','0000041','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000042','dd','0000042','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000043','dd','0000043','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000044','dd','0000044','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ww0000011','ww','0000011','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('zz0000011','zz','0000011','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000022','dd','0000022','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('rr0000001','rr','0000001','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('xx0000022','xx','0000022','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000022','qq','0000022','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000023','qq','0000023','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000024','qq','0000024','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000025','qq','0000025','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000026','qq','0000026','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000027','qq','0000027','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000028','qq','0000028','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000001','ss','0000001','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000002','ss','0000002','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000029','qq','0000029','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000030','qq','0000030','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000031','qq','0000031','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000032','qq','0000032','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000033','qq','0000033','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000077','qq','0000077','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000078','qq','0000078','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000079','qq','0000079','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000080','qq','0000080','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000081','qq','0000081','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000082','qq','0000082','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000083','qq','0000083','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000084','qq','0000084','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000085','qq','0000085','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000086','qq','0000086','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000087','qq','0000087','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000088','qq','0000088','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000001','fz','0000001','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000002','fz','0000002','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000003','fz','0000003','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000004','fz','0000004','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000005','fz','0000005','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000006','fz','0000006','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000007','fz','0000007','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000008','fz','0000008','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000009','fz','0000009','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000010','fz','0000010','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000011','fz','0000011','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000012','fz','0000012','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000013','fz','0000013','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000014','fz','0000014','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000015','fz','0000015','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000016','fz','0000016','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000017','fz','0000017','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000018','fz','0000018','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000019','fz','0000019','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000020','fz','0000020','待领用','网无','2018年12月08日','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000020','AA','0000020','待领用','不修边','2018年12月18日','AA0000020');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000021','AA','0000021','待领用','不修边','2018年12月18日','AA0000021');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000022','AA','0000022','待领用','不修边','2018年12月18日','AA0000022');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('SS0000022','SS','0000022','待领用','不修边','2018年12月18日','SS0000022');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('SS0000023','SS','0000023','待领用','不修边','2018年12月18日','SS0000023');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('SS0000024','SS','0000024','待领用','不修边','2018年12月18日','SS0000024');
REM INSERTING into jx180718.CARD_EVENT
SET DEFINE OFF;
Insert into jx180718.CARD_EVENT (E_ID,C_ID,E_EVENT,E_TIME,S_ID,E_MONEY) values (61,'FZ00000001','测试','19:21','是s11 ','100');
Insert into jx180718.CARD_EVENT (E_ID,C_ID,E_EVENT,E_TIME,S_ID,E_MONEY) values (62,'FZ00000001','测试','19:21','是s11 ','100');
Insert into jx180718.CARD_EVENT (E_ID,C_ID,E_EVENT,E_TIME,S_ID,E_MONEY) values (63,'FZ00000001','测试','19:21','是s11 ','100');
Insert into jx180718.CARD_EVENT (E_ID,C_ID,E_EVENT,E_TIME,S_ID,E_MONEY) values (64,'FZ00000001','测试','19:21','是s11 ','100');
Insert into jx180718.CARD_EVENT (E_ID,C_ID,E_EVENT,E_TIME,S_ID,E_MONEY) values (65,'FZ00000001','测试','19:21','是s11 ','100');
Insert into jx180718.CARD_EVENT (E_ID,C_ID,E_EVENT,E_TIME,S_ID,E_MONEY) values (81,'FZ00000011','测试','19:21','是s11 ','100');
Insert into jx180718.CARD_EVENT (E_ID,C_ID,E_EVENT,E_TIME,S_ID,E_MONEY) values (1,'s','s','ww','aa','ww');
Insert into jx180718.CARD_EVENT (E_ID,C_ID,E_EVENT,E_TIME,S_ID,E_MONEY) values (21,'dd0000033','售卡','2018年12月16日','212121',null);
Insert into jx180718.CARD_EVENT (E_ID,C_ID,E_EVENT,E_TIME,S_ID,E_MONEY) values (22,'dd0000034','售卡','2018年12月16日','不修边','1');
REM INSERTING into jx180718.DEPTTABLE
SET DEFINE OFF;
Insert into jx180718.DEPTTABLE (D_ID,D_NAME,D_TYPE) values ('001','内科','001');
Insert into jx180718.DEPTTABLE (D_ID,D_NAME,D_TYPE) values ('002','外科','001');
REM INSERTING into jx180718.DOCTORTABLE
SET DEFINE OFF;
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('25','2018-12-17','何炉啊','83','星期一','内科','11:30');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('26','2018-12-03','河鲈为','82','星期一','内科','00:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('27','2018-12-20','何炉啊','83','星期四','内科','07:30');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('28','2019-01-01','123','91','星期二','内科','00:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('29','2018-12-03','00','00-15','星期一','14','00:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('30','2018-12-17','00','00-15','星期一','14','06:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('41','2018-12-18','何炉啊','83','星期二','内科','00:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('42','2018-12-01','何炉啊','83','星期六','内科','09:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('43','2018-12-01','何炉啊','83','星期六','内科','12:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('44','2018-12-01','何炉啊','83','星期六','内科','15:30');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('45','2018-12-17','人才何','86','星期一','内科','08:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('46','2018-12-19','123','88','星期三','内科','10:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('47','2018-12-18','123','87','星期二','内科','10:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('23','2018-12-06','12-6版','81','星期四','内科','00:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('24','2018-12-16','河鲈为','82','星期日','内科','09:30');
--------------------------------------------------------
--  DDL for Index STAFF_TABLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX jx180718."STAFF_TABLE_PK" ON jx180718."STAFF_TABLE" ("S_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718 ;
--------------------------------------------------------
--  DDL for Index SALERULE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX jx180718."SALERULE_PK" ON jx180718."SALERULE" ("R_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718 ;
--------------------------------------------------------
--  DDL for Index ROLETABLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX jx180718."ROLETABLE_PK" ON jx180718."ROLETABLE" ("R_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718 ;
--------------------------------------------------------
--  DDL for Index PRESTABLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX jx180718."PRESTABLE_PK" ON jx180718."PRESTABLE" ("P_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718 ;
--------------------------------------------------------
--  DDL for Index PATIENTTABLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX jx180718."PATIENTTABLE_PK" ON jx180718."PATIENTTABLE" ("C_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718 ;
--------------------------------------------------------
--  DDL for Index LOGTABLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX jx180718."LOGTABLE_PK" ON jx180718."LOGTABLE" ("L_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718 ;
--------------------------------------------------------
--  DDL for Index MENU_TREE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX jx180718."MENU_TREE_PK" ON jx180718."MENU_TREE" ("MT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718 ;
--------------------------------------------------------
--  DDL for Index MENUTABLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX jx180718."MENUTABLE_PK" ON jx180718."MENUTABLE" ("M_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718 ;
--------------------------------------------------------
--  DDL for Index APPLYTABLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX jx180718."APPLYTABLE_PK" ON jx180718."APPLYTABLE" ("A_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718 ;
--------------------------------------------------------
--  DDL for Index CARD_MSG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX jx180718."CARD_MSG_PK" ON jx180718."CARD_MSG" ("C_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718 ;
--------------------------------------------------------
--  DDL for Index CARD_EVENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX jx180718."CARD_EVENT_PK" ON jx180718."CARD_EVENT" ("E_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718 ;
--------------------------------------------------------
--  DDL for Index DOCTORTABLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX jx180718."DOCTORTABLE_PK" ON jx180718."DOCTORTABLE" ("DOC_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718 ;
--------------------------------------------------------
--  DDL for Trigger STAFF
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER jx180718."STAFF" 
   before insert on jx180718."STAFF_TABLE" 
   for each row 
begin  
   if inserting then 
      if :NEW."S_ID" is null then 
         select STAFF.nextval into :NEW."S_ID" from dual; 
      end if; 
   end if; 
end;

/
ALTER TRIGGER jx180718."STAFF" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER jx180718."RM" 
   before insert on jx180718."ROLE_MENU" 
   for each row 
begin  
   if inserting then 
      if :NEW."M_ID" is null then 
         select ROLEMENU.nextval into :NEW."M_ID" from dual; 
      end if; 
   end if; 
end;


/
ALTER TRIGGER jx180718."RM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRES
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER jx180718."PRES" 
   before insert on jx180718."PRESTABLE" 
   for each row 
begin  
   if inserting then 
      if :NEW."P_ID" is null then 
         select PRES.nextval into :NEW."P_ID" from dual; 
      end if; 
   end if; 
end;

/
ALTER TRIGGER jx180718."PRES" ENABLE;
--------------------------------------------------------
--  DDL for Trigger LOGSS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER jx180718."LOGSS" 
   before insert on jx180718."LOGTABLE" 
   for each row 
begin  
   if inserting then 
      if :NEW."L_ID" is null then 
         select LOGSS.nextval into :NEW."L_ID" from dual; 
      end if; 
   end if; 
end;

/
ALTER TRIGGER jx180718."LOGSS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger M
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER jx180718."M" 
   before insert on jx180718."MENUTABLE" 
   for each row 
begin  
   if inserting then 
      if :NEW."M_ID" is null then 
         select MYTABLE.nextval into :NEW."M_ID" from dual; 
      end if; 
   end if; 
end;


/
ALTER TRIGGER jx180718."M" ENABLE;
--------------------------------------------------------
--  DDL for Trigger APPLY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER jx180718."APPLY" 
   before insert on jx180718."APPLYTABLE" 
   for each row 
begin  
   if inserting then 
      if :NEW."A_ID" is null then 
         select APPID.nextval into :NEW."A_ID" from dual; 
      end if; 
   end if; 
end;

/
ALTER TRIGGER jx180718."APPLY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger APPOIN
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER jx180718."APPOIN" 
   before insert on jx180718."APPOINTMENT_TABLE" 
   for each row 
begin  
   if inserting then 
      if :NEW."APP_ID" is null then 
         select APPOIN.nextval into :NEW."APP_ID" from dual; 
      end if; 
   end if; 
end;

/
ALTER TRIGGER jx180718."APPOIN" ENABLE;
--------------------------------------------------------
--  DDL for Trigger EID
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER jx180718."EID" 
   before insert on jx180718."CARD_EVENT" 
   for each row 
begin  
   if inserting then 
      if :NEW."E_ID" is null then 
         select MYTABLE.nextval into :NEW."E_ID" from dual; 
      end if; 
   end if; 
end;

/
ALTER TRIGGER jx180718."EID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CARD_EVEN
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER jx180718."CARD_EVEN" 
   before insert on jx180718."CARD_EVENT" 
   for each row 
begin  
   if inserting then 
      if :NEW."E_ID" is null then 
         select E_ID.nextval into :NEW."E_ID" from dual; 
      end if; 
   end if; 
end;

/
ALTER TRIGGER jx180718."CARD_EVEN" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DOCT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER jx180718."DOCT" 
   before insert on jx180718."DOCTORTABLE" 
   for each row 
begin  
   if inserting then 
      if :NEW."DOC_ID" is null then 
         select DOCT.nextval into :NEW."DOC_ID" from dual; 
      end if; 
   end if; 
end;

/
ALTER TRIGGER jx180718."DOCT" ENABLE;
--------------------------------------------------------
--  Constraints for Table STAFF_TABLE
--------------------------------------------------------

  ALTER TABLE jx180718."STAFF_TABLE" ADD CONSTRAINT "STAFF_TABLE_PK" PRIMARY KEY ("S_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718  ENABLE;
 
  ALTER TABLE jx180718."STAFF_TABLE" MODIFY ("S_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SALERULE
--------------------------------------------------------

  ALTER TABLE jx180718."SALERULE" ADD CONSTRAINT "SALERULE_PK" PRIMARY KEY ("R_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718  ENABLE;
 
  ALTER TABLE jx180718."SALERULE" MODIFY ("STARTPRICE" NOT NULL ENABLE);
 
  ALTER TABLE jx180718."SALERULE" MODIFY ("R_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ROLETABLE
--------------------------------------------------------

  ALTER TABLE jx180718."ROLETABLE" ADD CONSTRAINT "ROLETABLE_PK" PRIMARY KEY ("R_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718  ENABLE;
 
  ALTER TABLE jx180718."ROLETABLE" MODIFY ("R_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ROLE_MENU
--------------------------------------------------------

  ALTER TABLE jx180718."ROLE_MENU" MODIFY ("R_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRESTABLE
--------------------------------------------------------

  ALTER TABLE jx180718."PRESTABLE" ADD CONSTRAINT "PRESTABLE_PK" PRIMARY KEY ("P_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718  ENABLE;
 
  ALTER TABLE jx180718."PRESTABLE" MODIFY ("P_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PATIENTTABLE
--------------------------------------------------------

  ALTER TABLE jx180718."PATIENTTABLE" ADD CONSTRAINT "PATIENTTABLE_PK" PRIMARY KEY ("C_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718  ENABLE;
 
  ALTER TABLE jx180718."PATIENTTABLE" MODIFY ("C_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGTABLE
--------------------------------------------------------

  ALTER TABLE jx180718."LOGTABLE" ADD CONSTRAINT "LOGTABLE_PK" PRIMARY KEY ("L_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718  ENABLE;
 
  ALTER TABLE jx180718."LOGTABLE" MODIFY ("L_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MENU_TREE
--------------------------------------------------------

  ALTER TABLE jx180718."MENU_TREE" ADD CONSTRAINT "MENU_TREE_PK" PRIMARY KEY ("MT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718  ENABLE;
 
  ALTER TABLE jx180718."MENU_TREE" MODIFY ("MT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MENUTABLE
--------------------------------------------------------

  ALTER TABLE jx180718."MENUTABLE" ADD CONSTRAINT "MENUTABLE_PK" PRIMARY KEY ("M_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718  ENABLE;
 
  ALTER TABLE jx180718."MENUTABLE" MODIFY ("M_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table APPLYTABLE
--------------------------------------------------------

  ALTER TABLE jx180718."APPLYTABLE" ADD CONSTRAINT "APPLYTABLE_PK" PRIMARY KEY ("A_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718  ENABLE;
 
  ALTER TABLE jx180718."APPLYTABLE" MODIFY ("A_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CARD_MSG
--------------------------------------------------------

  ALTER TABLE jx180718."CARD_MSG" ADD CONSTRAINT "CARD_MSG_PK" PRIMARY KEY ("C_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718  ENABLE;
 
  ALTER TABLE jx180718."CARD_MSG" MODIFY ("C_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CARD_EVENT
--------------------------------------------------------

  ALTER TABLE jx180718."CARD_EVENT" ADD CONSTRAINT "CARD_EVENT_PK" PRIMARY KEY ("E_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718  ENABLE;
 
  ALTER TABLE jx180718."CARD_EVENT" MODIFY ("E_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DOCTORTABLE
--------------------------------------------------------t

  ALTER TABLE jx180718."DOCTORTABLE" ADD CONSTRAINT "DOCTORTABLE_PK" PRIMARY KEY ("DOC_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE jx180718  ENABLE;
 
  ALTER TABLE jx180718."DOCTORTABLE" MODIFY ("DOC_ID" NOT NULL ENABLE);

create user JX180718xc identified by 123456;
grant dba ,connect,resource to JX180718xc;