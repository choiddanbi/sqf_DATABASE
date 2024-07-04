# where - 조건

# 단순 비교 연산
select 
	*
from 
	student_tb
where 
	student_name = "박도현";
    
    
# or 연산    
# 실행 순서 : from 테이블명 > where 행 > select 열
select
	student_id,
    student_name
from 
	student_tb
where
	student_name ="박도현" 
    or student_name="김준이";
    
    
# or 조건을 in 연산으로 표현 가능!
select
	*
from
	student_tb
where
	student_name in ("박도현", "김준이", "김준삼");
    
    

# AND 연산    
select
	*
from 
	student_tb
where
	student_id > 2
    and student_id < 4;
    
# AND 조건을 between A and B 조건으로 표현! ( 이상&이하만 표현 가능 )
select
	*
from 
	student_tb
where
	student_id between 2 and 4;  # 2,3,4 나옴

    
# NOT 
select 
	*
from
	student_tb
where
	NOT student_name = "박도현";
    

# NULL 체크 - is null / is not null
select 
	*
from 
	student_tb
where
	#introduce is null;
	introduce is not null;
 
 
 
insert into student_tb
values
	(0, "손경태", "010-1111-2222", "aaa@gmail.com", null, now()),
	(0, "김지현", "010-1111-3333", "bbb@naver.com", null, now()),
	(0, "김동인", "010-2222-2222", "ccc@gmail.com", null, now()),
	(0, "김정현", "010-4444-3333", "aaabbb@naver.com", null, now()),
	(0, "권오광", "010-5555-2222", "bbbccc@kakao.com", null, now()),
	(0, "권혁진", "010-1111-5555", "aaabbbccc@kakao.com", null, now());
 
 
# like 연산
# 와일드 카드 (%, _)
# % (포함, 자릿수 상관x)
select
	*
from
	student_tb
where
	student_name like "김%";


select
	*
from
	student_tb
where
	email like "%gmail.com";
    

select
	*
from 	
	student_tb
where
	phone like "%2222%"; #포함


select
	*
from 
	student_tb
where
	phone like "%2222%"
    and not phone like"%2222";

# 2. _ (포함, 자릿수 상관 o)
select
	*
from 
	student_tb
where 
	email like "___bbb%";

