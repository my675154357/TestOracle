--SELECT id,name,money,(SELECT money FROM test1 where id = t.id-1) money1 FROM test1 t;
--select ci_id,wm_concat(stu_name) namesList
--from (select c.ci_id,s.stu_name
--from pm_ci c, pm_stu s
--where instr(c.stu_ids,s.stu_id) > 0)
--group by ci_id;
select c.ci_id,s.stu_name
from pm_ci c, pm_stu s
where instr(c.stu_ids,s.stu_id) > 0;