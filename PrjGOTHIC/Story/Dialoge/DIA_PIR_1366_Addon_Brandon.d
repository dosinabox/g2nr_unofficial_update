
instance DIA_Addon_Brandon_EXIT(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 999;
	condition = DIA_Addon_Brandon_EXIT_Condition;
	information = DIA_Addon_Brandon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Brandon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Brandon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Brandon_Hello(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 1;
	condition = DIA_Addon_Brandon_Hello_Condition;
	information = DIA_Addon_Brandon_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Brandon_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_00");	//�� ������ ����������! �������.
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_01");	//� � ���� ��, ���������� �����!
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_02");	//�� ���������� ������ ���� ��� ������.
};


instance DIA_Addon_Brandon_AnyNews(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 99;
	condition = DIA_Addon_Brandon_AnyNews_Condition;
	information = DIA_Addon_Brandon_AnyNews_Info;
	permanent = TRUE;
	description = "���� ���-������ �����?";
};


func int DIA_Addon_Brandon_AnyNews_Condition()
{
	return TRUE;
};

func void DIA_Addon_Brandon_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_AnyNews_15_00");	//���� ���-������ �����?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_01");	//�������. ��������, � �����. � ���� �� �������� ��������� ��������?
		}
		else if(CanyonRazorBodyCount < 10)
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_02");	//��� ���? �� �����, �������, ��������� ��� ���?
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_03");	//��� �� �������?! �� �����, ��� �� ���� �������� ������� ������� ��� ���� ���� ���������.
		};
	}
	else if((GregIsBack == TRUE) && !Npc_IsDead(Greg) && (MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_04");	//���� ��������. ������ ��� ������ ����������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_06");	//(������������) ������ �������...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_07");	//(�������) ��������� � ����, ���! ��� ��-�������.
	};
};


instance DIA_Addon_Brandon_WannaLearn(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 11;
	condition = DIA_Addon_Brandon_WannaLearn_Condition;
	information = DIA_Addon_Brandon_WannaLearn_Info;
	description = "�� ������ ������� ���� ����-������?";
};


func int DIA_Addon_Brandon_WannaLearn_Condition()
{
	return TRUE;
};

func void DIA_Addon_Brandon_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_WannaLearn_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_01");	//������� ����? �������, ����! � ���� ������� ���� ����� ������� � ������.
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_02");	//�� ����� ��� ��� ������?
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_OfferDrink_15_00");	//�����, ��� � ����� ���� ��������.
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_03");	//(����������) �������, �����! ������ � ������ �������.
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_04");	//�� �� ������� ����������� ��� �����-������ ������� �����.
	MIS_Brandon_BringHering = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_BrandonBooze,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BrandonBooze,LOG_Running);
	B_LogEntry(TOPIC_Addon_BrandonBooze,"� ������ �������� �������� �������. ����� �� ���������� ����� ����.");
};


instance DIA_Addon_Brandon_HoleGrog(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 12;
	condition = DIA_Addon_Brandon_HoleGrog_Condition;
	information = DIA_Addon_Brandon_HoleGrog_Info;
	description = "� ������� ���� �����.";
};


func int DIA_Addon_Brandon_HoleGrog_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Brandon_WannaLearn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_HoleGrog_Info()
{
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_BringGrog_15_00");	//� ������� ���� �����.
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_01");	//�� ���, ������ ���� ��������???
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_02");	//� �� ��������� �� ���� �����. �� ���� �������������, �� ���� �� ������?!
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_03");	//���, ������� ������� ����� ������� ������ � �������!
	if(Player_KnowsSchnellerHering == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Brandon_Hello_15_05");	//�� �������� � ��� '������� �������'?
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_04");	//��, ������ �� � � ���� � ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_05");	//�� ��� �������� ������ ������� �������?
		AI_Output(other,self,"DIA_Addon_Brandon_Hello_15_07");	//��� ���.
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_06");	//��� ���� �� �� �����? ��� ����� ���� ����������� �����������!
	};
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_08");	//� ������ ������ ��� �����!
	B_LogEntry(TOPIC_Addon_BrandonBooze,"����� �������� ������������. �� ����� '������� �������'. ���� ������� ���� ������ � �������.");
};


instance DIA_Addon_Brandon_SchnellerHering(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 13;
	condition = DIA_Addon_Brandon_SchnellerHering_Condition;
	information = DIA_Addon_Brandon_SchnellerHering_Info;
	description = "�������.";
};


func int DIA_Addon_Brandon_SchnellerHering_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Brandon_HoleGrog) && Npc_HasItems(other,ItFo_Addon_SchnellerHering))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_SchnellerHering_Info()
{
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_GiveGrog_15_00");	//�������.
	AI_WaitTillEnd(self,other);
	B_GiveInvItems(other,self,ItFo_Addon_SchnellerHering,1);
	B_UseItem(self,ItFo_Addon_SchnellerHering);
	AI_Output(self,other,"DIA_Addon_Brandon_GiveGrog_04_01");	//��-�! ������ ������ �����!
	B_LogEntries(TOPIC_Addon_BrandonBooze,"� ����� �������� ��� ������� �����. ������ �� ����� ����� ����.");
	Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogNextEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_BrandonTeach);
	MIS_Brandon_BringHering = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


