
func int C_NpcBelongsToOldCamp(var C_Npc slf)
{
	if(C_IsNpc(slf,PAL_280_Tengron) || C_IsNpc(slf,PAL_281_Fajeth))
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
	if(C_IsNpc(slf,PAL_253_Wache) || C_IsNpc(slf,PAL_257_Ritter))
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
	if(C_NpcBelongsToOldCamp(slf))
	{
		return FALSE;
	};
	if(C_IsNpc(slf,PAL_280_Tengron) || C_IsNpc(slf,PAL_281_Fajeth))
	{
		return FALSE;
	};
	if(slf.npcType == NPCTYPE_OWAMBIENT)
	{
		return FALSE;
	};
	if(C_IsNpc(slf,PAL_253_Wache) || C_IsNpc(slf,PAL_257_Ritter))
	{
		return FALSE;
	};
	if(C_IsNpc(slf,PAL_299_Sergio))
	{
		return FALSE;
	};
	if((slf.guild == GIL_VLK) || (slf.guild == GIL_MIL) || (slf.guild == GIL_PAL))
	{
		return TRUE;
	};
	if(RosiLocation == LOC_NW_CITY)
	{
		if(C_IsNpc(slf,BAU_936_Rosi))
		{
			return TRUE;
		};
		if(C_IsNpc(slf,BAU_931_Till))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int C_NpcBelongsToMonastery(var C_Npc slf)
{
	if(C_IsNpc(slf,PAL_299_Sergio))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,VLK_4250_Jorgen) && (EnterNW_Kapitel4 == TRUE) && (JorgenMovedFromKloster == FALSE))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,BAU_952_Vino) && (DIA_Vino_Heilung_oneTime == TRUE))
	{
		return TRUE;
	};
	if((slf.guild == GIL_KDF) || (slf.guild == GIL_NOV))
	{
		return TRUE;
	};
	if(RosiLocation == LOC_NW_MONASTERY)
	{
		if(C_IsNpc(slf,BAU_936_Rosi))
		{
			return TRUE;
		};
		if(C_IsNpc(slf,BAU_931_Till))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int C_CommentMonasteryCrimes(var C_Npc slf)
{
	if(C_IsNpc(slf,KDF_500_Pyrokar))
	{
		return FALSE;
	};
	if(C_IsNpc(slf,KDF_509_Isgaroth) && (NOV_Aufnahme == FALSE))
	{
		return FALSE;
	};
	return TRUE;
};

func int C_NpcBelongsToFarm(var C_Npc slf)
{
	if(C_IsNpc(slf,BAU_4300_Addon_Cavalorn))
	{
		return FALSE;
	};
	if(C_IsNpc(slf,BAU_961_Gaan))
	{
		return FALSE;
	};
	if(C_IsNpc(slf,BAU_970_Orlan))
	{
		return FALSE;
	};
	if(Rosi_FleeFromSekob_Kap5 == TRUE)
	{
		if(C_IsNpc(slf,BAU_936_Rosi))
		{
			return FALSE;
		};
		if(C_IsNpc(slf,BAU_931_Till))
		{
			return FALSE;
		};
	};
	if(C_IsNpc(slf,VLK_4250_Jorgen) && (JorgenMovedFromKloster == TRUE))
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

