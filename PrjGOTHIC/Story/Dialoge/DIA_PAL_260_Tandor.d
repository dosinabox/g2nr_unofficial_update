
instance DIA_Tandor_EXIT(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_EXIT_Condition;
	information = DIA_Tandor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Tandor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_Hallo(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 2;
	condition = DIA_Tandor_Hallo_Condition;
	information = DIA_Tandor_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Tandor_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Tandor_Hallo_Info()
{
	AI_Output(self,other,"DIA_Tandor_Hallo_08_00");	//�� ������ ����� ������? ��� ������. �� ��� �������� ��� ����� ������� �����.
	AI_Output(self,other,"DIA_Tandor_Hallo_08_01");	//� ������ ����, ������ ��� - � ������ � ������������ ��������� �����.
	AI_Output(self,other,"DIA_Tandor_Hallo_08_02");	//� ���� ���� ������? ���� ���� ����� ������� ������, �������� �� ���.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC,"������ ������� ������� � �����.");
};


instance DIA_Tandor_Trupp(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 2;
	condition = DIA_Tandor_Trupp_Condition;
	information = DIA_Tandor_Trupp_Info;
	permanent = FALSE;
	description = "��� ����� � ���� �������?";
};


func int DIA_Tandor_Trupp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Tandor_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Tandor_Trupp_Info()
{
	AI_Output(other,self,"DIA_Tandor_Trupp_15_00");	//��� ����� � ���� �������?
	AI_Output(self,other,"DIA_Tandor_Trupp_08_01");	//�� ��������� �������� ��������� � ���������� ������������ � ���������. �� ������� ������ � ������.
	AI_Output(self,other,"DIA_Tandor_Trupp_08_02");	//�� ������ ����� ������ ����. ��� �������� ����� �������� � ���������� ���.
	AI_Output(self,other,"DIA_Tandor_Trupp_08_03");	//�� ���������� ��������, �� � ������������, ���� ������� ��������� � �����...
	AI_Output(self,other,"DIA_Tandor_Trupp_08_04");	//������ ����� ����� ���� ������� �������� ��������, � ��� �������� ��������� � �����.
};


instance DIA_Tandor_Trade(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 900;
	condition = DIA_Tandor_Trade_Condition;
	information = DIA_Tandor_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_v4;
};


func int DIA_Tandor_Trade_Condition()
{
	return TRUE;
};

func void DIA_Tandor_Trade_Info()
{
	AI_Output(other,self,"DIA_Tandor_Trade_15_00");	//������ ��� ���� ������.
	B_ClearBonusFoodInv(self);
	B_GiveTradeInv(self);
};


instance DIA_Tandor_Equipment(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 3;
	condition = DIA_Tandor_Equipment_Condition;
	information = DIA_Tandor_Equipment_Info;
	description = "���� ������ ������ - ��� ����� ����������.";
};


func int DIA_Tandor_Equipment_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Garond_Equipment) && (other.guild == GIL_MIL) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Tandor_Equipment_Info()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_15_00");	//���� ������ ������ - ��� ����� ����������.
	AI_Output(self,other,"DIA_Tandor_Equipment_08_01");	//��� �������� ��� �������� ���?
	Info_ClearChoices(DIA_Tandor_Equipment);
	Info_AddChoice(DIA_Tandor_Equipment,"��� �������� ���.",DIA_Tandor_Equipment_Nah);
	Info_AddChoice(DIA_Tandor_Equipment,"��� �������� ���.",DIA_Tandor_Equipment_Fern);
};

func void DIA_Tandor_Equipment_Nah()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Nah_15_00");	//��� �������� ���.
	AI_Output(self,other,"DIA_Tandor_Equipment_Nah_08_01");	//���������� ��� ���������?
	Info_ClearChoices(DIA_Tandor_Equipment);
	Info_AddChoice(DIA_Tandor_Equipment,"����������.",DIA_Tandor_Equipment_Ein);
	Info_AddChoice(DIA_Tandor_Equipment,"���������.",DIA_Tandor_Equipment_Zwei);
};

func void DIA_Tandor_Equipment_Fern()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Fern_15_00");	//��� �������� ���.
	AI_Output(self,other,"DIA_Tandor_Equipment_Fern_08_01");	//��� ��� �������?
	Info_ClearChoices(DIA_Tandor_Equipment);
	Info_AddChoice(DIA_Tandor_Equipment,"���.",DIA_Tandor_Equipment_Bow);
	Info_AddChoice(DIA_Tandor_Equipment,"�������.",DIA_Tandor_Equipment_Crossbow);
};

