# 데이터 삭제 (DML - DELETE)

select * from student_tb;


delete
from
	student_tb
where 
	student_id = 2;



update
	student_tb
set
	introduce = "'bbb를 포함하고 있는 계정입니다.'"
where
	email like "%bbb%@%";


delete
from 
	student_tb
where
	student_id in (5,6,7); 
    # student_id between 5 and 7;
    # student_id > 4 and student_id < 8;


	