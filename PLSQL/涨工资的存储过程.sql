--给指定的员工涨100工资
create or replace procedure raiseSalary(eno in number)
is
--定义变量保存涨前的薪水
psal emp.sal%type;
begin
  --得到涨前的薪水
  select sal into psal from emp where empno=eno;
  --涨100
  update emp set sal=sal+100 where empno=eno;
  --一般不在存储过程中提交，回滚。保持事务一致性
  dbms_output.put_line('涨前：'||psal||'   涨后：'||(psal+100));
end raiseSalary;
/