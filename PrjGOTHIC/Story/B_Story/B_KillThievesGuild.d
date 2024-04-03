
func void B_KillThievesGuild()
{
	if((Andre_FoundThieves_KilledByMilitia == FALSE) && (Andre_FoundThieves_Reported == TRUE) && C_DaysSinceEvent(Andre_FoundThieves_Reported_Day,2))
	{
		if(!Npc_IsDead(Cassia) || !Npc_IsDead(Jesper) || !Npc_IsDead(Ramirez))
		{
			if(!Npc_IsDead(Cassia))
			{
				B_KillNpc(VLK_447_Cassia);
				if(Npc_HasItems(Cassia,ItMw_Meisterdegen))
				{
					Npc_RemoveInvItem(Cassia,ItMw_Meisterdegen);
					CreateInvItem(Cassia,ItMw_Meisterdegen);
				};
			};
			if(!Npc_IsDead(Jesper))
			{
				B_KillNpc(VLK_446_Jesper);
				if(Npc_HasItems(Jesper,ItMw_1h_Sld_Sword))
				{
					Npc_RemoveInvItem(Jesper,ItMw_1h_Sld_Sword);
					CreateInvItem(Jesper,ItMw_1h_Sld_Sword);
				};
			};
			if(!Npc_IsDead(Ramirez))
			{
				B_KillNpc(VLK_445_Ramirez);
				if(Npc_HasItems(Ramirez,ItMw_Meisterdegen))
				{
					Npc_RemoveInvItem(Ramirez,ItMw_Meisterdegen);
					CreateInvItem(Ramirez,ItMw_Meisterdegen);
				};
			};
			B_StartOtherRoutine(MIL_318_Miliz,"SEWER");
			B_StartOtherRoutine(MIL_327_Miliz,"SEWER");
			B_StartOtherRoutine(MIL_329_Miliz,"SEWER");
			B_StartOtherRoutine(MIL_330_Miliz,"SEWER");
			Andre_FoundThieves_KilledByMilitia = TRUE;
		};
	};
};

func void B_SendMilitiaToHotel()
{
	if(MilitiaSentToHotel == FALSE)
	{
		B_StartOtherRoutine(MIL_315_Kasernenwache,"HOTEL");
		B_StartOtherRoutine(Bote,"BALTRAM");
		MilitiaSentToHotel = TRUE;
	};
};

