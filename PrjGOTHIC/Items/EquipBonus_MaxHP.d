
func void Equip_MaxHP(var int value)
{
	ATR_TempBonus[ATR_HITPOINTS_MAX] += value;
	self.attribute[ATR_HITPOINTS_MAX] += value;
};

func void UnEquip_MaxHP(var int value)
{
	ATR_TempBonus[ATR_HITPOINTS_MAX] -= value;
	self.attribute[ATR_HITPOINTS_MAX] -= value;
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};

