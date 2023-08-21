use dbo;

create function udf_GetSKUPrice (@ID_SKU int)
returns decimal(18, 2)
	begin
		declare @SKUPrice decimal(18, 2)
		select @SKUPrice = B.Value / B.Quantity
		from Basket B
		where B.ID_SKU = @ID_SKU

		return @SKUPrice
	end