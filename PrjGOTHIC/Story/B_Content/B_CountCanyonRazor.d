
func int C_AllCanyonRazorDead()
{
	if((GregIsBack == TRUE) && Npc_IsDead(CanyonRazor01) && Npc_IsDead(CanyonRazor02) && Npc_IsDead(CanyonRazor03) && Npc_IsDead(CanyonRazor04) && Npc_IsDead(CanyonRazor05) && Npc_IsDead(CanyonRazor06) && Npc_IsDead(CanyonRazor07) && Npc_IsDead(CanyonRazor08) && Npc_IsDead(CanyonRazor09) && Npc_IsDead(CanyonRazor10))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int C_IAmCanyonRazor(var C_Npc slf)
{
	var C_Npc raz01;
	var C_Npc raz02;
	var C_Npc raz03;
	var C_Npc raz04;
	var C_Npc raz05;
	var C_Npc raz06;
	var C_Npc raz07;
	var C_Npc raz08;
	var C_Npc raz09;
	var C_Npc raz10;
	raz01 = Hlp_GetNpc(CanyonRazor01);
	raz02 = Hlp_GetNpc(CanyonRazor02);
	raz03 = Hlp_GetNpc(CanyonRazor03);
	raz04 = Hlp_GetNpc(CanyonRazor04);
	raz05 = Hlp_GetNpc(CanyonRazor05);
	raz06 = Hlp_GetNpc(CanyonRazor06);
	raz07 = Hlp_GetNpc(CanyonRazor07);
	raz08 = Hlp_GetNpc(CanyonRazor08);
	raz09 = Hlp_GetNpc(CanyonRazor09);
	raz10 = Hlp_GetNpc(CanyonRazor10);
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz01)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz02)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz03)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz04)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz05)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz06)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz07)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz08)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz09)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raz10)))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void B_CountCanyonRazor()
{
	var string CanyonRazorText;
	var string CanyonRazorLeft;
	CanyonRazorLeft = IntToString(10 - CanyonRazorBodyCount);
	CanyonRazorText = ConcatStrings(CanyonRazorLeft,PRINT_Addon_CanyonRazorsLeft);
	AI_PrintScreen(CanyonRazorText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
};

