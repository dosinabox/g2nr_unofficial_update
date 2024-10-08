
instance DIA_Alrik_EXIT(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 999;
	condition = DIA_Alrik_EXIT_Condition;
	information = DIA_Alrik_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alrik_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alrik_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alrik_Hallo(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Hallo_Condition;
	information = DIA_Alrik_Hallo_Info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int DIA_Alrik_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Alrik_Hallo_Info()
{
	AI_Output(other,self,"DIA_Alrik_Hallo_15_00");	//��� �� ������� �����?
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_01");	//(�������) ��� ��� ���!
	}
	else if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_02");	//� ��� ��� ��� ������ �����? � ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_03");	//� ��������� ������� �����������.
	};
	AI_Output(self,other,"DIA_Alrik_Hallo_09_04");	//�� ���� �� ������ � ����, ��� � ����� ���� - �� � ��������� ���.
};


instance DIA_Alrik_YouFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_YouFight_Condition;
	information = DIA_Alrik_YouFight_Info;
	permanent = FALSE;
	description = "�� ����������� ���?";
};


func int DIA_Alrik_YouFight_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Alrik_YouFight_Info()
{
	AI_Output(other,self,"DIA_Alrik_YouFight_15_00");	//�� ����������� ���?
	AI_Output(self,other,"DIA_Alrik_YouFight_09_01");	//������ ����, � ������� �� ������.
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_YouFight_09_02");	//� ����� �����!
	};
	AI_Output(self,other,"DIA_Alrik_YouFight_09_03");	//�� ������� � �������� �������� - ����� ��� ���!
};


instance DIA_Alrik_Regeln(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Regeln_Condition;
	information = DIA_Alrik_Regeln_Info;
	permanent = FALSE;
	description = "������ ������� ����?";
};


func int DIA_Alrik_Regeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Regeln_Info()
{
	AI_Output(other,self,"DIA_Alrik_Regeln_15_00");	//������ ������� ����?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_01");	//��� ������: ��������� ��� ������� ������. ������� �����, ��������� � ������� �����!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_02");	//�� ���������, ���� ���� �� ��� �� ������. ��� ������ ���� �� ��� �������� ������������� �� �����, ��� �������, �������?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_03");	//��� ������ - ��� ��������! �� ����, ���� �� ����� �� ���, �� � �������!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_04");	//������ - 50 �������. ���� �� ��������, �� �������� 100 �����. ���� ��� - ��, ����� ���� ������ ��������� � ����. (����������)
	AI_Output(self,other,"DIA_Alrik_Regeln_09_05");	//�����?
	AI_Output(other,self,"DIA_Alrik_Regeln_15_06");	//��!
};

func void B_Alrik_Again()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,other);
	};
	if(Alrik_ArenaKampfVerloren_Day <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Alrik_Add_09_03");	//��� ����? �� ������ ��������� �� ���� ��� ���? � �����, �� ��� ����� � ���� �����...
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_Add_09_03_add");	//�� ������ ��������� �� ���� ��� ���? � �����, � ���� �����...
	};
	B_AddFightSkill(self,NPC_TALENT_1H,20);
	self.aivar[AIV_VictoryXPGiven] = FALSE;
};


