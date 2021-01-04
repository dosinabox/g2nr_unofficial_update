
func int C_NpcIsBotheredByPlayerRoomGuild(var C_Npc slf)
{
	var int portalguild;
	portalguild = Wld_GetPlayerPortalGuild();
	if((portalguild > GIL_NONE) && ((slf.guild == portalguild) || (Wld_GetGuildAttitude(slf.guild,portalguild) == ATT_FRIENDLY)))
	{
		if(!C_IsNpc(slf,KDF_507_Talamon) && !C_IsNpc(slf,MIL_309_Stadtwache) && !C_IsNpc(slf,MIL_310_Stadtwache) && !C_IsNpc(slf,MIL_332_Stadtwache) && !C_IsNpc(slf,MIL_333_Stadtwache))
		{
			return TRUE;
		};
	};
	return FALSE;
};

