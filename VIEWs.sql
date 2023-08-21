use dbo;

create view vw_SKUPrice as
select
	ID
	,code
	,name
	,dbo.udf_GetSKUPrice(ID) as SKUPrice
from
	SKU
