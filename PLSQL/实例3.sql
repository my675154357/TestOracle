--实现按部门分段：6000以上、3000~6000，3000一下。统计各工资段的职工人数，以及各部门的工资总额（不含奖金）
--create table msg
--(deptno number,
--count1 number,
--count2 number,
--count3 number,
--saltotal number
--);
declare
  --部门
  cursor cdept is select deptno from dept;
  pdeptno DEPT.DEPTNO%type;
  --部门中员工的薪水
  cursor cemp(dno number) is select sal from emp where deptno = dno;
  psal emp.sal%type;
  --每个段的人数
  count1 number;
  count2 number;
  count3 number;
  --部门的工资总额
  salTotal number := 0;
begin
  open cdept;
  loop
    --取一个部门
    fetch cdept into pdeptno;
    exit when cdept%notfound;
      --在第二个循环开始前，先初始化
      count1:=0;count2:=0;count3:=0;salTotal:=0;
      --取部门中员工的薪水
      open cemp(pdeptno);
        loop
        --取一个员工的薪水
        fetch cemp into psal;
        exit when cemp%notfound;
        --判断
        if psal<3000 then count1 := count1 + 1;
          elsif psal>=3000 and psal<6000 then count2 := count2 + 1;
          else count3 := count3 + 1;
        end if;
        salTotal := salTotal + psal;
        end loop;
      close cemp;
      --保存结果
      insert into msg values(pdeptno,count1,count2,count3,salTotal);
  end loop;
  close cdept;
  commit;
  dbms_output.put_line('操作完成');
end;
/