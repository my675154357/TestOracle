--��ѯ50�Ų��ŵ�Ա��
declare
  cursor cemp is select ename from emp where deptno=50;
  pename emp.ename%type;
  --�Զ������⣨��Ϊoracle�в�����java�����̳�exception���Զ����쳣�����ԣ�����Ͱ��Զ������⵱��һ������������������exception��
  no_emp_found exception;
begin
  open cemp;
  --ȡ��һ����¼
  fetch cemp into pename;
  if cemp%notfound then
    --�׳����⣬raise�൱��java�е�throw
    raise no_emp_found;
  end if;
  --���̣�pmon���̣�proccess monitor ���̼�������
  close cemp;
exception
  when no_emp_found then dbms_output.put_line('û���ҵ�Ա��');
  when others then dbms_output.put_line('��������');  
end;