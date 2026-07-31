
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
	var C_Item armor;
	if(Npc_HasEquippedArmor(npc))
	{
		armor = Npc_GetEquippedArmor(npc);
		return armor.ownerGuild;
	};
	return GIL_NONE;
};

func int C_LawArmorEquipped(var C_Npc npc)
{
	var int guild;
	guild = VisibleGuild(npc);
	if(guild == GIL_MIL)
	{
		return TRUE;
	};
	if(guild == GIL_PAL)
	{
		return TRUE;
	};
	if(guild == GIL_NOV)
	{
		return TRUE;
	};
	if(guild == GIL_KDF)
	{
		return TRUE;
	};
	if(guild == GIL_KDW)
	{
		return TRUE;
	};
	if(ArmorEquipped(npc,ITAR_Judge))
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
	var int guild;
	guild = VisibleGuild(npc);
	if(guild == GIL_KDF)
	{
		return TRUE;
	};
	if(guild == GIL_PAL)
	{
		return TRUE;
	};
	if(guild == GIL_DJG)
	{
		return TRUE;
	};
	if(guild == GIL_KDW)
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
	if(ArmorEquipped(npc,ITAR_Judge))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_BanditArmorEquipped(var C_Npc npc)
{
	if(VisibleGuild(npc) == GIL_BDT)
	{
		return TRUE;
	};
	return FALSE;
};

func int C_PirateArmorEquipped(var C_Npc npc)
{
	if(VisibleGuild(npc) == GIL_PIR)
	{
		return TRUE;
	};
	return FALSE;
};

func void B_SetHeroSkin()
{
	var int BodyTex;
	if(C_NpcIsHero(hero))
	{
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
};

