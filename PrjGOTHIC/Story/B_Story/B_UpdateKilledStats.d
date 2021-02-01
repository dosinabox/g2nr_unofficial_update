
func void B_UpdateKilledStats(var C_Npc slf)
{
	if(slf.guild == GIL_DRACONIAN)
	{
		Stats_Killed_Draconian += 1;
	}
	else if(slf.guild == GIL_DMT)
	{
		Stats_Killed_Dementor += 1;
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_ORCELITE)
	{
		Stats_Killed_OrcElite += 1;
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_ORCCOMMANDER)
	{
		Stats_Killed_OrcCommander += 1;
	};
};

