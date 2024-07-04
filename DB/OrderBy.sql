# Order By - 정렬
# desc : 내림차순 , asc : 오름차순 (생략 가능)

select
	*
from
	category_tb
order by
	category_id desc;
    

# publisher_id 내림차순, 카테고리_id 는 오름차순
select 
	*
from 
	book_tb
order by
	publisher_id desc,
    category_id,
    book_id desc;
