
instance DIA_Addon_Greg_NW_EXIT(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 999;
	condition = DIA_Addon_Greg_NW_EXIT_Condition;
	information = DIA_Addon_Greg_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Greg_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Greg_NW_Hallo(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_Hallo_Condition;
	information = DIA_Addon_Greg_NW_Hallo_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_Hallo_Condition()
{
	if(GregLocation == Greg_Farm1)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_00");	//���! ��, ��! �������-�� ����.
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_15_01");	//� ��� ����?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_02");	//�� ����� � �����? � ���� ��� ����?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_03");	//��������, �� ��������� ��������������� ������. ������, �� � ����� ������ �������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_04");	//�� �� �����, � ���� ��� �� ����� ������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_05");	//��������� �� ������ ���������� ��������� ������� �����, �� ��� ��?
	B_InsertGregWolfs();
	Info_ClearChoices(DIA_Addon_Greg_NW_Hallo);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"��� ���� ����.",DIA_Addon_Greg_NW_Hallo_weg);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"�������� �������. ������, ���� �� ������.",DIA_Addon_Greg_NW_Hallo_schleim);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"�� ������, ����� � ���� �������� ������.",DIA_Addon_Greg_NW_Hallo_vorsicht);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"�� �� ����-�� ���������?",DIA_Addon_Greg_NW_Hallo_hide);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"������ �� � ���?",DIA_Addon_Greg_NW_Hallo_ja);
};

func void DIA_Addon_Greg_NW_Hallo_weg()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_weg_15_00");	//��� ���� ����.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_weg_01_01");	//����, �� ������������� ��� ��������, �����? ������, � ��� �������. �� ��� ����������!
	Greg_NoHelpInNW += 1;
	MIS_Addon_Greg_BringMeToTheCity = LOG_FAILED;
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Greg_NW_Hallo_ja()
{
	DIA_Common_WhyNot();
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_01");	//�� ������ �������� ��������������� ������� ������! � ����� � ����� ����� � �� ���� ������� �������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_02");	//������� ��� �������� �� ����� ����� ��������, ��� ��������� ��������� � ���� ������ ������� ��������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_03");	//� ��� ������ ��� ����� ������� � �����, � � �� ����, ��� ��� �������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_04");	//� ������ � ���� ����������� ������ ����. ��� ������ �� �������� �������� ���� �� ����!
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_05");	//�� �� �������� ��� ������ ���� ����������, ������?
	Info_ClearChoices(DIA_Addon_Greg_NW_Hallo);
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW,"�������� ������� � �������� �� ����� �����, ����� � ����� ��� ������� � �����. � ������ ����� ��� ���� ������ ������ ���� ����������.");
	MIS_Addon_Greg_BringMeToTheCity = LOG_Running;
};

func void DIA_Addon_Greg_NW_Hallo_vorsicht()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_vorsicht_15_00");	//�� ������, ����� � ���� �������� ������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_01");	//��, �������, � �� ��������, ������� ����, � ������ ������ ��������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_02");	//�� �� �� �� ���������� ��������� ���� ��������� �� ��������� �����, ������� � ��� �� ���� ����?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_03");	//��, ��� �������? � ���� �� ���� ������������?
};

func void DIA_Addon_Greg_NW_Hallo_schleim()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_schleim_15_00");	//�������� �������. ������, ���� �� ������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_01");	//��� ������, ��� ������ ��, ��� � ���� � ����.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_02");	//���� �������� ����� ������ ���� �� ��������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_03");	//� ����, ��� ���� ���� � ��������� ������� ���������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_04");	//� �� ��������� ���� ������� ������� �� ��������� �� ���������� ��������������?
};

func void DIA_Addon_Greg_NW_Hallo_hide()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_hide_15_00");	//�� �� ����-�� ���������?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_hide_01_01");	//���, ������� ���! ��� �� ������?! ��� ������ �������� ������ ����� �������� - ��� ��� ����� �� ���� � ����.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_hide_01_02");	//�� ����� ����� ��������� � ����. �� ������ ������?
};


instance DIA_Addon_Greg_NW_Stadtwachen(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_Stadtwachen_Condition;
	information = DIA_Addon_Greg_NW_Stadtwachen_Info;
	permanent = TRUE;
	description = "������ ��������� ����������...";
};


func int DIA_Addon_Greg_NW_Stadtwachen_Condition()
{
	if((MIS_Addon_Greg_BringMeToTheCity == LOG_Running) && (GregLocation == Greg_Farm1))
	{
		return TRUE;
	};
};


var int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld;
var int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein;
var int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino;

