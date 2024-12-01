
func int C_NpcIsWaterMage(var C_Npc npc)
{
	if(npc.guild == GIL_KDW)
	{
		return TRUE;
	};
	if(C_IsNpc(npc,VLK_439_Vatras))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,KDW_140300_Addon_Myxir_CITY))
	{
		return TRUE;
	};
	return FALSE;
};

