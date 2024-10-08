
instance DIA_Addon_Logan_EXIT(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 999;
	condition = DIA_Addon_Logan_EXIT_Condition;
	information = DIA_Addon_Logan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende_v4;
};


func int DIA_Addon_Logan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Logan_EXIT_Info()
{
	DIA_Common_IllBeBackLater();
	if((MIS_HlpLogan == LOG_Running) && (Logan_Inside == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Logan_EXIT_10_01");	//(��������) ��-�, ������ ��������. � � �������� ����� � ��������� �������, ��� �������� ������� ������.
	}
	else
	{
		AI_WaitTillEnd(self,other);
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_1072_Logan_Mine(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_Mine_Condition;
	information = DIA_Addon_Logan_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Logan_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && Npc_HasItems(other,ItMi_Addon_Stone_01) && (Logan_Inside == TRUE))
	{
		if(Npc_GetDistToWP(self,"BL_INN_05_D") <= 1200)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Logan_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_1072_Logan_Mine_10_00");	//��� ������, �� ��� ������, ��... �����, ������, ��� �� �� ����� ��� ����.
	Player_SentBuddler += 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Logan_How2(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_How2_Condition;
	information = DIA_Addon_Logan_How2_Info;
	permanent = FALSE;
	description = "��� � ���� ����?";
};


func int DIA_Addon_Logan_How2_Condition()
{
	if(Logan_Inside == TRUE)
	{
		if(Npc_GetDistToWP(self,"BL_INN_05_D") <= 1200)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Logan_How2_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_How2_15_00");	//��� � ���� ����?
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_01");	//��, �� ������� ���� � ������ ������. ����� ����� �����-�� ������ �����.
	if(!Npc_IsDead(Esteban))
	{
		AI_Output(self,other,"DIA_Addon_Logan_How2_10_02");	//�� ������� �� ������� ���� � �����. �� ����� �� �����. �� ��� ��� ������ ������.
		AI_Output(other,self,"DIA_Addon_Logan_How2_15_03");	//�? ��� �� ����� �� ����?
		AI_Output(self,other,"DIA_Addon_Logan_How2_10_04");	//�� ��� ����� ����������. � �� �����, ����� � �������, ��� �� ���� �����.
		AI_Output(self,other,"DIA_Addon_Logan_How2_10_05");	//(����) ������� �������, ��� � ���� ������� ����. ��� ����� ������� �� ���...
		LoganToldAboutEsteban = TRUE;
	};
};


instance DIA_Addon_Logan_Attentat(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 9;
	condition = DIA_Addon_Logan_Attentat_Condition;
	information = DIA_Addon_Logan_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Logan_Attentat_Condition()
{
	if((MIS_Judas == LOG_Running) && (LoganToldAboutEsteban == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_00");	//�� ����� ����, ��� �� ���� �����, ��?
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_01");	//�� � ������ ��� ��� �� ����. ������ ��� �����? ����� � ��� ��� �� ������...
};


instance DIA_Addon_Logan_HI(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_HI_Condition;
	information = DIA_Addon_Logan_HI_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Logan_HI_Condition()
{
	if((Logan_Inside == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_HI_Info()
{
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_00");	//������-��, ����� ����.
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_01");	//�� ������ ������ �������� ����� ���, ����� ����, ���-���� ��������?
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_HI))
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_02");	//���� ������ ������. �� �������, ��� ���� ����� ������������ ������. ��� ���?
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_03");	//��, ��� ������� �� ����, � ��� ���� ����� ������.
	};
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_04");	//�������� ����� �������� ����������� �� ��� ������� ������. ����� ����� ���������� ��������� �� ���.
	Log_CreateTopic(Topic_Addon_Logan,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Logan,LOG_Running);
	B_LogEntry(Topic_Addon_Logan,"����� �����, ����� � ���������� � ��� �� ����� �� �������� ����.");
};


instance DIA_Addon_Logan_Why(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_Why_Condition;
	information = DIA_Addon_Logan_Why_Info;
	permanent = FALSE;
	description = "��� � ������ �� ������?";
};


func int DIA_Addon_Logan_Why_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_HI) && (Logan_Inside == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Why_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Why_15_00");	//��� � ������ �� ������?
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_01");	//(�����) ������ ������ ���� �����, ���� �� ����� �� ��������.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_02");	//���� �� ������ ������� � ������, ���� �������� �������� ������. �� ����� ������ �� ������ �� ������.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_03");	//� ����� ����, � ���� �������� ����, ��� ����������� ���� ������.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_04");	//�� � �� �����, ��� ������ ������ ���� � ������ ������ �� ��, ��� �� ����� ������� ����������� � ��������� �������.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_05");	//����� ���� ����, ������� ��� ������ ����� ���� ����������� ������� ������.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_06");	//� ���������, ��� ���� �������, ���� �... (�����)... ����� �� ��� ���� ���...
	Log_CreateTopic(Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher,"����� ����� ������� ���� ������� ���� � �������� � �������� ���� � �����.");
};


instance DIA_Addon_Logan_Lager(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 3;
	condition = DIA_Addon_Logan_Lager_Condition;
	information = DIA_Addon_Logan_Lager_Info;
	permanent = FALSE;
	description = "� ��� � ������?";
};


func int DIA_Addon_Logan_Lager_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_Why) && (Logan_Inside == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Lager_15_00");	//� ��� � ������?
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_01");	//(��������) ������ � ���, ���� ��� � ������. ��� ��� �������� ����, ��� ��� �������� �����... ������ ��� ������.
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_02");	//���� ��� ���� � �������, � ������. � ��������� � ����, ��� ���� ���� �������. �����?
};


instance DIA_Addon_Logan_MIS(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 99;
	condition = DIA_Addon_Logan_MIS_Condition;
	information = DIA_Addon_Logan_MIS_Info;
	permanent = FALSE;
	description = "����� ���������� � ��������� �������.";
};


func int DIA_Addon_Logan_MIS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_HI))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_MIS_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_00");	//����� ���������� � ��������� �������.
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_01");	//(��������) ��, �������, �����, ��� ����� ����� ���� �����. ������� �������. ���... �������? ��-�, � �� �����.
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_02");	//�������, � ��� ��� ������ ������?
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_03");	//��� ������������. ��� ����� �������� �����������. ��-��, �� ���������, ��� ���� �����... ������.
	Snd_Play("SWA_Warn");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"JAGD");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_HlpLogan = LOG_Running;
	Wld_InsertNpc(MIS_Addon_Swampshark_01,"ADW_SWAMPSHARK_01");
	Wld_InsertNpc(MIS_Addon_Swampshark_02,"ADW_SWAMPSHARK_02");
	Wld_InsertNpc(MIS_Addon_Swampshark_03,"ADW_BANDIT_VP3_06");
};


var int Logan_Teach_NoPerm;

instance DIA_Addon_Logan_tot(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_tot_Condition;
	information = DIA_Addon_Logan_tot_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Logan_tot_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_MIS))
	{
		if(Npc_IsDead(MIS_Addon_Swampshark_01) && Npc_IsDead(MIS_Addon_Swampshark_02) && Npc_IsDead(MIS_Addon_Swampshark_03))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Logan_tot_Info()
{
	AI_Output(self,other,"DIA_Addon_Logan_tot_10_00");	//������� ����� - ������ �����. ��� ����� ��������������� �� ���������!
	AI_Output(other,self,"DIA_Addon_Logan_tot_15_01");	//�������, ��� ����� ������� ��� ���-������? ���� ���, � �����...
	if(Logan_Teach_NoPerm == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Logan_tot_10_02");	//���. � ���� �� �������� ��������� ����-������ ���, �� ������, ��� ���� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Logan_tot_10_02_add");	//���...
	};
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_HlpLogan = LOG_SUCCESS;
	B_CheckLog();
	B_LogEntry(Topic_Addon_Franco,"� ����� ������. ���������, ��� ������ �� ��� ������.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Logan_Lern(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 100;
	condition = DIA_Addon_Logan_Lern_Condition;
	information = DIA_Addon_Logan_Lern_Info;
	permanent = FALSE;
	description = "������ ���, ��� ����������� ���� ��������...";
};


func int DIA_Addon_Logan_Lern_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_Why))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Lern_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Lern_15_00");	//������ ���, ��� ����������� ���� ��������...
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_01");	//���� �� ������ ��������� ����������� �������� ���, ����� � ������. �� ��� ��� ����� ��������� ���.
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_02");	//� ���� ���� ���������� �������� ����� � �����, � ���� ������� ���� ������� ����� � �������� ����.
	if(!Npc_KnowsInfo(other,DIA_Addon_Edgor_Teach))
	{
		Log_CreateTopic(Topic_Addon_BDT_Teacher,LOG_NOTE);
		B_LogEntry(Topic_Addon_BDT_Teacher,Log_Text_Addon_EdgorTeach);
	};
};


