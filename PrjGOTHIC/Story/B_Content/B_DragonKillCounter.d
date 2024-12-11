
var int SwampDragonIsDead;
var int RockDragonIsDead;
var int FireDragonIsDead;
var int IceDragonIsDead;

func void B_DragonKillCounter(var C_Npc current_dragon)
{
	if(current_dragon.guild == GIL_DRAGON)
	{
		if(MIS_AllDragonsDead == FALSE)
		{
			if(C_IsNpc(current_dragon,Dragon_Swamp))
			{
				if(SwampDragonIsDead == FALSE)
				{
					MIS_KilledDragons += 1;
					SwampDragonIsDead = TRUE;
				};
			}
			else if(C_IsNpc(current_dragon,Dragon_Rock))
			{
				if(RockDragonIsDead == FALSE)
				{
					MIS_KilledDragons += 1;
					RockDragonIsDead = TRUE;
				};
			}
			else if(C_IsNpc(current_dragon,Dragon_Fire))
			{
				if(FireDragonIsDead == FALSE)
				{
					MIS_KilledDragons += 1;
					FireDragonIsDead = TRUE;
				};
			}
			else if(C_IsNpc(current_dragon,Dragon_Ice))
			{
				if(IceDragonIsDead == FALSE)
				{
					if(C_SylvioGolemsDead() && !Npc_IsDead(DJG_Sylvio))
					{
						B_StartOtherRoutine(DJG_Sylvio,"ICEDRAGON");
						B_StartOtherRoutine(DJG_Bullco,"ICEDRAGON");
					};
					MIS_KilledDragons += 1;
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
				B_CheckLog();
			};
		};
		if(UndeadDragonIsDead == FALSE)
		{
			if(C_IsNpc(current_dragon,Dragon_Undead))
			{
				if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
				{
					PlayVideoEx("EXTRO_PAL.BIK",TRUE,FALSE);
				}
				else if((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
				{
					PlayVideoEx("EXTRO_KDF.BIK",TRUE,FALSE);
				}
				else
				{
					PlayVideoEx("EXTRO_DJG.BIK",TRUE,FALSE);
				};
				AI_Teleport(hero,"UNDEAD_ENDTELEPORT");
				Log_CreateTopic(TOPIC_BackToShip,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_BackToShip,LOG_Running);
				B_LogEntry(TOPIC_BackToShip,PRINT_DragKillCount);
				UndeadDragonIsDead = TRUE;
				B_CheckLog();
			};
		};
	}
	else if(RavenIsDead == FALSE)
	{
		if(C_IsNpc(current_dragon,BDT_1090_Addon_Raven))
		{
			PlayVideoEx("EXTRO_RAVEN.BIK",TRUE,FALSE);
			B_RemoveNpc(KDW_14030_Addon_Myxir_ADW);
			if(FullNPCRemoval == TRUE)
			{
				ADW_Myxir_Removed_Forever = TRUE;
			};
			B_StartOtherRoutine(Nefarius_ADW,"MYXIRLEFT");
			Saturas_KnowsHow2GetInTempel = TRUE;
			RavenIsDead = TRUE;
			B_CheckLog();
		};
	};
};

