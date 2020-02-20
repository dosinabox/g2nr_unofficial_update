
func int C_PlayerIsFakeBandit(var C_Npc slf,var C_Npc oth)
{
	var C_Item itm;
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
	if(slf.guild > GIL_SEPERATOR_HUM)
	{
		return FALSE;
	};
	if(Npc_HasEquippedArmor(oth))
	{
		itm = Npc_GetEquippedArmor(oth);
		if(Hlp_IsItem(itm,ITAR_BDT_M) || Hlp_IsItem(itm,ITAR_Thorus_Addon) || Hlp_IsItem(itm,ITAR_BDT_H))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	}
	else if((slf.guild == GIL_BDT) && (CurrentLevel == ADDONWORLD_ZEN) && (Player_HasTalkedToBanditCamp == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

