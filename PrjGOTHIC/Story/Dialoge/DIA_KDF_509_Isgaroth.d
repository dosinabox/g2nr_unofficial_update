
func void B_Isgaroth_BlessYou()
{
	AI_Output(self,other,"DIA_Isgaroth_EXIT_01_00");	//����� ����� ������ �������� ���� ����.
};

instance DIA_Isgaroth_EXIT(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 999;
	condition = DIA_Isgaroth_EXIT_Condition;
	information = DIA_Isgaroth_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Isgaroth_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Isgaroth_EXIT_Info()
{
	B_Isgaroth_BlessYou();
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Isgaroth_Hello(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 2;
	condition = DIA_Isgaroth_Hello_Condition;
	information = DIA_Isgaroth_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Isgaroth_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild != GIL_KDF) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Hello_Info()
{
	AI_Output(self,other,"DIA_Isgaroth_Hello_01_00");	//�� �������� � ����� �����. ��� � ���� ������� ��� ����, ��������?
};


instance DIA_Isgaroth_Segen(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 10;
	condition = DIA_Isgaroth_Segen_Condition;
	information = DIA_Isgaroth_Segen_Info;
	permanent = TRUE;
	description = "���������� ����!";
};


func int DIA_Isgaroth_Segen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Isgaroth_Job))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Segen_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Segen_15_00");	//���������� ����!
	AI_Output(self,other,"DIA_Isgaroth_Segen_01_01");	//������������ ���� �� ��� ������. ����� ����� ���������� ����� � ����� ������ � ���� ���� ���� ���� �������� ��� �������.
	if((MIS_Thorben_GetBlessings == LOG_Running) && !C_GotAnyInnosBlessing())
	{
		B_LogEntry(TOPIC_Thorben,"��� ���� ������� ����������� ����.");
	};
	Isgaroth_Blessing = TRUE;
};


instance DIA_Isgaroth_Wolf(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 2;
	condition = DIA_Isgaroth_Wolf_Condition;
	information = DIA_Isgaroth_Wolf_Info;
	permanent = FALSE;
	description = "���� ������ ������. �� ������� ��� ���� �����������. ��� ����� �������?";
};


func int DIA_Isgaroth_Wolf_Condition()
{
	if((MIS_IsgarothWolf == LOG_Running) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Wolf_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Wolf_15_00");	//���� ������ ������. �� ������� ��� ���� �����������. ��� ����� �������?
	AI_Output(self,other,"DIA_Isgaroth_Wolf_01_01");	//����� ������� �������� ������ ����. ����� ��� � ����.
	B_LogEntry(TOPIC_IsgarothWolf,"����� ������ ������ ������ ����. � ������ ����� ��� � �����.");
};


instance DIA_Isgaroth_tot(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 2;
	condition = DIA_Isgaroth_tot_Condition;
	information = DIA_Isgaroth_tot_Info;
	permanent = FALSE;
	description = "� ���� �����.";
};


func int DIA_Isgaroth_tot_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Isgaroth_Wolf))
	{
		if(Npc_IsDead(BlackWolf))
		{
			return TRUE;
		};
	};
};

func void DIA_Isgaroth_tot_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_tot_15_00");	//� ���� �����.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Isgaroth_tot_01_01");	//������� ������, ���������. �� ������������ �������. � ������ ����������� � ��������� � ���������� �� ���� �����������.
	}
	else
	{
		B_Isgaroth_BlessYou();
	};
	MIS_IsgarothWolf = LOG_SUCCESS;
	B_GivePlayerXP(XP_IsgarothWolf);
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Isgaroth_Job(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 4;
	condition = DIA_Isgaroth_Job_Condition;
	information = DIA_Isgaroth_Job_Info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int DIA_Isgaroth_Job_Condition()
{
	return TRUE;
};

func void DIA_Isgaroth_Job_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Job_15_00");	//��� �� ������� �����?
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV))
	{
		AI_Output(self,other,"DIA_Isgaroth_Job_01_01");	//� ��� ����. ���� ������ ���� ������.
		AI_Output(self,other,"DIA_Isgaroth_Job_01_02");	//���� ������ �������� ���, ������� ����, ��������� ���� � ���������� �����.
	};
	AI_Output(self,other,"DIA_Isgaroth_Job_01_03");	//�� ��� �������� ����, ����� ���������� ������ � �������� �������������.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_04");	//� �� ��������� ������������� �� ������ �������� �� ���� ����� ���������.
	Log_CreateTopic(Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry(Topic_KlosterTrader,"������ ������� ������� �������� ���������� �������� � ������� ���������� �� ���������.");
};


