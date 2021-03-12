
func void B_KillNpc(var int npcInstance)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);
	if(Hlp_IsValidNpc(npc) && !Npc_IsDead(npc))
	{
		npc.flags = 0;
		if(npc.guild < GIL_SEPERATOR_HUM)
		{
			B_ClearRuneInv(npc);
		};
		if((npc.guild == GIL_PAL) && (RandomGoblinBerries == FALSE))
		{
			Npc_RemoveInvItems(npc,ItPl_Dex_Herb_01,Npc_HasItems(npc,ItPl_Dex_Herb_01));
		};
		CreateInvItem(npc,ItMi_OldCoin);
		Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
	};
};

