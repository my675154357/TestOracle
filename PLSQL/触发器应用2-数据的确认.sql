/*
数据的确认
涨后的薪水不能少于涨前的薪水
*/
create or replace trigger checkSalary
before update 
on emp
for each row
begin
  if :new.sal < :old.sal
    then raise_application_error(-20002,'涨后的薪水不能少于涨前的薪水。'||'  涨前薪水：'||:old.sal||'  涨后薪水：'||:new.sal);
  end if;
end;
/