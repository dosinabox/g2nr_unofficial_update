
func int C_AllCanyonRazorDead()
{
	if(AllCanyonRazorDead == TRUE)
	{
		return TRUE;
	}
	else if((GregIsBack == TRUE) && Npc_IsDead(CanyonRazor01) && Npc_IsDead(CanyonRazor02) && Npc_IsDead(CanyonRazor03) && Npc_IsDead(CanyonRazor04) && Npc_IsDead(CanyonRazor05) && Npc_IsDead(CanyonRazor06) && Npc_IsDead(CanyonRazor07) && Npc_IsDead(CanyonRazor08) && Npc_IsDead(CanyonRazor09) && Npc_IsDead(CanyonRazor10))
	{
		AllCanyonRazorDead = TRUE;
		return TRUE;
	};
	return FALSE;
};

func int C_IAmCanyonRazor(var C_Npc slf)
{
	if(C_IsNpc(slf,CanyonRazor01))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,CanyonRazor02))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,CanyonRazor03))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,CanyonRazor04))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,CanyonRazor05))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,CanyonRazor06))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,CanyonRazor07))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,CanyonRazor08))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,CanyonRazor09))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,CanyonRazor10))
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
		AI_PrintScreen(PRINT_AllCanyonRazors,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	};
};

