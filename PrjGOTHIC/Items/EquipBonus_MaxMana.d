
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

