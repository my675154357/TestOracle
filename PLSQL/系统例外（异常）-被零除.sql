--�����
SET serveroutput on
declare
  pnum number;
begin
  pnum := 1/0;
exception
  when zero_divide then dbms_output.put_line('0��������ĸ');
  when no_data_found then dbms_output.put_line('û���ҵ�����');
  when too_many_rows then dbms_output.put_line('select...into���ƥ������');
  when value_error then dbms_output.put_line('������ת������');
  when timeout_on_resource then dbms_output.put_line('�ڵȴ���Դʱ������ʱ');
  when others then dbms_output.put_line('��������'); 
end;
/