
func void B_CheckDeadMissionNPCs(var C_Npc slf)
{
	if(MissingPeopleReturnedHome == FALSE)
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Patrick))
		{
			Patrick_DiedInADW = TRUE;
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Monty))
		{
			Monty_DiedInADW = TRUE;
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Tonak))
		{
			Tonak_DiedInADW = TRUE;
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Telbor))
		{
			Telbor_DiedInADW = TRUE;
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Pardos))
		{
			Pardos_DiedInADW = TRUE;
		};
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DiegoOW))
	{
		Diego_IsDead = TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(AlligatorJack))
	{
		if(MIS_KrokoJagd == LOG_Running)
		{
			MIS_KrokoJagd = LOG_FAILED;
		};
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Morgan))
	{
		if(MIS_AlligatorJack_BringMeat == LOG_Running)
		{
			MIS_AlligatorJack_BringMeat = LOG_FAILED;
		};
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Skip))
	{
		if(MIS_ADDON_SkipsGrog == LOG_Running)
		{
			MIS_ADDON_SkipsGrog = LOG_OBSOLETE;
		};
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Brandon))
	{
		if(MIS_Brandon_BringHering == LOG_Running)
		{
			MIS_Brandon_BringHering = LOG_OBSOLETE;
		};
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Kervo))
	{
		if(MIS_Kervo_KillLurker == LOG_Running)
		{
			MIS_Kervo_KillLurker = LOG_FAILED;
		};
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Canthar))
	{
		if(MIS_Canthars_KomproBrief == LOG_Running)
		{
			MIS_Canthars_KomproBrief = LOG_FAILED;
		};
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Fortuno))
	{
		if(MIS_Fortuno_Delusion == LOG_Running)
		{
			MIS_Fortuno_Delusion = LOG_FAILED;
		};
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Fester))
	{
		if(MIS_Fester_KillBugs == LOG_Running)
		{
			MIS_Fester_KillBugs = LOG_FAILED;
		};
	};
	B_CheckLog();
};

