# 트랜젝션(Transaction) : insert, update 등등 동작들의 한 묶음
# 그냥 rollback 을 하게 되면 start transaction 을 다시 해야함!

set @name = "김준일";
select @name;


# 자동 저장 (?) > 1이면 자동 commit 됨 > sql 꺼도 테이블에 남아있음
select @@autocommit;
set autocommit = 0;

insert into master_tb
values
	(0, 6, 1);

# autocommit = 0 일때 테이블에 데이터 남기고 싶으면 commit 명령 해줘야함 ~
commit; 




# 트랜젝션 사용법usp_add_master
start transaction;

set @name = "권혁직"; 
set @phone = "010-6666-8888";

savepoint sp_insert_name;
insert into join1_tb
values(0, @name);

savepoint sp_insert_phone;
insert into join2_tb
values (0, @phone);

# rollback to sp_insert_name; # 황인수 -> 권혁진으로 수정하고 싶음 >> savepoint 로 돌아가! (이름 넣은거 취소)
rollback to sp_insert_phone; 

set @new_join1_id = 0;
set @new_join2_id = 0;

select 
	join1_id into @new_join1_id
from
	join1_tb
order by 
	join1_id desc
limit 0, 1;    #젤 위에 있는 거 하나 가져와라 = 젤 최근에 넣은거 


select 
	join2_id into @new_join2_id
from
	join2_tb
order by 
	join2_id desc
limit 0, 1;  

    
insert into master_tb
values (0, @new_join1_id, @new_join2_id);

commit;
















