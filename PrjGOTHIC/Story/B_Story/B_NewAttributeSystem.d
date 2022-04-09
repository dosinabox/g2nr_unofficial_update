
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
		if(IgnoreBonuses == TRUE)
		{
			return ATR_Training[ATR_STRENGTH];
		};
		return ATR_Training[ATR_STRENGTH] + ATR_PermBonus[ATR_STRENGTH];
	};
	if(attrib == ATR_DEXTERITY)
	{
		if(IgnoreBonuses == TRUE)
		{
			return ATR_Training[ATR_DEXTERITY];
		};
		return ATR_Training[ATR_DEXTERITY] + ATR_PermBonus[ATR_DEXTERITY];
	};
	if(attrib == ATR_MANA_MAX)
	{
		if(IgnoreBonuses == TRUE)
		{
			return ATR_Training[ATR_MANA_MAX];
		};
		return ATR_Training[ATR_MANA_MAX] + ATR_PermBonus[ATR_MANA_MAX];
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		if(IgnoreBonuses == TRUE)
		{
			return ATR_Training[ATR_HITPOINTS_MAX];
		};
		return ATR_Training[ATR_HITPOINTS_MAX] + ATR_PermBonus[ATR_HITPOINTS_MAX];
	};
	Print(PRINT_WrongParameter);
	return 0;
};

func int CurrentAttributeValue(var int attrib)
{
	if(IgnoreBonuses == TRUE)
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
	Print(PRINT_WrongParameter);
	return 0;
};

func void B_ResetAttributeSystem()
{
	if(C_NpcIsHero(hero))
	{
		ATR_Training[ATR_STRENGTH] = 10;
		ATR_Training[ATR_DEXTERITY] = 10;
		ATR_Training[ATR_MANA_MAX] = 10;
		ATR_Training[ATR_HITPOINTS_MAX] = 40;
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

func void B_CheckAttributeSystem()
{
	if(C_NpcIsHero(hero) && Npc_KnowsInfo(hero,DIA_Xardas_FirstEXIT))
	{
		if((ATR_Training[ATR_STRENGTH] + ATR_PermBonus[ATR_STRENGTH] + ATR_TempBonus[ATR_STRENGTH]) != hero.attribute[ATR_STRENGTH])
		{
			PrintScreen("Рассинхронизация ATR_STRENGTH!",-1,70,FONT_Screen,1);
		};
		if((ATR_Training[ATR_DEXTERITY] + ATR_PermBonus[ATR_DEXTERITY] + ATR_TempBonus[ATR_DEXTERITY]) != hero.attribute[ATR_DEXTERITY])
		{
			PrintScreen("Рассинхронизация ATR_DEXTERITY!",-1,75,FONT_Screen,1);
		};
		if((ATR_Training[ATR_MANA_MAX] + ATR_PermBonus[ATR_MANA_MAX] + ATR_TempBonus[ATR_MANA_MAX]) != hero.attribute[ATR_MANA_MAX])
		{
			PrintScreen("Рассинхронизация ATR_MANA_MAX!",-1,80,FONT_Screen,1);
		};
		if((ATR_Training[ATR_HITPOINTS_MAX] + ATR_PermBonus[ATR_HITPOINTS_MAX] + ATR_TempBonus[ATR_HITPOINTS_MAX]) != hero.attribute[ATR_HITPOINTS_MAX])
		{
			PrintScreen("Рассинхронизация ATR_HITPOINTS_MAX!",-1,85,FONT_Screen,1);
		};
	};
};

func void B_InitAttributeSystem()
{
	ValidateNpc(hero);
	RealHero = Hlp_GetNpc(hero);
	ATR_Training[ATR_STRENGTH] = RealHero.attribute[ATR_STRENGTH];
	ATR_Training[ATR_DEXTERITY] = RealHero.attribute[ATR_DEXTERITY];
	ATR_Training[ATR_MANA_MAX] = RealHero.attribute[ATR_MANA_MAX];
	ATR_Training[ATR_HITPOINTS_MAX] = RealHero.attribute[ATR_HITPOINTS_MAX];
};

