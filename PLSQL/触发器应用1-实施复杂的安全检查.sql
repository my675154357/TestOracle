/*
ʵʩ���ӵİ�ȫ�Լ�顣
��ֹ�ڷǹ���ʱ��������ݡ�
1.��ĩ��to_char(sysdate,'day') in ('������','������')
2.�ϰ�ǰ���°��(9��00-18��00)��to_number(to_char(sysdate,'hh24')) not between 9 and 17��Сʱ����������ڵ���18���Ǿ����Ѿ��°��ˣ���������ȡ����17��
*/
create or replace trigger securityemp
before insert
on emp
begin
  --����������������д�������������Ϊ�˿���Ч������in�м��ϸ�����������ʽʹ�üǵð�������ȥ��
  if to_char(sysdate,'day') in ('������','������','������') or to_number(to_char(sysdate,'hh24')) not between 9 and 17
    --ʵ�ֽ�ֹInsert��������������ķ�ʽ����������raise������ʾ�����ݿ�����������⣻������Raise_application_error��ʾ�׵���Ӧ���쳣��ע�⣺oracle�涨��Ӧ���׳��Ĵ��������-20000~-20999֮�䡣
    then Raise_application_error(-20001,'��ֹ�ڷǹ���ʱ���������');
  end if;
end;
/
