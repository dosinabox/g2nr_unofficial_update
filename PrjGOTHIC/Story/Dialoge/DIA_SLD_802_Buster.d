
instance DIA_Buster_EXIT(C_Info)
{
	npc = SLD_802_Buster;
	nr = 999;
	condition = DIA_Buster_EXIT_Condition;
	information = DIA_Buster_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Buster_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Buster_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Buster_Hello(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_Hello_Condition;
	information = DIA_Buster_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Buster_Hello_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Buster_Hello_Info()
{
	AI_Output(self,other,"DIA_Buster_Hello_13_00");	//����������, ��� � ��� �����?! � ���� �������� �� ����?
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"��� �������. � ���� ������� ���������.",DIA_Buster_Hello_GoingToFarm);
	Info_AddChoice(DIA_Buster_Hello,"� ��� ����������?",DIA_Buster_Hello_WhoAreYou);
};

func void DIA_Buster_Hello_WhoAreYou()
{
	AI_Output(other,self,"DIA_Buster_Hello_WhoAreYou_15_00");	//� ��� ����������?
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_01");	//� ������, ���� �� ��������� ��!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_02");	//� ���� ����� ���� ���������� �� ����, � �� �� ��� �������� ������� ���� �������!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_03");	//�����, ��� ���� ����� �����?
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"��� �� ���� ����.",DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice(DIA_Buster_Hello,"� ���� ��!",DIA_Buster_Hello_IKnowLee);
	Info_AddChoice(DIA_Buster_Hello,"��� �������. � ���� ������� ���������.",DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_IKnowLee()
{
	AI_Output(other,self,"DIA_Buster_Hello_IKnowLee_15_00");	//� ���� ��!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_01");	//��� ����� ��! ��� �� ���� �� ������, ��������. ������ �� �������������� �� ����!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_02");	//����, ���� �� �������������?
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"��� �� ���� ����.",DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice(DIA_Buster_Hello,"��� �������. � ���� ������� ���������.",DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_NotYourBusiness()
{
	AI_Output(other,self,"DIA_Buster_Hello_NotYourBusiness_15_00");	//��� �� ���� ����.
	AI_Output(self,other,"DIA_Buster_Hello_NotYourBusiness_13_01");	//� ������ �� ������� ��� ������������� �� ����, ��, ������� �����! ��-�����, �� ������������ ������� �������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_GoingToFarm()
{
	AI_Output(other,self,"DIA_Buster_Hello_GoingToFarm_15_00");	//��� �������. � ���� ������� ���������.
	AI_Output(self,other,"DIA_Buster_Hello_GoingToFarm_13_01");	//��?.. ��, �� �� �������� ��� ����� �� �������.
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"������ ���������?",DIA_Buster_Hello_WannaTestIt);
	Info_AddChoice(DIA_Buster_Hello,"� ���� ���� �������-������ ������.",DIA_Buster_Hello_SlewBeasts);
	Info_AddChoice(DIA_Buster_Hello,"���� ��������� �������.",DIA_Buster_Hello_ImNoDanger);
};

func void DIA_Buster_Hello_ImNoDanger()
{
	AI_Output(other,self,"DIA_Buster_Hello_ImNoDanger_15_00");	//���� ��������� �������.
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_01");	//(������������) ��, �� ������ ���� � �������� ������������ ����� ����, ��������.
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_02");	//��� ��������� ���������� ��������� � ������. ��� �� ����������� �� ������. ��� ����� ���������. (�������)
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"�� ������ � ���� ��������� �����? ���� ������� ������?",DIA_Buster_Hello_RealOrcs);
	Info_AddChoice(DIA_Buster_Hello,"�?",DIA_Buster_Hello_SoWhat);
	Info_AddChoice(DIA_Buster_Hello,"����������.",DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_SlewBeasts()
{
	AI_Output(other,self,"DIA_Buster_Hello_SlewBeasts_15_00");	//� ���� ���� �������-������ ������.
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_01");	//��! (�������) ��, ��������, ���������� ��������� ������������ �� ���� � ������ ������� ���� �� �� ���.
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_02");	//� �� ����� ����� ���� � ������! ��, � � ����� ��������� ���������� �����������. (����������� ����)
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"�� ������ � ���� ��������� �����? ���� ������� ������?",DIA_Buster_Hello_RealOrcs);
	Info_AddChoice(DIA_Buster_Hello,"�?",DIA_Buster_Hello_SoWhat);
	Info_AddChoice(DIA_Buster_Hello,"����������.",DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_WannaTestIt()
{
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_00");	//������ ���������?
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_01");	//���� ��! � ����� �� �� ���� �����, ��?
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_02");	//����� ������� � ���.
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_03");	//����� �����, ������ ���, �� ��� �� �����.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_Impressive()
{
	AI_Output(other,self,"DIA_Buster_Hello_Impressive_15_00");	//����������.
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_01");	//(�������) ��� ���� ������, ������! �� ���� ������ ���� ����������� ������ � �������!
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_02");	//�� ������ ���� ����� ���� �� ���� �� �������. �� ����������� ����� ���� ����� �� ������.
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"������, ��� �������� �������� ����, ��� � ���� �� ����!",DIA_Buster_Hello_LetMeShowYou);
	Info_AddChoice(DIA_Buster_Hello,"��� �������.",DIA_Buster_Hello_IfYouSaySo);
};

func void DIA_Buster_Hello_IfYouSaySo()
{
	AI_Output(other,self,"DIA_Buster_Hello_IfYouSaySo_15_00");	//��� �������.
	AI_Output(self,other,"DIA_Buster_Hello_IfYouSaySo_13_01");	//(�� ��������� ���������) �������, ������!
	AI_StopProcessInfos(self);
};

func void DIA_Buster_Hello_LetMeShowYou()
{
	AI_Output(other,self,"DIA_Buster_Hello_LetMeShowYou_15_00");	//������, ��� �������� �������� ����, ��� � ���� �� ����!
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_01");	//�� ���, ������� �� ���� ������� �����������, ��?
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_02");	//������, �����, ������, �� ��� �� ��������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_SoWhat()
{
	AI_Output(other,self,"DIA_Buster_Hello_SoWhat_15_00");	//�?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_01");	//(�������) ��� ����� �� ���������, � ��� � ������. �� �������, ��� �� ����, ��?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_02");	//(�������) ������, ������ ����� ����������� ���� ����!
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"������ �����!",DIA_Buster_Hello_Whenever);
	Info_AddChoice(DIA_Buster_Hello,"� ������ ����...",DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_RealOrcs()
{
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_00");	//�� ������ � ���� ��������� �����? ���� ������� ������?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_01");	//(��������) � ���� � ����... �������! �� ���, ����������� ���� ����?
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_02");	//(��������) ���� � �� �����.
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_03");	//�� �� ����� ��������! (����������) �� ��� ��������������, ��?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_04");	//����� �����, ������, �� ��� �� ��������, �����!
	Info_ClearChoices(DIA_Buster_Hello);
	Info_AddChoice(DIA_Buster_Hello,"������ �����!",DIA_Buster_Hello_Whenever);
	Info_AddChoice(DIA_Buster_Hello,"� ������ ����...",DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_Whenever()
{
	AI_Output(other,self,"DIA_Buster_Hello_Whenever_15_00");	//������ �����!
	AI_Output(self,other,"DIA_Buster_Hello_Whenever_13_01");	//����� ��� ����, ��������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Buster_Hello_JustJoking()
{
	AI_Output(other,self,"DIA_Buster_Hello_JustJoking_15_00");	//� ������ ����...
	AI_Output(self,other,"DIA_Buster_Hello_JustJoking_13_01");	//������������ � ������ �������! � ������ ����������!
	AI_StopProcessInfos(self);
};


instance DIA_Buster_FightNone(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_FightNone_Condition;
	information = DIA_Buster_FightNone_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Buster_FightNone_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Buster_Hello) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && Npc_IsInState(self,ZS_Talk))
	{
		if((Kapitel >= 3) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
		{
			return FALSE;
		};
		return TRUE;
	};
};

func void DIA_Buster_FightNone_Info()
{
	AI_Output(self,other,"DIA_Buster_FightNone_13_00");	//��� ���� �����, �������?
};


instance DIA_Buster_Duell(C_Info)
{
	npc = SLD_802_Buster;
	nr = 3;
	condition = DIA_Buster_Duell_Condition;
	information = DIA_Buster_Duell_Info;
	permanent = TRUE;
	description = "� ������� ���� �� �����!";
};


func int DIA_Buster_Duell_Condition()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	{
		return TRUE;
	};
};

func void DIA_Buster_Duell_Info()
{
	AI_Output(other,self,"DIA_Buster_Duell_15_00");	//� ������� ���� �� �����!
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_01");	//��-��! ���� ��� ��������, ��? �����, ��� ����!
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_02");	//�� ������ ����������� ��� ���? ��, �� ������, �����, ��� ����!
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_Duell_13_03");	//������ ������ �� ������!
		};
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Buster_WannaJoin(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_WannaJoin_Condition;
	information = DIA_Buster_WannaJoin_Info;
	permanent = TRUE;
	description = "� ���� �������������� � ���������!";
};


func int DIA_Buster_WannaJoin_Condition()
{
	if((other.guild == GIL_NONE) && (Buster_Duell == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Buster_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Buster_WannaJoin_15_00");	//� ���� �������������� � ���������!
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) || (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{
		if(Torlof_GenugStimmen == FALSE)
		{
			Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
		};
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_01");	//� ����� � ����� ������, ��� � ����, �� ������ ���������� � ���� ������ �������.
			B_LogEntry(TOPIC_SLDRespekt,"� ��� ���, ��� � ������� �������, �� �� ����� ������ ������ ����� ���������� � ���� ���������.");
		}
		else
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_02");	//�� �� �������� ������� ����, �� � ������ ���� ������� ������.
			B_LogEntry(TOPIC_SLDRespekt,"������ �� ����� ������ ������ ����� ���������� � ���� ���������.");
		};
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_03");	//��� ����� �� ����� ������, ��� ��� ����� � �� ����� �����, �� ���� �� �������, � ���������� �� ����.
		SCKnowsSLDVotes = TRUE;
		Buster_Duell = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_04");	//��? � �� �����, ����� ����� ������, ��� ��, �����-���� ��������� � ��������...
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_05");	//�� �������� �� ����� - �����, ��� ��, ����� ������ ������!
		};
	};
};


var int Buster_SentenzaTip;

instance DIA_Buster_OtherSld(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_OtherSld_Condition;
	information = DIA_Buster_OtherSld_Info;
	permanent = FALSE;
	description = "� ���� ������ ������ � ��������� � ���� ���������.";
};


func int DIA_Buster_OtherSld_Condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Buster_OtherSld_Info()
{
	AI_Output(other,self,"DIA_Buster_OtherSld_15_00");	//� ���� ������ ������ � ��������� � ���� ���������.
	AI_Output(self,other,"DIA_Buster_OtherSld_13_01");	//� ��������� � ���� ��� ���� �������. ���� ����� ������������ ��������.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_02");	//� ��� �������� ��������� - �� ������� � ��� ������: ���� ������ �������� �� ���� - ����� ���������� � ���.
	};
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Buster_OtherSld_13_03");	//� �����, �� ������� ����� ����� �� ���.
			AI_Output(self,other,"DIA_Buster_OtherSld_13_04");	//�� �� ����� �����������. ���� ������ ������� �� ����� ������ ���������� ���.
		};
		AI_Output(self,other,"DIA_Buster_OtherSld_13_05");	//�� ���� ����� ����� ������, ������� ����� ������� ����...
		AI_Output(self,other,"DIA_Buster_OtherSld_13_06");	//��������, ��������. �� �������� ���� �� �����. ���� ����� �� ����������� � ���.
		Buster_SentenzaTip = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_07");	//�� ����� � ������ ���� ��� ���, �������?!
		AI_StopProcessInfos(self);
	};
};


var int Buster_GoldZumBrennen;
var int Buster_Bonus;

instance DIA_Buster_AboutSentenza(C_Info)
{
	npc = SLD_802_Buster;
	nr = 1;
	condition = DIA_Buster_AboutSentenza_Condition;
	information = DIA_Buster_AboutSentenza_Info;
	permanent = FALSE;
	description = "��� ��� ������ ��������?";
};


func int DIA_Buster_AboutSentenza_Condition()
{
	if((Buster_SentenzaTip == TRUE) && !Npc_IsDead(Sentenza) && (Sentenza.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		if((Kapitel >= 3) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
		{
			return FALSE;
		};
		return TRUE;
	};
};

func void DIA_Buster_AboutSentenza_Info()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_00");	//��� ��� ������ ��������?
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_01");	//�� ���������� �������� �� ���� ������, ����� �� ������ ������� �� ����� - �� ������ ��� �� �����.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_02");	//�� ����� �����, � �� ��������. � ��� ��� � ������, ����� ������ ���� � ������ ���. � ��� ������, �� ������������ �� ���� ����� �����.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_03");	//������ �� ������, ��� �� ������. � ������� ��� ���� ��� ���� ������, �� ��� ��� ����� ���� �������. � ����� � ���� ����������� �����.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_04");	//� �����, ��� �� ������� �����, ������� ����� �� ������� ���.
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_05");	//������� �� �����.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_06");	//����������. �� ����� ��� ���� ������?
	SCKnowsSLDVotes = TRUE;
	Info_ClearChoices(DIA_Buster_AboutSentenza);
	Info_AddChoice(DIA_Buster_AboutSentenza,"���.",DIA_Buster_AboutSentenza_No);
	if(Npc_HasItems(other,ItMi_Gold) >= 5)
	{
		Info_AddChoice(DIA_Buster_AboutSentenza,"��, ��� ����� - 5 ������� �����.",DIA_Buster_AboutSentenza_Give);
	};
};

func void DIA_Buster_AboutSentenza_Give()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_Give_15_00");	//��, ��� ����� - 5 ������� �����.
	B_GiveInvItems(other,self,ItMi_Gold,5);
	AI_Output(self,other,"DIA_Buster_AboutSentenza_Give_13_01");	//�������. ������, ��� �� ��� �� �����. � �� ������ ����� �������.
	Buster_GoldZumBrennen = TRUE;
	Buster_Bonus = 50;
	Info_ClearChoices(DIA_Buster_AboutSentenza);
};

func void DIA_Buster_AboutSentenza_No()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_No_15_00");	//���.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_No_13_01");	//� ��� � �����.
	Info_ClearChoices(DIA_Buster_AboutSentenza);
};


