
func void B_GiveStuntBonus_FUNC()
{
	if(StuntBonus_Once == FALSE)
	{
		PrintScreen(PRINT_Addon_StuntBonus,-1,45,FONT_Screen,2);
		B_GivePlayerXP(XP_STUNTBONUS);
		StuntBonus_Once = TRUE;
		Snd_Play("THRILLJINGLE_01");
	}
	else
	{
		PrintScreen(PRINT_Addon_ExploitBonus,-1,45,FONT_Screen,2);
		B_GivePlayerXP(XP_EXPLOITBONUS);
		StuntBonus_Once = FALSE;
		Snd_Play("MFX_BELIARWEAP");
	};
	SC_MadeStunt = TRUE;
};

