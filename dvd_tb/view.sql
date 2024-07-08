# view(뷰) 가상테이블

create view dvd_view as 
select 
	dt.dvd_id,
    dt.registration_number,
    dt.title,
    dt.producer_id,
    pdt.producer_name,
    dt.publisher_id,
    pbt.publisher_name,
    dt.publication_year,
    dt.database_date
from 
	dvd_tb dt
    left outer join producer_tb pdt on(pdt.producer_id = dt.producer_id)
    left outer join publisher_tb pbt on(pbt.publisher_id = dt.publisher_id);
    
    
select
	*
from 
	dvd_view
where
	producer_id = 10;
    
    
# maseter, join1, join2, score 테이블 조인
create view vtable as
select
	mt.master_id,
    mt.name_id,
    mt.phone_id,
    jta.join1_id,
    jta.name,
    jtb.join2_id,
    jtb.phone,
    st.score_id,
    st.kor,
    st.eng,
    st.math
from 
	master_tb mt
	left outer join join1_tb jta on(jta.join1_id = mt.name_id)
    left outer join join2_tb jtb on(jtb.join2_id = mt.phone_id)
    left outer join score_tb st on(st.name_id = mt.name_id)
        
    
    

