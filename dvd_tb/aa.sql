#insert into rental_tb

select
	*
from
	rental_tb rt
    left outer join (
					select
						distinct
						0 as rental_id,
						floor(rand() * 3000) + 1 as dvd_id,
						"김준이" as costomer_name,
						now() as rental_date
					from
						dvd_tb
					where
						dvd_id < 1001
						) rt2 on(rt2.dvd_id = )
							