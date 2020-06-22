
func void B_ENTER_NEWWORLD_Kapitel_1()
{
	if((RavenIsDead == TRUE) && (MyxirMovedToNW == FALSE))
	{
		Wld_InsertNpc(KDW_140300_Addon_Myxir_CITY,"CITY1");
		MyxirMovedToNW = TRUE;
	};
	if(ENTERED_ADDONWORLD == TRUE)
	{
		B_RemoveNpc(KDW_1400_Addon_Saturas_NW);
		B_RemoveNpc(KDW_1401_Addon_Cronos_NW);
		B_RemoveNpc(KDW_1402_Addon_Nefarius_NW);
		B_RemoveNpc(KDW_1403_Addon_Myxir_NW);
		B_RemoveNpc(KDW_1404_Addon_Riordian_NW);
		B_RemoveNpc(KDW_1405_Addon_Merdarion_NW);
		B_RemoveNpc(PIR_1301_Addon_Skip_NW);
		if(SC_GotPortalTempelWalkthroughKey == FALSE)
		{
			Wld_InsertNpc(Stoneguardian_MerdarionsSchluessel,"NW_TROLLAREA_PORTALTEMPEL_22");
			SC_GotPortalTempelWalkthroughKey = TRUE;
		};
	};
	if((Sklaven_Flucht == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		if(Patrick_DiedInADW == FALSE)
		{
			Wld_InsertNpc(STRF_1123_Addon_Patrick_NW,"NW_BIGFARM_PATRICK");
		};
		if(Monty_DiedInADW == FALSE)
		{
			Wld_InsertNpc(STRF_1124_Addon_Monty_NW,"NW_CITY_HABOUR_WERFT_IN_01");
		};
		if(Tonak_DiedInADW == FALSE)
		{
			Wld_InsertNpc(STRF_1125_Addon_Tonak_NW,"NW_FARM2_FIELD_TANOK");
		};
		if(Telbor_DiedInADW == FALSE)
		{
			Wld_InsertNpc(STRF_1126_Addon_Telbor_NW,"NW_FARM2_FIELD_TELBOR");
		};
		if(Pardos_DiedInADW == FALSE)
		{
			Wld_InsertNpc(STRF_1127_Addon_Pardos_NW,"NW_FARM3_BENGAR");
		};
		MissingPeopleReturnedHome = TRUE;
	};
};


var int EnterNW_Kapitel2;

func void B_ENTER_NEWWORLD_Kapitel_2()
{
	if(GregIsBack == TRUE)
	{
		B_RemoveNpc(PIR_1300_Addon_Greg_NW);
	};
	if(EnterNW_Kapitel2 == FALSE)
	{
		Wld_InsertNpc(Gobbo_Skeleton,"FP_ROAM_MEDIUMFOREST_KAP2_24");
		Wld_InsertNpc(Skeleton,"FP_ROAM_MEDIUMFOREST_KAP2_22");
		Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_MEDIUMFOREST_KAP2_23");
		Wld_InsertNpc(Wolf,"FP_ROAM_MEDIUMFOREST_KAP2_25");
		Wld_InsertNpc(Wolf,"FP_ROAM_MEDIUMFOREST_KAP2_26");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_CITY_TO_FOREST_50");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_CITY_TO_FOREST_49");
		Wld_InsertNpc(Wolf,"NW_CITY_TO_FOREST_10");
		Wld_InsertNpc(Wolf,"NW_CITY_TO_FOREST_05");
		Wld_InsertNpc(Sheep,"NW_FARM3_MOUNTAINLAKE_05");
		Wld_InsertNpc(Sheep,"NW_FARM3_MOUNTAINLAKE_05");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_05");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_05");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_06");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_04");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_04");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_11");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_11");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_11");
		Wld_InsertNpc(Lurker,"NW_TROLLAREA_PATH_72");
		Wld_InsertNpc(Lurker,"NW_TROLLAREA_PATH_72");
		Wld_InsertNpc(Lurker,"NW_TROLLAREA_PATH_75");
		Wld_InsertNpc(Waran,"NW_TROLLAREA_PATH_22_MONSTER");
		Wld_InsertNpc(Waran,"NW_TROLLAREA_PATH_22_MONSTER");
		Wld_InsertNpc(Molerat,"NW_FOREST_PATH_62_02");
		Wld_InsertNpc(Molerat,"NW_FOREST_PATH_62_02");
		Wld_InsertNpc(Molerat,"FP_ROAM_CITY_TO_FOREST_41");
		Wld_InsertNpc(Scavenger,"NW_FOREST_CONNECT_MONSTER2");
		Wld_InsertNpc(Scavenger,"NW_FOREST_CONNECT_MONSTER2");
		Wld_InsertNpc(Wolf,"NW_SHRINE_MONSTER");
		Wld_InsertNpc(Wolf,"NW_SHRINE_MONSTER");
		Wld_InsertNpc(Giant_Bug,"NW_PATH_TO_MONASTER_AREA_01");
		Wld_InsertNpc(Giant_Bug,"NW_PATH_TO_MONASTER_AREA_01");
		Wld_InsertNpc(Scavenger,"NW_PATH_TO_MONASTER_AREA_11");
		Wld_InsertNpc(Scavenger,"NW_PATH_TO_MONASTER_MONSTER22");
		Wld_InsertNpc(Giant_Bug,"NW_FARM1_CITYWALL_RIGHT_02");
		Wld_InsertNpc(Wolf,"NW_FARM1_PATH_CITY_10_B");
		Wld_InsertNpc(Wolf,"NW_FARM1_PATH_CITY_SHEEP_04");
		Wld_InsertNpc(Giant_Bug,"NW_FARM1_PATH_SPAWN_07");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_CITY_TO_FOREST_34");
		Wld_InsertNpc(Bloodfly,"FP_ROAM_CITY_TO_FOREST_36");
		Wld_InsertNpc(Scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
		Wld_InsertNpc(Scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
		Wld_InsertNpc(Lurker,"NW_BIGFARM_LAKE_MONSTER_02_01");
		Wld_InsertNpc(Gobbo_Black,"NW_BIGFARM_LAKE_03_MOVEMENT");
		Wld_InsertNpc(Gobbo_Black,"NW_BIGFARM_LAKE_03_MOVEMENT");
		Wld_InsertNpc(Gobbo_Black,"NW_TAVERNE_TROLLAREA_MONSTER_05_01");
		Wld_InsertNpc(Gobbo_Green,"NW_BIGFARM_LAKE_MONSTER_05_01");
		Wld_InsertNpc(Gobbo_Green,"NW_BIGFARM_LAKE_MONSTER_05_01");
		Wld_InsertNpc(Gobbo_Green,"NW_BIGFARM_LAKE_MONSTER_05_01");
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			Wld_InsertItem(ItAm_Dex_01,"FP_ROAM_XARDAS_SECRET_26");
		}
		else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			Wld_InsertItem(ItAm_Hp_01,"FP_ROAM_XARDAS_SECRET_26");
		}
		else
		{
			Wld_InsertItem(ItAm_Hp_Mana_01,"FP_ROAM_XARDAS_SECRET_26");
		};
