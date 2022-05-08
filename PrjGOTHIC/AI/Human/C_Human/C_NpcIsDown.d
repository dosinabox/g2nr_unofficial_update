
func int C_NpcIsDown(var C_Npc slf)
{
	if(Npc_IsDead(slf))
	{
		return TRUE;
	};
	if(Npc_IsInState(slf,ZS_Unconscious))
	{
		return TRUE;
	};
	if(Npc_IsInState(slf,ZS_MagicSleep))
	{
		return TRUE;
	};
	return FALSE;
};

