
func void B_Say_GuildGreetings(var C_Npc slf,var C_Npc oth)
{
	var int zufall;
	if((slf.guild == GIL_MIL) && ((oth.guild == GIL_MIL) || (oth.guild == GIL_PAL)))
	{
		B_Say_Overlay(slf,oth,"$MILGREETINGS");
		return;
	};
	if((slf.guild == GIL_PAL) && ((oth.guild == GIL_PAL) || (oth.guild == GIL_MIL) || (oth.guild == GIL_KDF)))
	{
		B_Say_Overlay(slf,oth,"$PALGREETINGS");
		return;
	};
	if((slf.guild == GIL_KDF) && ((oth.guild == GIL_PAL) || (oth.guild == GIL_NOV) || (oth.guild == GIL_KDF)))
	{
		B_Say_Overlay(slf,oth,"$PALGREETINGS");
		return;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Bartok)) && (Bartok_OrkGesagt == TRUE))
	{
		B_Bartok_ShitAnOrc();
		return;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Koch))
	{
		B_Koch_Hackebeil();
		return;
	};
	zufall = Hlp_Random(100);
	if((zufall <= 10) && Wld_IsRaining())
	{
		B_Say_Overlay(slf,oth,"$WEATHER");
		return;
	};
};

