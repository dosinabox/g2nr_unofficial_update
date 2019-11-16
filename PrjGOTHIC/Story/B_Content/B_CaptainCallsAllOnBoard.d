
func void B_CaptainCallsAllOnBoard(var C_Npc Captain)
{
//	B_GiveInvItems(hero,Captain,ItWr_Seamap_Irdorath,1);
	CreateInvItems(Captain,ItKe_Ship_Levelchange_MIS,1);
	B_GiveInvItems(Captain,other,ItKe_Ship_Levelchange_MIS,1);
	B_StartOtherRoutine(Captain,"AllOnBoard");
	if(Lee_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Lee,"Ship");
	};
	if(MiltenNW_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(MiltenNW,"Ship");
	};
	if(Lester_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Lester,"Ship");
	};
	if(Gorn_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(GornNW_nach_DJG,"Ship");
	};
	if(Mario_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Mario,"Ship");
	};
	if(Wolf_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(SLD_Wolf,"Ship");
	};
	if(Lares_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Lares,"Ship");
	};
	if(Bennet_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Bennet,"Ship");
	};
	if(Diego_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(DiegoNW,"Ship");
	};
	if(Biff_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Biff_NW,"Ship");
	};
	if(Vatras_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Vatras,"Ship");
	};
	if(Angar_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Angar_NW,"Ship");
	};
	if(Girion_IsOnBoard == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Girion,"Ship");
	};
	MIS_ReadyforChapter6 = TRUE;
	B_CheckLog();
};

func void B_JoinShip(var C_Npc slf)
{
	slf.flags = NPC_FLAG_IMMORTAL;
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
		Npc_ExchangeRoutine(slf,"RunsToPass");
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

