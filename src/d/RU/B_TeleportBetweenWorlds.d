var string teleportDestination;

func void B_ChangeLevel_NW()
{
	Npc_ClearAIQueue(self);
	Wld_ChangeLevel("NEWWORLD\NEWWORLD.ZEN",teleportDestination);
};

func void B_ChangeLevel_OW()
{
	Npc_ClearAIQueue(self);
	Wld_ChangeLevel("OLDWORLD\OLDWORLD.ZEN",teleportDestination);
};

func void B_ChangeLevel_ADW()
{
	Npc_ClearAIQueue(self);
	Wld_ChangeLevel("ADDON\ADDONWORLD.ZEN",teleportDestination);
};

func void B_TeleportBetweenWorlds(var int level,var string waypoint)
{
	teleportDestination = waypoint;
	if(level == NEWWORLD_ZEN)
	{
		AI_CallScript("B_ChangeLevel_NW",self,other);
	}
	else if(level == OLDWORLD_ZEN)
	{
		AI_CallScript("B_ChangeLevel_OW",self,other);
	}
	else if(level == ADDONWORLD_ZEN)
	{
		AI_CallScript("B_ChangeLevel_ADW",self,other);
	};
};
