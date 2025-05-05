
var int ATR_Training[ATR_INDEX_MAX];
var int ATR_TempBonus[ATR_INDEX_MAX];
var int ATR_PermBonus[ATR_INDEX_MAX];

func void B_RaiseAttributeByTraining(var C_Npc oth,var int attrib,var int points)
{
	B_RaiseAttribute(oth,attrib,points);
	if(C_NpcIsHero(oth))
	{
		if(attrib == ATR_STRENGTH)
		{
			ATR_Training[ATR_STRENGTH] += points;
		}
		else if(attrib == ATR_DEXTERITY)
		{
			ATR_Training[ATR_DEXTERITY] += points;
		}
		else if(attrib == ATR_MANA_MAX)
		{
			ATR_Training[ATR_MANA_MAX] += points;
		}
		else if(attrib == ATR_HITPOINTS_MAX)
		{
			ATR_Training[ATR_HITPOINTS_MAX] += points;
		}
		else if(attrib == ATR_REGENERATEHP)
		{
			if(ATR_Training[ATR_REGENERATEHP] == 0)
			{
				ATR_Training[ATR_REGENERATEHP] = 30;
			}
			else if(ATR_Training[ATR_REGENERATEHP] > 1)
			{
				ATR_Training[ATR_REGENERATEHP] -= points;
			};
		}
		else if(attrib == ATR_REGENERATEMANA)
		{
			if(ATR_Training[ATR_REGENERATEMANA] == 0)
			{
				ATR_Training[ATR_REGENERATEMANA] = 30;
			}
			else if(ATR_Training[ATR_REGENERATEMANA] > 1)
			{
				ATR_Training[ATR_REGENERATEMANA] -= points;
			};
		};
	};
};

func void B_RaiseAttributeByTempBonus(var C_Npc oth,var int attrib,var int points)
{
	Npc_ChangeAttribute(oth,attrib,points);
	if(C_NpcIsHero(oth))
	{
		if(attrib == ATR_STRENGTH)
		{
			ATR_TempBonus[ATR_STRENGTH] += points;
		}
		else if(attrib == ATR_DEXTERITY)
		{
			ATR_TempBonus[ATR_DEXTERITY] += points;
		}
		else if(attrib == ATR_MANA_MAX)
		{
			ATR_TempBonus[ATR_MANA_MAX] += points;
		}
		else if(attrib == ATR_HITPOINTS_MAX)
		{
			ATR_TempBonus[ATR_HITPOINTS_MAX] += points;
		};
	};
};

func void B_RaiseAttributeByPermBonus(var C_Npc oth,var int attrib,var int points)
{
	B_RaiseAttribute(oth,attrib,points);
	if(C_NpcIsHero(oth))
	{
		if(attrib == ATR_STRENGTH)
		{
			ATR_PermBonus[ATR_STRENGTH] += points;
		}
		else if(attrib == ATR_DEXTERITY)
		{
			ATR_PermBonus[ATR_DEXTERITY] += points;
		}
		else if(attrib == ATR_MANA_MAX)
		{
			ATR_PermBonus[ATR_MANA_MAX] += points;
		}
		else if(attrib == ATR_HITPOINTS_MAX)
		{
			ATR_PermBonus[ATR_HITPOINTS_MAX] += points;
		};
	};
};

func int RealAttributeValue(var int attrib)
{
	if(attrib == ATR_STRENGTH)
	{
		if(C_IgnorePermBonuses())
		{
			return ATR_Training[ATR_STRENGTH];
		};
		return ATR_Training[ATR_STRENGTH] + ATR_PermBonus[ATR_STRENGTH];
	};
	if(attrib == ATR_DEXTERITY)
	{
		if(C_IgnorePermBonuses())
		{
			return ATR_Training[ATR_DEXTERITY];
		};
		return ATR_Training[ATR_DEXTERITY] + ATR_PermBonus[ATR_DEXTERITY];
	};
	if(attrib == ATR_MANA_MAX)
	{
		if(C_IgnorePermBonuses())
		{
			return ATR_Training[ATR_MANA_MAX];
		};
		return ATR_Training[ATR_MANA_MAX] + ATR_PermBonus[ATR_MANA_MAX];
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		if(C_IgnorePermBonuses())
		{
			return ATR_Training[ATR_HITPOINTS_MAX];
		};
		return ATR_Training[ATR_HITPOINTS_MAX] + ATR_PermBonus[ATR_HITPOINTS_MAX];
	};
	Print(PRINT_WrongParameter);
	return 0;
};

func int VisibleAttributeValue(var int attrib)
{
	if(C_IgnorePermBonuses())
	{
		return RealAttributeValue(attrib);
	};
	if(attrib == ATR_STRENGTH)
	{
		return hero.attribute[ATR_STRENGTH];
	};
	if(attrib == ATR_DEXTERITY)
	{
		return hero.attribute[ATR_DEXTERITY];
	};
	if(attrib == ATR_MANA_MAX)
	{
		return hero.attribute[ATR_MANA_MAX];
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		return hero.attribute[ATR_HITPOINTS_MAX];
	};
	Print(PRINT_WrongParameter);
	return 0;
};

func void B_ResetAttributeSystem()
{
	if(C_NpcIsHero(hero))
	{
		ATR_Training[ATR_STRENGTH] = START_ATR_STRENGTH;
		ATR_Training[ATR_DEXTERITY] = START_ATR_DEXTERITY;
		ATR_Training[ATR_MANA_MAX] = START_ATR_MANA_MAX;
		ATR_Training[ATR_HITPOINTS_MAX] = START_ATR_HITPOINTS_MAX;
		ATR_Training[ATR_REGENERATEHP] = 0;
		ATR_Training[ATR_REGENERATEMANA] = 0;
		ATR_PermBonus[ATR_STRENGTH] = 0;
		ATR_PermBonus[ATR_DEXTERITY] = 0;
		ATR_PermBonus[ATR_MANA_MAX] = 0;
		ATR_PermBonus[ATR_HITPOINTS_MAX] = 0;
	}
	else
	{
		Print(PRINT_Error);
	};
};

func void B_InitAttributeSystem()
{
	ATR_Training[ATR_STRENGTH] = START_ATR_STRENGTH;
	ATR_Training[ATR_DEXTERITY] = START_ATR_DEXTERITY;
	ATR_Training[ATR_MANA_MAX] = START_ATR_MANA_MAX;
	ATR_Training[ATR_HITPOINTS_MAX] = START_ATR_HITPOINTS_MAX;
};

