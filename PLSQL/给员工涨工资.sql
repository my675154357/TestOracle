-- ��Ա���ǹ��ʣ��ܲ�1000������800������400
DECLARE
  --������
  CURSOR cemp is SELECT empno,job FROM emp;
  pempno EMP.EMPNO%type;
  pjob EMP.JOB%type;
begin
  ROLLBACK;
  --�򿪹��
  open cemp;
  
    loop
      -- ȡһ��Ա��
      FETCH cemp into pempno,pjob;
      exit when cemp%notfound;    
      -- �ж�ְλ
      if pjob = 'PRESIDENT' then update emp set sal = sal + 1000 where empno = pempno;
        elsif pjob = 'MANAGER' then update emp set sal = sal + 800 where empno = pempno;
        else update emp set sal = sal + 400 where empno = pempno;
      end if;
    end loop;
  
  -- �رչ��
  close cemp;
  
  -- �ύ oraclĬ�ϵ�������뼶����readonly�����ύ����û�ύ�������Ƕ�������
  
  
  DBMS_OUTPUT.PUT_LINE('���');
end;
/
  