/*		if(hero.guild == GIL_KDF))
		{
			B_StartOtherRoutine(Agon,"StillAlive");
		};
		if(!Npc_IsDead(Ambusher_1013))
		{
			B_StartOtherRoutine(Ambusher_1013,"AWAY");
		}; */
		if(!Npc_IsDead(Lobart))
		{
			Lobart.aivar[AIV_IGNORE_Theft] = FALSE;
		};
		if((MIS_HelpDyrian != LOG_SUCCESS) && !Npc_IsDead(Dyrian))
		{
			Dyrian.guild = GIL_NONE;
			Npc_SetTrueGuild(Dyrian,GIL_NONE);
			Dyrian.aivar[AIV_CommentedPlayerCrime] = FALSE;
			B_StartOtherRoutine(Dyrian,"NOFAVOUR");
		};
		if(Npc_IsDead(Hanna))
		{
			B_SendMilitiaToHotel();
		};
		B_KillThievesGuild();
		B_ResetSergio();
		EnterNW_Kapitel2 = TRUE;
	};
};


var int EnterNW_Kapitel3;

func void B_ENTER_NEWWORLD_Kapitel_3()
{
	if(EnterNW_Kapitel3 == FALSE)
	{
		if(!Npc_IsDead(Salandril))
		{
			Salandril.aivar[AIV_ToughGuy] = TRUE;
		};
		Cornelius.flags = 0;
		if(!Npc_HasItems(Cornelius,ItWr_CorneliusTagebuch_Mis))
		{
			CreateInvItems(Cornelius,ItWr_CorneliusTagebuch_Mis,1);
		};
		if(!Npc_IsDead(Hodges))
		{
			B_StartOtherRoutine(Hodges,"BENNETWEG");
		};
		if(!Npc_IsDead(Lares) && (RangerMeetingRunning != LOG_Running))
		{
			if(LaresGuide_ZuOnar != LOG_SUCCESS)
			{
				LaresGuide_ZuOnar = FALSE;
			};
			if(LaresGuide_ZumPortal != 8)
			{
				LaresGuide_ZumPortal = 0;
			};
			if(LaresGuide_OrnamentForest != 3)
			{
				LaresGuide_OrnamentForest = 0;
			};
			B_StartOtherRoutine(Lares,"START");
		};
		Wld_InsertNpc(PC_Fighter_NW_vor_DJG,"BIGFARM");
		Wld_InsertNpc(PC_Thief_NW,"NW_CITY_ENTRANCE_01");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"NW_PASS_GATE_02");
		B_KillNpc(PAL_297_Ritter);
		B_KillNpc(PAL_298_Ritter);
		Wld_InsertNpc(Giant_Bug,"FP_ROAM_MEDIUMFOREST_KAP2_01");
		Wld_InsertNpc(Giant_Bug,"FP_ROAM_MEDIUMFOREST_KAP2_02");
		Wld_InsertNpc(Giant_Bug,"FP_ROAM_MEDIUMFOREST_KAP2_05");
		if(!Npc_IsDead(Sekob))
		{
			B_StartOtherRoutine(Sekob,"FleeDMT");
			B_StartOtherRoutine(Rosi,"FleeDMT");
			B_StartOtherRoutine(Till,"FleeDMT");
			if(BalthasarMovedToBengar == FALSE)
			{
				B_StartOtherRoutine(Balthasar,"FleeDMT");
			};
			B_StartOtherRoutine(Rega,"FleeDMT");
			B_StartOtherRoutine(Babera,"FleeDMT");
			B_StartOtherRoutine(SekobsBauer1,"FleeDMT");
			B_StartOtherRoutine(SekobsBauer2,"FleeDMT");
			if(MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
			{
				B_StartOtherRoutine(Bronko,"FleeDMT_Field");
			}
			else
			{
				B_StartOtherRoutine(Bronko,"FleeDMT_Road");
			};
			Wld_InsertNpc(DMT_DementorAmbientSekob1,"NW_FARM4_IN_06");
			Wld_InsertNpc(DMT_DementorAmbientSekob2,"NW_FARM4_IN_02");
			Wld_InsertNpc(DMT_DementorAmbientSekob3,"NW_FARM4_IN_03");
			Wld_InsertNpc(DMT_DementorAmbientSekob4,"NW_FARM4_IN_04");
			Sekob.flags = NPC_FLAG_IMMORTAL;
		};
		B_StartOtherRoutine(Lester,"WAITFORPLAYER");
		B_NpcSetJailed(Bennet);
		B_StartOtherRoutine(Bennet,"PRISON");
		B_StartOtherRoutine(Sergio,"WAIT");
		B_StartOtherRoutine(Vanja,"ALONE");
		if(!Npc_IsDead(Peck))
		{
			B_StartOtherRoutine(Peck,"STORAGE");
			Peck.aivar[AIV_IgnoresFakeGuild] = FALSE;
			Peck.aivar[AIV_ToughGuy] = FALSE;
			Peck.aivar[AIV_ToughGuyNewsOverride] = FALSE;
			Peck.aivar[AIV_IGNORE_Murder] = FALSE;
			Peck.aivar[AIV_IGNORE_Theft] = FALSE;
			Peck.aivar[AIV_IGNORE_Sheepkiller] = FALSE;
		};
		B_RemoveNpc(PAL_203_Lothar);
		Wld_InsertNpc(Giant_Bug,"NW_FARM4_WOOD_MONSTER_N_1_MONSTER");
		Wld_InsertNpc(Giant_Bug,"NW_FARM4_WOOD_MONSTER_N_1_MONSTER");
		Wld_InsertNpc(Bloodfly,"NW_TROLLAREA_RIVERSIDE_09");
		Wld_InsertNpc(Bloodfly,"NW_TROLLAREA_RIVERSIDE_09");
		Wld_InsertNpc(Giant_Bug,"NW_TAVERNE_TROLLAREA_MONSTER_05_01M1");
		Wld_InsertNpc(Giant_Bug,"NW_TAVERNE_TROLLAREA_MONSTER_05_01M1");
		Wld_InsertNpc(Lurker,"NW_TROLLAREA_RIVERSIDE_05");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_05");
		Wld_InsertNpc(Scavenger,"NW_TROLLAREA_PLANE_06");
		Wld_InsertNpc(Snapper,"NW_TROLLAREA_RUINS_36");
		Wld_InsertNpc(Snapper,"NW_TROLLAREA_RUINS_36");
		Wld_InsertNpc(Wolf,"NW_PATH_TO_MONASTER_AREA_10");
		Wld_InsertNpc(Warg,"NW_XARDAS_GOBBO_01");
		Wld_InsertNpc(Warg,"NW_XARDAS_GOBBO_01");
		if(!Npc_IsDead(Ambusher_1013) && (Bdt_1013_ToCavalorn == TRUE))
		{
			B_KillNpc(Ambusher_1013);
		};
		Wld_InsertNpc(Zombie02,"NW_FARM4_WOOD_MONSTER_MORE_02");
		Wld_InsertNpc(Zombie01,"NW_FARM4_WOOD_MONSTER_MORE_02");
		Wld_InsertNpc(Zombie02,"NW_BIGFARM_LAKE_03_MOVEMENT5");
		Wld_InsertNpc(Skeleton,"NW_FARM4_WOOD_MONSTER_MORE_01");
		Wld_InsertNpc(Skeleton,"NW_FARM4_WOOD_MONSTER_MORE_01");
		Wld_InsertNpc(Giant_Bug,"NW_FARM4_WOOD_MONSTER_N_1_MONSTER");
		Wld_InsertNpc(Giant_Bug,"NW_FARM4_WOOD_MONSTER_N_3");
		Wld_InsertNpc(Shadowbeast,"NW_FARM4_WOOD_MONSTER_05");
		Wld_InsertNpc(DragonSnapper,"NW_FARM4_WOOD_MONSTER_05");
		Wld_InsertNpc(DragonSnapper,"NW_FARM4_WOOD_MONSTER_05");
		Wld_InsertNpc(DragonSnapper,"NW_CASTLEMINE_TROLL_02");
		Wld_InsertNpc(DragonSnapper,"NW_CASTLEMINE_TROLL_02");
		Wld_InsertNpc(DragonSnapper,"NW_FARM3_PATH_11_SMALLRIVER_10");
		Wld_InsertNpc(DragonSnapper,"NW_FARM3_PATH_11_SMALLRIVER_10");
		Wld_InsertNpc(DragonSnapper,"NW_FARM3_MOUNTAINLAKE_03");
		Wld_InsertNpc(DragonSnapper,"NW_FARM3_BIGWOOD_03_C");
		Wld_InsertNpc(DragonSnapper,"NW_FARM3_BIGWOOD_03_C");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"NW_CITY_TO_FARM2_03");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_NW_BIGFARM_FELDREUBER11");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_02");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_03");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_04");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_05");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_06");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_ROAM_CITY_TO_FOREST_01");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_ROAM_CITY_TO_FOREST_15");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_07");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_08");
