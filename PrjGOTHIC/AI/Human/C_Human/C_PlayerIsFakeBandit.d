
func int C_PlayerIsFakeBandit(var C_Npc slf,var C_Npc oth)
{
	if(slf.guild > GIL_SEPERATOR_HUM)
	{
		return FALSE;
	};
	if(slf.aivar[AIV_IgnoresArmor] == TRUE)
	{
		return FALSE;
	};
	if(slf.aivar[AIV_IgnoresFakeGuild] == TRUE)
	{
		return FALSE;
	};
	if(slf.guild == GIL_PIR)
	{
		return FALSE;
	};
	if(slf.guild == GIL_DMT)
	{
		return FALSE;
	};
	if(slf.guild == GIL_BDT)
	{
		if(CurrentLevel == ADDONWORLD_ZEN)
		{
			if((Player_HasTalkedToBanditCamp == TRUE) && !Npc_HasEquippedArmor(oth))
			{
				return TRUE;
			};
		};
	};
	if(C_BanditArmorEquipped(oth))
	{
		return TRUE;
	};
	return FALSE;
};

