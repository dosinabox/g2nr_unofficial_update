
func int C_NpcIsHero(var C_Npc slf)
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(her))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_NpcIsLevelinspektor(var C_Npc slf)
{
	var C_Npc pcl;
	pcl = Hlp_GetNpc(PC_Levelinspektor);
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(pcl))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_NpcIsRockefeller(var C_Npc slf)
{
	var C_Npc rock;
	rock = Hlp_GetNpc(PC_Rockefeller);
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(rock))
	{
		return TRUE;
	};
	return FALSE;
};

