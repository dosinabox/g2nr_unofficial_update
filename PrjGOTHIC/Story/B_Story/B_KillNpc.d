
func void B_KillNpc(var int npcInstance)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);
	if(C_NpcIsValidAndAlive(npc))
	{
		npc.flags = 0;
		if(C_NpcIsHuman(npc))
		{
			B_ClearRuneInv(npc);
			B_ClearFakeItems(npc);
			B_ClearRandomItems(npc);
		};
		CreateInvItem(npc,ItMi_OldCoin);
		Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
	};
};

func void B_KillAnimal(var int npcInstance)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);
	if(C_NpcIsValidAndAlive(npc))
	{
		Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
	};
};

