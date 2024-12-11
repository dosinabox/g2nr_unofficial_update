
func int C_NpcIsGateGuard(var C_Npc slf)
{
	if(slf.aivar[AIV_PASSGATE] == TRUE)
	{
		return FALSE;
	};
	if(C_IsNpc(slf,BDT_1020_Bandit_L))
	{
		return FALSE;
	};
	if(Npc_IsInState(slf,ZS_Guard_Passage))
	{
		return TRUE;
	};
	return FALSE;
};

