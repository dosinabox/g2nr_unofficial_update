
func int C_NpcIsOrc(var C_Npc npc)
{
	if(npc.guild > GIL_SEPERATOR_ORC)
	{
		return TRUE;
	};
	return FALSE;
};

