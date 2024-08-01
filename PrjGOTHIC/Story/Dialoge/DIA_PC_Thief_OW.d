
instance DIA_DiegoOw_EXIT(C_Info)
{
	npc = PC_ThiefOW;
	nr = 999;
	condition = DIA_DiegoOw_EXIT_Condition;
	information = DIA_DiegoOw_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_DiegoOw_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DiegoOw_Hallo(C_Info)
{
	npc = PC_ThiefOW;
	nr = 1;
	condition = DIA_DiegoOw_Hallo_Condition;
	information = DIA_DiegoOw_Hallo_Info;
	important = TRUE;
};


func int DIA_DiegoOw_Hallo_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Hallo_Info()
{
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_00");	//��, � �����, �� �����.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_01");	//��... ��� ����.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_02");	//��, ������ � �������� � ��� �������������� ��������� ��������.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_03");	//��� ���� �� ��� �������?
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_04");	//� ������� �� ����� ������. � ������� ��������� �������� ����� ����������.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_05");	//��������? ������� ��� ������� ���� ���-���. ����� ����, ��� ��� ������� ��������� ������, � ���������� � �������.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_06");	//� ����� ������������ ��������� � ��������. ��� �� ����, ����� ��� ��� ���� �����.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_07");	//���� ���������� ����� ���� �� ���� ������� ���� - �, ������� ��, �� �������� ��� ���������� � ������ �������.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_08");	//������ ����� ��� ��������� ���� �����, � �����������. ��� ��� ����� �� ��������� ��� � ���������...
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_09");	//����� ����� ���������� ��������, ���� � ��� ��� ���� ����� - � �� �����, ��� ������� ��� ������� ���.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_10");	//���������� ��? �� ��� ����� ������� ���� �� ���� ������, ���� � ��� ��� ���� ����� ��� �����!
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_03");	//����� - ��� ���� ������� ���������� ����� ������? � �����, ��� ��� ����� ������.
	if(PlayerPassedAbandonedMine == TRUE)
	{
		AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_04");	//���� ���� ����� ����������� �����, ��� ��� �����.
		AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_05");	//��� ������� �������. ����� � ������ ��� ����� ������� ������������ � ������� - ��� ��� ����� ��� � ��� ������ �����.
	}
	else
	{
		B_PC_Thief_JustLucky();
	};
};


instance DIA_DiegoOw_Beweise(C_Info)
{
	npc = PC_ThiefOW;
	nr = 2;
	condition = DIA_DiegoOw_Beweise_Condition;
	information = DIA_DiegoOw_Beweise_Info;
	description = "��������, ��� ����� ��������������.";
};


func int DIA_DiegoOw_Beweise_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Beweise_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_11");	//��������, ��� ����� ��������������.
	if(MIS_ScoutMine == LOG_Running)
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_14");	//������, � ������ ����, ��� �����. �� � �� ���� ��������� ����� ������ ���������� ��-�� ����.
		AI_Output(other,self,"DIA_DiegoOw_Garond_15_00");	//� ����� �� ��������� �������. �� ����� �����, ������� ���� ���� ������ � ����� �������.
		AI_Output(self,other,"DIA_DiegoOw_Garond_11_01");	//� ����� �� ���� ���� ��������������?
		AI_Output(other,self,"DIA_DiegoOw_Garond_15_02");	//������. ������� - �� ������ ������� ���-������ �� ���� ����?
		if(Npc_KnowsInfo(other,DIA_Parcival_Diego))
		{
			AI_Output(self,other,"DIA_DiegoOw_Garond_11_03");	//�������, ��� �� ������ �����?
			AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_00");	//��� �� ������ � ���� ����������?
		};
		B_LogEntry(TOPIC_ScoutMine,"����� ���������� � ���������� ����� ������ ����� ����, ������� ����������� ����������.");
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_12");	//������, ���� ������ ���� ������ - ���, �������� � ����������� ��������.
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_13");	//���� �� ��� � ����� ���-������ � ��������� ��������, �� ��� ����� �� �����.
		AI_Output(self,other,"DIA_Addon_DiegoOw_Garond_11_01");	//����� �� ������ � �����, ������ ������� ������� ���-���, ��� ��� ����� ������������:
	};
	if(Npc_GetDistToWP(self,"LOCATION_02_05") <= 1000)
	{
		AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_01");	//�����, � ������ ����� ������ �������� ������ ����� ����. �� ������ ���� ����������.
		AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_02");	//������ ����� ������ � ������� ��, �� ���� ����� � ���� ������� ��� �� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Silvestro_11_01");	//� ������ ���������� �� ���� �����, ��� � ���������, �������� ������ ����� ����. �� ������ ���� ����������.
		AI_Output(self,other,"DIA_Addon_DiegoOw_Silvestro_11_02");	//������ ����� ������ � ������� ��.
	};
	Diego_ToldAboutSilvestroOre = TRUE;
	Silvestro_Ore = TRUE;
};


