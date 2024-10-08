
var int SC_ForgotAboutCavalorn;
var int CavalornWeakComment;

instance DIA_Addon_Cavalorn_EXIT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 999;
	condition = DIA_Addon_Cavalorn_EXIT_Condition;
	information = DIA_Addon_Cavalorn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Cavalorn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cavalorn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cavalorn_MeetingIsRunning(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = DIA_Addon_Cavalorn_MeetingIsRunning_Condition;
	information = DIA_Addon_Cavalorn_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Addon_Cavalorn_MeetingIsRunning_OneTime;

func int DIA_Addon_Cavalorn_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		if(Npc_GetDistToWP(self,"NW_LITTLESTONEHENDGE") < 2000)
		{
			return FALSE;
		};
		if(Npc_GetDistToWP(self,"NW_XARDAS_GOBBO_01") < 2000)
		{
			return FALSE;
		};
		if(Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_LEFT") < 2000)
		{
			return FALSE;
		};
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_MeetingIsRunning_Info()
{
	if(DIA_Addon_Cavalorn_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_MeetingIsRunning_08_00");	//����� ���������� � '������', ��� ����.
		DIA_Addon_Cavalorn_MeetingIsRunning_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_08_01");	//������ ���� ���� ��������� �������.
	AI_StopProcessInfos(self);
};


func void B_CavalornAboutHut()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_01");	//(���������) ������? ��-�. � �� ����� ����� � �����, �� � ���� ����� ���� ����, ������� � ������ ���������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_02");	//������ � ������ ��������, ��������, ����������, ����� �� ��� ��� ������ ������. � �� ����� ���� ��������� �����-������.
	Cavalorn_ToldAboutHut = TRUE;
	if(MIS_Addon_Cavalorn_TheHut == FALSE)
	{
		MIS_Addon_Cavalorn_TheHut = LOG_Running;
		Log_CreateTopic(TOPIC_Addon_CavalornTheHut,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut,LOG_Running);
		B_LogEntry(TOPIC_Addon_CavalornTheHut,"�������� �����, ����� � ��������, ���� �� ��� ��� ������ ������ � ������ ��������. ��������� � �����, ��� ��������� ����� ������ �� ������, ���, ��� ��� ������ ������. �����, �� ��� ���-�� �������.");
	};
};

instance DIA_Addon_Cavalorn_HALLO(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_HALLO_Condition;
	information = DIA_Addon_Cavalorn_HALLO_Info;
	description = "��������?";
};


func int DIA_Addon_Cavalorn_HALLO_Condition()
{
	if(Npc_GetDistToWP(self,"NW_XARDAS_GOBBO_01") < 1000)
	{
		DIA_Addon_Cavalorn_HALLO.description = "��������?";
	}
	else
	{
		DIA_Addon_Cavalorn_HALLO.description = "������!";
	};
	return TRUE;
};

func void DIA_Addon_Cavalorn_HALLO_Info()
{
	if(Npc_GetDistToWP(self,"NW_XARDAS_GOBBO_01") < 1000)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_15_00");	//��������?
		AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_01");	//(�����������) ����. � �� ����, ��� ��� ��� ��������. �������� ������ - � ������ ��� ��� ������������.
	}
	else
	{
		DIA_Common_Hello();
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_02");	//(�����) ������ �������. � ���� ����. �� ��� ������, ��� ��������� ������� � ���� ������ � ������ ��������.
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"���� ����� ��������, �����?",DIA_Addon_Cavalorn_HALLO_Ja);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"���-�� �� ����������...",DIA_Addon_Cavalorn_HALLO_weissNicht);
};

func void DIA_Addon_Cavalorn_HALLO_weissNicht()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_weissNicht_15_00");	//���-�� �� ����������...
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_weissNicht_08_01");	//�� ��� ��. ��� � ���� ������ ����� ������� ������ � ���� ����, ��� �������� �� ���� � ��������� �������������. ������ �����������?
	SC_ForgotAboutCavalorn = TRUE;
};

func void DIA_Addon_Cavalorn_HALLO_Ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Ja_15_00");	//���� ����� ��������, �����?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_01");	//���. � ����, �� ���-���� �� ����� ���� ����� �����, ����� ��� �� ������ � ���� ������ �������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_02");	//���� �� �������������?
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"� ���� ��� ������������ ����.",DIA_Addon_Cavalorn_HALLO_keinZiel);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"����� � ������ ��������.",DIA_Addon_Cavalorn_HALLO_Bauern);
	if(PlayerEnteredCity == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"� �����.",DIA_Addon_Cavalorn_HALLO_Stadt);
	};
};

