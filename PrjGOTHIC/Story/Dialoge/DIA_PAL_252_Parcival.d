
instance DIA_Parcival_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_EXIT_Condition;
	information = DIA_Parcival_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Parcival_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_Schurfer(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_Schurfer_Condition;
	information = DIA_Parcival_Schurfer_Info;
	permanent = FALSE;
	description = "��� �� ������ ���������� ��� � ����������?";
};


func int DIA_Parcival_Schurfer_Condition()
{
	if(MIS_ScoutMine == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Parcival_Schurfer_Info()
{
	AI_Output(other,self,"DIA_Parcival_Schurfer_15_00");	//��� �� ������ ���������� ��� � ����������?
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_01");	//� �������� ��� ��� ������.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_02");	//�� ���������� ������, ������ � ����������.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_03");	//������ ������� ����� �� ����������� � ������ ����� - �� ����� ������ ������� �����.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_04");	//������ ��� ������ ����� ������.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_05");	//�������, ���� �� ����� �����������, �������, ��� ��� ������� ������ ���������� �� ������� �����.
	B_LogEntry(TOPIC_ScoutMine,"������ ���������� ����������� ��������. ������, ������ � ����������.");
	Log_AddEntry(TOPIC_ScoutMine,"������ ������� ����� �� ����������� � ������ �����. �� ����������� ��� ������� �����.");
	Log_AddEntry(TOPIC_ScoutMine,"������ ��� ������ ����� ������. ��� ������� ������ ���������� �� ������� �����.");
};


instance DIA_Parcival_Diego(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 9;
	condition = DIA_Parcival_Diego_Condition;
	information = DIA_Parcival_Diego_Info;
	permanent = FALSE;
	description = "� � ����� ������� ���������� ����� �����?";
};


func int DIA_Parcival_Diego_Condition()
{
	if((SearchForDiego == LOG_Running) && (Kapitel < 3) && Npc_KnowsInfo(other,DIA_Parcival_Schurfer))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Diego_Info()
{
	AI_Output(other,self,"DIA_Parcival_Diego_15_00");	//� � ����� ������� ���������� ����� �����?
	AI_Output(self,other,"DIA_Parcival_Diego_13_01");	//���� ��������� - �����? �� � ������� �������� ����������.
	B_LogEntry(TOPIC_ScoutMine,"����� ����� �� �����������, �������������� ��������� ����������.");
};


instance DIA_Parcival_Weg(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 8;
	condition = DIA_Parcival_Weg_Condition;
	information = DIA_Parcival_Weg_Info;
	permanent = FALSE;
	description = "�� ������, ��� ��������� �� ���� ����?";
};


func int DIA_Parcival_Weg_Condition()
{
	if(MIS_ScoutMine == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Parcival_Weg_Info()
{
	AI_Output(other,self,"DIA_Parcival_Weg_15_00");	//�� ������, ��� ��������� �� ���� ����?
	AI_Output(self,other,"DIA_Parcival_Weg_13_01");	//����� ������ ������ ��� ����������� ����. �� ��� ��� �� �������, ��� ����� ����� �������� ������ ������.
	AI_Output(self,other,"DIA_Parcival_Weg_13_02");	//������� �������� �� ����� � ����� - � �� ������ ���� �����.
	B_LogEntry(TOPIC_ScoutMine,"������, ������ ���� � ���������� ����� ��������� �� ������ �������. ��� ����� �������� �������� ���� � ������ �����.");
};


instance DIA_Parcival_DRAGON(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_DRAGON_Condition;
	information = DIA_Parcival_DRAGON_Info;
	description = "��� ����������?";
};


func int DIA_Parcival_DRAGON_Condition()
{
	return TRUE;
};

func void DIA_Parcival_DRAGON_Info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGON_15_00");	//��� ����������?
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_01");	//�� �������� ������. ������, ��� ����� �������.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_02");	//�� ����������� ������ ���� �������� ��������� ��������. ��� ��� ���������� ���� ������� ����.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_03");	//��� ���� ��������� ��������, � �� ������� ������� ������.
};


instance DIA_Parcival_DRAGONS(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_DRAGONS_Condition;
	information = DIA_Parcival_DRAGONS_Info;
	description = "������� ����� ��������?";
};


func int DIA_Parcival_DRAGONS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Parcival_DRAGON) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Parcival_DRAGONS_Info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGONS_15_00");	//������� ����� ��������?
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_01");	//�� �� �����, ������� �� �����, �� ������ ������, ��� �����.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_02");	//�� � ��� ��� �� ���. ��� ������ �������� ����� ������������ ����������, ��������������� ��������.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_03");	//�� ����� ���������� ���� - ��� ������������ ����� ���� ����� ��������� ������ ������ ��������.
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_BRAVE(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 8;
	condition = DIA_Parcival_BRAVE_Condition;
	information = DIA_Parcival_BRAVE_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Parcival_BRAVE_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Parcival_DRAGONS) && (Kapitel < 3) && (Parcival_BRAVE_LaberCount <= 6))
	{
		return TRUE;
	};
};


