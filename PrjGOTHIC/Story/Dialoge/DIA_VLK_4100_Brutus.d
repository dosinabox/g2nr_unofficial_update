
instance DIA_Brutus_EXIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 999;
	condition = DIA_Brutus_EXIT_Condition;
	information = DIA_Brutus_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brutus_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Brutus_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_AFTER_FIGHT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 1;
	condition = DIA_Brutus_AFTER_FIGHT_Condition;
	information = DIA_Brutus_AFTER_FIGHT_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Brutus_AFTER_FIGHT_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE) && (self.aivar[AIV_LastFightComment] == FALSE) && Npc_IsInState(self,ZS_Talk) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_AFTER_FIGHT_Info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(other,self,"DIA_Brutus_AFTER_FIGHT_15_00");	//� ���� ��� ��� ���� �� �����?
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_01");	//��, � ����, �� ������! � �� ����� �� ��������� � ����� � ���.
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output(other,self,"DIA_Brutus_AFTER_FIGHT_15_02");	//��� �������, �� ��� ��� ����� ���������.
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_03");	//� � ���� �� ��� ���� � ������ ����. �����, ������, ��� �������� �����, ��������� ��������� ��������� ���� ������ ������.
		if(Brutus_einmalig == FALSE)
		{
			AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_04");	//��� ��� ����� ������� ���� ������ �� ����. ����� ��� �������� ������ � ������ ��������������!
			CreateInvItems(self,ItPo_Health_01,1);
			B_GiveInvItems(self,hero,ItPo_Health_01,1);
			Brutus_einmalig = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_05");	//� ������ �� ���� ������ ������� �����. �� ����� � ������� �����, � �� �� � ����������.
	};
	self.aivar[AIV_LastFightComment] = TRUE;
};


instance DIA_Brutus_PRISONER(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_PRISONER_Condition;
	information = DIA_Brutus_PRISONER_Info;
	description = "��� �� ����������� �����?";
};


func int DIA_Brutus_PRISONER_Condition()
{
	if(NpcObsessedByDMT_Brutus == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Brutus_PRISONER_Info()
{
	AI_Output(other,self,"DIA_Brutus_PRISONER_15_00");	//��� �� ����������� �����?
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_01");	//��� ���������? � �������� ������. � ��� ��, ��� �������� �������� �������.
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_02");	//����� � ������������ �� ������������. � ��� ��� ��� ���� ������, ���� ���� ������.
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_03");	//�� ��� ��������� ������ - ���������� �� ��������. � ������ ���, � ���� ������� ����������� ���� ������.
	AI_Output(other,self,"DIA_Brutus_PRISONER_15_04");	//������ ������ ����...
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_05");	//�� ���� ��������� ��������, ��� ������ ����� �� ��������, ��� ����� �������� ������ �������.
	if((MIS_RescueGorn != LOG_SUCCESS) && (Kapitel < 3))
	{
		AI_Output(self,other,"DIA_Brutus_PRISONER_06_06");	//� � ����� ����� ���� �� ����������.
		KnowsAboutGorn = TRUE;
	};
};


instance DIA_Brutus_PERM(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 90;
	condition = DIA_Brutus_PERM_Condition;
	information = DIA_Brutus_PERM_Info;
	permanent = TRUE;
	description = "���� ���-������ ���������?";
};


func int DIA_Brutus_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brutus_PRISONER) && (Kapitel < 3) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_PERM_Info()
{
	AI_Output(other,self,"DIA_Brutus_PERM_15_00");	//���� ���-������ ���������?
	AI_Output(self,other,"DIA_Brutus_PERM_06_01");	//��� ��������. ����� ����������� ��� - ��� ������, ���� ����� ���� �� ������ ��������� ���������� �����. ����� ����.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_Kasse(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_Kasse_Condition;
	information = DIA_Brutus_Kasse_Info;
	permanent = FALSE;
	description = "�� �� ��� �� ������������� ����?";
};


func int DIA_Brutus_Kasse_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brutus_PRISONER) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Kasse_Info()
{
	AI_Output(other,self,"DIA_Brutus_Kasse_15_00");	//�� �� ��� �� ������������� ����?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_01");	//�������. � ���� ������ ���� ����� �������, �� ��� ����� �� ���������.
	AI_Output(other,self,"DIA_Brutus_Kasse_15_02");	//������� �� ������?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_03");	//����... �� ���� ������� ������ �����, ��? ��� ��� � ���������...
	AI_Output(self,other,"DIA_Brutus_Kasse_06_04");	//��� ��������, ���, ������ �� ����� ��������� ����� �����. ��� ������!
	AI_Output(self,other,"DIA_Brutus_Kasse_06_05");	//�� �� ������� �� � ������� ������. �� ������ � ����� ���������� ����� �����.
	AI_Output(other,self,"DIA_Brutus_Kasse_15_06");	//��� ��� �� �����?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_07");	//��, � ��� ��� ��������, ��� �� ������� ����, ������� ��... �-�... ������� �� ��� ��� �����.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_08");	//��� ���� ��������� �����. � ������� ���� 200 ������� �����, � ����� ������ ��������� �������.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_09");	//���� �� ������� ��� ��� ������, ������������� ������ �������� ����. � ����� � ���� ����� ������� ����.
	Log_CreateTopic(TOPIC_BrutusKasse,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BrutusKasse,LOG_Running);
	B_LogEntry(TOPIC_BrutusKasse,"������� ������� ��� ������� � 200 �������� �������� � ���-������ ���������������. ���� � ����� ��� 200 ������� �����, �� ������� ��� ����� �������.");
};


