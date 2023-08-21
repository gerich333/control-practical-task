use dbo;
go


create procedure usp_MakeFamilyPurchase 
	@FamilySurName varchar(255)
as
if (select ID from Family where SurName = @FamilySurName) is not null
	update dbo.Family
	set BudgetValue = dbo.Family.BudgetValue - (select sum(dbo.Basket.Value)
												from Basket
												where ID_Family in (select ID
																	from Family
																	where SurName = @FamilySurName))
	where
		SurName = @FamilySurName
else
	print 'Ошибка: Такой семьи нет в базе данных'
