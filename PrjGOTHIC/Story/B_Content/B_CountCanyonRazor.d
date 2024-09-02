
func void B_CountCanyonRazor()
{
	var string CanyonRazorText;
	var string CanyonRazorLeft;
	if(CanyonRazorBodyCount < 10)
	{
		CanyonRazorLeft = IntToString(10 - CanyonRazorBodyCount);
		CanyonRazorText = ConcatStrings(PRINT_Addon_CanyonRazorsLeft,CanyonRazorLeft);
		AI_PrintScreen(CanyonRazorText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	}
	else
	{
		AI_PrintScreen(PRINT_AllCanyonRazors,-1,YPOS_GoldGiven,FONT_ScreenSmall,3);
	};
};

