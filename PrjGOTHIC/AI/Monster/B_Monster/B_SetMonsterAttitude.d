
func void B_SetMonsterAttitude(var int fromGuild,var int attitude,var int toGuild)
{
	if(toGuild == GIL_SEPERATOR_HUM)
	{
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_NONE);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_PAL);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_MIL);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_VLK);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_KDF);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_NOV);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_DJG);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_SLD);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_BAU);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_BDT);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_STRF);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_OUT);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_PIR);
		Wld_SetGuildAttitude(fromGuild,attitude,GIL_KDW);
	}
	else if(fromGuild == GIL_SEPERATOR_HUM)
	{
		Wld_SetGuildAttitude(GIL_NONE,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_PAL,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_MIL,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_VLK,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_KDF,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_NOV,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_DJG,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_SLD,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_BAU,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_BDT,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_STRF,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_OUT,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_PIR,attitude,toGuild);
		Wld_SetGuildAttitude(GIL_KDW,attitude,toGuild);
	}
	else
	{
		Wld_SetGuildAttitude(fromGuild,attitude,toGuild);
	};
};

