
func int C_PlayerIsFakeBandit(var C_Npc slf,var C_Npc oth)
{
	var C_Item itm;
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
	if(Npc_HasEquippedArmor(oth))
	{
		itm = Npc_GetEquippedArmor(oth);
		if(Hlp_IsItem(itm,ITAR_BDT_M) || Hlp_IsItem(itm,ITAR_BDT_H) || Hlp_IsItem(itm,ITAR_Thorus_Addon) || Hlp_IsItem(itm,ITAR_OreBaron_Addon) || Hlp_IsItem(itm,ITAR_Bloodwyn_Addon) || Hlp_IsItem(itm,ITAR_Diego))
		{
			return TRUE;
		};
	};
	return FALSE;
};

