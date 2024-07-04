# 데이터 삽입 (DML - Insert)

select * from student_tb;

# insert into `study`.`student_tb` > Database 가 use 되지 않은 경우 ( 더블클릭 or use study )
# insert into `student_tb`  > Database 가 use 상태 인 경우
# 모두 동일
insert into student_tb
	(student_id, student_name, phone, email, admission_data)
values
	(0, "박도현", "010-1234-5678", "skjil1218@kakao.com", now());
    
    
insert into student_tb
	(student_id, student_name, phone, email, admission_data)
values
	(0, "김준이", "010-1234-5678", "skjil1218@kakao.com", now()),
    (0, "김준삼", "010-1234-5678", "skjil1218@kakao.com", now()),
    (0, "김준사", "010-1234-5678", "skjil1218@kakao.com", now());
    

insert into student_tb
	(student_id, student_name, phone, email, introduce, admission_data)
values
	(0, "김준오", "010-1234-5678", "skjil1218@kakao.com", null, now());


# 순서 상관 x
insert into student_tb
	(student_id, phone, email, introduce, student_name, admission_data)
values
	(0, "010-1234-5678", "skjil1218@kakao.com", null, "김준육", now());
    
    
# column 생략 가능 ( 단, 모든 culumn 값을 순서대로 대입 )
insert into student_tb
values
	(0, "김준칠", "010-1234-5678", "skjil1218@kakao.com", null, now());