-- ��ѯ����ӡԱ����������нˮ
/*
�������ԣ� %isopen �Ƿ��
%rowcount: Ӱ��ĵ�����������������100����¼��ȡ����10�У���ô���Ӱ�����������10��
%found  %notfound  ȡ��/ûȡ����¼
*/

DECLARE
 --�����꣨�α꣩
 CURSOR cemp is SELECT ename,sal FROM emp;
 pname EMP.ENAME%type;
 psal EMP.SAL%type;
begin
  -- �򿪹��
  open cemp;

  LOOP
    -- ȡ��ǰ�ļ�¼
    FETCH cemp into pname,psal;
    -- û��ȡ����¼���˳�
    exit when cemp%notfound;
    
    -- �м�¼�ʹ�ӡ
    dbms_output.put_line(pname||'��нˮ��'||psal);
  end loop;
  -- �رչ��
  close cemp;
end;
/