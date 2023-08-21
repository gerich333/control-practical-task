use dbo;
go


create trigger TR_Basket_insert_update
	on Basket after insert
	as
		DECLARE @ID_SKU int
		select @ID_SKU=ID_SKU
		from inserted

		if @ID_SKU in (select ID_SKU
					from inserted
					group by ID_SKU
					having count (*) >= 2)
			begin
				update Basket
				set DiscountValue = Value * 0.05
				where ID_SKU = ID_SKU
			end
		else
			begin
			update Basket
			set DiscountValue = 0
			where ID_SKU = ID_SKU
			end
