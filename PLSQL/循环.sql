-- ��ӡ1~10
declare
 -- �������
 pnum number := 1;
begin
  loop
    --�˳�����
    exit when pnum > 10;
    -- ��ӡ
    DBMS_OUTPUT.PUT_LINE(pnum);
    -- ��1
    pnum := pnum +1;
    end loop;
end;
/