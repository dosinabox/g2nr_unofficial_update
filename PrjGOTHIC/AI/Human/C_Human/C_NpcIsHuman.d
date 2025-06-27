
func int C_NpcIsHuman(var C_Npc npc)
{
	if(npc.guild < GIL_SEPERATOR_HUM)
	{
		return TRUE;
	};
	return FALSE;
};

