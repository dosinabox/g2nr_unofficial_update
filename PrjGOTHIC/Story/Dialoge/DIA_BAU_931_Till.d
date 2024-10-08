
instance DIA_Till_EXIT(C_Info)
{
	npc = BAU_931_Till;
	nr = 999;
	condition = DIA_Till_EXIT_Condition;
	information = DIA_Till_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Till_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Till_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Till_HALLO(C_Info)
{
	npc = BAU_931_Till;
	nr = 3;
	condition = DIA_Till_HALLO_Condition;
	information = DIA_Till_HALLO_Info;
	description = "������.";
};


func int DIA_Till_HALLO_Condition()
{
	if(Kapitel < 5)
	{
		return TRUE;
	};
};

func void DIA_Till_HALLO_Info()
{
	AI_Output(other,self,"DIA_Till_HALLO_15_00");	//������.
	AI_Output(self,other,"DIA_Till_HALLO_03_01");	//� �� ������������ � ��������. ������� ���� ��� ���������?
	Info_ClearChoices(DIA_Till_HALLO);
	Info_AddChoice(DIA_Till_HALLO,"� �� �������.",DIA_Till_HALLO_keinervoneuch);
	if(!Npc_IsDead(Sekob))
	{
		Info_AddChoice(DIA_Till_HALLO,"�� ���������� �����?",DIA_Till_HALLO_selber);
	};
	if(Kapitel < 3)
	{
		Npc_ExchangeRoutine(self,"START");
	};
};

func void DIA_Till_HALLO_selber()
{
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_00");	//�� ���������� �����?
	AI_Output(self,other,"DIA_Till_HALLO_selber_03_01");	//(���������) �-�. ���, � ����� ���� ��� ������. �� ����� ������� ������ �� ����� � ����, ��� �����, ��� �� ������ ������, �������� �� ���.
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_02");	//����������!
	Info_ClearChoices(DIA_Till_HALLO);
};

func void DIA_Till_HALLO_keinervoneuch()
{
	AI_Output(other,self,"DIA_Till_HALLO_keinervoneuch_15_00");	//� �� �������.
	AI_Output(self,other,"DIA_Till_HALLO_keinervoneuch_03_01");	//� ���� ���� ����� ����? � ��� ������ ���. ��� ��� ����� �����.
	Info_ClearChoices(DIA_Till_HALLO);
};


instance DIA_Till_FELDARBEITER(C_Info)
{
	npc = BAU_931_Till;
	nr = 4;
	condition = DIA_Till_FELDARBEITER_Condition;
	information = DIA_Till_FELDARBEITER_Info;
	description = "�� ������ ��� ����������� �� ������ �����������?";
};


func int DIA_Till_FELDARBEITER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_HALLO) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_FELDARBEITER_Info()
{
	AI_Output(other,self,"DIA_Till_FELDARBEITER_15_00");	//�� ������ ��� ����������� �� ������ �����������?
	AI_Output(self,other,"DIA_Till_FELDARBEITER_03_01");	//������� - ����� ������. ���� �� ������������ ����������, ����� �� ����� �������� - ��� ��������� �������.
};


instance DIA_Till_SEKOB(C_Info)
{
	npc = BAU_931_Till;
	nr = 9;
	condition = DIA_Till_SEKOB_Condition;
	information = DIA_Till_SEKOB_Info;
	description = "��� ����� ���������� � ����� �����.";
};


func int DIA_Till_SEKOB_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_FELDARBEITER) && !Npc_KnowsInfo(other,DIA_Sekob_HALLO) && (Kapitel < 3) && !Npc_IsDead(Sekob))
	{
		return TRUE;
	};
};

