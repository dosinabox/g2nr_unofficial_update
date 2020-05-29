
var int LevelUpsDuringTransform;

func void B_LevelUp(var int levels)
{
	hero.level += levels;
	if(PlayerIsTransformed == TRUE)
	{
		LevelUpsDuringTransform += levels;
	};
	hero.exp_next = (XP_PER_LEVEL / 2) * (hero.level + 2) * (hero.level + 1);
	hero.attribute[ATR_HITPOINTS_MAX] += levels * HP_PER_LEVEL;
	hero.attribute[ATR_HITPOINTS] += levels * HP_PER_LEVEL;
	hero.lp += levels * LP_PER_LEVEL;
	PrintScreen(PRINT_LevelUp,-1,YPOS_LevelUp,FONT_Screen,2);
	Snd_Play("LevelUp");
};

func int CalculateLowerXP(var int add_xp)
{
	var int modifier;
	var int lower_xp;
	modifier = 100 - HardModeXPModifier;
	lower_xp = add_xp * modifier / 100;
	return lower_xp;
};

func void B_GivePlayerXP(var int add_xp)
{
	var string concatText;
	if(HardModeEnabled == TRUE)
	{
		add_xp = CalculateLowerXP(add_xp);
	};
	if(hero.level == 0)
	{
		hero.exp_next = XP_PER_LEVEL;
	};
	if(hero.attribute[ATR_HITPOINTS] > 0)
	{
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
			B_LevelUp(1);
		};
	};
	B_CheckLog();
};

func void B_GiveDeathXP(var C_Npc Killer,var C_Npc Victim)
{
	if((Npc_IsPlayer(Killer) || ((Killer.aivar[AIV_PARTYMEMBER] == TRUE) && !Npc_IsPlayer(Victim))) && (Victim.aivar[AIV_VictoryXPGiven] == FALSE) && (Victim.level != 0))
	{
		B_GivePlayerXP(Victim.level * XP_PER_VICTORY);
		Victim.aivar[AIV_VictoryXPGiven] = TRUE;
	};
};

