
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

func int C_MageRobeCheck(var C_Npc oth)
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

func int C_BanditArmorEquipped(var C_Npc oth)
{
	var C_Item armor;
	armor = Npc_GetEquippedArmor(oth);
	if(Npc_HasEquippedArmor(oth))
	{
		if(Hlp_IsItem(armor,ITAR_BDT_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_BDT_H))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_Thorus_Addon))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_OreBaron_Addon))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_Bloodwyn_Addon))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_Diego))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int C_PirateArmorEquipped(var C_Npc oth)
{
	var C_Item armor;
	armor = Npc_GetEquippedArmor(oth);
	if(Npc_HasEquippedArmor(oth))
	{
		if(Hlp_IsItem(armor,ITAR_PIR_M_Addon))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_PIR_L_Addon))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_PIR_H_Addon))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int VisibleHeroGuild()
{
	var C_Item armor;
	armor = Npc_GetEquippedArmor(hero);
	if(Npc_HasEquippedArmor(hero))
	{
		if(Hlp_IsItem(armor,ITAR_NOV_L))
		{
			return GIL_NOV;
		};
		if(Hlp_IsItem(armor,ITAR_KDF_L) || Hlp_IsItem(armor,ITAR_KDF_M) || Hlp_IsItem(armor,ITAR_KDF_H) || Hlp_IsItem(armor,ITAR_KDF_S))
		{
			return GIL_KDF;
		};
		if(Hlp_IsItem(armor,ITAR_MIL_L) || Hlp_IsItem(armor,ITAR_MIL_M))
		{
			return GIL_MIL;
		};
		if(Hlp_IsItem(armor,ITAR_PAL_M) || Hlp_IsItem(armor,ITAR_PALN_M) || Hlp_IsItem(armor,ITAR_PAL_H) || Hlp_IsItem(armor,ITAR_PALN_H) || Hlp_IsItem(armor,ITAR_PAL_S))
		{
			return GIL_PAL;
		};
		if(Hlp_IsItem(armor,ITAR_SLD_L) || Hlp_IsItem(armor,ITAR_SLD_M) || Hlp_IsItem(armor,ITAR_SLD_M2) || Hlp_IsItem(armor,ITAR_SLD_H) || Hlp_IsItem(armor,ITAR_SLD_S))
		{
			return GIL_SLD;
		};
		if(Hlp_IsItem(armor,ITAR_DJG_L) || Hlp_IsItem(armor,ITAR_DJG_M) || Hlp_IsItem(armor,ITAR_DJGN_M) || Hlp_IsItem(armor,ITAR_DJG_H) || Hlp_IsItem(armor,ITAR_DJGN_H))
		{
			return GIL_DJG;
		};
	};
	return GIL_NONE;
};

func void B_SetHeroSkin()
{
	var int BodyTex;
	if(TattoosBodySkin == TRUE)
	{
		BodyTex = BodyTex_Tattoo_N;
	}
	else if((MILArmor_Equipped == TRUE) || (NOVArmor_Equipped == TRUE) || (SLDArmor_Equipped == TRUE) || (BDTArmor_Equipped == TRUE) || (BAUArmor_Equipped == TRUE) || (NakedBodySkin == TRUE))
	{
		BodyTex = BodyTex_N;
	}
	else if(G1BodySkin == TRUE)
	{
		BodyTex = BodyTex_Player_G1;
	}
	else if(SequelBodySkin == TRUE)
	{
		BodyTex = BodyTex_Player_Sequel;
	}
	else
	{
		BodyTex = BodyTex_Player_G2;
	};
	Mdl_SetVisualBody(hero,"hum_body_Naked0",BodyTex,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
};

