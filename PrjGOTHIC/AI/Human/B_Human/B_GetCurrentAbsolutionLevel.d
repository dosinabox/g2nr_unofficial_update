
func int B_GetCurrentAbsolutionLevel(var C_Npc slf)
{
	if(C_NpcBelongsToOldCamp(slf))
	{
		return ABSOLUTIONLEVEL_OldCamp;
	};
	if(C_NpcBelongsToCity(slf))
	{
		return ABSOLUTIONLEVEL_City;
	};
	if(C_NpcBelongsToMonastery(slf))
	{
		return ABSOLUTIONLEVEL_Monastery;
	};
	if(C_NpcBelongsToFarm(slf))
	{
		return ABSOLUTIONLEVEL_Farm;
	};
	if(C_NpcBelongsToBL(slf))
	{
		return ABSOLUTIONLEVEL_BL;
	};
	return 0;
};

