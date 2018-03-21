--引用型变量：查询并打印7839的姓名和薪水
declare 
  --定义变量保存姓名和薪水
   pname emp.ename%type;
   psal emp.sal%type;
begin
  --得到7839的姓名和薪水
  select ename,sal into pname,psal from emp where empno=7839;
  --打印
  dbms_output.put_line(pname||'的薪水是'||psal);
end;
