
func int C_WantToRansack(var C_Npc slf,var C_Npc oth)
{
	if(C_IsNpc(slf,PIR_1352_Addon_AlligatorJack))
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
				if(C_IsNpc(slf,KDF_501_Serpentes))
				{
					return TRUE;
				};
			};
			if(Hammer_Taken == TRUE)
			{
				if(C_IsNpc(slf,NOV_608_Garwig))
				{
					return TRUE;
				};
			};
		};
		if(Npc_HasItems(oth,ItMw_2h_Rod))
		{
			if(C_IsNpc(slf,SLD_804_Rod))
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
	if(C_IsNpc(slf,BDT_1090_Addon_Raven))
	{
		return FALSE;
	};
	return TRUE;
};

