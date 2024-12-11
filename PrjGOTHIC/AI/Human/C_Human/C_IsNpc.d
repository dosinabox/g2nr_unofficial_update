
func int C_IsNpc(var C_Npc slf,var int npcInstance)
{
	if(Hlp_GetInstanceID(slf) == npcInstance)
	{
		return TRUE;
	};
	return FALSE;
};

