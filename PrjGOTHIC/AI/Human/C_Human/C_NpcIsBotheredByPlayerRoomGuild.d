
func int C_NpcIgnoresPlayerMovements(var C_Npc slf)
{
	if(C_IsNpc(slf,KDF_507_Talamon))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,MIL_309_Stadtwache))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,MIL_310_Stadtwache))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,MIL_332_Stadtwache))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,MIL_333_Stadtwache))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,VLK_4104_Waffenknecht))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_NpcIsBotheredByPlayerRoomGuild(var C_Npc slf)
{
	var int portalguild;
	if(C_NpcIgnoresPlayerMovements(slf))
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

