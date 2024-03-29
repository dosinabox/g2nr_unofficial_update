
instance DIA_Hodges_Kap1_EXIT(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999;
	condition = DIA_Hodges_Kap1_EXIT_Condition;
	information = DIA_Hodges_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Hodges_Kap1_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Hodges_HALLO(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 1;
	condition = DIA_Hodges_HALLO_Condition;
	information = DIA_Hodges_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hodges_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Hodges_HALLO_Info()
{
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Hodges_HALLO_15_00");	//������, � ������� �����.
	}
	else
	{
		DIA_Common_Hello();
	};
	AI_Output(self,other,"DIA_Hodges_HALLO_03_01");	//�� ����� ���� �����������, �� ������ � ���� ��� ���������� ������������� - � ��������� �������.
	AI_Output(other,self,"DIA_Hodges_HALLO_15_02");	//�� ������ �����, ��?
	AI_Output(self,other,"DIA_Hodges_HALLO_03_03");	//���� �� ������. ������ ������ ������� ������, ��� � ���� ������� ���������� ���.
};


instance DIA_Hodges_TellAboutFarm(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 2;
	condition = DIA_Hodges_TellAboutFarm_Condition;
	information = DIA_Hodges_TellAboutFarm_Info;
	permanent = FALSE;
	description = "��� �� ������ ���������� ��� �� ���� �����?";
};


func int DIA_Hodges_TellAboutFarm_Condition()
{
	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_TellAboutFarm_Info()
{
	AI_Output(other,self,"DIA_Hodges_TellAboutFarm_15_00");	//��� �� ������ ���������� ��� �� ���� �����?
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_01");	//��� ����� �����.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_02");	//��� ������� ������ - ��� ���. �� ��������� ���� ����� ��� ���������.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_03");	//� ���, ��������, �������� ������������ � �����.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_04");	//(���������) �� � ������ �� ������, ������ ����, ��� ���� ����, ��������� �������� �����.
	if(Npc_GetDistToWP(self,"NW_BIGFARM_SMITH_SHARP") < 500)
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_05");	//��� ��� ������ - �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_06");	//����� ������ ��������� �������.
	};
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_07");	//��������, ���� ������� � ����� ���������� ���� ���-������ ������.
};


instance DIA_Hodges_AboutSld(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 2;
	condition = DIA_Hodges_AboutSld_Condition;
	information = DIA_Hodges_AboutSld_Info;
	permanent = FALSE;
	description = "� ��� ������ ���������?";
};


func int DIA_Hodges_AboutSld_Condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Hodges_AboutSld_Info()
{
	AI_Output(other,self,"DIA_Hodges_AboutSld_15_00");	//� ��� ������ ���������?
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_01");	//���� ����� ��, ����� ��� �� ������� ���� ���������.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_02");	//�� ����� ��� �������� �����, ����� ���� � ����� ��������.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_03");	//��� ��� ���� �� ����� ������� ���-������ ��� �������� � ����� �������.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_04");	//��� ������ � ���� �����, ����� ������ ���� ������.
};


var int Hodges_Trader;

instance DIA_Hodges_TRADE(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 2;
	condition = DIA_Hodges_TRADE_Condition;
	information = DIA_Hodges_TRADE_Info;
	permanent = TRUE;
	description = "���� � ������ ������ � ����?";
	trade = TRUE;
};


func int DIA_Hodges_TRADE_Condition()
{
	return TRUE;
};

