
func int C_IAmCanyonRazor(var C_Npc slf)
{
	if(C_IsNpc(slf,CanyonRazor01))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,CanyonRazor02))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,CanyonRazor03))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,CanyonRazor04))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,CanyonRazor05))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,CanyonRazor06))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,CanyonRazor07))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,CanyonRazor08))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,CanyonRazor09))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,CanyonRazor10))
	{
		return TRUE;
	};
	return FALSE;
};

func void B_CountCanyonRazor()
{
	var string CanyonRazorText;
	var string CanyonRazorLeft;
	CanyonRazorLeft = IntToString(10 - CanyonRazorBodyCount);
	CanyonRazorText = ConcatStrings(PRINT_Addon_CanyonRazorsLeft,CanyonRazorLeft);
	if(CanyonRazorBodyCount < 10)
	{
		AI_PrintScreen(CanyonRazorText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	}
	else
	{
		AI_PrintScreen(PRINT_AllCanyonRazors,-1,YPOS_GoldGiven,FONT_ScreenSmall,3);
	};
};