instance DIA_Alrik_NewFights3(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_NewFights3_Condition;
	information = DIA_Alrik_NewFights3_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alrik_NewFights3_Condition()
{
	if((Alrik_ArenaKampfVerloren > 0) && (Alrik_ArenaKampfVerloren <= 6))
	{
		if(Kapitel == 3)
		{
			return TRUE;
		};
		if(Kapitel == 4)
		{
			return TRUE;
		};
	};
};

func void DIA_Alrik_NewFights3_Info()
{
	B_SetAttributesToChapter(self,4);
	B_Alrik_Again();
};


instance DIA_Alrik_NewFights5(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_NewFights5_Condition;
	information = DIA_Alrik_NewFights5_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alrik_NewFights5_Condition()
{
	if((Alrik_ArenaKampfVerloren > 0) && (Alrik_ArenaKampfVerloren <= 9))
	{
		if(Kapitel >= 5)
		{
			return TRUE;
		};
	};
};

func void DIA_Alrik_NewFights5_Info()
{
	B_SetAttributesToChapter(self,6);
	B_Alrik_Again();
};


func void B_Alrik_Enough()
{
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_05");	//��� �������, �� ���������� ������� �����.
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_06");	//�� ����� ���� �������, �� ��� ����� ��� ��� ����� ����� �������� ����...
};

var int Alrik_FightsIsOver;
var int Alrik_Sword_Once;

instance DIA_Alrik_WannaFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_WannaFight_Condition;
	information = DIA_Alrik_WannaFight_Info;
	permanent = TRUE;
	description = "� ���� ��������� � �����!";
};


func int DIA_Alrik_WannaFight_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Regeln) && (self.aivar[AIV_ArenaFight] == AF_NONE) && (Alrik_FightsIsOver == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_WannaFight_Info()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_15_00");	//� ���� ��������� � �����!
	if(((Alrik_ArenaKampfVerloren > 0) && !Npc_HasItems(self,ItMw_AlriksSword_MIS)) || !Npc_HasEquippedMeleeWeapon(self))
	{
		if((MIS_Alrik_Sword == LOG_SUCCESS) || (Alrik_Sword_Once == TRUE))
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_01");	//������� ����� ��� ��� ���. � ��� ���������...
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_02");	//���, ���. ������, ��� ����� ������ ���� ��� ���, ��� ����� ��������� ������ �������!
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_03");	//��� ��������� ���� ����� �������� ������� ���� ���.
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_04");	//� ��� � ���������! ���� �� ������� ��� ���, � ����� ����� ��������� � �����!
			Log_CreateTopic(TOPIC_AlrikSchwert,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_AlrikSchwert,LOG_Running);
			if(Npc_KnowsInfo(other,DIA_Alrik_WerSchwert))
			{
				B_LogEntry(TOPIC_AlrikSchwert,"������ ������ ���� ��� �������� �����. �� ����� ��������� �� ����, ������ ���� � ����� ��� ��� ���.");
			}
			else
			{
				B_LogEntry(TOPIC_AlrikSchwert,"������ ����� ��������� �� ����, ������ ���� � ����� ��� ��� ���.");
			};
			Alrik_VomSchwertErzaehlt = TRUE;
			Alrik_Sword_Once = TRUE;
		};
	}
	else if((Kapitel <= 2) && (Alrik_ArenaKampfVerloren > 3))
	{
		AI_Output(self,other,"DIA_Alrik_Add_09_00");	//� �����, ���� ������...
		if(Wld_IsTime(11,0,19,0))
		{
			AI_Output(self,other,"DIA_Alrik_Add_09_02");	//������ �����. � ���� � ������������...
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_Add_09_01");	//��� ��� ������� �����������.
		};
	}
	else if((Kapitel >= 3) && (Kapitel <= 4) && (Alrik_ArenaKampfVerloren > 6))
	{
		B_Alrik_Enough();
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_03");	//������ ����� ��������� ����!
	}
	else if((Kapitel >= 5) && (Alrik_ArenaKampfVerloren > 9))
	{
		B_Alrik_Enough();
		AI_Output(self,other,"DIA_Alrik_Add_09_04");	//����� ����, � ������� ��������� ��� ���������� �����.
		AI_Output(self,other,"DIA_Alrik_Add_09_05");	//� ���� ������. � ��������� ��������� ���� ������ �������� � ������...
		AI_Output(self,other,"DIA_Alrik_Add_09_06");	//��� �����, �����, � ������ ��������� �����...
		Alrik_FightsIsOver = TRUE;
	}
	else if(Wld_IsTime(11,0,19,0))
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_07");	//� ���� ���� 50 �������?
		Info_ClearChoices(DIA_Alrik_WannaFight);
		Info_AddChoice(DIA_Alrik_WannaFight,"���...",DIA_Alrik_WannaFight_NoGold);
		if(Npc_HasItems(other,ItMi_Gold) >= 50)
		{
			Info_AddChoice(DIA_Alrik_WannaFight,"���, �����...",DIA_Alrik_WannaFight_Gold);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_08");	//� �������� ������ � ������� �� ������.
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_09");	//��� ����� �����, ������ ���� ���� ���������� ��������, �������� ������!
		if(Wld_IsTime(19,0,3,30))
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_10");	//������ ������� ������. ������� ������ � �������!
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_11");	//��� ��� ������� ����, ������ �����!
		};
	};
};