func void DIA_Hodges_TRADE_Info()
{
	AI_Output(other,self,"DIA_Hodges_TRADE_15_00");	//���� � ������ ������ � ����?
	AI_Output(self,other,"DIA_Hodges_TRADE_03_01");	//� ���� ���� ��� ����. �� ������� ����� ��� ���� � ������ � ��� �����.
	if(Hodges_Trader == FALSE)
	{
		Log_CreateTopic(TOPIC_SoldierTrader,LOG_NOTE);
		B_LogEntry(TOPIC_SoldierTrader,"������ ����� ������� ��� ������� ������.");
		Hodges_Trader = TRUE;
	};
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Hodges_DontWork(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 31;
	condition = DIA_Hodges_DontWork_Condition;
	information = DIA_Hodges_DontWork_Info;
	permanent = FALSE;
	description = "������ �� �� ���������?";
};


func int DIA_Hodges_DontWork_Condition()
{
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_DontWork_Info()
{
	AI_Output(other,self,"DIA_Hodges_DontWork_15_00");	//������ �� �� ���������?
	AI_Output(self,other,"DIA_Hodges_DontWork_03_01");	//�� ��� ������ �� ������? �������� ���������� �������.
	if(MIS_RescueBennet != LOG_Running)
	{
		MIS_RescueBennet = LOG_Running;
		Log_CreateTopic(TOPIC_RescueBennet,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RescueBennet,LOG_Running);
		B_LogEntry(TOPIC_RescueBennet,"������ ������ ��������� ���������� � ������.");
	};
};


instance DIA_Hodges_WhatHappened(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 31;
	condition = DIA_Hodges_WhatHappened_Condition;
	information = DIA_Hodges_WhatHappened_Info;
	permanent = FALSE;
	description = "��� ���������?";
};


func int DIA_Hodges_WhatHappened_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hodges_DontWork) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_WhatHappened_Info()
{
	AI_Output(other,self,"DIA_Hodges_WhatHappened_15_00");	//��� ���������?
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_01");	//��, �� ���� � ������ �� ���������, ����� ���������� �������� ����. ���-�� ������: '��� ���, ������� ��!'
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_02");	//��, ��� � ���������! � �������� ������. � ����� ���, ��� ����� �� ���� ������� ������.
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_03");	//������ ����� �� ����. � �� ����, ��� ���������, �� ����� � �������� �� ������, ��� �� ���� ��� �� ����.
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_04");	//������ ����, �� ������ ���-�� � ������.
};


instance DIA_Hodges_BennetsCrime(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 32;
	condition = DIA_Hodges_BennetsCrime_Condition;
	information = DIA_Hodges_BennetsCrime_Info;
	permanent = FALSE;
	description = "��� ������ ������� ����������?";
};


func int DIA_Hodges_BennetsCrime_Condition()
{
//	if(Npc_KnowsInfo(other,DIA_Hodges_DontWork) && (MIS_RescueBennet != LOG_SUCCESS))
	if(Npc_KnowsInfo(other,DIA_Hodges_WhatHappened) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_BennetsCrime_Info()
{
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_00");	//��� ������ ������� ����������?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_01");	//��������! ������� ����������� � �������� ��������. ����� ����. � ��� � ��� ��� ��� �����.
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_02");	//��� ������ �� �� ������� � ����� � �� ����������, ��� ��� ����?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_03");	//��� ������� ���� � ������ ��� ��� ���������. �����, ����� ������ ������, �������� ��������.
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_04");	//��������?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_05");	//���������, ���� � ��� ��������� � �������... ��� ��� ����� ����� ���������.
	B_LogEntry(TOPIC_RescueBennet,"�������, ��� ������ ���� ��������. ��� ������ ������ ����������, ��� ������ ���������, �� �� �� ������������ ������� � �����.");
};


instance DIA_Hodges_BennetAndSLD(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 33;
	condition = DIA_Hodges_BennetAndSLD_Condition;
	information = DIA_Hodges_BennetAndSLD_Info;
	permanent = FALSE;
	description = "� ��� ������������� �������� �� �����?";
};


func int DIA_Hodges_BennetAndSLD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hodges_DontWork) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_BennetAndSLD_Info()
{
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_00");	//� ��� ������������� �������� �� �����?
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_01");	//�����������, � �� ����, ��� ��� ���������, �� ������ �� ��� ������ � ������.
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_02");	//��� �������.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_03");	//���� �� � ��� ���� ����� ������, ��� �� ��������� ����� ��� �������, ����� ���������� �������.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_04");	//�������� � ��, ����� ����, �� ���-������ ������� ������.
};