//		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_09");
		Wld_InsertNpc(DMT_DementorAmbientMalak,"FP_STAND_DEMENTOR_09");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_10");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_11");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_12");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_13");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_14");
//		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_15"); точка 15 не существует, замена на неиспользуемую 01
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_01");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_16");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_17");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_18");
		Wld_InsertNpc(DMT_DementorAmbientWalker11,"CITY1");
		Wld_InsertNpc(DMT_DementorAmbientWalker9,"CITY1");
		Wld_InsertNpc(DMT_DementorAmbientWalker6,"CITY1");
		Wld_InsertNpc(DMT_DementorAmbientWalker3,"CITY1");
		Wld_InsertNpc(DMT_DementorAmbientWalker1,"CITY1");
		Wld_InsertNpc(BDT_1025_Bandit_H,"NW_FOREST_CAVE1_02");
		Wld_InsertNpc(BDT_1026_Bandit_H,"NW_FOREST_CAVE1_03");
		Wld_InsertNpc(BDT_1027_Bandit_H,"NW_FOREST_CAVE1_04");
		Wld_InsertNpc(Follow_Sheep_AKIL,"NW_FOREST_CAVE1_IN_02");
		if(!Npc_IsDead(Fester))
		{
			B_StartOtherRoutine(Fester,"CH3");
			if(MIS_Fester_KillBugs == LOG_Running)
			{
				MIS_Fester_KillBugs = LOG_FAILED;
			};
		};
		if(!Npc_IsDead(Malak))
		{
			B_StartOtherRoutine(Malak,"FleeFromPass");
			Malak_isAlive_Kap3 = TRUE;
			B_StartOtherRoutine(BAU_962_Bauer,"FleeFromPass");
			B_StartOtherRoutine(BAU_964_Bauer,"FleeFromPass");
			B_StartOtherRoutine(BAU_965_Bauer,"FleeFromPass");
			B_StartOtherRoutine(BAU_966_Bauer,"FleeFromPass");
			B_StartOtherRoutine(BAU_967_Bauer,"FleeFromPass");
			B_StartOtherRoutine(BAU_968_Bauer,"FleeFromPass");
			B_StartOtherRoutine(BAU_969_Bauer,"FleeFromPass");
			if(hero.guild == GIL_KDF)
			{
				CreateInvItems(Malak,ITWR_DementorObsessionBook_MIS,1);
			};
		};
		if(!Npc_IsDead(Hilda) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
		{
			B_StartOtherRoutine(Hilda,"KRANK");
		};
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			Wld_InsertItem(ItMw_MalethsGehstock_MIS,"FP_ITEM_FARM1_01");
			Wld_InsertNpc(Shadowbeast,"NW_LITTLESTONEHENDGE");
			Wld_InsertNpc(BDT_1024_MalethsBandit,"NW_FARM1_BANDITS_CAVE_08");
			Wld_InsertNpc(BDT_1004_Bandit_M,"NW_FARM1_BANDITS_CAVE_02");
			Wld_InsertNpc(BDT_1006_Bandit_H,"FP_STAND_DEMENTOR_KDF_29");
			Wld_InsertNpc(BDT_1007_Bandit_H,"FP_STAND_DEMENTOR_KDF_30");
			Wld_InsertNpc(BDT_1008_Bandit_H,"NW_FARM1_BANDITS_CAVE_03");
			Wld_InsertNpc(BDT_1016_Bandit_M,"NW_FARM1_BANDITS_CAVE_04");
		};
		if(hero.guild == GIL_KDF)
		{
			Wld_InsertItem(ItMi_KarrasBlessedStone_Mis,"FP_ITEM_FARM1_03");
			Wld_InsertItem(ItMi_KarrasBlessedStone_Mis,"FP_NW_ITEM_TROLL_10");
			/*if(!Npc_IsDead(Ulf))
			{
				B_KillNpc(Ulf);
			};*/
			if(!Npc_IsDead(Vino))
			{
				B_StartOtherRoutine(Vino,"OBESESSIONRITUAL");
				Vino.aivar[AIV_NoFightParker] = TRUE;
				CreateInvItems(Vino,ITWR_DementorObsessionBook_MIS,1);
				Vino_isAlive_Kap3 = TRUE;
				if(!Npc_IsDead(Lobart))
				{
					B_StartOtherRoutine(Lobart,"OBESESSIONRITUAL");
				};
				Wld_InsertNpc(DMT_DementorSpeakerVino1,"FP_STAND_DEMENTOR_KDF_31");
				Wld_InsertNpc(DMT_DementorSpeakerVino2,"FP_STAND_DEMENTOR_KDF_32");
				Wld_InsertNpc(DMT_DementorSpeakerVino3,"FP_STAND_DEMENTOR_KDF_33");
				Wld_InsertNpc(DMT_DementorSpeakerVino4,"NW_LITTLESTONEHENDGE_02");
				B_KillNpc(YGiant_Bug_VinoRitual1);
				B_KillNpc(YGiant_Bug_VinoRitual2);
			};
			if(!Npc_IsDead(Bromor))
			{
				CreateInvItems(Bromor,ITWR_DementorObsessionBook_MIS,1);
			};
			if(!Npc_IsDead(Fernando))
			{
				CreateInvItems(Fernando,ITWR_DementorObsessionBook_MIS,1);
			};
		};
		if(!Npc_IsDead(Canthar))
		{
			if((MIS_Canthars_KomproBrief != LOG_SUCCESS) && (MIS_Canthars_KomproBrief != FALSE) && (Canthar_Pay == FALSE))
			{
				if(SarahWeaponsRemoved == FALSE)
				{
					B_GiveTradeInv_Sarah(Sarah);
					B_RemoveSarahWeapons();
				};
				B_RemoveNpc(VLK_470_Sarah);
				B_NpcSetReleased(Canthar);
				Canthar.aivar[AIV_IGNORE_Murder] = FALSE;
				Canthar.aivar[AIV_IGNORE_Theft] = FALSE;
				Canthar.aivar[AIV_IGNORE_Sheepkiller] = FALSE;
				B_StartOtherRoutine(Canthar,"MARKTSTAND");
				AI_Teleport(Canthar,"NW_CITY_SARAH");
				Canthar_Sperre = TRUE;
			};
			if((Canthar.aivar[AIV_LastFightComment] == FALSE) && (Canthar.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
			{
				Canthar_Sperre = TRUE;
			};
		};
		if(!Npc_IsDead(Ehnim))
		{
			CreateInvItems(Ehnim,ItMi_Moleratlubric_MIS,1);
		};
		ShrineIsObsessed_NW_TROLLAREA_PATH_37 = TRUE;
		ShrineIsObsessed_NW_FARM1_CONNECT_XARDAS = TRUE;
		ShrineIsObsessed_NW_TROLLAREA_PATH_66 = TRUE;
		ShrineIsObsessed_NW_TROLLAREA_PATH_04 = TRUE;
		ShrineIsObsessed_SAGITTA = TRUE;
		ShrineIsObsessed_NW_BIGMILL_MALAKSVERSTECK_02 = TRUE;
		ShrineIsObsessed_NW_FARM3_BIGWOOD_02 = TRUE;
		Wld_InsertNpc(PC_Mage_NW,"NW_MONASTERY_ARMCHAIR_05");
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			IntroduceChapter(KapWechsel_3,KapWechsel_3_Text,"chapter3_MIL.tga","chapter_01.wav",6000);
		}
		else if(hero.guild == GIL_KDF)
		{
			IntroduceChapter(KapWechsel_3,KapWechsel_3_Text,"chapter3_KDF.tga","chapter_01.wav",6000);
		}
		else
		{
			IntroduceChapter(KapWechsel_3,KapWechsel_3_Text,"chapter3_SLD.tga","chapter_01.wav",6000);
		};
		if(MIS_Torlof_BengarMilizKlatschen == FALSE)
		{
			Wld_InsertNpc(MIL_335_Rumbold,"CITY2");
			Wld_InsertNpc(MIL_336_Rick,"CITY2");
			RumboldReturnedToCity = TRUE;
			RickReturnedToCity = TRUE;
			B_InitNpcGlobals();
		};
		if(!Npc_IsDead(Rick))
		{
			Rick.guild = GIL_MIL;
			Npc_SetTrueGuild(Rick,GIL_MIL);
			Rick.aivar[AIV_DropDeadAndKill] = FALSE;
			Npc_ExchangeRoutine(Rick,"Ch3");
			RickReturnedToCity = TRUE;
		};
		if(!Npc_IsDead(Rumbold))
		{
			Rumbold.guild = GIL_MIL;
			Npc_SetTrueGuild(Rumbold,GIL_MIL);
			Rumbold.aivar[AIV_DropDeadAndKill] = FALSE;
			Npc_ExchangeRoutine(Rumbold,"Ch3");
			RumboldReturnedToCity = TRUE;
		};
		if(!Npc_IsDead(Bengar))
		{
			Npc_ExchangeRoutine(Bengar,"Start");
		};
		if(Npc_IsDead(Hanna))
		{
			B_SendMilitiaToHotel();
		};
		B_KillThievesGuild();
		B_ResetSergio();
		EnterNW_Kapitel3 = TRUE;
	};
};


