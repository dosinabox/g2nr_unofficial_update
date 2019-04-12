
func void B_RaiseRealFightTalentPercent(var C_Npc oth,var int talent,var int percent)
{
	if(talent == NPC_TALENT_1H)
	{
		oth.aivar[REAL_TALENT_1H] = oth.aivar[REAL_TALENT_1H] + percent;
	}
	else if(talent == NPC_TALENT_2H)
	{
		oth.aivar[REAL_TALENT_2H] = oth.aivar[REAL_TALENT_2H] + percent;
	}
	else if(talent == NPC_TALENT_BOW)
	{
		oth.aivar[REAL_TALENT_BOW] = oth.aivar[REAL_TALENT_BOW] + percent;
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		oth.aivar[REAL_TALENT_CROSSBOW] = oth.aivar[REAL_TALENT_CROSSBOW] + percent;
	};
};

func void B_RaiseFightTalent(var C_Npc oth,var int talent,var int percent)
{
	B_RaiseRealFightTalentPercent(oth,talent,percent);
	B_AddFightSkill(oth,talent,percent);
};

