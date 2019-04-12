
func void B_GivePlayerXP(var int add_xp)
{
	var string concatText;
	if(hero.level == 0)
	{
		hero.exp_next = 500;
	};
	hero.exp = hero.exp + add_xp;
	concatText = PRINT_XPGained;
	concatText = ConcatStrings(concatText,IntToString(add_xp));
	PrintScreen(concatText,-1,YPOS_XPGained,FONT_ScreenSmall,2);
	if(hero.exp >= hero.exp_next)
	{
		hero.level = hero.level + 1;
		hero.exp_next = hero.exp_next + ((hero.level + 1) * 500);
		hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + HP_PER_LEVEL;
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + HP_PER_LEVEL;
		hero.lp = hero.lp + LP_PER_LEVEL;
		PrintScreen(PRINT_LevelUp,-1,YPOS_LevelUp,FONT_Screen,2);
		Snd_Play("LevelUp");
	};
	B_CheckLog();
};

