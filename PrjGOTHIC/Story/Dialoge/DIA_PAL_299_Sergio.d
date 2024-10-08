
instance DIA_Sergio_EXIT(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 999;
	condition = DIA_Sergio_EXIT_Condition;
	information = DIA_Sergio_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sergio_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sergio_EXIT_Info()
{
	if(self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		AI_Output(self,other,"DIA_Sergio_EXIT_04_00");	//�� ������� ����� ���� ����.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Sergio_WELCOME(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 5;
	condition = DIA_Sergio_WELCOME_Condition;
	information = DIA_Sergio_WELCOME_Info;
	important = TRUE;
};


func int DIA_Sergio_WELCOME_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && !Npc_KnowsInfo(other,PC_PrayShrine_Paladine))
	{
		return TRUE;
	};
};

func void DIA_Sergio_WELCOME_Info()
{
	AI_Output(self,other,"DIA_Sergio_WELCOME_04_00");	//�� �������� � ����� �����, ��� � ���� ������ ����?
};


instance DIA_Sergio_Isgaroth(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 2;
	condition = DIA_Sergio_Isgaroth_Condition;
	information = DIA_Sergio_Isgaroth_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sergio_Isgaroth_Condition()
{
	if(Npc_KnowsInfo(other,PC_PrayShrine_Paladine))
	{
		if(Kapitel == 1)
		{
			return TRUE;
		};
		if(GuildlessMode == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Sergio_Isgaroth_Info()
{
	AI_Output(self,other,"DIA_Sergio_Isgaroth_04_00");	//�� ������� �� ���� ���������. � ���������� ���� �� ���. ����� ���, ��� � ���� ������� ��� ����.
	Info_ClearChoices(DIA_Sergio_Isgaroth);
	Info_AddChoice(DIA_Sergio_Isgaroth,"��� ������ ���������� �������������?",DIA_Sergio_Isgaroth_Spende);
	Info_AddChoice(DIA_Sergio_Isgaroth,"�� �� ��� �� ���������� ����� ������ ������?",DIA_Sergio_Isgaroth_XP);
};

func void DIA_Sergio_Isgaroth_Spende()
{
	AI_Output(other,self,"DIA_Sergio_Isgaroth_Spende_15_00");	//��� ������ ���������� �������������?
	AI_Output(self,other,"DIA_Sergio_Isgaroth_Spende_04_01");	//����� ��� ������ �������� ���� ������ ������.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	Info_ClearChoices(DIA_Sergio_Isgaroth);
};

func void DIA_Sergio_Isgaroth_XP()
{
	AI_Output(other,self,"DIA_Sergio_Isgaroth_XP_15_00");	//�� �� ��� �� ���������� ����� ������ ������?
	AI_Output(self,other,"DIA_Sergio_Isgaroth_XP_04_01");	//����� �� ����������, ����������, ����� ����� �� ��� ��������� ���� �����.
	B_RaiseTalentByPermBonus(other,NPC_TALENT_2H,2);
	Info_ClearChoices(DIA_Sergio_Isgaroth);
};


instance DIA_Sergio_Aufgabe(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 3;
	condition = DIA_Sergio_Aufgabe_Condition;
	information = DIA_Sergio_Aufgabe_Info;
	description = "��� ����� ������ � ����������.";
};


func int DIA_Sergio_Aufgabe_Condition()
{
	if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Sergio_Isgaroth) && (Parlan_Erlaubnis == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Sergio_Aufgabe_15_00");	//��� ����� ������ � ����������.
	AI_Output(self,other,"DIA_Sergio_Aufgabe_04_01");	//��, � �� ���� ���������� ���� ������. ��� ����� �� ������ ������� ��������� ���� �������.
	if(!Npc_IsDead(Isgaroth))
	{
		AI_Output(self,other,"DIA_Sergio_Aufgabe_04_02");	//�� � ���� ������ ����. ��� � ������� �������� � �������� � ���. � ������, ��� ����� ������ � ��������� ��� ������ ���, �� � ������� ��� ������ ����.
		Wld_InsertNpc(BlackWolf,"NW_PATH_TO_MONASTER_AREA_01");
		MIS_IsgarothWolf = LOG_Running;
		Log_CreateTopic(TOPIC_IsgarothWolf,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_IsgarothWolf,LOG_Running);
		B_LogEntry(TOPIC_IsgarothWolf,"������� �������� ���������� ������ � �������. � ������ ����� ���.");
	};
};


instance DIA_Sergio_WHAT(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 3;
	condition = DIA_Sergio_WHAT_Condition;
	information = DIA_Sergio_WHAT_Info;
	description = "��� �� ������� �����?";
};


func int DIA_Sergio_WHAT_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sergio_WHAT_Info()
{
	AI_Output(other,self,"DIA_Sergio_WHAT_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Sergio_WHAT_04_01");	//� ������ ������, ����� �� ������� ��� ���� � ��� ����.
	AI_Output(self,other,"DIA_Sergio_WHAT_04_02");	//����� � ���� ����� � ����� ���������� � �������� ���� ��� ������ � ��� ������ �� �����.
	AI_Output(other,self,"DIA_Sergio_WHAT_15_03");	//����� ������?
	AI_Output(self,other,"DIA_Sergio_WHAT_04_04");	//���� ���, ��� ���������� ���� ������. �� �����, ������� ��� ��� ��������� ��������.
};


instance DIA_Sergio_Babo(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 3;
	condition = DIA_Sergio_Babo_Condition;
	information = DIA_Sergio_Babo_Info;
	description = "�� ��� �� �� ������� ������������� ����?";
};


func int DIA_Sergio_Babo_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Babo_Training == LOG_Running) && !Npc_IsDead(Babo))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Babo_Info()
{
	AI_Output(other,self,"DIA_Sergio_Babo_15_00");	//�� ��� �� �� ������� ������������� ����?
	AI_Output(self,other,"DIA_Sergio_Babo_04_01");	//� ������ �� �� �������� ���?
	AI_Output(other,self,"DIA_Sergio_Babo_15_02");	//� �����, �� ������.
	AI_Output(self,other,"DIA_Sergio_Babo_04_03");	//�������. ������, ���� ��� ��� ����� ������ ��� ����, � ���� ����������� ��� ������ ���� � ������� ���� �����. �� ����� �������� � ���� ����. ������ �������� ��� ���.
	Npc_ExchangeRoutine(self,"TRAIN");
	B_LogEntry(Topic_BaboTrain,"������ ���������� ����������� ���� �� ��� ���� ������ ����.");
};


instance DIA_Sergio_WHY(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 4;
	condition = DIA_Sergio_WHY_Condition;
	information = DIA_Sergio_WHY_Info;
	description = "������ �� �� � ������� ����������?";
};


func int DIA_Sergio_WHY_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sergio_WHY_Info()
{
	AI_Output(other,self,"DIA_Sergio_WHY_15_00");	//������ �� �� � ������� ����������?
	AI_Output(self,other,"DIA_Sergio_WHY_04_01");	//����� ���������� ������� ��������, ��� � �����, ������ �� ���� ��������, ��� ��, ��������, ����� ������ �����, ��� ��� ��� ����������� ���� ������.
	AI_Output(self,other,"DIA_Sergio_WHY_04_02");	//��, �������� - ����� ������. ��� ���� - ����� ��� ���. � ��������� ������ � ��� ����� �������� �� �����.
};


instance DIA_Sergio_ORDERS(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 10;
	condition = DIA_Sergio_ORDERS_Condition;
	information = DIA_Sergio_ORDERS_Info;
	permanent = TRUE;
	description = "�� ��� ������� ����� �������?";
};


func int DIA_Sergio_ORDERS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sergio_WHY) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		if(Sergio_Follow == FALSE)
		{
			return TRUE;
		};
		if(Sergio_Follow_End == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Sergio_ORDERS_Info()
{
	AI_Output(other,self,"DIA_Sergio_ORDERS_15_00");	//�� ��� ������� ����� �������?
	AI_Output(self,other,"DIA_Sergio_ORDERS_04_01");	//���� ���, � � ���� ���� ����� ����� ���� � ��������.
};


instance DIA_Sergio_Start(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 10;
	condition = DIA_Sergio_Start_Condition;
	information = DIA_Sergio_Start_Info;
	permanent = FALSE;
	description = "�� ������ ������������ ���� � �������.";
};


func int DIA_Sergio_Start_Condition()
{
	if(Sergio_Follow == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Sergio_Start_Info()
{
	AI_Output(other,self,"DIA_Sergio_Start_15_00");	//�� ������ ������������ ���� � �������.
	AI_Output(self,other,"DIA_Sergio_Start_04_01");	//������, � ������ ���. � ���� ������, ��� �� ����.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	self.npcType = NPCTYPE_FRIEND;
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_Sergio_Guide(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 10;
	condition = DIA_Sergio_Guide_Condition;
	information = DIA_Sergio_Guide_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Sergio_Guide_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") > 1000))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Guide_Info()
{
	AI_Output(other,self,"DIA_Sergio_Guide_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Sergio_Guide_04_01");	//� ������ ����������� ���� � �������. �� ����� ������� ����� ����������� ���������� ���.
	AI_Output(self,other,"DIA_Sergio_Guide_04_02");	//�� �� ����� ������ �������.
	AI_StopProcessInfos(self);
};


instance DIA_Sergio_Ende(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 2;
	condition = DIA_Sergio_Ende_Condition;
	information = DIA_Sergio_Ende_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sergio_Ende_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Ende_Info()
{
	AI_Output(self,other,"DIA_Sergio_Ende_04_00");	//�� ������. ��� �� �� ����� ���� � ������ ��������, � �������, ��� �� ������� ������ �����.
	AI_Output(other,self,"DIA_Sergio_Ende_15_01");	//�� ����� - � �������.
	AI_Output(self,other,"DIA_Sergio_Ende_04_02");	//��� � �������. �� �� ������� �� ���� ��� ������.
	AI_StopProcessInfos(self);
	B_ResetSergio();
};


instance DIA_Sergio_Perm(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 2;
	condition = DIA_Sergio_Perm_Condition;
	information = DIA_Sergio_Perm_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sergio_Perm_Condition()
{
	if(Kapitel >= 3)
	{
		if(other.guild == GIL_PAL)
		{
			return TRUE;
		};
		if(other.guild == GIL_SLD)
		{
			return TRUE;
		};
		if(other.guild == GIL_DJG)
		{
			return TRUE;
		};
	};
};

func void DIA_Sergio_Perm_Info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_00");	//����� ������, ����. ���� �� ������ ������ ���-������ �� ��������� ����, �������� � ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_01");	//� ������ � ����. �� ������ � �����, ������� ��� � ������ ��������. ��� ��������.
	};
	AI_StopProcessInfos(self);
};

