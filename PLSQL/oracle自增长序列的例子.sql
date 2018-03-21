--------------------------------------------�½���------------------------------------------
  --�û�������Ϣ
create table user_info
(
   u_id integer primary key not null,
   u_name varchar2(20) not null,
   u_sex integer not null,
   u_age integer not null
)

  --�û���ݣ������
create table   identity_info
(
   i_id integer primary key not null,
   i_name varchar2(20) not null,
   i_salary number not null,
   i_u_id integer not null
)

-------------------------------------------����������---------------------------------------  
  --����������
create sequence SEQ_TEST1
minvalue 1        --��Сֵ
nomaxvalue        --���������ֵ
start with 1      --��1��ʼ����
increment by 1    --ÿ�μ�1��
nocycle           --һֱ�ۼӣ���ѭ��
nocache;          --����������

 -- ���������Զ�ִ����������
CREATE OR REPLACE TRIGGER tg_test1 
BEFORE INSERT ON user_info FOR EACH ROW WHEN (new.u_id is null)
begin
select seq_test1.nextval into :new.u_id from dual;
end;

-- ɾ����
drop table user_info;

--�����
alter table  user_info add u_date date

-- ɾ����
alter table user_info drop column  u_age

-- �޸���
alter table user_info modify u_age number

-- �������
alter table identity_info add constraint FK_i_u_id
foreign key (i_u_id) references user_info(u_id)

-- ��������
alter table identity_info add constraint PK_i_id 
primary key(i_id)

-- ���ݲ�������
 -- ���
insert into user_info(u_name,u_sex,u_age,u_date)
values('���',1,20,to_date('2017-05-31','yyyy-MM-dd'));

insert into user_info(u_name,u_sex,u_age,u_date)
values('����',1,19,to_date('2017-06-01','yyyy-MM-dd'));

insert into user_info(u_name,u_sex,u_age,u_date)
values('����',0,16,to_date('2017-06-02','yyyy-MM-dd'));

insert into user_info(u_name,u_sex,u_age,u_date)
values('С��',0,17,to_date('2017-06-03','yyyy-MM-dd'));

insert into user_info(u_name,u_sex,u_age,u_date)
values('����ɾ����',0,17,to_date('2017-06-03','yyyy-MM-dd'));

 -- ��ѯ
select *from user_info
select *from identity_info

 -- �޸�
 update user_info set u_name = '����' where u_id = 2
 
 --ɾ��
 delete user_info where u_id = 5 
 
  -- ���� order by
 select *from user_info order by u_age desc;
 
  -- ���Ӳ�ѯ
 insert into identity_info values(1,'Ա��',2000,1); 
 insert into identity_info values(2,'����',5000,2);
 insert into identity_info values(3,'�ܾ���',8000,3);
 insert into identity_info values(4,'���³�',10000,4);
 
  -- ������
 select *from user_info u inner join identity_info i on u.u_id = i.i_u_id
 
 select *from user_info u,identity_info i
 where u.u_id = i.i_u_id 
 
  --��������
 select *from user_info u left join identity_info i on u.u_id = i.i_u_id
 
 -- �ۺϺ���
 select count(*) from user_info
 
 select avg(u_age) from user_info
 
 -- distinct �ϲ���ͬ���У�ѡ����е�������ͬ��
 select distinct u_sex from user_info
 
 -- group by  �����ѯ
select u_sex,avg(u_age) from user_info 
group by u_sex
having avg(u_age) > 18

-- �Ӳ�ѯ
select *from user_info 
where u_id in
(select i_u_id from identity_info where i_salary > 2000)

-- union �ϲ�ȥ���ظ�
-- union all �ϲ���ȥ���ظ�
-- MINUS �ӵ�һ�������ų��ڶ�����ֵ
-- INTERSECT ȡ����

select u_id from user_info
minus 
select i_id from identity_info

-- ||ƴ��
select '����:'||u_name from user_info
