
instance DIA_Addon_Esteban_EXIT(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 999;
	condition = DIA_Addon_Esteban_EXIT_Condition;
	information = DIA_Addon_Esteban_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Esteban_EXIT_Condition()
{
	if(Bodyguard_Killer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Esteban_Hi(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 2;
	condition = DIA_Addon_Esteban_Hi_Condition;
	information = DIA_Addon_Esteban_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Esteban_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_00");	//��� �� ��� ����� ������, ��� � ���� �������� � ������.
	AI_Output(other,self,"DIA_Addon_Esteban_Hi_15_01");	//����� ������ ����������������...
	if(Npc_IsDead(Franco))
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_02");	//������ ��� ������� �������. ����� �� ����� ����������� � ���. ����� - ����� ����.
	}
	else
	{
		B_StartOtherRoutine(Carlos,"GUARD");
	};
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_03");	//������ ����� ����� ��������� �������� - ���� �� ������� �� �� �� ����, � ���� ����.
};


instance DIA_Addon_Esteban_Mine(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 3;
	condition = DIA_Addon_Esteban_Mine_Condition;
	information = DIA_Addon_Esteban_Mine_Info;
	permanent = FALSE;
	description = "� ���� ������� � �����!";
};


func int DIA_Addon_Esteban_Mine_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Mine_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Mine_15_00");	//� ���� ������� � �����!
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_01");	//(���������) �����������. ����� �� ������ � ���������� ����� � ����������� ��������.
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_02");	//������ ��� ������, ��� ������ � �����, ��������� ���� �������� ���� ������.
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_03");	//� � ����� ������� �����, ���� �� ������� ���� ����� �����, ����� ����� ������� ����.
};


instance DIA_Addon_Esteban_Rot(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 3;
	condition = DIA_Addon_Esteban_Rot_Condition;
	information = DIA_Addon_Esteban_Rot_Info;
	permanent = FALSE;
	description = "��� ��� ���� �� ���� ������� ������.";
};


func int DIA_Addon_Esteban_Rot_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Mine))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Rot_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Rot_15_00");	//��� ��� ���� �� ���� ������� ������.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_01");	//������, �� ��� �� ���������.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_02");	//������ � ����� ����� ���� ������, ��� ������� �������� �� ������.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_03");	//(����������) ����� �� �� ������ � ���, ��� �������� ������?
	if(Hero_HackChance > 25)
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_04");	//��, ��������, ��������� ��������� �������, �����?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_05");	//�������, �� �� ���� ������ �� ������.
	};
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_06");	//(��������) ���� � ��� ���� ������� ������, �� �� ������, ��� �� ����� ������� �������.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_07");	//���, � ���� ���� ��� ���� ������ ������...
};


instance DIA_Addon_Esteban_MIS(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 4;
	condition = DIA_Addon_Esteban_MIS_Condition;
	information = DIA_Addon_Esteban_MIS_Info;
	permanent = FALSE;
	description = "����� ������?";
};


func int DIA_Addon_Esteban_MIS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Rot))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_MIS_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_00");	//����� ������?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_01");	//���� �� �������� ����� ���� �����. �� ������ ����� ��� ��������� ����� ���.
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_02");	//�� ����� ������ ���� �����?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_03");	//�� ��� ������ ������! ���������� ������. ������ ��� �� ������� � ������ �� ������ ������� �� ����.
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_04");	//�� �������� ���-�� ������� - ���-�� ������ ��� ������� ���...
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_05");	//��� ��� ��, ��� ����� ����� ����, ��� ����� �� ���� ����?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_06");	//���, ��� ������ ������, �������� �� ���. ����� ��� - � � ��� ���� ������� � �����.
	if(!Npc_IsDead(Senyan) && Npc_KnowsInfo(other,DIA_Addon_BDT_1084_Senyan_Hi))
	{
		AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_07");	//������ ������ ���� � ���� �� ����� ����.
		AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_08");	//������? �� ���� �������� �� ����. � ������ ���, ����� �� ������� � ���.
	};
	MIS_Judas = LOG_Running;
	Log_CreateTopic(Topic_Addon_Esteban,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Esteban,LOG_Running);
	B_LogEntry(Topic_Addon_Esteban,"�� ����� �������� ���� ��������� ���������. � ������ ��������, ��� �� ���� �����.");
};


instance DIA_Addon_Esteban_Kerl(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_Kerl_Condition;
	information = DIA_Addon_Esteban_Kerl_Info;
	permanent = FALSE;
	description = "� ��� ��� ����� �������?";
};


