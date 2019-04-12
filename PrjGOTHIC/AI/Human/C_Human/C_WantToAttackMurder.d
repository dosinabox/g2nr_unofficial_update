
func int C_WantToAttackMurder(var C_Npc slf,var C_Npc oth)
{
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_STRF) || (slf.guild == GIL_DJG) || (slf.guild == GIL_BDT))
	{
		return FALSE;
	};
	if(slf.aivar[AIV_IGNORE_Murder] == TRUE)
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
	if(C_NpcIsGateGuard(slf))
	{
		return FALSE;
	};
	return TRUE;
};

