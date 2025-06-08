
func int C_NpcIsValidAndAlive(var C_Npc npc)
{
	if(!Hlp_IsValidNpc(npc))
	{
		return FALSE;
	};
	if(Npc_IsDead(npc))
	{
		return FALSE;
	};
	return TRUE;
};

