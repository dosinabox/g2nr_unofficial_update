
func int C_IsTakenItemMyPossession(var C_Npc slf,var C_Npc oth,var C_Item itm)
{
	var int portalguild;
	portalguild = Wld_GetPlayerPortalGuild();
	if(Npc_OwnedByNpc(itm,slf))
	{
		if(Hlp_IsItem(itm,Holy_Hammer_MIS))
		{
			Hammer_Taken = TRUE;
		};
		return TRUE;
	};
	if((itm.flags & ITEM_DROPPED) == ITEM_DROPPED)
	{
		return FALSE;
	};
	if(C_NpcIsBotheredByPlayerRoomGuild(self) || (Wld_GetPlayerPortalGuild() == GIL_PUBLIC))
	{
		return TRUE;
	};
	if(Wld_GetGuildAttitude(slf.guild,itm.ownerGuild) == ATT_FRIENDLY)
	{
		return TRUE;
	};
	return FALSE;
};