instance DIA_Buster_LeeLeader(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_LeeLeader_Condition;
	information = DIA_Buster_LeeLeader_Info;
	permanent = FALSE;
	description = "��������� ����������� ��, ��?";
};


func int DIA_Buster_LeeLeader_Condition()
{
	if(Buster_Duell == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Buster_LeeLeader_Info()
{
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_00");	//��������� ����������� ��, ��?
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_01");	//��������� - ��, ������ � ��������, ��� ����� ����! �� ���� ��� � �������.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_02");	//(��������) ��� ����.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_03");	//� �� ����� ����, ����� ��� �������. � ��������� ����� ���� ����.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_04");	//� ���� ���� ������ ��������.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_05");	//����� �� ������ ��������� - � ��� ��� ������ ����������.
};


instance DIA_Buster_WhatHappened(C_Info)
{
	npc = SLD_802_Buster;
	nr = 2;
	condition = DIA_Buster_WhatHappened_Condition;
	information = DIA_Buster_WhatHappened_Info;
	permanent = FALSE;
	description = "��� ����� � ���������� �� �������?";
};


func int DIA_Buster_WhatHappened_Condition()
{
//	if(Npc_KnowsInfo(other,DIA_Buster_LeeLeader) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	if(Npc_KnowsInfo(other,DIA_Buster_LeeLeader))
	{
		return TRUE;
	};
};

func void DIA_Buster_WhatHappened_Info()
{
	AI_Output(other,self,"DIA_Buster_WhatHappened_15_00");	//��� ����� � ���������� �� �������?
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_01");	//����� ����, ��� ������� �� �����, �� ����� ��� �� �������. �� ������, ��� ��� ������ �� �������, ���� �� ����� ��������� ������. � �� ��� ����.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_02");	//������ �� ����� ����� ���� ���������� ��������. �������� ������ ���, ����� �� �� ������� ��������� �� ������.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_03");	//���� ����������� �� ��� ������ ������ ��� ���� ���������.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_04");	//���� ������ ��� ����, � �� ����� �������� �����, ����� ����������� ����������� �������� � ����� ���������� �������.
};


