# Group by 집계, 중복제거

select * from book_tb;

# 
select 
	distinct 
    category_id,
    publisher_id
from 
	book_tb;
    
# 카테고리별로 몇권 있는지..
# 실행 순서 : from > where > group by > select
select
	distinct category_id,
    count(*)
from 
	book_tb
where 
	book_id > 7000
group by 
	category_id;
	

# 도서명 중 `돈` 이라는 글자가 들어간 데이터들을 찾아서 카테고리별로 묶어라
# 그리고 카테고리별로 도서 갯수 출력
select
		category_id,
		count(*) as category_count
	from
		book_tb
	where
		book_name like "%돈%"
	group by
		category_id;


# 그 중에 category_count > 10 인 애들만 뽑기 - 서브쿼리로
select 
	*
from    
	(select
		category_id,
		count(*) as category_count
	from
		book_tb
	where
		book_name like "%돈%"
	group by
		category_id) as temp_tb
where
	category_count > 10;
    

# 서브쿼리 안쓰고 group by - having
# 실행 순서 : from > where > group_by > select > having
select
	category_id,
	count(*) as category_count
from
	book_tb
where
	book_name like "%돈%"
group by
	category_id
having
	category_count > 10;
    

    
    