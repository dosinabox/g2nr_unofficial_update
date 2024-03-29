
instance DIA_Addon_Sancho_EXIT(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 999;
	condition = DIA_Addon_Sancho_EXIT_Condition;
	information = DIA_Addon_Sancho_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Sancho_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Sancho_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Sancho_HI(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 2;
	condition = DIA_Addon_Sancho_HI_Condition;
	information = DIA_Addon_Sancho_HI_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Sancho_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Sancho_HI_Info()
{
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_00");	//����, ��� ���� �������. (�������) ���� �� �������, ��?
	AI_Output(other,self,"DIA_Addon_Sancho_HI_15_01");	//�� �������?
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_02");	//(�������) �� ������� �������� ����!
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_03");	//���, ��� �������� ����, ����� ������� � �����.
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_04");	//�� �� �����, ��� ��� ����� �����!
	if(SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntries(TOPIC_Addon_RavenKDW,LogText_Addon_RavensGoldmine);
		B_LogNextEntry(TOPIC_Addon_Sklaven,LogText_Addon_RavensGoldmine);
		B_LogNextEntry(TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};


instance DIA_Addon_Sancho_Lager(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 2;
	condition = DIA_Addon_Sancho_Lager_Condition;
	information = DIA_Addon_Sancho_Lager_Info;
	permanent = FALSE;
	description = "��� ��� ������� � ������?";
};


func int DIA_Addon_Sancho_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_Sancho_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Lager_15_00");	//��� ��� ������� � ������?
	AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_01");	//������ ��� �� �������!
	if(!Npc_IsDead(Franco))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_02");	//�� ���� �� �������� ������� � �����, ���� �������� ����� ���� � ������.
		AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_03");	//�� �������, ��� ��� ������� ������ ������� ������� ���������� �������!
	};
	Log_CreateTopic(Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Franco,LOG_Running);
	B_LogEntry(Topic_Addon_Franco,"������ ��� ������� � �����, ��� ������� ������ ���������� �� ������.");
};


instance DIA_Addon_Sancho_Mine(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 3;
	condition = DIA_Addon_Sancho_Mine_Condition;
	information = DIA_Addon_Sancho_Mine_Info;
	permanent = FALSE;
	description = "�������� ��� ��� �����...";
};


func int DIA_Addon_Sancho_Mine_Condition()
{
	if(!Npc_IsDead(Franco))
	{
		return TRUE;
	};
};

func void DIA_Addon_Sancho_Mine_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Mine_15_00");	//�������� ��� ��� �����...
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_01");	//� ��� ���� �����: ���� �� ������ ������� ����, �� ������ ����������� ������. �� ��� �������.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_02");	//�� ������, ��� ������ ���� ���������.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_03");	//� �� ������ ���� ����, ������ ���� �� �� ������ ��� �����������.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_04");	//��� ��� ����� � ���� � ������� � ���� �����-������ ������!
	B_LogEntry(Topic_Addon_Franco,"������ ������, ��� ������� � ������. ����� �� ���������� �������������� �������.");
};


instance DIA_Addon_Sancho_Franco(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 4;
	condition = DIA_Addon_Sancho_Franco_Condition;
	information = DIA_Addon_Sancho_Franco_Info;
	permanent = FALSE;
	description = "��� � ���� ����� ������?";
};


func int DIA_Addon_Sancho_Franco_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Sancho_Mine) && !Npc_IsDead(Franco))
	{
		return TRUE;
	};
};

func void DIA_Addon_Sancho_Franco_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Franco_15_00");	//��� � ���� ����� ������?
	AI_Output(self,other,"DIA_Addon_Sancho_Franco_06_01");	//������ �� ������ �� ����� ����� �������.
	AI_Output(self,other,"DIA_Addon_Sancho_Franco_06_02");	//���� � ��� � ������� ���������� - � �� �������� �����-������ ������ ������� ���, ��� ����� �!
	B_LogEntry(Topic_Addon_Franco,"������ ����� ����� ����� �������.");
};


instance DIA_Addon_Sancho_Spitzel(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 5;
	condition = DIA_Addon_Sancho_Spitzel_Condition;
	information = DIA_Addon_Sancho_Spitzel_Info;
	permanent = FALSE;
	description = "�� ������ ��� ����� ����� ������?";
};


func int DIA_Addon_Sancho_Spitzel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Sancho_Franco) || Npc_IsDead(Franco))
	{
		return TRUE;
	};
};

func void DIA_Addon_Sancho_Spitzel_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Spitzel_15_00");	//�� ������ ��� ����� ����� ������?
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_01");	//� ������ ��������� ���� ��������, ����� ���������, ��� � ��� �� ���������� ������.
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_02");	//�� �� ���� ����� ������. � ���� �������, ��� �� ����� �� ���� ����� - � �������� ������.
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_03");	//����� �� ����� ����� ���, � ����� ��� �� ������. ������ ��� ���� ����� �������� ���� �������?
};


instance DIA_Addon_Sancho_Perm(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 99;
	condition = DIA_Addon_Sancho_Perm_Condition;
	information = DIA_Addon_Sancho_Perm_Info;
	permanent = TRUE;
	description = "����� �������?";
};


func int DIA_Addon_Sancho_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Sancho_Spitzel))
	{
		return TRUE;
	};
};


var int Comment_Franco;
var int Comment_Esteban;

func void DIA_Addon_Sancho_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Perm_15_00");	//����� �������?
	if(Npc_IsDead(Franco) && (Comment_Franco == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_01");	//� ������, �� ���� ������. ������� ������...
		if(!Npc_IsDead(Carlos))
		{
			AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_02");	//... �� ������ ��� �� ��� ��� ���� ������. � ��� ����� �����...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_03");	//�� �������� � � ��������? ��������, �� � ������ ������� ������, �� ��� ��? ������ ���� � �����.
		};
		Comment_Franco = TRUE;
	}
	else if(Npc_IsDead(Esteban) && (Comment_Esteban == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_04");	//�������, �� ���� ��������. ��������, �� ���� ���-�� ���������, ��?
		Comment_Esteban = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_05");	//�� ���, ������ ������.
	};
};

