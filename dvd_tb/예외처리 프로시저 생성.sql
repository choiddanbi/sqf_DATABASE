CREATE DEFINER=`admin`@`%` PROCEDURE `usp_mod_score`(
	in pi_name varchar(45),
    in pi_kor double,
    in pi_eng double,
    in pi_math double,
    out po_total double
)
BEGIN
	declare err int default 0;
    declare v_name_id int;
    declare v_error_message varchar(100);
    
    declare exit handler for sqlexception 
    begin 
		set err = 1; #예외처리용
        rollback;
        select v_error_message;
	end; #exit 면 begin ~ end 만 실행!
    
    declare continue handler for sqlwarning 
    begin
		set err = 1;
        rollback;
	end;
    
    if pi_eng = 0 then
		set v_error_message = "영어점수는 0일 수 없습니다.";
		signal sqlstate '45000' set message_text = "영어점수는 0일 수 없습니다.";
    end if;
    
    select
		join1_id into v_name_id
	from
		join1_tb
	where 
		name = pi_name;
        
        
	start transaction;
    
    update score_tb
    set
		kor = pi_kor, 
		eng = pi_eng, 
		math = pi_math
	where
		name_id = v_name_id;
        
	if err > 0 then 
		rollback;
	else
		commit;
    end if;
		
	select 
		kor + eng + math into po_total
	from
		score_tb
	where
		name_id = v_name_id;
END


# 프로시저 호출
set @total = 0;
call usp_mod_score("백승주", 90, 0, 80, @total);

select @total;