
func void B_UnEquipIllegalMagicItems(var int value)
{
	var int mana;
	var int amount;
	mana = self.attribute[ATR_MANA_MAX] - value;
	//баг движка с двойным снятием оружия исправлен в Union
	/*if(mana < (Condition_Stab02 + Zauberstab_ManaBonus))
	{
		amount = Npc_HasItems(self,ItMW_Addon_Stab02);
		if(amount > 0)
		{
			Npc_RemoveInvItems(self,ItMW_Addon_Stab02,amount);
			CreateInvItems(self,ItMW_Addon_Stab02,amount);
		};
	};*/
	if(mana < STEP_WindFist)
	{
		amount = Npc_HasItems(self,ItSc_Windfist);
		if(amount > 0)
		{
			Npc_RemoveInvItems(self,ItSc_Windfist,amount);
			CreateInvItems(self,ItSc_Windfist,amount);
		};
	};
};

func void Equip_MaxMana(var int value)
{
	self.attribute[ATR_MANA_MAX] += value;
};

func void UnEquip_MaxMana(var int value)
{
	if(Npc_IsPlayer(self))
	{
		B_UnEquipIllegalMagicItems(value);
	};
	self.attribute[ATR_MANA_MAX] -= value;
	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};

