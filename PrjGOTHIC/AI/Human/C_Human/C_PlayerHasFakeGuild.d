
func int C_PlayerHasFakeGuild(var C_Npc slf,var C_Npc oth)
{
	var C_Item armor;
	if(Npc_HasEquippedArmor(oth))
	{
		armor = Npc_GetEquippedArmor(oth);
		if(Hlp_IsItem(armor,ITAR_RANGER_Addon) && (CurrentLevel == NEWWORLD_ZEN))
		{
			if(C_IsNpc(slf,VLK_410_Baltram))
			{
				if(Baltram_Exchange4Lares == TRUE)
				{
					if(Npc_GetDistToWP(slf,"NW_CITY_HOTEL_BED_02") < 5000)
					{
						return TRUE;
					};
				};
			}
			else if(C_IsNpc(slf,BAU_4300_Addon_Cavalorn))
			{
				if(Npc_GetDistToWP(slf,"NW_CITY_MERCHANT_PATH_15") < 5000)
				{
					return TRUE;
				};
				if(Npc_GetDistToWP(slf,"NW_CITY_TAVERN_IN_07") < 5000)
				{
					return TRUE;
				};
			}
			else if(C_IsNpc(slf,VLK_449_Lares))
			{
				if(Npc_GetDistToWP(slf,"NW_CITY_HABOUR_02_B") < 5000)
				{
					return TRUE;
				};
			}
			else if(C_IsNpc(slf,VLK_439_Vatras))
			{
				if(VatrasPissedOffForever == FALSE)
				{
					if(Npc_GetDistToWP(slf,"NW_CITY_MERCHANT_TEMPLE_FRONT") < 5000)
					{
						return TRUE;
					};
				};
			}
			else if(C_IsNpc(slf,KDW_140300_Addon_Myxir_CITY))
			{
				if(Npc_GetDistToWP(slf,"NW_CITY_MERCHANT_TEMPLE_FRONT") < 5000)
				{
					return TRUE;
				};
			}
			else if(C_IsNpc(slf,MIL_350_Addon_Martin))
			{
				if(Npc_GetDistToWP(slf,"NW_CITY_PALCAMP_15") < 5000)
				{
					return TRUE;
				};
				if(Npc_GetDistToWP(slf,"NW_CITY_HABOUR_TAVERN01_04") < 5000)
				{
					return TRUE;
				};
			}
			else if(C_IsNpc(slf,SLD_805_Cord))
			{
				if(Npc_GetDistToWP(slf,"NW_BIGFARM_HOUSE_15") < 1000)
				{
					return TRUE;
				};
			};
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
	if(slf.guild == GIL_DMT)
	{
		return FALSE;
	};
	if(C_NpcIsGateGuard(slf))
	{
		return FALSE;
	};
	if(!Npc_HasEquippedArmor(oth))
	{
		if(slf.guild == GIL_BDT)
		{
			if(C_PlayerIsFakeBandit(slf,oth))
			{
				return TRUE;
			};
		}
		else if((slf.guild == GIL_SLD) || (slf.guild == GIL_DJG))
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
		else if(slf.guild == GIL_MIL)
		{
			if(oth.guild == GIL_MIL)
			{
				return TRUE;
			};
		}
		else if((slf.guild == GIL_NOV) || C_IsNpc(slf,NOV_602_Ulf))
		{
			if(oth.guild == GIL_NOV)
			{
				return TRUE;
			};
		}
		else if(C_NpcIsFireMage(slf))
		{
			if((oth.guild == GIL_NOV) || (oth.guild == GIL_KDF))
			{
				return TRUE;
			};
		};
		return FALSE;
	}
	else if(slf.guild == oth.guild)
	{
		if(oth.guild == GIL_NONE)
		{
			if(Hlp_IsItem(armor,ITAR_VLK_L) || Hlp_IsItem(armor,ITAR_VLK_M) || Hlp_IsItem(armor,ITAR_VLK_H) || Hlp_IsItem(armor,ITAR_BAU_L) || Hlp_IsItem(armor,ITAR_BAU_M) || Hlp_IsItem(armor,ITAR_Leather_L))
			{
				return FALSE;
			};
			if(Hlp_IsItem(armor,ITAR_DJG_Crawler) || Hlp_IsItem(armor,ITAR_OHT) || Hlp_IsItem(armor,ITAR_DHT) || Hlp_IsItem(armor,ITAR_RANGER_Addon))
			{
				return FALSE;
			};
		}
		else if(oth.guild == GIL_MIL)
		{
			if(Hlp_IsItem(armor,ITAR_MIL_L) || Hlp_IsItem(armor,ITAR_MIL_M))
			{
				return FALSE;
			};
		}
		else if(oth.guild == GIL_PAL)
		{
			if(Hlp_IsItem(armor,ITAR_PAL_M) || Hlp_IsItem(armor,ITAR_PAL_H))
			{
				return FALSE;
			};
			if(Hlp_IsItem(armor,ITAR_PALN_M) || Hlp_IsItem(armor,ITAR_PALN_H))
			{
				return FALSE;
			};
			if(Hlp_IsItem(armor,ITAR_PAL_S))
			{
				return FALSE;
			};
		}
		else if(oth.guild == GIL_SLD)
		{
			if(Hlp_IsItem(armor,ITAR_SLD_L) || Hlp_IsItem(armor,ITAR_SLD_M) || Hlp_IsItem(armor,ITAR_SLD_S) || Hlp_IsItem(armor,ITAR_SLD_H))
			{
				return FALSE;
			};
		}
		else if(oth.guild == GIL_DJG)
		{
			if(Hlp_IsItem(armor,ITAR_SLD_L) || Hlp_IsItem(armor,ITAR_SLD_M) || Hlp_IsItem(armor,ITAR_SLD_S) || Hlp_IsItem(armor,ITAR_SLD_H) || Hlp_IsItem(armor,ITAR_DJG_L) || Hlp_IsItem(armor,ITAR_DJG_M) || Hlp_IsItem(armor,ITAR_DJG_H) || Hlp_IsItem(armor,ITAR_DJG_Crawler))
			{
				return FALSE;
			};
			if(Hlp_IsItem(armor,ITAR_DJGN_M) || Hlp_IsItem(armor,ITAR_DJGN_H))
			{
				return FALSE;
			};
		}
		else if(oth.guild == GIL_NOV)
		{
			if(Hlp_IsItem(armor,ITAR_NOV_L))
			{
				return FALSE;
			};
		}
		else if(oth.guild == GIL_KDF)
		{
			if(Hlp_IsItem(armor,ITAR_KDF_L) || Hlp_IsItem(armor,ITAR_KDF_M) || Hlp_IsItem(armor,ITAR_KDF_H) || Hlp_IsItem(armor,ITAR_KDF_S))
			{
				return FALSE;
			};
		};
		return TRUE;
	}
	else if((slf.guild == GIL_KDF) && (oth.guild == GIL_NOV))
	{
		if(!Hlp_IsItem(armor,ITAR_NOV_L))
		{
			return TRUE;
		};
	}
	else if(C_IsNpc(slf,NOV_602_Ulf))
	{
		if((oth.guild == GIL_NOV) && !Hlp_IsItem(armor,ITAR_NOV_L))
		{
			return TRUE;
		};
	}
	else if(C_IsNpc(slf,KDF_511_Daron))
	{
		if((oth.guild == GIL_KDF) && !Hlp_IsItem(armor,ITAR_KDF_L) && !Hlp_IsItem(armor,ITAR_KDF_M) && !Hlp_IsItem(armor,ITAR_KDF_H) && !Hlp_IsItem(armor,ITAR_KDF_S))
		{
			return TRUE;
		};
		if((oth.guild == GIL_NOV) && !Hlp_IsItem(armor,ITAR_NOV_L))
		{
			return TRUE;
		};
	};
	return FALSE;
};

