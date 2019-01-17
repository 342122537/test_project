delete from MENU_TREE  where m_id = '38'
Select * from  MENU_TREE
select * from role_menu where r_id = '2';
select * from menutable where l_mid = (select m_id from menutable where m_name = '系统管理')
Select * from MenuTable 
 
insert into MenuTable (m_id , m_name ,m_url,l_mid,m_state) values (mytable.nextval,'卡片业务',null,null,null);
insert into MenuTable (m_id , m_name ,m_url,l_mid,m_state) values (mytable.nextval,'领卡',null,null,null);
insert into MenuTable (m_id , m_name ,m_url,l_mid,m_state) values (mytable.nextval,'售卡',null,null,null);
insert into MenuTable (m_id , m_name ,m_url,l_mid,m_state) values (mytable.nextval,'换卡',null,null,null);
insert into MenuTable (m_id, m_name ,m_url,l_mid,m_state) values (mytable.nextval,'退卡',null,null,null);
insert into MenuTable (m_id , m_name ,m_url,l_mid,m_state) values (mytable.nextval,'日常事务',null,null,null);
insert into MenuTable (m_id , m_name ,m_url,l_mid,m_state) values (mytable.nextval,'处方退费',null,null,null);
insert into MenuTable (m_id, m_name ,m_url,l_mid,m_state) values (mytable.nextval,'统计查询',null,null,null);
insert into MenuTable (m_id, m_name ,m_url,l_mid,m_state) values (mytable.nextval,'领卡查询',null,null,null);
insert into MenuTable (m_id , m_name ,m_url,l_mid,m_state) values (mytable.nextval,'工作量统计',null,null,null);

insert into role_menu (r_id , m_id ,m_name) values ('001',rolemenu.nextval,'卡片管理');
insert into role_menu (r_id , m_id ,m_name) values ('001',rolemenu.nextval,'系统管理');
insert into role_menu (r_id , m_id ,m_name) values ('001',rolemenu.nextval,'卡片业务');
insert into role_menu (r_id , m_id ,m_name) values ('001',rolemenu.nextval,'日常事务');
insert into role_menu (r_id , m_id ,m_name) values ('001',rolemenu.nextval,'统计查询');

insert into role_menu (r_id , m_id ,m_name) values ('002',rolemenu.nextval,'卡片管理');
insert into role_menu (r_id , m_id ,m_name) values ('002',rolemenu.nextval,'系统管理');
insert into role_menu (r_id , m_id ,m_name) values ('002',rolemenu.nextval,'卡片业务');
insert into role_menu (r_id , m_id ,m_name) values ('002',rolemenu.nextval,'日常事务');
insert into role_menu (r_id , m_id ,m_name) values ('002',rolemenu.nextval,'统计查询');


insert into role_menu (r_id , m_id ,m_name) values ('003',rolemenu.nextval,'卡片管理');
insert into role_menu (r_id , m_id ,m_name) values ('003',rolemenu.nextval,'系统管理');
insert into role_menu (r_id , m_id ,m_name) values ('003',rolemenu.nextval,'卡片业务');
insert into role_menu (r_id , m_id ,m_name) values ('003',rolemenu.nextval,'日常事务');
insert into role_menu (r_id , m_id ,m_name) values ('003',rolemenu.nextval,'统计查询');


insert into role_menu (r_id , m_id ,m_name) values ('004',rolemenu.nextval,'卡片管理');
insert into role_menu (r_id , m_id ,m_name) values ('004',rolemenu.nextval,'系统管理');
insert into role_menu (r_id , m_id ,m_name) values ('004',rolemenu.nextval,'卡片业务');
insert into role_menu (r_id , m_id ,m_name) values ('004',rolemenu.nextval,'日常事务');
insert into role_menu (r_id , m_id ,m_name) values ('004',rolemenu.nextval,'统计查询');


update Menutable set m_Name= '卡片管理' where m_id ='08';
select me.* from  MenuTable me right join (select m_id  from MENU_TREE  where l_mid = 'o6') mt on mt.m_id != me.m_id
					

SET DEFINE OFF
INSERT INTO MENU_TREE (M_ID, L_MID, MT_ID) 
VALUES ('27', '06', '3');

INSERT INTO MENU_TREE (M_ID, L_MID, MT_ID) 
VALUES ('28', '06', '4');

INSERT INTO MENU_TREE (M_ID, L_MID, MT_ID) 
VALUES ('27', '16', '5');

INSERT INTO MENU_TREE (M_ID, L_MID, MT_ID) 
VALUES ('29', '16', '6');

INSERT INTO MENU_TREE (M_ID, L_MID, MT_ID) 
VALUES ('29', '08', '7');

INSERT INTO MENU_TREE (M_ID, L_MID, MT_ID) 
VALUES ('30', '08', '8');

INSERT INTO MENU_TREE (M_ID, L_MID, MT_ID) 
VALUES ('32', '07', '9');

INSERT INTO MENU_TREE (M_ID, L_MID, MT_ID) 
VALUES ('34', '07', '10');

INSERT INTO MENU_TREE (M_ID, L_MID, MT_ID) 
VALUES ('33', '17', '11');

INSERT INTO MENU_TREE (M_ID, L_MID, MT_ID) 
VALUES ('34', '17', '12');

INSERT INTO MENU_TREE (M_ID, L_MID, MT_ID) 
VALUES ('35', '17', '13');

INSERT INTO MENU_TREE (M_ID, L_MID, MT_ID) 
VALUES ('36', '09', '14');

INSERT INTO MENU_TREE (M_ID, L_MID, MT_ID) 
VALUES ('37', '09', '15');
INSERT INTO MENU_TREE (M_ID, L_MID, MT_ID) 
VALUES ('33', '09', MT.nextval);

