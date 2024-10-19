
instance DIA_Thorben_EXIT(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 999;
	condition = DIA_Thorben_EXIT_Condition;
	information = DIA_Thorben_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Thorben_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Thorben_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Thorben_angepisst(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = DIA_Thorben_angepisst_Condition;
	information = DIA_Thorben_angepisst_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Thorben_angepisst_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		if(Npc_IsDead(Gritta))
		{
			return TRUE;
		};
	};
};

func void DIA_Thorben_angepisst_Info()
{
	AI_Output(self,other,"DIA_Thorben_angepisst_06_00");	//�� ���� ��� ������. � ������� �� ����� ����. ����� � ���� ����, ������!
	AI_StopProcessInfos(self);
};


instance DIA_Thorben_Hallo(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Hallo_Condition;
	information = DIA_Thorben_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Thorben_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (other.guild == GIL_NONE))
	{
		if(!Npc_IsDead(Gritta))
		{
			return TRUE;
		};
	};
};

func void DIA_Thorben_Hallo_Info()
{
	AI_Output(self,other,"DIA_Thorben_Hallo_06_00");	//��! ����� ����. �� ���� �� �� ��������, ��?
	AI_Output(self,other,"DIA_Thorben_Hallo_06_01");	//������ �� ������ ����� ��� �����������. ������� �������, ������ ���, � ������ ��� � ������� ��������.
	AI_Output(self,other,"DIA_Thorben_Hallo_06_02");	//����� ������ ���� ���� �������?
};


instance DIA_Thorben_Arbeit(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Arbeit_Condition;
	information = DIA_Thorben_Arbeit_Info;
	permanent = FALSE;
	description = "� ��� ������.";
};


func int DIA_Thorben_Arbeit_Condition()
{
	return TRUE;
};

func void DIA_Thorben_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_00");	//� ��� ������.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_01");	//�� ���-������ ������ � ���������� ����?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_02");	//������������, ��� � ���� �������� �� ������ - ��� �����.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_03");	//� ��� ������ ������?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_04");	//�����...
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_05");	//������, �� � �� ���� ����� ����, ���� �� ������ �� ��������� � ���� �������.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_06");	//� � ���� ��� �����, ����� ������� �������.
	if(Player_IsApprentice == APP_NONE)
	{
		Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
		B_LogEntry(TOPIC_Lehrling,"������ �� ������ ���� � �������.");
	};
};


instance DIA_Thorben_OtherMasters(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_OtherMasters_Condition;
	information = DIA_Thorben_OtherMasters_Info;
	permanent = FALSE;
	description = "� ���, ���� � �������� � ������� � ������ �� ������ ������� ��������?";
};


func int DIA_Thorben_OtherMasters_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Arbeit) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_OtherMasters_Info()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_15_00");	//� ���, ���� � �������� � ������� � ������ �� ������ ������� ��������?
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_01");	//������, � ��� ���� ���������.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_02");	//�� ���� ����� ������� �������� ������������� �����.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_03");	//�����, �� �������� �������?
	Info_ClearChoices(DIA_Thorben_OtherMasters);
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		Info_AddChoice(DIA_Thorben_OtherMasters,"��, ���� �� ��� ������ � ����, � ��������� ������...",DIA_Thorben_OtherMasters_Naja);
	};
	Info_AddChoice(DIA_Thorben_OtherMasters,"��. � ���������� ��������, ������ ������.",DIA_Thorben_OtherMasters_Devoutly);
};

func void B_Thorben_GetBlessings()
{
	AI_Output(self,other,"B_Thorben_GetBlessings_06_00");	//����� ��� � �������, ����� �������, ����� �� ���� ���� �������������.
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		AI_Output(self,other,"B_Thorben_GetBlessings_06_01");	//�� ����� ��������� ����, ��� ����� ����� ������. �� ������ �������� � ��� �������������.
	};
	AI_Output(self,other,"B_Thorben_GetBlessings_06_02");	//� ����� �� �������� ������������� �����, � ���������� �� ����.
	MIS_Thorben_GetBlessings = LOG_Running;
	Log_CreateTopic(TOPIC_Thorben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Thorben,LOG_Running);
	B_LogEntry(TOPIC_Thorben,"������ ���� ��� ���� ���������, ���� ����� ������� � ������ ����� ��� ���� �������������.");
};

