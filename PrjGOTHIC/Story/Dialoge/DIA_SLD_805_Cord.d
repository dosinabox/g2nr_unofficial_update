
instance DIA_Cord_EXIT(C_Info)
{
	npc = SLD_805_Cord;
	nr = 999;
	condition = DIA_Cord_EXIT_Condition;
	information = DIA_Cord_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cord_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cord_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cord_MeetingIsRunning(C_Info)
{
	npc = SLD_805_Cord;
	nr = 1;
	condition = DIA_Addon_Cord_MeetingIsRunning_Condition;
	information = DIA_Addon_Cord_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Cord_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		return TRUE;
	};
};


var int DIA_Addon_Cord_MeetingIsRunning_OneTime;

func void DIA_Addon_Cord_MeetingIsRunning_Info()
{
	if(DIA_Addon_Cord_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_00");	//����� ���������� � ������ ����, ����.
		DIA_Addon_Cord_MeetingIsRunning_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_01");	//�� ������ ���������� � ��������...
	AI_StopProcessInfos(self);
};


instance DIA_Cord_Hallo(C_Info)
{
	npc = SLD_805_Cord;
	nr = 2;
	condition = DIA_Cord_Hallo_Condition;
	information = DIA_Cord_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cord_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (other.guild == GIL_NONE) && (MIS_Addon_Lares_ComeToRangerMeeting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Cord_Hallo_Info()
{
	AI_Output(self,other,"DIA_Cord_Hallo_14_00");	//���� � ���� �������� � ������� ��� �������� ���������, �������� � ����� �� ��������� ��������.
	AI_Output(self,other,"DIA_Cord_Hallo_14_01");	//� �� ��� �� ������ ����������, ����� �������� ��������.
	AI_Output(other,self,"DIA_Cord_Hallo_15_02");	//���?
	AI_Output(self,other,"DIA_Cord_Hallo_14_03");	//����� ��, ���������, ����������� �� ���, �� ������ ������� ����� �� � ��� �� �������� ������.
	AI_Output(other,self,"DIA_Cord_Hallo_15_04");	//� �� ����������.
	AI_Output(self,other,"DIA_Cord_Hallo_14_05");	//��? � ���� �� �� ������?
};


func void B_Cord_BeBetter()
{
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_14");	//���� �� ���� ������ ���������� � �������, � ���� ����� �� �����!
};

func void DIA_Cord_Approve()
{
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_10");	//��, �� ������� ����, �� �� ������� �������. ������. � ���������� �� ����.
};

var int Cord_SchonmalGefragt;
var int DIA_Cord_WannaJoin_Once;

instance DIA_Cord_WannaJoin(C_Info)
{
	npc = SLD_805_Cord;
	nr = 5;
	condition = DIA_Cord_WannaJoin_Condition;
	information = DIA_Cord_WannaJoin_Info;
	permanent = TRUE;
	description = "� ���� ����� ���������!";
};


func int DIA_Cord_WannaJoin_Condition()
{
	if((Cord_Voted == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Cord_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Cord_WannaJoin_15_00");	//� ���� ����� ���������!
	if(DIA_Cord_Teacher_permanent == FALSE)
	{
		if(Cord_SchonmalGefragt == FALSE)
		{
			if(MIS_Addon_Lares_ComeToRangerMeeting != LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Cord_WannaJoin_14_01");	//�� ������ ����� �� ����, ��� ��� ������ �������� �� ����, ������.
			};
			AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//�� ������ ���������� � �������?
			Cord_SchonmalGefragt = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Cord_WannaJoin_14_03");	//�� ������� ���� ������?
		};
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_04");	//����, ��� ������ ����������� ������?
		if(TeacherCanTrainTalent(NPC_TALENT_1H,TeachCondition_Cord))
		{
			AI_Output(other,self,"DIA_Cord_WannaJoin_15_05");	//� �� ��� �� ���� � ����.
		}
		else
		{
			AI_Output(other,self,"DIA_Cord_WannaJoin_15_06");	//���-�-���...
		};
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_07");	//� ��� ������ ���������� ������?
		if(TeacherCanTrainTalent(NPC_TALENT_2H,TeachCondition_Cord))
		{
			AI_Output(other,self,"DIA_Cord_WannaJoin_15_08");	//� ���� ���������� � ���.
		}
		else
		{
			AI_Output(other,self,"DIA_Cord_WannaJoin_15_09");	//� ����� � ����� ��� �����!
		};
	};
	if(TeacherCanTrainTalent(NPC_TALENT_1H,TeachCondition_Cord) || TeacherCanTrainTalent(NPC_TALENT_2H,TeachCondition_Cord) || (DIA_Cord_Teacher_permanent == TRUE))
	{
		DIA_Cord_Approve();
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_11");	//���� ���� ��� ���-�� ����� �����, �� ������ �������� � ����.
		Cord_Voted = TRUE;
		B_GivePlayerXP(XP_Cord_Voted);
		if(Torlof_GenugStimmen == FALSE)
		{
			Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
		};
		B_LogEntry(TOPIC_SLDRespekt,"����� ����� � ���� � �������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_12");	//������� �������: �� ������� �������!
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_13");	//��, ��������, ������ ���� �������, ��� ����� ������� ���������� �� ����� ���������. �� ����� ������� ���� �����.
		SCKnowsSLDVotes = TRUE;
		B_Cord_BeBetter();
		if(DIA_Cord_WannaJoin_Once == FALSE)
		{
			Log_CreateTopic(TOPIC_CordProve,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CordProve,LOG_Running);
			B_LogEntry(TOPIC_CordProve,"���� ����������� �� ����, ����� � ������� ��������� �����.");
			DIA_Cord_WannaJoin_Once = TRUE;
		};
	};
};


instance DIA_Addon_Cord_YouAreRanger(C_Info)
{
	npc = SLD_805_Cord;
	nr = 2;
	condition = DIA_Addon_Cord_YouAreRanger_Condition;
	information = DIA_Addon_Cord_YouAreRanger_Info;
	description = "�������, �� ������������ � ������ ����?";
};


func int DIA_Addon_Cord_YouAreRanger_Condition()
{
	if(RangerHelp_gildeSLD == TRUE)
	{
		return TRUE;
	}
	else if(SC_KnowsCordAsRangerFromLee == TRUE)
	{
		return TRUE;
	}
	else if(MIS_Addon_Lares_ComeToRangerMeeting == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_00");	//�������, �� ������������ � ������ ����?
	if(MIS_Addon_Lares_ComeToRangerMeeting != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_01");	//��� �� ����� �� ������ �������� �� ����� ���� ��������� ���?
		if(SC_KnowsCordAsRangerFromLee == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_02");	//��� ������ ��.
		};
		if(RangerHelp_gildeSLD == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_03");	//����� ������, ��� �� �������� ���, ���� � �����, ��� �� ���� ���� ��� ���� �����.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_04");	//(��������) ������, ��� ������ ��� �������� �������� � �����, ���?
	AI_Output(self,other,"DIA_Addon_Cord_Add_14_01");	//�� ������, ��� ���� �����?
	if(MIS_Addon_Lares_ComeToRangerMeeting != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_06");	//� ������ ������� ��� ���, ��� �� ��� �������. ������ ���, ���� ��� �� ���������� ��, ��� � ������, � � ���� ���� �����.
	};
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"�� ����� ���� ��� ������ �� �����. � � ��� ���������.",DIA_Addon_Cord_YouAreRanger_nix);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"��� ����� ���� �����.",DIA_Addon_Cord_YouAreRanger_ruestung);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"��� ����� ���� ������!",DIA_Addon_Cord_YouAreRanger_waffe);
	if((Cord_Approved == FALSE) && (Cord_RangerHelp_Fight == FALSE))
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"����� ���� ���������.",DIA_Addon_Cord_YouAreRanger_kampf);
	};
	if(hero.guild == GIL_NONE)
	{
		if((SCKnowsSLDVotes == TRUE) && (Cord_Voted == FALSE))
		{
			Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"�� ������������ �� ����?",DIA_Addon_Cord_YouAreRanger_vote);
		};
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"����� ������. � ���� ������ ���� ����� �� ���� �����.",DIA_Addon_Cord_YouAreRanger_weg);
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"�� �� ��� ������ ��� ����� ���������.",DIA_Addon_Cord_YouAreRanger_SLDAufnahme);
	};
	if(MIS_Addon_Lares_ComeToRangerMeeting != LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"������� ��� �� ��������.",DIA_Addon_Cord_YouAreRanger_Gold);
	};
};