instance DIA_DiegoOw_Mine(C_Info)
{
	npc = PC_ThiefOW;
	nr = 3;
	condition = DIA_DiegoOw_Mine_Condition;
	information = DIA_DiegoOw_Mine_Info;
	permanent = FALSE;
	description = "� ����� �� ������ ��������� � ����?";
};


func int DIA_DiegoOw_Mine_Condition()
{
	if(Diego_ToldAboutSilvestroOre == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Mine_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Mine_15_00");	//� ����� �� ������ ��������� � ����?
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_01");	//� ��� � ������� ����������. �� �������� ���� ��� ��������� ����, ����� ���������� ����� �����������.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_02");	//�� ������, ��� �� ������ ����������� ���� � ���������� �����.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_03");	//��, ��� ��� � ��� ����� ��������� ������, � �������� ������������.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_04");	//� � ���� ��� ����� �������. ������ ��� ������ �� ���������� ������ ��������. � ����� �� ��� �� �����.
};


instance DIA_DiegoOw_Ritter(C_Info)
{
	npc = PC_ThiefOW;
	nr = 4;
	condition = DIA_DiegoOw_Ritter_Condition;
	information = DIA_DiegoOw_Ritter_Info;
	permanent = FALSE;
	description = "� ��� ������ ���� ���� ������� ������� ����� ����� ��������?";
};


func int DIA_DiegoOw_Ritter_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Ritter_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Ritter_15_00");	//� ��� ������ ���� ���� ������� ������� ����� ����� ��������?
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_01");	//��� ����� ���� ������ �� ����� ����� �� ����� ���������.
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_02");	//�� ��, � ������ �������� ���� ����������� �������. � ������� �� ���. �� ��� ���� �� �������.
};


instance DIA_DiegoOw_Perm(C_Info)
{
	npc = PC_ThiefOW;
	nr = 5;
	condition = DIA_DiegoOw_Perm_Condition;
	information = DIA_DiegoOw_Perm_Info;
	permanent = FALSE;
	description = "��� ��� ����� ����� � ������?";
};


func int DIA_DiegoOw_Perm_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Perm_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Perm_15_00");	//��� ��� ����� ����� � ������?
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_01");	//� ��� ���, ��� ������ ���, ����� ������ ������������. ������ ����� ���������� ����.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_02");	//� ��, ����, ������ �� ����� ��� ���� ��� �������� ���������� ���� ������: ��������.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_03");	//������� �������� �� ����, ��� ������� ���� - � ������� �����, ��� ���������� �������.
};


instance DIA_DiegoOw_Gorn(C_Info)
{
	npc = PC_ThiefOW;
	nr = 6;
	condition = DIA_DiegoOw_Gorn_Condition;
	information = DIA_DiegoOw_Gorn_Info;
	permanent = FALSE;
	description = "� ���� ������ ������� �����, �� ������ ������ �� ��� 1000 �������.";
};


func int DIA_DiegoOw_Gorn_Condition()
{
	if(MIS_RescueGorn == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Gorn_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Gorn_15_00");	//� ���� ������ ������� �����, �� ������ ������ �� ��� 1000 �������.
	AI_Output(self,other,"DIA_DiegoOw_Gorn_11_01");	//����������� �����. � ���� ���� 300 �����, �� ������ ����� ��. ��������� ����� ���.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	B_LogEntry(TOPIC_RescueGorn,"����� �������� 300 ������� �� ������������ �����.");
};


var int Diego_MerkeDEX;
var int Diego_MerkeSTR;

func void B_BuildLearnDialog_Diego_OW()
{
	Info_ClearChoices(DIA_DiegoOw_Teach);
	Info_AddChoice(DIA_DiegoOw_Teach,Dialog_Back,DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnAttributeString(ATR_DEXTERITY,1),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnAttributeString(ATR_DEXTERITY,5),DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnAttributeString(ATR_STRENGTH,1),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnAttributeString(ATR_STRENGTH,5),DIA_DiegoOw_TEACHSTR_5);
};

instance DIA_DiegoOw_Teach(C_Info)
{
	npc = PC_ThiefOW;
	nr = 100;
	condition = DIA_DiegoOw_Teach_Condition;
	information = DIA_DiegoOw_Teach_Info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ����-������?";
};


func int DIA_DiegoOw_Teach_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Teach_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Teach_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_01");	//�������. ��� �� ������ �����?
	if(DiegoOW_Teach == FALSE)
	{
		Log_CreateTopic(TOPIC_OutTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_OutTeacher,"����� ����� ������ ��� �������� ��� �������� � ����.");
		DiegoOW_Teach = TRUE;
	};
	Diego_MerkeDEX = ATR_Training[ATR_DEXTERITY];
	Diego_MerkeSTR = ATR_Training[ATR_STRENGTH];
	B_BuildLearnDialog_Diego_OW();
};