func void DIA_Thorben_OtherMasters_Devoutly()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Devoutly_15_00");	//��. � ���������� ��������, ������ ������.
	B_Thorben_GetBlessings();
	Info_ClearChoices(DIA_Thorben_OtherMasters);
};

func void DIA_Thorben_OtherMasters_Naja()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Naja_15_00");	//��, ���� �� ��� ������ � ����, � ��������� ������...
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_01");	//�������!
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_02");	//�������, ������� ���������� �������� ��� ������������� �����, ������� �� ������� ����� ���������.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_03");	//����� ����� � �������� ����� �����������.
	B_Thorben_GetBlessings();
	Info_ClearChoices(DIA_Thorben_OtherMasters);
};


instance DIA_Thorben_ZUSTIMMUNG(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = DIA_Thorben_ZUSTIMMUNG_Condition;
	information = DIA_Thorben_ZUSTIMMUNG_Info;
	permanent = TRUE;
	description = "��� ������ ���������, ������?";
};


func int DIA_Thorben_ZUSTIMMUNG_Condition()
{
	if((Player_IsApprentice == APP_NONE) && (MIS_Thorben_GetBlessings == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Thorben_ZUSTIMMUNG_Info()
{
	AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_00");	//��� ������ ���������, ������?
	AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_01");	//������ ��� ���� �������������?
	if(Vatras_Blessing == TRUE)
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_02");	//��.
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_03");	//� ������������� ����� ������ �� �������?
		if(C_GotAnyInnosBlessing() || (other.guild == GIL_KDF))
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_04");	//��, �������.
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_05");	//����� �� �������� � ��� �������������. �� �����, ������ ���� �� ����� ���������, ������� ����� ��������, ��� �������!
			MIS_Thorben_GetBlessings = LOG_SUCCESS;
			B_GivePlayerXP(XP_Zustimmung);
			Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
			B_LogEntry(TOPIC_Lehrling,"������ ���� ��� ���� ���������, ���� � ������ ����� ��������.");
		}
		else
		{
			DIA_Common_NoNotYet();
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_07");	//�� ������ ��� �������. �� ������ ���������� �������� ������ � ������������� �����.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_08");	//��� ���...
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_09");	//����� � �� �������, ����� �� ����� ������ �� ���. �� ������ ��� �������.
	};
};


instance DIA_Thorben_Locksmith(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Locksmith_Condition;
	information = DIA_Thorben_Locksmith_Info;
	permanent = FALSE;
	description = "��� �� ������������ � ������?";
};


func int DIA_Thorben_Locksmith_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Locksmith_Info()
{
	AI_Output(other,self,"DIA_Thorben_Locksmith_15_00");	//��� �� ������������ � ������?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_01");	//����� ����� � ������� ������� ��� �������� �����?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_02");	//� ����� ���� ����������� �����. ���, �� ������� ����, � ���� ���� ������, ��� �� ����� �������, ������� �� �� ���� �� ��������.
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_03");	//����� ��������� ����� ����� �������. � � �������� ����� ����� �����. �������� � ��������� �����!
};


instance DIA_Thorben_Schuldenbuch(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Schuldenbuch_Condition;
	information = DIA_Thorben_Schuldenbuch_Info;
	permanent = FALSE;
	description = "� ���� ���� �������� ������...";
};


func int DIA_Thorben_Schuldenbuch_Condition()
{
	if(Npc_HasItems(other,ItWr_Schuldenbuch) && ((SchuldBuchNamesKnown == TRUE) || Npc_KnowsInfo(other,DIA_Thorben_Gritta)))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Schuldenbuch_Info()
{
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_00");	//� ���� ���� �������� ������...
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_01");	//(�������������) ��� �� ���� ���?
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_02");	//���� ������ ������������ �� ��� � ���� ���, � ��, ��� � ��� �������� ���� ���.
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_03");	//��� ��� ����!
//	B_GiveInvItems(other,self,ItWr_Schuldenbuch,1);
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_04");	//� ��� �� ����� ���� �� ����?
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_05");	//� ���� ��� �����. �� �� ������ ������������ �� ��� ��������� �������������.
//	B_GivePlayerXP(XP_Schuldenbuch);
};


instance DIA_Thorben_GiveBook(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_GiveBook_Condition;
	information = DIA_Thorben_GiveBook_Info;
	permanent = FALSE;
	description = "��� ���� �����.";
};


func int DIA_Thorben_GiveBook_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Schuldenbuch) && Npc_HasItems(other,ItWr_Schuldenbuch))
	{
		return TRUE;
	};
};