instance DIA_Brutus_Den(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_Den_Condition;
	information = DIA_Brutus_Den_Info;
	permanent = FALSE;
	description = "�� ������, ���� ���������� ���� ���?";
};


func int DIA_Brutus_Den_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brutus_Kasse) && (NpcObsessedByDMT_Brutus == FALSE) && Npc_HasItems(Den,ItMi_Gold))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Den_Info()
{
	AI_Output(other,self,"DIA_Brutus_Den_15_00");	//�� ������, ���� ���������� ���� ���?
	AI_Output(self,other,"DIA_Brutus_Den_06_01");	//��� ����� ������ ������, ��� � �������. � �����, �� ��� ���������� ���������� ����� ������.
	AI_Output(other,self,"DIA_Brutus_Den_15_02");	//�������. ������������� ����������.
	AI_Output(self,other,"DIA_Brutus_Den_06_03");	//� ��� � ��� ���� �������? � ������� �� ����, ���� �� ����������.
	B_LogEntry(TOPIC_BrutusKasse,"��� ��� ���������� ���������� ����� ������.");
};


instance DIA_Brutus_Gold(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 2;
	condition = DIA_Brutus_Gold_Condition;
	information = DIA_Brutus_Gold_Info;
	permanent = TRUE;
	description = "� ���� ���� ���-��� ��� ����. (������� 200 �������)";
};


func int DIA_Brutus_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brutus_Kasse) && (NpcObsessedByDMT_Brutus == FALSE) && (Brutus_TeachSTR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Gold_Info()
{
	AI_Output(other,self,"DIA_Brutus_Gold_15_00");	//� ���� ���� ���-��� ��� ����.
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Brutus_Gold_06_01");	//�����������. ������ � ���� ������������� ����, ���� ������.
		Brutus_TeachSTR = TRUE;
		Log_CreateTopic(TOPIC_Teacher_OC,LOG_NOTE);
		B_LogEntry(TOPIC_Teacher_OC,"������ ����� ������ ��� ����� �������.");
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_Gold_06_02");	//��������, ������ ������� ��� 200 �����. ���� �� ����������, ��� �� �������� ��, ������ �� ��� ���� ������.
	};
};


