--查询某个员工的姓名，薪水和职位
create or replace procedure queryEmpInfo(eno in number, pename out varchar2, psal out number, pjob out varchar2)
as
begin
  select ename,sal,job into pename,psal,pjob from emp where empno=eno;
end;
/