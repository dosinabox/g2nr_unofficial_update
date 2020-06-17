
func int C_PredictedMana(var int value)
{
	return self.attribute[ATR_MANA_MAX] - value;
};

func void B_UnEquipIllegalMagicItems(var int value)
{
	if(C_PredictedMana(value) < (Condition_Stab02 + Zauberstab_ManaBonus))
	{
		if(UnionActivated == TRUE)
		{
			B_UnEquipHeroItem(ItMW_Addon_Stab02);
		};
	};
	if(C_PredictedMana(value) < STEP_WindFist)
	{
		B_UnEquipHeroItem(ItSc_Windfist);
	};
};