func void DIA_Thorben_GiveBook_Info()
{
	DIA_Common_HereIsYourBook();
	if(ClassicLehmarBook == FALSE)
	{
		AI_PrintScreen("�������� ����� ������",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		Npc_RemoveInvItem(other,ItWr_Schuldenbuch);
	}
	else
	{
		B_GiveInvItems(other,self,ItWr_Schuldenbuch,1);
	};
	if(Thorben_TeachPlayer == TRUE)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_01");	//���� �� �� ��, � �� ������ ������ �� ����� ����� ����.
	}
	else
	{
		B_Say(self,other,"$ABS_GOOD");
	};
	B_GivePlayerXP(XP_Schuldenbuch);
};

instance DIA_Thorben_PleaseTeach(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_PleaseTeach_Condition;
	information = DIA_Thorben_PleaseTeach_Info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ��������� ����� ���������?";
};


func int DIA_Thorben_PleaseTeach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Locksmith) && (Thorben_TeachPlayer == FALSE) && !Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK))
	{
		return TRUE;
	};
};

func void DIA_Thorben_PleaseTeach_Info()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_00");	//�� ������ ������� ���� ��������� ����� ���������?
	if(Npc_KnowsInfo(other,DIA_Thorben_GiveBook) || Npc_KnowsInfo(other,DIA_Addon_Thorben_ElvrichIsBack))
	{
		if(Npc_KnowsInfo(other,DIA_Thorben_GiveBook))
		{
			AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_01");	//���� �� �� ��, � �� ������ ������ �� ����� ����� ����.
		};
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_02");	//� ����� ���� ����, ��� �� ������ �����.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"������ ����� ������� ���� ������������ ���������.");
		Thorben_TeachPlayer = TRUE;
	}
	else if(Thorben_GotGold == TRUE)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_03");	//�� ������ ��� 100 ������� �����. ��� ������� ���� � ����� �������.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_04");	//��� ����� ������, �� � �������� ��������� � ���� ���.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_05");	//���� � �� ����� ���� ������ � ��������� �����, �� �������� �� ���� ����� �����������.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_06");	//��� ��� ��� 100 �������, � � ����� ����.
		Info_ClearChoices(DIA_Thorben_PleaseTeach);
		Info_AddChoice(DIA_Thorben_PleaseTeach,"����� ����, �����...",DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice(DIA_Thorben_PleaseTeach,"�������. ��� 100 �������.",DIA_Thorben_PleaseTeach_Pay100);
	}
	else if((MIS_Matteo_Gold == LOG_SUCCESS) && ((Gritta_GoldGiven == TRUE) || ((Gritta_WantPay == TRUE) && (Npc_HasItems(Gritta,ItMi_Gold) >= 80))) && (Gritta.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_07");	//�� �������� ���� ������ ������. ������, �� ������� �������. � ����� ���� ����, ��� �� ������ �����.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_08");	//������ � �� ���� ������� ��� ���������.
		AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_09");	//������� �� ��������?
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_10");	//200 ������� �����.
		Info_ClearChoices(DIA_Thorben_PleaseTeach);
		Info_AddChoice(DIA_Thorben_PleaseTeach,"����� ����, �����...",DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice(DIA_Thorben_PleaseTeach,"�������. ��� 200 �������.",DIA_Thorben_PleaseTeach_Pay200);
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_11");	//���... � �� ����, ����� �� ���� ��������.
		if((other.guild != GIL_KDF) && (other.guild != GIL_MIL) && (other.guild != GIL_PAL))
		{
			AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_12");	//�����, �� ������ ��������� ����� �� ���� ������������, ������� �������� � �����, ������ ����� �������� ������� ������� �����.
		};
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_13");	//� ������ �� ���� ����� ����, ���� �� ���� ������, ��� �� ������� �������.
	};
};

