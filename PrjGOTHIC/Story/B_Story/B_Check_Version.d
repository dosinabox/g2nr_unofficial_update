
func void B_Check_Version()
{
	if(!Hlp_StrCmp(FIX_DATE_SAVE,FIX_VERSION_DATE))
	{
		B_SyncItemsToSteal();
		if(FIX_VERSION_SAVE < LEAST_SUPPORTED)
		{
			PrintScreen(PRINT_OldSave1,50,50,FONT_ScreenSmall,10);
			PrintScreen(PRINT_OldSave2,50,53,FONT_ScreenSmall,10);
			AI_Wait(hero,10);
		};
	};
};

