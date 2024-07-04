# 데이터 조회(DML - SELECT)

# select 표현법 여러가지
select * from student_tb; # 전체 조회
select `student_id`, `student_name`, `phone`, `introduce`, `admission_data` from `study`.`student_tb`;
select student_id, student_name, phone, introduce, admission_data from `study`.`student_tb`;
select student_id, student_name, phone, introduce, admission_data from `student_tb`;
select student_id, student_name, phone, introduce, admission_data from student_tb;
select student_id, student_name, introduce from student_tb; # 원하는거만 보기
select student_name, introduce, student_id from student_tb; # 순서 바꿔도 가능
select student_id, student_name as s_name from student_tb; # student_name 을 s_name 으로 이름바꿔서 보기


# union (all) 병합 조건 => 컴럼의 갯수와 자료형이 동이리한 select 문 결과만 병합 가능
# union 문 : 두개의 select 문 결과 합치기
# union all : 중복제거 X
# union : 중복제거 O
# table 로 정식적으로 생성하지 않고 쿼리창에서 select 문으로 만든건데도 table 취급 가능 >> 가상의 테이블 (??) = 서브쿼리
select 1 as number, "김준일" as name, 31 as age
union 
select 2 as number, "김준이" as name, 32 as age
union
select 2 as number, "김준이" as name, 32 as age;


select student_id, student_name from student_tb
union all
select student_id, phone from student_tb; 


#  가상테이블의 이름을 temp_tb 라고 정해줌 
select 
	number, name 
from 
	(select 1 as number, "김준일" as name, 31 as age
	union 
	select 2 as number, "김준이" as name, 32 as age
	union
	select 2 as number, "김준이" as name, 32 as age) as temp_tb;