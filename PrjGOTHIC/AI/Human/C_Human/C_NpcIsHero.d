
func int C_NpcIsHero(var C_Npc slf)
{
	if(C_IsNpc(slf,PC_Hero))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_NpcIsLevelinspektor(var C_Npc slf)
{
	if(C_IsNpc(slf,PC_Levelinspektor))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_NpcIsRockefeller(var C_Npc slf)
{
	if(C_IsNpc(slf,PC_Rockefeller))
	{
		return TRUE;
	};
	return FALSE;
};

