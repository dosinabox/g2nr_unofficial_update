
func void B_CheckDeadMissionNPCs(var C_Npc slf)
{
	if(RemoveSklaven == FALSE)
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
	B_CheckLog();
};

