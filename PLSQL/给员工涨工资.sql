-- 给员工涨工资，总裁1000，经理800，其他400
DECLARE
  --定义光标
  CURSOR cemp is SELECT empno,job FROM emp;
  pempno EMP.EMPNO%type;
  pjob EMP.JOB%type;
begin
  ROLLBACK;
  --打开光标
  open cemp;
  
    loop
      -- 取一个员工
      FETCH cemp into pempno,pjob;
      exit when cemp%notfound;    
      -- 判断职位
      if pjob = 'PRESIDENT' then update emp set sal = sal + 1000 where empno = pempno;
        elsif pjob = 'MANAGER' then update emp set sal = sal + 800 where empno = pempno;
        else update emp set sal = sal + 400 where empno = pempno;
      end if;
    end loop;
  
  -- 关闭光标
  close cemp;
  
  -- 提交 oracl默认的事务隔离级别是readonly（读提交），没提交的事务是读不到的
  
  
  DBMS_OUTPUT.PUT_LINE('完成');
end;
/
  