--被零除
SET serveroutput on
declare
  pnum number;
begin
  pnum := 1/0;
exception
  when zero_divide then dbms_output.put_line('0不能做分母');
  when no_data_found then dbms_output.put_line('没有找到数据');
  when too_many_rows then dbms_output.put_line('select...into语句匹配多个行');
  when value_error then dbms_output.put_line('算数或转换错误');
  when timeout_on_resource then dbms_output.put_line('在等待资源时发生超时');
  when others then dbms_output.put_line('其他例外'); 
end;
/