func int DIA_Addon_Esteban_Kerl_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Kerl_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Kerl_15_00");	//� ��� ��� ����� �������?
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_01");	//��� � ������ ����� �� ����. ������� �� ������� � ��������.
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_02");	//���������� ��������, ��� �� ���� �������, � ��� - ������, � �� ��� ������� ���� ��������!
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_03");	//�������� �� ������. ���� ������ ����� ����� �����.
	B_LogEntry(Topic_Addon_Esteban,"����� ����� ���������, � ������ ���������� � ������ � ������ � ��������, �� ���� ��� �������. ���� ����� ��� ������ - ��� ������ ��������.");
};


instance DIA_Addon_Esteban_Armor(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 9;
	condition = DIA_Addon_Esteban_Armor_Condition;
	information = DIA_Addon_Esteban_Armor_Info;
	permanent = FALSE;
	description = "��� ����� ������� �������.";
};


func int DIA_Addon_Esteban_Armor_Condition()
{
	if(Huno_ArmorCheap == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Armor_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Armor_15_00");	//��� ����� ������� �������.
	AI_Output(self,other,"DIA_Addon_Esteban_Armor_07_01");	//�����? � ���� ��� ���� �������, ���� ��� ������ ������ �������� ���!
	if(MIS_Judas == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Armor_07_02");	//���� �� ��������� ��� �������, �� ��������� �� ����...
	};
};


instance DIA_Addon_Esteban_Auftrag(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 99;
	condition = DIA_Addon_Esteban_Auftrag_Condition;
	information = DIA_Addon_Esteban_Auftrag_Info;
	permanent = TRUE;
	description = "�� ������ �������...";
};


func int DIA_Addon_Esteban_Auftrag_Condition()
{
	if(((MIS_Judas == LOG_Running) || (MIS_Judas == LOG_SUCCESS)) && (Esteban_KnowsFiskAsTraitor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Auftrag_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_00");	//�� ������ �������...
	AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_01");	//��������, � ���� ���� � ������ ����.
	if(MIS_Judas == LOG_SUCCESS)
	{
		if(Npc_IsDead(Fisk))
		{
			AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Found_15_00");	//� ����� ���������. ��� ����.
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_02");	//� �����, ���� ����� ���������, ��� ����������� ���������...
			AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_03");	//� ��� �� ���? ����� ��� ��� ��� - � ��� ������ ������� ��� ���...
			AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_04");	//��� ����������� �������� ����. � ������ ������ �� ����� � ����, ���� � ������ �� �����������...
		};
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_05");	//��! �������� ������, �����. ��� ��������� �������� ��.
		if(Npc_IsDead(Fisk))
		{
			DIA_Common_HeIsDead();
			B_Say(self,other,"$GOODVICTORY");
			B_Say(self,other,"$NOTBAD");
			Esteban_KnowsFiskIsDead = TRUE;
		}
		else if(!Npc_IsDead(Wache_01) || !Npc_IsDead(Wache_02))
		{
			if(!Npc_IsDead(Wache_01))
			{
				AI_TurnToNPC(self,Wache_01);
			}
			else
			{
				AI_TurnToNPC(self,Wache_02);
			};
			AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_06");	//�� �������, ��� �� ������, ������. ������� � �������� �����.
			AI_TurnToNPC(self,other);
		};
		Esteban_KnowsFiskAsTraitor = TRUE;
		Bodyguard_Killer = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_07");	//�����������, ����� �� ��������, ��� ����� �� ����������.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Esteban_Away(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_Away_Condition;
	information = DIA_Addon_Esteban_Away_Info;
	permanent = FALSE;
	description = "� ��� ������ �����?";
};


func int DIA_Addon_Esteban_Away_Condition()
{
	if((Esteban_KnowsFiskAsTraitor == TRUE) && (Esteban_KnowsFiskIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Away_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Away_15_00");	//� ��� ������ �����?
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_01");	//��� ������ �����? � ����� ����, ��� �����.
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_02");	//���� ����� ����������� �������. � ���� ������ ����� �����, �� ���.
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_03");	//��� �������� �� ���� ���������������.
	B_StartOtherRoutine(Wache_01,"AMBUSH");
	B_StartOtherRoutine(Wache_02,"AMBUSH");
};


instance DIA_Addon_Esteban_Stone(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_Stone_Condition;
	information = DIA_Addon_Esteban_Stone_Info;
	permanent = FALSE;
	description = "���� � ������ �������� ������� ������?";
};


func int DIA_Addon_Esteban_Stone_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Away) || (Esteban_KnowsFiskIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Stone_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Stone_15_00");	//���� � ������ �������� ������� ������?
	AI_Output(self,other,"DIA_Addon_Esteban_Stone_07_01");	//�� ������ ��������� � �������. ���� ������ ������ � �����.
	AI_Output(self,other,"DIA_Addon_Esteban_Stone_07_02");	//� ���� ������������ ���� � ������� �������. �� ���������� � ������ � ������ ���������� �������� �� ����.
};


instance DIA_Addon_Esteban_not(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_not_Condition;
	information = DIA_Addon_Esteban_not_Info;
	permanent = FALSE;
	description = "� ������� �� ����.";
};


func int DIA_Addon_Esteban_not_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Stone) && !Npc_KnowsInfo(other,DIA_Addon_Esteban_fight))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_not_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_not_15_00");	//� ������� �� ����.
	AI_Output(self,other,"DIA_Addon_Esteban_not_07_01");	//�� �����, � ��� �� ��������������. � ����� �������, � ���� �������� ������ ��, ��� � �����.
	AI_Output(self,other,"DIA_Addon_Esteban_not_07_02");	//� � ������, ��� �� ������ �������� �� ����, � �� �� ����-������ ���. ��� �������?
};


func void B_Esteban_GiveMeTablet()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Duell_15_00");	//����� ���� ������ ������ ��, ��� � ������ ��� ���!
	AI_Output(self,other,"DIA_Addon_Esteban_Duell_07_01");	//�, � ���� ���� ��������� �������. ��� ����. � ������ ���� ��������� � ������� ���� �� ����� �������!
};

instance DIA_Addon_Esteban_fight(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 6;
	condition = DIA_Addon_Esteban_fight_Condition;
	information = DIA_Addon_Esteban_fight_Info;
	permanent = FALSE;
	description = "�� ������ ��������� ����? � ���� �� ���� � ���, ����� � �� ���� �������.";
};


func int DIA_Addon_Esteban_fight_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Stone))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_fight_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_00");	//�� ������ ��������� ����? � ���� �� ���� � ���, ����� � �� ���� �������.
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_01");	//�� ������ �������� ����� �����������. �� ���� ��� ���� �� ��������, �� ������ �������� �������� ������...
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_02");	//� ����� ����, �� �������� ����� � ���� ��� ������� ������?
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_03");	//��! ��� ���� ����� - � ���� ���������� �������� ��������� ����.
	if(((Npc_GetDistToWP(Wache_01,"BL_INN_OUTSIDE_01") <= 1500) && (Npc_GetDistToWP(Wache_02,"BL_INN_OUTSIDE_02") <= 1500)) || (Npc_IsDead(Wache_01) && Npc_IsDead(Wache_02)))
	{
		AI_Output(other,self,"DIA_Addon_Esteban_fight_15_04");	//(���������) ����� ����������?
		AI_Output(self,other,"DIA_Addon_Esteban_fight_07_05");	//���?.. �, �������, �� ������ ������� ����... ��, ������...
	}
	else
	{
		B_Esteban_GiveMeTablet();
	};
	Bodyguard_Killer = FALSE;
	if(Esteban_KnowsFiskIsDead == FALSE)
	{
		B_StartOtherRoutine(Wache_01,"TOT");
		B_KillNpc(BDT_1081_Addon_Wache_01);
		B_StartOtherRoutine(Wache_02,"TOT");
		B_KillNpc(BDT_10005_Addon_Wache_02);
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		Info_ClearChoices(DIA_Addon_Esteban_fight);
		Info_AddChoice(DIA_Addon_Esteban_fight,Dialog_Ende,DIA_Addon_Esteban_Duell_End);
	};
};