func void DIA_Addon_Greg_NW_Stadtwachen_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_15_00");	//������ ��������� ����������...
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_01_01");	//��? � ���� ���� �����?
	Info_ClearChoices(DIA_Addon_Greg_NW_Stadtwachen);
	Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"� ������ ��� ��������.",DIA_Addon_Greg_NW_Stadtwachen_nochnicht);
	if(DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"�� �� ����� � �������?",DIA_Addon_Greg_NW_Stadtwachen_geld);
	};
	if((DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein == FALSE) && Npc_HasItems(other,ItWr_Passierschein))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"� ���� ���� ������� � �����.",DIA_Addon_Greg_NW_Stadtwachen_Schein);
	};
	if((MIS_Addon_Lester_PickForConstantino != FALSE) && (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino == FALSE))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"�� ������ ������� � �����, ������, ��� �� ������� ����.",DIA_Addon_Greg_NW_Stadtwachen_constantino);
	};
	if(Npc_HasItems(other,ITAR_Bau_L) || Npc_HasItems(other,ITAR_Bau_M))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"��� ��������� ����, ���� �� ���� ����� ������ �����������.",DIA_Addon_Greg_NW_Stadtwachen_klamotten);
	};
};

func void DIA_Addon_Greg_NW_Stadtwachen_klamotten()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_00");	//��� ��������� ����, ���� �� ���� ����� ������ �����������.
	if(Npc_HasItems(other,ITAR_Bau_L))
	{
		B_GiveInvItems(other,self,ITAR_Bau_L,1);
	}
	else
	{
		B_GiveInvItems(other,self,ITAR_Bau_M,1);
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_01");	//��� ��� ��� ��, ��� ��� �����! � ����, ��� ���� �� ���� ����������, ��������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_02");	//���� � ���� ���� ��� ������� ����������� ������, ����� �� ����� �������� �� ���� ��������.
	if(Npc_HasItems(self,ITAR_Bau_L))
	{
		AI_EquipArmor(self,ITAR_Bau_L);
	}
	else
	{
		AI_EquipArmor(self,ITAR_Bau_M);
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_03");	//�������! ��� ���� �������.
	CreateInvItems(self,ItMi_Gold,50);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	B_GivePlayerXP(XP_Greg_NW_GiveBauArmor);
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_04");	//���? ������ 50 �����? �� ��, ������ ����, ������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_05");	//������ - ��� �� ����� ������ �� �����, ���� ���. ������ ���� ��, ��� � ���� ���������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_06");	//� ���� ���� ������������, ��� �� ����� ���������� �����.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_07");	//� ��� �����, ����� ����, � ���� ����� ����������� ��������� ���� ������� �� ������. ������ ����!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MARKT");
	B_LogEntry(TOPIC_Addon_Greg_NW,"� ��� ��� ������ �����������. � ��� �� ����� ������ � �����.");
	MIS_Addon_Greg_BringMeToTheCity = LOG_SUCCESS;
};

func void DIA_Addon_Greg_NW_Stadtwachen_nochnicht()
{
	DIA_Common_INeedToThinkAboutIt();
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_nochnicht_01_01");	//������. �� �������, � ���� ���� �������.
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Greg_NW_Stadtwachen_Schein()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_Schein_15_00");	//� ���� ���� ������� � �����.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_Schein_01_01");	//(�������������) ���. �� ������ �������, ��� � ������ ������ ���� �� ����������?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_Schein_01_02");	//�������� �� ����, �������! � ��� �� ������� ���� ��������� �����.
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein = TRUE;
};

func void DIA_Addon_Greg_NW_Stadtwachen_constantino()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_constantino_15_00");	//�� ������ ������� � �����, ������, ��� �� ������� ����.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_constantino_01_01");	//���? � ���, ����� �� ��������, ������� �������� � ����� ��������?
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino = TRUE;
};

func void DIA_Addon_Greg_NW_Stadtwachen_geld()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_geld_15_00");	//�� �� ����� � �������?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_geld_01_01");	//���� �� � ��� ��������� ����������, � ��� �� ��� � ������.
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld = TRUE;
};


instance DIA_Addon_Greg_NW_PERM(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_PERM_Condition;
	information = DIA_Addon_Greg_NW_PERM_Info;
	permanent = TRUE;
	description = "��� ���-���...";
};


