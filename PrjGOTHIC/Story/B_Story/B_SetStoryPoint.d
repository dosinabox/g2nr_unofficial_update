
func void B_SetStoryPoint(var int newStoryPoint)
{
	/*if((newStoryPoint >= SP_C1_P1) && (STORYPOINT[SP_C1_P1] == FALSE))
	{
		Kapitel = 1;
		STORYPOINT[SP_C1_P1] = TRUE;
	};*/
	if((newStoryPoint >= SP_C1_P2) && (STORYPOINT[SP_C1_P2] == FALSE))
	{
		MIL_305_schonmalreingelassen = TRUE;
		STORYPOINT[SP_C1_P2] = TRUE;
	};
	if((newStoryPoint >= SP_C1_P3) && (STORYPOINT[SP_C1_P3] == FALSE))
	{
		PAL_205_schonmalreingelassen = TRUE;
		STORYPOINT[SP_C1_P3] = TRUE;
	};
	if((newStoryPoint >= SP_C2_P1) && (STORYPOINT[SP_C2_P1] == FALSE))
	{
		if(!Npc_HasItems(hero,ItKe_Pass_MIS))
		{
			CreateInvItem(hero,ItKe_Pass_MIS);
		};
		MIS_OLDWORLD = LOG_RUNNING;
		Kapitel = 2;
		STORYPOINT[SP_C2_P1] = TRUE;
	};
	if((newStoryPoint >= SP_C2_P2) && (STORYPOINT[SP_C2_P2] == FALSE))
	{
		if(!Npc_HasItems(hero,ItWr_PaladinLetter_MIS))
		{
			CreateInvItem(hero,ItWr_PaladinLetter_MIS);
		};
		KnowsPaladins_Ore = TRUE;
		MIS_ReadyForChapter3 = TRUE;
		STORYPOINT[SP_C2_P2] = TRUE;
	};
	if((newStoryPoint >= SP_C3_P1) && (STORYPOINT[SP_C3_P1] == FALSE))
	{
		if(!Npc_HasItems(hero,ItWr_PermissionToWearInnosEye_MIS))
		{
			CreateInvItem(hero,ItWr_PermissionToWearInnosEye_MIS);
		};
		MIS_OLDWORLD = LOG_SUCCESS;
		Kapitel = 3;
		STORYPOINT[SP_C3_P1] = TRUE;
	};
	if((newStoryPoint >= SP_C3_P2) && (STORYPOINT[SP_C3_P2] == FALSE))
	{
		if(CurrentLevel == NEWWORLD_ZEN)
		{
			B_NpcSetReleased(Bennet);
			B_StartOtherRoutine(Bennet,"START");
			B_StartOtherRoutine(Hodges,"START");
		};
		MIS_RescueBennet = LOG_SUCCESS;
		STORYPOINT[SP_C3_P2] = TRUE;
	};
	if((newStoryPoint >= SP_C3_P3) && (STORYPOINT[SP_C3_P3] == FALSE))
	{
		if(!Npc_HasItems(hero,ItMi_InnosEye_MIS))
		{
			CreateInvItem(hero,ItMi_InnosEye_MIS);
		};
		PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
		MIS_ReadyforChapter4 = TRUE;
		STORYPOINT[SP_C3_P3] = TRUE;
	};
	if((newStoryPoint >= SP_C4_P1) && (STORYPOINT[SP_C4_P1] == FALSE))
	{
		Kapitel = 4;
		STORYPOINT[SP_C4_P1] = TRUE;
	};
	if((newStoryPoint >= SP_C4_P2) && (STORYPOINT[SP_C4_P2] == FALSE))
	{
		if(CurrentLevel == OLDWORLD_ZEN)
		{
			B_RemoveNpc(Dragon_Swamp);
			B_RemoveNpc(Dragon_Rock);
			B_RemoveNpc(Dragon_Fire);
			B_RemoveNpc(Dragon_Ice);
		};
		if(!C_SCHasAnyDragonHeart(hero))
		{
			CreateInvItem(hero,ItAt_IcedragonHeart);
		};
		SwampDragonIsDead = TRUE;
		RockDragonIsDead = TRUE;
		FireDragonIsDead = TRUE;
		IceDragonIsDead = TRUE;
		MIS_KilledDragons = 4;
		MIS_AllDragonsDead = TRUE;
		STORYPOINT[SP_C4_P2] = TRUE;
	};
	if((newStoryPoint >= SP_C5_P1) && (STORYPOINT[SP_C5_P1] == FALSE))
	{
		Kapitel = 5;
		STORYPOINT[SP_C5_P1] = TRUE;
	};
	if((newStoryPoint >= SP_C5_P2) && (STORYPOINT[SP_C5_P2] == FALSE))
	{
		if(!Npc_HasItems(hero,ItWr_Seamap_Irdorath))
		{
			CreateInvItem(hero,ItWr_Seamap_Irdorath);
		};
		MIS_SCKnowsWayToIrdorath = TRUE;
		STORYPOINT[SP_C5_P2] = TRUE;
	};
	if((newStoryPoint >= SP_C5_P3) && (STORYPOINT[SP_C5_P3] == FALSE))
	{
		if(!Npc_HasItems(hero,ItKe_Ship_Levelchange_MIS))
		{
			CreateInvItem(hero,ItKe_Ship_Levelchange_MIS);
		};
		MIS_ShipIsFree = TRUE;
		MIS_ReadyforChapter6 = TRUE;
		STORYPOINT[SP_C5_P3] = TRUE;
	};
	if((newStoryPoint >= SP_C6_P1) && (STORYPOINT[SP_C6_P1] == FALSE))
	{
		Kapitel = 6;
		STORYPOINT[SP_C6_P1] = TRUE;
	};
	if((newStoryPoint >= SP_C6_P2) && (STORYPOINT[SP_C6_P2] == FALSE))
	{
		if(CurrentLevel == DRAGONISLAND_ZEN)
		{
			EVT_OrkOberst();
			B_RemoveNpc(Dragon_Fire_Island);
		};
		if(!C_SCHasAnyDragonHeart(hero))
		{
			CreateInvItem(hero,ItAt_FiredragonHeart);
		};
		FireDragonIslandIsDead = TRUE;
		STORYPOINT[SP_C6_P2] = TRUE;
	};
	if((newStoryPoint >= SP_C6_P3) && (STORYPOINT[SP_C6_P3] == FALSE))
	{
		if(CurrentLevel == DRAGONISLAND_ZEN)
		{
			B_RemoveNpc(DMT_1299_OberDementor_DI);
			B_RemoveNpc(Dragon_Undead);
		};
		if(!Npc_HasItems(hero,ItWr_LastDoorToUndeadDrgDI_MIS))
		{
			CreateInvItem(hero,ItWr_LastDoorToUndeadDrgDI_MIS);
		};
		if(!Npc_HasItems(hero,ItKe_ChestMasterDementor_MIS))
		{
			CreateInvItem(hero,ItKe_ChestMasterDementor_MIS);
		};
		Read_LastDoorToUndeadDrgDI_MIS = TRUE;
		UndeadDragonIsDead = TRUE;
		STORYPOINT[SP_C6_P3] = TRUE;
	};
	if(CurrentStoryPoint < newStoryPoint)
	{
		CurrentStoryPoint = newStoryPoint;
	};
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		B_Enter_NewWorld();
	}
	else if(CurrentLevel == OLDWORLD_ZEN)
	{
		B_Enter_OldWorld();
	}
	else if(CurrentLevel == ADDONWORLD_ZEN)
	{
		B_Enter_AddonWorld();
	};
	if(XP_Static == FALSE)
	{
		B_SetAmbientXP();
	};
	B_NPC_IsAliveCheck(CurrentLevel);
	B_CheckLog();
};

