# 출판사를 기준으로 category의 count 를 집계한다.
# rank() 와 row_number()
# rank = 공동 순위 존재, row_number = 공동 순위 없음
# partition by = 범위 지정해줌
select
	*
    from
		(select
			#rank() over(partition by publisher_id order by book_count desc) as `rank`,
            # dense_rank() over(partition by publisher_id order by book_count desc) as `dense_rank`,
			row_number() over(partition by publisher_id order by book_count desc) as `num`,
			pc_count_tb.*
		from    
			(select 
				publisher_id,
				category_id,
				count(*) as book_count
			from
				book_tb
			group by
				publisher_id,
				category_id) as pc_count_tb) as book_row_number_tb
where
	num = 1;
    
    
select 
	rank() over(partition by class order by score) as `rank`,
    count(*)
from

	
		
		

		