var int EnterNW_Kapitel4;

func void B_ENTER_NEWWORLD_Kapitel_4()
{
	if(EnterNW_Kapitel4 == FALSE)
	{
		if(!Npc_IsDead(Salandril) && (MIS_Serpentes_BringSalandril_SLD == LOG_SUCCESS))
		{
			B_StartOtherRoutine(Salandril,"Start");
		};
		B_StartOtherRoutine(Jorgen,"Kloster");
		B_StartOtherRoutine(Nov610,"Rest");
		if(!Npc_IsDead(BDT_1050_Landstreicher))
		{
			B_KillNpc(BDT_1050_Landstreicher);
		};
		Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_ITEM_XARDAS_01");
		Wld_InsertNpc(Draconian,"FP_ROAM_XARDASCAVE_DJG_01");
		Wld_InsertNpc(Draconian,"FP_ROAM_XARDASCAVE_DJG_02");
		Wld_InsertNpc(Draconian,"FP_ROAM_XARDASCAVE_DJG_03");
		Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_CAVE_12");
		Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_CAVE_10");
		Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_CAVE_09");
		Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_TOWER_VALLEY_03");
		Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_TOWER_VALLEY_01");
		Wld_InsertNpc(OrcElite_AntiPaladin,"NW_TROLLAREA_PLANE_05");
		Wld_InsertNpc(OrcWarrior_Roam,"NW_TROLLAREA_PATH_44");
		Wld_InsertNpc(OrcWarrior_Roam,"NW_TROLLAREA_PLANE_06");
		Wld_InsertNpc(DragonSnapper,"NW_FARM3_BIGWOOD_04");
		Wld_InsertNpc(DragonSnapper,"NW_FARM3_BIGWOOD_04");
		Wld_InsertNpc(Maya_Troll,"NW_TROLLAREA_RUINS_41");
		if(!Npc_IsDead(Hilda) && (MIS_HealHilda == LOG_SUCCESS))
		{
			B_StartOtherRoutine(Hilda,"START");
		};
		if(hero.guild == GIL_PAL)
		{
			Wld_InsertNpc(OrcElite_AntiPaladin1,"NW_FARM3_PATH_BRIDGE");
//			Wld_InsertNpc(OrcElite_AntiPaladin2,"XARDAS");
			Wld_InsertNpc(OrcElite_AntiPaladin2,"NW_XARDAS_TOWER_PATH_01_B");
			Wld_InsertNpc(OrcElite_AntiPaladin3,"NW_CITY_TO_FOREST_11");
			Wld_InsertNpc(OrcElite_AntiPaladin,"NW_FARM3_PATH_12_MONSTER_03");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_FARM3_PATH_12_MONSTER_03");
			Wld_InsertNpc(OrcElite_AntiPaladin,"NW_FARM3_PATH_10");
			Wld_InsertNpc(OrcElite_AntiPaladin,"NW_BIGFARM_LAKE_06");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_BIGFARM_LAKE_MONSTER_01_04");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_NW_BIGFARM_LAKE_MONSTER_01_02");
			Wld_InsertNpc(OrcElite_AntiPaladin,"NW_TAVERNE_TROLLAREA_08");
			Wld_InsertNpc(OrcElite_AntiPaladin,"FP_ROAM_TAVERNE_TROLLAREA_03_02");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_TAVERNE_TROLLAREA_03_01");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_TAVERNE_TROLLAREA_03_03");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_TAVERNE_TROLLAREA_03_04");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_TAVERNE_TROLLAREA_03_05");
			Wld_InsertNpc(OrcElite_AntiPaladin,"NW_TROLLAREA_PATH_62");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_TROLLAREA_PATH_62");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_TROLLAREA_RIVERSIDE_07");
			Wld_InsertNpc(OrcElite_AntiPaladin,"NW_TROLLAREA_RITUAL_01");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_TROLLAREA_RITUAL_02");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_TROLLAREA_RITUAL_03");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_TROLLAREA_RITUAL_04");
			Wld_InsertNpc(OrcElite_AntiPaladin,"NW_FOREST_PATH_32");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_FARM2_TO_TAVERN_10");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_FARM3_PATH_12_MONSTER_01");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_FARM3_PATH_12_MONSTER_02");
			Wld_InsertNpc(OrcElite_AntiPaladin,"FP_ROAM_XARDAS_GOBBO_01");
			Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_XARDAS_GOBBO_02");
			Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_XARDAS_GOBBO_03");
			Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_FARM1_GOBBO_02");
			Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_FARM1_GOBBO_03");
			Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_FARM1_GOBBO_04");
			Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_FARM1_WOLF_01");
			Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_FARM1_WOLF_02");
			Wld_InsertNpc(OrcWarrior_Rest,"FP_ROAM_FARM1_WOLF_03");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_CITY_TO_FOREST_39");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_CITY_TO_FOREST_42");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_CITY_TO_FOREST_41");
			Wld_InsertNpc(OrcElite_AntiPaladin,"NW_FARM1_PATH_CITY_13");
			Wld_InsertNpc(OrcElite_AntiPaladin,"NW_BIGFARM_FARM4_PATH_04");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_PICK_NW_FARM4_FIELD_01");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_PICK_NW_FARM4_FIELD_04");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_PICK_NW_FARM4_FIELD_05");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_PICK_NW_FARM4_FIELD_02");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_PICK_NW_FARM4_FIELD_06");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_FARM4_BRONKO");
			Wld_InsertNpc(OrcElite_AntiPaladin,"NW_PATH_TO_MONASTERY_06");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PATH_TO_MONASTER_AREA_03");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PATH_TO_MONASTERY_05");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PATH_TO_MONASTER_AREA_09");
			Wld_InsertNpc(OrcWarrior_Roam,"NW_PATH_TO_MONASTER_AREA_05");
			Wld_InsertNpc(OrcElite_AntiPaladin,"BIGCROSS");
			Wld_InsertNpc(OrcElite_AntiPaladin,"NW_FARM2_TO_TAVERN_05");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_CAMPFIRE_CITY_TO_FOREST_43");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_CAMPFIRE_CITY_TO_FOREST_46");
			Wld_InsertNpc(OrcWarrior_Roam,"FP_CAMPFIRE_CITY_TO_FOREST_44");
			Wld_InsertNpc(OrkElite_AntiPaladinOrkOberst,"NW_FARM1_BANDITS_CAVE_08");
			Wld_InsertNpc(OrcElite_AntiPaladin,"FP_STAND_DEMENTOR_KDF_29");
			Wld_InsertNpc(OrcElite_AntiPaladin,"FP_STAND_DEMENTOR_KDF_30");
			Wld_InsertNpc(OrcElite_AntiPaladin,"NW_FARM1_BANDITS_CAVE_03");
			Wld_InsertNpc(OrcElite_AntiPaladin,"NW_FARM1_BANDITS_CAVE_07");
		};
		if((hero.guild == GIL_DJG) || (hero.guild == GIL_PAL))
		{
			Wld_InsertNpc(OrcWarrior_Lobart1,"NW_FARM1_PATH_CITY_SHEEP_04");
			Wld_InsertNpc(OrcWarrior_Lobart2,"NW_FARM1_PATH_CITY_SHEEP_04");
			Wld_InsertNpc(OrcWarrior_Lobart3,"NW_FARM1_PATH_CITY_SHEEP_04");
			Wld_InsertNpc(OrcWarrior_Lobart4,"NW_FARM1_PATH_CITY_SHEEP_01");
			Wld_InsertNpc(OrcWarrior_Lobart5,"NW_FARM1_PATH_CITY_SHEEP_01");
			Wld_InsertNpc(OrcWarrior_Lobart6,"NW_FARM1_PATH_CITY_SHEEP_01");
			B_StartOtherRoutine(Vino,"BugsThere");
			B_StartOtherRoutine(LobartsBauer1,"BugsThere");
			B_StartOtherRoutine(LobartsBauer2,"BugsThere");
		};
		if((hero.guild == GIL_KDF) || (hero.guild == GIL_DJG))
		{
			ShrineIsObsessed_NW_TROLLAREA_PATH_37 = FALSE;
			ShrineIsObsessed_NW_FARM1_CONNECT_XARDAS = FALSE;
			ShrineIsObsessed_NW_TROLLAREA_PATH_66 = FALSE;
			ShrineIsObsessed_NW_TROLLAREA_PATH_04 = FALSE;
			ShrineIsObsessed_SAGITTA = FALSE;
			ShrineIsObsessed_NW_BIGMILL_MALAKSVERSTECK_02 = FALSE;
			ShrineIsObsessed_NW_FARM3_BIGWOOD_02 = FALSE;
		};
		if(hero.guild == GIL_DJG)
		{
			Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_NW_ITEM_RIVERSIDE_EGG");
			Wld_InsertNpc(Draconian,"FP_ROAM_TROLLAREA_06");
			Wld_InsertNpc(Draconian,"NW_TROLLAREA_RIVERSIDE_05");
			Wld_InsertNpc(Draconian,"NW_TROLLAREA_RIVERSIDE_04");
			Wld_InsertNpc(Draconian,"FP_ROAM_TROLLAREA_07");
			Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_NW_ITEM_MAGECAVE_EGG");
			Wld_InsertNpc(Draconian,"FP_ROAM_MAGECAVE_16");
			Wld_InsertNpc(Draconian,"FP_ROAM_MAGECAVE_19");
			Wld_InsertNpc(Draconian,"FP_ROAM_MAGECAVE_19");
			Wld_InsertNpc(Draconian,"FP_ROAM_MAGECAVE_19");
			Wld_InsertNpc(Draconian,"FP_ROAM_MAGECAVE_01");
			Wld_InsertNpc(Draconian,"FP_ROAM_MAGECAVE_02");
			Wld_InsertNpc(Draconian,"FP_ROAM_MAGECAVE_11");
			Wld_InsertNpc(Draconian,"FP_ROAM_MAGECAVE_06");
			Wld_InsertNpc(Draconian,"FP_ROAM_MAGECAVE_07");
			Wld_InsertNpc(Draconian,"FP_ROAM_MAGECAVE_08");
			Wld_InsertNpc(Draconian,"NW_TROLLAREA_PATH_01_01");
			Wld_InsertNpc(Draconian,"NW_TROLLAREA_PATH_01");
			Wld_InsertNpc(Draconian,"NW_TROLLAREA_PATH_01_02");
			Wld_InsertNpc(Draconian,"FP_ROAM_MAGECAVE_08");
			Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_NW_ITEM_RITUALFOREST_CAVE_EGG");
			Wld_InsertNpc(Draconian,"NW_RITUALFOREST_CAVE_06");
			Wld_InsertNpc(Draconian,"FP_ROAM_RITUALFOREST_CAVE_01");
			Wld_InsertNpc(Draconian,"FP_ROAM_RITUALFOREST_CAVE_02");
			Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_ROAM_NW_CITY_SMFOREST_09_04");
			Wld_InsertNpc(Draconian,"FP_ROAM_NW_CITY_SMFOREST_09_03");
			Wld_InsertNpc(Draconian,"FP_ROAM_NW_CITY_SMFOREST_09_02");
			Wld_InsertNpc(Draconian,"FP_ROAM_NW_CITY_SMFOREST_09_01");
			Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_ROAM_NW_CITY_SMFOREST_05_03");
			Wld_InsertNpc(Draconian,"FP_ROAM_NW_CITY_SMFOREST_05_04");
			Wld_InsertNpc(Draconian,"FP_ROAM_NW_CITY_SMFOREST_05_02");
			Wld_InsertNpc(Draconian,"FP_ROAM_NW_CITY_SMFOREST_05_01");
//			Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_ROAM_CITYFOREST_KAP3_07");
			Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_ROAM_CITYFOREST_KAP3_06");
//			Wld_InsertNpc(Draconian,"FP_ROAM_CITYFOREST_KAP3_06");
			Wld_InsertNpc(Draconian,"FP_ROAM_CITYFOREST_KAP3_19");
			Wld_InsertNpc(Draconian,"FP_ROAM_CITYFOREST_KAP3_08");
			Wld_InsertNpc(Draconian,"FP_ROAM_CITYFOREST_KAP3_05");
			Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_ROAM_CITYFOREST_KAP3_07");
			Wld_InsertNpc(Draconian,"FP_ROAM_NW_BIGFARMFORESTCAVE_01");
			Wld_InsertNpc(Draconian,"FP_ROAM_NW_BIGFARMFORESTCAVE_02");
			Wld_InsertNpc(Draconian,"FP_ROAM_NW_BIGFARMFORESTCAVE_03");
			Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_NW_ITEM_CASTLEMINE_EGG");
			Wld_InsertNpc(Draconian,"FP_ROAM_CASTLEMINE_01");
			Wld_InsertNpc(Draconian,"FP_ROAM_CASTLEMINE_02");
			Wld_InsertNpc(Draconian,"FP_ROAM_CASTLEMINE_03");
			Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_NW_ITEM_CASTLEMINE_EGG2");
			Wld_InsertNpc(Draconian,"FP_ROAM_CASTLEMINE_04");
			Wld_InsertNpc(Draconian,"FP_ROAM_CASTLEMINE_05");
			Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_NW_ITEM_BIGFARMLAKECAVE_EGG");
			Wld_InsertNpc(Draconian,"FP_ROAM_BIGFARM_LAKE_CAVE_01");
			Wld_InsertNpc(Draconian,"FP_ROAM_BIGFARM_LAKE_CAVE_02");
			Wld_InsertNpc(Draconian,"FP_ROAM_BIGFARM_LAKE_CAVE_03");
			Wld_InsertNpc(Draconian,"FP_ROAM_BIGFARM_LAKE_CAVE_04");
			Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_NW_ITEM_CASTLEMINE2_EGG");
			Wld_InsertNpc(Draconian,"FP_ROAM_CASTLEMINE2_16");
			Wld_InsertNpc(Draconian,"FP_ROAM_CASTLEMINE2_15");
			Wld_InsertNpc(Draconian,"FP_ROAM_CASTLEMINE2_14");
			Wld_InsertNpc(Draconian,"FP_ROAM_CASTLEMINE2_13");
			Wld_InsertItem(ItAt_DragonEgg_MIS,"FP_ITEM_FARM1_02");
			Wld_InsertNpc(Draconian,"NW_FARM1_BANDITS_CAVE_08");
			Wld_InsertNpc(Draconian,"FP_STAND_DEMENTOR_KDF_29");
			Wld_InsertNpc(Draconian,"FP_STAND_DEMENTOR_KDF_30");
			Wld_InsertNpc(Draconian,"NW_FARM1_BANDITS_CAVE_03");
			Wld_InsertNpc(Draconian,"NW_FARM1_BANDITS_CAVE_02");
			Wld_InsertNpc(Draconian,"NW_FARM1_BANDITS_CAVE_04");
			Wld_InsertNpc(Draconian,"NW_FARM1_BANDITS_CAVE_07");
			Wld_InsertNpc(Draconian,"FP_ROAM_CASTLEMINE2_03");
			Wld_InsertNpc(Draconian,"FP_ROAM_CASTLEMINE2_04");
			Wld_InsertNpc(Draconian,"FP_ROAM_CASTLEMINE2_05");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_VALLEY_01");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_VALLEY_03");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_VALLEY_04");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_MONSTER_02_01");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_MONSTER_02_02");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_MONSTER_02_03");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_MONSTER_02_04");
			Wld_InsertNpc(Draconian,"NW_XARDAS_GOBBO_01");
			Wld_InsertNpc(Draconian,"NW_XARDAS_GOBBO_01");
			Wld_InsertNpc(Draconian,"NW_XARDAS_GOBBO_02");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_TOWER_4_01");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_TOWER_4_02");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_TOWER_4_03");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_TOWER_4_04");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_CAVE_01");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_CAVE_02");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_CAVE_03");
			Wld_InsertNpc(Draconian,"FP_ROAM_XARDAS_CAVE_04");
			Wld_InsertNpc(Draconian,"FP_ROAM_TROLLAREA_11");
			Wld_InsertNpc(Draconian,"FP_ROAM_TROLLAREA_09");
			Wld_InsertNpc(Draconian,"FP_ROAM_TROLLAREA_10");
			Wld_InsertNpc(Draconian,"FP_ROAM_TROLLAREA_08");
		};
		if(hero.guild == GIL_KDF)
		{
			Wld_InsertNpc(DMT_DementorAmbientSpeaker,"NW_TROLLAREA_PATH_80");
			Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_ROAM_TROLLAREA_19");
			Wld_InsertNpc(DMT_DementorAmbientSpeaker,"NW_FARM2_TO_TAVERN_08");
			Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_ROAM_MEDIUMFOREST_KAP2_13");
			Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_ROAM_XARDAS_TOWER_3_02");
			Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_ROAM_XARDAS_TOWER_3_02");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_04");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_05");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_06");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_07");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_08");
			Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_KDF_09");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_10");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_11");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_13");
			Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_KDF_14");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_22");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_23");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_24");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_25");
			Wld_InsertNpc(DMT_DementorAmbientWalker10,"CITY1");
			Wld_InsertNpc(DMT_DementorAmbientWalker8,"CITY1");
			Wld_InsertNpc(DMT_DementorAmbientWalker7,"CITY1");
			B_KillNpc(BDT_1020_Bandit_L);
			if(!Npc_IsDead(Randolph))
			{
				CreateInvItems(Randolph,ITWR_DementorObsessionBook_MIS,1);
				B_StartOtherRoutine(Randolph,"preStart");
			};
		};
		if((TOPIC_END_AkilsSLDStillthere == FALSE) && !C_AkilFarmIsFree())
		{
			if(!Npc_IsDead(Alvares))
			{
				Alvares.guild = GIL_SLD;
				Npc_SetTrueGuild(Alvares,GIL_SLD);
				B_StartOtherRoutine(Alvares,"Bigfarm");
			};
			if(!Npc_IsDead(Engardo))
			{
				Engardo.guild = GIL_SLD;
				Npc_SetTrueGuild(Engardo,GIL_SLD);
				B_StartOtherRoutine(Engardo,"Bigfarm");
			};
			if(!Npc_IsDead(Kati))
			{
				B_StartOtherRoutine(Kati,"Start");
			};
			if(!Npc_IsDead(Akil))
			{
				B_StartOtherRoutine(Akil,"Start");
			};
			if(!Npc_IsDead(Randolph))
			{
				if((hero.guild != GIL_KDF) && (Randolph_ExchangeRoutine_Once == FALSE))
				{
					B_StartOtherRoutine(Randolph,"Start");
					Randolph_ExchangeRoutine_Once = TRUE;
				};
				Randolph.flags = 0;
			};
		};
		if((TaverneTopicStarted == TRUE) && (MIS_Rukhar_Wettkampf == FALSE))
		{
			MIS_Rukhar_Wettkampf = LOG_OBSOLETE;
			B_CheckLog();
		};
		if((DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE) && (MIS_Rukhar_Wettkampf == LOG_Running))
		{
			if(Mob_HasItems("CHEST_RUKHAR",ItFo_Booze))
			{
				B_StartOtherRoutine(Rukhar,"WettkampfRukharWon");
				Rukhar_Won_Wettkampf = TRUE;
			}
			else if(Mob_HasItems("CHEST_RUKHAR",ItFo_Water) > 0)
			{
				B_StartOtherRoutine(Rukhar,"WettkampfRukharLost");
			};
			if((hero.guild != GIL_KDF) && (Randolph_ExchangeRoutine_Once == FALSE))
			{
				B_StartOtherRoutine(Randolph,"Start");
				Randolph_ExchangeRoutine_Once = TRUE;
			};
		};
		if(Npc_IsDead(Hanna))
		{
			B_SendMilitiaToHotel();
		};
		B_KillThievesGuild();
		B_ResetSergio();
		EnterNW_Kapitel4 = TRUE;
	};
	if(Talbin_FollowsThroughPass == LOG_Running)
	{
		Wld_InsertNpc(VLK_4132_Talbin_NW,"NW_PASS_SECRET_17");
		B_InitNpcGlobals();
		Talbin_FollowsThroughPass = LOG_SUCCESS;
	};
};


