
func int C_WantToAttackThief(var C_Npc slf,var C_Npc oth)
{
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_STRF) || (slf.guild == GIL_DJG))
	{
		return FALSE;
	};
	if(slf.aivar[AIV_IGNORE_Theft] == TRUE)
	{
		return FALSE;
	};
	if(slf.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		return FALSE;
	};
	if(Npc_IsPlayer(oth) && (slf.npcType == NPCTYPE_FRIEND))
	{
		return FALSE;
	};
	if(C_NpcIsGateGuard(slf))
	{
		return FALSE;
	};
	return TRUE;
};

