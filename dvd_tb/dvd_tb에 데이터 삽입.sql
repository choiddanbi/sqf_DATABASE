insert into dvd_tb
select
	0,
    등록번호,
    제목,
    pdt.producer_id,
    pbt.publisher_id,
    발행년,
    데이터기준일자
from
	sample_dvd_tb sdt
	left outer join producer_tb pdt on(pdt.producer_name = sdt.제작자)
    left outer join publisher_tb pbt on(pbt.publisher_name = sdt.발행자)
