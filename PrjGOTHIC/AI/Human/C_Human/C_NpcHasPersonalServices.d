
func int C_NpcHasPersonalServices(var C_Npc npc)
{
	if(C_IsNpc(npc,BAU_982_Grimbald))
	{
		if(Grimbald_TeachAnimalTrophy == TRUE)
		{
			return TRUE;
		};
	}
	else if(C_IsNpc(npc,BAU_983_Dragomir))
	{
		if(Dragomir_TeachPlayer == TRUE)
		{
			return TRUE;
		};
	}
	else if(C_IsNpc(npc,DJG_711_Godar))
	{
		if(Godar_TeachAnimalTrophy == TRUE)
		{
			return TRUE;
		};
	}
	else if(C_IsNpc(npc,DJG_712_Hokurn))
	{
		if(Hokurn_TeachPlayer == TRUE)
		{
			return TRUE;
		};
	}
	else if(C_IsNpc(npc,PIR_1352_Addon_AlligatorJack))
	{
		if(AlligatorJack_Addon_TeachPlayer == TRUE)
		{
			return TRUE;
		};
	};
	return FALSE;
};

