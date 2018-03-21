-- 打印1~10
declare
 -- 定义变量
 pnum number := 1;
begin
  loop
    --退出条件
    exit when pnum > 10;
    -- 打印
    DBMS_OUTPUT.PUT_LINE(pnum);
    -- 加1
    pnum := pnum +1;
    end loop;
end;
/