instance DIA_Buster_PreTeach(C_Info)
{
	npc = SLD_802_Buster;
	nr = 8;
	condition = DIA_Buster_PreTeach_Condition;
	information = DIA_Buster_PreTeach_Info;
	permanent = FALSE;
	description = "�� ������ ������� ���� ���������?";
};


func int DIA_Buster_PreTeach_Condition()
{
	return TRUE;
};

func void DIA_Buster_PreTeach_Info()
{
	AI_Output(other,self,"DIA_Buster_Teach_15_00");	//�� ������ ������� ���� ���������?
	if(self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Buster_Teach_13_01");	//��, � ���� �������� ���� ������� �������...
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_Teach_13_02");	//�� �� ��� �� ����, ��� ��������. ������, � ����� ���� ����, ��� ���� ���. �����, ����� ����, � ���� �������� ����� ������ ����...
	};
	Log_CreateTopic(TOPIC_SoldierTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_SoldierTeacher,"������ ����� ������� ���� ��������� �������� ���������� �������.");
};


var int DIA_Buster_Teach_permanent;

func void B_BuildLearnDialog_Buster()
{
	if(VisibleTalentValue(NPC_TALENT_1H) < TeachLimit_1H_Buster)
	{
		Info_ClearChoices(DIA_Buster_Teach);
		Info_AddChoice(DIA_Buster_Teach,Dialog_Back,DIA_Buster_Teach_Back);
		Info_AddChoice(DIA_Buster_Teach,B_BuildLearnTalentString(other,NPC_TALENT_1H,1),DIA_Buster_Teach_1H_1);
		Info_AddChoice(DIA_Buster_Teach,B_BuildLearnTalentString(other,NPC_TALENT_1H,5),DIA_Buster_Teach_1H_5);
	}
	else
	{
		if(RealTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Buster)
		{
			DIA_Buster_Teach_permanent = TRUE;
		};
		PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_1H_Buster)),-1,53,FONT_Screen,2);
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		AI_StopProcessInfos(self);
	};
};

