--��ѯĳ�����ŵ�Ա������
declare
  --�β�
  CURSOR cemp(dno number) is SELECT ename FROM emp where DEPTNO = dno;
  pname emp.ename%type;
begin
  --ʵ��
  open cemp(10);
  loop
    FETCH cemp into pname;
    exit when cemp%notfound;    
    DBMS_OUTPUT.PUT_LINE(pname);  
  end loop;
  close cemp;
end;
/