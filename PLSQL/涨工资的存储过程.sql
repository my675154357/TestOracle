--��ָ����Ա����100����
create or replace procedure raiseSalary(eno in number)
is
--�������������ǰ��нˮ
psal emp.sal%type;
begin
  --�õ���ǰ��нˮ
  select sal into psal from emp where empno=eno;
  --��100
  update emp set sal=sal+100 where empno=eno;
  --һ�㲻�ڴ洢�������ύ���ع�����������һ����
  dbms_output.put_line('��ǰ��'||psal||'   �Ǻ�'||(psal+100));
end raiseSalary;
/