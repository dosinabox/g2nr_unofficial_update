
func int C_PlayerIsFakePirate(var C_Npc slf,var C_Npc oth)
{
	if(slf.aivar[AIV_IgnoresArmor] == TRUE)
	{
		return FALSE;
	};
	if(slf.aivar[AIV_IgnoresFakeGuild] == TRUE)
	{
		return FALSE;
	};
	if(slf.guild == GIL_DMT)
	{
		return FALSE;
	};
	if(slf.guild > GIL_SEPERATOR_HUM)
	{
		return FALSE;
	};
	if(C_PirateArmorEquipped(oth))
	{
		return TRUE;
	};
	return FALSE;
};

