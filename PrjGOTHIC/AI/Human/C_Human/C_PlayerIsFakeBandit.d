
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
	if(Npc_HasEquippedArmor(oth) == TRUE)
	{
		itm = Npc_GetEquippedArmor(oth);
		if((Hlp_IsItem(itm,ItAr_BDT_M) == TRUE) || (Hlp_IsItem(itm,ITAR_Thorus_Addon) == TRUE) || (Hlp_IsItem(itm,ItAr_BDT_H) == TRUE))
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
	}
	else
	{
		return FALSE;
	};
};

