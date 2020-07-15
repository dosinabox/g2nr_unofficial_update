
func void B_MoveNpcToMorgue(var int npcInstance)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);
	if(Hlp_IsValidNpc(npc) && !Npc_IsDead(npc))
	{
		npc.flags = 0;
		B_ClearRuneInv(npc);
		AI_Teleport(npc,"TOT");
		B_StartOtherRoutine(npc,"TOT");
		Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
		AI_Teleport(npc,"TOT");
	};
};

func void B_RemoveNpc(var int npcInstance)
{
	if(FullNPCRemoval == FALSE)
	{
		B_MoveNpcToMorgue(npcInstance);
	}
	else
	{
		Wld_RemoveNpc(npcInstance);
	};
};