func void DIA_Addon_Cavalorn_HALLO_Stadt()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Stadt_15_00");	//� �����.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_01");	//(�������) ��-��. � �����. ���.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_02");	//� ���� ����� ���������� ��������� �� �������. ��� ��� �� ������� ������� ���������, ���� ����� ����� ���������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_03");	//��������� ���� ����� ���� �� ������ ����������� ������ �������� �������� �����. �� ������, ��� ��������� �������� ������� � ������������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_04");	//�� ����� � ������ ��� ������. ������ ����, ���-�� ��� ���� ������, ����� ��������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_05");	//����� ����, ���� ����� � ��� ����������.
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_Bauern()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Bauern_15_00");	//����� � ������ ��������.
	B_CavalornAboutHut();
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_keinZiel()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_keinZiel_15_00");	//� ���� ��� ������������ ����.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_keinZiel_08_01");	//�� ������ ��� ��������, ��? �� �����.
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};


instance DIA_Addon_Cavalorn_ImGoingToMineValley(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_ImGoingToMineValley_Condition;
	information = DIA_Addon_Cavalorn_ImGoingToMineValley_Info;
	description = "� ��������� ����������� � ������ ��������.";
};


func int DIA_Addon_Cavalorn_ImGoingToMineValley_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (Hagen_BringProof == TRUE) && (Kapitel < 3) && (MIS_Addon_Cavalorn_TheHut == FALSE) && !Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel) && (SC_OpenedCavalornsBeutel == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_ImGoingToMineValley_Info()
{
	AI_Output(other,self,"DIA_Lee_RescueGorn_15_00");	//� ��������� ����������� � ������ ��������.
	B_CavalornAboutHut();
};


instance DIA_Addon_Cavalorn_Beutel(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Beutel_Condition;
	information = DIA_Addon_Cavalorn_Beutel_Info;
	description = "� ��� � ����� ������ � ������ ��������.";
};


func int DIA_Addon_Cavalorn_Beutel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel) || (SC_OpenedCavalornsBeutel == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Beutel_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_00");	//� ��� � ����� ������ � ������ ��������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_01");	//��� ������, ��� ��� �����.
	if(Cavalorn_ToldAboutHut == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_02");	//��. � � ����, ����� �� ����� ���� ���������.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_03");	//�� ����� ���?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_04");	//���� �� ������ � ���� ������� � ������� ����... ��, �� � ����.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_05");	//�� ��, ������ ���, ������ �� ����?
	if(Cavalorn_ToldAboutHut == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_06");	//� ��� ��� ���� ����� �� ������������ � ���� ������ ������? ��� ��� ������ ������.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_07");	//�� � ���� � �����? � ��� ���� 100 ������� �� ����.
	MIS_Addon_Cavalorn_TheHut = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	if(Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"�������.",DIA_Addon_Cavalorn_Beutel_ja);
	}
	else if(Npc_HasItems(other,ItMi_Nugget))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"���, �� � ���� ���� ������ ����� ����.",DIA_Addon_Cavalorn_Beutel_jaerz);
	};
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"���.",DIA_Addon_Cavalorn_Beutel_no);
};

func void B_BuildCavalornOreDialog()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,Dialog_Back,DIA_Addon_Cavalorn_Beutel_back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"������ �� �� ������� �� ����?",DIA_Addon_Cavalorn_Beutel_why);
	if(Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel) || Npc_HasItems(other,ItMi_Nugget))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"����� ��� 100 ������� - � � ����� ���� ���� ����.",DIA_Addon_Cavalorn_ErzGeben_Info);
	};
};

func void DIA_Addon_Cavalorn_Beutel_back()
{
	if(Cavalorn_GotOre == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_back_08_00");	//� �������, ��� �� �������� �� ���.
	};
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
};

func void DIA_Addon_Cavalorn_Beutel_jaerz()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_jaerz_15_00");	//���, �� � ���� ���� ������ ����� ����.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_jaerz_08_01");	//���� �������.
	B_BuildCavalornOreDialog();
};

