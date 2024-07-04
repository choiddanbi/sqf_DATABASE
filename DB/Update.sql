# 데이터 수정(DML - UPDATE)

select * from student_tb;

select 
	student_id
from
	student_tb
where
	student_name = "김준오";

# 실행 순서 update -> where -> set
update
	student_tb
set	
	email = "ccc@gmail.com"
where 
	student_id in (  select 
						temp_student_tb.student_id
					from
						(select * from student_tb) as temp_student_tb
					where
						temp_student_tb.student_name = "김준오"); 
                        

# 방법2
update
	student_tb
set
	phone = "010-7777-7777",
    email = "zzzz@kakao.com"
where
	student_id = 3;