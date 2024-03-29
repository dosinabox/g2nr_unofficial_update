
instance DIA_Jorgen_KAP3_EXIT(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 999;
	condition = DIA_Jorgen_KAP3_EXIT_Condition;
	information = DIA_Jorgen_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jorgen_KAP3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jorgen_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jorgen_Hallo(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 4;
	condition = DIA_Jorgen_Hallo_Condition;
	information = DIA_Jorgen_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jorgen_Hallo_Condition()
{
	if((Kapitel == 3) && (MIS_SCKnowsInnosEyeIsBroken == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Hallo_Info()
{
	if((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_00");	//��, ��!
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_01");	//� ����, �� �� ��������� �����.
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_02");	//��, � ���?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_03");	//��� �� ����� ��� ���� �������� ���?
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_04");	//��, �� �����-������ ��� � ���������?
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_05");	//����� ����, � ���?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_06");	//��� ��� ��� �������� �����?
	};
	AI_Output(self,other,"DIA_Jorgen_Hallo_07_07");	//� ������ �� ����, ���� ��� ����.
};


instance DIA_Jorgen_Novice(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 6;
	condition = DIA_Jorgen_Novice_Condition;
	information = DIA_Jorgen_Novice_Info;
	permanent = FALSE;
	description = "���� ���� �� �������� ���������?";
};


func int DIA_Jorgen_Novice_Condition()
{
	if((MIS_NovizenChase == LOG_Running) && (Kapitel == 3) && (MIS_SCKnowsInnosEyeIsBroken == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Novice_Info()
{
	DIA_Common_NovicePassedBy();
	if((Npc_GetDistToWP(self,"NW_MONASTERY_BRIDGE_01") <= 250) && Wld_IsFPAvailable(self,"LOOKOUT"))
	{
		AI_Output(self,other,"DIA_Jorgen_Novice_07_01");	//��, �������, �� ������� ����.
		AI_StopLookAt(self);
		AI_GotoFP(self,"LOOKOUT");
		AI_AlignToFP(self);
		AI_PlayAni(self,"T_GREETCOOL");
		AI_TurnToNpc(self,other);
	};
	AI_Output(self,other,"DIA_Jorgen_Novice_07_02");	//�� ������� � ���� � ����� � ������ ���, ��� ����� �� ��� ������� �����.
};


instance DIA_Jorgen_Milten(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 5;
	condition = DIA_Jorgen_Milten_Condition;
	information = DIA_Jorgen_Milten_Info;
	permanent = FALSE;
	description = "���� �� ����� � ���������, ���� ����� ���������� � ��������.";
};


func int DIA_Jorgen_Milten_Condition()
{
	if((Kapitel == 3) && (MIS_SCKnowsInnosEyeIsBroken == FALSE) && (MIS_OLDWORLD == LOG_SUCCESS) && (MiltenNW.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Milten_Info()
{
	AI_Output(other,self,"DIA_Jorgen_Milten_15_00");	//���� �� ����� � ���������, ���� ����� ���������� � ��������. �� ��������� ������ ������ ����.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_01");	//��� �� �������, ���� ������ ����?
	AI_Output(other,self,"DIA_Jorgen_Milten_15_02");	//��������. �� ��� ������-�� ������ ����������� ���� � ���� ����������.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_03");	//������ ����� ������ - ���� ��� ����. ��� ������ ����� ����� ���, � �� ��� ����� �������� ����������� ���� � ��������.
};


instance DIA_Jorgen_Home(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 7;
	condition = DIA_Jorgen_Home_Condition;
	information = DIA_Jorgen_Home_Info;
	description = "������ ��?";
};


func int DIA_Jorgen_Home_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Home_Info()
{
	AI_Output(other,self,"DIA_Jorgen_Home_15_00");	//������ ��?
	AI_Output(self,other,"DIA_Jorgen_Home_07_01");	//� ��� ��������� �������� ����������� �����, ������. ��� ��� - ����.
	AI_Output(self,other,"DIA_Jorgen_Home_07_02");	//��� �������, '���������', ��� �������� �������� ��������� ������� �����, � ��� ������ � �� ���� �����.
	AI_Output(self,other,"DIA_Jorgen_Home_07_03");	//� ����� ����� �������� ����� ����� � ����, �� � ��� ���, ��� � ������ ����, �� ����� ����� �� ����� � ���� ��������� ����.
	AI_Output(self,other,"DIA_Jorgen_Home_07_04");	//������������ �������, ����������������� � �������� - ��� ������� ������� ������ ������, � ��� ������ �� �����.
	AI_Output(self,other,"DIA_Jorgen_Home_07_05");	//� ��� ��� ������ ������? � ������ ��� ���� ��� ������. � �������� ��� ���.
};


instance DIA_Jorgen_BeCarefull(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 8;
	condition = DIA_Jorgen_BeCarefull_Condition;
	information = DIA_Jorgen_BeCarefull_Info;
	permanent = TRUE;
	description = "���� ����� ��������� �������� �� �����.";
};


func int DIA_Jorgen_BeCarefull_Condition()
{
	if((Kapitel == 3) && Npc_KnowsInfo(other,DIA_Jorgen_Home))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_BeCarefull_Info()
{
	AI_Output(other,self,"DIA_Jorgen_BeCarefull_15_00");	//���� ����� ��������� �������� �� �����.
	AI_Output(self,other,"DIA_Jorgen_BeCarefull_07_01");	//�� ��������. � ��� �������, ��� ������� ����� ����� ��������� �������� ��������� ���� ����.
};


instance DIA_Jorgen_NEUHIER(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 41;
	condition = DIA_Jorgen_NEUHIER_Condition;
	information = DIA_Jorgen_NEUHIER_Info;
	description = "��� ����� � ���������?";
};


func int DIA_Jorgen_NEUHIER_Condition()
{
	if((Kapitel >= 4) && (JorgenIsCaptain == FALSE) && (JorgenMovedFromKloster == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_NEUHIER_Info()
{
	AI_Output(other,self,"DIA_Jorgen_NEUHIER_15_00");	//��� ����� � ���������?
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_01");	//� ����� ����� � ���!
	if(Npc_KnowsInfo(other,DIA_Jorgen_Milten))
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_02");	//�� ��� ��, ������� �� �����. ������ ������������� ����� ��� �������� ����� �����.
		B_GivePlayerXP(XP_Ambient);
	};
	if(hero.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_03");	//� �������� ���� ������� ����� ���� ������ �������� ������������.
	};
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_04");	//��, � ��� ��� ��� ������? ��� �������� � ������ � ������, ����� �� ��������� ������, ������� ���� ��� ����������.
};


instance DIA_Jorgen_PERM4(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 400;
	condition = DIA_Jorgen_PERM4_Condition;
	information = DIA_Jorgen_PERM4_Info;
	permanent = TRUE;
	description = "� ����, ��� � ���� ��� ����� � �������.";
};


func int DIA_Jorgen_PERM4_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Jorgen_Home) && Npc_KnowsInfo(other,DIA_Jorgen_NEUHIER) && (JorgenIsCaptain == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Jorgen_PERM4_OneTime;

func void DIA_Jorgen_PERM4_Info()
{
	AI_Output(other,self,"DIA_Jorgen_PERM4_15_00");	//� ����, ��� � ���� ��� ����� � �������.
	if((DIA_Jorgen_PERM4_OneTime == FALSE) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Jorgen_PERM4_07_01");	//������ ���������: � ������ ����������� �� ������. ���� ��� ����� ������������ � ������, � ����� � ���.
		DIA_Jorgen_PERM4_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_PERM4_07_02");	//� ��� ���� ����� ������������� ������ ��� ����� ������...
};


instance DIA_Jorgen_BEMYCAPTAIN(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 51;
	condition = DIA_Jorgen_BEMYCAPTAIN_Condition;
	information = DIA_Jorgen_BEMYCAPTAIN_Info;
	permanent = TRUE;
	description = "����� ����, � ����� ���������� ���� ������ ��������.";
};


func int DIA_Jorgen_BEMYCAPTAIN_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == TRUE) && (MIS_PyrokarClearDemonTower != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Jorgen_Home))
	{
		return TRUE;
	};
};


var int DIA_Jorgen_BEMYCAPTAIN_OneTime;

func void DIA_Jorgen_BEMYCAPTAIN_Info()
{
	DIA_Common_MaybeICanOfferYouCaptainJob();
	if(DIA_Jorgen_BEMYCAPTAIN_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_01");	//�� �� ����������� ���� ����, ������? ���� �� �������, ��� ��� ������, � ������ �����.
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_02");	//���... ���� ������ ���� ��������� ��������. � ���� �������� �������� �����������.
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_03");	//��� ���� �� ����� � ��� �� ������, ����� ������. � �� �����, ��� ������� ��� �������� ��� ��� ��� ������ ����.
		B_LogEntry(Topic_Captain,"������ ����� ����� ���� ���������, �� � ������� ������ �������� ��� ���� ����� ����������.");
		DIA_Jorgen_BEMYCAPTAIN_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_04");	//������� ��� ����� ���������� ��� ���� ����� ���������. ������.
};


instance DIA_Jorgen_BEMYCAPTAIN2(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 52;
	condition = DIA_Jorgen_BEMYCAPTAIN2_Condition;
	information = DIA_Jorgen_BEMYCAPTAIN2_Info;
	description = "� ����������� � ������ �������. �� ��������.";
};


func int DIA_Jorgen_BEMYCAPTAIN2_Condition()
{
	if(MIS_PyrokarClearDemonTower == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_BEMYCAPTAIN2_Info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_00");	//� ����������� � ������ �������. �� ��������.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_01");	//������? ��� ���� ������� ���?
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_02");	//���� ����� �� �����.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_03");	//��, �����. ���� ���, �������������, �� ����� �������. ������ ��������������!
	if(DIA_Jorgen_BEMYCAPTAIN_OneTime == TRUE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_04");	//��� ������ ������ ������ �����������? � ���� ��� ���� ����� ��� ����?
		if(SCGotCaptain == TRUE)
		{
			AI_Output(other,self,"DIA_Lee_LeaveMyShip_15_00");	//� ���-���� �� ���� ����� ���� � �����!
			AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_03");	//��� ����� �������� ��� ���� ������ �����. ���������, ���� ��� ���� ������� �������� ������.
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"RausAusKloster");
			B_StartOtherRoutine(Nov610,"Start");
			JorgenMovedFromKloster = TRUE;
		};
	}
	else if(SCGotCaptain == FALSE)
	{
		DIA_Common_MaybeICanOfferYouCaptainJob();
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_01");	//�� �� ����������� ���� ����, ������? ���� �� �������, ��� ��� ������, � ������ �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_05");	//�������. ������ � ���� �������� ������!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RausAusKloster");
		B_StartOtherRoutine(Nov610,"Start");
		JorgenMovedFromKloster = TRUE;
	};
};


instance DIA_Jorgen_BEMYCAPTAIN3(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 53;
	condition = DIA_Jorgen_BEMYCAPTAIN3_Condition;
	information = DIA_Jorgen_BEMYCAPTAIN3_Info;
	description = "���� ���� ���������.";
};


func int DIA_Jorgen_BEMYCAPTAIN3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jorgen_BEMYCAPTAIN2) && (SCGotCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_BEMYCAPTAIN3_Info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_00");	//���� ���� ���������.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_01");	//��� ������� ����� ��� ����, �� � ���� ���� ������� � �������?
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_02");	//������ ��������, ��� ����� �� ������� ���� ���� �������.
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_03");	//������. � ��������, ��� ����� �������. ��� ���� � ������.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_04");	//����, ���.
	AI_StopProcessInfos(self);
	SCGotCaptain = TRUE;
	JorgenIsCaptain = TRUE;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	B_StartOtherRoutine(Nov610,"Start");
	B_GivePlayerXP(XP_Captain_Success);
};


instance DIA_Jorgen_LOSFAHREN(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 59;
	condition = DIA_Jorgen_LOSFAHREN_Condition;
	information = DIA_Jorgen_LOSFAHREN_Info;
	permanent = TRUE;
	description = "�� ����� ��������� ���� �� ������?";
};


func int DIA_Jorgen_LOSFAHREN_Condition()
{
	if((JorgenIsCaptain == TRUE) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_LOSFAHREN_Info()
{
	AI_Output(other,self,"DIA_Jorgen_LOSFAHREN_15_00");	//�� ����� ��������� ���� �� ������?
	if(B_CaptainConditions(self))
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_01");	//�������. ��� ��� �����.
		B_GiveInvItems(other,self,ItWr_Seamap_Irdorath,1);
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_02");	//�������. ������� ������! �� ����������!
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_03");	//���� ����� ������� ��������� ���� ����������. ����� �� ������ � ����, ���� ����� ��� �� �����.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_04");	//� ����� �� ��������� � ������, �� ������ �������. � ����������� ����� ��� ���� ������������ �������. ��������� ����.
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			B_TurnToNpc(self,other);
		};
		AI_StopProcessInfos(self);
		B_CaptainCallsAllOnBoard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_05");	//���� ����� �������, ������� �� ���� ������� � ������� �����, ����� � ��� ��������������� �� ���.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_06");	//�� �� ������ ������� ������, ���� � ��� �� ����� ����� ������������.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Jorgen_PERM5_NOTCAPTAIN(C_Info)
{
	npc = VLK_4250_Jorgen;
	nr = 59;
	condition = DIA_Jorgen_PERM5_NOTCAPTAIN_Condition;
	information = DIA_Jorgen_PERM5_NOTCAPTAIN_Info;
	permanent = TRUE;
	description = "��� ��?";
};


func int DIA_Jorgen_PERM5_NOTCAPTAIN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jorgen_BEMYCAPTAIN2) && (SCGotCaptain == TRUE) && (JorgenIsCaptain == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven;

func void DIA_Jorgen_PERM5_NOTCAPTAIN_Info()
{
	AI_Output(other,self,"DIA_Jorgen_PERM5_NOTCAPTAIN_15_00");	//��� ��?
	if(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_OUT_06") < 1000)
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_01");	//�������. ��� �� ����� ������ �����.
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_02");	//��� ���� ��� ��������� ��������� ����� ����� ����, �� ��� �� ���� ����� ������ �� ����� ������������ � �����, ��� � ���������.
		if(DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven = TRUE;
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_03");	//��� ����� �������� ��� ���� ������ �����. ���������, ���� ��� ���� ������� �������� ������.
		AI_StopProcessInfos(self);
		if(JorgenMovedFromKloster == FALSE)
		{
			Npc_ExchangeRoutine(self,"RausAusKloster");
			B_StartOtherRoutine(Nov610,"Start");
			JorgenMovedFromKloster = TRUE;
		};
	};
};

