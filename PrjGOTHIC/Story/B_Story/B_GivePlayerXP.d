
func int B_GetCurrentLevelExp(var C_Npc slf)
{
	return (XP_PER_LEVEL / 2) * (slf.level + 1) * slf.level;
};

func int B_GetNextLevelExp(var C_Npc slf)
{
	return B_GetCurrentLevelExp(slf) + (XP_PER_LEVEL * (slf.level + 1));
};

var int LevelUpsDuringTransform;

func void B_LevelUp(var int levels)
{
	hero.level += levels;
	if(PlayerIsTransformed == TRUE)
	{
		LevelUpsDuringTransform += levels;
	};
	hero.exp_next = B_GetNextLevelExp(hero);
	hero.attribute[ATR_HITPOINTS_MAX] += levels * HP_PER_LEVEL;
	hero.attribute[ATR_HITPOINTS] += levels * HP_PER_LEVEL;
	hero.lp += levels * LP_PER_LEVEL;
	PrintScreen(PRINT_LevelUp,-1,YPOS_LevelUp,FONT_Screen,2);
	Snd_Play("LEVELUP");
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

func void B_GiveDeathXP(var C_Npc killer,var C_Npc target)
{
	if((Npc_IsPlayer(killer) || ((killer.aivar[AIV_PARTYMEMBER] == TRUE) && !Npc_IsPlayer(target))) && (target.aivar[AIV_VictoryXPGiven] == FALSE) && (target.level != 0))
	{
		B_GivePlayerXP(target.level * XP_PER_VICTORY);
		target.aivar[AIV_VictoryXPGiven] = TRUE;
		B_UpdateKilledStats(target);
	};
};

