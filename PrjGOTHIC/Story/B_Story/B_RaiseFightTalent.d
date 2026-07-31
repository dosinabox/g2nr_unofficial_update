
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