func int DIA_Addon_Greg_NW_PERM_Condition()
{
	if(((MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS) || (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)) && (GregLocation == Greg_Farm1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_PERM_15_00");	//��� ���-���...
	AI_Output(self,other,"DIA_Addon_Greg_NW_PERM_01_01");	//��������, �����. � ���� ���� ���������� ����.
	AI_Output(self,other,"DIA_Addon_Greg_NW_PERM_01_02");	//�� ��������� �������. �������?
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Greg_NW_MeetGregSecondTime(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_MeetGregSecondTime_Condition;
	information = DIA_Addon_Greg_NW_MeetGregSecondTime_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_MeetGregSecondTime_Condition()
{
	if(GregLocation == Greg_Taverne)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_MeetGregSecondTime_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_00");	//�� ������ ����������!
	if(MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_01");	//�������-������.
	}
	else if(MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_02");	//�������, ������� ��� ����� ��������� ��� ������. ����, �� ����������� �����...
	}
	else if(MIS_Addon_Greg_BringMeToTheCity == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_03");	//(���) � �����, ��� �� ������ ��� ������! � �� ������ ������.
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_04");	//�� �����, � ��� ��� � ��������, �����?
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_05");	//��� �, ��� ��������� ��� ����������, ��� ����� �� ������� ����, ����� ���� ������. �� �� ���� ��� �� �� ���� ������ ��� �� ������.
		Greg_NoHelpInNW += 1;
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_06");	//�� ��� ��� �������.
	Knows_Taverne = TRUE;
};


instance DIA_Addon_Greg_NW_wer(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_wer_Condition;
	information = DIA_Addon_Greg_NW_wer_Info;
	description = "� ��� �� ������ �����?";
};


func int DIA_Addon_Greg_NW_wer_Condition()
{
	if(GregLocation >= Greg_Taverne)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_wer_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_wer_15_00");	//� ��� �� ������ �����?
	AI_Output(self,other,"DIA_Addon_Greg_NW_wer_01_01");	//��� �� ���� ����.
	AI_Output(self,other,"DIA_Addon_Greg_NW_wer_01_02");	//���� �� � ����� ���� �������������, � ��, ��������, ��� ��� ������, �� ��� ��?
};


func void B_Greg_Search_Dexter()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_00");	//��� ����� ����� ������ ��������. � ������ ��� ���, � ��� ��� ������, ���� ����� �� �����.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_01");	//�� �����, ������ � ���� ������, � �� ����� ������� �������� �����.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_02");	//��������� ��� ��������, �� ��� ����������� � �������. � ��� ��� ����� �� ���������� � ����� '�'.
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW,"������� � �������� �� ����� ���� ����-��, ��� ��� ���������� �� ����� '�'.");
	SC_KnowsGregsSearchsDexter = TRUE;
};

instance DIA_Addon_Greg_NW_was(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_was_Condition;
	information = DIA_Addon_Greg_NW_was_Info;
	description = "��� ���� �� ���� �����?";
};


func int DIA_Addon_Greg_NW_was_Condition()
{
	if(GregLocation == Greg_Taverne)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_was_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_15_00");	//��� ���� �� ���� �����?
	if(MIS_Addon_Greg_BringMeToTheCity != FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_was_15_01");	//� ���� ��� ��� �������� � ��������� �������?
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_01_02");	//(���������) ������ � ���� �������� ��������, ��������.
	};
	B_Greg_Search_Dexter();
	Info_ClearChoices(DIA_Addon_Greg_NW_was);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"�� �������� � �����?",DIA_Addon_Greg_NW_was_Diego);
	if((Bdt13_Dexter_verraten == TRUE) || (Ranger_SCKnowsDexter == TRUE))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_was,"���� ����� �������?",DIA_Addon_Greg_NW_was_Dexter);
	};
	Info_AddChoice(DIA_Addon_Greg_NW_was,"�� ���� ������, ��� �������� ��� ��� ��������.",DIA_Addon_Greg_NW_was_no);
};

func void DIA_Addon_Greg_NW_was_GregUnsicher()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_GregUnsicher_01_00");	//����� ����, � ���. � �� �����, ��� ��� �����...
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_GregUnsicher_01_01");	//��� ����� ������� ���, ����� ������.
};

func void DIA_Addon_Greg_NW_was_UnNun()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_UnNun_15_00");	//���-������ ���?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_UnNun_01_01");	//��, �������� ������. ���� ���-��� ���.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_UnNun_01_02");	//��� ����� ������. ��� ����� ��������. ������ ��� ���� �� ��������.
	Info_ClearChoices(DIA_Addon_Greg_NW_was);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"� �� ���� ���� ������.",DIA_Addon_Greg_NW_was_NoHelp);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"��������? �� � �������!",DIA_Addon_Greg_NW_was_Orlan);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"������? ������ ����� ������ � ���������.",DIA_Addon_Greg_NW_was_SLD);
	if(Npc_HasItems(other,ItMi_Gold) < 10)
	{
		Info_AddChoice(DIA_Addon_Greg_NW_was,"� ������ ��� �����, ��� � ���� �� �������� ���� ������ �����.",DIA_Addon_Greg_NW_was_HierGold);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Greg_NW_was,"��� ���� 10 �������.",DIA_Addon_Greg_NW_was_HierGold);
	};
	Info_AddChoice(DIA_Addon_Greg_NW_was,"� �� �� ��� ������ ������ � ������?",DIA_Addon_Greg_NW_was_Waffenhaendler);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"������? ���� ��� ����� ������.",DIA_Addon_Greg_NW_was_Gold);
};

func void DIA_Addon_Greg_NW_was_NoHelp()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_NoHelp_15_00");	//� �� ���� ���� ������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_01");	//(���) ���, �� �� ������ ��� ������.
	if(Greg_NoHelpInNW == 1)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_02");	//������ ��� �� ������������� ��������� ��� �������.
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_03");	//��� ���� �����: ���������� ������� ���, ����� � ���� ������ �� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_04");	//� ������� ���, ���� ������.
	};
	Greg_NoHelpInNW += 1;
	MIS_Addon_Greg_RakeCave = LOG_OBSOLETE;
	B_CheckLog();
	GregLocation = Greg_Bigcross;
	AI_StopProcessInfos(self);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_UseMob(self,"BENCH",-1);
	};
	Npc_ExchangeRoutine(self,"BIGCROSS");
	B_StartOtherRoutine(BAU_974_Bauer,"START");
};