var int Cord_SC_Dreist;

func void B_DIA_Addon_Cord_YouAreRanger_WARN()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_WARN_14_00");	//(���������) � ���� ����, ���� ��� ������ ��������, ��� �� ����������� ����. ������������ ������ � ������������ ���, �������?
};

func void B_DIA_Addon_Cord_YouAreRanger_FRESSE()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_FRESSE_14_00");	//(� ������) �� ������! �� ���� ��� �� ����� ������� ������. � ����� �� ���� ����.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	if(Cord_Voted_Trick == TRUE)
	{
		Cord_Voted = FALSE;
	};
	if(Cord_RangerHelp_Fight_Trick == TRUE)
	{
		Cord_RangerHelp_Fight = FALSE;
	};
	Cord_RangerHelp_GetSLD = FALSE;
	TOPIC_End_RangerHelpSLD = TRUE;
	B_CheckLog();
};

func void DIA_Addon_Cord_YouAreRanger_ruestung()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_ruestung_15_00");	//��� ����� ���� �����.
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_ruestung_14_01");	//������� ��� ��� ��� - � ���� �������� �������� ���� ���� � �����.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_waffe()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Add_15_00");	//��� ����� ���� ������!
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_03");	//(���������) �������?
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_02");	//(������) ����� �������� ��� �������!
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_weg()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_weg_15_00");	//����� ������. � ���� ������ ���� ����� �� ���� �����.
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_weg_14_01");	//�� ���� �� ����, �����, ����� � ��������� ���� ��� �����.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

