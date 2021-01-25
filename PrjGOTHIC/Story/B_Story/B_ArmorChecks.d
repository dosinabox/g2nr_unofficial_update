
func int ArmorEquipped(var C_Npc npc,var int itemInstance)
{
	var C_Item armor;
	if(Npc_HasEquippedArmor(npc))
	{
		armor = Npc_GetEquippedArmor(npc);
		if(Hlp_IsItem(armor,itemInstance))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int VisibleGuild(var C_Npc npc)
{
	if(!Npc_HasEquippedArmor(npc))
	{
		return GIL_NONE;
	};
	if(ArmorEquipped(npc,ITAR_NOV_L))
	{
		return GIL_NOV;
	};
	if(ArmorEquipped(npc,ITAR_KDF_L) || ArmorEquipped(npc,ITAR_KDF_M) || ArmorEquipped(npc,ITAR_KDF_H) || ArmorEquipped(npc,ITAR_KDF_S))
	{
		return GIL_KDF;
	};
	if(ArmorEquipped(npc,ITAR_MIL_L) || ArmorEquipped(npc,ITAR_MIL_M))
	{
		return GIL_MIL;
	};
	if(ArmorEquipped(npc,ITAR_PAL_M) || ArmorEquipped(npc,ITAR_PALN_M) || ArmorEquipped(npc,ITAR_PAL_H) || ArmorEquipped(npc,ITAR_PALN_H) || ArmorEquipped(npc,ITAR_PAL_S))
	{
		return GIL_PAL;
	};
	if(ArmorEquipped(npc,ITAR_SLD_L) || ArmorEquipped(npc,ITAR_SLD_M) || ArmorEquipped(npc,ITAR_SLD_H) || ArmorEquipped(npc,ITAR_SLD_S))
	{
		return GIL_SLD;
	};
	if(ArmorEquipped(npc,ITAR_DJG_L) || ArmorEquipped(npc,ITAR_DJG_M) || ArmorEquipped(npc,ITAR_DJGN_M) || ArmorEquipped(npc,ITAR_DJG_H) || ArmorEquipped(npc,ITAR_DJGN_H))
	{
		return GIL_DJG;
	};
	if(ArmorEquipped(npc,ITAR_Vlk_L) || ArmorEquipped(npc,ITAR_Vlk_M) || ArmorEquipped(npc,ITAR_Vlk_H) || ArmorEquipped(npc,ITAR_Governor) || ArmorEquipped(npc,ITAR_Larius))
	{
		return GIL_VLK;
	};
	if(ArmorEquipped(npc,ITAR_Bau_L) || ArmorEquipped(npc,ITAR_Bau_M) || ArmorEquipped(npc,ITAR_Onar))
	{
		return GIL_BAU;
	};
	if(ArmorEquipped(npc,ITAR_KDW_L_Addon) || ArmorEquipped(npc,ITAR_KDW_H))
	{
		return GIL_KDW;
	};
	return GIL_NONE;
};

func int C_LawArmorEquipped(var C_Npc npc)
{
	if(VisibleGuild(npc) == GIL_MIL)
	{
		return TRUE;
	};
	if(VisibleGuild(npc) == GIL_PAL)
	{
		return TRUE;
	};
	if(VisibleGuild(npc) == GIL_NOV)
	{
		return TRUE;
	};
	if(VisibleGuild(npc) == GIL_KDF)
	{
		return TRUE;
	};
	if(VisibleGuild(npc) == GIL_KDW)
	{
		return TRUE;
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

func void B_BaltramRangerCheck(var C_Npc npc)
{
	if(SC_KnowsBaltramAsRanger == FALSE)
	{
		if(AnyRangerRingEquipped() || ArmorEquipped(npc,ITAR_RANGER_Addon))
		{
			SC_KnowsBaltramAsRanger = TRUE;
		};
	};
};

func int C_ExpensiveArmorEquipped(var C_Npc npc)
{
	if(VisibleGuild(npc) == GIL_KDF)
	{
		return TRUE;
	};
	if(VisibleGuild(npc) == GIL_PAL)
	{
		return TRUE;
	};
	if(VisibleGuild(npc) == GIL_DJG)
	{
		return TRUE;
	};
	if(ArmorEquipped(npc,ITAR_MIL_M))
	{
		return TRUE;
	};
	if(ArmorEquipped(npc,ITAR_SLD_M))
	{
		return TRUE;
	};
	if(ArmorEquipped(npc,ITAR_SLD_H))
	{
		return TRUE;
	};
	if(ArmorEquipped(npc,ITAR_RANGER_Addon))
	{
		return TRUE;
	};
	if(ArmorEquipped(npc,ITAR_Thorus_Addon))
	{
		return TRUE;
	};
	if(ArmorEquipped(npc,ITAR_OreBaron_Addon))
	{
		return TRUE;
	};
	if(ArmorEquipped(npc,ITAR_Governor))
	{
		return TRUE;
	};
	if(ArmorEquipped(npc,ITAR_Larius))
	{
		return TRUE;
	};
	if(ArmorEquipped(npc,ITAR_OHT))
	{
		return TRUE;
	};
	if(VisibleGuild(npc) == GIL_KDW)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_BanditArmorEquipped(var C_Npc npc)
{
	if(ArmorEquipped(npc,ITAR_BDT_M))
	{
		return TRUE;
	};
	if(ArmorEquipped(npc,ITAR_BDT_H))
	{
		return TRUE;
	};
	if(ArmorEquipped(npc,ITAR_Thorus_Addon))
	{
		return TRUE;
	};
	if(ArmorEquipped(npc,ITAR_OreBaron_Addon))
	{
		return TRUE;
	};
	if(ArmorEquipped(npc,ITAR_Bloodwyn_Addon))
	{
		return TRUE;
	};
	if(ArmorEquipped(npc,ITAR_Diego))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_PirateArmorEquipped(var C_Npc npc)
{
	if(ArmorEquipped(npc,ITAR_PIR_M_Addon))
	{
		return TRUE;
	};
	if(ArmorEquipped(npc,ITAR_PIR_L_Addon))
	{
		return TRUE;
	};
	if(ArmorEquipped(npc,ITAR_PIR_H_Addon))
	{
		return TRUE;
	};
	return FALSE;
};

func void B_SetHeroSkin()
{
	var int BodyTex;
	if((MILArmor_Equipped == TRUE) || (NOVArmor_Equipped == TRUE) || (SLDArmor_Equipped == TRUE) || (OpenArmor_Equipped == TRUE) || (NakedBodySkin == TRUE))
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
	else if(TattoosBodySkin == TRUE)
	{
		BodyTex = BodyTex_Tattoo_N;
	}
	else
	{
		BodyTex = BodyTex_Player_G2;
	};
	Mdl_SetVisualBody(hero,"hum_body_Naked0",BodyTex,0,"Hum_Head_Pony",Face_N_Player,0,NO_ARMOR);
};

