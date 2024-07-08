CREATE FUNCTION `add_number` (
	v_num1 int,
    v_num2 int
)
RETURNS INTEGER
BEGIN

RETURN v_num1 + v_num2;
END


#function 호출
select 
	add_number(10, 20);