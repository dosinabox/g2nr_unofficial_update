
func int C_NpcIsGateGuard(var C_Npc slf)
{
	if(Npc_IsInState(slf,ZS_Guard_Passage))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