var int DIA_Addon_Cord_YouAreRanger_SCGotOffer;

func void DIA_Cord_And()
{
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_01");	//�?
};

func void DIA_Cord_WhatElse()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_kampf_14_01");	//������. ��� ���?
};

func void DIA_Addon_Cord_YouAreRanger_vote()
{
	AI_Output(other,self,"DIA_Sentenza_Vote_15_00");	//�� ������������ �� ����?
	if(MIS_Addon_Lares_ComeToRangerMeeting == LOG_SUCCESS)
	{
		DIA_Cord_Approve();
		DIA_Cord_And();
	}
	else
	{
		DIA_Cord_WhatElse();
	};
	Cord_Voted = TRUE;
	Cord_Voted_Trick = TRUE;
	if(Torlof_GenugStimmen == FALSE)
	{
		Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
	};
	B_LogEntry(TOPIC_SLDRespekt,"����� ����� � ���� � �������.");
	if(DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"��� ���.",DIA_Addon_Cord_YouAreRanger_reicht);
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_kampf()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_kampf_15_00");	//����� ���� ���������.
	DIA_Cord_WhatElse();
	Cord_RangerHelp_Fight = TRUE;
	Cord_RangerHelp_Fight_Trick = TRUE;
	if(DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"��� ���.",DIA_Addon_Cord_YouAreRanger_reicht);
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_SLDAufnahme()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_15_00");	//�� �� ��� ������ ��� ����� ���������.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_14_01");	//(�������) ��� �������. �����, � ���������. ��� ���?
	Cord_RangerHelp_GetSLD = TRUE;
	if(DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"��� ���.",DIA_Addon_Cord_YouAreRanger_reicht);
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_Gold()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Gold_15_00");	//������� ��� �� ��������.
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_Gold_14_01");	//��� ���? ���� �� �������. � �� ���, ���� ����� �������������, ��������.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_nix()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_nix_15_00");	//�� ����� ���� ��� ������ �� �����. � � ��� ���������.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_nix_14_01");	//��� �������.
	B_DIA_Addon_Cord_YouAreRanger_WARN();
	if(Cord_Voted_Trick == TRUE)
	{
		Cord_Voted = FALSE;
	};
	if(Cord_RangerHelp_Fight_Trick == TRUE)
	{
		Cord_RangerHelp_Fight = FALSE;
	};
	Cord_RangerHelp_GetSLD = FALSE;
	TOPIC_End_RangerHelpSLD = TRUE;
	B_CheckLog();
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
};