instance DIA_Buster_Teach(C_Info)
{
	npc = SLD_802_Buster;
	nr = 8;
	condition = DIA_Buster_Teach_Condition;
	information = DIA_Buster_Teach_Info;
	permanent = TRUE;
	description = "����� ����.";
};


func int DIA_Buster_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Buster_PreTeach) && (DIA_Buster_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Buster_Teach_Info()
{
	DIA_Common_TeachMe();
	B_BuildLearnDialog_Buster();
};

func void DIA_Buster_Teach_Back()
{
	Info_ClearChoices(DIA_Buster_Teach);
};

func void DIA_Buster_Teach_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,TeachLimit_1H_Buster))
	{
		B_BuildLearnDialog_Buster();
	};
};

func void DIA_Buster_Teach_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,TeachLimit_1H_Buster))
	{
		B_BuildLearnDialog_Buster();
	};
};

instance DIA_Buster_SHADOWBEASTS(C_Info)
{
	npc = SLD_802_Buster;
	nr = 30;
	condition = DIA_Buster_SHADOWBEASTS_Condition;
	information = DIA_Buster_SHADOWBEASTS_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Buster_SHADOWBEASTS_Condition()
{
	if(((Kapitel == 3) || (Kapitel == 4)) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Buster_SHADOWBEASTS_Info()
{
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_00");	//��, ��������!
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_01");	//��� ���� �����?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_02");	//��������� ����� � ��� �����, ��� ����� ���������� ����� � ���� ����.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_03");	//�?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_04");	//��� �������, � ����, ��� ��� ����� �������.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_05");	//�������� �� ������ ����� �������� ������� ����� �� ������������ �����.
	Info_ClearChoices(DIA_Buster_SHADOWBEASTS);
	Info_AddChoice(DIA_Buster_SHADOWBEASTS,"��� ���� ��������, � ������� �� ��������?",DIA_Buster_SHADOWBEASTS_wer);
	Info_AddChoice(DIA_Buster_SHADOWBEASTS,"��� �� ��� ��������?",DIA_Buster_SHADOWBEASTS_was);
	Info_AddChoice(DIA_Buster_SHADOWBEASTS,"����� �� �������� ��� ��� ���?",DIA_Buster_SHADOWBEASTS_ich);
};

func void DIA_Buster_SHADOWBEASTS_ich()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_00");	//����� �� �������� ��� ��� ���?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_01");	//��� � �� ���� ��� �������. � ������ ���������� ����� � ������������� �� ����� ��������� ��������.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_02");	//�� ������ �������, �� ���������.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_03");	//��, � ��� � ������.
};

