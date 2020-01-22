
func void B_KillThievesGuild()
{
	if((Andre_FoundThieves_KilledByMilitia == FALSE) && (Andre_FoundThieves_Reported == TRUE) && (Andre_FoundThieves_Reported_Day <= (Wld_GetDay() - 2)))
	{
		if(!Npc_IsDead(Cassia) || !Npc_IsDead(Jesper) || !Npc_IsDead(Ramirez))
		{
			B_KillNpc(VLK_447_Cassia);
			B_KillNpc(VLK_446_Jesper);
			B_KillNpc(VLK_445_Ramirez);
			if(Npc_HasItems(Cassia,ItMw_Meisterdegen))
			{
				Npc_RemoveInvItem(Cassia,ItMw_Meisterdegen);
				CreateInvItem(Cassia,ItMw_Meisterdegen);
			};
			if(Npc_HasItems(Jesper,ItMw_1h_Sld_Sword))
			{
				Npc_RemoveInvItem(Jesper,ItMw_1h_Sld_Sword);
				CreateInvItem(Jesper,ItMw_1h_Sld_Sword);
			};
			if(Npc_HasItems(Ramirez,ItMw_Meisterdegen))
			{
				Npc_RemoveInvItem(Ramirez,ItMw_Meisterdegen);
				CreateInvItem(Ramirez,ItMw_Meisterdegen);
			};
			Andre_FoundThieves_KilledByMilitia = TRUE;
		};
	};
};

