CREATE DEFINER=`admin`@`%` PROCEDURE `usp_square`(
	inout num int 
)
BEGIN
	set num = num * num;
END


#프로시저 호출
set @number = 10;

call usp_square(@number);

select @number;