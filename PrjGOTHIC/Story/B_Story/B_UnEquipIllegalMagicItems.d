
func void B_UnEquipIllegalMagicItems(var int value)
{
	var int mana;
	mana = self.attribute[ATR_MANA_MAX] - value;
	if(mana < (Condition_Stab02 + Zauberstab_ManaBonus))
	{
		if(UnionActivated == TRUE)
		{
			B_UnEquipHeroItem(ItMW_Addon_Stab02);
		};
	};
	if(mana < STEP_WindFist)
	{
		B_UnEquipHeroItem(ItSc_Windfist);
	};
};

