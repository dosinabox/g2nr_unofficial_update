
func void B_KillNpc(var int npcInstance)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);
	if(Hlp_IsValidNpc(npc))
	{
		if(!Npc_IsDead(npc))
		{
			npc.flags = 0;
			if(npc.guild < GIL_SEPERATOR_HUM)
			{
				B_ClearRuneInv(npc);
				B_ClearFakeItems(npc);
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
			CreateInvItem(npc,ItMi_OldCoin);
			Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
		};
	};
};

func void B_KillAnimal(var int npcInstance)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);
	if(Hlp_IsValidNpc(npc))
	{
		if(!Npc_IsDead(npc))
		{
			Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
		};
	};
};

