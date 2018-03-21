--为员工涨工资。从最低工资调起，每人涨10%，但工资总额不能超过5万。计算出涨工资的人数和涨工资后的工资总额，并输出涨工资人数及工资总额。
--程序有bug，会大于5万
declare
  cursor cemp is select empno,sal from emp order by sal;
  pempno emp.empno%type;
  psal emp.sal%type;
  --涨工资的人数
  countEmp number := 0;
  --涨后的工资总额
  salTotal number;
begin
  --得到工资总额的初始值
  select sum(sal) into salTotal from emp;
  open cemp;
    loop
      --1.总额大于5万
      exit when salTotal > 50000;
      --取一个员工
      fetch cemp into pempno,psal;
      --2.notfounnd
      exit when cemp%notfound;
      --涨工资
      update emp set sal = sal * 1.1 where empno = pempno;
      --人数++
      countEmp := countEmp + 1;
      --涨后的工资总额 = 涨前 + sal *0.1；
      salTotal := salTotal + psal * 0.1;
    end loop;
  close cemp;
  commit;
  dbms_output.put_line('人数:'||countEmp||'  总额:'||salTotal);
end;
/
