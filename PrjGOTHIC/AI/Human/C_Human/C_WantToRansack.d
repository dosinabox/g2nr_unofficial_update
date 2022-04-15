
func int C_WantToRansack(var C_Npc slf,var C_Npc oth)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(AlligatorJack))
	{
		if(oth.aivar[AIV_MM_REAL_ID] == ID_Swamprat)
		{
			return TRUE;
		};
	};
	if(!C_NpcIsDown(oth)) //не использовать для зверей!
	{
		return FALSE;
	};
	if(Npc_GetDistToNpc(slf,oth) > PERC_DIST_INTERMEDIAT)
	{
		return FALSE;
	};
	if(Npc_IsPlayer(oth))
	{
		if(Npc_HasItems(oth,Holy_Hammer_MIS))
		{
			if(MIS_Golem == LOG_SUCCESS)
			{
				if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Serpentes))
				{
					return TRUE;
				};
			};
			if(Hammer_Taken == TRUE)
			{
				if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Garwig))
				{
					return TRUE;
				};
			};
		};
		if(Npc_HasItems(oth,ItMw_2h_Rod))
		{
			if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Rod))
			{
				return TRUE;
			};
		};
		if(slf.npcType == NPCTYPE_FRIEND)
		{
			return FALSE;
		};
	};
	if(oth.aivar[AIV_RANSACKED] == TRUE)
	{
		return FALSE;
	};
	if(slf.guild == GIL_DMT)
	{
		return FALSE;
	};
	if(slf.guild == GIL_ORC)
	{
		return FALSE;
	};
	if(slf.guild == GIL_FRIENDLY_ORC)
	{
		return FALSE;
	};
	if(slf.guild == GIL_PAL)
	{
		return FALSE;
	};
	if(slf.guild == GIL_KDF)
	{
		return FALSE;
	};
	if(slf.guild == GIL_NOV)
	{
		return FALSE;
	};
	if(slf.guild == GIL_KDW)
	{
		return FALSE;
	};
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
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Raven))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Myxir_CITY))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Daron))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Vatras))
	{
		return FALSE;
	};
	return TRUE;
};