var int EnterNW_Kapitel5;
var int Rosi_FleeFromSekob_Kap5;

func void B_ENTER_NEWWORLD_Kapitel_5()
{
	if(EnterNW_Kapitel5 == FALSE)
	{
		B_RemoveNpc(NONE_100_Xardas);
		B_StartOtherRoutine(Lester,"XardasWeg");
		if(!Npc_IsDead(Salandril) && (MIS_Serpentes_BringSalandril_SLD == LOG_SUCCESS))
		{
			B_StartOtherRoutine(Salandril,"Start");
		};
		if(!Npc_IsDead(Sekob))
		{
			if(!Npc_IsDead(Rosi))
			{
				B_StartOtherRoutine(Rosi,"FleeFromSekob");
				Rosi.aivar[AIV_CommentedPlayerCrime] = FALSE;
			};
			if(!Npc_IsDead(Till))
			{
				B_StartOtherRoutine(Till,"FleeFromSekob");
				Till.aivar[AIV_CommentedPlayerCrime] = FALSE;
			};
			Rosi_FleeFromSekob_Kap5 = TRUE;
		};
		if(GornDJG_is_alive == TRUE)
		{
			Wld_InsertNpc(PC_Fighter_NW_nach_DJG,"BIGFARM");
		};
		if(DJG_Angar_is_alive == TRUE)
		{
			Wld_InsertNpc(DJG_705_Angar_NW,"BIGFARM");
		};
		Wld_InsertNpc(Xardas_DT_Demon1,"FP_ROAM_NW_XARDASTOWER_DEMON_02");
		Wld_InsertNpc(Xardas_DT_Demon2,"NW_XARDAS_TOWER_IN1_24");
		Wld_InsertNpc(Xardas_DT_Demon3,"FP_ROAM_NW_XARDASTOWER_DEMON_03");
		Wld_InsertNpc(Xardas_DT_Demon4,"FP_ROAM_NW_XARDASTOWER_DEMON_04");
		Wld_InsertNpc(Xardas_DT_Demon5,"FP_ROAM_NW_XARDASTOWER_DEMON_05");
		Wld_InsertNpc(Xardas_DT_DemonLord,"FP_ROAM_NW_XARDASTOWER_DEMONLORD_01");
		Wld_InsertNpc(Bloodfly,"NW_FARM3_PATH_11_SMALLRIVER_15");
		Wld_InsertNpc(Bloodfly,"NW_FARM3_PATH_11_SMALLRIVER_15");
		Wld_InsertNpc(Waran,"NW_FARM3_PATH_11_SMALLRIVER_11");
		Wld_InsertNpc(Waran,"NW_FARM3_PATH_11_SMALLRIVER_11");
		Wld_InsertNpc(Lurker,"NW_FARM3_MOUNTAINLAKE_05");
		Wld_InsertNpc(Lurker,"NW_FARM3_MOUNTAINLAKE_05");
		Wld_InsertNpc(NONE_101_Mario,"NW_CITY_ENTRANCE_01");
		Wld_InsertItem(ItWr_HallsofIrdorath_Mis,"FP_NW_ITEM_LIBRARY_IRDORATHBOOK");
		Wld_InsertItem(ItWr_Seamap_Irdorath,"FP_NW_ITEM_LIBRARY_SEAMAP");
		Wld_InsertItem(ItWr_XardasSeamapBook_Mis,"FP_NW_ITEM_LIBRARY_SEAMAP");
		Wld_InsertItem(ItPo_PotionOfDeath_01_Mis,"FP_NW_ITEM_LIBRARY_SEAMAP2");
		if(!Npc_IsDead(Hilda) && (MIS_HealHilda == LOG_SUCCESS))
		{
			B_StartOtherRoutine(Hilda,"START");
		};
		if(hero.guild == GIL_PAL)
		{
			if(Helmets_Enabled == TRUE)
			{
				Wld_InsertItem(ITAR_PALN_H,"FP_ITEM_PALFINALARMOR");
				Wld_InsertItem(ITHE_PAL_H,"FP_ITEM_PALFINALWEAPON");
			}
			else
			{
				Wld_InsertItem(ITAR_PAL_H,"FP_ITEM_PALFINALARMOR");
			};
			Wld_InsertItem(ItMi_RuneBlank,"FP_NW_ITEM_LIBRARY_SEAMAP");
		};
		if(hero.guild == GIL_KDF)
		{
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_01");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_02");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_03");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_15");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_16");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_17");
			Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_KDF_18");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_19");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_20");
			Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_KDF_21");
			Wld_InsertItem(ITWR_DementorObsessionBook_MIS,"FP_ITEM_FARM1_01");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_29");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_30");
			Wld_InsertNpc(DMT_DementorAmbient,"NW_FARM1_BANDITS_CAVE_08");
			Wld_InsertNpc(DMT_DementorAmbient,"NW_FARM1_BANDITS_CAVE_03");
			Wld_InsertNpc(DMT_DementorAmbient,"NW_FARM1_BANDITS_CAVE_02");
			Wld_InsertNpc(DMT_DementorAmbient,"NW_FARM1_BANDITS_CAVE_04");
			Wld_InsertNpc(DMT_DementorAmbient,"NW_FARM1_BANDITS_CAVE_07");
			Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_KDF_34");
			Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_KDF_35");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_26");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_27");
			Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_KDF_28");
			Wld_InsertNpc(DMT_DementorAmbientWalker5,"CITY1");
			Wld_InsertNpc(DMT_DementorAmbientWalker4,"CITY1");
			Wld_InsertNpc(DMT_DementorAmbientWalker2,"CITY1");
			if(!Npc_IsDead(Sekob))
			{
				CreateInvItems(Sekob,ITWR_DementorObsessionBook_MIS,1);
				B_StartOtherRoutine(Sekob,"Obsessed");
			};
		};
		Wld_InsertNpc(PAL_285_Ritter,"CITY1");
		Wld_InsertNpc(PAL_286_Ritter,"CITY1");
		Wld_InsertNpc(PAL_287_Ritter,"CITY1");
		Wld_InsertNpc(PAL_288_Ritter,"CITY1");
		Wld_InsertNpc(PAL_289_Ritter,"CITY1");
		Wld_InsertNpc(PAL_290_Ritter,"CITY1");
		Wld_InsertNpc(PAL_291_Ritter,"CITY1");
		Wld_InsertNpc(PAL_292_Ritter,"CITY1");
		Wld_InsertNpc(PAL_293_Ritter,"CITY1");
		Schiffswache_212.flags = 0;
		Schiffswache_213.flags = 0;
		PAL_220_Schiffswache.flags = 0;
		PAL_221_Schiffswache.flags = 0;
		PAL_222_Schiffswache.flags = 0;
		PAL_223_Schiffswache.flags = 0;
		PAL_224_Schiffswache.flags = 0;
		PAL_225_Schiffswache.flags = 0;
		PAL_226_Schiffswache.flags = 0;
		PAL_227_Schiffswache.flags = 0;
		PAL_228_Schiffswache.flags = 0;
		B_StartOtherRoutine(PAL_220_Schiffswache,"ShipFree");
		B_StartOtherRoutine(PAL_221_Schiffswache,"ShipFree");
		B_StartOtherRoutine(PAL_222_Schiffswache,"ShipFree");
		B_StartOtherRoutine(PAL_223_Schiffswache,"ShipFree");
		B_StartOtherRoutine(PAL_224_Schiffswache,"ShipFree");
		B_StartOtherRoutine(PAL_225_Schiffswache,"ShipFree");
		B_StartOtherRoutine(PAL_226_Schiffswache,"ShipFree");
		B_StartOtherRoutine(PAL_227_Schiffswache,"ShipFree");
		B_StartOtherRoutine(PAL_228_Schiffswache,"ShipFree");
		B_StartOtherRoutine(PAL_230_Ritter,"ShipFree");
		B_StartOtherRoutine(PAL_231_Ritter,"ShipFree");
		B_StartOtherRoutine(PAL_240_Ritter,"ShipFree");
		B_StartOtherRoutine(PAL_241_Ritter,"ShipFree");
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			IntroduceChapter(KapWechsel_5,KapWechsel_5_Text,"chapter5_PAL.tga","chapter_01.wav",6000);
		}
		else if(hero.guild == GIL_KDF)
		{
			IntroduceChapter(KapWechsel_5,KapWechsel_5_Text,"chapter5_KDF.tga","chapter_01.wav",6000);
		}
		else
		{
			IntroduceChapter(KapWechsel_5,KapWechsel_5_Text,"chapter5_DJG.tga","chapter_01.wav",6000);
		};
		if(MIS_ShipIsFree == TRUE)
		{
			B_StartOtherRoutine(Girion,"WaitForShip");
		};
		if(Npc_IsDead(Hanna))
		{
			B_SendMilitiaToHotel();
		};
		B_KillThievesGuild();
		B_ResetSergio();
		EnterNW_Kapitel5 = TRUE;
	};