func void DIA_Addon_Cavalorn_Beutel_ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_ja_15_00");	//�������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_OBack_08_01");	//�������.
	B_BuildCavalornOreDialog();
};

func void DIA_Addon_Cavalorn_Beutel_no()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_00");	//���.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_no_08_01");	//����� ������� ��� ���. � ��������� ��� ���� � ��� ������� ������ ��������.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_02");	//� ����� �����.
	B_BuildCavalornOreDialog();
};

func void DIA_Addon_Cavalorn_Beutel_why()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00");	//������ �� �� ������� �� ����?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_01");	//� � �� �����, ��� � �������� ���� ����� ��� �����.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_02");	//�� ����� ������ ������� ���� � ������� �� �� � �����, ��� �������, ���� �� �����.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_03");	//� � �������� ������ ���� ��� ������ �������� �������� �����, ���� ������, ��� ��� ���� ���� ����.
};


instance DIA_Addon_Cavalorn_ErzGeben(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_ErzGeben_Condition;
	information = DIA_Addon_Cavalorn_ErzGeben_Info;
	description = "����� ��� 100 ������� - � � ����� ���� ���� ����.";
};


func int DIA_Addon_Cavalorn_ErzGeben_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Beutel) && (Cavalorn_GotOre == FALSE))
	{
		if(Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel))
		{
			return TRUE;
		};
		if((SC_OpenedCavalornsBeutel == TRUE) && Npc_HasItems(other,ItMi_Nugget))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Cavalorn_ErzGeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ErzGeben_15_00");	//����� ��� 100 ������� - � � ����� ���� ���� ����.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_01");	//�� �����. ��� ������.
	CreateInvItems(self,ItMi_Gold,100);
	B_GiveInvItems(self,other,ItMi_Gold,100);
	if(Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel))
	{
		B_GiveInvItems(other,self,ItSe_ADDON_CavalornsBeutel,1);
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_Nugget,1);
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_02");	//�� ��������� ����. ������� ��������.
	Cavalorn_GotOre = TRUE;
	B_GivePlayerXP(XP_Addon_CavalornsBeutel);
};


instance DIA_Addon_Cavalorn_WASMACHSTDU(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_WASMACHSTDU_Condition;
	information = DIA_Addon_Cavalorn_WASMACHSTDU_Info;
	description = "��� �� ����� �������?";
};


func int DIA_Addon_Cavalorn_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (MIS_Addon_Nefarius_BringMissingOrnaments == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WASMACHSTDU_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WASMACHSTDU_08_01");	//���� �� �����. ���� �� �� ��� ������� �������, ���� �� ����� �� ����.
};


instance DIA_Addon_Cavalorn_Banditen(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 10;
	condition = DIA_Addon_Cavalorn_Banditen_Condition;
	information = DIA_Addon_Cavalorn_Banditen_Info;
	description = "��� ����� � ���������?";
};


func int DIA_Addon_Cavalorn_Banditen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_WASMACHSTDU) && (MIS_Addon_Nefarius_BringMissingOrnaments == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Banditen_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_00");	//��� ����� � ���������?
//	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_01");	//�� ���, � ���� ��������?
//	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_02");	//�-�...
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_03");	//� ������ ��� ���� ���� ������ �� �������������� �������, ������� ��������� ���� ����� ��� ����, ������ � ������� ����, ���� �����.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_04");	//(��������) �����, ��� �������, ��� ��� ���� �� �����. � �������� ��������� �� ������� - � ���� ��� �������� ������ ����� �������� �� ������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_05");	//���� �� ����, ��� ������ �������� ���� ���� �������.
};


instance DIA_Addon_Cavalorn_ARTEFAKT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_ARTEFAKT_Condition;
	information = DIA_Addon_Cavalorn_ARTEFAKT_Info;
	description = "���� �������� ����������?";
};


func int DIA_Addon_Cavalorn_ARTEFAKT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Banditen) && (MIS_Addon_Cavalorn_KillBrago != LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == FALSE) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_ARTEFAKT_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ARTEFAKT_15_00");	//���� �������� ����������?
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_01");	//(� ������) ��. ��� ��������� ���� � ������� �� ������� ��������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_02");	//��� ���� ����� ������ ��� ���� ����. ������ � ��� ������. ��� ������ ���������� ������� ��.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_03");	//�� ��� ����������, ������� ��� �� ���� ��������, � �� ������� ����. ��� ��������� �����...
};


