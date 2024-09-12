
func void B_JoinShip(var C_Npc slf)
{
	B_SetImmortal(slf);
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Angar_NW))
	{
		Angar_IsOnBoard = LOG_SUCCESS;
		if(Angar_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Angar_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Biff))
	{
		Biff_IsOnBoard = LOG_SUCCESS;
		if(Biff_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Biff_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GornNW_nach_DJG))
	{
		Gorn_IsOnBoard = LOG_SUCCESS;
		if(Gorn_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Gorn_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(MiltenNW))
	{
		MiltenNW_IsOnBoard = LOG_SUCCESS;
		if(MiltenNW_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			MiltenNW_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lester))
	{
		Lester_IsOnBoard = LOG_SUCCESS;
		if(Lester_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Lester_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DiegoNW))
	{
		Diego_IsOnBoard = LOG_SUCCESS;
		if(Diego_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Diego_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lee))
	{
		Lee_IsOnBoard = LOG_SUCCESS;
		if(Lee_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Lee_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Bennet))
	{
		Bennet_IsOnBoard = LOG_SUCCESS;
		if(Bennet_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Bennet_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(SLD_Wolf))
	{
		Wolf_IsOnBoard = LOG_SUCCESS;
		if(Wolf_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Wolf_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Vatras))
	{
		Vatras_IsOnBoard = LOG_SUCCESS;
		if(Vatras_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Vatras_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lares))
	{
		Lares_IsOnBoard = LOG_SUCCESS;
		if(Lares_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Lares_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mario))
	{
		Mario_IsOnBoard = LOG_SUCCESS;
		if(Mario_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Mario_WasOnBoard = TRUE;
		};
		CrewmemberFree_Count += 1;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Girion))
	{
		Girion_IsOnBoard = LOG_SUCCESS;
		if(Girion_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Girion_WasOnBoard = TRUE;
		};
		CrewmemberFree_Count += 1;
	};
	AI_StopProcessInfos(slf);
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Biff))
	{
		Npc_ExchangeRoutine(slf,"RUNSTOPASS");
	}
	else if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(slf,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(slf,"WAITFORSHIP");
	};
};