func void DIA_Addon_Greg_NW_was_Gold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Gold_15_00");	//������? ���� ��� ����� ������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_01");	//��������. �� ��� �� �� ������, ���� �� ��� � ���� ����? ������, �� ������� �� ��� �� ������� � ��������.
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Gold_15_02");	//� � ����, �������, ���� ����� �������...
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_03");	//�� �� �� ����� �� ������ ��� ������, ���� �� �����, ��� � �����.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_04");	//��� ��� �������� �������, ��� � ������ ���� ����������� ����.
};

func void DIA_Addon_Greg_NW_was_Waffenhaendler()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Waffenhaendler_15_00");	//� �� �� ��� ������ ������ � ������?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Waffenhaendler_01_01");	//�� ������? ��������� �������� ������� ���� ����!
};

func void DIA_Addon_Greg_NW_was_HierGold()
{
	if(Npc_HasItems(other,ItMi_Gold) < 10)
	{
		DIA_Common_NotEven10Gold();
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_was_HierGold_15_00");	//��� ���� 10 �������.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_01");	//(�������) ������ �������� ���� ���� ������ ����������. � ���� ���� ����� �������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_02");	//���������� ������ ���� ������. ��� ���� �� ��� ����, ��� � �����-�� ����� ���� ���������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_03");	//������ ��� ���� ������� ������. � ����, ����� �� ��� �����.
	B_LogEntry(TOPIC_Addon_Greg_NW,"� ��������� �������� � �������� �� ����� ������, �� �� ���������. � ������ ����� � ��� � ��� ������.");
	MIS_Addon_Greg_RakeCave = LOG_Running;
	Info_ClearChoices(DIA_Addon_Greg_NW_was);
};

func void DIA_Addon_Greg_NW_was_SLD()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_SLD_15_00");	//������? ������ ����� ������ � ���������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_01");	//���������. � ��� ������, ��� ������� ���� ����� ����� ��� ������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_02");	//������� ��� ���������� �����.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_03");	//��, ���� �������. �����, � ������������� ������ �� �����.
};

func void DIA_Addon_Greg_NW_was_Orlan()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Orlan_15_00");	//��������? �� � �������!
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Orlan_01_01");	//�����-���������� �� ���� ���� �� ������, ���� �� ��� �� ���������.
};

func void DIA_Addon_Greg_NW_was_no()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_no_15_00");	//�� ���� ������, ��� �������� ��� ��� ��������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_no_01_01");	//� ��� � ����.
	DIA_Addon_Greg_NW_was_UnNun();
};

func void DIA_Addon_Greg_NW_was_Diego()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Diego_15_00");	//�� �������� � �����?
	DIA_Addon_Greg_NW_was_GregUnsicher();
	DIA_Addon_Greg_NW_was_UnNun();
};

func void DIA_Addon_Greg_NW_was_Dexter()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Dexter_15_00");	//���� ����� �������?
	DIA_Addon_Greg_NW_was_GregUnsicher();
	DIA_Addon_Greg_NW_was_UnNun();
};


instance DIA_Addon_Greg_NW_RakeCaveLos(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RakeCaveLos_Condition;
	information = DIA_Addon_Greg_NW_RakeCaveLos_Info;
	description = "������ � ���� ������.";
};


func int DIA_Addon_Greg_NW_RakeCaveLos_Condition()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_RakeCaveLos_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCaveLos_15_00");	//������ � ���� ������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveLos_01_01");	//������ �� ����.
	AI_StopProcessInfos(self);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_UseMob(self,"BENCH",-1);
	};
	Npc_ExchangeRoutine(self,"RAKECAVE");
};

func void B_Greg_GoNow()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_03");	//�� � ���� �� �����? ��� ������ � ������� ����.
};


instance DIA_Addon_Greg_NW_RakeCaveThere(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RakeCaveThere_Condition;
	information = DIA_Addon_Greg_NW_RakeCaveThere_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_RakeCaveThere_Condition()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter))
	{
		if(Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Greg_NW_RakeCaveThere_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_00");	//�� ���, ��������, ��� � ������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_01");	//��� ���� �����.
	AI_WaitTillEnd(other,self);
	B_GiveInvItems(self,other,ItMw_2H_Axe_L_01,1);
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_02");	//� ������� ���� ���� ���-�� ������. ����� �������� �������.
	B_Greg_GoNow();
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCaveThere_15_04");	//� ��� �� ��?
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_05");	//���-�� �� ������ �������� ���. � ������ ��� ������.
	B_LogEntry(TOPIC_Addon_Greg_NW,"���� ������ �����, ����� � ������ �� ������ ��� ����. �� ������� ��, � ����� ������� �������. ��� ������ �� ��� ��� �����.");
	MIS_Addon_Greg_RakeCave_Day = Wld_GetDay();
};


