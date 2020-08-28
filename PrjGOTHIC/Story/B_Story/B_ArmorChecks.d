
func int C_RedlightUndercoverCheckFailed(var C_Npc oth)
{
	var C_Item armor;
	armor = Npc_GetEquippedArmor(oth);
	if(Npc_HasEquippedArmor(oth))
	{
		if(Hlp_IsItem(armor,ITAR_MIL_L))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_MIL_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_PAL_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_PALN_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_PAL_H))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_PALN_H))
		{
			return TRUE;
		};
	};
	if(Undercover_Failed == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_LawArmorEquipped(var C_Npc oth)
{
	var C_Item armor;
	armor = Npc_GetEquippedArmor(oth);
	if(Npc_HasEquippedArmor(oth))
	{
		if(Hlp_IsItem(armor,ITAR_MIL_L))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_MIL_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_PAL_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_PALN_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_PAL_H))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_PALN_H))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_NOV_L))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_KDF_L))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_KDF_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_KDF_H))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_KDF_S))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int AnyRangerRingEquipped()
{
	if((RangerRingIsLaresRing == TRUE) || (RangerRingIsMyRing == TRUE) || (RangerRingIsLanceRing == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void B_BaltramRangerCheck(var C_Npc oth)
{
	var C_Item armor;
	armor = Npc_GetEquippedArmor(oth);
	if(SC_KnowsBaltramAsRanger == FALSE)
	{
		if(Npc_HasEquippedArmor(oth))
		{
			if(Hlp_IsItem(armor,ITAR_RANGER_Addon))
			{
				SC_KnowsBaltramAsRanger = TRUE;
			};
		};
		if(AnyRangerRingEquipped())
		{
			SC_KnowsBaltramAsRanger = TRUE;
		};
	};
};

func int C_HenryNiceArmorCheck(var C_Npc oth)
{
	var C_Item armor;
	armor = Npc_GetEquippedArmor(oth);
	if(Npc_HasEquippedArmor(oth))
	{
		if(Hlp_IsItem(armor,ITAR_KDF_L))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_KDF_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_KDF_H))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_KDF_S))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_PAL_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_PALN_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_PAL_H))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_PALN_H))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_PAL_S))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_DJG_L))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_DJG_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_DJGN_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_DJG_H))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_DJGN_H))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_RANGER_Addon))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_MIL_L))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_MIL_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_SLD_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_SLD_M2))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_SLD_H))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_OHT))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int C_RobeCheck(var C_Npc oth)
{
	var C_Item armor;
	armor = Npc_GetEquippedArmor(oth);
	if(Npc_HasEquippedArmor(oth))
	{
		if(Hlp_IsItem(armor,ITAR_KDF_L))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_KDF_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_KDF_H))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_KDF_S))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_NOV_L))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int C_MikaPeasantCheck(var C_Npc oth)
{
	var C_Item armor;
	armor = Npc_GetEquippedArmor(oth);
	if(Npc_HasEquippedArmor(oth))
	{
		if(Hlp_IsItem(armor,ITAR_Bau_L))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_Bau_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_Vlk_L))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_Vlk_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_Vlk_H))
		{
			return TRUE;
		};
	}
	else
	{
		return TRUE;
	};
	return FALSE;
};

func int C_MikaMILMCheck(var C_Npc oth)
{
	var C_Item armor;
	armor = Npc_GetEquippedArmor(oth);
	if(Npc_HasEquippedArmor(oth))
	{
		if(Hlp_IsItem(armor,ITAR_MIL_M))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int C_BAUCheck(var C_Npc oth)
{
	var C_Item armor;
	armor = Npc_GetEquippedArmor(oth);
	if(Npc_HasEquippedArmor(oth))
	{
		if(Hlp_IsItem(armor,ITAR_Bau_L))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_Bau_M))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func void B_SetHeroSkin()
{
	if(TattoosBodySkin == TRUE)
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",BodyTex_Tattoo_N,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
	}
	else if((MILArmor_Equipped == TRUE) || (NOVArmor_Equipped == TRUE) || (SLDArmor_Equipped == TRUE) || (BDTArmor_Equipped == TRUE) || (BAUArmor_Equipped == TRUE) || (NakedBodySkin == TRUE))
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
	}
	else if(G1BodySkin == TRUE)
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",BodyTex_Player_G1,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
	}
	else if(SequelBodySkin == TRUE)
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",BodyTex_Player_Sequel,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
	}
	else
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",BodyTex_Player_G2,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
	};
};

