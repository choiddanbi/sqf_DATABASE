SELECT * FROM dvd_db.dvd_register_tb;

# 같은 이름의 dvd 관리용!!
insert into dvd_register_tb 
values
	(0, 1, now()),
	(0, 1, now()),
	(0, 1, now()),
	(0, 1, now());
    
# 방법1 
select
	0,
    dvd_id,
    now()
from	
	dvd_tb
union all
select
	0,
    dvd_id,
    now()
from	
	dvd_tb    
union all
select
	0,
    dvd_id,
    now()
from	
	dvd_tb  
order by 
	dvd_id;
    
# 방법2
insert into dvd_register_tb
select
	0,
    dt1.dvd_id,
    now()
 from
	dvd_tb dt1
    left outer join dvd_tb dt2 on(dt2.dvd_id < 4);
    


    
    