func void DIA_Thorben_PleaseTeach_Pay200()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Pay200_15_00");	//�������. ��� 200 �������.
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay200_06_01");	//��� ������ ����� ������� ���. �� ���������, ��� ������ �� ������ �����.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"������ ����� ������� ���� ������������ ���������.");
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay200_06_02");	//� ���� ��� 200 �����. � ��� ����� ��� �����.
	};
	Info_ClearChoices(DIA_Thorben_PleaseTeach);
};

func void DIA_Thorben_PleaseTeach_Pay100()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Pay100_15_00");	//�������. ��� 100 �������.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay100_06_01");	//� ����� ������, �� ����� ������, ����� �� ������ �����.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"������ ����� ������� ���� ������������ ���������.");
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay100_06_02");	//��, � ���� �� ��� 100 �����.
	};
	Info_ClearChoices(DIA_Thorben_PleaseTeach);
};

func void DIA_Thorben_PleaseTeach_Later()
{
	DIA_Common_MaybeLater();
	Info_ClearChoices(DIA_Thorben_PleaseTeach);
};


instance DIA_Thorben_Teach(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Teach_Condition;
	information = DIA_Thorben_Teach_Info;
	permanent = TRUE;
	description = B_BuildLearnString(NAME_Skill_PickLock,B_GetLearnCostTalent(other,NPC_TALENT_PICKLOCK,1));
};


func int DIA_Thorben_Teach_Condition()
{
	if((Thorben_TeachPlayer == TRUE) && !Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Teach_Info()
{
	AI_Output(other,self,"DIA_Thorben_Teach_15_00");	//����� ���� ��������� �����!
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Thorben_Teach_06_01");	//���, ��� ���� ����� - ��� �������. ���� �� ������ ��������� ������������ �� ����� � ������ � �����, �� ������� ������� ���.
		AI_Output(self,other,"DIA_Thorben_Teach_06_02");	//�� ���� �� ������ ������� ������� ������� ������ ��� ������� ������ � ������������ �����������, ��� ���������.
		AI_Output(self,other,"DIA_Thorben_Teach_06_03");	//��� ����� ������� �� ������ �����������, ��� ������ ������� ���� �����������. ���, �������, � ���, ��� ���� ����� �����.
	};
};


var int Thorben_TradeLog;

instance DIA_Thorben_TRADE(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 3;
	condition = DIA_Thorben_TRADE_Condition;
	information = DIA_Thorben_TRADE_Info;
	permanent = TRUE;
	description = "�� ������ ������� ��� �������?";
	trade = TRUE;
};


func int DIA_Thorben_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Locksmith))
	{
		return TRUE;
	};
};

func void DIA_Thorben_TRADE_Info()
{
	AI_Output(other,self,"DIA_Thorben_TRADE_15_00");	//�� ������ ������� ��� �������?
	B_GiveTradeInv(self);
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_01");	//���� ��� ��������...
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_02");	//������. �� ��� ����� �� ������� ����, ���� �� �� ��������� ������������ ���.
	};
	if(!Npc_HasItems(self,ItKe_Lockpick) && (Kapitel > Dietrichgeben))
	{
		CreateInvItems(self,ItKe_Lockpick,5);
		Dietrichgeben += 1;
	};
	if(Thorben_TradeLog == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"������� ������ ������� �������.");
		Thorben_TradeLog = TRUE;
	};
	Trade_IsActive = TRUE;
};


instance DIA_Addon_Thorben_MissingPeople(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 4;
	condition = DIA_Addon_Thorben_MissingPeople_Condition;
	information = DIA_Addon_Thorben_MissingPeople_Info;
	description = "� ���� ������ ��� ������?";
};