instance DIA_Addon_Greg_NW_RakeCavePlundered(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RakeCavePlundered_Condition;
	information = DIA_Addon_Greg_NW_RakeCavePlundered_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_RakeCavePlundered_Condition()
{
	if((C_DaysSinceEvent(MIS_Addon_Greg_RakeCave_Day,2) || (RAKEPLACE[1] == TRUE)) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter))
	{
		if(Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_01_00");	//��� �� ��� ��� ����� �����? ����� ��, ��� � ���� ������?
	if(RAKEPLACE[1] == TRUE)
	{
		Info_AddChoice(DIA_Addon_Greg_NW_RakeCavePlundered,"��, � ������� ������� � �������.",DIA_Addon_Greg_NW_RakeCavePlundered_gold);
	};
	Info_AddChoice(DIA_Addon_Greg_NW_RakeCavePlundered,"���.",DIA_Addon_Greg_NW_RakeCavePlundered_No);
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_No()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_No_15_00");	//���.
	if(RAKEPLACE[1] == TRUE)
	{
		DIA_Common_01_AreYouTryingToPissMeOff();
		AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_No_15_02");	//�-�... ��� ������ �� ����.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_03");	//������ ������! � ��� � ����! ���� ����� ���������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_04");	//�� �����. ��� ����� ����. ��������.
	MIS_Addon_Greg_RakeCave = LOG_OBSOLETE;
	B_CheckLog();
	GregLocation = Greg_Bigcross;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"BIGCROSS");
	B_StartOtherRoutine(BAU_974_Bauer,"START");
};


var int B_Greg_RakePlaceBriefing_OneTime;

func void B_Greg_RakePlaceBriefing()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_00");	//���, ���������... �� ����� � ����� ���������� ���� ��������� ��������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_01");	//�� ������� ��������� ���� ��� ��� �����, ��� � ������� ���������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_02");	//���� - �� ����������� ��� ������, � ������ - ����� � ������ � ������, � ��������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_03");	//�� ������� ������� � ����� ����� ����� ��������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_04");	//� ������, � ������� ��� ����������, ���� ��� ���� ������.
	if(B_Greg_RakePlaceBriefing_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_Addon_Greg_NW,"������� ��������� ���, ��� ���� ��������� ����, ��� �� ������� ���� ����:");
		Log_AddEntry(TOPIC_Addon_Greg_NW,"1) �� ��������� ������� �� ����� � ����� ����������.");
		Log_AddEntry(TOPIC_Addon_Greg_NW,"2) �� ������� �������� �� ������.");
		Log_AddEntry(TOPIC_Addon_Greg_NW,"3) � ��������� ���������� �� ����� �������.");
		Log_AddEntry(TOPIC_Addon_Greg_NW,"4) � ������ ��� ���������, ������� �� ������� ������� � ����� ��������������.");
		Log_AddEntry(TOPIC_Addon_Greg_NW,"� ������ ����� ��� ��� ���������� ����. �� ����� ����� ���� � ����������� �� �����.");
		B_Greg_RakePlaceBriefing_OneTime = TRUE;
	};
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_gold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_00");	//��, � ������� ������� � �������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_01");	//(�����) ����� ��� ����.
	if(Npc_HasItems(other,ItSe_GoldPocket25) || (Npc_HasItems(other,ItMi_Gold) >= 25))
	{
		if(B_GiveInvItems(other,self,ItSe_GoldPocket25,1))
		{
			DIA_Common_TakeIt();
		}
		else if(B_GiveInvItems(other,self,ItMi_Gold,25))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_03");	//� ��� ������, ������ ���� 25 �������. ��� ���.
		};
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_04");	//����� ������.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_05");	//�� ����, �����������, ����� ���� ���� �����-�� ����.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_06");	//�����, ������ �����������. ���� ��� ��������� ����, ��� � ������� ���� ����. � � ����, ����� �� ��� �� ������.
		B_Greg_RakePlaceBriefing();
		Greg_SuchWeiter = TRUE;
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_07");	//� ���� ����� ���� � ����������� �� ����� �����. �� ������� ���� - �� �� ���� ���������.
		AI_StopProcessInfos(self);
		GregLocation = Greg_Bigcross;
		Npc_ExchangeRoutine(self,"BIGCROSS");
		B_GivePlayerXP(XP_Addon_RakeCavePlundered);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_08");	//� ���� ��� ������ ���.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_09");	//������ �������! ��� ���, ��������� ���� ������ ��� ���� �����?
		MIS_Addon_Greg_RakeCave = LOG_FAILED;
		B_CheckLog();
		GregLocation = Greg_Bigcross;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"BIGCROSS");
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_Addon_Greg_NW_LakeCave(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 100;
	condition = DIA_Addon_Greg_NW_LakeCave_Condition;
	information = DIA_Addon_Greg_NW_LakeCave_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_LakeCave_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter) && (Greg_SuchWeiter == FALSE))
	{
		if(Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Greg_NW_LakeCave_Info()
{
	B_Greg_GoNow();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Greg_NW_WhereTreasures(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 10;
	condition = DIA_Addon_Greg_NW_WhereTreasures_Condition;
	information = DIA_Addon_Greg_NW_WhereTreasures_Info;
	permanent = TRUE;
	description = "�������, ��� �� ����� ���� ����?";
};


func int DIA_Addon_Greg_NW_WhereTreasures_Condition()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_WhereTreasures_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WhereTreasures_15_00");	//�������, ��� �� ����� ���� ����?
	B_Greg_RakePlaceBriefing();
};


instance DIA_Addon_Greg_NW_PermTaverne(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 99;
	condition = DIA_Addon_Greg_NW_PermTaverne_Condition;
	information = DIA_Addon_Greg_NW_PermTaverne_Info;
	permanent = TRUE;
	description = "��� ���-���...";
};


func int DIA_Addon_Greg_NW_PermTaverne_Condition()
{
	if(((GregLocation == Greg_Bigcross) && !Npc_KnowsInfo(other,DIA_Addon_Greg_NW_Bigcross) && ((Npc_GetDistToWP(self,"BIGCROSS") >= 1000) || (MIS_Addon_Greg_RakeCave == LOG_SUCCESS))) || ((GregLocation == Greg_Dexter) && Npc_KnowsInfo(other,DIA_Addon_Greg_NW_WasWillstDu)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_PermTaverne_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_PermTaverne_15_00");	//��� ���-���...
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_01");	//������� ������� ��� ��� ��� ����. ����� �� ���������.
	}
	else if(MIS_Addon_Greg_RakeCave == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_02");	//�������, � ����������, ��� �� ��� �����. �� ��� �� ������ ��� ��������. ���������, � ��� �?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_03");	//�� � ��� ������� ����� �������.
	};
};


instance DIA_Addon_Greg_NW_Bigcross(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_Bigcross_Condition;
	information = DIA_Addon_Greg_NW_Bigcross_Info;
	description = "��� ����?";
};


func int DIA_Addon_Greg_NW_Bigcross_Condition()
{
	if(GregLocation == Greg_Bigcross)
	{
		if(Npc_GetDistToWP(self,"BIGCROSS") < 1000)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Greg_NW_Bigcross_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Bigcross_15_01");	//��� ����?
	if(Greg_NoHelpInNW > 0)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_00");	//��� �� ��� �������� ������������!
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_02");	//��� ����. �� ��������� ��������� ���� ������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_03");	//� ������, ��� ��� - ������� ������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_04");	//�� �� ������� ���������, ��� ��� ����� ���� ��������� ��������.
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_05");	//�� ���, �� ����� ��� ����?
		if((RAKEPLACE[1] == FALSE) || (RAKEPLACE[2] == FALSE) || (RAKEPLACE[3] == FALSE) || (RAKEPLACE[4] == FALSE) || (RAKEPLACE[5] == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_Bigcross_15_06");	//���, ��� �� ���.
			AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_07");	//��� ����������! �� ��� �� ��� � ������.
		};
	};
};


instance DIA_Addon_Greg_NW_WhatWantFromSLD(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_WhatWantFromSLD_Condition;
	information = DIA_Addon_Greg_NW_WhatWantFromSLD_Info;
	description = "��� ���� ���� ����� �� ���������?";
};


func int DIA_Addon_Greg_NW_WhatWantFromSLD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_NW_Bigcross) && (GregLocation == Greg_Bigcross))
	{
		if(Npc_GetDistToWP(self,"BIGCROSS") < 1000)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Greg_NW_WhatWantFromSLD_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WhatWantFromSLD_15_00");	//��� ���� ���� ����� �� ���������?
	if(SC_KnowsGregsSearchsDexter == FALSE)
	{
		B_Greg_Search_Dexter();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_WhatWantFromSLD_01_01");	//� ���� ��� �������. � ��� �������� � ������� �����.
		AI_Output(self,other,"DIA_Addon_Greg_NW_WhatWantFromSLD_01_02");	//�� ��� ������� ���� �� ������, � ��� � ������.
	};
};


