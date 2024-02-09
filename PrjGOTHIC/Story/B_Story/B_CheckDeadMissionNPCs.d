
func void B_CheckDeadMissionHumans(var C_Npc slf)
{
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ignaz))
		{
			if(MIS_Ignaz_Charm == LOG_Running)
			{
				MIS_Ignaz_Charm = LOG_FAILED;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Dexter))
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
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Canthar))
		{
			if(MIS_Canthars_KomproBrief == LOG_Running)
			{
				MIS_Canthars_KomproBrief = LOG_FAILED;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Baltram))
		{
			if(MIS_Addon_Baltram_Paket4Skip == LOG_Running)
			{
				MIS_Addon_Baltram_Paket4Skip = LOG_FAILED;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Hanna))
		{
			if(MIS_HannaRetrieveLetter == LOG_Running)
			{
				MIS_HannaRetrieveLetter = LOG_FAILED;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Schiffswache_212))
		{
			if(Npc_IsDead(Schiffswache_213))
			{
				MIS_ShipIsFree = TRUE;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Schiffswache_213))
		{
			if(Npc_IsDead(Schiffswache_212))
			{
				MIS_ShipIsFree = TRUE;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Fester))
		{
			if(MIS_Fester_KillBugs == LOG_Running)
			{
				MIS_Fester_KillBugs = LOG_FAILED;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(TalbinNW))
		{
			if(MIS_Talbin_Runs == LOG_Running)
			{
				MIS_Talbin_Runs = LOG_FAILED;
			};
		}
		else if(C_IAmThiefFromSewer(slf))
		{
			if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cassia))
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
			else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ramirez))
			{
				if(MIS_RamirezSextant == LOG_Running)
				{
					MIS_RamirezSextant = LOG_FAILED;
				};
			};
			DG_gefunden = TRUE;
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Isgaroth))
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
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Sergio))
		{
			if(MIS_Babo_Training == LOG_Running)
			{
				MIS_Babo_Training = LOG_FAILED;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Dyrian))
		{
			if(MIS_HelpDyrian == LOG_Running)
			{
				MIS_HelpDyrian = LOG_FAILED;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Opolos))
		{
			if(MIS_HelpOpolos == LOG_Running)
			{
				MIS_HelpOpolos = LOG_FAILED;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Babo))
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
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Rukhar))
		{
			MIS_Rukhar_Wettkampf = LOG_OBSOLETE;
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gaan))
		{
			if(MIS_Gaan_Snapper == LOG_Running)
			{
				MIS_Gaan_Snapper = LOG_OBSOLETE;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Buster))
		{
			if(MIS_Buster_KillShadowbeasts_DJG == LOG_Running)
			{
				MIS_Buster_KillShadowbeasts_DJG = LOG_FAILED;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Salandril))
		{
			if((SC_KnowsProspektorSalandril == TRUE) && (Log_SalandrilIsDead == FALSE))
			{
				B_LogEntry(TOPIC_MinenAnteileKDF,"Саландрил мертв. Мне нужно сообщить это Серпентесу.");
				Log_SalandrilIsDead = TRUE;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Elvrich))
		{
			if(MIS_LuciasLetter == LOG_Running)
			{
				MIS_LuciasLetter = LOG_FAILED;
			};
			Elvrich_IsDead = TRUE;
		}
		else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Malak)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Bengar)))
		{
			if(MIS_GetMalakBack == LOG_Running)
			{
				MIS_GetMalakBack = LOG_FAILED;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(SLD_Wolf))
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
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Pepe))
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
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Skip_NW))
		{
			if((MIS_Addon_Baltram_Paket4Skip == LOG_Running) && (Skip_Rum4Baltram == FALSE))
			{
				MIS_Addon_Baltram_Paket4Skip = LOG_FAILED;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Dar))
		{
			if(MIS_Dar_BringOrcEliteRing == LOG_Running)
			{
				MIS_Dar_BringOrcEliteRing = LOG_FAILED;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cipher))
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
			if(C_AmIDexterBandit(slf))
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
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DiegoOW))
		{
			Diego_IsDead = TRUE;
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Kervo))
		{
			if(MIS_Kervo_KillLurker == LOG_Running)
			{
				MIS_Kervo_KillLurker = LOG_FAILED;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Talbin))
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
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Bilgot))
		{
			if(MIS_RescueBilgot == LOG_Running)
			{
				MIS_RescueBilgot = LOG_FAILED;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DJG_Cipher))
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
			if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Patrick))
			{
				Patrick_DiedInADW = TRUE;
			}
			else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Monty))
			{
				Monty_DiedInADW = TRUE;
			}
			else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Tonak))
			{
				Tonak_DiedInADW = TRUE;
			}
			else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Telbor))
			{
				Telbor_DiedInADW = TRUE;
			}
			else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Pardos))
			{
				Pardos_DiedInADW = TRUE;
			};
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(AlligatorJack))
		{
			if(MIS_KrokoJagd == LOG_Running)
			{
				MIS_KrokoJagd = LOG_FAILED;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Morgan))
		{
			if(MIS_AlligatorJack_BringMeat == LOG_Running)
			{
				MIS_AlligatorJack_BringMeat = LOG_FAILED;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Skip))
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
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Brandon))
		{
			if(MIS_Brandon_BringHering == LOG_Running)
			{
				MIS_Brandon_BringHering = LOG_OBSOLETE;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Fortuno))
		{
			if(MIS_Fortuno_Delusion == LOG_Running)
			{
				MIS_Fortuno_Delusion = LOG_FAILED;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Franco))
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
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lucia))
		{
			MIS_LookingForLucia = LOG_OBSOLETE;
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Senyan))
		{
			Senyan_Erpressung = LOG_OBSOLETE;
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Bloodwyn))
		{
			B_StartOtherRoutine(Thorus,"TALK");
		};
	}
	else if(CurrentLevel == DRAGONISLAND_ZEN)
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Pedro_DI))
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
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(CityOrc))
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