func void B_BuildLearnDialog_Brutus()
{
	Info_ClearChoices(DIA_Brutus_Teach);
	Info_AddChoice(DIA_Brutus_Teach,Dialog_Back,DIA_Brutus_Teach_Back);
	Info_AddChoice(DIA_Brutus_Teach,B_BuildLearnAttributeString(ATR_STRENGTH,1),DIA_Brutus_Teach_STR_1);
	Info_AddChoice(DIA_Brutus_Teach,B_BuildLearnAttributeString(ATR_STRENGTH,5),DIA_Brutus_Teach_STR_5);
};

instance DIA_Brutus_Teach(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 7;
	condition = DIA_Brutus_Teach_Condition;
	information = DIA_Brutus_Teach_Info;
	permanent = TRUE;
	description = "� ���� ����� �������.";
};


func int DIA_Brutus_Teach_Condition()
{
	if((Brutus_TeachSTR == TRUE) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Teach_Info()
{
	AI_Output(other,self,"DIA_Brutus_Teach_15_00");	//� ���� ����� �������.
	B_BuildLearnDialog_Brutus();
};

func void DIA_Brutus_Teach_Back()
{
	Info_ClearChoices(DIA_Brutus_Teach);
};

func void DIA_Brutus_Teach_STR_1()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED))
	{
		B_BuildLearnDialog_Brutus();
	};
};

func void DIA_Brutus_Teach_STR_5()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED))
	{
		B_BuildLearnDialog_Brutus();
	};
};

instance DIA_Brutus_DUSCHONWIEDER(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 30;
	condition = DIA_Brutus_DUSCHONWIEDER_Condition;
	information = DIA_Brutus_DUSCHONWIEDER_Info;
	permanent = TRUE;
	description = "����� ����-������ �������?";
};


func int DIA_Brutus_DUSCHONWIEDER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brutus_PRISONER) && (Kapitel == 3) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_DUSCHONWIEDER_Info()
{
	AI_Output(other,self,"DIA_Brutus_DUSCHONWIEDER_15_00");	//����� ����-������ �������?
	AI_Output(self,other,"DIA_Brutus_DUSCHONWIEDER_06_01");	//�� �� ������, � �����?! ������ �������.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Brutus_WARUMNICHTARBBEIT(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 40;
	condition = DIA_Brutus_WARUMNICHTARBBEIT_Condition;
	information = DIA_Brutus_WARUMNICHTARBBEIT_Info;
	description = "������ �� �� ���������?";
};


func int DIA_Brutus_WARUMNICHTARBBEIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brutus_PRISONER) && (Kapitel >= 4) && (NpcObsessedByDMT_Brutus == FALSE) && (MIS_OCGateOpen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_WARUMNICHTARBBEIT_Info()
{
	AI_Output(other,self,"DIA_Brutus_WARUMNICHTARBBEIT_15_00");	//������ �� �� ���������?
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_01");	//(���������) ��� ������!
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_02");	//�� �� ���������� � ��� �������? ��� ������� ������ ���� ��� �������.
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_03");	//� �� ����, ��� ��� ��� ������, �� ���� ���� �� ����� � ���� ������� �����.
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_04");	//� �������� ���� ������. � ������ �����, ��� �����.
	Log_CreateTopic(TOPIC_BrutusMeatbugs,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BrutusMeatbugs,LOG_Running);
	B_LogEntry(TOPIC_BrutusMeatbugs,"������, ����� �����, �������, ��� �� ���������� ������ ����� � ��� �������, � ���� ������� �� ����. � �� ������� ��� ����� ������� ������.");
};


instance DIA_Brutus_MEATBUGSWEG(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 31;
	condition = DIA_Brutus_MEATBUGSWEG_Condition;
	information = DIA_Brutus_MEATBUGSWEG_Info;
	description = "� ������� ������ ���������.";
};


func int DIA_Brutus_MEATBUGSWEG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brutus_WARUMNICHTARBBEIT) && (Kapitel >= 4) && (NpcObsessedByDMT_Brutus == FALSE) && (MIS_OCGateOpen == FALSE))
	{
		if(Npc_IsDead(Meatbug_Brutus1) && Npc_IsDead(Meatbug_Brutus2) && Npc_IsDead(Meatbug_Brutus3) && Npc_IsDead(Meatbug_Brutus4))
		{
			return TRUE;
		};
	};
};

