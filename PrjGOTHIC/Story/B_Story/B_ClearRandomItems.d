
func void B_ClearRandomItems(var C_Npc npc)
{
	if(npc.guild == GIL_PAL)
	{
		if(RandomGoblinBerries == FALSE)
		{
			B_RemoveEveryInvItem(npc,ItPl_Dex_Herb_01);
		};
	}
	else if(npc.guild == GIL_PIR)
	{
		if(RandomPepper == FALSE)
		{
			B_RemoveEveryInvItem(npc,ItFo_Addon_Pfeffer_01);
		};
	};
};

