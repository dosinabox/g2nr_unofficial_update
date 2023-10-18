
func int C_NpcIsSwimming(var C_Npc npc)
{
	if(C_BodyStateContains(npc,BS_SWIM))
	{
		return TRUE;
	};
	if(C_BodyStateContains(npc,BS_DIVE))
	{
		return TRUE;
	};
	return FALSE;
};

