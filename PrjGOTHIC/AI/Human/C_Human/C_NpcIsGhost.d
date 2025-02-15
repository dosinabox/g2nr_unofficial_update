
func int C_NpcIsGhost(var C_Npc npc)
{
	if(C_IsNpc(npc,NONE_ADDON_111_Quarhodron))
	{
		return TRUE;
	};
	if(C_IsNpc(npc,NONE_ADDON_112_Rhademes))
	{
		return TRUE;
	};
	return FALSE;
};

