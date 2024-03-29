
instance DIA_Jarvis_EXIT(C_Info)
{
	npc = SLD_808_Jarvis;
	nr = 999;
	condition = DIA_Jarvis_EXIT_Condition;
	information = DIA_Jarvis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jarvis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jarvis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jarvis_Hello(C_Info)
{
	npc = SLD_808_Jarvis;
	nr = 1;
	condition = DIA_Jarvis_Hello_Condition;
	information = DIA_Jarvis_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jarvis_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_Hello_Info()
{
	AI_Output(self,other,"DIA_Jarvis_Hello_04_00");	//��! � ���� ������-�� ����?
	AI_Output(other,self,"DIA_Jarvis_Hello_15_01");	//����� ����. � ���� ��� � �������.
	AI_Output(self,other,"DIA_Jarvis_Hello_04_02");	//�����... ��� ���� �����?
};


instance DIA_Jarvis_DieLage(C_Info)
{
	npc = SLD_808_Jarvis;
	nr = 2;
	condition = DIA_Jarvis_DieLage_Condition;
	information = DIA_Jarvis_DieLage_Info;
	permanent = FALSE;
	description = "��� ��������?";
};


func int DIA_Jarvis_DieLage_Condition()
{
	return TRUE;
};

func void DIA_Jarvis_DieLage_Info()
{
	AI_Output(other,self,"DIA_Jarvis_DieLage_15_00");	//��� ��������?
	AI_Output(self,other,"DIA_Jarvis_DieLage_04_01");	//��������� ������� ��������. �������� ������������� �� ��� �������.
	AI_Output(self,other,"DIA_Jarvis_DieLage_04_02");	//������� � ��� ���� �����������, ��� �� ������ ���������� ����.
};


instance DIA_Jarvis_TwoFronts(C_Info)
{
	npc = SLD_808_Jarvis;
	nr = 3;
	condition = DIA_Jarvis_TwoFronts_Condition;
	information = DIA_Jarvis_TwoFronts_Info;
	permanent = FALSE;
	description = "� ��� ���������, ��� ��������� ��� �������?";
};


func int DIA_Jarvis_TwoFronts_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_TwoFronts_Info()
{
	AI_Output(other,self,"DIA_Jarvis_TwoFronts_15_00");	//� ��� ���������, ��� ��������� ��� �������?
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_01");	//����������� �� ��� ������ �� ������� ������ � ��.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_02");	//�� ��������� �������� �������������� � ��� �����.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_03");	//��� �� �� �������, ��� ���� ����� � ��������� � ������.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_04");	//��� ���-�� ����������, ��� �� ����� ����. �� ������� ��� �������.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_05");	//�� ����������, ��� ����������� ����� ��, �� ������ �� �������� ������� ��������� ������ �� � ��� �����.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_06");	//����������� �� ����� �� �� ��������� ��� �������� �������. �� � ������ ���� ����� ������, ��� �������.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_07");	//�� �������� ����� �� �����������, ����� ����������� ���� ����.
};


instance DIA_Jarvis_LeesPlan(C_Info)
{
	npc = SLD_808_Jarvis;
	nr = 4;
	condition = DIA_Jarvis_LeesPlan_Condition;
	information = DIA_Jarvis_LeesPlan_Info;
	permanent = FALSE;
	description = "�� ������, ��� ���������� ������ ��?";
};


func int DIA_Jarvis_LeesPlan_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_LeesPlan_Info()
{
	AI_Output(other,self,"DIA_Jarvis_LeesPlan_15_00");	//�� ������, ��� ���������� ������ ��?
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_01");	//�� �����, ����� �� �������� � ������ ������� ��������� � ������.
	};
	AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_02");	//�� ��������� �������� ��� ���� � ����� �������. ����� ���������, � �� ���� ������ ������ ����, ����� �������� ������.
	AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_03");	//� �� ����, ��� �� ���������� ���������� ���, �� � ������� ���. �� ������ ��� ������� �������.
};


