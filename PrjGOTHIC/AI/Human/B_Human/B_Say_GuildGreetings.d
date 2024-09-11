
func void B_Say_GuildGreetings(var C_Npc slf,var C_Npc oth)
{
	var int zufall;
	if((slf.guild == GIL_MIL) && ((oth.guild == GIL_MIL) || (oth.guild == GIL_PAL)))
	{
		B_Say_Overlay(slf,oth,"$MILGREETINGS");
		return;
	};
	if(slf.guild == GIL_PAL)
	{
		if((oth.guild == GIL_PAL) || (oth.guild == GIL_KDF))
		{
			B_Say_Overlay(slf,oth,"$PALGREETINGS");
		}
		else if(oth.guild == GIL_MIL)
		{
			B_Say_Overlay(slf,oth,"$MILGREETINGS");
		};
		return;
	};
	if((slf.guild == GIL_KDF) && ((oth.guild == GIL_PAL) || (oth.guild == GIL_NOV) || (oth.guild == GIL_KDF)))
	{
		B_Say_Overlay(slf,oth,"$PALGREETINGS");
		return;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Bartok)) && (Bartok_OrkGesagt == TRUE))
	{
		B_Say_Overlay(slf,oth,"DIA_Bartok_Angekommen_04_02");
		return;
	};
	/*if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Koch))
	{
		//не озвучено в русской версии
		B_Say_Overlay(slf,oth,"Hackebeil_01_00");
		return;
	};*/
	if((slf.guild == GIL_KDW) && (CurrentLevel == NEWWORLD_ZEN))
	{
		return;
	};
	if(Wld_IsRaining())
	{
		zufall = Hlp_Random(100);
		if(zufall <= 80)
		{
			B_Say_Overlay(slf,oth,"$WEATHER");
		};
	};
};

