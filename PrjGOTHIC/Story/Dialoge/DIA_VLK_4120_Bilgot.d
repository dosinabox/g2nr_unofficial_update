
instance DIA_Bilgot_EXIT(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 999;
	condition = DIA_Bilgot_EXIT_Condition;
	information = DIA_Bilgot_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bilgot_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bilgot_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bilgot_HALLO(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 2;
	condition = DIA_Bilgot_HALLO_Condition;
	information = DIA_Bilgot_HALLO_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Bilgot_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Bilgot_HALLO_Info()
{
	AI_Output(self,other,"DIA_Bilgot_HALLO_05_00");	//��, ������ �� ������? �� ������ �� �����?
	if(Npc_KnowsInfo(other,DIA_Garond_Hello))
	{
		Info_AddChoice(DIA_Bilgot_HALLO,"��, � ������ �� ����� - �� � ���?",DIA_Bilgot_HALLO_Burg);
	};
	Info_AddChoice(DIA_Bilgot_HALLO,"� ������ �������� ������ ����...",DIA_Bilgot_HALLO_Zufall);
};

func void DIA_Bilgot_HALLO_Zufall()
{
	AI_Output(other,self,"DIA_Bilgot_HALLO_Zufall_15_00");	//� ������ �������� ������ ����...
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_01");	//������, ����� �� ������ ���� ��������. �� ������� ����� - ���������� ����������!
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_02");	//� ��� �� ��������, ����� ��� �� �������� ����-������ �� �����.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_03");	//��� �� �� ������� ���, ������ �� ������? ������ - ����� ���� ����� ������ ��������!
	AI_StopProcessInfos(self);
};

func void DIA_Bilgot_HALLO_Burg()
{
	AI_Output(other,self,"DIA_Bilgot_HALLO_Burg_15_00");	//��, � ������ �� ����� - �� � ���?
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_01");	//��� ��� ����?
	AI_Output(other,self,"DIA_Bilgot_HALLO_Burg_15_02");	//�� �����, ��� �����. ���� ��� ��� ���, ���� �� ��� ���� � ����.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_03");	//����. ����� ������ ����������� ���� � ������������.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_04");	//� ����� ���� ���-���. ���� �� � �� ��� ������� �� ������, � �� ������ ������.
	Info_ClearChoices(DIA_Bilgot_HALLO);
};


instance DIA_Bilgot_Job(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 3;
	condition = DIA_Bilgot_Job_Condition;
	information = DIA_Bilgot_Job_Info;
	permanent = FALSE;
	description = "� ��� �� ������ ����� �������, ������?";
};


func int DIA_Bilgot_Job_Condition()
{
	return TRUE;
};

func void DIA_Bilgot_Job_Info()
{
	AI_Output(other,self,"DIA_Bilgot_Job_15_00");	//� ��� �� ������ ����� �������, ������?
	AI_Output(self,other,"DIA_Bilgot_Job_05_01");	//� ����� ��� ������� �� ����������. �������-�����, ��������, ��� ��� ��������, ������ ����, ������ ����.
	AI_Output(self,other,"DIA_Bilgot_Job_05_02");	//��� ����� ���� �������� ���� �� ����� ��������. ��� ���� �� �����, ��, �� ������� ����, ��� ���� ��������� ���.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_why_15_00");	//� ������ �� ������ ������ ����?
	AI_Output(self,other,"DIA_Bilgot_Job_05_04");	//������ ��� ���� �����, ��� ���� ���������� �� ������� ���� ���������?
	AI_Output(self,other,"DIA_Bilgot_Job_05_03");	//� ������ � - ���, ��� �������� �� ������, ������� ���������� ������.
	AI_Output(self,other,"DIA_Bilgot_Job_05_05");	//��� �������� ���� �������. ����� ����, ���� �� ��� ������� ���������...
};


instance DIA_Bilgot_Hilfe(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 3;
	condition = DIA_Bilgot_Hilfe_Condition;
	information = DIA_Bilgot_Hilfe_Info;
	permanent = FALSE;
	description = "��� �� ������ � ���������?";
};


func int DIA_Bilgot_Hilfe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bilgot_Job) && (MIS_Fajeth_Kill_Snapper == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_Hilfe_Info()
{
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_00");	//��� �� ������ � ���������?
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_01");	//����� ���� ����� ���? � �� ������ ���, ��� ������ �� �����������!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_02");	//� ��������� ����������� �� ���� ���������.
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_03");	//��� �������. � �������� �� ���� - ��� �� ����������� �����!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_04");	//����� �������� ���, ��� �� � ��� ������.
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_05");	//��... � ��� �� ������ ����, �� ������ ��� ����� �������!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_06");	//��� �� ������?
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_07");	//���� ���� ������� ����� ��������� - �� ������ �������� ���� ������!
	if(!Npc_IsDead(Fed))
	{
		AI_Output(self,other,"DIA_Bilgot_Hilfe_05_08");	//��� ����� ����� �� ������������ - �� ������� � �����? � ����� ����� ����� �������, � � �� ���� ������� ��� ��!
	};
};