func void DIA_Tandor_Equipment_Ein()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Ein_15_00");	//����������.
	AI_Output(self,other,"DIA_Tandor_Equipment_Ein_08_01");	//����� ������ ���� ��������� ������. ��� ������� ������.
	B_GiveInvItems(self,other,ItMw_Steinbrecher,1);
	Info_ClearChoices(DIA_Tandor_Equipment);
};

func void DIA_Tandor_Equipment_Zwei()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Zwei_15_00");	//���������.
	AI_Output(self,other,"DIA_Tandor_Equipment_Zwei_08_01");	//���� ���������� ���� ���������.
	B_GiveInvItems(self,other,ItMw_Zweihaender1,1);
	Info_ClearChoices(DIA_Tandor_Equipment);
};

func void DIA_Tandor_Equipment_Bow()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Bow_15_00");	//���.
	AI_Output(self,other,"DIA_Tandor_Equipment_Bow_08_01");	//���� ��������� ��� ��� ������ ����� �������� ����. � ����� ��� ���� ������ �����.
	B_GiveInvItems(self,other,ItRw_Bow_L_03,1);
	B_GiveInvItems(self,other,ItRw_Arrow,50);
	Info_ClearChoices(DIA_Tandor_Equipment);
};

func void DIA_Tandor_Equipment_Crossbow()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Crossbow_15_00");	//�������.
	AI_Output(self,other,"DIA_Tandor_Equipment_Crossbow_08_01");	//����� ������ ���� ������ �������. � ����� � ���� � �������.
	B_GiveInvItems(self,other,ItRw_Crossbow_L_02,1);
	B_GiveInvItems(self,other,ItRw_Bolt,50);
	Info_ClearChoices(DIA_Tandor_Equipment);
};


instance DIA_Tandor_KAP3_EXIT(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_KAP3_EXIT_Condition;
	information = DIA_Tandor_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_KAP4_EXIT(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_KAP4_EXIT_Condition;
	information = DIA_Tandor_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_News(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 40;
	condition = DIA_Tandor_News_Condition;
	information = DIA_Tandor_News_Info;
	permanent = TRUE;
	description = "���� �����-������ �������?";
};


func int DIA_Tandor_News_Condition()
{
	if((Kapitel == 4) && Npc_KnowsInfo(hero,DIA_Tandor_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Tandor_News_Info()
{
	AI_Output(other,self,"DIA_Tandor_News_15_00");	//���� �����-������ �������?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Tandor_News_08_01");	//������������ ������� �� ��������� ����� - ��, ��� ��, �������� �� ��������, ��������� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Tandor_News_08_02");	//���� ������� �������� �� ��������.
		AI_Output(self,other,"DIA_Tandor_News_08_03");	//������, ��� ������� �������. �������, ��� ������������� ���, ����� ���� �� �� ������� ������ �����.
	};
};


instance DIA_Tandor_KAP5_EXIT(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_KAP5_EXIT_Condition;
	information = DIA_Tandor_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_WASISTLOS(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 51;
	condition = DIA_Tandor_WASISTLOS_Condition;
	information = DIA_Tandor_WASISTLOS_Info;
	permanent = TRUE;
	description = "���-�� �� �� �����.";
};


func int DIA_Tandor_WASISTLOS_Condition()
{
	if((Kapitel == 5) && Npc_KnowsInfo(hero,DIA_Tandor_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Tandor_WASISTLOS_Info()
{
	AI_Output(other,self,"DIA_Tandor_WASISTLOS_15_00");	//���-�� �� �� �����.
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Tandor_WASISTLOS_08_01");	//���� ����� �������. ����� ��� ���� �������� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Tandor_WASISTLOS_08_02");	//������ �������������� ���������. �� ��������.
	};
};


instance DIA_Tandor_KAP6_EXIT(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_KAP6_EXIT_Condition;
	information = DIA_Tandor_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_PICKPOCKET(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 900;
	condition = DIA_Tandor_PICKPOCKET_Condition;
	information = DIA_Tandor_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Tandor_PICKPOCKET_Condition()
{
	return C_Beklauen(47,90);
};

func void DIA_Tandor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Tandor_PICKPOCKET);
	Info_AddChoice(DIA_Tandor_PICKPOCKET,Dialog_Back,DIA_Tandor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Tandor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Tandor_PICKPOCKET_DoIt);
};

func void DIA_Tandor_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Tandor_PICKPOCKET);
};

func void DIA_Tandor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Tandor_PICKPOCKET);
};

