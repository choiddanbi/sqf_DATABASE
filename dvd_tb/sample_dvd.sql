SELECT * FROM dvd_db.sample_dvd_tb;

# producer 정보 추출
# 방법 1
insert into producer_tb
select 
	distinct
	0,
    제작자
from
	sample_dvd_tb;

# 방법2
insert into producer_tb
select 
	0,
    제작자
from
	sample_dvd_tb
group by 제작자;



    
# publisher 정보 추출
select
	#발행자, #공백
    nullif(발행자, "") #발행자 값이 공백이면 null 값으로 주기
    #ifnull(nullif(replace(발행자," ", ""), ""), "발행자없음")  #값이 null 이면 "발행자 없음" 으로 ~  
from 
	sample_dvd_tb
group by
	발행자
having 
	nullif(발행자, "") is not null;
    
    
insert into publisher_tb(publisher_name)
select
    nullif(발행자, "") as publisher_name #발행자 값이 공백이면 null 값으로 주기
from 
	sample_dvd_tb
group by
	발행자
having 
	publisher_name is not null;
    