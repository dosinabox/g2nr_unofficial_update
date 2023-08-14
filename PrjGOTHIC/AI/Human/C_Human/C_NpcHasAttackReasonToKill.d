
func int C_NpcHasAttackReasonToKill(var C_Npc slf)
{
	if(slf.aivar[AIV_ATTACKREASON] == AR_KILL)
	{
		return TRUE;
	};
	if(slf.aivar[AIV_ATTACKREASON] == AR_GuildEnemy)
	{
		return TRUE;
	};
	if(slf.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)
	{
		return TRUE;
	};
	if(slf.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder)
	{
		return TRUE;
	};
	if(slf.aivar[AIV_ATTACKREASON] == AR_GuardCalledToKill)
	{
		return TRUE;
	};
	return FALSE;
};

