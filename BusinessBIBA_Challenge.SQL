create table public.BusinessBIBA_Challenge 
(row				int,
ID				int,
UPDATE			varchar(15),
STATUS			varchar(15),
MOTIVE			varchar(15),
INTEREST_RATE	int,
AMOUNT			int,
CAT				int,
TXN				float,
CP				int,
DELIVERY_SCORE	int); 

Select *
from public.BusinessBIBA_Challenge
limit 10;

select count(distinct id)
from public.BusinessBIBA_Challenge;

select max(id)
from public.BusinessBIBA_Challenge;

select count(a.*)
from (select id
		from public.BusinessBIBA_Challenge
		group by id
		having count(1) = 1) a;
		
select status, count(1)
from public.BusinessBIBA_Challenge
where txn is null
group by status;

update 	public.BusinessBIBA_Challenge
set 	status = 'UNOPENED'
where 	status is null
and 	txn is null;

update 	public.BusinessBIBA_Challenge
set 	status = 'TRANSACTION'
where 	status is null;

select  id, status, motive, interest_rate, amount, cat, txn, cp, delivery_score
from public.BusinessBIBA_Challenge
order by id, update desc