instance DIA_Addon_Cavalorn_HELFEN(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_HELFEN_Condition;
	information = DIA_Addon_Cavalorn_HELFEN_Info;
	description = "���� � ������ ���� � ���������?";
};


func int DIA_Addon_Cavalorn_HELFEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_ARTEFAKT) && (MIS_Addon_Nefarius_BringMissingOrnaments == FALSE) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS))
	{
		if(!C_BragoBanditsDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Cavalorn_HELFEN_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HELFEN_15_00");	//���� � ������ ���� � ���������?
	if(!Npc_HasEquippedArmor(other) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_01");	//(�����) ��������. �� �� ��������� ����� �����, �� ��������� �� ������ ���� ��������� ������.
		CavalornWeakComment = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_02");	//��... � ���� ��� ������, ��� ��� � �������� ���� �����������. � ���� ���� �������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_03");	//���, ������. ���� �� ���� ������ ������������� ���� �� ��� ������� ���, ��� �������� �������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_04");	//������ �� ������, ��� ��� �����, ���� � ��������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_05");	//�����, ����� ������ �����, � �� ������� ������������.
	MIS_Addon_Cavalorn_KillBrago = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_KillBrago,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KillBrago,LOG_Running);
	B_LogEntry(TOPIC_Addon_KillBrago,"������� ������ � ��������� ���-�� ������. �� �����, ����� � ����� ��� ������������ � ����.");
};


instance DIA_Addon_Cavalorn_AUSRUESTUNG(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_AUSRUESTUNG_Condition;
	information = DIA_Addon_Cavalorn_AUSRUESTUNG_Info;
	description = "��� ����� ���������� �������.";
};


func int DIA_Addon_Cavalorn_AUSRUESTUNG_Condition()
{
	if((MIS_Addon_Cavalorn_KillBrago != FALSE) && (MIS_Addon_Nefarius_BringMissingOrnaments == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_AUSRUESTUNG_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_00");	//��� ����� ���������� �������.
	if(!C_BragoBanditsDead())
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_01");	//��� ������ �� �������� ��� ����� ������.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_02");	//� ���� ���� ���� ������ ���. ����� ���� ������?
	CreateInvItems(self,ItMW_Addon_Knife01,1);
	B_GiveInvItems(self,other,ItMW_Addon_Knife01,1);
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_03");	//�� ��������� ��� �����?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_04");	//� ��� �� ������ �������?
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_05");	//� ���� ���� ��� 2 �������� �����. �����?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_06");	//�������. ����� ����.
	CreateInvItems(self,ItPo_Health_01,2);
	B_GiveInvItems(self,other,ItPo_Health_01,2);
};


instance DIA_Addon_Cavalorn_LETSKILLBANDITS(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition;
	information = DIA_Addon_Cavalorn_LETSKILLBANDITS_Info;
	description = "������, ���������� � ����� ��������.";
};


func int DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition()
{
	if((MIS_Addon_Cavalorn_KillBrago == LOG_Running) && (MIS_Addon_Nefarius_BringMissingOrnaments == FALSE) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS))
	{
		if(!C_BragoBanditsDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Cavalorn_LETSKILLBANDITS_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_LETSKILLBANDITS_15_00");	//������, ���������� � ����� ��������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_01");	//�������. �����, ����� �� ��� �� ��������� �����, �����?
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_02");	//������ �� ���� ���������� �������.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"KILLBANDITS");
	if(Bdt_1013_Away == FALSE)
	{
		if(!Npc_IsDead(Ambusher_1013))
		{
			Ambusher_1013.aivar[AIV_EnemyOverride] = FALSE;
		};
	};
	if(!Npc_IsDead(Ambusher_1014))
	{
		Ambusher_1014.aivar[AIV_EnemyOverride] = FALSE;
	};
	if(!Npc_IsDead(Ambusher_1015))
	{
		Ambusher_1015.aivar[AIV_EnemyOverride] = FALSE;
	};
};

