
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
		B_ClearRandomItems(slf);
	};
};

