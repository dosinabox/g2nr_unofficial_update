
instance DIA_Tengron_EXIT(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 999;
	condition = DIA_Tengron_EXIT_Condition;
	information = DIA_Tengron_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tengron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Tengron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tengron_First(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 2;
	condition = DIA_Tengron_First_Condition;
	information = DIA_Tengron_First_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Tengron_First_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ScoutMine != LOG_Running) && (MIS_ScoutMine != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Tengron_First_Info()
{
	AI_Output(self,other,"DIA_Tengron_First_07_00");	//��� �� ������� �����?
	AI_Output(other,self,"DIA_Tengron_First_15_01");	//� ����� �� ������� ����� ������.
	AI_Output(self,other,"DIA_Tengron_First_07_02");	//���� ��������� ���������� ��������� �� ����� � ���������� � ����������� ��������.
};


instance DIA_Tengron_HALLO(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 2;
	condition = DIA_Tengron_HALLO_Condition;
	information = DIA_Tengron_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Tengron_HALLO_Condition()
{
	if((Npc_IsInState(self,ZS_Talk) && (MIS_ScoutMine == LOG_Running)) || (MIS_ScoutMine == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Tengron_HALLO_Info()
{
	AI_Output(self,other,"DIA_Tengron_HALLO_07_00");	//�� �������� � ����� �����! �� ������ ��� ������� �� �����? ����� �������� ������������?
	if(!Npc_IsDead(Fajeth))
	{
		AI_Output(other,self,"DIA_Tengron_HALLO_15_01");	//� ������ �� �� ���, ����� �������� �������, � ����� �������� ��.
		AI_Output(self,other,"DIA_Tengron_HALLO_07_02");	//����� �������� � ��������. �� ��������� �����. �� ���� � ���� ����� ������� �� �����, ��� ��� �����.
	};
};


instance DIA_Tengron_News(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 7;
	condition = DIA_Tengron_News_Condition;
	information = DIA_Tengron_News_Info;
	permanent = FALSE;
	description = "������ ��������...";
};


func int DIA_Tengron_News_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Tengron_News_Info()
{
	AI_Output(other,self,"DIA_Tengron_News_15_00");	//������ ��������...
	AI_Output(self,other,"DIA_Tengron_News_07_01");	//��, ��� ���, � �����?
	AI_Output(other,self,"DIA_Tengron_News_15_02");	//��� ��� ��� �������� ����, � �� ��� ��� �� ������ ��� ���� ��������.
	AI_Output(self,other,"DIA_Tengron_News_07_03");	//����, � �������, ����� ��� �� �����������.
	AI_Output(self,other,"DIA_Tengron_News_07_04");	//��������, � ���� ���� ���� � �����. ��� ����� ����. �� ����� ����� ���� �����, � ����� ������ ������ ���� �� ����.
	AI_Output(self,other,"DIA_Tengron_News_07_05");	//� ����, ����� �� ������� ��� ��� ������. ����� �� �������� ��� ���� ����. ����� ���, � ������ ������, ����� �������.
	Info_ClearChoices(DIA_Tengron_News);
	Info_AddChoice(DIA_Tengron_News,"� ���� ��� ������� �� ���.",DIA_Tengron_News_No);
	Info_AddChoice(DIA_Tengron_News,"��� �������. ����� � ���� � �����, � ������� ��� ������ �����.",DIA_Tengron_News_Yes);
};

func void DIA_Tengron_News_No()
{
	AI_Output(other,self,"DIA_Tengron_News_No_15_00");	//� ���� ��� ������� �� ���.
	AI_Output(self,other,"DIA_Tengron_News_No_07_01");	//�������.
	Info_ClearChoices(DIA_Tengron_News);
};

func void DIA_Tengron_News_Yes()
{
	AI_Output(other,self,"DIA_Tengron_News_Yes_15_00");	//��� �������. ����� � ���� � �����, � ������� ��� ������ �����.
	AI_Output(self,other,"DIA_Tengron_News_Yes_07_01");	//������. ����� ����� ������ ������� ����� ����. � �� ������ ������� ���, ��� � ����� ������ ���.
	B_GiveInvItems(self,other,ItRi_HP_01_Tengron,1);
	Info_ClearChoices(DIA_Tengron_News);
	Log_CreateTopic(TOPIC_TengronRing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TengronRing,LOG_Running);
	B_LogEntry(TOPIC_TengronRing,"������� ��� ��� ������, ������� � ������ �������� ����� � �����.");
};


instance DIA_Tengron_Situation(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 70;
	condition = DIA_Tengron_Situation_Condition;
	information = DIA_Tengron_Situation_Info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int DIA_Tengron_Situation_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Tengron_Situation_Info()
{
	AI_Output(other,self,"DIA_Tengron_Situation_15_00");	//��� ����������?
	AI_Output(self,other,"DIA_Tengron_Situation_07_01");	//�� �������� ���������, � ��� ������� ������ ����� ���� ����. � ���� ��, �� �������� ����� ������� �����.
	AI_Output(self,other,"DIA_Tengron_Situation_07_02");	//� �� ����, ������� �� ��� �����������, �� �� �� �������� ������ ���!
};


instance DIA_Tengron_HELP(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 9;
	condition = DIA_Tengron_HELP_Condition;
	information = DIA_Tengron_HELP_Info;
	permanent = FALSE;
	description = "��� ����� ���� ������. ������ �����, ����� � ������� ��������� �...";
};


func int DIA_Tengron_HELP_Condition()
{
	if((MIS_Fajeth_Kill_Snapper == LOG_Running) && Npc_KnowsInfo(other,DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Tengron_HELP_Info()
{
	AI_Output(other,self,"DIA_Tengron_HELP_15_00");	//��� ����� ���� ������. ������ �����, ����� � ������� ��������� �...
	AI_Output(self,other,"DIA_Tengron_HELP_07_01");	//� �������� ������� ������ �������. � ��� ��� ������ �������� �����. ������ ���� � � ���������.
	AI_Output(self,other,"DIA_Tengron_HELP_07_02");	//�����, ���-������ ��� ������ ������ ����.
};