instance DIA_Bilgot_KNOWSLEADSNAPPER(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 4;
	condition = DIA_Bilgot_KNOWSLEADSNAPPER_Condition;
	information = DIA_Bilgot_KNOWSLEADSNAPPER_Info;
	permanent = FALSE;
	description = "�������� ���, ��� �� ������. � � ������ ���� ������!";
};


func int DIA_Bilgot_KNOWSLEADSNAPPER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bilgot_Hilfe) && (MIS_Fajeth_Kill_Snapper == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_KNOWSLEADSNAPPER_Info()
{
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_00");	//�������� ���, ��� �� ������. � � ������ ���� ������!
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_01");	//� ����, ��� ���� ������������ �� ����. ��� ��� ���� ����������. � �������� ����� �������� �� ����������.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_02");	//��� ����� ����� � �����, ��, ��� ��... ��������. ��� ������� �� ����� ���������� � �������� ������ �����.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_03");	//�� ���� ��� ���-���. ����� ��� ���� ���� ���������. �� ����� ������������, �� � ����� ���.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_04");	//������ �������� ����� ���������, ����� �������� ���� ����, �� ������� �� ������� ������.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_05");	//���� ���� ����� �� �������� � �����, �� ���� ������� ���������� ���� �� �����������.
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_06");	//��� ��� ����� ����� ������������ �����?
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_07");	//� ����� ��� �� �������� ������ ���������� �����.
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_08");	//�������. ��� �������, � �����. �������!
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_09");	//�����, �� ��� ��� �����!
	Wld_InsertNpc(NewMine_LeadSnapper,"OW_ORC_LOOKOUT_2_01");
	NewMine_LeadSnapper_Spawned = TRUE;
	B_LogEntries(TOPIC_FajethKillSnapper,"������ ��������� ��� � ������ ���� ���������. �� ������ ���� � ������ ���������� �����.");
	Log_CreateTopic(TOPIC_BilgotEscort,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BilgotEscort,LOG_Running);
	B_LogNextEntry(TOPIC_BilgotEscort,"������ �����, ����� � ����� ��� �� ������.");
};


instance DIA_Bilgot_TAKEYOUWITHME(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 2;
	condition = DIA_Bilgot_TAKEYOUWITHME_Condition;
	information = DIA_Bilgot_TAKEYOUWITHME_Info;
	permanent = FALSE;
	description = "����� ������, ������! ����� ���� ����, �� ������������ � ����.";
};


