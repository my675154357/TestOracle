--ΪԱ���ǹ��ʡ�����͹��ʵ���ÿ����10%���������ܶ�ܳ���5�򡣼�����ǹ��ʵ��������ǹ��ʺ�Ĺ����ܶ������ǹ��������������ܶ
--������bug�������5��
declare
  cursor cemp is select empno,sal from emp order by sal;
  pempno emp.empno%type;
  psal emp.sal%type;
  --�ǹ��ʵ�����
  countEmp number := 0;
  --�Ǻ�Ĺ����ܶ�
  salTotal number;
begin
  --�õ������ܶ�ĳ�ʼֵ
  select sum(sal) into salTotal from emp;
  open cemp;
    loop
      --1.�ܶ����5��
      exit when salTotal > 50000;
      --ȡһ��Ա��
      fetch cemp into pempno,psal;
      --2.notfounnd
      exit when cemp%notfound;
      --�ǹ���
      update emp set sal = sal * 1.1 where empno = pempno;
      --����++
      countEmp := countEmp + 1;
      --�Ǻ�Ĺ����ܶ� = ��ǰ + sal *0.1��
      salTotal := salTotal + psal * 0.1;
    end loop;
  close cemp;
  commit;
  dbms_output.put_line('����:'||countEmp||'  �ܶ�:'||salTotal);
end;
/
