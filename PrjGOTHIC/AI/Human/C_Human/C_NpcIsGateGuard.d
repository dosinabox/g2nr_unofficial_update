
func int C_NpcIsGateGuard(var C_Npc slf)
{
	if(Npc_IsInState(slf,ZS_Guard_Passage) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(BridgeBandit)))
	{
		return TRUE;
	};
	return FALSE;
};

