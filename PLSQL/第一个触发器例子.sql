--每次插入新员工，自动打印“插入成功”
create trigger firstTrigger
after insert
on emp
declare
begin
dbms_output.put_line('插入成功');
end;
/