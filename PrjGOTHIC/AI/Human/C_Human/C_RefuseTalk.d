
func int C_RefuseTalk(var C_Npc slf,var C_Npc oth)
{
	if(Npc_RefuseTalk(slf) && C_NpcIsGateGuard(slf) && (slf.aivar[AIV_Guardpassage_Status] == GP_NONE))
	{
		return TRUE;
	};
	if((slf.aivar[AIV_TalkedToPlayer] == FALSE) && (Npc_GetDistToWP(slf,slf.wp) > 500) && (MIL_305_schonmalreingelassen == FALSE))
	{
		if(C_IsNpc(slf,PAL_203_Lothar))
		{
			return TRUE;
		};
	};
	if(C_PlayerHasFakeGuild(slf,oth))
	{
		if(!C_NpcIsImmortal(slf))
		{
			return TRUE;
		};
		if(C_IsNpc(slf,BAU_4300_Addon_Cavalorn))
		{
			return TRUE;
		};
		if(C_IsNpc(slf,VLK_449_Lares))
		{
			return TRUE;
		};
		if(C_IsNpc(slf,VLK_439_Vatras))
		{
			return TRUE;
		};
		if(C_IsNpc(slf,KDW_140300_Addon_Myxir_CITY))
		{
			return TRUE;
		};
	};
	if(!C_NpcIsHuman(oth) && !C_NpcIsOrc(oth))
	{
		return TRUE;
	};
	return FALSE;
};

