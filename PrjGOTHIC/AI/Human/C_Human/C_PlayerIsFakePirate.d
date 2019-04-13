
func int C_PlayerIsFakePirate(var C_Npc slf,var C_Npc oth)
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
	if(Npc_HasEquippedArmor(oth))
	{
		itm = Npc_GetEquippedArmor(oth);
		if(Hlp_IsItem(itm,ITAR_PIR_L_Addon) || Hlp_IsItem(itm,ITAR_PIR_M_Addon) || Hlp_IsItem(itm,ITAR_PIR_H_Addon))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	}
	else
	{
		return FALSE;
	};
};