func void DIA_Buster_SHADOWBEASTS_was()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_15_00");	//��� �� ��� ��������?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_01");	//���� �������� ����������, ��� ����� ����� ������� ������� ���� ����������.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_02");	//���-�� ������ ������� � ��� � ����������� �� ���� ������. ��� ��� ����� �� � �����.
	Info_AddChoice(DIA_Buster_SHADOWBEASTS,"������� �� ���� ����� ����������?",DIA_Buster_SHADOWBEASTS_was_wieviel);
};

func void DIA_Buster_SHADOWBEASTS_was_wieviel()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_00");	//������� �� ���� ����� ����������?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_01");	//����� ���� �����! ����� ������ ��� �����.
	if(Buster_GoldZumBrennen == TRUE)
	{
		AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_02");	//� ����� � ��� ������, ��� �� ��� ���, � ������ ��� ���� ������ ����.
	};
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_03");	//������ ���������! � ��� ���� �����, ����� ������ ��� ����.
	MIS_Buster_KillShadowbeasts_DJG = LOG_Running;
	Log_CreateTopic(TOPIC_Buster_KillShadowbeasts,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Buster_KillShadowbeasts,LOG_Running);
	B_LogEntry(TOPIC_Buster_KillShadowbeasts,"������ ���� ������� ���� �� ������ ��� ���������, ��� � ������� ���.");
	Info_ClearChoices(DIA_Buster_SHADOWBEASTS);
};