var int Parcival_BRAVE_LaberCount;

func void DIA_Parcival_BRAVE_Info()
{
	var int randy;
	if(Parcival_BRAVE_LaberCount < 6)
	{
		randy = Hlp_Random(3);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_00");	//���� ��� ��������. �� ��� ����� ������ ������������.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_01");	//�� ����� ���������, ������� ������.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_02");	//����� ������� ���. ��� ���� ������� ���� ������!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_BRAVE_13_03");	//��! ���� ���, ������ ������ ������, ��� ������� �� ����? ����������!
		B_GivePlayerXP(XP_AmbientKap2);
	};
	Parcival_BRAVE_LaberCount += 1;
};


instance DIA_Parcival_ALLESKLAR(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 31;
	condition = DIA_Parcival_ALLESKLAR_Condition;
	information = DIA_Parcival_ALLESKLAR_Info;
	permanent = TRUE;
	description = "��� � �������?";
};


func int DIA_Parcival_ALLESKLAR_Condition()
{
	if((Kapitel == 3) && (DIA_Parcival_ALLESKLAR_NervCounter < 3) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};


var int DIA_Parcival_ALLESKLAR_NervCounter;

func void DIA_Parcival_ALLESKLAR_Info()
{
	AI_Output(other,self,"DIA_Parcival_ALLESKLAR_15_00");	//��� � �������?
	if(DIA_Parcival_ALLESKLAR_NervCounter == 0)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_01");	//���� ��!
	}
	else if(DIA_Parcival_ALLESKLAR_NervCounter == 1)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_02");	//��, ���� ���� ������.
	}
	else if(Parcival_BRAVE_LaberCount > 6)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_03");	//(�������) ��. ������ � �������, ��� �� �������. ���, ������. �� �� ���� ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_04");	//�� �������� ����.
	};
	DIA_Parcival_ALLESKLAR_NervCounter += 1;
};


instance DIA_Parcival_AnyNews(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_AnyNews_Condition;
	information = DIA_Parcival_AnyNews_Info;
	description = "������ ������� �� ���������?";
};


func int DIA_Parcival_AnyNews_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};

func void DIA_Parcival_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_15_00");	//������ ������� �� ���������?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_01");	//�� ���� �� ���� �������� ��������, ��� �������� ���� ���������� �� ��������?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_02");	//������-��, � �������, ��� � ���� ������ ��� �� ����������� � ����� ����������.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_03");	//� ����������. ����� ������ ����������.
		AI_Output(other,self,"DIA_Parcival_AnyNews_15_04");	//���?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_05");	//������� ����� ��������� ��� ����. ��� �������� ���� ���������� �� ��������.
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_06");	//� ���� ����� ������ ��� ��� ����������� � �����������.
	};
	AI_Output(self,other,"DIA_Parcival_AnyNews_13_07");	//���� �� ��� ���� � ���� ������, � �� ������ �� ���� �� �����. ����� ���� ����������� � ���.
	Info_ClearChoices(DIA_Parcival_AnyNews);
	Info_AddChoice(DIA_Parcival_AnyNews,"�� � ������� �� ����� ������, ��� ��� �� �����.",DIA_Parcival_AnyNews_LordHagen);
	Info_AddChoice(DIA_Parcival_AnyNews,"�� ������ ���� �� ����.",DIA_Parcival_AnyNews_Chance);
	Info_AddChoice(DIA_Parcival_AnyNews,"���� �� �������, ��� �� ���������������?",DIA_Parcival_AnyNews_Overact);
};

func void DIA_Parcival_AnyNews_LordHagen()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_LordHagen_15_00");	//�� � ������� �� ����� ������, ��� ��� �� �����.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_01");	//(������ �������) ��, � ���������, ��� ���, ��� � ��� ����.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_02");	//�������� ����� ���������� ��� �������� ���������.
	Info_ClearChoices(DIA_Parcival_AnyNews);
};

