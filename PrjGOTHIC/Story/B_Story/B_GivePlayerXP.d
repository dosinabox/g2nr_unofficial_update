
var int LevelUpsDuringTransform;

func void B_GivePlayerXP(var int add_xp)
{
	var string concatText;
	if(hero.level == 0)
	{
		hero.exp_next = 500;
	};
	hero.exp += add_xp;
	if(add_xp >= 0)
	{
		concatText = PRINT_XPGained;
	}
	else
	{
		if(hero.exp < 0)
		{
			hero.exp = 0;
		};
		concatText = PRINT_XPLost;
	};
	concatText = ConcatStrings(concatText,IntToString(add_xp));
	PrintScreen(concatText,-1,YPOS_XPGained,FONT_ScreenSmall,2);
	if(hero.exp >= hero.exp_next)
	{
		hero.level += 1;
		if(PlayerIsTransformed == TRUE)
		{
			LevelUpsDuringTransform += 1;
		};
		hero.exp_next += (hero.level + 1) * 500;
		hero.attribute[ATR_HITPOINTS_MAX] += HP_PER_LEVEL;
		hero.attribute[ATR_HITPOINTS] += HP_PER_LEVEL;
		hero.lp += LP_PER_LEVEL;
		PrintScreen(PRINT_LevelUp,-1,YPOS_LevelUp,FONT_Screen,2);
		Snd_Play("LevelUp");
	};
	B_CheckLog();
};

func void B_GiveDeathXP(var C_Npc Killer, var C_Npc Victim)
{
	if((Npc_IsPlayer(Killer) || ((Killer.aivar[AIV_PARTYMEMBER] == TRUE) && !Npc_IsPlayer(Victim))) && (Victim.aivar[AIV_VictoryXPGiven] == FALSE) && (Victim.level != 0))
	{
		B_GivePlayerXP(Victim.level * XP_PER_VICTORY);
		Victim.aivar[AIV_VictoryXPGiven] = TRUE;
	}; 
};