instance DIA_Addon_Greg_NW_DexterFound(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_DexterFound_Condition;
	information = DIA_Addon_Greg_NW_DexterFound_Info;
	description = "� �����, ��� ���� ����� ������� �� ����� �������.";
};


func int DIA_Addon_Greg_NW_DexterFound_Condition()
{
	if((SC_KnowsGregsSearchsDexter == TRUE) && ((Bdt13_Dexter_verraten == TRUE) || (Ranger_SCKnowsDexter == TRUE)) && !Npc_KnowsInfo(other,DIA_Addon_Greg_NW_CaughtDexter2))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_DexterFound_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_15_00");	//� �����, ��� ���� ����� ������� �� ����� �������.
	if(GregLocation == Greg_Dexter)
	{
		DIA_Common_01_AreYouTryingToPissMeOff();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_01_01");	//���� ������, ������ ��� ����� ��� ���?!
		Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
		Info_AddChoice(DIA_Addon_Greg_NW_DexterFound,"��, � ������ �����������.",DIA_Addon_Greg_NW_DexterFound_weg);
		Info_AddChoice(DIA_Addon_Greg_NW_DexterFound,"����� ������ ������.",DIA_Addon_Greg_NW_DexterFound_together);
		Info_AddChoice(DIA_Addon_Greg_NW_DexterFound,"�����, � ���� ������ ���� ��� �����.",DIA_Addon_Greg_NW_DexterFound_wo);
	};
};

func void DIA_Addon_Greg_NW_DexterFound_weg()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_weg_15_00");	//��, � ������ �����������.
	Greg_Rejected = TRUE;
	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
};

func void DIA_Addon_Greg_NW_DexterFound_together()
{
	DIA_Common_LetsGoTogether();
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_together_01_01");	//���, � ����� ����. � ���� � ��� ���� ������ �����.
};

