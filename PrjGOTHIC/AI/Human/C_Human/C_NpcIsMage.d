
func int C_NpcIsMage(var C_Npc npc)
{
	if(C_NpcIsFireMage(npc))
	{
		return TRUE;
	};
	if(C_NpcIsWaterMage(npc))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,NONE_100_Xardas))
	{
		return TRUE;
	};
	return FALSE;
};

