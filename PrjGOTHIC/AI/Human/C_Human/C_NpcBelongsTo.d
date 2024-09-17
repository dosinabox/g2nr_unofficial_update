
func int C_NpcBelongsToOldCamp(var C_Npc slf)
{
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Tengron)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Fajeth)))
	{
		return FALSE;
	};
	if((slf.npcType == NPCTYPE_OCMAIN) || (slf.npcType == NPCTYPE_OCAMBIENT))
	{
		if((slf.guild == GIL_VLK) || (slf.guild == GIL_MIL) || (slf.guild == GIL_PAL))
		{
			return TRUE;
		};
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Marcos_Guard1)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Marcos_Guard2)))
	{
		if(MIS_Marcos_Jungs != LOG_SUCCESS)
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int C_NpcBelongsToCity(var C_Npc slf)
{
	if(!C_NpcBelongsToOldCamp(slf))
	{
		if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Tengron)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Fajeth)))
		{
			return FALSE;
		};
		if(slf.npcType == NPCTYPE_OWAMBIENT)
		{
			return FALSE;
		};
		if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Marcos_Guard1)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Marcos_Guard2)))
		{
			return FALSE;
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Sergio))
		{
			return FALSE;
		};
		if((slf.guild == GIL_VLK) || (slf.guild == GIL_MIL) || (slf.guild == GIL_PAL))
		{
			return TRUE;
		};
		if(RosiLocation == LOC_CITY)
		{
			if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Rosi))
			{
				return TRUE;
			};
			if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Till))
			{
				return TRUE;
			};
		};
	};
	return FALSE;
};

func int C_NpcBelongsToMonastery(var C_Npc slf)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Sergio))
	{
		return TRUE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Jorgen)) && (EnterNW_Kapitel4 == TRUE) && (JorgenMovedFromKloster == FALSE))
	{
		return TRUE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Vino)) && (DIA_Vino_Heilung_oneTime == TRUE))
	{
		return TRUE;
	};
	if((slf.guild == GIL_KDF) || (slf.guild == GIL_NOV))
	{
		return TRUE;
	};
	if(RosiLocation == LOC_MONASTERY)
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Rosi))
		{
			return TRUE;
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Till))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int C_CommentMonasteryCrimes(var C_Npc slf)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Pyrokar))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Isgaroth)) && (NOV_Aufnahme == FALSE))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_NpcBelongsToFarm(var C_Npc slf)
{
	if(Rosi_FleeFromSekob_Kap5 == TRUE)
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Rosi))
		{
			return FALSE;
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Till))
		{
			return FALSE;
		};
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Jorgen)) && (JorgenMovedFromKloster == TRUE))
	{
		return TRUE;
	};
	if((slf.guild == GIL_BAU) || (slf.guild == GIL_SLD))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_NpcBelongsToBL(var C_Npc slf)
{
	if((slf.npcType == NPCTYPE_BL_AMBIENT) || (slf.npcType == NPCTYPE_BL_MAIN))
	{
		return TRUE;
	};
	return FALSE;
};