func void DIA_Buster_SHADOWBEASTS_wer()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_wer_15_00");	//��� ���� ��������, � ������� �� ��������?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_01");	//��� �� ������, ��������. � ���, ��-������, ����� - ���������� ���� ���������? �� ���, ������ �������� ����?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_02");	//���� �� ������ ����� ���� �� ����, ��� ������ ������ �� ����, �������?
};

var int Buster_TrophyTeacher;

instance DIA_Buster_TeachTrophyShadowbeast(C_Info)
{
	npc = SLD_802_Buster;
	nr = 6;
	condition = DIA_Buster_TeachTrophyShadowbeast_Condition;
	information = DIA_Buster_TeachTrophyShadowbeast_Info;
	permanent = TRUE;
	description = "� ��� ����� ��������� ���������?";
};


func int DIA_Buster_TeachTrophyShadowbeast_Condition()
{
	if((MIS_Buster_KillShadowbeasts_DJG != FALSE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Buster_TeachTrophyShadowbeast_Info()
{
	AI_Output(other,self,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03");	//� ��� ����� ��������� ���������?
	AI_Output(self,other,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04");	//�� ����� �� ������? ��, ������, � ����� � ���� �����.
	if(Buster_TrophyTeacher == FALSE)
	{
		Log_CreateTopic(TOPIC_SoldierTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_SoldierTeacher,"������ ����� �������� ���, ��� ��������� �������� ���� ����������.");
		Buster_TrophyTeacher = TRUE;
	};
	Info_ClearChoices(DIA_Buster_TeachTrophyShadowbeast);
	Info_AddChoice(DIA_Buster_TeachTrophyShadowbeast,"�������� � ����� �����.",DIA_Buster_TeachTrophyShadowbeast_back);
	Info_AddChoice(DIA_Buster_TeachTrophyShadowbeast,B_BuildLearnString("����� ����.",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn)),DIA_Buster_TeachTrophyShadowbeast_teach);
};


func void DIA_Buster_TeachTrophyShadowbeast_teach()
{
	AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_teach_15_00");	//����� ����.
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_01");	//�����, ������. �������� ���������, � ��� ����� ������ ������ ��� ��� ������ �����.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_02");	//����� ������������ ��� � ��� ��� � ������� �������� ������ ������ ����.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_03");	//��, � ����� ������ ���������� ��� �����, ��������� ��� ��� �����, � ������� ��� ���� � ������.
		if(MIS_Buster_KillShadowbeasts_DJG == LOG_Running)
		{
			AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_04");	//� ��������� ��� ���. � �����, � ���� ���������.
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_back_15_00");	//� ������� � ���� � ������.
		};
	};
	Info_ClearChoices(DIA_Buster_TeachTrophyShadowbeast);
};

func void DIA_Buster_TeachTrophyShadowbeast_back()
{
	DIA_Common_WeWillGetToThatLater();
	if(MIS_Buster_KillShadowbeasts_DJG == LOG_Running)
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_back_13_01");	//�������.
	};
	Info_ClearChoices(DIA_Buster_TeachTrophyShadowbeast);
};

var int BusterTrophyCounter;

instance DIA_Buster_BringTrophyShadowbeast(C_Info)
{
	npc = SLD_802_Buster;
	nr = 5;
	condition = DIA_Buster_BringTrophyShadowbeast_Condition;
	information = DIA_Buster_BringTrophyShadowbeast_Info;
	permanent = TRUE;
	description = "� ������ ���� ��� ���������.";
};


func int DIA_Buster_BringTrophyShadowbeast_Condition()
{
	if((MIS_Buster_KillShadowbeasts_DJG == LOG_Running) && Npc_HasItems(other,ItAt_ShadowHorn) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		if(Npc_HasItems(other,ItAt_ShadowHorn) > 1)
		{
			DIA_Buster_BringTrophyShadowbeast.description = "� ������ ���� ���������� ��� ������ ��������.";
		}
		else
		{
			DIA_Buster_BringTrophyShadowbeast.description = "� ������ ���� ��� ���������.";
		};
		return TRUE;
	};
};

func void DIA_Buster_BringTrophyShadowbeast_Info()
{
	var int BusterTrophyCount;
	var int BusterTrophyGold;
	BusterTrophyCount = Npc_HasItems(other,ItAt_ShadowHorn);
	if(BusterTrophyCount > 1)
	{
		AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_06");	//� ������ ���� ���������� ��� ������ ��������.
	}
	else
	{
		AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_05");	//� ������ ���� ��� ���������.
	};
	AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_07");	//�������. ����� ����. � ������� ���, ���� �������. ��� �����, ��� ����� �������� ����� ��������� ��� ����.
	B_GiveInvItems(other,self,ItAt_ShadowHorn,BusterTrophyCount);
	Npc_RemoveInvItems(self,ItAt_ShadowHorn,BusterTrophyCount);
	AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_08");	//��� ���� ����.
	BusterTrophyGold = BusterTrophyCount * (Value_ShadowHorn + Buster_Bonus);
	CreateInvItems(self,ItMi_Gold,BusterTrophyGold);
	B_GiveInvItems(self,other,ItMi_Gold,BusterTrophyGold);
	B_GivePlayerXP(BusterTrophyCount * XP_BringBusterTrophy);
	BusterTrophyCounter += BusterTrophyCount;
};


instance DIA_Buster_DealerIsDead(C_Info)
{
	npc = SLD_802_Buster;
	nr = 5;
	condition = DIA_Buster_DealerIsDead_Condition;
	information = DIA_Buster_DealerIsDead_Info;
	important = TRUE;
};


func int DIA_Buster_DealerIsDead_Condition()
{
	if((MIS_Buster_KillShadowbeasts_DJG == LOG_Running) && (Kapitel >= 5))
	{
		return TRUE;
	};
};

func void DIA_Buster_DealerIsDead_Info()
{
	AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_00");	//��� �������� �� ������ ������� ���������� ������.
	AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_01");	//��� ��� ������?
	AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_02");	//�� �����. ������ �������� ��� ���� ����. ������ � ��� ����� �� ����, ��� � ���� ������.
	MIS_Buster_KillShadowbeasts_DJG = LOG_SUCCESS;
	if((BusterTrophyCounter > 0) || Npc_HasItems(other,ItAt_ShadowHorn))
	{
		B_GivePlayerXP(XP_AmbientKap5);
	}
	else
	{
		B_CheckLog();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Buster_Perm4(C_Info)
{
	npc = SLD_802_Buster;
	nr = 9;
	condition = DIA_Buster_Perm4_Condition;
	information = DIA_Buster_Perm4_Info;
	permanent = TRUE;
	description = "��� �� ������� �� ��������� �� ��������?";
};


func int DIA_Buster_Perm4_Condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Buster_Perm4_Info()
{
	AI_Output(other,self,"DIA_Buster_Perm4_15_00");	//��� �� ������� �� ��������� �� ��������?
	AI_Output(self,other,"DIA_Buster_Perm4_13_01");	//��� ����� ����� ���������� ����� ���� ������ - ���� �� ������� � ����.
	AI_Output(self,other,"DIA_Buster_Perm4_13_02");	//� � ����������� �������� � ��.
};