instance DIA_Addon_Esteban_Duell(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 99;
	condition = DIA_Addon_Esteban_Duell_Condition;
	information = DIA_Addon_Esteban_Duell_Info;
	permanent = FALSE;
	description = "����� ���� ������ ������ ��, ��� � ������ ��� ���!";
};


func int DIA_Addon_Esteban_Duell_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Rot) && (Bodyguard_Killer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Duell_Info()
{
	B_Esteban_GiveMeTablet();
	if(Npc_IsDead(Wache_01) && Npc_IsDead(Wache_02))
	{
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		Info_ClearChoices(DIA_Addon_Esteban_Duell);
		Info_AddChoice(DIA_Addon_Esteban_Duell,Dialog_Ende,DIA_Addon_Esteban_Duell_End);
	};
};

func void DIA_Addon_Esteban_Duell_End()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	if(!C_NpcIsDown(Wache_01))
	{
		if(Npc_GetDistToNpc(Wache_01,other) <= 1500)
		{
			B_Attack(Wache_01,other,AR_NONE,1);
		};
	};
	if(!C_NpcIsDown(Wache_02))
	{
		if(Npc_GetDistToNpc(Wache_02,other) <= 1500)
		{
			B_Attack(Wache_02,other,AR_NONE,1);
		};
	};
};

