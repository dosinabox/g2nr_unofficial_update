
var int SwampDragonIsDead;
var int RockDragonIsDead;
var int FireDragonIsDead;
var int IceDragonIsDead;

func void B_DragonKillCounter(var C_Npc current_dragon)
{
	if(RavenIsDead == FALSE)
	{
		if(Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(Raven))
		{
			PlayVideoEx("EXTRO_RAVEN.BIK",TRUE,FALSE);
			RavenIsDead = TRUE;
			Saturas_KnowsHow2GetInTempel = TRUE;
			B_RemoveNpc(KDW_14030_Addon_Myxir_ADW);
			B_StartOtherRoutine(KDW_14020_Addon_Nefarius_ADW,"MyxirLeft");
			B_CheckLog();
		};
	};
	if(MIS_AllDragonsDead == FALSE)
	{
		if(current_dragon.guild == GIL_DRAGON)
		{
			if((Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(SwampDragon)) && (SwampDragonIsDead == FALSE))
			{
				MIS_KilledDragons += 1;
				SwampDragonIsDead = TRUE;
			};
			if((Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(RockDragon)) && (RockDragonIsDead == FALSE))
			{
				MIS_KilledDragons += 1;
				RockDragonIsDead = TRUE;
			};
			if((Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(FireDragon)) && (FireDragonIsDead == FALSE))
			{
				MIS_KilledDragons += 1;
				FireDragonIsDead = TRUE;
			};
			if((Hlp_GetInstanceID(current_dragon) == Hlp_GetInstanceID(IceDragon)) && (IceDragonIsDead == FALSE))
			{
				MIS_KilledDragons += 1;
				if(Npc_IsDead(IceGolem_Sylvio1) && Npc_IsDead(IceGolem_Sylvio2) && !Npc_IsDead(DJG_Sylvio))
				{
					B_StartOtherRoutine(DJG_Sylvio,"IceDragon");
					B_StartOtherRoutine(DJG_Bullco,"IceDragon");
				};
				IceDragonIsDead = TRUE;
			};
		};
		if(MIS_KilledDragons == 4)
		{
			if(DJG_BiffParty == TRUE)
			{
				if(!Npc_IsDead(Biff))
				{
					DJG_BiffSurvivedLastDragon = TRUE;
				};
			};
			MIS_AllDragonsDead = TRUE;
		};
	};
	if(current_dragon.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	{
		UndeadDragonIsDead = TRUE;
		Log_CreateTopic(TOPIC_BackToShip,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BackToShip,LOG_Running);
		B_LogEntry(TOPIC_BackToShip,PRINT_DragKillCount);
		AI_Teleport(hero,"UNDEAD_ENDTELEPORT");
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			PlayVideoEx("EXTRO_PAL.BIK",TRUE,FALSE);
		}
		else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			PlayVideoEx("EXTRO_DJG.BIK",TRUE,FALSE);
		}
		else
		{
			PlayVideoEx("EXTRO_KDF.BIK",TRUE,FALSE);
		};
	};
};

