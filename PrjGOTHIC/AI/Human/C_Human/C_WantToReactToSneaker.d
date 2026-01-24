
func int C_WantToReactToSneaker(var C_Npc slf,var C_Npc oth)
{
	if(slf.guild == GIL_DMT)
	{
		return FALSE;
	};
	if(slf.guild == GIL_STRF)
	{
		return FALSE;
	};
	if(slf.guild == GIL_BDT)
	{
		if(!C_NpcBelongsToBL(slf))
		{
			return FALSE;
		};
	};
	if(slf.npcType == NPCTYPE_FRIEND)
	{
		if(Npc_IsPlayer(oth))
		{
			return FALSE;
		};
	};
	if(Npc_GetAttitude(slf,oth) == ATT_FRIENDLY)
	{
		return FALSE;
	};
	if(C_NpcIsGateGuard(slf))
	{
		return FALSE;
	};
	if(Npc_GetDistToNpc(slf,oth) > 700)
	{
		return FALSE;
	};
	return TRUE;
};