func void DIA_Addon_Cord_YouAreRanger_reicht()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_reicht_15_00");	//��� ���.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_reicht_14_01");	//��, ��� �� ������.
	B_DIA_Addon_Cord_YouAreRanger_WARN();
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
};


var int DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm;

func void B_Cord_RangerHelpObsolete()
{
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_00");	//� ��� ����������� �� ����.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_01");	//� ����� ������, � �� ����� ���� ������.
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_02");	//��� �� ������ � ����?
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_03");	//� ���� � ����, ��� �� ����� ���� ������.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_04");	//��� �� ������, ����� � ����� ������ �� ������� �������� � ���, ��� �� ������ � ��� ��������������?
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_05");	//���� ���� �������� �������� ������.
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
	TOPIC_End_RangerHelpSLD = TRUE;
	B_CheckLog();
};

func void B_Cord_ComeLaterWhenDone()
{
	AI_Output(self,other,"DIA_Addon_Cord_ComeLaterWhenDone_14_00");	//��� ��� ������. �������� ���, � ����������� �� ���.
	AI_StopProcessInfos(self);
};

func void B_Cord_IDoItForYou()
{
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_00");	//�������. ��� �, ��� ������. ����������� ������, � ��� ����� �������.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_01");	//�� �� ��� ���� �������� ���-��� ��� ���� �������.
	AI_Output(other,self,"DIA_Addon_Cord_IDoItForYou_15_02");	//� ��� �� ������?
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_03");	//�������� ������, � ������ �� ���-�������, ���������� ��������� ���������� ������.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_04");	//���� ������ �� ������� �� ���-������, �� ��������� ������� �� �����.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_05");	//���� �� ���� �����, ������, ��������� ���� ����� ���������� ����, ����� ��������� ������ � ����� ���������.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_06");	//� ������� ���, ��� ��� ������ �����, �� ���� ����� ���� �� ��������.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_07");	//�����, ��� ������������ � ���. �� �� ������.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_08");	//�� ������ ��������, ��� � ��� ���������.
	B_LogEntry(TOPIC_Addon_RangerHelpSLD,"���� ����� ������ �������� � ���������� �������. ������ �������� ����� ������. ���� �����, ����� � ���������� � ������ �������� � ����� �� ���-������� � �������, ��� �� ��� �������.");
	Info_ClearChoices(DIA_Addon_Cord_RangerHelp2GetSLD);
	Info_AddChoice(DIA_Addon_Cord_RangerHelp2GetSLD,"������ �� ����. ��� ������� �������, ��� ������� �������.",B_Cord_IDoItForYou_mist);
	Info_AddChoice(DIA_Addon_Cord_RangerHelp2GetSLD,"� ������ �� �������, ��� �� ���� ��� �� ����������� ��� ��, ��� � ��������?",B_Cord_IDoItForYou_Dexter);
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
};

func void B_Cord_IDoItForYou_mist()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_mist_15_00");	//������ �� ����. ��� ������� �������, ��� ������� �������.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_01");	//�� ���. ����� ��������� � ���������� �������, ��� ��, �� ������� � ��� ��������.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_02");	//� ��� ��� ���� ���� ������. ��� ����� ��������� �� ������ ��� ����� ���� ��������.
};

