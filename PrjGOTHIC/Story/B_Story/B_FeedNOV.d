
func int C_CanFeedNOV(var C_Npc slf)
{
	if((MIS_GoraxEssen == LOG_Running) && Npc_HasItems(hero,ItFo_Schafswurst) && (slf.aivar[AIV_SchafswurstGiven] == FALSE))
	{
		if(Kapitel == 1)
		{
			return TRUE;
		}
		else if(GuildlessMode == TRUE)
		{
			return TRUE;
		};
	};
	return FALSE;
};


func void B_FeedNOV(var C_Npc slf)
{
	var string NovizeLeft;
	B_GiveInvItems(hero,slf,ItFo_Schafswurst,1);
	B_UseItem(slf,ItFo_Schafswurst);
	slf.aivar[AIV_SchafswurstGiven] = TRUE;
	Wurst_Gegeben += 1;
	if(Wurst_Gegeben >= 13)
	{
		AI_PrintScreen(PRINT_AllNovizen,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	}
	else
	{
		NovizeLeft = IntToString(13 - Wurst_Gegeben);
		AI_PrintScreen(ConcatStrings(PRINT_NovizenLeft,NovizeLeft),-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	};
};