func void DIA_DiegoOw_TEACH_BACK()
{
	if(ATR_Training[ATR_DEXTERITY] > Diego_MerkeDEX)
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_02");	//�� ��� ���� ����� ������.
	};
	if(ATR_Training[ATR_STRENGTH] > Diego_MerkeSTR)
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_03");	//(����������) ����� ������. ���� ���� �����������.
	};
	Info_ClearChoices(DIA_DiegoOw_Teach);
};

func void DIA_DiegoOw_TEACHDEX_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX))
	{
		B_BuildLearnDialog_Diego_OW();
	};
};

func void DIA_DiegoOw_TEACHDEX_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX))
	{
		B_BuildLearnDialog_Diego_OW();
	};
};

func void DIA_DiegoOw_TEACHSTR_1()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED))
	{
		B_BuildLearnDialog_Diego_OW();
	};
};

func void DIA_DiegoOw_TEACHSTR_5()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED))
	{
		B_BuildLearnDialog_Diego_OW();
	};
};

instance DIA_Addon_ThiefOW_Together(C_Info)
{
	npc = PC_ThiefOW;
	nr = 11;
	condition = DIA_Addon_ThiefOW_Together_Condition;
	information = DIA_Addon_ThiefOW_Together_Info;
	description = "����� ������ ������.";
};


func int DIA_Addon_ThiefOW_Together_Condition()
{
	return TRUE;
};

func void DIA_Addon_ThiefOW_Together_Info()
{
	DIA_Common_LetsGoTogether();
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_01");	//� �������? ������ �� � ���...
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_02");	//��� ������. �� ���� ������� ������.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_03");	//�� ���� �� ����� � ���, ����� ������� ������� ������ � ����� ��� ����� �����.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_04");	//����� ����, ��� ������� �������� ������� ���������.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_05");	//��� ������� ������� �� ������ ������, � � �� ��������� ������������ � �����.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_06");	//� ������� ��, �� �� ������ ������������ � ��������.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_07");	//�����, ����� ������ �����.
};


instance DIA_Addon_ThiefOW_ComeOn(C_Info)
{
	npc = PC_ThiefOW;
	nr = 12;
	condition = DIA_Addon_ThiefOW_ComeOn_Condition;
	information = DIA_Addon_ThiefOW_ComeOn_Info;
	permanent = TRUE;
	description = "������ �� ����.";
};


func int DIA_Addon_ThiefOW_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_ThiefOW_Together) && (Diego_angekommen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_Diego_ComeOn_15_00");	//������ �� ����.
	if(C_DiegoTooFar(0))
	{
		AI_Output(self,other,"DIA_Addon_Diego_ComeOn_11_01");	//�� ���� �� ����!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_ComeOn_11_02");	//������.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_ThiefOW_GoHome(C_Info)
{
	npc = PC_ThiefOW;
	nr = 13;
	condition = DIA_Addon_ThiefOW_GoHome_Condition;
	information = DIA_Addon_ThiefOW_GoHome_Info;
	permanent = TRUE;
	description = "������� �����!";
};


func int DIA_Addon_ThiefOW_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_GoHome_Info()
{
	var int location;
	location = C_DiegoTooFar(1000);
	AI_Output(other,self,"DIA_Addon_Diego_WarteHier_15_00");	//������� �����!
	if(location == LOC_XARDAS)
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_02");	//� ������� ������� � �����.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"XARDAS");
	}
	else if(location == LOC_FAJETHMINE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_03");	//� ������� � �����.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"FAJETH");
	}
	else if(location == LOC_SILVESTROMINE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_04");	//� ������� ����� ������.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"SILVESTRO");
	}
	else if(location == LOC_GRIMESMINE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_05");	//� ������� ����������.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"GRIMES");
	}
	else if(Npc_GetDistToWP(self,"LOCATION_02_05") < 15000)
	{
		if(Npc_GetDistToWP(self,"LOCATION_02_05") < 2000)
		{
			AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_01");	//�����.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_06");	//���. � ����������� � ������.
			AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_07");	//����� ���������, ������� �� ���.
			AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_08");	//�� �� ������� ������������, ����� � ������� ����.
		};
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_09");	//��, ��������, ������? �� ������ �����������? �����?
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_10");	//������ ����� ��� ����!
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_11");	//�� ���� � ������� ����������. � ������.
	};
};

