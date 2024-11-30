
func void B_CheckDeadMissionHumans(var C_Npc slf)
{
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(C_IsNpc(slf,VLK_498_Ignaz))
		{
			if(MIS_Ignaz_Charm == LOG_Running)
			{
				MIS_Ignaz_Charm = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,BDT_1060_Dexter))
		{
			if(MIS_Steckbriefe != LOG_SUCCESS)
			{
				MIS_Steckbriefe = LOG_OBSOLETE;
			};
			if(Greg_Rejected == FALSE)
			{
				B_Greg_ComesToDexter();
			};
		}
		else if(C_IsNpc(slf,BAU_951_Hilda))
		{
			if(MIS_Lobart_RuebenToHilda == LOG_Running)
			{
				MIS_Lobart_RuebenToHilda = LOG_FAILED;
			};
			if(MIS_Hilda_PfanneKaufen == LOG_Running)
			{
				MIS_Hilda_PfanneKaufen = LOG_FAILED;
			};
			if(MIS_HealHilda == LOG_Running)
			{
				MIS_HealHilda = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,VLK_468_Canthar))
		{
			if(MIS_Canthars_KomproBrief == LOG_Running)
			{
				MIS_Canthars_KomproBrief = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,VLK_410_Baltram))
		{
			if(MIS_Addon_Baltram_Paket4Skip == LOG_Running)
			{
				MIS_Addon_Baltram_Paket4Skip = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,VLK_414_Hanna))
		{
			if(MIS_HannaRetrieveLetter == LOG_Running)
			{
				MIS_HannaRetrieveLetter = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,VLK_405_Fernando))
		{
			if(MIS_Fernando_Erz == LOG_Running)
			{
				MIS_Fernando_Erz = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,PAL_212_Schiffswache))
		{
			if(Npc_IsDead(Schiffswache_213))
			{
				MIS_ShipIsFree = TRUE;
			};
		}
		else if(C_IsNpc(slf,PAL_213_Schiffswache))
		{
			if(Npc_IsDead(Schiffswache_212))
			{
				MIS_ShipIsFree = TRUE;
			};
		}
		else if(C_IsNpc(slf,SLD_816_Fester))
		{
			if(MIS_Fester_KillBugs == LOG_Running)
			{
				MIS_Fester_KillBugs = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,VLK_4132_Talbin_NW))
		{
			if(MIS_Talbin_Runs == LOG_Running)
			{
				MIS_Talbin_Runs = LOG_FAILED;
			};
		}
		else if(slf.aivar[AIV_SubGuild] == GIL_SUB_Thief_Sewer)
		{
			if(C_IsNpc(slf,VLK_447_Cassia))
			{
				if(MIS_CassiaRing == LOG_Running)
				{
					MIS_CassiaRing = LOG_FAILED;
				};
				if(MIS_CassiaKelche == LOG_Running)
				{
					MIS_CassiaKelche = LOG_FAILED;
				};
			}
			else if(C_IsNpc(slf,VLK_445_Ramirez))
			{
				if(MIS_RamirezSextant == LOG_Running)
				{
					MIS_RamirezSextant = LOG_FAILED;
				};
			};
			DG_gefunden = TRUE;
		}
		else if(C_IsNpc(slf,KDF_508_Gorax))
		{
			if(MIS_GoraxEssen == LOG_Running)
			{
				MIS_GoraxEssen = LOG_FAILED;
			};
			if(MIS_GoraxWein == LOG_Running)
			{
				MIS_GoraxWein = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,KDF_509_Isgaroth))
		{
			if(MIS_Vatras_Message == LOG_Running)
			{
				MIS_Vatras_Message = LOG_FAILED;
			};
			if(MIS_IsgarothWolf == LOG_Running)
			{
				MIS_IsgarothWolf = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,PAL_299_Sergio))
		{
			if(Sergio_GuideStatus == LOG_Running)
			{
				Sergio_GuideStatus = LOG_FAILED;
			};
			if(MIS_Babo_Training == LOG_Running)
			{
				MIS_Babo_Training = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,NOV_604_Dyrian))
		{
			if(MIS_HelpDyrian == LOG_Running)
			{
				MIS_HelpDyrian = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,NOV_605_Opolos))
		{
			if(MIS_HelpOpolos == LOG_Running)
			{
				MIS_HelpOpolos = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,NOV_612_Babo))
		{
			if(MIS_HelpBabo == LOG_Running)
			{
				MIS_HelpBabo = LOG_FAILED;
			};
			if(MIS_Babo_Training == LOG_Running)
			{
				MIS_Babo_Training = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,BAU_973_Rukhar))
		{
			MIS_Rukhar_Wettkampf = LOG_OBSOLETE;
		}
		else if(C_IsNpc(slf,BAU_942_Randolph))
		{
			if(MIS_Rukhar_Wettkampf == LOG_Running)
			{
				MIS_Rukhar_Wettkampf = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,BAU_961_Gaan))
		{
			if(MIS_Gaan_Snapper == LOG_Running)
			{
				MIS_Gaan_Snapper = LOG_OBSOLETE;
			};
		}
		else if(C_IsNpc(slf,BAU_932_Balthasar))
		{
			if(MIS_Balthasar_BengarsWeide == LOG_Running)
			{
				MIS_Balthasar_BengarsWeide = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,SLD_808_Jarvis))
		{
			if(MIS_Jarvis_SldKO == LOG_Running)
			{
				MIS_Jarvis_SldKO = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,SLD_804_Rod))
		{
			if(MIS_RodSword == LOG_Running)
			{
				MIS_RodSword = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,SLD_802_Buster))
		{
			if(MIS_Buster_KillShadowbeasts_DJG == LOG_Running)
			{
				MIS_Buster_KillShadowbeasts_DJG = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,VLK_422_Salandril))
		{
			if((SC_KnowsProspektorSalandril == TRUE) && (Log_SalandrilIsDead == FALSE))
			{
				B_LogEntry(TOPIC_MinenAnteileKDF,"Саландрил мертв. Мне нужно сообщить это Серпентесу.");
				Log_SalandrilIsDead = TRUE;
			};
		}
		else if(C_IsNpc(slf,VLK_4302_Addon_Elvrich))
		{
			if(MIS_LuciasLetter == LOG_Running)
			{
				MIS_LuciasLetter = LOG_FAILED;
			};
			Elvrich_IsDead = TRUE;
		}
		else if(C_IsNpc(slf,BAU_936_Rosi))
		{
			if(MIS_BringRosiBackToSekob == LOG_Running)
			{
				MIS_BringRosiBackToSekob = LOG_FAILED;
			};
			if(MIS_RosisFlucht == LOG_Running)
			{
				MIS_RosisFlucht = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,BAU_960_Bengar))
		{
			if(MIS_Balthasar_BengarsWeide == LOG_Running)
			{
				MIS_Balthasar_BengarsWeide = LOG_FAILED;
			};
			if(MIS_GetMalakBack == LOG_Running)
			{
				MIS_GetMalakBack = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,BAU_963_Malak))
		{
			if(MIS_GetMalakBack == LOG_Running)
			{
				MIS_GetMalakBack = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,SLD_811_Wolf))
		{
			if(MIS_Wolf_BringCrawlerPlates == LOG_Running)
			{
				MIS_Wolf_BringCrawlerPlates = LOG_FAILED;
			};
			if(MIS_BengarsHelpingSLD == LOG_Running)
			{
				MIS_BengarsHelpingSLD = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,BAU_912_Pepe))
		{
			if(MIS_Pepe_KillWolves == LOG_Running)
			{
				MIS_Pepe_KillWolves = LOG_FAILED;
			};
			if(MIS_Pepe_KickBullco == LOG_Running)
			{
				MIS_Pepe_KickBullco = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,PIR_1301_Addon_Skip_NW))
		{
			if((MIS_Addon_Baltram_Paket4Skip == LOG_Running) && (Skip_Rum4Baltram == FALSE))
			{
				MIS_Addon_Baltram_Paket4Skip = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,SLD_810_Dar))
		{
			if(MIS_Dar_BringOrcEliteRing == LOG_Running)
			{
				MIS_Dar_BringOrcEliteRing = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,BAU_4300_Addon_Cavalorn))
		{
			if(MIS_Addon_Cavalorn_TheHut == LOG_Running)
			{
				MIS_Addon_Cavalorn_TheHut = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,SLD_803_Cipher))
		{
			if(MIS_Cipher_Paket == LOG_Running)
			{
				MIS_Cipher_Paket = LOG_FAILED;
			};
			if(MIS_Cipher_BringWeed == LOG_Running)
			{
				MIS_Cipher_BringWeed = LOG_FAILED;
			};
		};
		if(Greg_Rejected == TRUE)
		{
			if(slf.aivar[AIV_SubGuild] == GIL_SUB_Dexter)
			{
				DexterBanditsBodyCount += 1;
				if(DexterBanditsBodyCount >= 19)
				{
					B_Greg_ComesToDexterLater();
				};
			};
		};
	}
	else if(CurrentLevel == OLDWORLD_ZEN)
	{
		if(C_IsNpc(slf,PC_ThiefOW))
		{
			Diego_IsDead = TRUE;
		}
		else if(C_IsNpc(slf,STRF_1116_Kervo))
		{
			if(MIS_Kervo_KillLurker == LOG_Running)
			{
				MIS_Kervo_KillLurker = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,VLK_4130_Talbin))
		{
			if(MIS_Talbin_Runs == LOG_Running)
			{
				MIS_Talbin_Runs = LOG_OBSOLETE;
			};
			if(MIS_TalbinCheese == LOG_Running)
			{
				MIS_TalbinCheese = LOG_OBSOLETE;
			};
		}
		else if(C_IsNpc(slf,PAL_251_Oric))
		{
			if(MIS_OricBruder == LOG_Running)
			{
				MIS_OricBruder = LOG_FAILED;
			};
			if(MIS_KillHoshPak == LOG_Running)
			{
				MIS_KillHoshPak = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,VLK_4120_Bilgot))
		{
			if(MIS_RescueBilgot == LOG_Running)
			{
				MIS_RescueBilgot = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,DJG_703_Cipher))
		{
			if(MIS_Cipher_Paket == LOG_Running)
			{
				MIS_Cipher_Paket = LOG_FAILED;
			};
			if(MIS_Cipher_BringWeed == LOG_Running)
			{
				MIS_Cipher_BringWeed = LOG_FAILED;
			};
		};
	}
	else if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if(MissingPeopleReturnedHome == FALSE)
		{
			if(C_IsNpc(slf,STRF_1118_Addon_Patrick))
			{
				Patrick_DiedInADW = TRUE;
			}
			else if(C_IsNpc(slf,STRF_1119_Addon_Monty))
			{
				Monty_DiedInADW = TRUE;
			}
			else if(C_IsNpc(slf,STRF_1120_Addon_Tonak))
			{
				Tonak_DiedInADW = TRUE;
			}
			else if(C_IsNpc(slf,STRF_1121_Addon_Telbor))
			{
				Telbor_DiedInADW = TRUE;
			}
			else if(C_IsNpc(slf,STRF_1122_Addon_Pardos))
			{
				Pardos_DiedInADW = TRUE;
			};
		};
		if(C_IsNpc(slf,PIR_1352_Addon_AlligatorJack))
		{
			if(MIS_KrokoJagd == LOG_Running)
			{
				MIS_KrokoJagd = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,PIR_1353_Addon_Morgan))
		{
			if(MIS_AlligatorJack_BringMeat == LOG_Running)
			{
				MIS_AlligatorJack_BringMeat = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,PIR_1355_Addon_Skip))
		{
			if((MIS_Addon_Baltram_Paket4Skip == LOG_Running) && (Skip_Rum4Baltram == FALSE))
			{
				MIS_Addon_Baltram_Paket4Skip = LOG_FAILED;
			};
			if(MIS_ADDON_SkipsGrog == LOG_Running)
			{
				MIS_ADDON_SkipsGrog = LOG_OBSOLETE;
			};
		}
		else if(C_IsNpc(slf,PIR_1366_Addon_Brandon))
		{
			if(MIS_Brandon_BringHering == LOG_Running)
			{
				MIS_Brandon_BringHering = LOG_OBSOLETE;
			};
		}
		else if(C_IsNpc(slf,BDT_1075_Addon_Fortuno))
		{
			if(MIS_Fortuno_Delusion == LOG_Running)
			{
				MIS_Fortuno_Delusion = LOG_FAILED;
			};
		}
		else if(C_IsNpc(slf,BDT_1093_Addon_Franco))
		{
			if(MIS_HlpLogan == LOG_Running)
			{
				MIS_HlpLogan = LOG_OBSOLETE;
			};
			if(MIS_HlpEdgor == LOG_Running)
			{
				MIS_HlpEdgor = LOG_OBSOLETE;
			};
		}
		else if(C_IsNpc(slf,BDT_1091_Addon_Lucia))
		{
			MIS_LookingForLucia = LOG_OBSOLETE;
		}
		else if(C_IsNpc(slf,BDT_1084_Addon_Senyan))
		{
			Senyan_Erpressung = LOG_OBSOLETE;
		}
		else if(C_IsNpc(slf,BDT_1085_Addon_Bloodwyn))
		{
			B_StartOtherRoutine(Thorus,"TALK");
		};
	}
	else if(CurrentLevel == DRAGONISLAND_ZEN)
	{
		if(C_IsNpc(slf,NOV_600_Pedro_DI))
		{
			SCFoundPedro = TRUE;
		};
	};
	B_CheckLog();
};

func void B_CheckDeadMissionAnimals(var C_Npc slf)
{
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(C_IsNpc(slf,OrcWarrior_Harad))
		{
			CityOrc_Killed_Day = Wld_GetDay();
		};
	}
	else if(CurrentLevel == ADDONWORLD_ZEN)
	{
		if(C_IsNpc(slf,CanyonRazor))
		{
			CanyonRazorBodyCount += 1;
			if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
			{
				B_CountCanyonRazor();
			};
		}
		else if(C_IsNpc(slf,GoldMinecrawler))
		{
			Minecrawler_Killed += 1;
			if((Minecrawler_Killed >= 10) && (Bloodwyn_Spawn == FALSE) && !Npc_IsDead(Bloodwyn))
			{
				AI_Teleport(Bloodwyn,"ADW_MINE_TO_MC_03");
				B_StartOtherRoutine(Bloodwyn,"MINE");
				Bloodwyn_Spawn = TRUE;
			};
		};
	};
};

func void B_CheckDeadMissionNPCs(var C_Npc npc)
{
	if(npc.guild < GIL_SEPERATOR_HUM)
	{
		B_CheckDeadMissionHumans(npc);
	}
	else
	{
		B_CheckDeadMissionAnimals(npc);
	};
};