instance DIA_Isgaroth_Trade(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 99;
	condition = DIA_Isgaroth_Trade_Condition;
	information = DIA_Isgaroth_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_v4;
};


func int DIA_Isgaroth_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Isgaroth_Job))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Trade_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Trade_15_00");	//������ ��� ���� ������.
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


func void B_KlosterTributInfo()
{
	if(SC_KnowsKlosterTribut == FALSE)
	{
		Log_CreateTopic(TOPIC_Kloster,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Kloster,LOG_Running);
		B_LogEntry(TOPIC_Kloster,"����� ����� ����������� ��������� ������, ��� ����� ���� � 1000 ������� �����.");
		SC_KnowsKlosterTribut = TRUE;
	};
};

instance DIA_Isgaroth_Kloster(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 3;
	condition = DIA_Isgaroth_Kloster_Condition;
	information = DIA_Isgaroth_Kloster_Info;
	permanent = FALSE;
	description = "���� ����� ��� ������?";
};


func int DIA_Isgaroth_Kloster_Condition()
{
	if((other.guild != GIL_NOV) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Kloster_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Kloster_15_00");	//���� ����� ��� ������?
	AI_Output(self,other,"DIA_Isgaroth_Kloster_01_01");	//��� ������ ����� � ��������� ����� ����. ������ ���� � ���� �������� ������ ������ ������.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Isgaroth_Kloster_01_02");	//���� �� ������ ����� ����������� ���������, �� ������ �������� ���� �...
		B_Say_Gold(self,other,Summe_Kloster);
		B_KlosterTributInfo();
	}
	else
	{
		AI_Output(self,other,"DIA_Isgaroth_Kloster_01_03");	//��� ��� �� ��� ����� �������������� � ������ ������, ���� ��� ���� ������.
	};
};


instance DIA_Isgaroth_Vatras(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 3;
	condition = DIA_Isgaroth_Vatras_Condition;
	information = DIA_Isgaroth_Vatras_Info;
	permanent = TRUE;
	description = "� ���� ��������� �� �������.";
};


func int DIA_Isgaroth_Vatras_Condition()
{
	if((MIS_Vatras_Message == LOG_Running) && (Npc_HasItems(other,ItWr_VatrasMessage) || Npc_HasItems(other,ItWr_VatrasMessage_Open)))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Vatras_Info()
{
	AI_Output(other,self,"DIA_ISgaroth_Vatras_15_00");	//� ���� ��������� �� �������.
	AI_Output(self,other,"DIA_Isgaroth_Vatras_01_01");	//��� ��� �� ���������?
	AI_Output(other,self,"DIA_Isgaroth_Vatras_15_02");	//��� ������, ���.
	if(Npc_HasItems(other,ItWr_VatrasMessage))
	{
		B_GiveInvItems(other,self,ItWr_VatrasMessage,1);
		Npc_RemoveInvItem(self,ItWr_VatrasMessage);
		B_ReadFakeItem(self,other,Fakescroll,1);
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_03");	//������, �� ������ ������� �������, ��� � ������� ��� ���������.
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_04");	//������ ��� ����� � �������� ������� �� ���� ��������, ��� ��������� ���������� ����.
		CreateInvItems(self,ItPo_Health_02,2);
		B_GiveInvItems(self,other,ItPo_Health_02,2);
		B_GivePlayerXP(XP_Ambient * 2);
	}
	else if(Npc_HasItems(other,ItWr_VatrasMessage_Open))
	{
		B_GiveInvItems(other,self,ItWr_VatrasMessage_Open,1);
		Npc_RemoveInvItem(self,ItWr_VatrasMessage_Open);
		B_ReadFakeItem(self,other,Fakescroll,1);
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_05");	//������ �������. � ��� �� �����, �����!
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_06");	//��� � ����� �������, ��� � ������� ��� ���������.
		B_EquipTrader(self);
		AI_StopProcessInfos(self);
	};
	Vatras_Return = TRUE;
};

