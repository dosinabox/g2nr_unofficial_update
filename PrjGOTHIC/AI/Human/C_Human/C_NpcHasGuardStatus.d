
func int C_NpcHasGuardStatus(var C_Npc slf,var string checkpoint,var int status)
{
	if(slf.aivar[AIV_PASSGATE] == TRUE)
	{
		return FALSE;
	};
	if(!C_NpcIsOnRoutineWP(slf))
	{
		return FALSE;
	};
	if(status > GP_NONE)
	{
		if(Npc_GetDistToWP(hero,checkpoint) >= (hero.aivar[AIV_LastDistToWP] - 50))
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_Guardpassage_Status] == status)
	{
		return TRUE;
	};
	return FALSE;
};

