
func int C_PlayerHasFakeGuild(var C_Npc slf,var C_Npc oth)
{
	var C_Item itm;
	var int NSC_CommentRangerArmor;
	itm = Npc_GetEquippedArmor(oth);
	NSC_CommentRangerArmor = TRUE;
	if(Hlp_IsItem(itm,ITAR_RANGER_Addon))
	{
		if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lares)) && (Npc_GetDistToWP(slf,"NW_CITY_HABOUR_02_B") < 5000))
		{
			return TRUE;
		};
		if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Vatras)) && (Npc_GetDistToWP(slf,"NW_CITY_MERCHANT_TEMPLE_FRONT") < 5000))
		{
			return TRUE;
		};
		if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Myxir_CITY)) && (Npc_GetDistToWP(slf,"NW_CITY_MERCHANT_TEMPLE_FRONT") < 5000))
		{
			return TRUE;
		};
		if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Martin)) && ((Npc_GetDistToWP(slf,"NW_CITY_PALCAMP_15") < 5000) || (Npc_GetDistToWP(slf,"NW_CITY_HABOUR_TAVERN01_04") < 5000)))
		{
			return TRUE;
		};
	};
	if(slf.aivar[AIV_IgnoresArmor] == TRUE)
	{
		return FALSE;
	};
	if(slf.aivar[AIV_IgnoresFakeGuild] == TRUE)
	{
		return FALSE;
	};
	if(C_NpcIsGateGuard(slf))
	{
		return FALSE;
	};
	if((slf.guild == GIL_BDT) && C_PlayerIsFakeBandit(slf,oth))
	{
		if(!Npc_HasEquippedArmor(oth))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(!Npc_HasEquippedArmor(oth))
	{
		if((slf.guild == GIL_SLD) || (slf.guild == GIL_DJG))
		{
			if((oth.guild == GIL_SLD) || (oth.guild == GIL_DJG))
			{
				return TRUE;
			};
		}
		else if(slf.guild == GIL_PAL)
		{
			if((oth.guild == GIL_MIL) || (oth.guild == GIL_PAL))
			{
				return TRUE;
			};
		}
		else if((slf.guild == GIL_MIL) && (oth.guild == GIL_MIL))
		{
			return TRUE;
		}
		else if(slf.guild == GIL_KDF)
		{
			if((oth.guild == GIL_NOV) || (oth.guild == GIL_KDF))
			{
				return TRUE;
			};
		}
		else if((slf.guild == GIL_NOV) && (oth.guild == GIL_NOV))
		{
			return TRUE;
		};
		return FALSE;
	}
	else if(slf.guild == oth.guild)
	{
		if(Hlp_IsItem(itm,ITAR_RANGER_Addon))
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
		if((oth.guild == GIL_NONE) && (Hlp_IsItem(itm,ITAR_Vlk_L) || Hlp_IsItem(itm,ITAR_Vlk_M) || Hlp_IsItem(itm,ITAR_Vlk_H) || Hlp_IsItem(itm,ITAR_Bau_L) || Hlp_IsItem(itm,ITAR_Bau_M) || Hlp_IsItem(itm,ITAR_Leather_L)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_MIL) && (Hlp_IsItem(itm,ITAR_MIL_L) || Hlp_IsItem(itm,ITAR_MIL_M)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_PAL) && (Hlp_IsItem(itm,ITAR_PAL_M) || Hlp_IsItem(itm,ITAR_PAL_H)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_PAL) && (Hlp_IsItem(itm,ITAR_PALN_M) || Hlp_IsItem(itm,ITAR_PALN_H)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_SLD) && (Hlp_IsItem(itm,ITAR_SLD_L) || Hlp_IsItem(itm,ITAR_SLD_M) || Hlp_IsItem(itm,ITAR_SLD_M2) || Hlp_IsItem(itm,ITAR_SLD_S) || Hlp_IsItem(itm,ITAR_SLD_H)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_DJG) && (Hlp_IsItem(itm,ITAR_SLD_L) || Hlp_IsItem(itm,ITAR_SLD_M) || Hlp_IsItem(itm,ITAR_SLD_M2) || Hlp_IsItem(itm,ITAR_SLD_S) || Hlp_IsItem(itm,ITAR_SLD_H) || Hlp_IsItem(itm,ITAR_DJG_L) || Hlp_IsItem(itm,ITAR_DJG_M) || Hlp_IsItem(itm,ITAR_DJG_H) || Hlp_IsItem(itm,ITAR_DJG_Crawler)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_DJG) && (Hlp_IsItem(itm,ITAR_DJGN_M) || Hlp_IsItem(itm,ITAR_DJGN_H)))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_NOV) && Hlp_IsItem(itm,ITAR_NOV_L))
		{
			return FALSE;
		}
		else if((oth.guild == GIL_KDF) && (Hlp_IsItem(itm,ITAR_KDF_L) || Hlp_IsItem(itm,ITAR_KDF_H)))
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