func void B_SetAddonStoryPoint(var int newStoryPoint)
{
	if((newStoryPoint >= SP_A1) && (STORYPOINT_ADDON[SP_A1] == FALSE))
	{
		if(CurrentLevel == NEWWORLD_ZEN)
		{
			B_RemoveNpc(BDT_1060_Dexter);
		};
		if(!Npc_HasItems(hero,ItWr_RavensKidnapperMission_Addon))
		{
			CreateInvItem(hero,ItWr_RavensKidnapperMission_Addon);
		};
		SCKnowsMissingPeopleAreInAddonWorld = TRUE;
		MIS_Addon_Vatras_WhereAreMissingPeople = LOG_SUCCESS;
		STORYPOINT_ADDON[SP_A1] = TRUE;
	};
	if((newStoryPoint >= SP_A2) && (STORYPOINT_ADDON[SP_A2] == FALSE))
	{
		if(CurrentLevel == NEWWORLD_ZEN)
		{
			B_SchlussMitRangerMeeting();
		};
		if(!Npc_HasItems(hero,ItRi_Ranger_Addon))
		{
			CreateInvItem(hero,ItRi_Ranger_Addon);
		};
		if(!Npc_HasItems(hero,ITAR_RANGER_Addon))
		{
			CreateInvItem(hero,ITAR_RANGER_Addon);
		};
		if(!Npc_HasItems(hero,ItWr_Vatras2Saturas_FindRaven))
		{
			CreateInvItem(hero,ItWr_Vatras2Saturas_FindRaven);
		};
		MIS_Addon_Lares_ComeToRangerMeeting = LOG_SUCCESS;
		RangerMeetingRunning = LOG_SUCCESS;
		SC_IsRanger = TRUE;
		STORYPOINT_ADDON[SP_A2] = TRUE;
	};
	if((newStoryPoint >= SP_A3) && (STORYPOINT_ADDON[SP_A3] == FALSE))
	{
		if(!Npc_HasItems(hero,ItMi_PortalRing_Addon))
		{
			CreateInvItem(hero,ItMi_PortalRing_Addon);
		};
		SC_KnowsPortal = TRUE;
		MIS_Addon_Nefarius_BringMissingOrnaments = LOG_SUCCESS;
		RitualRingRuns = LOG_SUCCESS;
		DIA_Addon_Saturas_OpenPortal_NoPerm = TRUE;
		VatrasLetterGivenToSaturas = TRUE;
		STORYPOINT_ADDON[SP_A3] = TRUE;
	};
	if((newStoryPoint >= SP_A4) && (STORYPOINT_ADDON[SP_A4] == FALSE))
	{
		if(!C_SCHasStPlSkill(LANGUAGE_1))
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_FOREIGNLANGUAGE,1);
			PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] = TRUE;
			TOPIC_End_Stoneplates = TRUE;
		};
		if(!Npc_HasItems(hero,ItMi_TempelTorKey))
		{
			CreateInvItem(hero,ItMi_TempelTorKey);
		};
		if(CurrentLevel == ADDONWORLD_ZEN)
		{
			B_RemoveNpc(NONE_ADDON_111_Quarhodron);
		};
		SC_SummonedAncientGhost = TRUE;
		SC_TalkedToGhost = TRUE;
		Ghost_SCKnowsHow2GetInAdanosTempel = TRUE;
		STORYPOINT_ADDON[SP_A4] = TRUE;
	};
	if((newStoryPoint >= SP_A5) && (STORYPOINT_ADDON[SP_A5] == FALSE))
	{
		if(CurrentLevel == ADDONWORLD_ZEN)
		{
			B_RemoveNpc(KDW_14030_Addon_Myxir_ADW);
			B_RemoveNpc(BDT_1090_Addon_Raven);
		};
		RavenIsDead = TRUE;
		STORYPOINT_ADDON[SP_A5] = TRUE;
	};
	if(CurrentAddonStoryPoint < newStoryPoint)
	{
		CurrentAddonStoryPoint = newStoryPoint;
	};
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		B_Enter_NewWorld();
	}
	else if(CurrentLevel == ADDONWORLD_ZEN)
	{
		B_Enter_AddonWorld();
	};
	B_NPC_IsAliveCheck(CurrentLevel);
	B_CheckLog();
};