func void B_Addon_Cavalorn_VatrasBrief()
{
	if(MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_00");	//� �, �������, ����� ��������� ���� �������. � � ��� ������� ��� ������� ����� �������.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_01");	//��� ��� �� �������?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_02");	//(��� ����) ��, ��. ���� ������� ��� ��� ����� ����� ������� � �����, � �����...
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_03");	//(��������) �� ����, ��� ��� ������� ������� ��� �������.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_04");	//(����) � ��� ������ ����?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_05");	//(����������) ��-�. � ������ �� � ���... �� ������ ��������� ������ � �����.
		MIS_Addon_Cavalorn_Letter2Vatras = LOG_Running;
		Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_KDW,"�������� �����, ����� � �������� ���������� ��������� ������ ���� ���� �������, ������� ������ ��������� � ����� ������� � ��������.");
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_06");	//����� � ���� ����� ������ ������ �������, ����� ������������ � ����� ����������.
	if(MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_07");	//������ ������ ���� � ������ �� �������� � �������.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_08");	//������ ��� � �������, ���� ����, � �����. �� ������� ��� � ����� �������. �� ����������� ��� ���� ����.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_09");	//����� ���, ��� ��� �� �������.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_10");	//� ���� �� �������, ��� �, ������ ����� ���, ��� � ��� �� ���� � ����� �������, �����?
	};
	if(!Npc_HasEquippedArmor(other) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_11");	//�, ��, � ��� ����. ������� ���� ��������� ������ � ������-������ �������.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_12");	//����� ���� ����� ������� �� �������. ��� ���� �����.
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
		if((Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE) && (PlayerEnteredCity == FALSE))
		{
			Log_CreateTopic(TOPIC_City,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_City,LOG_Running);
			Log_AddEntry(TOPIC_City,"�������� ����������� ��� ������ �������� ������, ����� � �� �������� ������� �������������.");
		};
	};
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	MIS_Addon_Cavalorn_KillBrago = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Cavalorn_KillBrago);
};


instance DIA_Addon_Cavalorn_BragoKilled(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_BragoKilled_Condition;
	information = DIA_Addon_Cavalorn_BragoKilled_Info;
	important = TRUE;
};


func int DIA_Addon_Cavalorn_BragoKilled_Condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_LEFT") < 500) && (MIS_Addon_Cavalorn_KillBrago == LOG_Running))
	{
		if(C_BragoBanditsDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Cavalorn_BragoKilled_Info()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_BragoKilled_08_00");	//������. ��. �� �� ��������� ����������� �� ����.
	B_Addon_Cavalorn_VatrasBrief();
};


instance DIA_Addon_Cavalorn_PCKilledBrago(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_PCKilledBrago_Condition;
	information = DIA_Addon_Cavalorn_PCKilledBrago_Info;
	description = "� ��������� ���������.";
};


func int DIA_Addon_Cavalorn_PCKilledBrago_Condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_GOBBO_01") < 500) && (MIS_Addon_Cavalorn_KillBrago != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Banditen))
	{
		if(C_BragoBanditsDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Cavalorn_PCKilledBrago_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_PCKilledBrago_15_00");	//� ��������� ���������.
	B_Addon_Cavalorn_VatrasBrief();
};


instance DIA_Addon_Cavalorn_JUNGS(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 2;
	condition = DIA_Addon_Cavalorn_JUNGS_Condition;
	information = DIA_Addon_Cavalorn_JUNGS_Info;
	description = "���������� �� ���� �������. �� ������ �� ������������ � �����?";
};


func int DIA_Addon_Cavalorn_JUNGS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_JUNGS_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_JUNGS_15_00");	//���������� �� ���� �������. �� ������ �� ������������ � �����?
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_01");	//����? ��� �� ���������� � ��� ���, ��� ��� ������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_02");	//����� �� �����, �������, ���� �� ������ ��������, ������� ���� ���������� � ����.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_03");	//������ � ������� �� ����� ����. � ���������� � '������ ����'.
	if(SC_KnowsRanger == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
		B_LogEntry(TOPIC_Addon_RingOfWater,"�������� ��������� ���, ��� �� ����������� � ����������, ������� ���������� '������ ����'.");
		SC_KnowsRanger = TRUE;
	};
};


instance DIA_Addon_Cavalorn_Ring(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Ring_Condition;
	information = DIA_Addon_Cavalorn_Ring_Info;
	permanent = FALSE;
	description = "�������� ��� � '������ ����'!";
};