instance DIA_Jarvis_SylviosPlan(C_Info)
{
	npc = SLD_808_Jarvis;
	nr = 5;
	condition = DIA_Jarvis_SylviosPlan_Condition;
	information = DIA_Jarvis_SylviosPlan_Info;
	permanent = FALSE;
	description = "�� ������, ��� ��������� �������?";
};


func int DIA_Jarvis_SylviosPlan_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_SylviosPlan_Info()
{
	AI_Output(other,self,"DIA_Jarvis_SylviosPlan_15_00");	//�� ������, ��� ��������� �������?
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_01");	//������� �������, ��� ����� ��������� ����������� � ������ �������.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_02");	//�� �������, ��� ���������� �������� �� ��������� ��������� ��� ����� � ����� ��������������� ���� ���������.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_03");	//������� ������ �����, ���������� ������ �� ������� ��������� � ������, ��������� ����������������, �� � ��� �����.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_04");	//�� �� ��������, ��� ��� ������ �� ����, ��� ����� ��������� � ���� ��������.
};


instance DIA_Jarvis_WannaJoin(C_Info)
{
	npc = SLD_808_Jarvis;
	nr = 6;
	condition = DIA_Jarvis_WannaJoin_Condition;
	information = DIA_Jarvis_WannaJoin_Info;
	permanent = FALSE;
	description = "� ���� ����� ���������!";
};


func int DIA_Jarvis_WannaJoin_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_00");	//� ���� ����� ���������!
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_01");	//� �� ������, ��� ��� ������� ����...
	AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_02");	//� ��� ��������?
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_03");	//��, � ������ ���������� ���� �� ����, ���� ������.
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_04");	//� �������� ��������, � ���������� �� ����, ������ ���� ���� ������, ��� �� �� ������� ��!
	SCKnowsSLDVotes = TRUE;
};


instance DIA_Jarvis_MissionKO(C_Info)
{
	npc = SLD_808_Jarvis;
	nr = 7;
	condition = DIA_Jarvis_MissionKO_Condition;
	information = DIA_Jarvis_MissionKO_Info;
	permanent = FALSE;
	description = "� ��� � ������ �������?";
};


