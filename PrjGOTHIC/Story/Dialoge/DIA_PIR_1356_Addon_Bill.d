
instance DIA_Addon_Bill_EXIT(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 999;
	condition = DIA_Addon_Bill_EXIT_Condition;
	information = DIA_Addon_Bill_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Bill_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bill_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Bill_Hello(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 1;
	condition = DIA_Addon_Bill_Hello_Condition;
	information = DIA_Addon_Bill_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Bill_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Hello_15_00");	//��� � ���� ����?
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_01");	//���� ������� ���� �����?
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_02");	//����� ���, ��� �� ������� ���� ������, ��� ������ � �������.
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_03");	//� ���� �� �� ����� �����, ����� ������ ���� � ������ ��� ������.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Bill_Planks(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 2;
	condition = DIA_Addon_Bill_Planks_Condition;
	information = DIA_Addon_Bill_Planks_Info;
	description = "��� ���� ����� ��� ��� ������?";
};


func int DIA_Addon_Bill_Planks_Condition()
{
	if(GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_Planks_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Planks_15_00");	//��� ���� ����� ��� ��� ������?
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_01");	//��� ���������, ������.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_02");	//���� �����, ��� �� ������ �� �������� ��� ������ ������.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_03");	//�������, � �����, ��� �� ����� �� ����� �� ���������.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_04");	//���� ������� ������� ������ �� ��� �������, ��� ������������ ������ ��� �� �������.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_05");	//�� � ������ ������ ����� ���� ����� ������.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_06");	//���� �� � ����, ��� ������ �� ������, � �� ������� � ��������.
};


var int Bill_Perm_Once;

instance DIA_Addon_Bill_Perm(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 4;
	condition = DIA_Addon_Bill_Perm_Condition;
	information = DIA_Addon_Bill_Perm_Info;
	permanent = TRUE;
	description = "� ���� ������ ����?";
};


func int DIA_Addon_Bill_Perm_Condition()
{
	if((GregIsBack == FALSE) && Npc_WasInState(self,ZS_Saw))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Perm_15_00");	//� ���� ������ ����?
	AI_Output(self,other,"DIA_Addon_Bill_Perm_03_01");	//���, �������, � ��� ���������.
	if(Bill_Perm_Once == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Bill_Perm_03_02");	//� �� ��� ����� ������������� � �������, � ���� � ���� ��������� �� ������ ���� ������, �� ��� ����� ������� �� ��������.
		Bill_Perm_Once = TRUE;
	};
};


instance DIA_Addon_Bill_Perm2(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 5;
	condition = DIA_Addon_Bill_Perm2_Condition;
	information = DIA_Addon_Bill_Perm2_Info;
	permanent = TRUE;
	description = "��� �� ������� ������?";
};


func int DIA_Addon_Bill_Perm2_Condition()
{
	if(GregIsBack == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_Perm2_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Perm2_15_00");	//��� �� ������� ������?
	AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_01");	//�? � �������.
	if(!Npc_IsDead(Francis))
	{
		AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_02");	//(����������) ���� ������� ���������� �������.
		AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_03");	//� ������ �� �����, ���� � ���� ���� �� ���������.
	};
};


instance DIA_Addon_Bill_AngusnHank(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 11;
	condition = DIA_Addon_Bill_AngusnHank_Condition;
	information = DIA_Addon_Bill_AngusnHank_Info;
	permanent = FALSE;
	description = "� ��� ������ � �����.";
};


func int DIA_Addon_Bill_AngusnHank_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_AngusHank) && Npc_HasItems(Angus,ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_AngusnHank_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_AngusnHank_15_00");	//� ��� ������ � �����.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_01");	//(��������) � �� ����, ��� ���. ������ ����, ������� �� �����.
	AI_Output(other,self,"DIA_Addon_Bill_AngusnHank_15_02");	//�� ���� ��������, �����?
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_03");	//���, ��� � ���� - ��� ��, ��� ��� ������ ���� ����������� � ��������� � �����-�� ������ ���������� ������.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_04");	//��� ������ ���� ���-�� �� ������� �� ������.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_05");	//�� ����, ��� ������ ��� ���������. ��� � ��� �� ���� �� ���.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_06");	//�����, ���� ����� ���������� � ����������� ������. �� ����� ������� ������ ������.
	B_LogEntry(TOPIC_Addon_SkipsGrog,"� ������ � ����� ���� ������ � ������� �� ������. � ��� ������ ����� ��������� ����.");
};


