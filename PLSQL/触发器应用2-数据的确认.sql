/*
���ݵ�ȷ��
�Ǻ��нˮ����������ǰ��нˮ
*/
create or replace trigger checkSalary
before update 
on emp
for each row
begin
  if :new.sal < :old.sal
    then raise_application_error(-20002,'�Ǻ��нˮ����������ǰ��нˮ��'||'  ��ǰнˮ��'||:old.sal||'  �Ǻ�нˮ��'||:new.sal);
  end if;
end;
/