instance DIA_Addon_Logan_Allg(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 3;
	condition = DIA_Addon_Logan_Allg_Condition;
	information = DIA_Addon_Logan_Allg_Info;
	permanent = TRUE;
	description = "����� ����.";
};


func int DIA_Addon_Logan_Allg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_Lern) && (Logan_Teach_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Allg_Info()
{
	DIA_Common_TeachMe();
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Logan_Allg);
		Info_AddChoice(DIA_Addon_Logan_Allg,Dialog_Back,DIA_Addon_Logan_Allg_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Logan_Allg,B_BuildLearnString(NAME_TROPHY_Teeth,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Addon_Logan_Allg_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Logan_Allg,B_BuildLearnString(NAME_TROPHY_Claws,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Addon_Logan_Allg_Claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Logan_Allg,B_BuildLearnString(NAME_TROPHY_ReptileSkin,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALFUR,TROPHY_ReptileSkin)),DIA_Addon_Logan_Allg_Fur);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		Logan_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Logan_Allg_BACK()
{
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == TRUE))
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		Logan_Teach_NoPerm = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Logan_Allg);
};

func void DIA_Addon_Logan_Allg_Teeth()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth);
};

func void DIA_Addon_Logan_Allg_Claws()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws);
};

func void DIA_Addon_Logan_Allg_Fur()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ReptileSkin);
};


var int Logan_Lohn;

instance DIA_Addon_Logan_Hacker(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 9;
	condition = DIA_Addon_Logan_Hacker_Condition;
	information = DIA_Addon_Logan_Hacker_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Addon_Logan_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_08") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Hacker_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Logan_Hacker_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_01");	//��, ������� ����, � ������ ���! � � �����!
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_02");	//� ���� �� ����� ���� ��� ��, ��� �������� ������, �� ��� ������.
	if(Logan_Lohn == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_03");	//� ������ ����� ������� ����. ���� �� ����� ������ � ������ ��� ������!
		B_Upgrade_Hero_HackChance(10);
		Logan_Lohn = TRUE;
	};
};