instance DIA_Addon_Bill_FoundFriends(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 12;
	condition = DIA_Addon_Bill_FoundFriends_Condition;
	information = DIA_Addon_Bill_FoundFriends_Info;
	permanent = FALSE;
	description = "� ����� ����� ������.";
};


func int DIA_Addon_Bill_FoundFriends_Condition()
{
	if(!Npc_HasItems(Angus,ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_FoundFriends_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_00");	//� ����� ����� ������.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_01");	//�? ��� ���?
	AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_02");	//��� ������.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_03");	//(� ����������) ��������� �������! ��� ����� ��!
	if(SC_Knows_JuanMurderedAngus == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_06");	//��������.
	};
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_04");	//������� ������! �� ������ ������ � ���.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_05");	//���� �� � ������ ���� ��� ��� ��������, ��� ��� ������...
	MIS_Addon_Bill_SearchAngusMurder = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_KillJuan,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KillJuan,LOG_Running);
	B_LogEntry(TOPIC_Addon_KillJuan,"���� ��� ��������, ����� � ������ ��� � ������ ������ � �����. �� ����� ����� ����� �� �����.");
	if(Npc_KnowsInfo(other,DIA_Addon_Fisk_Lieferung))
	{
		if(SC_Knows_JuanMurderedAngus == TRUE)
		{
			Log_AddEntry(TOPIC_Addon_KillJuan,"���� �������, ��� ������ �� ����� ���� ����� ��� �������, ������ ������ ������� � ��������. �� �������� ���-�� �� ������.");
		}
		else
		{
			Log_AddEntry(TOPIC_Addon_KillJuan,"���� �������, ��� ������ �� ����� ���� ����� ��� �������, ������ ������ ������� � ��������. �� �������� ���-�� �� ������. ��������, �� ��������� � �������� ������ � �����.");
		};
	};
	if(SC_Knows_JuanMurderedAngus == TRUE)
	{
		Log_AddEntry(TOPIC_Addon_KillJuan,"������ ��� �������� � ������� � ������, ����� �� ��� ����� ����.");
	};
};


instance DIA_Addon_Bill_JuanMurder(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 13;
	condition = DIA_Addon_Bill_JuanMurder_Condition;
	information = DIA_Addon_Bill_JuanMurder_Info;
	description = "� ����, ��� ���� ����� � ������.";
};


func int DIA_Addon_Bill_JuanMurder_Condition()
{
	if((MIS_Addon_Bill_SearchAngusMurder == LOG_Running) && (SC_Knows_JuanMurderedAngus == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_JuanMurder_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_JuanMurder_15_00");	//� ����, ��� ���� ����� � ������.
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_01");	//���? ��� ��� ������?
	AI_Output(other,self,"DIA_Addon_Bill_JuanMurder_15_02");	//���� �� ��������. ��� ����� ����.
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_03");	//�� ������ ��������� ����� ����, �� ������� ����?
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_04");	//��� �� ������ ����� ��� � ���.
	B_LogEntry(TOPIC_Addon_KillJuan,"� ������ ��������� �� ������ � ����� � ����� �����.");
};


instance DIA_Addon_Bill_KilledEsteban(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 14;
	condition = DIA_Addon_Bill_KilledEsteban_Condition;
	information = DIA_Addon_Bill_KilledEsteban_Info;
	description = "���� ����.";
};


func int DIA_Addon_Bill_KilledEsteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bill_JuanMurder) && Npc_IsDead(Juan))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_KilledEsteban_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_KilledEsteban_15_00");	//���� ����.
	AI_Output(self,other,"DIA_Addon_Bill_KilledEsteban_03_01");	//�� �������?
	AI_Output(other,self,"DIA_Addon_Bill_KilledEsteban_15_02");	//���������, �����!
	AI_Output(self,other,"DIA_Addon_Bill_KilledEsteban_03_03");	//(��������) �� �����. �� ������� ����, ��� ������ ������.
	B_LogEntry(TOPIC_Addon_KillJuan,"���� �����. ���� ����� ���.");
	MIS_Addon_Bill_SearchAngusMurder = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Bill_KillAngusMurder);
};