func void B_Cord_IDoItForYou_Dexter()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_Dexter_15_00");	//� ������ �� �������, ��� �� ���� ��� �� ����������� ��� ��, ��� � ��������?
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_01");	//���� � ���, ��� � ���� ��� ������������ ��������. ��� ����� �������. ������ ����� ��, ��� �� ������ ����� �����.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_02");	//��� ������ ������ �� ������� �������� ���� ���.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_03");	//�������, ��� ��� �������� ������.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_04");	//�� �� ����������.
	Info_ClearChoices(DIA_Addon_Cord_RangerHelp2GetSLD);
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntries(TOPIC_Addon_MissingPeople,"������� ���� ���� ������ �������� �������.");
	B_LogNextEntry(TOPIC_Addon_RangerHelpSLD,"������� �������� ����� �������.");
	MIS_Addon_Cord_Look4Patrick = LOG_Running;
	Ranger_SCKnowsDexter = TRUE;
};

instance DIA_Addon_Cord_RangerHelp2GetSLD(C_Info)
{
	npc = SLD_805_Cord;
	nr = 2;
	condition = DIA_Addon_Cord_RangerHelp2GetSLD_Condition;
	information = DIA_Addon_Cord_RangerHelp2GetSLD_Info;
	permanent = TRUE;
	description = "������ ��� ����� ���������.";
};


