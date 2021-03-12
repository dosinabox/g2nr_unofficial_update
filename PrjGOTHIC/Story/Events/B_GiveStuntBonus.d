
func void B_GiveStuntBonus_FUNC()
{
	if(MIS_Owen_FindMalcom == LOG_Running)
	{
		if(StuntBonus_Once == FALSE)
		{
			PrintScreen(PRINT_Addon_StuntBonus,-1,45,FONT_Screen,2);
			B_GivePlayerXP(XP_STUNTBONUS);
			Snd_Play("THRILLJINGLE_01");
			StuntBonus_Once = TRUE;
		};
	}
	else if(StuntBonus_Once == FALSE)
	{
		PrintScreen(PRINT_Addon_ExploitBonus,-1,45,FONT_Screen,2);
		B_GivePlayerXP(XP_EXPLOITBONUS);
		Snd_Play("MFX_BELIARWEAP");
	};
};

