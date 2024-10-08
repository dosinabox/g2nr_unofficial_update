
instance DIA_Kurgan_EXIT(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 999;
	condition = DIA_Kurgan_EXIT_Condition;
	information = DIA_Kurgan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kurgan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kurgan_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if(!Npc_IsDead(Biff))
	{
		Npc_SetRefuseTalk(Biff,400);
	};
};


instance DIA_Kurgan_HELLO(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_HELLO_Condition;
	information = DIA_Kurgan_HELLO_Info;
	important = TRUE;
};


func int DIA_Kurgan_HELLO_Condition()
{
	return TRUE;
};

func void DIA_Kurgan_HELLO_Info()
{
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_00");	//��, ��! ������, ���� �����!
	AI_Output(other,self,"DIA_Kurgan_HELLO_15_01");	//��� �� ���� ������ �������?
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_02");	//� ���� �������, ��� ���������� ����� ����� �� ����� ������ ��������� �� ����� ��������. ��� ����� ������ ����� ������ � ���������.
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_03");	//�� ������ ��� � ��������. ��� ������ ��������� ��������������.
	B_LogEntry(TOPIC_Dragonhunter,"� ����� � ������ �������� ��� ����������� ������ ��������� �� ��������. ��� ����� ������ ���������, ��, �����, ��� �� ���������� ������� ����������� �� ��������.");
};


instance DIA_Kurgan_ELSE(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_ELSE_Condition;
	information = DIA_Kurgan_ELSE_Info;
	description = "�� ������ ������� ��� ���-������, ���� � ��� �� ����?";
};


func int DIA_Kurgan_ELSE_Condition()
{
	return TRUE;
};

func void DIA_Kurgan_ELSE_Info()
{
	AI_Output(other,self,"DIA_Kurgan_ELSE_15_00");	//�� ������ ������� ��� ���-������, ���� � ��� �� ����?
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_01");	//� ���� ���� ���� ������ �����, ������ ���������.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_02");	//��� ����� �� ����� �����, ������� ������ � �������, ��� ������ ����������� ���� ������ ����� �������.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_03");	//����������� �����, ��� ������ ��� ��������� ������.
};


instance DIA_Kurgan_Leader(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_Leader_Condition;
	information = DIA_Kurgan_Leader_Info;
	description = "�� ���, ����� �� ��������?";
};


func int DIA_Kurgan_Leader_Condition()
{
	return TRUE;
};

func void DIA_Kurgan_Leader_Info()
{
	AI_Output(other,self,"DIA_Kurgan_Leader_15_00");	//�� ���, ����� �� ��������?
	AI_Output(self,other,"DIA_Kurgan_Leader_01_01");	//� ���, ����� �� ��������? �������, ���. ��� ����� �� ����� ����������� �������, ��������� �������.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_02");	//����� ������� ��������� ����� ���� ��� ��������, �� �������� ��� � ��� ������, ��� �� ������ �� ����.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_03");	//��������� ��������� ������. � � ����� ������ �� �������� ��������.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_04");	//�������, ������� ������ ���� ����� � �������� ������-������ ����.
};


instance DIA_Kurgan_KillDragon(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_KillDragon_Condition;
	information = DIA_Kurgan_KillDragon_Info;
	description = "��� �� ������ ����� ��������?";
};


func int DIA_Kurgan_KillDragon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kurgan_Leader))
	{
		return TRUE;
	};
};


var int Kurgan_KillDragon_Day;

func void DIA_Kurgan_KillDragon_Info()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_00");	//(���������) ��� �� ������ ����� ��������?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_01");	//���� ��, ����� ����������. � �� ���� ������, ��� ����� �������� �������?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_02");	//�� �������, �� ����� �������� ������ �� �����, ����� �� ������ ������ ��� ������?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_03");	//����� ���� ������� ����������� ������������ � ����������� ��������.
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_04");	//�������. � ��� �� ����������� ���������� � ���������?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_05");	//������� �� ������ ��������, ��� ��� ����������.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_06");	//������ ����� ����� ����� �������� � ������ ������� ��������� ��.
	Kurgan_KillDragon_Day = Wld_GetDay();
	Info_AddChoice(DIA_Kurgan_KillDragon,"� ���������, ��� ����� ����.",DIA_Kurgan_KillDragon_weg);
	Info_AddChoice(DIA_Kurgan_KillDragon,"��� �� ����������� ������ ���� �����?",DIA_Kurgan_KillDragon_orks);
	Info_AddChoice(DIA_Kurgan_KillDragon,"��� �������, �� �� �������� ����� ���� ������ ����.",DIA_Kurgan_KillDragon_spott);
};

func void DIA_Kurgan_KillDragon_spott()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_spott_15_00");	//��� �������, �� �� �������� ����� ���� ������ ����.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_spott_01_01");	//���? �� ������ ���������� �� ����� ����� ����������?
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Kurgan_KillDragon_orks()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_orks_15_00");	//��� �� ����������� ������ ���� �����?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_orks_01_01");	//�� ���������� ���� ������ �����.
};

func void DIA_Kurgan_KillDragon_weg()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_weg_15_00");	//��� �� ����� �������� ����������, ��� �� ������ ������ ���, ��, � ���������, ��� ����� ����.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_weg_01_01");	//����������� �����, ����� ������. � ��������� ������ �� �������� �������� ���� ��� ����.
	AI_StopProcessInfos(self);
};


instance DIA_Kurgan_SEENDRAGON(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_SEENDRAGON_Condition;
	information = DIA_Kurgan_SEENDRAGON_Info;
	permanent = TRUE;
	description = "�� ��� �� ����� �������?";
};


func int DIA_Kurgan_SEENDRAGON_Condition()
{
	if(C_DaysSinceEvent(Kurgan_KillDragon_Day,2) && !Npc_KnowsInfo(other,DIA_Kurgan_AllDragonsDead))
	{
		return TRUE;
	};
};

func void DIA_Kurgan_SEENDRAGON_Info()
{
	AI_Output(other,self,"DIA_Kurgan_SEENDRAGON_15_00");	//�� ��� �� ����� �������?
	AI_Output(self,other,"DIA_Kurgan_SEENDRAGON_01_01");	//���� ���. �� ��� ����� �� ����� ���������� �����.
};


instance DIA_Kurgan_AllDragonsDead(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 5;
	condition = DIA_Kurgan_AllDragonsDead_Condition;
	information = DIA_Kurgan_AllDragonsDead_Info;
	permanent = FALSE;
	description = "������� ������.";
};


func int DIA_Kurgan_AllDragonsDead_Condition()
{
	if(MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kurgan_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_00");	//������� ������.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_01");	//��! � ���, ���������, ���� ��? ��������?
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_02");	//�.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_03");	//(�������) ��. �� ���� ��� � ��� �� ������. ������ ����� ����.
};

