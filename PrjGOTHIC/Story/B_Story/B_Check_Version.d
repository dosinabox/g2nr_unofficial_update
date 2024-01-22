
func int C_SaveFileIsOutdated()
{
	if(FIX_DATE_DAY_SAVE != FIX_DATE_DAY)
	{
		return TRUE;
	};
	if(FIX_DATE_MONTH_SAVE != FIX_DATE_MONTH)
	{
		return TRUE;
	};
	if(FIX_DATE_YEAR_SAVE != FIX_DATE_YEAR)
	{
		return TRUE;
	};
	return FALSE;
};

func void B_Check_Version()
{
	if(C_SaveFileIsOutdated())
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

