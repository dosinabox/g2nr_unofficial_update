
func void B_ClearBonusFoodInv(var C_Npc slf)
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(her))
	{
		if(InfiniteApples == FALSE)
		{
			if(slf.aivar[AIV_GetBonusFood] == TRUE)
			{
				Npc_RemoveInvItems(slf,ItFo_Apple,Npc_HasItems(slf,ItFo_Apple));
			}
			else
			{
				slf.aivar[AIV_GetBonusFood] = TRUE;
			};
		};
		if(slf.guild == GIL_PAL)
		{
			if(RandomGoblinBerries == FALSE)
			{
				Npc_RemoveInvItems(slf,ItPl_Dex_Herb_01,Npc_HasItems(slf,ItPl_Dex_Herb_01));
			};
		};
		if(slf.guild == GIL_PIR)
		{
			Npc_RemoveInvItems(slf,ItFo_Addon_Pfeffer_01,Npc_HasItems(slf,ItFo_Addon_Pfeffer_01));
		};
	};
};

