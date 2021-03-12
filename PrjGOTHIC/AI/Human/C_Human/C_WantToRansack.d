
func int C_WantToRansack(var C_Npc slf)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Andre))
	{
		return FALSE;
	};
	if(C_IsNpc(slf,MIL_304_Torwache))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Torwache_305))
	{
		return FALSE;
	};
	if((slf.npcType == NPCTYPE_FRIEND) && Npc_IsPlayer(other))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Raven))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Serpentes) && Npc_KnowsInfo(hero,DIA_Serpentes_SUCCESS) && Npc_HasItems(other,Holy_Hammer_MIS))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Garwig))
	{
		return TRUE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Myxir_CITY)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Daron)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Vatras)))
	{
		return FALSE;
	};
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_ORC) || (slf.guild == GIL_FRIENDLY_ORC) || (slf.guild == GIL_PAL) || (slf.guild == GIL_KDF) || (slf.guild == GIL_NOV) || (slf.guild == GIL_KDW))
	{
		return FALSE;
	};
	return TRUE;
};