var int Brandon_Merke_Str;
var int Brandon_Merke_Dex;

func void B_BuildLearnDialog_Brandon()
{
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnAttributeString(ATR_DEXTERITY,1),DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnAttributeString(ATR_DEXTERITY,5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnAttributeString(ATR_STRENGTH,1),DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnAttributeString(ATR_STRENGTH,5),DIA_Addon_Brandon_TeachPlayer_STR_5);
};

instance DIA_Addon_Brandon_TeachPlayer(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 776;
	condition = DIA_Addon_Brandon_TeachPlayer_Condition;
	information = DIA_Addon_Brandon_TeachPlayer_Info;
	permanent = TRUE;
	description = "� ����� �������!";
};


func int DIA_Addon_Brandon_TeachPlayer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Brandon_WannaLearn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_TeachPlayer_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_TeachPlayer_15_00");	//� ����� �������!
	if(MIS_Brandon_BringHering == LOG_SUCCESS)
	{
		Brandon_Merke_Str = ATR_Training[ATR_STRENGTH];
		Brandon_Merke_Dex = ATR_Training[ATR_DEXTERITY];
		B_BuildLearnDialog_Brandon();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_04_01");	//������� �� ������ �������� ��� ��������� �������, �����!
	};
};

func void DIA_Addon_Brandon_TeachPlayer_Back()
{
	if(ATR_Training[ATR_STRENGTH] > Brandon_Merke_Str)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_00");	//���������, �����! �� ��� ���� �������.
	};
	if(ATR_Training[ATR_DEXTERITY] > Brandon_Merke_Dex)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_01");	//��� ���� ���� ��������, ��� ���� �� ������ �������� �� �����.
	};
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
};

func void DIA_Addon_Brandon_TeachPlayer_DEX_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED))
	{
		B_BuildLearnDialog_Brandon();
	};
};

func void DIA_Addon_Brandon_TeachPlayer_DEX_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED))
	{
		B_BuildLearnDialog_Brandon();
	};
};

func void DIA_Addon_Brandon_TeachPlayer_STR_1()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED))
	{
		B_BuildLearnDialog_Brandon();
	};
};

func void DIA_Addon_Brandon_TeachPlayer_STR_5()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED))
	{
		B_BuildLearnDialog_Brandon();
	};
};

instance DIA_Addon_Brandon_Anheuern(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 11;
	condition = DIA_Addon_Brandon_Anheuern_Condition;
	information = DIA_Addon_Brandon_Anheuern_Info;
	permanent = FALSE;
	description = "�� ������ ��� ������.";
};


func int DIA_Addon_Brandon_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_FollowMe_15_00");	//�� ������ ��� ������.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_01");	//��� ��� ���� �������. � ��� ��� �����?
	AI_Output(other,self,"DIA_Addon_Brandon_FollowMe_15_02");	//��� ����� ����. �� ������ ��������� ����������� � �������.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_03");	//(����������) �������-�� ����� ���� ���-������ ����������!
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_04");	//��� �, ������. ��� ������ �� ����������� � ����, ��� ������ ����� ����� ���������.
};


instance DIA_Addon_Brandon_ComeOn(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 12;
	condition = DIA_Addon_Brandon_ComeOn_Condition;
	information = DIA_Addon_Brandon_ComeOn_Info;
	permanent = TRUE;
	description = "������ �� ����.";
};


func int DIA_Addon_Brandon_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Brandon_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_Weiter_15_00");	//������ �� ����.
	if(C_GregsPiratesTooFar())
	{
		AI_Output(self,other,"DIA_Addon_Brandon_ComeOn_04_02");	//����� ������� �������� ������� �����.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_ComeOn_04_01");	//���!
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_Brandon_GoHome(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 13;
	condition = DIA_Addon_Brandon_GoHome_Condition;
	information = DIA_Addon_Brandon_GoHome_Info;
	permanent = TRUE;
	description = "�� ��� ������ �� �����.";
};


func int DIA_Addon_Brandon_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_DontNeedYou_15_00");	//�� ��� ������ �� �����.
	AI_Output(self,other,"DIA_Addon_Brandon_GoHome_04_01");	//������.
	AI_Output(self,other,"DIA_Addon_Brandon_GoHome_04_02");	//����� ����, �� ���-������ � ����� ������.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Brandon_TooFar(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 14;
	condition = DIA_Addon_Brandon_TooFar_Condition;
	information = DIA_Addon_Brandon_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Brandon_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && C_GregsPiratesTooFar())
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_00");	//����������! �� ���, ������ ��������� ���� ������ �� �������?
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_01");	//�� ������������ � ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_02");	//� ����������� � ������.
	};
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};

