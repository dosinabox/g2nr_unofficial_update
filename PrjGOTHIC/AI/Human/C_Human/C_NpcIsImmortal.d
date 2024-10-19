
func int C_NpcIsImmortal(var C_Npc npc)
{
	if(npc.flags & NPC_FLAG_IMMORTAL)
	{
		return TRUE;
	};
	return FALSE;
};

