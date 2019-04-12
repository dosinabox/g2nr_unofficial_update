
func int C_PlayerHasFakeGuild(var C_Npc slf,var C_Npc oth)
{
	var C_Item itm;
	var int NSC_CommentRangerArmor;
	itm = Npc_GetEquippedArmor(oth);
	NSC_CommentRangerArmor = TRUE;
	if(slf.aivar[AIV_IgnoresArmor] == TRUE)
	{
		return FALSE;
	};
	if(slf.aivar[AIV_IgnoresFakeGuild] == TRUE)
	{
		return FALSE;
	};
	if(C_NpcIsGateGuard(self) == TRUE)
	{
		return FALSE;
	};
	if((slf.guild == GIL_BDT) && C_PlayerIsFakeBandit(slf,oth))
	{
		if(Npc_HasEquippedArmor(oth) == FALSE)
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(Npc_HasEquippedArmor(oth) == FALSE)
	{
		return FALSE;
	}
	else if(slf.guild == oth.guild)
	{
		if(Hlp_IsItem(itm,ITAR_RANGER_Addon) == TRUE)
		{
			if(NSC_CommentRangerArmor == TRUE)
			{
				return TRUE;
			}
			else
			{
				return FALSE;
			};
		};
		if((oth.guild == GIL_NONE) && ((Hlp_IsItem(itm,ITAR_Vlk_L) == TRUE) || (Hlp_IsItem(itm,ITAR_Vlk_M) == TRUE) || (Hlp_IsItem(itm,ITAR_Vlk_H) == TRUE) || (Hlp_IsItem(itm,ITAR_Bau_L) == TRUE) || (Hlp_IsItem(itm,ITAR_Bau_M) == TRUE) || (Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_MIL) && ((Hlp_IsItem(itm,itar_mil_l) == TRUE) || (Hlp_IsItem(itm,itar_mil_m) == TRUE)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_PAL) && ((Hlp_IsItem(itm,itar_pal_m) == TRUE) || (Hlp_IsItem(itm,itar_pal_h) == TRUE)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_SLD) && ((Hlp_IsItem(itm,itar_sld_l) == TRUE) || (Hlp_IsItem(itm,itar_sld_m) == TRUE) || (Hlp_IsItem(itm,itar_sld_h) == TRUE)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_DJG) && ((Hlp_IsItem(itm,itar_sld_l) == TRUE) || (Hlp_IsItem(itm,itar_sld_m) == TRUE) || (Hlp_IsItem(itm,itar_sld_h) == TRUE) || (Hlp_IsItem(itm,itar_djg_l) == TRUE) || (Hlp_IsItem(itm,itar_djg_m) == TRUE) || (Hlp_IsItem(itm,itar_djg_h) == TRUE) || (Hlp_IsItem(itm,ITAR_DJG_Crawler) == TRUE)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_NOV) && (Hlp_IsItem(itm,itar_nov_l) == TRUE))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_KDF) && ((Hlp_IsItem(itm,itar_kdf_l) == TRUE) || (Hlp_IsItem(itm,itar_kdf_h) == TRUE)))
		{
			return FALSE;
		}
		else
		{
			return TRUE;
		};
	}
	else
	{
		return FALSE;
	};
};

