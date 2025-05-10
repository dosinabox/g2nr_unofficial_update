
func void B_SetStoryPoint(var int newStoryPoint)
{
	if((newStoryPoint >= SP_C1_P1) && (STORYPOINT[SP_C1_P1] == FALSE))
	{
		Kapitel = 1;
		STORYPOINT[SP_C1_P1] = TRUE;
	};
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
			B_RemoveNpc(Dragon_Undead);
		};
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

