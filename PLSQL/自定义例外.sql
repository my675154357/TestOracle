--查询50号部门的员工
declare
  cursor cemp is select ename from emp where deptno=50;
  pename emp.ename%type;
  --自定义例外（因为oracle中不能像java那样继承exception来自定义异常，所以，这里就把自定义例外当做一个变量，它的类型是exception）
  no_emp_found exception;
begin
  open cemp;
  --取第一条记录
  fetch cemp into pename;
  if cemp%notfound then
    --抛出例外，raise相当于java中的throw
    raise no_emp_found;
  end if;
  --进程：pmon进程（proccess monitor 进程监视器）
  close cemp;
exception
  when no_emp_found then dbms_output.put_line('没有找到员工');
  when others then dbms_output.put_line('其他例外');  
end;