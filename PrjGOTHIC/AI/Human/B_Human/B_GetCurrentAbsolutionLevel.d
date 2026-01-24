
func int B_GetCurrentAbsolutionLevel(var C_Npc slf)
{
	if(CurrentLevel == OLDWORLD_ZEN)
	{
		if(C_NpcBelongsToOldCamp(slf))
		{
			return ABSOLUTIONLEVEL_OldCamp;
		};
	}
	else if(CurrentLevel == NEWWORLD_ZEN)
	{
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
	};
	return 0;
};

