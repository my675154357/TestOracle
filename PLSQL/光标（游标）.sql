-- 查询并打印员工的姓名和薪水
/*
光标的属性： %isopen 是否打开
%rowcount: 影响的的行数（如果光标中有100条记录，取走了10行，那么这个影响的行数就是10）
%found  %notfound  取到/没取到记录
*/

DECLARE
 --定义光标（游标）
 CURSOR cemp is SELECT ename,sal FROM emp;
 pname EMP.ENAME%type;
 psal EMP.SAL%type;
begin
  -- 打开光标
  open cemp;

  LOOP
    -- 取当前的记录
    FETCH cemp into pname,psal;
    -- 没有取到记录就退出
    exit when cemp%notfound;
    
    -- 有记录就打印
    dbms_output.put_line(pname||'的薪水是'||psal);
  end loop;
  -- 关闭光标
  close cemp;
end;
/