func void DIA_Parcival_AnyNews_Chance()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Chance_15_00");	//�� ������ ���� �� ����.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_01");	//� ��� ��� �������. � ���������.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_02");	//������ �������, ��� ��� ����� ������ ���.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_03");	//�� � ���� � ��� �� �����. � ��� � ��� ������� ������� � ������. � �������������� ������������ ��� ������ �� � ����.
	Info_ClearChoices(DIA_Parcival_AnyNews);
};

func void DIA_Parcival_AnyNews_Overact()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Overact_15_00");	//���� �� �������, ��� �� ���������������?
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_01");	//��������� ���. � ����� �������� ��� ����� ����, �������� ����� ������ ��������.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_02");	//�����, ������� �������� ����� ������ � ������� ����� ������.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_03");	//� ������ ����� ��� ���������� ��������� ������ ��� ���� ������.
};


instance DIA_Parcival_Jan(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_Jan_Condition;
	information = DIA_Parcival_Jan_Info;
	permanent = FALSE;
	description = "��� ����� ���������� � ����� � ���.";
};


func int DIA_Parcival_Jan_Condition()
{
	if((MIS_JanBecomesSmith == LOG_Running) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Jan_Info()
{
	AI_Output(other,self,"DIA_Parcival_Jan_15_00");	//��� ����� ���������� � ����� � ���.
	AI_Output(self,other,"DIA_Parcival_Jan_13_01");	//���? ��� ���?
	AI_Output(other,self,"DIA_Parcival_Jan_15_02");	//������� �� ��������. �� ������.
	AI_Output(self,other,"DIA_Parcival_Jan_13_03");	//��, ��. � �����. ��� ������ ����?
	AI_Output(other,self,"DIA_Parcival_Jan_15_04");	//�� ����� �������� � �������.
	AI_Output(self,other,"DIA_Parcival_Jan_13_05");	//��� ���� �� �����������. �� �� ��� ������� � � �� ������� ���.
};


instance DIA_Parcival_ThinkAgain(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_ThinkAgain_Condition;
	information = DIA_Parcival_ThinkAgain_Info;
	permanent = TRUE;
	description = "�� �� ��� �� ������������ ���� ������ ������ ���?";
};


func int DIA_Parcival_ThinkAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Parcival_Jan) && (MIS_JanBecomesSmith == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Parcival_ThinkAgain_Info()
{
	AI_Output(other,self,"DIA_Parcival_ThinkAgain_15_00");	//�� �� ��� �� ������������ ���� ������ ������ ���?
	AI_Output(self,other,"DIA_Parcival_ThinkAgain_13_01");	//���, ��� ������� ������������.
};


instance DIA_Parcival_TalkedGarond(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_TalkedGarond_Condition;
	information = DIA_Parcival_TalkedGarond_Info;
	description = "������ �����, ����� �� ������� � �������.";
};


func int DIA_Parcival_TalkedGarond_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Parcival_Jan) && (MIS_JanBecomesSmith == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};

func void DIA_Parcival_TalkedGarond_Info()
{
	AI_Output(other,self,"DIA_Parcival_TalkedGarond_15_00");	//������ �����, ����� �� ������� � �������.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_01");	//���. ���� ��� ������������� ���, �� � �� ���� ������ ������ �����.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_02");	//���� � � ������ ������� �������� ����� ���.
};


instance DIA_Parcival_PERMKAP4(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 43;
	condition = DIA_Parcival_PERMKAP4_Condition;
	information = DIA_Parcival_PERMKAP4_Info;
	permanent = TRUE;
	description = "� ����� �����?";
};


func int DIA_Parcival_PERMKAP4_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Parcival_AnyNews))
	{
		return TRUE;
	};
};

func void DIA_Parcival_PERMKAP4_Info()
{
	AI_Output(other,self,"DIA_Parcival_PERMKAP4_15_00");	//� ����� �����?
	AI_Output(self,other,"DIA_Parcival_PERMKAP4_13_01");	//��, ������ ���� � �����!
};


instance DIA_Parcival_VERRAETER(C_Info)
{
	npc = PAL_252_Parcival;
	condition = DIA_Parcival_VERRAETER_Condition;
	information = DIA_Parcival_VERRAETER_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Parcival_VERRAETER_Condition()
{
	if(!Npc_RefuseTalk(self) && (MIS_OCGateOpen == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_VERRAETER_Info()
{
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_00");	//���������! � ����� ����, ��� ��� �� ������ ������.
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_01");	//�� ��������� �� ���.
	Npc_SetRefuseTalk(self,30);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

