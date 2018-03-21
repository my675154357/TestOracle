--查询某个部门所有的员工信息   返回的是集合
create or replace package mypackage
is
  type empcursor is ref cursor;
  procedure queryEmpList(dno in number,empList out empcursor);
end;
/

create or replace package body mypackage
is
  procedure queryEmpList(dno in number,empList out empcursor)
  as
  begin
    open empList for select * from emp where deptno = dno;
  end;
end;
/