func void DIA_Alrik_WannaFight_Gold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Gold_15_00");	//���, �����...
	B_GiveInvItems(other,self,ItMi_Gold,50);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_01");	//(������) � ��� ����� ����!
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_02");	//������ �������...
	B_RemoveEveryInvItem(self,ItMi_Gold);
	CreateInvItems(self,ItMi_Gold,100);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_03");	//�� �����?
	Info_ClearChoices(DIA_Alrik_WannaFight);
	Info_AddChoice(DIA_Alrik_WannaFight,"������� ����������...",DIA_Alrik_WannaFight_Moment);
	Info_AddChoice(DIA_Alrik_WannaFight,"��� ����!",DIA_Alrik_WannaFight_NOW);
};

func void DIA_Alrik_WannaFight_NoGold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NoGold_15_00");	//���...
	AI_Output(self,other,"DIA_Alrik_WannaFight_NoGold_09_01");	//����� ����� ��! ��� ������ ��� �� �����!
	Info_ClearChoices(DIA_Alrik_WannaFight);
};

func void B_Alrik_StartFight()
{
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,ItPo_Health_Addon_04,1);
		B_UseItem(self,ItPo_Health_Addon_04);
	};
	self.aivar[AIV_ArenaFight] = AF_RUNNING;
	Alrik_Kaempfe += 1;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Alrik_WannaFight_NOW()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NOW_15_00");	//��� ����!
	AI_Output(self,other,"DIA_Alrik_WannaFight_NOW_09_01");	//���������, �� ��� �� ��������!
	Info_ClearChoices(DIA_Alrik_WannaFight);
	B_Alrik_StartFight();
};

func void DIA_Alrik_WannaFight_Moment()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Moment_15_00");	//������� ����������...
	AI_Output(self,other,"DIA_Alrik_WannaFight_Moment_09_01");	//��� ������... � � ������� ������!
	Info_ClearChoices(DIA_Alrik_WannaFight);
	B_Alrik_StartFight();
};


instance DIA_Alrik_AfterFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_AfterFight_Condition;
	information = DIA_Alrik_AfterFight_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Alrik_AfterFight_Condition()
{
	if((self.aivar[AIV_LastFightComment] == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
	{
		if(self.aivar[AIV_ArenaFight] != AF_NONE)
		{
			return TRUE;
		};
		if(Npc_IsInState(self,ZS_Talk))
		{
			return TRUE;
		};
	};
};

func void DIA_Alrik_AfterFight_Info()
{
	if((self.aivar[AIV_LastPlayerAR] == AR_NONE) && (self.aivar[AIV_ArenaFight] != AF_NONE) && (self.aivar[AIV_ArenaFight] != AF_AFTER_PLUS_DAMAGE))
	{
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_00");	//��, ������! �� � ����� � ����.
			if(Npc_HasItems(self,ItMi_Gold) >= 100)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_01");	//��� ���� 100 �������! �� ��������� ��!
				B_GiveInvItems(self,other,ItMi_Gold,100);
			}
			else if(!Npc_HasItems(self,ItMi_Gold))
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_02");	//� ����, �� ��� ������ ���� ������.
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_03");	//�� ��� �� ���������, ���� � ��� �� ����� ��� ���� - � ����� ���� �����!
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_04");	//�� ������� � ���� ��������, ���� � ��� ��� ��������!
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_05");	//��� ������ ���! �� �����, ��� ������ ��� ����� ���� ������! ��� ���������.
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
			};
			Alrik_ArenaKampfVerloren += 1;
			Alrik_ArenaKampfVerloren_Day = Wld_GetDay();
		}
		else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_06");	//�� ������ ������. �� ���� ������ ������� - �� ������������� ��������, ��� ������ �� ������ ����! (����������)
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_07");	//��, � �� ������������: ���, ��� ������ �� ����, �����������! ���� ������ ����������� ��� ���, � � ����� �������!
		};
		if(Alrik_Kaempfe == 1)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_08");	//� ��� ����: ����� �� ������� � ���, ��� ���������� �� �������.
			if((other.guild != GIL_MIL) && (other.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_09");	//��������� ������ �� �������� ����������� �������� ���� �� �������. � ��� ����� �� �����, ����� �������� ������ �� ���.
			};
		};
		self.aivar[AIV_ArenaFight] = AF_NONE;
		self.aivar[AIV_LastFightComment] = TRUE;
	}
	else
	{
		if(self.aivar[AIV_ArenaFight] == AF_AFTER_PLUS_DAMAGE)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_10");	//��� ��� �������, ��, ������!
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_11");	//� �� �����, ����� ���-������ �� ����������� ���� ��������.
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_12");	//�������� ������!
		}
		else
		{
			if(Alrik_Kaempfe == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_13");	//���� �� ����� ��������� �� ����, ���� ����� ���� ������� ����.
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_14");	//���� �� ����� ��������� ��� ���, ���� ����� ���� ������� ����!
			};
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_15");	//� �� ���� ����� ���� � ����� �������, ��� ��! ����������!
		};
		self.aivar[AIV_ArenaFight] = AF_NONE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Alrik_DuWohnst(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_DuWohnst_Condition;
	information = DIA_Alrik_DuWohnst_Info;
	permanent = FALSE;
	description = "�� '������' �� ���� �������?";
};