func int DIA_Addon_Cavalorn_Ring_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Ring_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ring_15_00");	//�������� ��� � '������ ����'!
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_01");	//��� �� ����� ���� ������ �������� ��� ����.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_02");	//���, ��� � ���� ������� - ��� �������� ���� � �������. �� - ������������� ����� ���� � ��������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_03");	//����� ���� ���������� � ���. �����, ��� � ���� ������������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_04");	//����� ����, �� ���� ������ � ���� ����. ��� ������ ���������� ����...
	B_LogEntry(TOPIC_Addon_RingOfWater,"� ������ ���� ��� ����� ���������� ��� ���� ������.");
};


instance DIA_Addon_Cavalorn_Feinde(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 6;
	condition = DIA_Addon_Cavalorn_Feinde_Condition;
	information = DIA_Addon_Cavalorn_Feinde_Info;
	permanent = FALSE;
	description = "����� �� � ���� ������ ������ �� ���� ������� ����� ����?";
};


func int DIA_Addon_Cavalorn_Feinde_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Feinde_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Feinde_15_00");	//����� �� � ���� ������ ������ �� ���� ������� ����� ����?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_01");	//��� �������� ��� �����������. ������ ��� '������ ������' ��� '������� ������'.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_02");	//����� ����, ��� ������� ���������� ���� �������������, ������ ������� ��� �� ����.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_03");	//�� ������������ �� ������ ����������� ��� ��� ���� �����.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_04");	//���� ���� ������ ����������� � ���� ����������, � ������ � ���� ������������� ��������.
};


instance DIA_Addon_Cavalorn_KdWTask(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 6;
	condition = DIA_Addon_Cavalorn_KdWTask_Condition;
	information = DIA_Addon_Cavalorn_KdWTask_Info;
	permanent = FALSE;
	description = "� ���, ����������, ������ ���� ����?";
};


func int DIA_Addon_Cavalorn_KdWTask_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS) && (MIS_Addon_Nefarius_BringMissingOrnaments == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_KdWTask_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_00");	//� ���, ����������, ������ ���� ����?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_01");	//��� ������� ���-��� ���������. ��� �������� ����������� ������� �� �������.
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_02");	//����������� �������? ��� �� ��� ����� ����?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_03");	//� �� ���� ���� �������. �������� � �������� � ��������.
};


instance DIA_Addon_Cavalorn_BroughtLetter(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_BroughtLetter_Condition;
	information = DIA_Addon_Cavalorn_BroughtLetter_Info;
	description = "� ������� ������� ���� ������.";
};


func int DIA_Addon_Cavalorn_BroughtLetter_Condition()
{
	if((MIS_Addon_Cavalorn_Letter2Vatras == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_BroughtLetter_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BroughtLetter_15_00");	//� ������� ������� ���� ������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_BroughtLetter_08_01");	//� � �� ������ �������. �������.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Cavalorn_Ornament(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 2;
	condition = DIA_Addon_Cavalorn_Ornament_Condition;
	information = DIA_Addon_Cavalorn_Ornament_Info;
	description = "�� ���-�� �����?";
};


func int DIA_Addon_Cavalorn_Ornament_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Ornament_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_00");	//�� ���-�� �����?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_01");	//� ���, ��� �������? ��, � ���� ���� ��������� �� ����� ����, � ��� ���������� ��������.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_02");	//��� ������. � ���� �� �� ��������� �� ���������.
	if(SC_KnowsRanger == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_03");	//��� ������, �� ������������ � '������ ����'?
		if(SC_IsRanger == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_04");	//��.
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_05");	//���� ���, �� � ������� ��� ����.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_06");	//� ���. ������, ��� �� �������� ���������� ���� � ��������.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_07");	//�� ��� ����� ��������?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_08");	//� ���� �����, ��� �� ������ ����.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_09");	//���� �������� ���� ����� �� ��, ��� �������� ��������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_10");	//������ ��� ���� ������ ����� ��������, ������� �� � ������ �����.
};


instance DIA_Addon_Cavalorn_Triggered(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Triggered_Condition;
	information = DIA_Addon_Cavalorn_Triggered_Info;
	description = "� ��������. �� �� �� ��������, ������ �� ������.";
};