func int DIA_Addon_Cord_RangerHelp2GetSLD_Condition()
{
	if((Cord_RangerHelp_GetSLD == TRUE) && (hero.guild == GIL_NONE) && (DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cord_RangerHelp2GetSLD_Info()
{
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_00");	//������ ��� ����� ���������.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_01");	//���� ��������... ��-�. ���� �� ������ ����-�� ����� ��������, ���� ����� ���������� � ��������.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_02");	//�� ��� ���������� � ���?
	if(Torlof_Go == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_03");	//��� ���.
		B_Cord_ComeLaterWhenDone();
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_04");	//��. �� ��������� ��� �� ��������� � ������...
		AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_05");	//���. � ����� �� ������� ���� ����?
		if((Torlof_ProbeBestanden == TRUE) || ((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && Npc_IsDead(Rumbold) && Npc_IsDead(Rick)) || ((MIS_Torlof_HolPachtVonSekob == LOG_Running) && ((Sekob.aivar[AIV_DefeatedByPlayer] == TRUE) || Npc_IsDead(Sekob))))
		{
			B_Cord_RangerHelpObsolete();
		}
		else if(Torlof_Probe == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_06");	//� ���� �� ������� �������.
			B_Cord_ComeLaterWhenDone();
		}
		else if(Torlof_Probe == Probe_Sekob)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_07");	//� ������ ������� ����� �� ����� ������.
			B_Cord_IDoItForYou();
		}
		else if(Torlof_Probe == Probe_Bengar)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_08");	//� ������ �������� ������� �� ������ ���������.
			B_Cord_IDoItForYou();
		}
		else
		{
			B_Cord_RangerHelpObsolete();
		};
	};
};


instance DIA_Addon_Cord_TalkedToDexter(C_Info)
{
	npc = SLD_805_Cord;
	nr = 5;
	condition = DIA_Addon_Cord_TalkedToDexter_Condition;
	information = DIA_Addon_Cord_TalkedToDexter_Info;
	description = "� ���������� � ���������.";
};


func int DIA_Addon_Cord_TalkedToDexter_Condition()
{
	if(MIS_Addon_Cord_Look4Patrick == LOG_Running)
	{
		if(Npc_KnowsInfo(other,DIA_Dexter_Hallo))
		{
			return TRUE;
		};
		if(Npc_KnowsInfo(other,DIA_Dexter_Kill))
		{
			return TRUE;
		};
		if(Npc_IsDead(Dexter))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Cord_TalkedToDexter_Info()
{
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_00");	//� ���������� � ���������.
	DIA_Cord_And();
	if(Npc_IsDead(Dexter))
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_02");	//�� �����.
	};
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_03");	//� �� ����� ������ ������ ����� �������.
	if(Dexter_KnowsPatrick == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_04");	//������� ��� ��������, �� ������, ��� ��������� ��� ��� ����� ����� �����.
		AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_05");	//�� ������, ��� ������� �� ����?
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_06");	//�� ������. �� ��� ���, ��� � ���� ���� �������.
	};
	if((MissingPeopleReturnedHome == FALSE) || (Patrick_DiedInADW == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_07");	//�� �������... �� ��� �� ������ ������ ��� ����� � ���������.
	};
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_08");	//��� �, �� �������� ������� ������...
	MIS_Addon_Cord_Look4Patrick = LOG_SUCCESS;
	TOPIC_End_RangerHelpSLD = TRUE;
	if((other.guild == GIL_NONE) && (Torlof_ProbeBestanden == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_09");	//��� ������ ������� �������?
		AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_10");	//�� ����������, � ��� ���� �����������. ���� ������� ���������, � �� ������ ���������. ������ ���������� � ��������.
	};
	Cord_RangerHelp_TorlofsProbe = TRUE;
	if(Torlof_Probe == Probe_Sekob)
	{
		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
	}
	else if(Torlof_Probe == Probe_Bengar)
	{
		if(Kapitel < 3)
		{
			if(!Npc_IsDead(Rick))
			{
				Npc_ExchangeRoutine(Rick,"FLUCHT3");
				Rick.aivar[AIV_DropDeadAndKill] = FALSE;
			};
			if(!Npc_IsDead(Rumbold))
			{
				Npc_ExchangeRoutine(Rumbold,"FLUCHT3");
				Rumbold.aivar[AIV_DropDeadAndKill] = FALSE;
			};
		};
		MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	};
	B_GivePlayerXP(XP_Addon_Cord_Look4Patrick);
};


instance DIA_Cord_ReturnPatrick(C_Info)
{
	npc = SLD_805_Cord;
	nr = 8;
	condition = DIA_Cord_ReturnPatrick_Condition;
	information = DIA_Cord_ReturnPatrick_Info;
	permanent = FALSE;
	description = "������ ��������.";
};


func int DIA_Cord_ReturnPatrick_Condition()
{
	if(MissingPeopleReturnedHome == TRUE)
	{
		if(!Npc_IsDead(Patrick_NW))
		{
			if(Npc_GetDistToWP(Patrick_NW,"NW_BIGFARM_PATRICK") <= 1000)
			{
				return TRUE;
			};
		};
	};
};

func void DIA_Cord_ReturnPatrick_Info()
{
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_00");	//������ ��������.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_01");	//�������! � ��� ����� ������� �������. ��...
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_02");	//� ���� ���� ���� �������.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_03");	//��?
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_04");	//����� ��������� ��� ��������������.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_05");	//�� � �� ��������� ���� �����������.
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_06");	//���?..
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_07");	//(����������) � ��������� ������� ����, ��� �� ��������� � ��������� �����.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_09");	//(����������) ��������� � ��� �� ����!
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Cord_ExplainSkills(C_Info)
{
	npc = SLD_805_Cord;
	nr = 1;
	condition = DIA_Cord_ExplainSkills_Condition;
	information = DIA_Cord_ExplainSkills_Info;
	permanent = FALSE;
	description = "��� � ������ ������� �������: ��������� � ���������� ��� ��������� �������?";
};


func int DIA_Cord_ExplainSkills_Condition()
{
	if((Cord_Teacher == TRUE) && (RealTalentValue(NPC_TALENT_1H) < 100) && (RealTalentValue(NPC_TALENT_2H) < 100))
	{
		return TRUE;
	};
};

func void DIA_Cord_ExplainSkills_Info()
{
	AI_Output(other,self,"DIA_Cord_ExplainSkills_15_00");	//��� � ������ ������� �������: ��������� � ���������� ��� ��������� �������?
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_01");	//��� ��� ���� ������ ������ ������ ���� �� �����.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_02");	//����� �� ���������� ���������� ������ � ����� �� ���, �� ������������� ��������� � ������� �������� ������.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_03");	//����, ��������, �� ������ �������� ���������� �����, �� ��� ��� ������� � ���, ��� �������� ����������...
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_04");	//... ����� �������� ��������� ������� ����� ���������, ����� �� ������ ����������� ����������.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_05");	//���� �� ������������ ������ � ����� ����� ������, �� ������� ������� �������� ����� ������������.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_06");	//���� �� �� ������ ���������� ��� ���� ������, �� ���������� ���� �� ����������, �������� ������ ������.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_07");	//� ���, ��������� ��� ����� ����� ����� � ��� �� - ��� ��� ���� ��������.
};