func int DIA_Alrik_DuWohnst_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};

func void DIA_Alrik_DuWohnst_Info()
{
	AI_Output(other,self,"DIA_Alrik_DuWohnst_15_00");	//(���������) �� '������' �� ���� �������?
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_01");	//������ ��������. (����������) ����� ������ ������� �����, ��� � ����, ����� ��������� ���� ������� �������!
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_02");	//� ��� ������������ � �����, �� � ������ ��� ������� � ������ ������ �������� �����������.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_03");	//� ��� � ������� � ���� ����. ��� ��������� 100 ������� ���� � ������ ���������� � ��������� �����.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_04");	//� ��� � ������� ����� �����������. ��� ���� �������� ������� ���� ���.
	Alrik_VomSchwertErzaehlt = TRUE;
};


instance DIA_Alrik_WerSchwert(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_WerSchwert_Condition;
	information = DIA_Alrik_WerSchwert_Info;
	permanent = FALSE;
	description = "���� �� ������ ���� ���?";
};


func int DIA_Alrik_WerSchwert_Condition()
{
	if((Alrik_VomSchwertErzaehlt == TRUE) && (MIS_Alrik_Sword != LOG_SUCCESS) && !Npc_HasItems(other,ItMw_AlriksSword_MIS))
	{
		return TRUE;
	};
};

func void DIA_Alrik_WerSchwert_Info()
{
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_00");	//���� �� ������ ���� ���?
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_01");	//� ������� ��� � �������� � �������� ������� �� ���-����� ����.
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_02");	//��� ����� �����. ������ � ����, ��� �� ��� ���, ����� �����������.
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_03");	//�� ���� �� ������ ��� ���� ��� ������ ���...
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_04");	//��� ������ ���. �� ���� �� ����� �� ���� ��������. ������ ����� �� ���� �������, ��� � �������������� ������. (����������)
	if(Alrik_Sword_Once == TRUE)
	{
		B_LogEntry(TOPIC_AlrikSchwert,"������ ������ ���� ��� �������� �����.");
	};
	MIS_Alrik_Sword = LOG_Running;
};


var int Alrik_EinmalSchwertBonus;

instance DIA_Alrik_HaveSword(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_HaveSword_Condition;
	information = DIA_Alrik_HaveSword_Info;
	permanent = TRUE;
	description = "� ������ ���� ���!";
};


func int DIA_Alrik_HaveSword_Condition()
{
	if((Alrik_VomSchwertErzaehlt == TRUE) && Npc_HasItems(other,ItMw_AlriksSword_MIS))
	{
		return TRUE;
	};
};

func void DIA_Alrik_HaveSword_Info()
{
	AI_Output(other,self,"DIA_Alrik_HaveSword_15_00");	//� ������ ���� ���!
	B_GiveInvItems(other,self,ItMw_AlriksSword_MIS,1);
	AI_WaitTillEnd(self,other);
	AI_EquipBestMeleeWeapon(self);
	if(Alrik_EinmalSchwertBonus == FALSE)
	{
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			B_TurnToNpc(self,other);
		};
		B_AddFightSkill(self,NPC_TALENT_1H,20);
		Alrik_EinmalSchwertBonus = TRUE;
	};
	if(MIS_Alrik_Sword != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_01");	//��! �� ����������� ������� ���������, ��� ������!
		MIS_Alrik_Sword = LOG_SUCCESS;
		B_GivePlayerXP(XP_AlriksSword);
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_02");	//�������! ���������, ���������� �� �� ������� ���� ������!
	};
};


instance DIA_Alrik_Krieg(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Krieg_Condition;
	information = DIA_Alrik_Krieg_Info;
	permanent = FALSE;
	description = "��� �� ������ � ����� � ������?";
};