func void DIA_Addon_Greg_NW_DexterFound_wo()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_00");	//�����, � ���� ������ ���� ��� �����.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_01");	//�������������? � ��� �� �� ������?
	if(GregLocation == Greg_Bigcross)
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_02");	//�������� ������.
	}
	else
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_02");	//� ������ ���� �� ����� ���������.
		AI_Output(self,other,"DIA_Addon_Greg_NW_PERM_01_01");	//��������, �����. � ���� ���� ���������� ����.
	};
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_03");	//������, �� ���� �������� ����� ��������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_04");	//��! ��, ������, ��� ��.
	if(GregLocation == Greg_Bigcross)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_05");	//� ����, ��� ���� ���� �������� ���-�� �����.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_06");	//������ ���, ��� ��� �������� ������� - �������� ��� ������� � ������ ������� � ������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_07");	//� ����� ����� �������, � ���� ������ ��� �� �����.
	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Greg_NW_CaughtDexter(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_CaughtDexter_Condition;
	information = DIA_Addon_Greg_NW_CaughtDexter_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_CaughtDexter_Condition()
{
	if((GregLocation == Greg_Dexter) && !Npc_KnowsInfo(other,DIA_Addon_Greg_NW_WodennNu))
	{
		if(!Npc_IsDead(Dexter))
		{
			if(Npc_GetDistToWP(self,"NW_CASTLEMINE_HUT_10") >= 500)
			{
				return TRUE;
			};
		};
	};
};

func void DIA_Addon_Greg_NW_CaughtDexter_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter_01_00");	//(������) �� � ��� ��� ������?
	AI_Output(other,self,"DIA_Addon_Greg_NW_CaughtDexter_15_01");	//���, �������? ����� �����.
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter_01_02");	//����� ����� � ���� ������!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DEXTERHOUSERUN");
};


instance DIA_Addon_Greg_NW_WodennNu(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_WodennNu_Condition;
	information = DIA_Addon_Greg_NW_WodennNu_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_WodennNu_Condition()
{
	if(GregLocation == Greg_Dexter)
	{
		if(!Npc_IsDead(Dexter))
		{
			if(Npc_GetDistToWP(self,"NW_CASTLEMINE_HUT_10") < 500)
			{
				return TRUE;
			};
		};
	};
};

func void DIA_Addon_Greg_NW_WodennNu_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_WodennNu_01_00");	//� ���� �� �� �����?
	AI_Output(other,self,"DIA_Addon_Greg_NW_WodennNu_15_01");	//��� �����.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WodennNu_01_02");	//�� ��� ����� � ����� ���!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DEXTERHOUSEWALK");
};


instance DIA_Addon_Greg_NW_CaughtDexter2(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_CaughtDexter2_Condition;
	information = DIA_Addon_Greg_NW_CaughtDexter2_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_CaughtDexter2_Condition()
{
	if(GregLocation == Greg_Dexter)
	{
		if(Npc_IsDead(Dexter))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Greg_NW_CaughtDexter2_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter2_01_00");	//���. ������, ������� ���� �������?
	AI_Output(other,self,"DIA_Addon_Greg_NW_CaughtDexter2_15_01");	//������, �� �����.
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter2_01_02");	//�� ���� �������, ��� ��� ��� �����. �������, ��� � ���� ���� � �����.
	if(!Npc_KnowsInfo(other,DIA_Addon_Greg_NW_WodennNu))
	{
		Npc_ExchangeRoutine(self,"DEXTERHOUSEWALK");
	};
	B_GivePlayerXP(XP_Ambient);
};


func void B_GregTalksAboutPortal()
{
	if(Greg_KnowsPortal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_04");	//�����, ��, ��������, �� ������, ��� ������� �� ������ ������ �� ������-������� ��������?
		if(SC_KnowsPortal == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_05");	//��������, ����� ������, ������� ���������� ���� ����.
			AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_06");	//��� ��� �� ����?
			AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_07");	//���� ����... � ����� ������� � ���� ����?
		};
		AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_08");	//���.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_09");	//(��������) ������, � ����� �������.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_10");	//�� �������� � ���� ���� ��������� �������.
		Greg_KnowsPortal = TRUE;
	};
};


instance DIA_Addon_Greg_NW_RavensLetter(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RavensLetter_Condition;
	information = DIA_Addon_Greg_NW_RavensLetter_Info;
	description = "� ����� ������ ��� ������.";
};


func int DIA_Addon_Greg_NW_RavensLetter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_NW_CaughtDexter2) && Npc_HasItems(other,ItWr_RavensKidnapperMission_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_RavensLetter_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_00");	//� ����� ������ ��� ������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_01");	//������.
	AI_PrintScreen("������� ������",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	B_ReadFakeItem(self,other,Fakescroll,1);
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_02");	//���� ������! ��� ��� ������ �� �������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_03");	//������ ���� ��� ������ ��� �������.
	B_GregTalksAboutPortal();
	AI_PrintScreen("������� ��������",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
};


instance DIA_Addon_Greg_NW_WasWillstDu(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_WasWillstDu_Condition;
	information = DIA_Addon_Greg_NW_WasWillstDu_Info;
	description = "� ��� ���� ���� ����� �� ��������?";
};


