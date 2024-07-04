# group by - 그룹
# 집계 -> count, max, min, sum, avg 등...

select
	admission_data,
    count(*) 
from
	student_tb
group by
	admission_data;