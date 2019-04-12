
func int C_WantToAttackSheepKiller(var C_Npc slf,var C_Npc oth)
{
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_STRF) || (slf.guild == GIL_BDT) || (slf.guild == GIL_DJG))
	{
		return FALSE;
	};
	if(slf.aivar[AIV_IGNORE_Sheepkiller] == TRUE)
	{
		return FALSE;
	};
	if(Npc_IsPlayer(oth) && (slf.npcType == NPCTYPE_FRIEND))
	{
		return FALSE;
	};
	if(C_NpcHasAttackReasonToKill(oth))
	{
		return FALSE;
	};
	if((other.guild < GIL_SEPERATOR_HUM) && (other.aivar[AIV_ATTACKREASON] != AR_NONE))
	{
		return FALSE;
	};
	if(C_NpcIsGateGuard(slf))
	{
		return FALSE;
	};
	return TRUE;
};

