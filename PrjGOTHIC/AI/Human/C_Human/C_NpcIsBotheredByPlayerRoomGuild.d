
func int C_NpcIsBotheredByPlayerRoomGuild(var C_Npc slf)
{
	var int portalguild;
	if(C_IsNpc(slf,KDF_507_Talamon))
	{
		return FALSE;
	};
	if(C_IsNpc(slf,MIL_309_Stadtwache))
	{
		return FALSE;
	};
	if(C_IsNpc(slf,MIL_310_Stadtwache))
	{
		return FALSE;
	};
	if(C_IsNpc(slf,MIL_332_Stadtwache))
	{
		return FALSE;
	};
	if(C_IsNpc(slf,MIL_333_Stadtwache))
	{
		return FALSE;
	};
	portalguild = Wld_GetPlayerPortalGuild();
	if(portalguild > GIL_NONE)
	{
		if(slf.guild == portalguild)
		{
			return TRUE;
		};
		if(Wld_GetGuildAttitude(slf.guild,portalguild) == ATT_FRIENDLY)
		{
			return TRUE;
		};
	};
	return FALSE;
};