instance DIA_Cord_ExplainWeapons(C_Info)
{
	npc = SLD_805_Cord;
	nr = 2;
	condition = DIA_Cord_ExplainWeapons_Condition;
	information = DIA_Cord_ExplainWeapons_Info;
	permanent = FALSE;
	description = "��, � ������ ������������ ����������� � ���������� ������?";
};


func int DIA_Cord_ExplainWeapons_Condition()
{
	if(Cord_Teacher == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cord_ExplainWeapons_Info()
{
	AI_Output(other,self,"DIA_Cord_ExplainWeapons_15_00");	//��, � ������ ������������ ����������� � ���������� ������?
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_01");	//������� ������. � ����, ��� �� ��������� ��� ���� ��������.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_02");	//���������� ������ �������, �� ��� ������� ������� ���� ������.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_03");	//��������� ������ ������� ������� ����, �� �� �� ��������� ����������� ��� �� ������, ��� ����������.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_04");	//�����, ����� ������� ��������� �����, ���� ����������� ������ ���. ��� �������� ������������� �������������� ����������.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_05");	//����� ����� ��������� ��������������, �������� ��������� ����� ������.
};


var int DIA_Cord_Teacher_permanent;
var int DIA_Cord_TeachState_1H;
var int DIA_Cord_TeachState_2H;
var int Cord_Merke_1h;
var int Cord_Merke_2h;

func void B_Cord_Zeitverschwendung()
{
	AI_Output(self,other,"DIA_Cord_Teach_14_03");	//� �� ���� ������� ���� ����� �� ��������.
};

func void DIA_Cord_CantTeach1H()
{
	AI_Output(self,other,"DIA_Cord_Teach_14_05");	//���� �� �������� ��������������� � ���������� �������, ���� �������� ����� ������� �������.
};

func void B_Cord_Teach()
{
	if(Cord_Teacher == FALSE)
	{
		Log_CreateTopic(TOPIC_SoldierTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_SoldierTeacher,"���� ����� ������� ���� �������� ���������� � ��������� �������.");
		Cord_Teacher = TRUE;
	};
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	if(TeacherCanTrainTalent(NPC_TALENT_2H,TeachCondition_Cord) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		if(VisibleTalentValue(NPC_TALENT_2H) < TeachLimit_2H_Cord)
		{
			Info_AddChoice(DIA_Cord_Teach,B_BuildLearnTalentString(other,NPC_TALENT_2H,1),DIA_Cord_Teach_2H_1);
			Info_AddChoice(DIA_Cord_Teach,B_BuildLearnTalentString(other,NPC_TALENT_2H,5),DIA_Cord_Teach_2H_5);
			DIA_Cord_TeachState_2H = 1;
		}
		else
		{
			if(DIA_Cord_TeachState_2H == 1)
			{
				PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_2H_Cord)),-1,53,FONT_Screen,2);
			};
			DIA_Cord_TeachState_2H = 2;
		};
	};
	if(TeacherCanTrainTalent(NPC_TALENT_1H,TeachCondition_Cord) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		if(VisibleTalentValue(NPC_TALENT_1H) < TeachLimit_1H_Cord)
		{
			Info_AddChoice(DIA_Cord_Teach,B_BuildLearnTalentString(other,NPC_TALENT_1H,1),DIA_Cord_Teach_1H_1);
			Info_AddChoice(DIA_Cord_Teach,B_BuildLearnTalentString(other,NPC_TALENT_1H,5),DIA_Cord_Teach_1H_5);
			DIA_Cord_TeachState_1H = 1;
		}
		else
		{
			if(DIA_Cord_TeachState_1H == 1)
			{
				PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_1H_Cord)),-1,53,FONT_Screen,2);
				DIA_Cord_CantTeach1H();
			};
			DIA_Cord_TeachState_1H = 2;
		};
	};
	if((RealTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Cord) && (RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Cord))
	{
		DIA_Cord_Teacher_permanent = TRUE;
	};
	if((DIA_Cord_TeachState_1H == 2) && (DIA_Cord_TeachState_2H == 2))
	{
		PrintScreen(PRINT_NoLearnTotalMAXReached,-1,53,FONT_Screen,2);
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		AI_StopProcessInfos(self);
	};
};

