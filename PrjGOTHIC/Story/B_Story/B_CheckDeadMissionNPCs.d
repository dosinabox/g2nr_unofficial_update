
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
	};
	B_CheckLog();
};

func void B_UpdateKilledStats(var C_Npc slf)
{
	if(slf.guild == GIL_DRACONIAN)
	{
		Stats_Killed_Draconian += 1;
	}
	else if(slf.guild == GIL_DMT)
	{
		Stats_Killed_Dementor += 1;
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_ORCELITE)
	{
		Stats_Killed_OrcElite += 1;
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_ORCCOMMANDER)
	{
		Stats_Killed_OrcCommander += 1;
	};
};