func void DIA_Till_SEKOB_Info()
{
	AI_Output(other,self,"DIA_Till_SEKOB_15_00");	//��� ����� ���������� � ����� �����.
	AI_Output(self,other,"DIA_Till_SEKOB_03_01");	//� ���� ��� �� ��� �������. � ��� �������������. ��� � ���� ������ ����?
	AI_Output(other,self,"DIA_Till_SEKOB_15_02");	//��������, ���� �������� � ������ ����.
	AI_Output(self,other,"DIA_Till_SEKOB_03_03");	//�� �������� ���� ������� ������ � ������� ������, ��?
	AI_Output(other,self,"DIA_Till_SEKOB_15_04");	//������.
	AI_Output(self,other,"DIA_Till_SEKOB_03_05");	//��������, ����� ����� ������� ���.
	AI_Output(other,self,"DIA_Till_SEKOB_15_06");	//�� ����������, �������. � ����� ��� ���.
	AI_Output(self,other,"DIA_Till_SEKOB_03_07");	//��� �������.
	AI_StopProcessInfos(self);
};


instance DIA_Till_WASMACHSTDU(C_Info)
{
	npc = BAU_931_Till;
	nr = 10;
	condition = DIA_Till_WASMACHSTDU_Condition;
	information = DIA_Till_WASMACHSTDU_Info;
	description = "� ��� �� �������, ����� �� ������� � ������� ���� �����?";
};


func int DIA_Till_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_HALLO) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_00");	//� ��� �� �������, ����� �� ������� � ������� ���� �����?
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_01");	//���� �� ������.
	if(hero.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_02");	//������� ��������� �� ������ ��� ���� ��������� �� ���� ����� � ������ ���, ��� ����� �����.
		AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_03");	//��� ������� ���� ����� ������ �� ������� ������, ��� ������ ����� ����.
		AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_04");	//���� �� � �������� �� ������ �� ���, ��� �� �� �������������.
	};
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_05");	//�������!
};


instance DIA_Till_WARUMNICHTSLD(C_Info)
{
	npc = BAU_931_Till;
	nr = 11;
	condition = DIA_Till_WARUMNICHTSLD_Condition;
	information = DIA_Till_WARUMNICHTSLD_Info;
	description = "� ����� �������� �� �������� ��� ���������� �� ���������?";
};


func int DIA_Till_WARUMNICHTSLD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_WASMACHSTDU) && (hero.guild != GIL_MIL) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_WARUMNICHTSLD_Info()
{
	AI_Output(other,self,"DIA_Till_WARUMNICHTSLD_15_00");	//� ����� �������� �� �������� ��� ���������� �� ���������?
	AI_Output(self,other,"DIA_Till_WARUMNICHTSLD_03_01");	//�� ���� �������� ���������, � ��� ����� �������� ���� �����.
};


instance DIA_Till_BRONKO(C_Info)
{
	npc = BAU_931_Till;
	nr = 5;
	condition = DIA_Till_BRONKO_Condition;
	information = DIA_Till_BRONKO_Info;
	description = "��� ��� �������� ������� ����� �� ���� ���������� ����?";
};


func int DIA_Till_BRONKO_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_FELDARBEITER) && Npc_KnowsInfo(other,DIA_Bronko_HALLO) && (Kapitel < 5) && !Npc_IsDead(Bronko))
	{
		return TRUE;
	};
};

func void DIA_Till_BRONKO_Info()
{
	AI_Output(other,self,"DIA_Till_BRONKO_15_00");	//��� ��� �������� ������� ����� �� ���� ���������� ����, ���������, ��� �� ��� ������?
	AI_Output(self,other,"DIA_Till_BRONKO_03_01");	//(�����) ���. ��. � ����. ��� ������. �� ������ ��, ��� �����.
	AI_Output(self,other,"DIA_Till_BRONKO_03_02");	//� ��� ������� ��� ������� ��� ������, ����� �� ������ �� �� � ����� ��������, �� ��� ��� �����...
	AI_Output(other,self,"DIA_Till_BRONKO_15_03");	//��?
	AI_Output(self,other,"DIA_Till_BRONKO_03_04");	//�� ��� ����� �� ����� ��������.
	if(!Npc_IsDead(Sekob))
	{
		AI_Output(self,other,"DIA_Till_BRONKO_03_05");	//����� ���� ����� �� ��������, ��� ��� ��� ��� �� ������� ������� ��� ��������� � ������.
	};
};