func int DIA_Addon_Thorben_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Arbeit) && (SC_HearedAboutMissingPeople == TRUE) && (Elvrich_GoesBack2Thorben == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_15_00");	//� ���� ������ ��� ������?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_01");	//��, � ������ �������.
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_15_02");	//� ��� ���������?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_03");	//��� ��� ������. �� ��� ���������.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_04");	//� ��� �� ����� �������, �� ������� �� ������ ���� � �� ������ �� ������.
	MIS_Thorben_BringElvrichBack = LOG_Running;
	if(MissingPeopleReturnedHome == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	};
	B_LogEntry(TOPIC_Addon_MissingPeople,"������, ������ �������� �������, ������.");
	Info_ClearChoices(DIA_Addon_Thorben_MissingPeople);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople,Dialog_Back,DIA_Addon_Thorben_MissingPeople_Back);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople,"�� �� ��������� � ���������?",DIA_Addon_Thorben_MissingPeople_Mil);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople,"��� ����� ��� �� ����?",DIA_Addon_Thorben_MissingPeople_wann);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople,"� ��� �� ������ ������?",DIA_Addon_Thorben_MissingPeople_where);
};

func void DIA_Addon_Thorben_MissingPeople_Back()
{
	Info_ClearChoices(DIA_Addon_Thorben_MissingPeople);
};

func void DIA_Addon_Thorben_MissingPeople_wann()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_wann_15_00");	//��� ����� ��� �� ����?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_wann_06_01");	//����� ���� ������.
};

func void DIA_Addon_Thorben_MissingPeople_where()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_where_15_00");	//� ��� �� ������ ������?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_where_06_01");	//������ ��� �����? � ��������� ����� �� ��������� ��������� � ����� �������� ������� � �����.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_where_06_02");	//�� ��������, ���� �� � ������ ������������ � ������� � �����-������ ������.
};

func void DIA_Addon_Thorben_MissingPeople_Mil()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_Mil_15_00");	//�� �� ��������� � ���������?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_Mil_06_01");	//���������, �������. � �������� �� ������� ����� ������ � ����������, ����� �� �������� �� ������. �� � ��� �� ���� �����.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_Mil_06_02");	//����� ������ ���, ��� �����. ���� ��� ������ �� ������, ��� ��� ��������� ������ � �������� ������ ������.
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_Mil_15_03");	//(�������) �������?
};


instance DIA_Addon_Thorben_ElvrichIsBack(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = DIA_Addon_Thorben_ElvrichIsBack_Condition;
	information = DIA_Addon_Thorben_ElvrichIsBack_Info;
	description = "������ ����� ����� �� ���� ��������.";
};


func int DIA_Addon_Thorben_ElvrichIsBack_Condition()
{
	if(Elvrich_GoesBack2Thorben == TRUE)
	{
		if(!Npc_IsDead(Elvrich))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Thorben_ElvrichIsBack_Info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichIsBack_15_00");	//������ ����� ����� �� ���� ��������.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_01");	//����� ���������, ��� �� ������ �� ����� �������, ��� ������ ��������� ����� �������� �������� ����� ��� �����.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_02");	//������ ��� ������ � �������� ������� �� ����������� �������.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	MIS_Thorben_BringElvrichBack = LOG_SUCCESS;
	Elvrich.flags = 0;
	Elvrich.aivar[AIV_ToughGuy] = FALSE;
};


instance DIA_Thorben_Paladine(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 4;
	condition = DIA_Thorben_Paladine_Condition;
	information = DIA_Thorben_Paladine_Info;
	permanent = FALSE;
	description = "��� �� ������ � ���������?";
};


func int DIA_Thorben_Paladine_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Thorben_Paladine_Info()
{
	AI_Output(other,self,"DIA_Thorben_Paladine_15_00");	//��� �� ������ � ���������?
	AI_Output(self,other,"DIA_Thorben_Paladine_06_01");	//��������. ��� ������� �� ������� � �������� ��� ������ �����.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_02");	//� ��� ��� ��� ��������� � ������� �������� ������.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_03");	//����� ������ �� �����, ����� ��� �������.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_04");	//������ ��������� ��������� �����.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_05");	//� � �����, ��� ��� �����, ����� �������� ��������� ��������.
};


instance DIA_Thorben_Bauernaufstand(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 4;
	condition = DIA_Thorben_Bauernaufstand_Condition;
	information = DIA_Thorben_Bauernaufstand_Info;
	permanent = FALSE;
	description = "�� ������ ���-������ � ��������� ��������?";
};


