--------------------------------------------新建表------------------------------------------
  --用户基本信息
create table user_info
(
   u_id integer primary key not null,
   u_name varchar2(20) not null,
   u_sex integer not null,
   u_age integer not null
)

  --用户身份（外键表）
create table   identity_info
(
   i_id integer primary key not null,
   i_name varchar2(20) not null,
   i_salary number not null,
   i_u_id integer not null
)

-------------------------------------------主键自增长---------------------------------------  
  --自增长序列
create sequence SEQ_TEST1
minvalue 1        --最小值
nomaxvalue        --不设置最大值
start with 1      --从1开始计数
increment by 1    --每次加1个
nocycle           --一直累加，不循环
nocache;          --不建缓冲区

 -- 触发器，自动执行自增序列
CREATE OR REPLACE TRIGGER tg_test1 
BEFORE INSERT ON user_info FOR EACH ROW WHEN (new.u_id is null)
begin
select seq_test1.nextval into :new.u_id from dual;
end;

-- 删除表
drop table user_info;

--添加列
alter table  user_info add u_date date

-- 删除列
alter table user_info drop column  u_age

-- 修改列
alter table user_info modify u_age number

-- 建立外键
alter table identity_info add constraint FK_i_u_id
foreign key (i_u_id) references user_info(u_id)

-- 建立主键
alter table identity_info add constraint PK_i_id 
primary key(i_id)

-- 数据操纵语言
 -- 添加
insert into user_info(u_name,u_sex,u_age,u_date)
values('李白',1,20,to_date('2017-05-31','yyyy-MM-dd'));

insert into user_info(u_name,u_sex,u_age,u_date)
values('韩信',1,19,to_date('2017-06-01','yyyy-MM-dd'));

insert into user_info(u_name,u_sex,u_age,u_date)
values('貂蝉',0,16,to_date('2017-06-02','yyyy-MM-dd'));

insert into user_info(u_name,u_sex,u_age,u_date)
values('小乔',0,17,to_date('2017-06-03','yyyy-MM-dd'));

insert into user_info(u_name,u_sex,u_age,u_date)
values('测试删除用',0,17,to_date('2017-06-03','yyyy-MM-dd'));

 -- 查询
select *from user_info
select *from identity_info

 -- 修改
 update user_info set u_name = '吕布' where u_id = 2
 
 --删除
 delete user_info where u_id = 5 
 
  -- 排序 order by
 select *from user_info order by u_age desc;
 
  -- 连接查询
 insert into identity_info values(1,'员工',2000,1); 
 insert into identity_info values(2,'经理',5000,2);
 insert into identity_info values(3,'总经理',8000,3);
 insert into identity_info values(4,'董事长',10000,4);
 
  -- 内连接
 select *from user_info u inner join identity_info i on u.u_id = i.i_u_id
 
 select *from user_info u,identity_info i
 where u.u_id = i.i_u_id 
 
  --左外连接
 select *from user_info u left join identity_info i on u.u_id = i.i_u_id
 
 -- 聚合函数
 select count(*) from user_info
 
 select avg(u_age) from user_info
 
 -- distinct 合并相同的行（选择的列的数据相同）
 select distinct u_sex from user_info
 
 -- group by  分组查询
select u_sex,avg(u_age) from user_info 
group by u_sex
having avg(u_age) > 18

-- 子查询
select *from user_info 
where u_id in
(select i_u_id from identity_info where i_salary > 2000)

-- union 合并去掉重复
-- union all 合并不去掉重复
-- MINUS 从第一个当中排除第二个的值
-- INTERSECT 取交集

select u_id from user_info
minus 
select i_id from identity_info

-- ||拼接
select '名字:'||u_name from user_info
