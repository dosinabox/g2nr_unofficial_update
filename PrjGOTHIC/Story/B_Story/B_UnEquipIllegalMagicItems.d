
func void B_UnEquipIllegalMagicItems(var int value)
{
	var int mana;
	mana = self.attribute[ATR_MANA_MAX] - value;
	//баг движка с двойным снятием оружия исправлен в Union
	/*if(mana < (Condition_Stab02 + Zauberstab_ManaBonus))
	{
		B_UnEquipHeroItem(ItMW_Addon_Stab02);	
	};*/
	if(mana < STEP_WindFist)
	{
		B_UnEquipHeroItem(ItSc_Windfist);
	};
};

