/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2018/11/7 9:53:37                            */
/*==============================================================*/


drop table UserTable cascade constraints;

/*==============================================================*/
/* Table: UserTable                                             */
/*==============================================================*/
create table UserTable 
(
   u_Name               VARCHAR2(20),
   u_Id                 NUMBER(20)           not null,
   u_Psw                VARCHAR2(50),
   u_Age                NUMBER(20),
   u_sex                VARCHAR2(20),
   u_DateTime           DATE,
   teu_Hight            NUMBER,
   u_Weight             NUMBER,
   u_State              VARCHAR2(20),
   u_phone              VARCHAR2(20),
   constraint PK_USERTABLE primary key (u_Id)
);

