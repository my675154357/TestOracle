--ÿ�β�����Ա�����Զ���ӡ������ɹ���
create trigger firstTrigger
after insert
on emp
declare
begin
dbms_output.put_line('����ɹ�');
end;
/