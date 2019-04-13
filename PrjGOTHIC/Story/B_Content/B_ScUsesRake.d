

var int rakeplace[50];
const int Greg_FirstSecret = 1;
const int RAKE_BUDDEL_DIST_MAX = 300;
const int RAKE_BUDDEL_DIST_MIN = 200;

func void RakeTreasureSuccess(var C_Item itm)
{
	Wld_PlayEffect("spellFX_ItemAusbuddeln",itm,itm,0,0,0,FALSE);
	B_Say_Overlay(self,self,"$FOUNDTREASURE");
	B_GivePlayerXP(XP_Ambient);
};

func void B_SCUsesRake(var C_Npc slf)
{
};

func void B_SCGetTreasure_S1()
{
	var C_Item GregsArmor;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if((Npc_GetDistToWP(hero,"NW_BIGFARM_LAKE_CAVE_07") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[1] == FALSE))
		{
			Wld_InsertItem(ItSe_GoldPocket25,"NW_BIGFARM_LAKE_CAVE_07");
			RAKEPLACE[1] = TRUE;
			RakeTreasureSuccess(ItSe_GoldPocket25);
			GregsArmor = Npc_GetEquippedArmor(Greg_NW);
			if(Hlp_IsItem(GregsArmor,ITAR_PIR_H_Addon) == FALSE)
			{
				AI_EquipArmor(Greg_NW,ITAR_PIR_H_Addon);
			};
		}
		else if((Npc_GetDistToWP(hero,"NW_LAKE_GREG_TREASURE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[2] == FALSE))
		{
			Wld_InsertItem(ItSe_GoldPocket100,"NW_LAKE_GREG_TREASURE_01");
			RAKEPLACE[2] = TRUE;
			RakeTreasureSuccess(ItSe_GoldPocket100);
		}
		else if((Npc_GetDistToWP(hero,"NW_FARM3_GREGTREASURE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[3] == FALSE))
		{
			Wld_InsertItem(ItMi_GoldCup,"NW_FARM3_GREGTREASURE_01");
			RAKEPLACE[3] = TRUE;
			RakeTreasureSuccess(ItMi_GoldCup);
		}
		else if((Npc_GetDistToWP(hero,"NW_FARM3_MOUNTAINLAKE_MONSTER_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[4] == FALSE))
		{
			Wld_InsertItem(ItMi_SilverChalice,"NW_FARM3_MOUNTAINLAKE_MONSTER_01");
			RAKEPLACE[4] = TRUE;
			RakeTreasureSuccess(ItMi_SilverChalice);
		}
		else if((Npc_GetDistToWP(hero,"NW_BIGMILL_FARM3_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[5] == FALSE))
		{
			Wld_InsertItem(ItAm_Prot_Point_01,"NW_BIGMILL_FARM3_01");
			RAKEPLACE[5] = TRUE;
			RakeTreasureSuccess(ItAm_Prot_Point_01);
		}
		else if((Npc_GetDistToWP(hero,"ADW_ENTRANCE_RAKEPLACE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[12] == FALSE))
		{
			Wld_InsertItem(ItWr_StonePlateCommon_Addon,"ADW_ENTRANCE_RAKEPLACE_01");
			RAKEPLACE[12] = TRUE;
			Wld_InsertItem(ItMi_SilverChalice,"ADW_ENTRANCE_RAKEPLACE_01");
			RakeTreasureSuccess(ItMi_SilverChalice);
		}
		else if((Npc_GetDistToWP(hero,"ADW_ENTRANCE_RAKEPLACE_02") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[13] == FALSE))
		{
			Wld_InsertItem(ItWr_DexStonePlate1_Addon,"ADW_ENTRANCE_RAKEPLACE_02");
			RAKEPLACE[13] = TRUE;
			Wld_InsertItem(ItMi_GoldCup,"ADW_ENTRANCE_RAKEPLACE_02");
			RakeTreasureSuccess(ItMi_GoldCup);
		}
		else if((Npc_GetDistToWP(hero,"ADW_ENTRANCE_RAKEPLACE_03") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[14] == FALSE))
		{
			Wld_InsertItem(ItPo_Perm_Health,"ADW_ENTRANCE_RAKEPLACE_03");
			RAKEPLACE[14] = TRUE;
			Wld_InsertItem(ItSe_GoldPocket100,"ADW_ENTRANCE_RAKEPLACE_03");
			RakeTreasureSuccess(ItSe_GoldPocket100);
		}
		else if((Npc_GetDistToWP(hero,"ADW_ENTRANCE_RAKEPLACE_04") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[15] == FALSE))
		{
			Wld_InsertItem(ItMi_SilverRing,"ADW_ENTRANCE_RAKEPLACE_04");
			RAKEPLACE[15] = TRUE;
			Wld_InsertItem(ItMw_Schwert4,"ADW_ENTRANCE_RAKEPLACE_04");
			RakeTreasureSuccess(ItMw_Schwert4);
		}
		else if((Npc_GetDistToWP(hero,"ADW_VALLEY_GREGTREASURE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[16] == FALSE))
		{
			Wld_InsertItem(ItSe_GoldPocket100,"ADW_VALLEY_GREGTREASURE_01");
			RAKEPLACE[16] = TRUE;
			Wld_InsertItem(ItPo_Health_02,"ADW_VALLEY_GREGTREASURE_01");
			Wld_InsertItem(ItPo_Mana_03,"ADW_VALLEY_GREGTREASURE_01");
			RakeTreasureSuccess(ItPo_Mana_03);
		}
		else if((Npc_GetDistToWP(hero,"ADW_VALLEY_RAKEPLACE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[17] == FALSE))
		{
			Wld_InsertItem(ItPo_Mana_Addon_04,"ADW_VALLEY_RAKEPLACE_01");
			RAKEPLACE[17] = TRUE;
			Wld_InsertItem(ItPo_Speed,"ADW_VALLEY_RAKEPLACE_01");
			Wld_InsertItem(ItPo_Mana_02,"ADW_VALLEY_RAKEPLACE_01");
			RakeTreasureSuccess(ItPo_Mana_02);
		}
		else if((Npc_GetDistToWP(hero,"ADW_VALLEY_RAKEPLACE_02") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[18] == FALSE))
		{
			Wld_InsertItem(ItPo_Health_Addon_04,"ADW_VALLEY_RAKEPLACE_02");
			RAKEPLACE[18] = TRUE;
			Wld_InsertItem(ItWr_StonePlateCommon_Addon,"ADW_VALLEY_RAKEPLACE_02");
			Wld_InsertItem(ItSe_LockpickFisch,"ADW_VALLEY_RAKEPLACE_02");
			RakeTreasureSuccess(ItSe_LockpickFisch);
		}
		else if((Npc_GetDistToWP(hero,"ADW_VALLEY_RAKEPLACE_03") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[19] == FALSE))
		{
			Wld_InsertItem(ItSc_Firerain,"ADW_VALLEY_RAKEPLACE_03");
			RAKEPLACE[19] = TRUE;
			Wld_InsertItem(ItSe_GoldPocket50,"ADW_VALLEY_RAKEPLACE_03");
			Wld_InsertItem(ItWr_StonePlateCommon_Addon,"ADW_VALLEY_RAKEPLACE_03");
			RakeTreasureSuccess(ItSe_GoldPocket50);
		}
		else if((Npc_GetDistToWP(hero,"ADW_BANDITSCAMP_RAKEPLACE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[20] == FALSE))
		{
			Wld_InsertItem(ItMi_Honigtabak,"ADW_BANDITSCAMP_RAKEPLACE_01");
			RAKEPLACE[20] = TRUE;
			Wld_InsertItem(ItWr_StonePlateCommon_Addon,"ADW_BANDITSCAMP_RAKEPLACE_01");
			Wld_InsertItem(ItAm_Addon_MANA,"ADW_BANDITSCAMP_RAKEPLACE_01");
			RakeTreasureSuccess(ItAm_Addon_MANA);
		}
		else if((Npc_GetDistToWP(hero,"ADW_BANDITSCAMP_RAKEPLACE_02") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[21] == FALSE))
		{
			Wld_InsertItem(ItSc_SumGobSkel,"ADW_BANDITSCAMP_RAKEPLACE_02");
			RAKEPLACE[21] = TRUE;
			Wld_InsertItem(ItPo_Mana_03,"ADW_BANDITSCAMP_RAKEPLACE_02");
			RakeTreasureSuccess(ItPo_Mana_03);
		}
		else if((Npc_GetDistToWP(hero,"ADW_BANDITSCAMP_RAKEPLACE_03") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[22] == FALSE))
		{
			Wld_InsertItem(ItSc_TrfShadowbeast,"ADW_BANDITSCAMP_RAKEPLACE_03");
			RAKEPLACE[22] = TRUE;
			Wld_InsertItem(ItSc_LightHeal,"ADW_BANDITSCAMP_RAKEPLACE_03");
			RakeTreasureSuccess(ItSc_LightHeal);
		}
		else if((Npc_GetDistToWP(hero,"ADW_BANDITSCAMP_RAKEPLACE_04") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[23] == FALSE))
		{
			Wld_InsertItem(ItWr_StonePlateCommon_Addon,"ADW_BANDITSCAMP_RAKEPLACE_04");
			RAKEPLACE[23] = TRUE;
			Wld_InsertItem(ItRi_HP_01,"ADW_BANDITSCAMP_RAKEPLACE_04");
			RakeTreasureSuccess(ItRi_HP_01);
		}
		else if((Npc_GetDistToWP(hero,"ADW_CANYON_MINE1_11") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[24] == FALSE))
		{
			Wld_InsertItem(ItSE_Addon_FrancisChest,"ADW_CANYON_MINE1_11");
			RAKEPLACE[24] = TRUE;
			RakeTreasureSuccess(ItSE_Addon_FrancisChest);
		}
		else if((Npc_GetDistToWP(hero,"ADW_CANYON_RAKEPLACE_01") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[25] == FALSE))
		{
			Wld_InsertItem(ItMi_RuneBlank,"ADW_CANYON_RAKEPLACE_01");
			RAKEPLACE[25] = TRUE;
			Wld_InsertItem(ItSe_GoldPocket25,"ADW_CANYON_RAKEPLACE_01");
			RakeTreasureSuccess(ItSe_GoldPocket25);
		}
		else if((Npc_GetDistToWP(hero,"ADW_CANYON_RAKEPLACE_02") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[26] == FALSE))
		{
			Wld_InsertItem(ItMi_Nugget,"ADW_CANYON_RAKEPLACE_02");
			RAKEPLACE[26] = TRUE;
			Wld_InsertItem(ItSc_LightningFlash,"ADW_CANYON_RAKEPLACE_02");
			Wld_InsertItem(ItSc_ChargeFireBall,"ADW_CANYON_RAKEPLACE_02");
			RakeTreasureSuccess(ItSc_ChargeFireBall);
		}
		else if((Npc_GetDistToWP(hero,"ADW_CANYON_RAKEPLACE_03") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[27] == FALSE))
		{
			Wld_InsertItem(ItSe_GoldPocket25,"ADW_CANYON_RAKEPLACE_03");
			RAKEPLACE[27] = TRUE;
			Wld_InsertItem(ItWr_ManaStonePlate1_Addon,"ADW_CANYON_RAKEPLACE_03");
			Wld_InsertItem(ItMi_Pitch,"ADW_CANYON_RAKEPLACE_03");
			RakeTreasureSuccess(ItMi_Pitch);
		}
		else if((Npc_GetDistToWP(hero,"ADW_CANYON_RAKEPLACE_04") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[28] == FALSE))
		{
			Wld_InsertItem(ItMi_SilverRing,"ADW_CANYON_RAKEPLACE_04");
			RAKEPLACE[28] = TRUE;
			Wld_InsertItem(ItMi_Sulfur,"ADW_CANYON_RAKEPLACE_04");
			Wld_InsertItem(ItWr_TwoHStonePlate1_Addon,"ADW_CANYON_RAKEPLACE_04");
			RakeTreasureSuccess(ItWr_TwoHStonePlate1_Addon);
		}
		else if((Npc_GetDistToWP(hero,"ADW_CANYON_RAKEPLACE_05") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[29] == FALSE))
		{
			Wld_InsertItem(ItMi_GoldRing,"ADW_CANYON_RAKEPLACE_05");
			RAKEPLACE[29] = TRUE;
			Wld_InsertItem(ItAt_DragonBlood,"ADW_CANYON_RAKEPLACE_05");
			RakeTreasureSuccess(ItAt_DragonBlood);
		}
		else if((Npc_GetDistToWP(hero,"ADW_PIRATECAMP_GREGTREASURE_KOMPASS") < RAKE_BUDDEL_DIST_MIN) && (RAKEPLACE[30] == FALSE))
		{
			Wld_InsertItem(ItMI_Addon_Kompass_Mis,"ADW_PIRATECAMP_GREGTREASURE_KOMPASS");
			RAKEPLACE[30] = TRUE;
			RakeTreasureSuccess(ItMI_Addon_Kompass_Mis);
		};
	};
};

