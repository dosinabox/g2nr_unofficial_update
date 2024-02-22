
func int C_WantToRansack(var C_Npc slf,var C_Npc oth)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(AlligatorJack))
	{
		if(oth.aivar[AIV_MM_REAL_ID] == ID_SWAMPRAT)
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
	if(C_NpcIsMage(slf))
	{
		return FALSE;
	};
	if(C_NpcIsPaladin(slf))
	{
		return FALSE;
	};
	if(slf.guild == GIL_DMT)
	{
		return FALSE;
	};
	if(slf.guild == GIL_NOV)
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Raven))
	{
		return FALSE;
	};
	return TRUE;
};