func int DIA_Thorben_Bauernaufstand_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Paladine) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Bauernaufstand_Info()
{
	AI_Output(other,self,"DIA_Thorben_Bauernaufstand_15_00");	//�� ������ ���-������ � ��������� ��������?
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_01");	//����� �����, ��� �������� ���� ����� ���������, ����� ��������� �� ����� ��� ����������� ������.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_02");	//��, ��������, ����� �������� ���� ���� ������ ��������� � ���������.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_03");	//�� � � ������ ����� ����� ����� ����� ���� �� ��������������.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_04");	//����� ����� ��������� ������ �� ������ ������. �� �� �����, ���� ��� �������� ��� ���.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_05");	//���� �� ������ ������ ������, ����������� ��������� �� �������� �������. ��� ����� ����� ���������� �� �������, ��� �.
};


instance DIA_Thorben_Gritta(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = DIA_Thorben_Gritta_Condition;
	information = DIA_Thorben_Gritta_Info;
	permanent = FALSE;
	description = "� ������ ������...";
};


func int DIA_Thorben_Gritta_Condition()
{
	if(MIS_Matteo_Gold == LOG_Running)
	{
		if(!Npc_IsDead(Gritta))
		{
			return TRUE;
		};
	};
};

func void DIA_Thorben_Gritta_Info()
{
	AI_Output(other,self,"DIA_Thorben_Gritta_15_00");	//� ������ ������...
	AI_Output(self,other,"DIA_Thorben_Gritta_06_01");	//���� ����������? ����� ���� ���� �� ���? ��� ������ �����, ��?
	AI_Output(other,self,"DIA_Thorben_Gritta_15_02");	//��� ������ 100 ������� �������� ������.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_03");	//����� ���, ��� ��� �� ���! � ��� ���, ��� ��� ����� �� ����, �� ��� ���� ��������!
	AI_Output(self,other,"DIA_Thorben_Gritta_06_04");	//��� ��������� ����� ���� ��������� ������.
	if(!Npc_KnowsInfo(other,DIA_Thorben_GiveBook))
	{
		AI_Output(self,other,"DIA_Thorben_Gritta_06_05");	//��� �������� ������ 200 ������� � ���������� ������, ����� ������������ � �� �������! � ��� ������ �����!
	};
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output(self,other,"DIA_Thorben_Gritta_06_06");	//������ ������ ���� � ����.
	};
	AI_Output(self,other,"DIA_Thorben_Gritta_06_07");	//���, �������� � ���. �� � ����� ���� ������: � ��� ��� �� ����� ������� ������.
	if(Npc_HasItems(Gritta,ItMi_Gold) >= 100)
	{
		AI_Output(other,self,"DIA_Thorben_Gritta_15_08");	//���������...
	};
};


instance DIA_Thorben_GrittaHatteGold(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = DIA_Thorben_GrittaHatteGold_Condition;
	information = DIA_Thorben_GrittaHatteGold_Info;
	permanent = FALSE;
	description = "� ����� ���������� ���� 100 ������� �����.";
};


func int DIA_Thorben_GrittaHatteGold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Gritta))
	{
		if(!Npc_IsDead(Gritta))
		{
			if(Npc_HasItems(Gritta,ItMi_Gold) < 80)
			{
				return TRUE;
			};
		};
	};
};

func void DIA_Thorben_GrittaHatteGold_Info()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_15_00");	//� ����� ���������� ���� 100 ������� �����.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_01");	//���? �� ��� ���� - ��� ���� ��� ������! ��� ����� ��� �� ����� �������.
	if(!Npc_KnowsInfo(other,DIA_Thorben_GiveBook))
	{
		AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_02");	//����� ��� ���! � ������ ������� ��������� ������. ������ ����� ���������!
	};
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
	if(MIS_Matteo_Gold == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Thorben_GrittaHatteGold,"� ��� ����� ������ ������!",DIA_Thorben_GrittaHatteGold_MatteoHatEs);
	}
	else
	{
		Info_AddChoice(DIA_Thorben_GrittaHatteGold,"���. ������ ������� ���� ������ �����.",DIA_Thorben_GrittaHatteGold_MatteoSollHaben);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Thorben_GrittaHatteGold,"��� ���� ������.",DIA_Thorben_GrittaHatteGold_HereItIs);
	};
};

