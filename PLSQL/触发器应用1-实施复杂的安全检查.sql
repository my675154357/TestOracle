/*
实施复杂的安全性检查。
禁止在非工作时间插入数据。
1.周末：to_char(sysdate,'day') in ('星期六','星期日')
2.上班前和下班后(9：00-18：00)：to_number(to_char(sysdate,'hh24')) not between 9 and 17。小时部分如果大于等于18，那就是已经下班了，所以这里取的是17。
*/
create or replace trigger securityemp
before insert
on emp
begin
  --今天是星期三，编写了这个触发器，为了看出效果，在in中加上个星期三。正式使用记得把星期三去掉
  if to_char(sysdate,'day') in ('星期六','星期日','星期三') or to_number(to_char(sysdate,'hh24')) not between 9 and 17
    --实现禁止Insert，可以用抛例外的方式。但不能用raise，它表示是数据库出错了抛例外；这里用Raise_application_error表示抛的是应用异常。注意：oracle规定，应用抛出的错误必须在-20000~-20999之间。
    then Raise_application_error(-20001,'禁止在非工作时间插入数据');
  end if;
end;
/