func int DIA_Alrik_Krieg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_DuWohnst))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Krieg_Info()
{
	AI_Output(other,self,"DIA_Alrik_Krieg_15_00");	//��� �� ������ � ����� � ������?
	AI_Output(self,other,"DIA_Alrik_Krieg_09_01");	//��� ����� ������ �������. ��� ����� ���� ��� ����� �����.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_02");	//����� ��������. ������� ����������� ������������ ���������, ������� ����������� ����������� �������.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_03");	//�� �� ������� �����. ���� ����� ������ �� ����������, ����������� ����������.
};


var int Alrik_VorausErzaehlt;
var int Alrik_Merke_1h;
var int Alrik_CommentedProgress;
var int DIA_Alrik_Teach_permanent;

instance DIA_Alrik_Ausbilden(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Ausbilden_Condition;
	information = DIA_Alrik_Ausbilden_Info;
	permanent = TRUE;
	description = "�� ������ ������� ����?";
};


func int DIA_Alrik_Ausbilden_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_DuWohnst) && (Alrik_Teach1H == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Ausbilden_Info()
{
	AI_Output(other,self,"DIA_Alrik_Ausbilden_15_00");	//�� ������ ������� ����?
	if(RealTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Alrik)
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		Alrik_Teach1H = TRUE;
		DIA_Alrik_Teach_permanent = TRUE;
	}
	else if(Alrik_Kaempfe == 0)
	{
		AI_Output(self,other,"DIA_Alrik_Ausbilden_09_01");	//���� �� ������������� ������ ��������� ���������, �� ������ ������ ����. (����������) �� ���� ���� � �� ������ �������������� �����.
		Alrik_VorausErzaehlt = TRUE;
	}
	else
	{
		if(Alrik_VorausErzaehlt == TRUE)
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_02");	//� ����� ���� �����. � ����� ���� �����, ��� � ���� - ���� � ���� ���������� �����.
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_03");	//��� ������ � ���� ����� ����������� ���� - ����������.
		};
		Alrik_Teach1H = TRUE;
		if(DIA_Kardif_Lernen_permanent == FALSE)
		{
			Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
			B_LogEntry(TOPIC_CityTeacher,"������ ����� ������� ���� ��������� �������� ���������� �������. �� ��������� �� ������� � �������� ��������.");
		};
	};
};


func void B_BuildLearnDialog_Alrik()
{
	if(VisibleTalentValue(NPC_TALENT_1H) < TeachLimit_1H_Alrik)
	{
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			B_TurnToNpc(self,other);
		};
		Info_ClearChoices(DIA_Alrik_Teach);
		Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
		Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnTalentString(other,NPC_TALENT_1H,1),DIA_Alrik_Teach_1H_1);
		Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnTalentString(other,NPC_TALENT_1H,5),DIA_Alrik_Teach_1H_5);
	}
	else
	{
		if(RealTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Alrik)
		{
			DIA_Alrik_Teach_permanent = TRUE;
		};
		PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_1H_Alrik)),-1,53,FONT_Screen,2);
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		AI_StopProcessInfos(self);
	};
};

instance DIA_Alrik_Teach(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Teach_Condition;
	information = DIA_Alrik_Teach_Info;
	permanent = TRUE;
	description = "����� ���� ���������� � �����!";
};


func int DIA_Alrik_Teach_Condition()
{
	if((Alrik_Teach1H == TRUE) && (DIA_Alrik_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Teach_Info()
{
	AI_Output(other,self,"DIA_Alrik_Teach_15_00");	//����� ���� ���������� � �����!
	Alrik_Merke_1h = other.HitChance[NPC_TALENT_1H];
	B_BuildLearnDialog_Alrik();
};

func void DIA_Alrik_Teach_Back()
{
	if((other.HitChance[NPC_TALENT_1H] > Alrik_Merke_1h) && (Alrik_CommentedProgress == FALSE))
	{
		if(other.HitChance[NPC_TALENT_1H] >= 30)
		{
			AI_Output(self,other,"DIA_Alrik_Teach_Back_09_00");	//�� ������ �� �������!
			Alrik_CommentedProgress = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_Teach_Back_09_01");	//� ���� ��� ����� ����������. ����� �� ������� ��������� ������!
		};
	};
	Info_ClearChoices(DIA_Alrik_Teach);
};

func void DIA_Alrik_Teach_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,TeachLimit_1H_Alrik))
	{
		B_BuildLearnDialog_Alrik();
	};
};

func void DIA_Alrik_Teach_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,TeachLimit_1H_Alrik))
	{
		B_BuildLearnDialog_Alrik();
	};
};