//	if(MIS_OCGateOpen == TRUE)
//	{
//		MIS_ShipIsFree = TRUE;
//	};
	if(Biff_FollowsThroughPass == LOG_Running)
	{
		Wld_InsertNpc(DJG_713_Biff_NW,"LEVELCHANGE");
		Biff_FollowsThroughPass = LOG_SUCCESS;
	};
};


var int EnterNW_Kapitel6;

func void B_ENTER_NEWWORLD_Kapitel_6()
{
	if(EnterNW_Kapitel6 == FALSE)
	{
		EnterNW_Kapitel6 = TRUE;
	};
};

func void b_enter_newworld()
{
	B_InitNpcGlobals();
	if(Kapitel >= 1)
	{
		B_ENTER_NEWWORLD_Kapitel_1();
	};
	if(Kapitel >= 2)
	{
		B_ENTER_NEWWORLD_Kapitel_2();
	};
	if(Kapitel >= 3)
	{
		B_ENTER_NEWWORLD_Kapitel_3();
	};
	if(Kapitel >= 4)
	{
		B_ENTER_NEWWORLD_Kapitel_4();
	};
	if(Kapitel >= 5)
	{
		B_ENTER_NEWWORLD_Kapitel_5();
	};
	if(Kapitel >= 6)
	{
		B_ENTER_NEWWORLD_Kapitel_6();
	};
	CurrentLevel = NEWWORLD_ZEN;
	B_InitNpcGlobals();
};

