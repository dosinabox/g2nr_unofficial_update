
func int C_NpcIsBotheredByPlayerRoomGuild(var C_Npc slf)
{
	var int portalguild;
	portalguild = Wld_GetPlayerPortalGuild();
	if((portalguild > GIL_NONE) && ((slf.guild == portalguild) || (Wld_GetGuildAttitude(slf.guild,portalguild) == ATT_FRIENDLY)))
	{
		if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(KDF_507_Talamon))
		{
			return TRUE;
		};
		if((Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(MIL_309_Stadtwache)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Stadtwache_310)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(MIL_332_Stadtwache)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Stadtwache_333)))
		{
			return TRUE;
		};
	};
	return FALSE;
};

