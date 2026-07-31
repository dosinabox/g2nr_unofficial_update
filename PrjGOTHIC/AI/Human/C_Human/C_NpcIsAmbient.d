
func int C_NpcIsAmbient(var C_Npc npc)
{
	if(npc.npcType == NPCTYPE_AMBIENT)
	{
		return TRUE;
	};
	if(npc.npcType == NPCTYPE_OCAMBIENT)
	{
		return TRUE;
	};
	if(npc.npcType == NPCTYPE_OWAMBIENT)
	{
		return TRUE;
	};
	if(npc.npcType == NPCTYPE_BL_AMBIENT)
	{
		return TRUE;
	};
	if(npc.npcType == NPCTYPE_TAL_AMBIENT)
	{
		return TRUE;
	};
	return FALSE;
};

