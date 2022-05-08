
func int C_NpcIsGateGuard(var C_Npc slf)
{
	if(slf.aivar[AIV_PASSGATE] == TRUE)
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BridgeBandit))
	{
		return FALSE;
	};
	if(Npc_IsInState(slf,ZS_Guard_Passage))
	{
		return TRUE;
	};
	return FALSE;
};