instance DIA_Cord_Teach(C_Info)
{
	npc = SLD_805_Cord;
	nr = 3;
	condition = DIA_Cord_Teach_Condition;
	information = DIA_Cord_Teach_Info;
	permanent = TRUE;
	description = "����� ���� ���������!";
};


func int DIA_Cord_Teach_Condition()
{
	if(DIA_Cord_Teacher_permanent == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Cord_Teach_Info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//����� ���� ���������!
	if((VisibleTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Cord) && (VisibleTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Cord))
	{
		if((RealTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Cord) && (RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Cord))
		{
			DIA_Cord_Teacher_permanent = TRUE;
		};
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		AI_StopProcessInfos(self);
	}
	else if(TeacherCanTrainTalent(NPC_TALENT_1H,TeachCondition_Cord) || TeacherCanTrainTalent(NPC_TALENT_2H,TeachCondition_Cord) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		if(TeacherCanTrainTalent(NPC_TALENT_1H,TeachCondition_Cord) && TeacherCanTrainTalent(NPC_TALENT_2H,TeachCondition_Cord))
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_01");	//� ���� ������� ���� �������� ����� ������� - � ���� ������?
			Cord_Approved = TRUE;
		}
		else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
		{
			Cord_Approved = TRUE;
		}
		else if(TeacherCanTrainTalent(NPC_TALENT_1H,TeachCondition_Cord))
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_02");	//� ���� ������� ���� �������� ���������� �����. �� �� ���� ������������ �����, ����� ������������ ��������� ���.
			B_Cord_Zeitverschwendung();
			Cord_Approved = TRUE;
		}
		else if(TeacherCanTrainTalent(NPC_TALENT_2H,TeachCondition_Cord))
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_04");	//��� �������� ����������� ������, �� ����� �� ������� �������! ���� � ��������� � ��������� �� �� ��� �� � ����.
			DIA_Cord_CantTeach1H();
			Cord_Approved = TRUE;
		}
		else
		{
			B_Cord_Zeitverschwendung();
			B_Cord_BeBetter();
		};
		B_CheckLog();
		if(Cord_Approved == TRUE)
		{
			Cord_Merke_1h = other.HitChance[NPC_TALENT_1H];
			Cord_Merke_2h = other.HitChance[NPC_TALENT_2H];
			B_Cord_Teach();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_Teach_14_06");	//� �������� ������ ��������� � ��������� ����������!
	};
};

func void DIA_Cord_Teach_Back()
{
	if((Cord_Merke_1h < other.HitChance[NPC_TALENT_1H]) || (Cord_Merke_2h < other.HitChance[NPC_TALENT_2H]))
	{
		AI_Output(self,other,"DIA_Cord_Teach_BACK_14_00");	//�� ���� ����������� ����� - ��� �������!
	};
	Info_ClearChoices(DIA_Cord_Teach);
};

func void DIA_Cord_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,TeachLimit_2H_Cord))
	{
		B_Cord_Teach();
	};
};

func void DIA_Cord_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,TeachLimit_2H_Cord))
	{
		B_Cord_Teach();
	};
};

func void DIA_Cord_Teach_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,TeachLimit_1H_Cord))
	{
		B_Cord_Teach();
	};
};

func void DIA_Cord_Teach_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,TeachLimit_1H_Cord))
	{
		B_Cord_Teach();
	};
};

