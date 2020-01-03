
func void B_Check_Version()
{
	if(FIX_VERSION_SAVE < LEAST_SUPPORTED)
	{
		PrintScreen(PRINT_OldSave1,50,50,FONT_ScreenSmall,10);
		PrintScreen(PRINT_OldSave2,50,53,FONT_ScreenSmall,10);
		AI_Wait(hero,10);
	};
};

