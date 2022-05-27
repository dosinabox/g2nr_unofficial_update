
func void B_ClearBonusFoodInv(var C_Npc slf)
{
	if(!C_NpcIsHero(slf))
	{
		if(InfiniteApples == FALSE)
		{
			if(slf.aivar[AIV_GetBonusFood] == TRUE)
			{
				B_RemoveEveryInvItem(slf,ItFo_Apple);
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
				B_RemoveEveryInvItem(slf,ItPl_Dex_Herb_01);
			};
		}
		else if(slf.guild == GIL_PIR)
		{
			if(RandomPepper == FALSE)
			{
				B_RemoveEveryInvItem(slf,ItFo_Addon_Pfeffer_01);
			};
		};
	};
};