instance DIA_Till_BRONKOZURARBEIT(C_Info)
{
	npc = BAU_931_Till;
	nr = 6;
	condition = DIA_Till_BRONKOZURARBEIT_Condition;
	information = DIA_Till_BRONKOZURARBEIT_Info;
	permanent = TRUE;
	description = "����� ����, � ����� ������.";
};


var int DIA_Till_BRONKOZURARBEIT_noPerm;

func int DIA_Till_BRONKOZURARBEIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_BRONKO) && (DIA_Till_BRONKOZURARBEIT_noPerm == FALSE) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_BRONKOZURARBEIT_Info()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_15_00");	//����� ����, � ����� ������.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_03_01");	//��� �� ������ ������� ����? ������, ��������, ���� �� ������� ��������� ������ ��������, � ������� ����, ������, 10 ������� �����. ��� �������?
	Till_Angebot = 10;
	Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
	if(Till_IchMachsNurEinmal == TRUE)
	{
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"� ���� ������.",DIA_Till_BRONKOZURARBEIT_mehr);
	}
	else
	{
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"��� �������. �� ��� ����� ������ �����.",DIA_Till_BRONKOZURARBEIT_mehr);
	};
	Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"������. � ��������, ��� ����� �������.",DIA_Till_BRONKOZURARBEIT_ok);
	Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"� ������� ��� ����.",DIA_Till_BRONKOZURARBEIT_nochnicht);
};

func void DIA_Till_BRONKOZURARBEIT_nochnicht()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_nochnicht_15_00");	//� ������� ��� ����.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_nochnicht_03_01");	//��� ������.
	Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
	AI_StopProcessInfos(self);
};

func void DIA_Till_BRONKOZURARBEIT_ok()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_ok_15_00");	//������. � ��������, ��� ����� �������.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_ok_03_01");	//�� ���������� � ����.
	DIA_Till_BRONKOZURARBEIT_noPerm = TRUE;
	if(MIS_Sekob_Bronko_eingeschuechtert != LOG_SUCCESS)
	{
		MIS_Sekob_Bronko_eingeschuechtert = LOG_Running;
		Log_CreateTopic(TOPIC_Bronkoeingeschuechtert,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Bronkoeingeschuechtert,LOG_Running);
		B_LogEntry(TOPIC_Bronkoeingeschuechtert,"���� �� ����� ��������� ������ ��������. ���� �����, ����� ��� ���������� ������� �.");
	}
	else
	{
		Log_CreateTopic(TOPIC_Bronkoeingeschuechtert,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Bronkoeingeschuechtert,LOG_SUCCESS);
		B_LogEntry(TOPIC_Bronkoeingeschuechtert,"���� ������� ������� �� ����� ��������, ������ ��� ������ ��� �������� �� ����.");
	};
	AI_StopProcessInfos(self);
};

func void DIA_Till_BRONKOZURARBEIT_mehr()
{
	if(Till_IchMachsNurEinmal == TRUE)
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_00");	//� ���� ������.
	}
	else
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_01");	//��� �������. �� ��� ����� ������ �����.
		Till_IchMachsNurEinmal = TRUE;
	};
	if(Till_Angebot == 10)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_02");	//������. 20 ������� �����.
		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"� ���� ������.",DIA_Till_BRONKOZURARBEIT_mehr);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"������. � ��������, ��� ����� �������.",DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 20;
	}
	else if(Till_Angebot == 20)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_03");	//30?
		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"� ���� ������.",DIA_Till_BRONKOZURARBEIT_mehr);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"������. � ��������, ��� ����� �������.",DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 30;
	}
	else if(Till_Angebot == 30)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_04");	//����� ����... 50?
		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"� ���� ������.",DIA_Till_BRONKOZURARBEIT_mehr);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"������. � ��������, ��� ����� �������.",DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 50;
	}
	else if(Till_Angebot == 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_05");	//������. 70?
		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"� ���� ������.",DIA_Till_BRONKOZURARBEIT_mehr);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"������. � ��������, ��� ����� �������.",DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 70;
	}
	else if(Till_Angebot == 70)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_06");	//������, ������! � ��� ���� 100 ������� �����. �� ��� ���, ��� � ���� ����.
		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"������. � ��������, ��� ����� �������.",DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 100;
	};
};


