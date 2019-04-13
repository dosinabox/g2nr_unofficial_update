
func int C_NpcRansacksAlways(var C_Npc slf)
{
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Garwig)) && (Hammer_Taken == TRUE))
	{
		return TRUE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(KDF_501_Serpentes)) && Npc_HasItems(other,Holy_Hammer_MIS) && Npc_KnowsInfo(hero,DIA_Serpentes_SUCCESS))
	{
		return TRUE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Rod)) && Npc_HasItems(other,ItMw_2h_Rod))
	{
		return TRUE;
	};
	return FALSE;
};

