
func void B_Say_GuildGreetings(var C_Npc slf,var C_Npc oth)
{
	var int random;
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
	if(C_IsNpc(slf,VLK_440_Bartok) && (Bartok_OrkGesagt == TRUE) && (Kapitel < 4))
	{
		B_Say_Overlay(slf,oth,"DIA_Bartok_Angekommen_04_02");
		return;
	};
	/*if(C_IsNpc(slf,STRF_1107_Straefling))
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
		random = Hlp_Random(100);
		if(random <= 80)
		{
			B_Say_Overlay(slf,oth,"$WEATHER");
		};
	};
};

