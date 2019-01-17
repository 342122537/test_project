--------------------------------------------------------
--  �ļ��Ѵ��� - ���ڶ�-ʮ����-18-2018   
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
 

   COMMENT ON COLUMN jx180718."PATIENTTABLE"."C_ID" IS '���˱��';
 
   COMMENT ON COLUMN jx180718."PATIENTTABLE"."P_NAME" IS '����';
 
   COMMENT ON COLUMN jx180718."PATIENTTABLE"."P_SEX" IS '�Ա�';
 
   COMMENT ON COLUMN jx180718."PATIENTTABLE"."P_AGE" IS '����';
 
   COMMENT ON COLUMN jx180718."PATIENTTABLE"."P_CITY" IS '����';
 
   COMMENT ON COLUMN jx180718."PATIENTTABLE"."P_IDCARD" IS '���֤';
 
   COMMENT ON COLUMN jx180718."PATIENTTABLE"."P_PHONE" IS '��ϵ�绰';
 
   COMMENT ON COLUMN jx180718."PATIENTTABLE"."P_ADDRESS" IS '��סַ';
 
   COMMENT ON COLUMN jx180718."PATIENTTABLE"."C_BALANCE" IS '�����';
 
   COMMENT ON COLUMN jx180718."PATIENTTABLE"."C_DEPOSIT" IS '��Ѻ��';
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
 

   COMMENT ON COLUMN jx180718."APPLYTABLE"."A_ID" IS '���';
 
   COMMENT ON COLUMN jx180718."APPLYTABLE"."A_AUDITOR" IS '������';
 
   COMMENT ON COLUMN jx180718."APPLYTABLE"."A_AUTIME" IS '���ʱ��';
 
   COMMENT ON COLUMN jx180718."APPLYTABLE"."C_APPLYER" IS 'c_applyer';
 
   COMMENT ON COLUMN jx180718."APPLYTABLE"."A_APPNUMBER" IS '��������';
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
 

   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."APP_ID" IS '�Һű��';
 
   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."SC_ID" IS '�Ű���';
 
   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."APP_STATE" IS 'ȡ��״̬';
 
   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."P_ID" IS '���˱��';
 
   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."APP_TIME" IS 'ԤԼʱ��';
 
   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."DOC_TIME" IS '����ʱ��';
 
   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."DOC_NAME" IS 'ҽ��';
 
   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."P_NAME" IS '����';
 
   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."DOC_DEPT" IS '����';
 
   COMMENT ON COLUMN jx180718."APPOINTMENT_TABLE"."DOC_DATE" IS '��������';
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
 

   COMMENT ON COLUMN jx180718."CARD_MSG"."C_ID" IS '�����';
 
   COMMENT ON COLUMN jx180718."CARD_MSG"."C_PREFIX" IS 'ǰ׺';
 
   COMMENT ON COLUMN jx180718."CARD_MSG"."C_NUMBER" IS '����';
 
   COMMENT ON COLUMN jx180718."CARD_MSG"."C_STATE" IS '��״̬';
 
   COMMENT ON COLUMN jx180718."CARD_MSG"."C_APPLYER" IS '������';
 
   COMMENT ON COLUMN jx180718."CARD_MSG"."C_IMPTIME" IS '��������';
 
   COMMENT ON COLUMN jx180718."CARD_MSG"."C_APPID" IS '����id';
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
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('1','����','123','123','Tom','��','1');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('2','123','123','123','001','��ɾ��','1');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('21','1234','123','���ޱ�','1','����','1');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('22','12345','123','����','1','����','1');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('23','12345','123','����','1','����','1');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('24','12345','123','����','1','����','1');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('25','111','123','����','�ڿ�','����','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('26','aa1','123','����','�ڿ�','����','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('61','1Q2W243','123','MM','002','001','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('62','1Q2W243','123','MM','002','001','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('63','1Q2W243','123','MM','002','001','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('64','1Q2W243','123','MM','002','001','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('65','1Q2W243','123','MM','002','001','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('81','5555','123','12-6��','001','����',null);
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('82','666','123','����Ϊ','001','����',null);
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('83','999','123','��¯��','001','����',null);
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('84','444','123','HEWLEU ','001','����',null);
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('85','S1S1','123','SDASD','001','����',null);
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('86','wqwqw','wqwqw','�˲ź�','001','��ɾ��','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('87','wqwqw11','123456','123','001','����','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('88','xxx','123','123','001','����','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('89','888','123','123','001','����','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('90','11','123','hed ','001','����','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('91','mmm','123','123','001','����','2');
Insert into jx180718.STAFF_TABLE (S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_ID) values ('92','ddd','123','123','001','����','2');
REM INSERTING into jx180718.SCHETABLE
SET DEFINE OFF;
REM INSERTING into jx180718.SALERULE
SET DEFINE OFF;
Insert into jx180718.SALERULE (STARTPRICE,RAISEPRICE0,RAISEPRICE1,RAISEPRICE2,DEPOSIT,STARTTIME,R_ID,OVERTIME) values ('100',1,20,100,1000,'456',2,'456');
Insert into jx180718.SALERULE (STARTPRICE,RAISEPRICE0,RAISEPRICE1,RAISEPRICE2,DEPOSIT,STARTTIME,R_ID,OVERTIME) values ('15',12121,12122,1111,12,'12',14,'12');
Insert into jx180718.SALERULE (STARTPRICE,RAISEPRICE0,RAISEPRICE1,RAISEPRICE2,DEPOSIT,STARTTIME,R_ID,OVERTIME) values ('100',1,20,100,1000,'ss',21,'sda');
REM INSERTING into jx180718.ROLETABLE
SET DEFINE OFF;
Insert into jx180718.ROLETABLE (R_ID,R_NAME,D_ID) values ('4','����Ա','001');
Insert into jx180718.ROLETABLE (R_ID,R_NAME,D_ID) values ('1','��������Ա','001');
Insert into jx180718.ROLETABLE (R_ID,R_NAME,D_ID) values ('2','�շ�Ա','001');
Insert into jx180718.ROLETABLE (R_ID,R_NAME,D_ID) values ('3','ҽ��','001');
REM INSERTING into jx180718.ROLE_MENU
SET DEFINE OFF;
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('1','30','��Ƭ����','����');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('1','31','ϵͳ����','����');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('1','32','��Ƭҵ��','����');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('1','33','�ճ�����','����');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('1','34','ͳ�Ʋ�ѯ','����');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('2','35','��Ƭ����','��ֹ');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('2','36','ϵͳ����','��ֹ');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('2','37','��Ƭҵ��','����');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('2','38','�ճ�����','����');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('2','39','ͳ�Ʋ�ѯ','����');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('3','40','��Ƭ����','��ֹ');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('3','41','ϵͳ����','��ֹ');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('3','42','��Ƭҵ��','����');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('3','43','�ճ�����','����');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('3','44','ͳ�Ʋ�ѯ','����');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('4','45','��Ƭ����','����');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('4','46','ϵͳ����','����');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('4','47','��Ƭҵ��','��ֹ');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('4','48','�ճ�����','��ֹ');
Insert into jx180718.ROLE_MENU (R_ID,M_ID,M_NAME,M_STATE) values ('4','49','ͳ�Ʋ�ѯ','��ֹ');
REM INSERTING into jx180718.PRESTABLE
SET DEFINE OFF;
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('1','ss0000003','��·��','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('2','ss0000003','��·��','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('3','ss0000003','��·��','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('4','ss0000003','��·��','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('5','ss0000003','��·��','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('6','ss0000003','��·��','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('7','ss0000003','��·��','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('8','ss0000003','��·��','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('9','ss0000003','��·��','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('10','ss0000003','��·��','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('21','ss0000003','��·��','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('22','ss0000003','sddsdsd','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('23','ss0000003','sddsdsd','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('24','ss0000003','sddsdsd','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('25','ss0000003','sddsdsd','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('26','ss0000003','sddsdsd','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('27','ss0000003','wewwwwwwwwwwwq','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('28','ss0000003','wewwwwwwwwwwwq','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('29','ss0000003','wewwwwwwwwwwwq','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('30','ss0000003','wewwwwwwwwwwwq','�ڷ�','3','��','150','450','��ҽ��');
Insert into jx180718.PRESTABLE (P_ID,C_ID,P_NAME,P_TAKE,P_NUMBER,P_UNIT,P_PRICE,P_TOTAL,S_ID) values ('31','ss0000003','wewwwwwwwwwwwq','�ڷ�','3','��','150','450','��ҽ��');
REM INSERTING into jx180718.PATIENTTABLE
SET DEFINE OFF;
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss0000007','sdsa','ss','ss','ss','ss','ss','ss','ss','ss');
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss0000003','��¯ΰ','Ů','10��1��','����','562711892039876542','15890987654','����ʡ�����в�ɽ��','120','5');
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss00000012','1','��','1��1��','1','1','1','1','1106','5');
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss0000021','1','��','1��1��','1','1','1','1','-4','5');
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss0000008',null,null,null,null,null,null,null,null,null);
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss0000006',null,null,null,null,null,null,null,null,null);
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss00000010','1','��','1��1��','1','1','1','1','-4','5');
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss0000020','1','��','1��1��','1','1','1','1','6','5');
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss0000016','q','��','q��q��','q','q','q','q','-4','5');
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('ss0000018','ss0000018','��','1��1��','11111','11','1','1','-4','5');
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('dd0000033','1','��','21��21��','2','121','21','21','212116','5');
Insert into jx180718.PATIENTTABLE (C_ID,P_NAME,P_SEX,P_AGE,P_CITY,P_IDCARD,P_PHONE,P_ADDRESS,C_BALANCE,C_DEPOSIT) values ('dd0000034','1','��','1212��2��','11','1','1','1','-4','5');
REM INSERTING into jx180718.PARAMETER
SET DEFINE OFF;
REM INSERTING into jx180718.LOGTABLE
SET DEFINE OFF;
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('70','ss0000003','2018��12��17��','��ֵ');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('71','ss0000003','2018��12��17��','��ֵ');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('81','���ޱ�','2018��12��18��','ҽ���Ű�');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('82','���ޱ�','2018��12��18��','ҽ���Ű�');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('83','���ޱ�','2018��12��18��','ҽ���Ű�');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('84','���ޱ�','2018��12��18��','ҽ���Ű�');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('85','���ޱ�','2018��12��18��','ҽ���Ű�');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('86','���ޱ�','2018��12��18��','ҽ���Ű�');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('87','���ޱ�','2018��12��18��','ҽ���Ű�');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('101','���ޱ�','2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('102','���ޱ�','2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('103','���ޱ�','2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('104','���ޱ�','2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('105',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('106',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('107',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('108',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('109',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('110',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('111',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('112',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('113',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('114',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('115',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('116',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('117',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('118',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('119',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('120',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('68','���ޱ�','2018��12��17��','ҽ���Ű�');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('69','���ޱ�','2018��12��17��','ҽ���Ű�');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('121',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('122',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('123',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('124','���ޱ�','2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('125','���ޱ�','2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('126',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('127','���ޱ�','2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('128','���ޱ�','2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('129','���ޱ�','2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('130',null,'2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('131','���ޱ�','2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('132','���ޱ�','2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('133','���ޱ�','2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('134','���ޱ�','2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('135','���ޱ�','2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('136','���ޱ�','2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('137','���ޱ�','2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('138','���ޱ�','2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('139','���ޱ�','2018��12��18��','�޸�Ȩ��');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('140','���ޱ�','2018��12��18��','�����');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('141','���ޱ�','2018��12��18��','�����');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('142','���ޱ�','2018��12��18��','�����');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('143','���ޱ�','2018��12��18��','�����');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('144','���ޱ�','2018��12��18��','�����');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('145','���ޱ�','2018��12��18��','�����');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('146','���ޱ�','2018��12��18��','�����');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('147','���ޱ�','2018��12��18��','�����');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('148','���ޱ�','2018��12��18��','�����');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('149','���ޱ�','2018��12��18��','�����');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('150','���ޱ�','2018��12��18��','�����');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('151','���ޱ�','2018��12��18��','�����');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('152','���ޱ�','2018��12��18��','�����');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('153','���ޱ�','2018��12��18��','�����');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('154','���ޱ�','2018��12��18��','�����');
Insert into jx180718.LOGTABLE (L_ID,U_ID,L_TIME,L_EVEN) values ('155','���ޱ�','2018��12��18��','�����');
REM INSERTING into jx180718.MENU_TREE
SET DEFINE OFF;
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('9','30','3','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('10','30','4','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('16','31','5','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('17','31','6','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('18','31','7','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('19','31','8','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('20','31','9','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('21','31','10','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('11','32','11','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('12','32','12','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('13','32','13','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('14','32','14','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('15','33','15','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('22','34','16','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('23','34','17','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('7','35','18','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('8','35','19','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('9','35','20','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('10','35','21','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('16','36','22','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('17','36','23','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('18','36','24','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('19','36','25','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('20','36','26','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('21','36','27','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('11','37','28','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('12','37','29','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('13','37','30','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('14','37','31','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('15','38','32','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('22','39','33','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('23','39','34','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('7','30','1','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('8','30','2','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('7','40','35','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('8','40','36','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('9','40','37','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('10','40','38','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('16','41','39','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('17','41','40','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('18','41','41','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('19','41','42','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('20','41','43','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('21','41','44','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('11','42','45','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('12','42','46','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('13','42','47','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('14','42','48','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('15','43','49','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('22','44','50','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('23','44','51','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('7','45','52','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('8','45','53','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('9','45','54','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('10','45','55','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('16','46','56','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('17','46','57','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('18','46','58','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('19','46','59','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('20','46','60','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('21','46','61','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('11','47','62','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('12','47','63','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('13','47','64','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('14','47','65','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('15','48','66','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('22','49','67','����');
Insert into jx180718.MENU_TREE (M_ID,L_MID,MT_ID,M_STATE) values ('23','49','68','����');
REM INSERTING into jx180718.MENUTABLE
SET DEFINE OFF;
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('1',null,null,'#','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('2','��Ƭҵ��',null,'1','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('3','��Ƭ����',null,'1','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('4','ϵͳ����',null,'1','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('5','ͳ�Ʋ�ѯ',null,'1','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('6','�ճ�����',null,'1','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('7','�����','CardInServlet?action=addCardManage&currentPage=1','3','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('8','����ѯ','ModifyCardServlet?action=modify&currentPage=1','3','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('9','�쿨����','ExamineApplyServlet?action=enter_exam&currentPage=1','3','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('10','��ע��','CancleCardServlet?action=cancle_Main&currentPage=1','3','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('11','�쿨','Collar_CardServlet?action=enter_apply&currentPage=1','2','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('12','�ۿ�','brower/charge_net/applycard/sell_Card.jsp','2','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('13','����','brower/charge_net/applycard/changeCard.jsp','2','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('14','�˿�','brower/charge_net/applycard/retreatCard.jsp','2','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('15','�����˷�','brower/charge_net/manageCard/permissionmanage.jsp','6','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('16','��Ա����','ManageServlet?action=staffManage','4','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('17','Ȩ�޹���','Permi_ManageServlet?action=enter_permi&current_id=1','4','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('18','�˵�����','brower/charge_net/welcome.jsp','4','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('19','ҽ���Ű�','Doctor_Servlet?action=enter_doct&current_id=1','4','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('20','��־�鿴','LogServlet?action=enter_log&current_id=1&currentPage=1','4','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('21','��������','brower/charge_net/welcome.jsp','4','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('22','�쿨��ѯ','SearchServlet?action=card_search&currentPage=1','5','����');
Insert into jx180718.MENUTABLE (M_ID,M_NAME,M_URL,L_MID,M_STATE) values ('23','������ͳ��','SearchServlet?action=works&currentPage=1','5','����');
REM INSERTING into jx180718.APPLYTABLE
SET DEFINE OFF;
Insert into jx180718.APPLYTABLE (A_ID,A_AUDITOR,A_AUTIME,C_APPLYER,A_APPNUMBER,C_IMPTIME,STATE) values ('1','sdsda','13465','���ޱ�','1','2018��12��11��','����');
Insert into jx180718.APPLYTABLE (A_ID,A_AUDITOR,A_AUTIME,C_APPLYER,A_APPNUMBER,C_IMPTIME,STATE) values ('2','����','2018��12��11��','���ޱ�','2','2018��12��11��','�����');
Insert into jx180718.APPLYTABLE (A_ID,A_AUDITOR,A_AUTIME,C_APPLYER,A_APPNUMBER,C_IMPTIME,STATE) values ('3',null,null,'���ޱ�','3','2018��12��11��','�����');
Insert into jx180718.APPLYTABLE (A_ID,A_AUDITOR,A_AUTIME,C_APPLYER,A_APPNUMBER,C_IMPTIME,STATE) values ('4',null,null,'���ޱ�','4','2018��12��11��','�����');
Insert into jx180718.APPLYTABLE (A_ID,A_AUDITOR,A_AUTIME,C_APPLYER,A_APPNUMBER,C_IMPTIME,STATE) values ('5',null,null,'���ޱ�','5','2018��12��11��','�����');
Insert into jx180718.APPLYTABLE (A_ID,A_AUDITOR,A_AUTIME,C_APPLYER,A_APPNUMBER,C_IMPTIME,STATE) values ('6',null,null,'���ޱ�','6','2018��12��11��','�����');
Insert into jx180718.APPLYTABLE (A_ID,A_AUDITOR,A_AUTIME,C_APPLYER,A_APPNUMBER,C_IMPTIME,STATE) values ('7',null,null,'���ޱ�','7','2018��12��11��','�����');
Insert into jx180718.APPLYTABLE (A_ID,A_AUDITOR,A_AUTIME,C_APPLYER,A_APPNUMBER,C_IMPTIME,STATE) values ('8',null,null,'���ޱ�','8','2018��12��11��','�����');
REM INSERTING into jx180718.APPOINTMENT_TABLE
SET DEFINE OFF;
Insert into jx180718.APPOINTMENT_TABLE (APP_ID,SC_ID,APP_STATE,P_ID,APP_TIME,DOC_TIME,DOC_NAME,P_NAME,DOC_DEPT,DOC_DATE) values ('1','ss','ss','ss','ss','ss','ss','ss','ss','ss');
Insert into jx180718.APPOINTMENT_TABLE (APP_ID,SC_ID,APP_STATE,P_ID,APP_TIME,DOC_TIME,DOC_NAME,P_NAME,DOC_DEPT,DOC_DATE) values ('2',null,null,null,null,'00:00','��¯��',null,'�ڿ�','2018-12-18');
Insert into jx180718.APPOINTMENT_TABLE (APP_ID,SC_ID,APP_STATE,P_ID,APP_TIME,DOC_TIME,DOC_NAME,P_NAME,DOC_DEPT,DOC_DATE) values ('3',null,null,null,null,'09:00','��¯��',null,'�ڿ�','2018-12-01');
Insert into jx180718.APPOINTMENT_TABLE (APP_ID,SC_ID,APP_STATE,P_ID,APP_TIME,DOC_TIME,DOC_NAME,P_NAME,DOC_DEPT,DOC_DATE) values ('4',null,null,null,null,'12:00','��¯��',null,'�ڿ�','2018-12-01');
Insert into jx180718.APPOINTMENT_TABLE (APP_ID,SC_ID,APP_STATE,P_ID,APP_TIME,DOC_TIME,DOC_NAME,P_NAME,DOC_DEPT,DOC_DATE) values ('5',null,null,null,null,'15:30','��¯��',null,'�ڿ�','2018-12-01');
Insert into jx180718.APPOINTMENT_TABLE (APP_ID,SC_ID,APP_STATE,P_ID,APP_TIME,DOC_TIME,DOC_NAME,P_NAME,DOC_DEPT,DOC_DATE) values ('6',null,null,null,null,'08:00--9:00','�˲ź�',null,'�ڿ�','2018-12-17');
Insert into jx180718.APPOINTMENT_TABLE (APP_ID,SC_ID,APP_STATE,P_ID,APP_TIME,DOC_TIME,DOC_NAME,P_NAME,DOC_DEPT,DOC_DATE) values ('7',null,'ԤԼ','ss0000003','2018-12-18','10:00--11:00','123','��¯ΰ','�ڿ�','2018-12-19');
Insert into jx180718.APPOINTMENT_TABLE (APP_ID,SC_ID,APP_STATE,P_ID,APP_TIME,DOC_TIME,DOC_NAME,P_NAME,DOC_DEPT,DOC_DATE) values ('8',null,null,null,null,'10:00--11:00','123',null,'�ڿ�','2018-12-18');
REM INSERTING into jx180718.CARD_MSG
SET DEFINE OFF;
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000003','ss','0000003','��ע��','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000004','ss','0000004','��ע��','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000005','ss','0000005','��ע��','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000010','AA','0000010','������','���ޱ�','2018��12��18��','AA0000010');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000011','AA','0000011','������','���ޱ�','2018��12��18��','AA0000011');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000012','AA','0000012','������','���ޱ�','2018��12��18��','AA0000012');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000013','AA','0000013','������','���ޱ�','2018��12��18��','AA0000013');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000014','AA','0000014','������','���ޱ�','2018��12��18��','AA0000014');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000015','AA','0000015','������','���ޱ�','2018��12��18��','AA0000015');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000016','AA','0000016','������','���ޱ�','2018��12��18��','AA0000016');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000017','AA','0000017','������','���ޱ�','2018��12��18��','AA0000017');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000018','AA','0000018','������','���ޱ�','2018��12��18��','AA0000018');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000019','AA','0000019','������','���ޱ�','2018��12��18��','AA0000019');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000016','ss','0000016','������','����','2018��12��08��','1');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000017','ss','0000017','������','����','2018��12��08��','2');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000018','ss','0000018','������','����','2018��12��08��','3');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000019','ss','0000019','������','����','2018��12��08��','2');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000020','ss','0000020','������','����','2018��12��08��','2');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000021','ss','0000021','������','����','2018��12��08��','2');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000022','ss','0000022','������','����','2018��12��08��','2');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000033','dd','0000033','���۳�','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000034','dd','0000034','���۳�','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000035','dd','0000035','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000036','dd','0000036','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000037','dd','0000037','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000038','dd','0000038','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000039','dd','0000039','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000040','dd','0000040','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000041','dd','0000041','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000042','dd','0000042','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000043','dd','0000043','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000044','dd','0000044','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ww0000011','ww','0000011','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('zz0000011','zz','0000011','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('dd0000022','dd','0000022','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('rr0000001','rr','0000001','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('xx0000022','xx','0000022','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000022','qq','0000022','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000023','qq','0000023','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000024','qq','0000024','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000025','qq','0000025','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000026','qq','0000026','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000027','qq','0000027','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000028','qq','0000028','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000001','ss','0000001','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('ss0000002','ss','0000002','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000029','qq','0000029','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000030','qq','0000030','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000031','qq','0000031','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000032','qq','0000032','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000033','qq','0000033','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000077','qq','0000077','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000078','qq','0000078','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000079','qq','0000079','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000080','qq','0000080','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000081','qq','0000081','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000082','qq','0000082','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000083','qq','0000083','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000084','qq','0000084','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000085','qq','0000085','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000086','qq','0000086','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000087','qq','0000087','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('qq0000088','qq','0000088','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000001','fz','0000001','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000002','fz','0000002','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000003','fz','0000003','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000004','fz','0000004','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000005','fz','0000005','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000006','fz','0000006','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000007','fz','0000007','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000008','fz','0000008','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000009','fz','0000009','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000010','fz','0000010','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000011','fz','0000011','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000012','fz','0000012','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000013','fz','0000013','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000014','fz','0000014','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000015','fz','0000015','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000016','fz','0000016','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000017','fz','0000017','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000018','fz','0000018','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000019','fz','0000019','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('fz0000020','fz','0000020','������','����','2018��12��08��','null');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000020','AA','0000020','������','���ޱ�','2018��12��18��','AA0000020');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000021','AA','0000021','������','���ޱ�','2018��12��18��','AA0000021');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('AA0000022','AA','0000022','������','���ޱ�','2018��12��18��','AA0000022');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('SS0000022','SS','0000022','������','���ޱ�','2018��12��18��','SS0000022');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('SS0000023','SS','0000023','������','���ޱ�','2018��12��18��','SS0000023');
Insert into jx180718.CARD_MSG (C_ID,C_PREFIX,C_NUMBER,C_STATE,C_APPLYER,C_IMPTIME,C_APPID) values ('SS0000024','SS','0000024','������','���ޱ�','2018��12��18��','SS0000024');
REM INSERTING into jx180718.CARD_EVENT
SET DEFINE OFF;
Insert into jx180718.CARD_EVENT (E_ID,C_ID,E_EVENT,E_TIME,S_ID,E_MONEY) values (61,'FZ00000001','����','19:21','��s11 ','100');
Insert into jx180718.CARD_EVENT (E_ID,C_ID,E_EVENT,E_TIME,S_ID,E_MONEY) values (62,'FZ00000001','����','19:21','��s11 ','100');
Insert into jx180718.CARD_EVENT (E_ID,C_ID,E_EVENT,E_TIME,S_ID,E_MONEY) values (63,'FZ00000001','����','19:21','��s11 ','100');
Insert into jx180718.CARD_EVENT (E_ID,C_ID,E_EVENT,E_TIME,S_ID,E_MONEY) values (64,'FZ00000001','����','19:21','��s11 ','100');
Insert into jx180718.CARD_EVENT (E_ID,C_ID,E_EVENT,E_TIME,S_ID,E_MONEY) values (65,'FZ00000001','����','19:21','��s11 ','100');
Insert into jx180718.CARD_EVENT (E_ID,C_ID,E_EVENT,E_TIME,S_ID,E_MONEY) values (81,'FZ00000011','����','19:21','��s11 ','100');
Insert into jx180718.CARD_EVENT (E_ID,C_ID,E_EVENT,E_TIME,S_ID,E_MONEY) values (1,'s','s','ww','aa','ww');
Insert into jx180718.CARD_EVENT (E_ID,C_ID,E_EVENT,E_TIME,S_ID,E_MONEY) values (21,'dd0000033','�ۿ�','2018��12��16��','212121',null);
Insert into jx180718.CARD_EVENT (E_ID,C_ID,E_EVENT,E_TIME,S_ID,E_MONEY) values (22,'dd0000034','�ۿ�','2018��12��16��','���ޱ�','1');
REM INSERTING into jx180718.DEPTTABLE
SET DEFINE OFF;
Insert into jx180718.DEPTTABLE (D_ID,D_NAME,D_TYPE) values ('001','�ڿ�','001');
Insert into jx180718.DEPTTABLE (D_ID,D_NAME,D_TYPE) values ('002','���','001');
REM INSERTING into jx180718.DOCTORTABLE
SET DEFINE OFF;
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('25','2018-12-17','��¯��','83','����һ','�ڿ�','11:30');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('26','2018-12-03','����Ϊ','82','����һ','�ڿ�','00:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('27','2018-12-20','��¯��','83','������','�ڿ�','07:30');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('28','2019-01-01','123','91','���ڶ�','�ڿ�','00:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('29','2018-12-03','00','00-15','����һ','14','00:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('30','2018-12-17','00','00-15','����һ','14','06:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('41','2018-12-18','��¯��','83','���ڶ�','�ڿ�','00:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('42','2018-12-01','��¯��','83','������','�ڿ�','09:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('43','2018-12-01','��¯��','83','������','�ڿ�','12:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('44','2018-12-01','��¯��','83','������','�ڿ�','15:30');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('45','2018-12-17','�˲ź�','86','����һ','�ڿ�','08:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('46','2018-12-19','123','88','������','�ڿ�','10:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('47','2018-12-18','123','87','���ڶ�','�ڿ�','10:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('23','2018-12-06','12-6��','81','������','�ڿ�','00:00');
Insert into jx180718.DOCTORTABLE (DOC_ID,DOC_DATE,DOC_NAME,S_ID,XINGQI,DOC_DEPT,TIME) values ('24','2018-12-16','����Ϊ','82','������','�ڿ�','09:30');
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