func void B_Addon_Diego_WillWaitOutside()
{
	AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_00");	//��� ������ � ���������. � ������� �������.
};

var int Diego_TooFarComment;
var int Diego_BurgVariation;
var int Diego_FajethVariation;
var int Diego_SilvestroVariation;
var int Diego_GrimesVariation;
var int Diego_XardasVariation;
var int Diego_IceVariation;

instance DIA_Addon_ThiefOW_TooFar(C_Info)
{
	npc = PC_ThiefOW;
	nr = 14;
	condition = DIA_Addon_ThiefOW_TooFar_Condition;
	information = DIA_Addon_ThiefOW_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_ThiefOW_TooFar_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(C_DiegoTooFar(0))
		{
			if(Diego_TooFarComment == FALSE)
			{
				return TRUE;
			};
		}
		else
		{
			Diego_TooFarComment = FALSE;
		};
	};
	return FALSE;
};

func void DIA_Addon_ThiefOW_TooFar_Info()
{
	var int location;
	location = C_DiegoTooFar(1000);
	if(location == LOC_ANGAR)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_02");	//�� ���� ������ �������� ���� ������.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_03");	//����� ��� �� ������.
	}
	else if(location == LOC_ICE)
	{
		if(Diego_IceVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_04");	//��� ���� � ������ ����� ������.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_05");	//� ������, ��� ��� ��������� ������.
			Diego_IceVariation = 1;
		};
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_01");	//����� ������� � �������, �� ������ ���� � ������ �����������.
	}
	else if(location == LOC_SWAMP)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_06");	//��� ������ ��������� �������.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_07");	//�� ��������, ���� ��� ��� ����� ��������� ������.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_08");	//�� ����� ���� ����.
	}
	else if(location == LOC_FIRE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_09");	//���� �� ��������� ����� �� ��� ����, �� ��������� �������� �������.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_10");	//� � ����� �� ��� �� ����� ��������� �� ��������.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_11");	//����� ������ �� ������� ����.
	}
	else if(location == LOC_LAKE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_12");	//��� ������ ��� ������ �� ��������.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_13");	//����� ������� � �������, �� ������ ���� � ������ �����������!
	}
	else if(location == LOC_XARDAS)
	{
		if(Diego_XardasVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_14");	//��� ������ ����� ��������. ��� ��, �������, � ��� ����� �� ����������.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_15");	//������, ��� ������ ��� ���� ���������� ��������.
			Diego_XardasVariation = 1;
		};
		B_Addon_Diego_WillWaitOutside();
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"XARDAS");
	}
	else if(location == LOC_FAJETHMINE)
	{
		if(Diego_FajethVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_16");	//��� ����� �������.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_17");	//���� �� ������ ���� �����, �� ���� �� �����������!
			Diego_FajethVariation = 1;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_18");	//� ������� ��������� �� ���� ����� ��������!
		};
	}
	else if(location == LOC_SILVESTROMINE)
	{
		if(Diego_SilvestroVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_19");	//��� �����, � ������� ���� ���������, ����� � �������� ���� ������ � ������� ������������.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_20");	//������, ��� ����� ��� �� ��������.
			B_Addon_Diego_WillWaitOutside();
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_Add_11_20");	//�� ���� �� ������ �������������, � ������� � ���� �������.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_Add_11_21");	//����, �������, �� �� ������, ����� � �������� ���� �����.
			Diego_SilvestroVariation = 1;
		}
		else
		{
			B_Addon_Diego_WillWaitOutside();
		};
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"SILVESTRO");
	}
	else if(location == LOC_GRIMESMINE)
	{
		if(Diego_GrimesVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_21");	//��� ���� �� ����� ���� ���������.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_22");	//� ������� ��� �� ��� � ���� ���� �� ���������.
			Diego_GrimesVariation = 1;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_23");	//����� ������� �� ��������.
		};
	}
	else if(location == LOC_BURG)
	{
		if(Diego_BurgVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_24");	//���� ���� �������? ������� �� ����� ��������.
			Diego_BurgVariation = 1;
		}
		else if(Diego_BurgVariation == 1)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_25");	//��, �� ���� ������ ��������?! �� ������� � �����!
			Diego_BurgVariation = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_26");	//��� �� ����� '�� ������� � �����' ���� ���������?
			Diego_BurgVariation = 1;
		};
	}
	else if(location == LOC_ORCBARRIER)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_27");	//��� ������ ���� ����. � ����� ����� ������� ������.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_28");	//� �����, ��� ����� ����� ����� �� ����� � ��������� �� ������ �������.
	}
	else if(location == LOC_ORCBARRIER_FAR)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_29");	//���� �� ��������� ��������� � ���� �����������, �� ����� ������� � ����� �����.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_30");	//������ � �������!
	}
	else if(location == LOC_ROCK)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_09");	//���� �� ��������� ����� �� ��� ����, �� ��������� �������� �������.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_08");	//�� ����� ���� ����.
	};
	Diego_TooFarComment = TRUE;
	Info_ClearChoices(DIA_Addon_ThiefOW_TooFar);
	Info_AddChoice(DIA_Addon_ThiefOW_TooFar,"������� �����!",DIA_Addon_ThiefOW_GoHome_Info);
	Info_AddChoice(DIA_Addon_ThiefOW_TooFar,"������ �� ����.",DIA_Addon_ThiefOW_ComeOn_Info);
};