func int DIA_Addon_Cavalorn_Triggered_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ornament) && (Ornament_Switched_Farm == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Triggered_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_15_00");	//� ��������. �� �� �� ��������, ������ �� ������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_ja_08_01");	//������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_01");	//������, ������� ������� ���� �����.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_02");	//��� �������, ��� ���� �� ��� ��� �������� �����, ����� ������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_03");	//�������� ����� �������� �� �������� � ����� �� ����.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_04");	//������� ������� ����������, �� ���������� ���������, ������� � ���������� �������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_05");	//� ��� ������� ����� ���. ���� �������� � ��� �����, ������ �� � ���������.
	Info_ClearChoices(DIA_Addon_Cavalorn_Triggered);
	Info_AddChoice(DIA_Addon_Cavalorn_Triggered,"����-�� �� ��� �������� ��������� � ������� ����� ������.",DIA_Addon_Cavalorn_Triggered_Pal);
	Info_AddChoice(DIA_Addon_Cavalorn_Triggered,"����� � ����� � ������� � ��� ��������.",DIA_Addon_Cavalorn_Triggered_OBack);
};

func void B_Cavalorn_Triggered_Wohin()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Wohin_08_00");	//������ � ����� ��� � �����. ���������� � �������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"STADT");
	B_LogEntry(TOPIC_Addon_Ornament,"���� �� ������ ��������� ��������� � ��������� � ������� ��������.");
	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_Running;
	self.flags = 0;
};

func void DIA_Addon_Cavalorn_Triggered_OBack()
{
	CreateInvItems(self,ITAR_Bau_L,1);
	AI_EquipArmor(self,ITAR_Bau_L);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_OBack_15_00");	//����� � ����� � ������� � ��� ��������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_OBack_08_01");	//�������.
	B_Cavalorn_Triggered_Wohin();
};

func void DIA_Addon_Cavalorn_Triggered_Pal()
{
	CreateInvItems(self,ITAR_Bau_L,1);
	AI_EquipArmor(self,ITAR_Bau_L);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_Pal_15_00");	//����-�� �� ��� �������� ��������� � ������� ����� ������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Pal_08_01");	//� ���� ��� �� ��� �������. ��� �������� ������� ����.
	B_Cavalorn_Triggered_Wohin();
};


instance DIA_Addon_Cavalorn_GotOrnaFromHagen(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition;
	information = DIA_Addon_Cavalorn_GotOrnaFromHagen_Info;
	description = "� ������ � ����� ������ ��������� ��������.";
};


func int DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition()
{
	if(Lord_Hagen_GotOrnament == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_GotOrnaFromHagen_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_GotOrnaFromHagen_15_00");	//� ������ � ����� ������ ��������� ��������.
	AI_Output(self,other,"DIA_Addon_Cavalorn_GotOrnaFromHagen_08_01");	//������! � �� �������, ��� �� � ���������.
	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Cavalorn_WannaLearn(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 7;
	condition = DIA_Addon_Cavalorn_WannaLearn_Condition;
	information = DIA_Addon_Cavalorn_WannaLearn_Info;
	permanent = FALSE;
	description = "�� ������ ������� ���� ���-����?";
};


func int DIA_Addon_Cavalorn_WannaLearn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO))
	{
		if(MIS_Addon_Cavalorn_KillBrago == LOG_SUCCESS)
		{
			return TRUE;
		};
		if(MIS_Addon_Nefarius_BringMissingOrnaments != FALSE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Cavalorn_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WannaLearn_15_00");	//�� ������ ������� ���� ���-����?
	if(CavalornWeakComment == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_01_add");	//�������, �� ��� ��������� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_01");	//�������, �� ��� ��������� ������. ��������, �� ������������� ����� �������.
	};
	if(SC_ForgotAboutCavalorn == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_02");	//�� � ������ ������ �� �������, ��?
	};
	if(MIS_Addon_Cavalorn_GetOrnamentFromPAL != FALSE)
	{
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,LogText_Addon_Cavalorn_Teach);
	}
	else
	{
		Log_CreateTopic(TOPIC_OutTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_OutTeacher,LogText_Addon_Cavalorn_Teach);
	};
	Cavalorn_Addon_TeachPlayer = TRUE;
};


var int DIA_Cavalorn_Teacher_permanent;
var int Cavalorn_Merke_Bow;
var int Cavalorn_Merke_1h;
var int Cavalorn_Sneak_Comment;

