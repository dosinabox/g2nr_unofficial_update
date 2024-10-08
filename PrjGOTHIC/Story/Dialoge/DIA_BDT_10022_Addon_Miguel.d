
instance DIA_Addon_Miguel_EXIT(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 999;
	condition = DIA_Addon_Miguel_EXIT_Condition;
	information = DIA_Addon_Miguel_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Miguel_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Miguel_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Miguel_Hi(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 1;
	condition = DIA_Addon_Miguel_Hi_Condition;
	information = DIA_Addon_Miguel_Hi_Info;
	permanent = FALSE;
	description = "��� �� ����� �������?";
};


func int DIA_Addon_Miguel_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Miguel_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_00");	//��� �� ����� �������?
	if(Wld_IsTime(6,0,22,0))
	{
		AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_01");	//����� ���-������?
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_02");	//��������. � ��� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_03");	//������ � ��� ��������.
	};
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_04");	//����������� �� ��� ����� ������������.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_05");	//������ �������� ����� �������� ��������, � �� �������� ����� ���������� �������� ������.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_06");	//�� ����, ��� � ����� �� ������, � ������� ���������.
};


instance DIA_Addon_Miguel_Story(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 2;
	condition = DIA_Addon_Miguel_Story_Condition;
	information = DIA_Addon_Miguel_Story_Info;
	permanent = FALSE;
	description = "� ������ �� �������� �� ��������?";
};


func int DIA_Addon_Miguel_Story_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_Story_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Story_15_00");	//� ������ �� �������� �� ��������?
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_01");	//� ����� ������� ��� �������, ��������������� �� �����.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_02");	//������� ������� ��� ��������� ����� ����� ��������� ����� '������������' ������ ������ ����.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_03");	//��� ������� ���... �-�... ��������������� �� ��������� �����, � � ��� ��� �� ������� �� � ����.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_04");	//(��������) �� ��� ���� ������� ���� �� ������. '������������ ����������� ������' - ��� ��� ��� ��� �������.
};


instance DIA_Addon_Miguel_Lager(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 3;
	condition = DIA_Addon_Miguel_Lager_Condition;
	information = DIA_Addon_Miguel_Lager_Info;
	permanent = FALSE;
	description = "�������� ��� ��� ������.";
};


func int DIA_Addon_Miguel_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_Miguel_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Lager_15_00");	//�������� ��� ��� ������.
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_01");	//� ���� �������. ��� � ������� ��� �� ���.
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_02");	//������ ���� ������ ���� ��� � ������ ������. ��� ���������, ��, ��� ������ �����, ��� �, ������ �����, ���� �� �� ����������� ����� ����.
};


instance DIA_Addon_Miguel_WhereFrom(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 4;
	condition = DIA_Addon_Miguel_WhereFrom_Condition;
	information = DIA_Addon_Miguel_WhereFrom_Info;
	permanent = FALSE;
	description = "������ �� ������?";
};


func int DIA_Addon_Miguel_WhereFrom_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Hi) || Npc_KnowsInfo(other,DIA_Addon_Miguel_Lager))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_WhereFrom_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_00");	//������ �� ������?
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_01");	//��, ������ ��, ������ � ��, � �����. � ��������. ����� ����.
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_02");	//�� ��������� �� �������. ����� ��� ������ ����� � ���������.
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_03");	//(���������) �����.
};


instance DIA_Addon_Miguel_Angefordert(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 4;
	condition = DIA_Addon_Miguel_Angefordert_Condition;
	information = DIA_Addon_Miguel_Angefordert_Info;
	permanent = FALSE;
	description = "����� �� ������ ����� ����� ����?";
};


func int DIA_Addon_Miguel_Angefordert_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Lager))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_Angefordert_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Angefordert_15_00");	//����� �� ������ ����� ����� ����?
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_01");	//��, ����� ��� ����-������ ������.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_02");	//���� �������� ������� �������, ����������� ��������� �������� ����� �� ���.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_03");	//������ ��� � ���� ���� ����� �������. �� � ��������� ����� � ���� �������.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_04");	//����� �����-�� ������� ��������� �������� ��� ������ ���, ����� ��� ����� �� ����� ���� �������.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_05");	//�� � �� ����, ��� ������ �� ������. � ������� �� ��� ������.
};


instance DIA_Addon_Miguel_Fortuno(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 6;
	condition = DIA_Addon_Miguel_Fortuno_Condition;
	information = DIA_Addon_Miguel_Fortuno_Info;
	permanent = FALSE;
	description = "� ������� �� ��� � ������� � �������, �� ��� �� ������ ����� � ������� ���� ������.";
};


func int DIA_Addon_Miguel_Fortuno_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Story) && Npc_KnowsInfo(other,DIA_Addon_Fortuno_FREE) && !Npc_IsDead(Fortuno))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_Fortuno_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_00");	//� ������� �� ��� � ������� � �������, �� ��� �� ������ ����� � ������� ���� ������.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_01");	//�������? ��� ����� ������, ��?
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_02");	//�� ��� ��. ������ �� ������ ������. � ��� ������ ������.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_03");	//������? ��, �� ��� ��� � ����� � ��� �����. �-�, �� �����. �� �����, � ������, � �� ���� ������� �����.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_04");	//� ���� ������� �����. � ������ ���� ���� ��������. ��� ����� ������ ������.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_05");	//���� ��������� � ���� ��������. ��� ����� ����� ���� ������.
	B_GiveInvItems(self,other,ItWr_Addon_MCELIXIER_01,1);
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_06");	//���� �� ���-�� �� ��� ��� �������, ��� �������� �� ��� ����������, �� ����� ���� �����������.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_07");	//� ���� ���������.
	B_LogEntry(Topic_Addon_Fortuno,"������ ��� ��� ������ �����, ������� ������ ������� ������. �� � ������ ���� ������ �� ���� ������������, ����� � ���� ��������� ����������� ��.");
};


instance DIA_Addon_Miguel_BRAU(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 7;
	condition = DIA_Addon_Miguel_BRAU_Condition;
	information = DIA_Addon_Miguel_BRAU_Info;
	permanent = FALSE;
	description = "�� ������ ������� ���� ���-����?";
};


func int DIA_Addon_Miguel_BRAU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Story))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_BRAU_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_BRAU_15_00");	//�� ������ ������� ���� ���-����?
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_01");	//� ���� ��� �������. ��� ����� ������������ ������. � ���� � �� ���� ������� � ������, � ����, �������� ��������.
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_02");	//�� ���� ���� ����� �����, � ���� ���� ��� ���� ���������.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"� ������ � ���� �������� ����� � �����.");
};


instance DIA_Addon_Miguel_trade(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 888;
	condition = DIA_Addon_Miguel_trade_Condition;
	information = DIA_Addon_Miguel_trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_v1;
};


func int DIA_Addon_Miguel_trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_BRAU))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_trade_Info()
{
	B_Say(other,self,"$TRADE_1");
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};