func void B_Diego_WirSindDa()
{
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_02");	//���������� ����� ���� � �������� ���.
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_03");	//��� ����� ���-��� �������, ������ ��� ������������ � �������.
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_04");	//��������� ����, ��� ����. �������� � ������.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"PASS");
	Diego_angekommen = TRUE;
};


instance DIA_Addon_ThiefOW_Angekommen(C_Info)
{
	npc = PC_ThiefOW;
	nr = 1;
	condition = DIA_Addon_ThiefOW_Angekommen_Condition;
	information = DIA_Addon_ThiefOW_Angekommen_Info;
	important = TRUE;
};


func int DIA_Addon_ThiefOW_Angekommen_Condition()
{
	if((Npc_GetDistToWP(self,"OW_VM_ENTRANCE") < 800) && !Npc_KnowsInfo(other,DIA_Addon_ThiefOW_Nostalgie))
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_Angekommen_Info()
{
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_01");	//��� �����...
	B_GivePlayerXP(500);
	B_Diego_WirSindDa();
};


instance DIA_Addon_ThiefOW_Nostalgie(C_Info)
{
	npc = PC_ThiefOW;
	nr = 1;
	condition = DIA_Addon_ThiefOW_Nostalgie_Condition;
	information = DIA_Addon_ThiefOW_Nostalgie_Info;
	important = TRUE;
};


func int DIA_Addon_ThiefOW_Nostalgie_Condition()
{
	if(Npc_GetDistToWP(self,"WP_INTRO14") < 2000)
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_Nostalgie_Info()
{
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_01");	//�������, �����?
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_02");	//����� �� ������ ��� �����������?
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_03");	//�������, ��� ���� ����� ��� �����...
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_04");	//� ���� ����� ���� ���-�� ���. ����! � �� ���� ���������.
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_05");	//�� �����...
	Diego_Nostalgie = TRUE;
	B_GivePlayerXP(1000);
	PrintScreen(NAME_Addon_NostalgieBonus,-1,57,FONT_Screen,2);
	B_Diego_WirSindDa();
};


instance DIA_Addon_ThiefOW_PERM(C_Info)
{
	npc = PC_ThiefOW;
	nr = 10;
	condition = DIA_Addon_ThiefOW_PERM_Condition;
	information = DIA_Addon_ThiefOW_PERM_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Addon_ThiefOW_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_DiegoOw_Perm) && Npc_KnowsInfo(other,DIA_Addon_ThiefOW_Together))
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Diego_PERM_15_00");	//��� ����?
	if(self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_01");	//��� �� �� �������� ����� �������. � ���� �� �������� ��� ���� ��������?
	}
	else if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (Diego_angekommen == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_02");	//����� ���, ����� ������ �����.
	}
	else if(Diego_angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_03");	//������... ��� ������ �����... ������� ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_04");	//������.
	};
};