func void B_BuildLearnDialog_Cavalorn()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_TEACH);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,Dialog_Back,DIA_Addon_Cavalorn_Teach_Back);
	if(!Npc_GetTalentSkill(other,NPC_TALENT_SNEAK))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnString(NAME_Skill_Sneak,B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1)),DIA_Addon_Cavalorn_Teach_Sneak);
	};
	if(VisibleTalentValue(NPC_TALENT_BOW) < TeachLimit_Bow_Cavalorn)
	{
		Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnTalentString(other,NPC_TALENT_BOW,1),DIA_Addon_Cavalorn_Teach_Bow_1);
		Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnTalentString(other,NPC_TALENT_BOW,5),DIA_Addon_Cavalorn_Teach_Bow_5);
	};
	if(VisibleTalentValue(NPC_TALENT_1H) < TeachLimit_1H_Cavalorn)
	{
		Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnTalentString(other,NPC_TALENT_1H,1),DIA_Addon_Cavalorn_Teach_1H_1);
		Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnTalentString(other,NPC_TALENT_1H,5),DIA_Addon_Cavalorn_Teach_1H_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) && (VisibleTalentValue(NPC_TALENT_BOW) >= TeachLimit_Bow_Cavalorn) && (VisibleTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Cavalorn))
	{
		if((RealTalentValue(NPC_TALENT_BOW) >= TeachLimit_Bow_Cavalorn) && (RealTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Cavalorn))
		{
			DIA_Cavalorn_Teacher_permanent = TRUE;
		};
		PrintScreen(PRINT_NoLearnTotalMAXReached,-1,53,FONT_Screen,2);
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		AI_StopProcessInfos(self);
	};
};

instance DIA_Addon_Cavalorn_TEACH(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 8;
	condition = DIA_Addon_Cavalorn_TEACH_Condition;
	information = DIA_Addon_Cavalorn_TEACH_Info;
	permanent = TRUE;
	description = "� ���� ��������� ����, ��� �� ������.";
};


func int DIA_Addon_Cavalorn_TEACH_Condition()
{
	if((Cavalorn_Addon_TeachPlayer == TRUE) && (DIA_Cavalorn_Teacher_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_TEACH_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//� ���� ��������� ����, ��� �� ������.
	if(!Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) || (VisibleTalentValue(NPC_TALENT_BOW) < TeachLimit_Bow_Cavalorn) || (VisibleTalentValue(NPC_TALENT_1H) < TeachLimit_1H_Cavalorn))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_TEACH_08_01");	//������. ��� ������ ���� ����������?
		Cavalorn_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
		Cavalorn_Merke_1h = other.HitChance[NPC_TALENT_1H];
	};
	B_BuildLearnDialog_Cavalorn();
};

func void DIA_Addon_Cavalorn_Teach_Sneak()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_Sneak_08_00");	//� ������� ��������� ���� ����� ����� ��������� ����������� � ����������.
		Cavalorn_Sneak_Comment = TRUE;
		B_BuildLearnDialog_Cavalorn();
	};
};

func void DIA_Addon_Cavalorn_Teach_Bow_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,TeachLimit_Bow_Cavalorn))
	{
		B_BuildLearnDialog_Cavalorn();
	};
};

func void DIA_Addon_Cavalorn_Teach_Bow_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,TeachLimit_Bow_Cavalorn))
	{
		B_BuildLearnDialog_Cavalorn();
	};
};

func void DIA_Addon_Cavalorn_Teach_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,TeachLimit_1H_Cavalorn))
	{
		B_BuildLearnDialog_Cavalorn();
	};
};

func void DIA_Addon_Cavalorn_Teach_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,TeachLimit_1H_Cavalorn))
	{
		B_BuildLearnDialog_Cavalorn();
	};
};

func void DIA_Addon_Cavalorn_Teach_Back()
{
	if((Cavalorn_Merke_Bow < other.HitChance[NPC_TALENT_BOW]) || (Cavalorn_Merke_1h < other.HitChance[NPC_TALENT_1H]) || (Cavalorn_Sneak_Comment == TRUE))
	{
		if((CavalornWeakComment == TRUE) || (SC_ForgotAboutCavalorn == TRUE))
		{
			AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_BACK_08_00");	//��� �����. �� ������ �������, �� �� ������ ������ ���� ������.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_BACK_08_00_add");	//��� �����.
		};
	};
	Info_ClearChoices(DIA_Addon_Cavalorn_TEACH);
};

