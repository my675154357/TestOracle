--打印hello world
create or replace procedure sayHello
--这里可以用as 也可以用is，相当于declare，是定义变量的部分
as
begin
  dbms_output.put_line('hello world');
end;
/

--调用存储过程第一种
--exec sayHello();
--调用存储过程第二种，直接这么写
--begin
--  sayHello();
--end;