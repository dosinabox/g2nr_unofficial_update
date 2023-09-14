
func void B_Kapitelwechsel(var int neues_Kapitel,var int aktuelles_Level_Zen)
{
	Kapitel = neues_Kapitel;
	if(neues_Kapitel == 1)
	{
		B_InitTalentSystem();
		B_InitAttributeSystem();
		Hero_HackChance = 10;
		Cronos_NW_ItMi_Flask_Count = 5;
		Cronos_NW_ItMi_Sulfur_Count = 2;
		Cronos_NW_ItMi_Pitch_Count = 1;
		Cronos_NW_ItPo_Mana_01_Count = 5;
		Cronos_NW_ItPo_Health_01_Count = 6;
		Cronos_NW_ItSc_Light_Count = 5;
		Cronos_NW_ItSc_Firebolt_Count = 5;
		Cronos_NW_ItSc_Zap_Count = 5;
		Cronos_NW_ItSc_LightHeal_Count = 5;
		Cronos_NW_ItSc_SumGobSkel_Count = 2;
		Cronos_NW_ItSc_Icelance_Count = 5;
		Cronos_NW_ItSc_Whirlwind_Count = 1;
		Bennet_NW_ItMi_Swordraw_Count = 3;
		IceDragonSpell = SPL_InstantFireball;
		FullNPCRemoval = TRUE;
		if(C_WorldIsFixed())
		{
			Wld_InsertItem(ItRu_LightHeal,"FP_ITEM_PASS_02");
			Wld_InsertItem(ItWr_OneHStonePlate1_Addon,"FP_ITEM_NW_BIGMILL_01");
			Wld_InsertItem(ItWr_StrStonePlate1_Addon,"FP_ITEM_NW_BIGMILL_02");
			Wld_InsertItem(ItWr_HitPointStonePlate3_Addon,"FP_ITEM_CASTLEMINE_01");
		}
		else
		{
			Wld_InsertItem(ItMw_Addon_BanditTrader,"FP_STAND_DEMENTOR_02");
			Wld_InsertItem(ItMw_Addon_BanditTrader,"FP_STAND_DEMENTOR_03");
			Wld_InsertItem(ItMw_Addon_BanditTrader,"FP_STAND_DEMENTOR_05");
			Wld_InsertItem(ItMw_Addon_BanditTrader,"FP_STAND_DEMENTOR_07");
			Wld_InsertItem(ItMw_Addon_BanditTrader,"FP_ITEM_GREATPEASANT_FERNANDOSWEAPONS_01");
			Wld_InsertItem(ItMw_Addon_BanditTrader,"FP_ITEM_GREATPEASANT_FERNANDOSWEAPONS_02");
			Wld_InsertItem(ItMw_Addon_BanditTrader,"FP_ITEM_GREATPEASANT_FERNANDOSWEAPONS_03");
			Wld_InsertItem(ItMw_Addon_BanditTrader,"FP_ITEM_GREATPEASANT_FERNANDOSWEAPONS_04");
			Wld_InsertItem(ItMw_Addon_BanditTrader,"FP_ITEM_NW_FARM4_WOOD_LUCIASLETTER");
			Wld_InsertItem(ItMw_Addon_BanditTrader,"FP_ROAM_FARM4_SHEEP_02");
			Wld_InsertItem(ItMw_Addon_BanditTrader,"FP_ROAM_NW_FARM4_WOOD_MONSTER_MORE_02");
			Wld_InsertItem(ItMw_Addon_BanditTrader,"FP_ROAM_NW_FARM4_WOOD_MONSTER_N_17");
			Wld_InsertItem(ItMw_Addon_BanditTrader,"FP_ROAM_NW_FARM3_PATH_11_SMALLRIVER_09");
			Wld_InsertItem(ItMw_Addon_BanditTrader,"FP_ROAM_NW_FARM3_BIGWOOD_02_04");
			Wld_InsertItem(ItMw_Addon_BanditTrader,"FP_ROAM_NW_BIGMILL_FARM3_01");
			Wld_InsertItem(ItMw_Addon_BanditTrader,"FP_ROAM_NW_BIGMILL_FARM3_03_02");
			Wld_InsertItem(ItMw_Addon_BanditTrader,"FP_ROAM_NW_BIGFARM_ALLEE_08_N2");
			Wld_InsertItem(ItMw_Addon_BanditTrader,"FP_ITEM_FOREST_BANDITTRADER_01");
			Wld_InsertItem(ItMw_Addon_BanditTrader,"FP_SMALLTALK_NW_FARM2_TO_TAVERN_08_02");
			Wld_InsertItem(ItWr_OneHStonePlate1_Addon,"FP_ROAM_NW_BIGMILL_FIELD_MONSTER_04_03");
			Wld_InsertItem(ItWr_StrStonePlate1_Addon,"FP_STAND_DEMENTOR_09");
			Wld_InsertItem(ItWr_HitPointStonePlate3_Addon,"FP_STAND_DEMENTOR_KDF_12");
		};
		IntroduceChapter(KapWechsel_1,KapWechsel_1_Text,"chapter1.tga","chapter_01.wav",6000);
	}
	else if(neues_Kapitel == 2)
	{
		if(!Npc_IsDead(Sekob))
		{
			Sekob.flags = 0;
		};
		if(!Npc_IsDead(Bengar))
		{
			Bengar.flags = 0;
		};
		Bennet_NW_ItMi_Swordraw_Count += 3;
		IntroduceChapter(KapWechsel_2,KapWechsel_2_Text,"chapter2.tga","chapter_01.wav",6000);
	}
	else if(neues_Kapitel == 3)
	{
		Bennet_NW_ItMi_Swordraw_Count += 3;
		Bennet_NW_ItMi_Nugget_Count = 1;
	}
	else if(neues_Kapitel == 4)
	{
		Bennet_NW_ItMi_Swordraw_Count += 3;
		Bennet_NW_ItMi_Nugget_Count += 2;
		PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	}
	else if(neues_Kapitel == 5)
	{
		Bennet_NW_ItMi_Swordraw_Count += 3;
		Bennet_NW_ItMi_Nugget_Count += 2;
		PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	}
	else if(neues_Kapitel == 6)
	{
		PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	};
	if(aktuelles_Level_Zen == OLDWORLD_ZEN)
	{
		B_Enter_OldWorld();
	}
	else if(aktuelles_Level_Zen == NEWWORLD_ZEN)
	{
		B_Enter_NewWorld();
	};
	B_CheckLog();
	if(XP_Static == FALSE)
	{
		B_SetAmbientXP();
	};
};

