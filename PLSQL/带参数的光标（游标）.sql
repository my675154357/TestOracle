--查询某个部门的员工姓名
declare
  --形参
  CURSOR cemp(dno number) is SELECT ename FROM emp where DEPTNO = dno;
  pname emp.ename%type;
begin
  --实参
  open cemp(10);
  loop
    FETCH cemp into pname;
    exit when cemp%notfound;    
    DBMS_OUTPUT.PUT_LINE(pname);  
  end loop;
  close cemp;
end;
/