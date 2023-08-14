
func int C_IsUsedMobMyPossession(var C_Npc slf,var C_Npc oth)
{
	if(Npc_IsDetectedMobOwnedByNpc(oth,slf))
	{
		return TRUE;
	};
	if(Wld_GetPlayerPortalGuild() == GIL_PUBLIC)
	{
		return TRUE;
	};
	if(C_NpcIsBotheredByPlayerRoomGuild(slf))
	{
		return TRUE;
	};
	return FALSE;
};

