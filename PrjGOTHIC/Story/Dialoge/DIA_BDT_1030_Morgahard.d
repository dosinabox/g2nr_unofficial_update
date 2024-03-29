
instance DIA_Morgahard_EXIT(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 999;
	condition = DIA_Morgahard_EXIT_Condition;
	information = DIA_Morgahard_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Morgahard_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Morgahard_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Morgahard_HALLO(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 3;
	condition = DIA_Morgahard_HALLO_Condition;
	information = DIA_Morgahard_HALLO_Info;
	description = "�� ���������.";
};


func int DIA_Morgahard_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Morgahard_HALLO_Info()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_00");	//�� ���������.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_01");	//������ �� ������ ��� ���?
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_02");	//���� ���� �����. �� ������ �� ������.
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_03");	//��� �� ������ ������? ����� ��� ��������?
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_04");	//�� ���. �����������. �� ��� �������.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_05");	//� ����� ����, ��� �� ������ �� �����������, �� �� ������� �������� ������������ � ���� � ������� ��� �� �������.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_06");	//��� �� �������� ��������� �� ��������, ������� �� �������.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_07");	//�� ������, ��� ��� ����� �� ������. �� ������, �� ���������.
	Info_ClearChoices(DIA_Morgahard_HALLO);
	Info_AddChoice(DIA_Morgahard_HALLO,"������ �������. �������� ���� ������. �� ������� ����� �����.",DIA_Morgahard_HALLO_attack);
	Info_AddChoice(DIA_Morgahard_HALLO,"��� �� ����� ������� � ������?",DIA_Morgahard_HALLO_richter);
	Info_AddChoice(DIA_Morgahard_HALLO,"����� �������� ��� ����� ����.",DIA_Morgahard_HALLO_tot);
	B_LogEntry(TOPIC_RichterLakai,"� ����� ����������, ������� ������.");
	SCFoundMorgahard = TRUE;
	B_GivePlayerXP(XP_FoundMorgahard);
};

func void DIA_Morgahard_HALLO_tot()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_tot_15_00");	//����� �������� ��� ����� ����.
	AI_Output(self,other,"DIA_Morgahard_HALLO_tot_07_01");	//��, �������. �� ���� �� � ������, ��?
};

func void DIA_Morgahard_HALLO_richter()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_00");	//��� �� ����� ������� � ������?
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_01");	//������. �� ����� � ������� �������� ������ ��� ���� � �������. ����������������.
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_02");	//� �� ��� �� ������. ��� ����� �������������� ��� ���� � ���� �����������.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_03");	//��������������, ��������? � ���� ���� ���. �� ��� ��������� ������� �����������?
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_04");	//��� ��� ��� ��������������, � � ����������, ����� �� ���� ������ ����� �� ��������.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_05");	//�� ������? ������. ���, ������ ��� ������. ��� ��������� ������.
	B_GiveInvItems(self,other,ItWr_RichterKomproBrief_MIS,1);
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_06");	//���� ��� � �� ������ � ���� ����, ��� �������� ��������, ��� ����� ��� ������������ � ���� ����.
	B_LogEntry(TOPIC_RichterLakai,"��������� ������� ��� ������ � �������� �����. ���� ������ ������ ����������, ��� ����� ������� ����������� �������. � �����, ��� ������ ��, ��� ����� ����� ��.");
	AI_StopProcessInfos(self);
};


var int MorgahardSucked;

func void DIA_Morgahard_HALLO_attack()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_attack_15_00");	//������ �������. �������� ���� ������. �� ������� ����� �����.
	AI_Output(self,other,"DIA_Morgahard_HALLO_attack_07_01");	//�������. ��� ��� ����� ������ ������.
	AI_StopProcessInfos(self);
	MorgahardSucked = TRUE;
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};


instance DIA_Morgahard_Perm(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 3;
	condition = DIA_Morgahard_Perm_Condition;
	information = DIA_Morgahard_Perm_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Morgahard_Perm_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Morgahard_HALLO) && (MorgahardSucked == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Morgahard_Perm_Info()
{
	AI_Output(self,other,"DIA_Morgahard_Perm_07_00");	//� ���� ������ �����... � ��� ����� ��� ����������� �� ��������.
	AI_StopProcessInfos_Pickpocket();
};


instance DIA_Morgahard_Perm2(C_Info)
{
	npc = BDT_1030_Morgahard;
	nr = 3;
	condition = DIA_Morgahard_Perm2_Condition;
	information = DIA_Morgahard_Perm2_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Morgahard_Perm2_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MorgahardSucked == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Morgahard_Perm2_Info()
{
	AI_Output(self,other,"DIA_Morgahard_Perm2_07_00");	//������ �� ���� ������ �� ���������?
	AI_StopProcessInfos_Pickpocket();
};

