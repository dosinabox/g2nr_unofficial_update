
func void B_CheckDeadMissionNPCs(var C_Npc slf)
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
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DiegoOW))
	{
		Diego_IsDead = TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ignaz))
	{
		if(MIS_Ignaz_Charm == LOG_Running)
		{
			MIS_Ignaz_Charm = LOG_FAILED;
		};
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(AlligatorJack))
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
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Kervo))
	{
		if(MIS_Kervo_KillLurker == LOG_Running)
		{
			MIS_Kervo_KillLurker = LOG_FAILED;
		};
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Canthar))
	{
		if(MIS_Canthars_KomproBrief == LOG_Running)
		{
			MIS_Canthars_KomproBrief = LOG_FAILED;
		};
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Fortuno))
	{
		if(MIS_Fortuno_Delusion == LOG_Running)
		{
			MIS_Fortuno_Delusion = LOG_FAILED;
		};
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Fester))
	{
		if(MIS_Fester_KillBugs == LOG_Running)
		{
			MIS_Fester_KillBugs = LOG_FAILED;
		};
	}
	else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cipher)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DJG_Cipher)))
	{
		if(MIS_Cipher_Paket == LOG_Running)
		{
			MIS_Cipher_Paket = LOG_FAILED;
		};
		if(MIS_Cipher_BringWeed == LOG_Running)
		{
			MIS_Cipher_BringWeed = LOG_FAILED;
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
	else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Sergio)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Babo)))
	{
		if(Babo_Training == FALSE)
		{
			Log_SetTopicStatus(Topic_BaboTrain,LOG_FAILED);
		};
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Senyan))
	{
		Senyan_Erpressung = LOG_OBSOLETE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(TalbinNW))
	{
		if(MIS_Talbin_Runs == LOG_Running)
		{
			MIS_Talbin_Runs = LOG_FAILED;
		};
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Talbin))
	{
		if(MIS_Talbin_Runs == LOG_Running)
		{
			MIS_Talbin_Runs = LOG_OBSOLETE;
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
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Salandril))
	{
		if((SC_KnowsProspektorSalandril == TRUE) && (Log_SalandrilIsDead == FALSE))
		{
			B_LogEntry(TOPIC_MinenAnteileKDF,"Саландрил мертв. Мне нужно сообщить это Серпентесу.");
			Log_SalandrilIsDead = TRUE;
		};
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cassia))
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
		if(MIS_BengarsHelpingSLD == LOG_Running)
		{
			MIS_BengarsHelpingSLD = LOG_FAILED;
		};
	};
	B_CheckLog();
};

