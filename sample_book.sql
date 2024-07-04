select * from sample_book_tb;

-- insert select
-- 도서관 정보 테이블 데이터 추출
insert into library_tb(library_name, library_code, library_url)
select	
	도서관명,
    도서관구분코드,
    도서관홈페이지
from
	sample_book_tb
group by
	도서관명,
    도서관구분코드,
    도서관홈페이지;
   
drop table library_tb;

-- 카테고리 정보 테이블 데이터 추출
-- group by 중복데이터시 하나만 보여짐

insert into category_tb
select
	0,
    카테고리
from
	sample_book_tb
group by
    카테고리;

insert into publisher_tb
select
	0,
	출판사
from
	sample_book_tb
group by
	출판사;

insert into book_type_tb
select
	0,
	형식
from
	sample_book_tb
group by
	형식;

-- 정규화된 데이터 매칭
-- as 생략가능
-- 삼항 연산
update
	sample_book_tb as sbt
    left outer join library_tb as lt on(lt.library_name = sbt.도서관명)
    left outer join category_tb as ct on(ct.category_name = sbt.카테고리)
    left outer join publisher_tb as pt on(pt.publisher_name = sbt.출판사)
	left outer join book_type_tb as btt on(btt.book_type_name = sbt.형식)
set
	도서관ID = lt.library_id,
    카테고리ID = ct.category_id,
    출판사ID = if(sbt.출판사 = "", null , pt.publisher_id),
    형식ID = btt.book_type_id;

# 괄호는 `` 함수가 아님을 표시함
insert into book_tb
select
	0,
	도서관ID,
    도서명,
    저자명,
    `국제표준도서번호(ISBN)`,
    카테고리ID,
    출판사ID,
    `표지주소(URL)`,
    형식ID
from
	sample_book_tb;