
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
	if(IgnoreBonuses == FALSE)
	{
		B_RaiseRealFightTalentPercent(oth,talent,percent);
	};
	B_AddFightSkill(oth,talent,percent);
};

func void B_RaiseTalentByPermBonus(var C_NPC npc,var int talent,var int value)
{
	var string text;
	if(talent == NPC_TALENT_1H)
	{
		if((TAL_Training[NPC_TALENT_1H] + TAL_PermBonus[NPC_TALENT_1H]) >= 100)
		{
			return;
		};
		TAL_PermBonus[NPC_TALENT_1H] += value;
		UpdateTalent_Hero(NPC_TALENT_1H);
		text = PRINT_Learn1H;
	}
	else if(talent == NPC_TALENT_2H)
	{
		if((TAL_Training[NPC_TALENT_2H] + TAL_PermBonus[NPC_TALENT_2H]) >= 100)
		{
			return;
		};
		TAL_PermBonus[NPC_TALENT_2H] += value;
		UpdateTalent_Hero(NPC_TALENT_2H);
		text = PRINT_Learn2H;
	}
	else if(talent == NPC_TALENT_BOW)
	{
		if((TAL_Training[NPC_TALENT_BOW] + TAL_PermBonus[NPC_TALENT_BOW]) >= 100)
		{
			return;
		};
		TAL_PermBonus[NPC_TALENT_BOW] += value;
		UpdateTalent_Hero(NPC_TALENT_BOW);
		text = PRINT_LearnBow;
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		if((TAL_Training[NPC_TALENT_CROSSBOW] + TAL_PermBonus[NPC_TALENT_CROSSBOW]) >= 100)
		{
			return;
		};
		TAL_PermBonus[NPC_TALENT_CROSSBOW] += value;
		UpdateTalent_Hero(NPC_TALENT_CROSSBOW);
		text = PRINT_LearnCrossbow;
	};
	if(Npc_IsPlayer(npc))
	{
		text = ConcatStrings(text," + ");
		text = ConcatStrings(text,IntToString(value));
		PrintScreen(text,-1,-1,FONT_Screen,2);
		Snd_Play("LEVELUP");
	};
};

