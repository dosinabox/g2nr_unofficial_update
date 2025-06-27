
func void B_JoinShip(var C_Npc slf)
{
	B_SetImmortal(slf);
	if(C_IsNpc(slf,DJG_705_Angar_NW))
	{
		Angar_IsOnBoard = LOG_SUCCESS;
		if(Angar_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Angar_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(C_IsNpc(slf,DJG_713_Biff))
	{
		Biff_IsOnBoard = LOG_SUCCESS;
		if(Biff_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Biff_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(C_IsNpc(slf,PC_Fighter_NW_nach_DJG))
	{
		Gorn_IsOnBoard = LOG_SUCCESS;
		if(Gorn_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Gorn_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(C_IsNpc(slf,PC_Mage_NW))
	{
		MiltenNW_IsOnBoard = LOG_SUCCESS;
		if(MiltenNW_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			MiltenNW_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(C_IsNpc(slf,PC_Psionic))
	{
		Lester_IsOnBoard = LOG_SUCCESS;
		if(Lester_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Lester_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(C_IsNpc(slf,PC_Thief_NW))
	{
		Diego_IsOnBoard = LOG_SUCCESS;
		if(Diego_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Diego_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(C_IsNpc(slf,SLD_800_Lee))
	{
		Lee_IsOnBoard = LOG_SUCCESS;
		if(Lee_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Lee_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(C_IsNpc(slf,SLD_809_Bennet))
	{
		Bennet_IsOnBoard = LOG_SUCCESS;
		if(Bennet_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Bennet_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(C_IsNpc(slf,SLD_811_Wolf))
	{
		Wolf_IsOnBoard = LOG_SUCCESS;
		if(Wolf_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Wolf_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(C_IsNpc(slf,VLK_439_Vatras))
	{
		Vatras_IsOnBoard = LOG_SUCCESS;
		if(Vatras_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Vatras_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(C_IsNpc(slf,VLK_449_Lares))
	{
		Lares_IsOnBoard = LOG_SUCCESS;
		if(Lares_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Lares_WasOnBoard = TRUE;
		};
		Crewmember_Count += 1;
	}
	else if(C_IsNpc(slf,NONE_101_Mario))
	{
		Mario_IsOnBoard = LOG_SUCCESS;
		if(Mario_WasOnBoard == FALSE)
		{
			B_GivePlayerXP(XP_Crewmember_Success);
			Mario_WasOnBoard = TRUE;
		};
		CrewmemberFree_Count += 1;
	}
	else if(C_IsNpc(slf,PAL_207_Girion))
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
	if(C_IsNpc(slf,DJG_713_Biff))
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

