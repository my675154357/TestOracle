--�����ͱ�������ѯ����ӡ7839��������нˮ
declare 
  --�����������������нˮ
   pname emp.ename%type;
   psal emp.sal%type;
begin
  --�õ�7839��������нˮ
  select ename,sal into pname,psal from emp where empno=7839;
  --��ӡ
  dbms_output.put_line(pname||'��нˮ��'||psal);
end;