func int DIA_Jarvis_MissionKO_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jarvis_WannaJoin) && Npc_KnowsInfo(other,DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_MissionKO_Info()
{
	AI_Output(other,self,"DIA_Jarvis_MissionKO_15_00");	//� ��� � ������ �������?
	AI_Output(self,other,"DIA_Jarvis_MissionKO_04_01");	//��� ������. �������� ���������� ������ �������! ��� ��� ������� ����� ������, � ��� ��.
	AI_Output(self,other,"DIA_Jarvis_MissionKO_04_02");	//� ���� �� ������ �������������� ������ �����, �� ���� ������� ��������� �������� ���������.
	MIS_Jarvis_SldKO = LOG_Running;
	self.aivar[AIV_IGNORE_Murder] = TRUE;
	Log_CreateTopic(TOPIC_JarvisSLDKo,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JarvisSLDKo,LOG_Running);
	if(other.guild == GIL_NONE)
	{
		B_LogEntry(TOPIC_JarvisSLDKo,"������� �����, ����� � ������� ������� ������ �������. ����� �� ����������� �� ����.");
	}
	else
	{
		B_LogEntry(TOPIC_JarvisSLDKo,"������� �����, ����� � ������� ������� ������ �������.");
	};
};


instance DIA_Jarvis_DuellRegeln(C_Info)
{
	npc = SLD_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_DuellRegeln_Condition;
	information = DIA_Jarvis_DuellRegeln_Info;
	permanent = FALSE;
	description = "��� �� ������� ������?";
};


func int DIA_Jarvis_DuellRegeln_Condition()
{
	if(MIS_Jarvis_SldKO == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_DuellRegeln_Info()
{
	AI_Output(other,self,"DIA_Jarvis_DuellRegeln_15_00");	//��� �� ������� ������?
	AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_01");	//�������� � ��������, �� ��� ��������, ���� ���� ��� ���������.
	AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_02");	//� ����, ����� ����� ���� �� ���� �������������: ���� �� �������, ������ �� �������������� ���� ������ ��� ���. ���� ������ ���� ������� �������� ���� ������ � �����!
	B_LogEntry(TOPIC_JarvisSLDKo,"� ��� ���� �� ����� �������������� ���� �������� ������ �����...");
};


instance DIA_Jarvis_SylviosMen(C_Info)
{
	npc = SLD_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_SylviosMen_Condition;
	information = DIA_Jarvis_SylviosMen_Info;
	permanent = FALSE;
	description = "��� �� ��������� ���� �������?";
};


func int DIA_Jarvis_SylviosMen_Condition()
{
	if(MIS_Jarvis_SldKO == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_SylviosMen_Info()
{
	AI_Output(other,self,"DIA_Jarvis_SylviosMen_15_00");	//��� �� ��������� ���� �������?
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_01");	//�� �������. ������ �����, ��� ������� � ��� ������ ���� ������.
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_02");	//����� ���� ���, ��������, ������ � �����.
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_03");	//��������� �������� ���� ����������� �������, ���� �� ������� ��.
	B_LogEntry(TOPIC_JarvisSLDKo,"���� ������� - ��� ��� �������, ��� ������ ���� ������, ���, ��������, ������ � �����.");
};


instance DIA_Jarvis_HowMany(C_Info)
{
	npc = SLD_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_HowMany_Condition;
	information = DIA_Jarvis_HowMany_Info;
	permanent = FALSE;
	description = "� ������� ����� ������� � ������ ��������?";
};


func int DIA_Jarvis_HowMany_Condition()
{
	if(MIS_Jarvis_SldKO == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_HowMany_Info()
{
	AI_Output(other,self,"DIA_Jarvis_HowMany_15_00");	//� ������� ����� ������� � ������ ��������?
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_01");	//���� �� �������� ����� �� ���, �� ��������, �� ���� �� �������.
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_02");	//���� �� �������� - ��� ���� ����.
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_03");	//��� ���� ���������: �� ����� �������� �������� ��������. �� �������� ������ ������ ������� - �� ������� �� ���� �������.
	B_LogEntry(TOPIC_JarvisSLDKo,"������ ����������, ���� � ������� ����� ����� �������. �������, � ����� ������� ��� ����� ���� �� �����������.");
};


instance DIA_Jarvis_HowManyLeft(C_Info)
{
	npc = SLD_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_HowManyLeft_Condition;
	information = DIA_Jarvis_HowManyLeft_Info;
	permanent = TRUE;
	description = "������� ����� ������� ��� ��� ����� �������?";
};


func int DIA_Jarvis_HowManyLeft_Condition()
{
	if((MIS_Jarvis_SldKO == LOG_Running) && Npc_KnowsInfo(other,DIA_Jarvis_HowMany) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_HowManyLeft_Info()
{
	var int victories;
	AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_00");	//������� ����� ������� ��� ��� ����� �������?
	if(MIS_ReadyforChapter4 == TRUE)
	{
		AI_Output(self,other,"DIA_Jarvis_PERM_04_04");	//������� �������-�� ������. ����� ����, ��� �� ������� � ��������, �� �� ������ ������� ���������� � �������.
		MIS_Jarvis_SldKO = LOG_FAILED;
		B_CheckLog();
		self.aivar[AIV_IGNORE_Murder] = FALSE;
	}
	else
	{
		victories = 0;
		if(C_Bullco_Defeated())
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_01");	//� ��������� ������.
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_02");	//� ������. �������.
			victories += 1;
		};
		if(C_Rod_Defeated())
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_03");	//��� ������ ����� ������ �����������.
			victories += 1;
		};
		if(C_Sentenza_Defeated())
		{
			if(Npc_KnowsInfo(other,DIA_Sentenza_Hello))
			{
				AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_04");	//�������� ������� �������� �� ���� ������ - �� ����� ������ ����.
			}
			else
			{
				AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_05");	//� ������� ��������.
			};
			victories += 1;
		};
		if(C_Fester_Defeated())
		{
			if(MIS_Fester_KillBugs == LOG_SUCCESS)
			{
				AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_06");	//������ ������� �������� ���� - ��� ���� ��� ������.
			}
			else
			{
				AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_07");	//������ ������� �� ��������.
			};
			victories += 1;
		};
		if(C_Raoul_Defeated())
		{
			if(victories == 0)
			{
				AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_09");	//� ����� ���������� � ������...
				AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_10");	//�?
			}
			else
			{
				AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_08");	//��� �������� �����...
			};
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_11");	//���������, ��� ��� ������ ���������� �������.
			victories += 1;
		};
		if(victories < 3)
		{
			if(victories == 0)
			{
				AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_12");	//�� ���� �� ������� �� ������ �� ����� �������.
			}
			else
			{
				AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_13");	//������, ��������� � ��� �� ����.
			};
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_14");	//� ����, ����� �� ������� ��� ������� ����� �� ���.
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_15");	//����� ����������, ������ ����������.
			if(victories >= 5)
			{
				AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_16");	//�� �� ���� �������� ����������, ��?
			};
			if(other.guild == GIL_NONE)
			{
				AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_17");	//� ������� - ���� �� ������� ��� ������, � ���������� �� ���� ��� ���������.
				if(Torlof_GenugStimmen == FALSE)
				{
					Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
					Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
				};
				SCKnowsSLDVotes = TRUE;
				B_LogEntry(TOPIC_SLDRespekt,"������� ����������� �� ����, ���� � ���� �������������� � ���������.");
			};
			MIS_Jarvis_SldKO = LOG_SUCCESS;
			self.aivar[AIV_IGNORE_Murder] = FALSE;
			B_GivePlayerXP(XP_Ambient * victories);
		};
	};
};


var int Jarvis_GuildComment;
var int Jarvis_SylvioComment;

instance DIA_Jarvis_PERM(C_Info)
{
	npc = SLD_808_Jarvis;
	nr = 8;
	condition = DIA_Jarvis_PERM_Condition;
	information = DIA_Jarvis_PERM_Info;
	permanent = FALSE;
	description = "���� �������?";
};


func int DIA_Jarvis_PERM_Condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_PERM_Info()
{
	AI_Output(other,self,"DIA_Jarvis_PERM_15_00");	//���� �������?
	if(Kapitel <= 3)
	{
		if(Jarvis_GuildComment == FALSE)
		{
			if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
			{
				AI_Output(self,other,"DIA_Jarvis_PERM_04_01");	//������ �� ���� �� ���. ��� ������.
			}
			else
			{
				AI_Output(self,other,"DIA_Jarvis_PERM_04_02");	//�� ������ �������� �����, �� ��� �� ����� ����� �� ���.
			};
			Jarvis_GuildComment = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_03");	//��������� ����� ���� ������� ����� �����-�� �����������. (������� ������)
		};
	};
	if(Kapitel >= 4)
	{
		if(Jarvis_SylvioComment == FALSE)
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_04");	//������� �������-�� ������. ����� ����, ��� �� ������� � ��������, �� �� ������ ������� ���������� � �������.
			AI_Output(self,other,"DIA_Jarvis_PERM_04_05");	//��, ��������, ������, ��� ��� ����� �����.
			Jarvis_SylvioComment = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_06");	//���, ���� ��� ��������. ��� ����� ���������, ��� ��� ��� ��������.
		};
	};
};