func int DIA_Addon_Greg_NW_WasWillstDu_Condition()
{
	if((GregLocation == Greg_Dexter) && (Npc_KnowsInfo(other,DIA_Addon_Greg_NW_RavensLetter) || (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_WasWillstDu_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_15_00");	//� ��� ���� ���� ����� �� ��������?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_01_01");	//� ������� ���� ��-�� ������-��������� ���. � � ���� ���� ���������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_01_02");	//� ��������, ��� ���� ������� ��������� ���, ��� ��������� ���� ��� �������.
	B_GregTalksAboutPortal();
	Npc_ExchangeRoutine(self,"DEXTERTHRONE");
};

instance DIA_Addon_Greg_NW_Loc(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_Loc_Condition;
	information = DIA_Addon_Greg_NW_Loc_Info;
	description = "� ��� ��������� �� ����� ������?";
};


func int DIA_Addon_Greg_NW_Loc_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_NW_WasWillstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_Loc_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_da_15_00");	//� ��� ��������� �� ����� ������?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_01");	//�-�, ���� ���� �� ����� �������� ���� �������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_02");	//����� ��� �������. ������ ��������, ��� ��, ����� ��� �� ���������.
};

instance DIA_Addon_Greg_NW_Skip(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 6;
	condition = DIA_Addon_Greg_NW_Skip_Condition;
	information = DIA_Addon_Greg_NW_Skip_Info;
	description = "�������� �� ������ � �������� ������ �� ����� ����.";
};


func int DIA_Addon_Greg_NW_Skip_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_NW_WasWillstDu) && (PlayerTalkedToSkipNW == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_Skip_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_Skip_15_00");	//�������� �� ������ � �������� ������ �� ����� ����.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_Skip_01_01");	//�, ���� �����. � ���� ��� ��� ���, ������ �� �� �������� ������?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_Skip_01_02");	//������, � ��� ��� ������, ��� � ����.
	SC_KnowsConnectionSkipGreg = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

func int C_SCHasGregsItems()
{
	if((Npc_HasItems(other,ItSe_GoldPocket100) || (Npc_HasItems(other,ItMi_Gold) >= 100)) && Npc_HasItems(other,ItMi_GoldChalice) && Npc_HasItems(other,ItMi_GregsSilverPlate) && Npc_HasItems(other,ItAm_Addon_Greg))
	{
		return TRUE;
	};
	return FALSE;
};

func void B_GiveGregsItems()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_00");	//��� ���� ����.
	if(B_GiveInvItems(other,self,ItSe_GoldPocket100,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_01");	//������� �� ��� ��������.
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_02");	//100 �������.
	};
	B_GiveInvItems(other,self,ItMi_GoldChalice,1);
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_03");	//������� ����.
	B_GiveInvItems(other,self,ItMi_GregsSilverPlate,1);
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_04");	//���������� �����.
	B_GiveInvItems(other,self,ItAm_Addon_Greg,1);
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_05");	//� ������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_06");	//����� ������. ����, ���� ������� ��� �� ����������� ���� ��� ����.
	MIS_Addon_Greg_RakeCave = LOG_SUCCESS;
};


instance DIA_Addon_Greg_NW_FoundTreasure(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_FoundTreasure_Condition;
	information = DIA_Addon_Greg_NW_FoundTreasure_Info;
	permanent = TRUE;
	description = "� ����� ��� ���������� ����.";
};


func int DIA_Addon_Greg_NW_FoundTreasure_Condition()
{
	if((RAKEPLACE[1] == TRUE) && (RAKEPLACE[2] == TRUE) && (RAKEPLACE[3] == TRUE) && (RAKEPLACE[4] == TRUE) && (RAKEPLACE[5] == TRUE) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_FoundTreasure_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_15_00");	//� ����� ��� ���������� ����.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_01_01");	//����� � ���� ������ ���� ����� ��� �������, ������� ����, ���������� ����� � ������. ����� �� ����!
	Info_ClearChoices(DIA_Addon_Greg_NW_FoundTreasure);
	Info_AddChoice(DIA_Addon_Greg_NW_FoundTreasure,"� ���� � ����� �� ���.",DIA_Addon_Greg_NW_FoundTreasure_not);
	if(C_SCHasGregsItems())
	{
		Info_AddChoice(DIA_Addon_Greg_NW_FoundTreasure,"��� ���� ����.",DIA_Addon_Greg_NW_FoundTreasure_ja);
	};
};

func void DIA_Addon_Greg_NW_FoundTreasure_ja()
{
	B_GiveGregsItems();
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_07");	//��� ���� ����.
	B_GiveInvItems(self,other,ItMi_Gold,30);
	Info_ClearChoices(DIA_Addon_Greg_NW_FoundTreasure);
	B_GivePlayerXP(XP_Addon_Greg_RakeCave);
};

func void DIA_Addon_Greg_NW_FoundTreasure_not()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_not_15_00");	//� ���� � ����� �� ���.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_not_01_01");	//����� ���������� � ������� �� ���, ���� � �� �����������.
	AI_StopProcessInfos(self);
};

