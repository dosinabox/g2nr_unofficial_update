
func void B_RaiseRealFightTalentPercent(var C_Npc oth,var int talent,var int percent)
{
	if(talent == NPC_TALENT_1H)
	{
		oth.aivar[REAL_TALENT_1H] += percent;
		if(oth.aivar[REAL_TALENT_1H] > 100)
		{
			oth.aivar[REAL_TALENT_1H] = 100;
		};
	}
	else if(talent == NPC_TALENT_2H)
	{
		oth.aivar[REAL_TALENT_2H] += percent;
		if(oth.aivar[REAL_TALENT_2H] > 100)
		{
			oth.aivar[REAL_TALENT_2H] = 100;
		};
	}
	else if(talent == NPC_TALENT_BOW)
	{
		oth.aivar[REAL_TALENT_BOW] += percent;
		if(oth.aivar[REAL_TALENT_BOW] > 100)
		{
			oth.aivar[REAL_TALENT_BOW] = 100;
		};
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		oth.aivar[REAL_TALENT_CROSSBOW] += percent;
		if(oth.aivar[REAL_TALENT_CROSSBOW] > 100)
		{
			oth.aivar[REAL_TALENT_CROSSBOW] = 100;
		};
	};
};

func void B_RaiseFightTalent(var C_Npc oth,var int talent,var int percent)
{
	//	эксперимент: игнорирование зелий, еды и табличек при прокачке
	if(IgnoreBonuses == FALSE)
	{
		B_RaiseRealFightTalentPercent(oth,talent,percent);
	};
	B_AddFightSkill(oth,talent,percent);
};

