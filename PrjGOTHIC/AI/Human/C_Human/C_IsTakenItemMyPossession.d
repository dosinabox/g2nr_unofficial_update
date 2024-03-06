
func int C_IsTakenItemMyPossession(var C_Npc slf,var C_Item itm)
{
	if(Npc_OwnedByNpc(itm,slf))
	{
		if(Hlp_IsItem(itm,Holy_Hammer_MIS))
		{
			Hammer_Taken = TRUE;
		};
		return TRUE;
	};
	if(itm.flags & ITEM_DROPPED)
	{
		return FALSE;
	};
	if(Wld_GetPlayerPortalGuild() == GIL_PUBLIC)
	{
		return TRUE;
	};
	if(C_NpcIsBotheredByPlayerRoomGuild(slf))
	{
		return TRUE;
	};
	if(Wld_GetGuildAttitude(slf.guild,itm.ownerGuild) == ATT_FRIENDLY)
	{
		return TRUE;
	};
	return FALSE;
};