instance DIA_Till_BRONKOWIEDERANARBEIT(C_Info)
{
	npc = BAU_931_Till;
	nr = 7;
	condition = DIA_Till_BRONKOWIEDERANARBEIT_Condition;
	information = DIA_Till_BRONKOWIEDERANARBEIT_Info;
	description = "������ �������� � ������.";
};


func int DIA_Till_BRONKOWIEDERANARBEIT_Condition()
{
	if((MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS) && (DIA_Till_BRONKOZURARBEIT_noPerm == TRUE) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_BRONKOWIEDERANARBEIT_Info()
{
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_00");	//������ �������� � ������.
	AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_01");	//������? ��� �����������.
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_02");	//��. � ������ � ���� �������� ��� ������.
	if(Till_Angebot <= 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_03");	//(���������) ����. ������. ������ ���� ������, ������?
		CreateInvItems(self,ItMi_Gold,Till_Angebot);
		B_GiveInvItems(self,other,ItMi_Gold,Till_Angebot);
	}
	else
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_04");	//� ���������, � ���� ��� ����� �����. �� � ����� ���������� ���� �� ������.
		Till_HatSeinGeldBehalten = TRUE;
	};
	B_GivePlayerXP(XP_BronkoGehtAnDieArbeit);
	AI_StopProcessInfos(self);
};


instance DIA_Till_PERMKAP1(C_Info)
{
	npc = BAU_931_Till;
	nr = 99;
	condition = DIA_Till_PERMKAP1_Condition;
	information = DIA_Till_PERMKAP1_Info;
	permanent = TRUE;
	description = "(����������)";
};


func int DIA_Till_PERMKAP1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_HALLO))
	{
		if(Kapitel == 5)
		{
			if((MIS_BringRosiBackToSekob != LOG_SUCCESS) && (Rosi_FleeFromSekob_Kap5 == TRUE))
			{
				DIA_Till_PERMKAP1.description = "� �� ����-�� ������, �? ������� �� ������ ������ ���� �����.";
			}
			else
			{
				DIA_Till_PERMKAP1.description = "��, ����, �������, ���� � ������� ���� � �����.";
			};
		}
		else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			DIA_Till_PERMKAP1.description = "�����, ���� ����� �������� �������, ����� �� ����� ������� � �������.";
		}
		else if(Till_HatSeinGeldBehalten == TRUE)
		{
			DIA_Till_PERMKAP1.description = "�� ��, ������ ���������...";
		}
		else
		{
			DIA_Till_PERMKAP1.description = "���� ������� ����� ��� �� ��� � �����?";
		};
		return TRUE;
	};
};

func void DIA_Till_PERMKAP1_Info()
{
	if(Kapitel == 5)
	{
		if((MIS_BringRosiBackToSekob != LOG_SUCCESS) && (Rosi_FleeFromSekob_Kap5 == TRUE))
		{
			AI_Output(other,self,"DIA_Till_PERMKAP1_15_00");	//� �� ����-�� ������, �? ������� �� ������ ������ ���� �����.
			AI_Output(self,other,"DIA_Till_PERMKAP1_03_01");	//�����-������ � ����� ���� �����.
		};
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_02");	//��, ����, �������, ���� � ������� ���� � �����.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_03");	//����� ������ ���� � �����.
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_04");	//�����, ���� ����� �������� �������, ����� �� ����� ������� � �������.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_05");	//�����-������ � ���������� � �����.
	}
	else if(Till_HatSeinGeldBehalten == TRUE)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_06");	//�� ��, ������ ���������...
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_07");	//�����.
	}
	else
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_08");	//���� ������� ����� ��� �� ��� � �����?
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_09");	//������ ���� � �����, ��, �����!
	};
	AI_StopProcessInfos(self);
};