func int DIA_Bilgot_TAKEYOUWITHME_Condition()
{
	if((MIS_Fajeth_Kill_Snapper == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_TAKEYOUWITHME_Info()
{
	AI_Output(other,self,"DIA_Bilgot_TAKEYOUWITHME_15_00");	//����� ������, ������! ����� ���� ����, �� ������������ � ����.
//	AI_Output(self,other,"DIA_Bilgot_TAKEYOUWITHME_05_01");	//Gro�artig! Es reicht mir schon, wenn du mich �ber die gro�e Br�cke am Fluss vor der belagerten Burg bringst. Den Rest schaff ich dann schon.
//	AI_Output(other,self,"DIA_Bilgot_TAKEYOUWITHME_15_02");	//Dann beeil dich!
	AI_Output(self,other,"DIA_Bilgot_TAKEYOUWITHME_05_03");	//� �����!
	MIS_RescueBilgot = LOG_Running;
	self.flags = 0;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOWTOOCBRIDGE");
};


instance DIA_Bilgot_LAUFSCHNELLER(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 5;
	condition = DIA_Bilgot_LAUFSCHNELLER_Condition;
	information = DIA_Bilgot_LAUFSCHNELLER_Info;
	permanent = FALSE;
	description = "�� �� ��� �� ���� ������� �������?!";
};


func int DIA_Bilgot_LAUFSCHNELLER_Condition()
{
	if(MIS_RescueBilgot == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Bilgot_LAUFSCHNELLER_Info()
{
	AI_Output(other,self,"DIA_Bilgot_LAUFSCHNELLER_15_00");	//�� �� ��� �� ���� ������� �������?!
	AI_Output(self,other,"DIA_Bilgot_LAUFSCHNELLER_05_01");	//� ��� ��� ������, ��� ����.
};


instance DIA_Bilgot_BEIBRUECKEANGEKOMMEN(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 2;
	condition = DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition;
	information = DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition()
{
	if(MIS_RescueBilgot == LOG_Running)
	{
		if(Npc_GetDistToWP(self,"START") < 2000)
		{
			return TRUE;
		};
	};
};

func void DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info()
{
	AI_Output(other,self,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00");	//������, ������. ������ ��� ����. �� ���� ���������!
	AI_Output(self,other,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01");	//�������!
	AI_Output(other,self,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02");	//������, ����� ���� �� �����. � ����� ��������.
	AI_Output(self,other,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03");	//������!
	RescueBilgot_Day = Wld_GetDay();
	MIS_RescueBilgot = LOG_SUCCESS;
	B_GivePlayerXP(XP_BilgotEscort);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"FLEEOUTOFOW");
};


instance DIA_Bilgot_LetztePause(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 3;
	condition = DIA_Bilgot_LetztePause_Condition;
	information = DIA_Bilgot_LetztePause_Info;
	permanent = TRUE;
	description = "��� �� ������� �����? � �����, �� ����� ����� ������!";
};


func int DIA_Bilgot_LetztePause_Condition()
{
	if(MIS_RescueBilgot == LOG_SUCCESS)
	{
		if(Npc_GetDistToWP(self,"OW_PATH_1_17") < 800)
		{
			return TRUE;
		};
	};
};

func void DIA_Bilgot_LetztePause_Info()
{
	AI_Output(other,self,"DIA_Bilgot_LetztePause_15_00");	//��� �� ������� �����? � �����, �� ����� ����� ������!
	AI_Output(self,other,"DIA_Bilgot_LetztePause_05_01");	//� ������ �� � ����� ����. ��� ����� ����������� �������. � ���������. �� ��������!
	AI_Output(other,self,"DIA_Bilgot_LetztePause_15_02");	//��� �������.
	AI_Output(self,other,"DIA_Bilgot_LetztePause_05_03");	//������ ������� ���������.
	AI_StopProcessInfos(self);
};


instance DIA_Bilgot_Olav(C_Info)
{
	npc = VLK_4120_Bilgot;
	nr = 3;
	condition = DIA_Bilgot_Olav_Condition;
	information = DIA_Bilgot_Olav_Info;
	permanent = FALSE;
	description = "� ����� �����.";
};


func int DIA_Bilgot_Olav_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bilgot_Job))
	{
		if(!Npc_HasItems(Olav,ItSe_Olav))
		{
			return TRUE;
		};
	};
};

func void DIA_Bilgot_Olav_Info()
{
	AI_Output(other,self,"DIA_Bilgot_Olav_15_00");	//� ����� �����.
	AI_Output(self,other,"DIA_Bilgot_Olav_05_01");	//� ��� ��?
	AI_Output(other,self,"DIA_Bilgot_Olav_15_02");	//�� �����. ��� ����� �����.
	AI_Output(self,other,"DIA_Bilgot_Olav_05_03");	//��, ����. �������, ���� �� ��� ������� ��������� ������.
	B_GivePlayerXP(XP_Ambient);
};

