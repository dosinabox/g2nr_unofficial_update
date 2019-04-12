
func int C_WantToReactToSneaker(var C_Npc slf,var C_Npc oth)
{
	if(Npc_GetDistToNpc(slf,oth) > 700)
	{
		return FALSE;
	};
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_STRF) || ((slf.guild == GIL_BDT) && !C_NpcBelongsToBL(slf)))
	{
		return FALSE;
	};
	if((slf.npcType == NPCTYPE_FRIEND) && Npc_IsPlayer(oth))
	{
		return FALSE;
	};
	if(Npc_GetAttitude(slf,oth) == ATT_FRIENDLY)
	{
		return FALSE;
	};
	if(C_NpcIsGateGuard(self))
	{
		return FALSE;
	};
	return TRUE;
};

