
func void B_RaiseTalentByPermBonus(var C_Npc npc,var int talent,var int value)
{
	var string text;
	value = B_ChangeTalent(npc,talent,value,TS_PermBonus);
	if(value == 0)
	{
		return;
	};
	if(talent == NPC_TALENT_1H)
	{
		text = PRINT_Learn1H;
	}
	else if(talent == NPC_TALENT_2H)
	{
		text = PRINT_Learn2H;
	}
	else if(talent == NPC_TALENT_BOW)
	{
		text = PRINT_LearnBow;
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		text = PRINT_LearnCrossbow;
	};
	text = ConcatStrings(text," + ");
	text = ConcatStrings(text,IntToString(value));
	PrintScreen(text,-1,-1,FONT_Screen,2);
	Snd_Play("LEVELUP");
};

//для поддержки Bonus Independent Training
func void B_RaiseRealFightTalentPercent(var C_Npc oth,var int talent,var int percent)
{
	if(talent == NPC_TALENT_1H)
	{
		oth.aivar[REAL_TALENT_1H] += percent;
	}
	else if(talent == NPC_TALENT_2H)
	{
		oth.aivar[REAL_TALENT_2H] += percent;
	}
	else if(talent == NPC_TALENT_BOW)
	{
		oth.aivar[REAL_TALENT_BOW] += percent;
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		oth.aivar[REAL_TALENT_CROSSBOW] += percent;
	};
};