instance DIA_Addon_Bill_Khorinis(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 21;
	condition = DIA_Addon_Bill_Khorinis_Condition;
	information = DIA_Addon_Bill_Khorinis_Info;
	description = "�� �� ��������?";
};


func int DIA_Addon_Bill_Khorinis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bill_Planks))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_Khorinis_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Khorinis_15_00");	//�� �� ��������?
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_01");	//��. � ����������� �� ����� ���������� ������� � ��������������.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_02");	//�� ����� � ���� ��������� �������� �������, ���� ������ ����������� ��� ���� � ����.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_03");	//� ����� ������ ��� ������� ������ �� ��������� ��-�� ���� ����� �����.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_04");	//������� � ������������� � �����. � ��� ������ � ������� �����.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_05");	//(��������) ����� ���� ����, ����� ��������� ������ �� ������ ��������.
	};
};


instance DIA_Addon_Bill_TeachPlayer(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 22;
	condition = DIA_Addon_Bill_TeachPlayer_Condition;
	information = DIA_Addon_Bill_TeachPlayer_Info;
	description = "�� ������ ���� ����-������ �������?";
};


func int DIA_Addon_Bill_TeachPlayer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bill_Khorinis))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_TeachPlayer_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_TeachPlayer_15_00");	//�� ������ ���� ����-������ �������?
	AI_Output(self,other,"DIA_Addon_Bill_TeachPlayer_03_01");	//��, � �� ��� �������� ����, ��� ������������ �������� ����� ��������.
	AI_Output(self,other,"DIA_Addon_Bill_TeachPlayer_03_02");	//�� �� ������ ���� ���������� ������, ����� ������ �� ���������.
	if(!Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET))
	{
		Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Teacher,"���� ����� ������� ���� ��������� ������.");
	};
	Bill_Addon_TeachPickPocket = TRUE;
};


instance DIA_Addon_Bill_LearnTalent(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 23;
	condition = DIA_Addon_Bill_LearnTalent_Condition;
	information = DIA_Addon_Bill_LearnTalent_Info;
	permanent = TRUE;
//	description = B_BuildLearnString("����� ���� ��������� ������",B_GetLearnCostTalent(other,NPC_TALENT_PICKPOCKET,1));
	description = B_BuildLearnString(NAME_Skill_PickPocket,B_GetLearnCostTalent(other,NPC_TALENT_PICKPOCKET,1));
};


func int DIA_Addon_Bill_LearnTalent_Condition()
{
	if((Bill_Addon_TeachPickPocket == TRUE) && !Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_LearnTalent_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_LearnTalent_15_00");	//����� ���� ��������� ������.
	if(VisibleAttributeValue(ATR_DEXTERITY) >= 40)
	{
		if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKPOCKET))
		{
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_01");	//������ �����, �� ������ ��������� ������ ������������� ���� � ������������.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_02");	//�, ��������, �������� � �������� � ������� ������. ����������� ����������.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_03");	//����� ������� ��������, ���������� ������, �� �������, ��� ������ ������ �� ��������.
			AI_Output(other,self,"DIA_Addon_Bill_LearnTalent_15_05");	//���-������ ���?
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_06");	//��������� ����������� ��������. ��� ������ �� ������, ��� ������ �� ������ ��������.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_07");	//� ��� ���� � ���� ����� ���������� ��������� �������� � ����� ����!
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_08");	//��� ���. �� ������� ����, � ����� ������.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_09");	//������ �� ����! �� ������������ ��������!
		AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_10");	//�� ������ ���� ����� ����� ������, ���� ����� ������� �������.
	};
};

