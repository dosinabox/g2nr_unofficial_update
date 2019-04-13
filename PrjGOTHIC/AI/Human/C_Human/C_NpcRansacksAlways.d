
func int C_NpcRansacksAlways(var C_Npc slf)
{
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Garwig)) && Npc_HasItems(other,Holy_Hammer_MIS))
	{
		return TRUE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Rod)) && Npc_HasItems(other,ItMw_2h_Rod))
	{
		return TRUE;
	};
	return FALSE;
};