func void B_Thorben_DeletePetzCrimeGritta()
{
	if(Gritta_GoldGiven == FALSE)
	{
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_00");	//�, ��������� � ���� ��� ������, � ������, ��� ��� ������� ����� � ���������� � ������� ���� ����!
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_01");	//� ������ ������� ���� ������.
		B_DeletePetzCrime(Gritta);
	};
};

func void DIA_Thorben_GrittaHatteGold_MatteoHatEs()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00");	//� ��� ����� ������ ������!
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01");	//����! ��, �����, ���� ���� ����. �� ������� ����, �� �� �������� ��� ������. �����, ��� ����� ������������� ���� �� ���.
	B_Thorben_DeletePetzCrimeGritta();
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_MatteoSollHaben()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00");	//���. ������ ������� ���� ������ �����.
	if(!Npc_KnowsInfo(other,DIA_Thorben_GiveBook))
	{
		AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01");	//�� ������ �������� ����. ����� �� ���������� ������������, ����� ���� ������� �� ������.
	};
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02");	//��, �� ������� ����, �� ������������ � ������� ���� ����������. �����, ��� ����� ������������� ���� �� ���.
	B_Thorben_DeletePetzCrimeGritta();
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_HereItIs()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00");	//��� ���� ������.
	B_GiveInvItems(other,self,ItMi_Gold,100);
	if(!Npc_KnowsInfo(other,DIA_Thorben_GiveBook))
	{
		AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01");	//�������! ������, � ���� ���� ���� �� ����� �����, ������� � ������ ������.
	}
	else
	{
		B_Say(self,other,"$ABS_GOOD");
	};
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02");	//�� ���� ��������, ��� � ��� ������� �������� ����� ��� ������!
	B_Thorben_DeletePetzCrimeGritta();
	Thorben_GotGold = TRUE;
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
};


instance DIA_Thorben_PICKPOCKET_Book(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 700;
	condition = DIA_Thorben_PICKPOCKET_Book_Condition;
	information = DIA_Thorben_PICKPOCKET_Book_Info;
	permanent = TRUE;
	description = "(������� �������� ����� ����� �������� ������)";
};


func int DIA_Thorben_PICKPOCKET_Book_Condition()
{
	if((ClassicLehmarBook == FALSE) && (SchuldBuch_Stolen_Thorben == FALSE) && Npc_KnowsInfo(other,DIA_Thorben_GiveBook) && Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) && (other.attribute[ATR_DEXTERITY] >= 20))
	{
		return TRUE;
	};
};

func void DIA_Thorben_PICKPOCKET_Book_Info()
{
	Info_ClearChoices(DIA_Thorben_PICKPOCKET_Book);
	Info_AddChoice(DIA_Thorben_PICKPOCKET_Book,Dialog_Back,DIA_Thorben_PICKPOCKET_Book_BACK);
	Info_AddChoice(DIA_Thorben_PICKPOCKET_Book,DIALOG_PICKPOCKET,DIA_Thorben_PICKPOCKET_Book_DoIt);
};

func void DIA_Thorben_PICKPOCKET_Book_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		CreateInvItem(other,ItWr_Schuldenbuch);
		AI_PrintScreen("�������� ����� ��������",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		B_GiveThiefXP();
		B_LogEntry(TOPIC_PickPocket,ConcatStrings("������",ConcatStrings(PRINT_PickPocketSuccess,"�������� �����.")));
		SchuldBuch_Stolen_Thorben = TRUE;
	}
	else
	{
		B_ResetThiefLevel();
		B_LogEntry(TOPIC_PickPocket,ConcatStrings("������",PRINT_PickPocketFailed));
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
	Info_ClearChoices(DIA_Thorben_PICKPOCKET_Book);
};

func void DIA_Thorben_PICKPOCKET_Book_BACK()
{
	Info_ClearChoices(DIA_Thorben_PICKPOCKET_Book);
};

