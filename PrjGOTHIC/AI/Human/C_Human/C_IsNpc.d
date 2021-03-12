
func int C_IsNpc(var C_Npc slf,var int npcInstance)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(npc))
	{
		return TRUE;
	};
	return FALSE;
};

