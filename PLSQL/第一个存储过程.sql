--��ӡhello world
create or replace procedure sayHello
--���������as Ҳ������is���൱��declare���Ƕ�������Ĳ���
as
begin
  dbms_output.put_line('hello world');
end;
/

--���ô洢���̵�һ��
--exec sayHello();
--���ô洢���̵ڶ��֣�ֱ����ôд
--begin
--  sayHello();
--end;