
func int C_NpcIsSleeping(var C_Npc npc)
{
	if(Npc_IsInState(npc,ZS_Sleep))
	{
		return TRUE;
	};
	if(Npc_IsInState(npc,ZS_MagicSleep))
	{
		return TRUE;
	};
	return FALSE;
};

