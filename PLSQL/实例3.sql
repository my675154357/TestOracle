--ʵ�ְ����ŷֶΣ�6000���ϡ�3000~6000��3000һ�¡�ͳ�Ƹ����ʶε�ְ���������Լ������ŵĹ����ܶ��������
--create table msg
--(deptno number,
--count1 number,
--count2 number,
--count3 number,
--saltotal number
--);
declare
  --����
  cursor cdept is select deptno from dept;
  pdeptno DEPT.DEPTNO%type;
  --������Ա����нˮ
  cursor cemp(dno number) is select sal from emp where deptno = dno;
  psal emp.sal%type;
  --ÿ���ε�����
  count1 number;
  count2 number;
  count3 number;
  --���ŵĹ����ܶ�
  salTotal number := 0;
begin
  open cdept;
  loop
    --ȡһ������
    fetch cdept into pdeptno;
    exit when cdept%notfound;
      --�ڵڶ���ѭ����ʼǰ���ȳ�ʼ��
      count1:=0;count2:=0;count3:=0;salTotal:=0;
      --ȡ������Ա����нˮ
      open cemp(pdeptno);
        loop
        --ȡһ��Ա����нˮ
        fetch cemp into psal;
        exit when cemp%notfound;
        --�ж�
        if psal<3000 then count1 := count1 + 1;
          elsif psal>=3000 and psal<6000 then count2 := count2 + 1;
          else count3 := count3 + 1;
        end if;
        salTotal := salTotal + psal;
        end loop;
      close cemp;
      --������
      insert into msg values(pdeptno,count1,count2,count3,salTotal);
  end loop;
  close cdept;
  commit;
  dbms_output.put_line('�������');
end;
/