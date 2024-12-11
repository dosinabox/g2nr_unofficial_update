
func int C_NpcIsFireMage(var C_Npc npc)
{
	if(npc.guild == GIL_KDF)
	{
		return TRUE;
	};
	if(C_IsNpc(npc,KDF_511_Daron))
	{
		return TRUE;
	};
	return FALSE;
};