func void DIA_Brutus_MEATBUGSWEG_Info()
{
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_00");	//� ������� ������ ���������. �� ������ ���������� ���������� ���� ������ ��� ����� ��� ��� �� ��� ���������.
	AI_Output(self,other,"DIA_Brutus_MEATBUGSWEG_06_01");	//�� ������������� ������, ��� �� ������ �� ���� �������� �� ��������?
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_02");	//���������.
	AI_Output(self,other,"DIA_Brutus_MEATBUGSWEG_06_03");	//������. ���, ������ ��� ������ � ���� ���� �������������.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_04");	//��, �� ��������� ���� �������.
	TOPIC_END_BrutusMeatbugs = TRUE;
	B_GivePlayerXP(XP_BrutusMeatbugs);
	B_NpcClearObsessionByDMT(self);
	Npc_ExchangeRoutine(self,"START");
};


func void B_Brutus_Panic()
{
	B_NpcClearObsessionByDMT(self);
	if((Npc_GetDistToWP(self,"OC_BRUTUS_MEATBUGS") < 2000) || (Npc_GetDistToWP(self,"OC_FOLTER_SHARP") < 2000))
	{
		Npc_ExchangeRoutine(self,"RUNFROMSTART");
	}
	else
	{
		Npc_ExchangeRoutine(self,"RUNTOSTART");
	};
};

instance DIA_Brutus_PERM4(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 32;
	condition = DIA_Brutus_PERM4_Condition;
	information = DIA_Brutus_PERM4_Info;
	permanent = TRUE;
	description = "��� � �������?";
};


func int DIA_Brutus_PERM4_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Brutus_MEATBUGSWEG) || (MIS_OCGateOpen == TRUE)) && (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_PERM4_Info()
{
	DIA_Common_IsEverythingOk();
	if((MIS_OCGateOpen == TRUE) || ((hero.guild == GIL_KDF) && (Kapitel >= 5)))
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_PERM4_06_01");	//(������������) �� ������, ��� �� ����� ������� ������ ���������?
		AI_Output(other,self,"DIA_Brutus_PERM4_15_02");	//��... ������, ��� ���� ����� ����.
		AI_Output(self,other,"DIA_Brutus_PERM4_06_03");	//(�����) �����?
		B_Brutus_Panic();
	};
};


instance DIA_Brutus_BESSEN(C_Info)
{
	npc = VLK_4100_Brutus;
	nr = 55;
	condition = DIA_Brutus_BESSEN_Condition;
	information = DIA_Brutus_BESSEN_Info;
	permanent = TRUE;
	description = "�� �� �������!";
};


func int DIA_Brutus_BESSEN_Condition()
{
	if((NpcObsessedByDMT_Brutus == TRUE) && (NpcObsessedByDMT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_BESSEN_Info()
{
	AI_Output(other,self,"DIA_Brutus_BESSEN_15_00");	//�� �� �������!
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Brutus_BESSEN_15_01");	//����������� � ���������, ����� ��� ������� ����.
		AI_Output(self,other,"DIA_Brutus_BESSEN_06_02");	//��� ����� �� ����� ������. ��������!
		B_NpcClearObsessionByDMT(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Brutus_BESSEN_15_03");	//���-������ ������ ������ ������� �� ����� ������.
		AI_Output(self,other,"DIA_Brutus_BESSEN_06_04");	//(�����) ����!
		B_Brutus_Panic();
	};
};

