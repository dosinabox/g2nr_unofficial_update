
instance DIA_Fajeth_EXIT(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 999;
	condition = DIA_Fajeth_EXIT_Condition;
	information = DIA_Fajeth_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fajeth_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fajeth_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Fajeth_First(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 2;
	condition = DIA_Fajeth_First_Condition;
	information = DIA_Fajeth_First_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fajeth_First_Condition()
{
	if((Kapitel == 2) && (MIS_ScoutMine == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_First_Info()
{
	AI_Output(self,other,"DIA_Fajeth_First_12_00");	//��� �� ����� � ��� �� ������� �����?
	AI_Output(other,self,"DIA_Fajeth_First_15_01");	//� ������ �� ������� ����� ������...
	AI_Output(self,other,"DIA_Fajeth_First_12_02");	//����� ���� ����� ���������� ��������� �� �����. ����������� ������ ���. �� ����������������� ���� �����������.
	AI_StopProcessInfos(self);
};


instance DIA_Fajeth_Hallo(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 2;
	condition = DIA_Fajeth_Hallo_Condition;
	information = DIA_Fajeth_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fajeth_Hallo_Condition()
{
	if((Kapitel == 2) && (MIS_ScoutMine == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_Hallo_Info()
{
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_00");	//������ �� ������?
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_01");	//� ������ �� ������� �������...
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_02");	//����� ������. ��� ����� ����� ����� ����.
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_03");	//� ����� �� ��� ����, ����� �������� ����.
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_04");	//���? ����� ����� �� ������?
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_05");	//� ��� ������ ������ ��������, ������� ���� ������ � ���������� �������.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_06");	//�, �������������� ���. ���� ����������� ������� � ���� � ���� ����� �����������.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_07");	//�� ���� �� ����� ����������, ���� �� �� ���� ������������ ������ ���� ������� ����, ����� ������ ���.
		Info_AddChoice(DIA_Fajeth_Hallo,"��� � ���� ������� ��� ����?",DIA_Fajeth_Hallo_Tun);
		Info_AddChoice(DIA_Fajeth_Hallo,"��� ������� ������. � �� ���� ������ ����.",DIA_Fajeth_Hallo_KDFNein);
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_08");	//��� ������ - ��������� ��� ����, ������� � ����� ������������ ��� ������ ���� � ��� �� ������.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_09");	//��� �������� � ���������� �����. �� ������� ������ - �������������, �� ������ ��������� ��� �������.
		Info_AddChoice(DIA_Fajeth_Hallo,"��� � ���� ������� ��� ����?",DIA_Fajeth_Hallo_Tun);
		Info_AddChoice(DIA_Fajeth_Hallo,"� ���� ��� ���� ������. �� �������.",DIA_Fajeth_Hallo_MILNein);
	}
	else
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_10");	//�������� - � �� ����, ����� ������ ������� ��� ��������, ��, ������ ����, � ���� ���� �� �� �������.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_11");	//�� ������ ��� � �������� ���� �����, �� ������ ��������� ���� ������� ��� ����.
		Info_AddChoice(DIA_Fajeth_Hallo,"� ����� ���� ���� ����. ���� �� ��������� ���, ��������, � � ���������.",DIA_Fajeth_Hallo_SLDJa);
		Info_AddChoice(DIA_Fajeth_Hallo,"���, � ���� ��� ������� �� ��, ����� ������ ���� ��������.",DIA_Fajeth_Hallo_SLDNein);
	};
};

func void DIA_Fajeth_Hallo_Tun()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_Tun_15_00");	//��� � ���� ������� ��� ����?
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_01");	//��� ��� ��������� ���� ���� ��������� ������ ������ ������ ������. ������, ��� ������ �������� ���������� ����������� ��� ���������.
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_02");	//� �� ����, ���� ��� ���� - �� ���� ��� �����, � ������ �� ����� �����������.
	if(!Npc_IsDead(Fed))
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_03");	//���, ������ ����� �������, ������� ��� �� ������ - � ������ � ��� ��������� �����������.
	};
	if(!Npc_IsDead(Bilgot))
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_04");	//� ���� ��� �������? �������? �� - �� ���� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_04_add");	//� ���� ��� �������?
	};
	if(!Npc_IsDead(Tengron))
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_05");	//��������? �������, �� ����� ���������, �� �� �� �������� ��������� ��������.
	};
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_06");	//�� ������������, ��� ����� ������� ���. � ����, ����� �� �������� ���� �������� ������ � ���� ��.
	Wld_InsertNpc(NewMine_Snapper7,"OW_PATH_333");
	Wld_InsertNpc(NewMine_Snapper8,"OW_PATH_333");
	Wld_InsertNpc(NewMine_Snapper3,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
	MIS_Fajeth_Kill_Snapper = LOG_Running;
	Log_CreateTopic(TOPIC_FajethKillSnapper,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FajethKillSnapper,LOG_Running);
	B_LogEntry(TOPIC_FajethKillSnapper,"������ ��� ��� �������: ����������� �� ���������, ������� ������ ������ ������ �����.");
	Info_ClearChoices(DIA_Fajeth_Hallo);
};

func void DIA_Fajeth_Hallo_KDFNein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_KDFNein_15_00");	//��� ������� ������. � �� ���� ������ ����.
	AI_Output(self,other,"DIA_Fajeth_Hallo_KDFNein_12_01");	//�������, �, ��������������. � ������ ���� ���, ��� �� ������� �����.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
};

func void DIA_Fajeth_Hallo_MILNein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_MILNein_15_00");	//� ���� ��� ���� ������. �� �������.
	AI_Output(self,other,"DIA_Fajeth_Hallo_MILNein_12_01");	//� �� ��������� ���. �� ������ ����� ����, ��� � ������ ����.
	AI_Output(self,other,"DIA_Fajeth_Hallo_MILNein_12_02");	//������������, ��� � ���� ������� �� ���� - ��� '��� � ���� �������?'. �������?
};

func void DIA_Fajeth_Hallo_SLDJa()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SLDJa_15_00");	//� ����� ���� ���� ����. ���� �� ��������� ���, ��������, � � ���������.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_01");	//� �� ������ ����� ���� � ����������. � �������� �����������, ����� ������� ����.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_02");	//�� � ���� ���������� ���� ������ ����, � ������� ���� 100 �������, ���� �� ��������� ��� ������ ��� ����.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_03");	//�� ���, �� �����?
	Fajeth_Pay = TRUE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
	Info_AddChoice(DIA_Fajeth_Hallo,"��� � ���� ������� ��� ����?",DIA_Fajeth_Hallo_Tun);
	Info_AddChoice(DIA_Fajeth_Hallo,"���, � ���� ��� ������� �� ��, ����� ������ ���� ��������.",DIA_Fajeth_Hallo_SLDNein);
};

func void DIA_Fajeth_Hallo_SLDNein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SLDNein_15_00");	//���, � ���� ��� ������� �� ��, ����� ������ ���� ��������.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDNein_12_01");	//�� ����� ��� ����� ���������� �� ������ �����? �� ������ ������ �� ��������.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDNein_12_02");	//��� ��� �� �� ������ ������ ���, ������� ���� ������� � ����������.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
};


instance DIA_Fajeth_Leader(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 2;
	condition = DIA_Fajeth_Leader_Condition;
	information = DIA_Fajeth_Leader_Info;
	permanent = FALSE;
	description = "� ���� ������ ����.";
};


func int DIA_Fajeth_Leader_Condition()
{
	if((MIS_Fajeth_Kill_Snapper == LOG_Running) && (NewMine_LeadSnapper_Spawned == TRUE))
	{
		if(Npc_IsDead(NewMine_LeadSnapper))
		{
			return TRUE;
		};
	};
};

func void DIA_Fajeth_Leader_Info()
{
	AI_Output(other,self,"DIA_Fajeth_Leader_15_00");	//� ���� ������ ����.
	AI_Output(self,other,"DIA_Fajeth_Leader_12_01");	//������. ��� ������ ��� ����� �� ��� ������. � �� �����, ��� ������ ��� ������� ������� �� ���.
	if(Fajeth_Pay == TRUE)
	{
		AI_Output(self,other,"DIA_Fajeth_Leader_12_02");	//��� ��� ������ - ��� ��������������.
		B_GiveInvItems(self,other,ItMi_Gold,100);
	};
	self.flags = 0;
	MIS_Fajeth_Kill_Snapper = LOG_SUCCESS;
	B_GivePlayerXP(XP_FajethKillSnapper);
};


instance DIA_Fajeth_SNAPPER_KILLED(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 9;
	condition = DIA_Fajeth_SNAPPER_KILLED_Condition;
	information = DIA_Fajeth_SNAPPER_KILLED_Info;
	permanent = TRUE;
	description = "�� ���������� ���������.";
};


func int DIA_Fajeth_SNAPPER_KILLED_Condition()
{
	if(MIS_Fajeth_Kill_Snapper == LOG_Running)
	{
		if(C_FajethSnappersDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Fajeth_SNAPPER_KILLED_Info()
{
	AI_Output(other,self,"DIA_Fajeth_SNAPPER_KILLED_15_00");	//�� ���������� ���������.
	AI_Output(self,other,"DIA_Fajeth_SNAPPER_KILLED_12_01");	//�������� ������. � � ���������� ������� �� ���� ����������.
	if(Fajeth_Pay == TRUE)
	{
		AI_Output(self,other,"DIA_Fajeth_SNAPPER_KILLED_12_02");	//�� ��������� ���� ������ - ��� 100 �����, ��� � ��������������.
		B_GiveInvItems(self,other,ItMi_Gold,100);
	};
	self.flags = 0;
	MIS_Fajeth_Kill_Snapper = LOG_SUCCESS;
	B_GivePlayerXP(XP_FajethKillSnapper);
};


instance DIA_Fajeth_Running(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 9;
	condition = DIA_Fajeth_Running_Condition;
	information = DIA_Fajeth_Running_Info;
	permanent = TRUE;
	description = "��� ���������� � ����� �����?";
};


func int DIA_Fajeth_Running_Condition()
{
	if(MIS_Fajeth_Kill_Snapper == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Fajeth_Running_Info()
{
	AI_Output(other,self,"DIA_Fajeth_Running_15_00");	//��� ���������� � ����� �����?
	AI_Output(self,other,"DIA_Fajeth_Running_12_01");	//�� ������ ������, ������ ���������� ���� �����? �� ��� ��� ����� �������� �� ������!
	AI_Output(self,other,"DIA_Fajeth_Running_12_02");	//��������� � ����� ����������, ��� ���-������ ��������!
};


instance DIA_Fajeth_BELOHNUNG(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 3;
	condition = DIA_Fajeth_BELOHNUNG_Condition;
	information = DIA_Fajeth_BELOHNUNG_Info;
	permanent = FALSE;
	description = "����� ���, ������� ���� ������� ��� ������.";
};


func int DIA_Fajeth_BELOHNUNG_Condition()
{
	if((MIS_Fajeth_Kill_Snapper == LOG_SUCCESS) || (MIS_Fajeth_Kill_Snapper == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_BELOHNUNG_Info()
{
	AI_Output(other,self,"DIA_Fajeth_BELOHNUNG_15_00");	//����� ���, ������� ���� ������� ��� ������.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_01");	//������ �������, ��� �� ������ ������ ������ ��� ����� ����.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_02");	//��-�� ���������� ��������� �� ��� �� �������� ����� ����� �����.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_03");	//���� ������ ������ �������� ������������, �� ������ �������� ������ ����.
	AI_Output(other,self,"DIA_Fajeth_BELOHNUNG_15_04");	//�������. � ��� � ������� ���.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_05");	//������. �� �������� �� ����. � ����� ���������� ���� ������� �� ����������.
	Fajeth_Ore = TRUE;
	B_LogEntry(TOPIC_ScoutMine,"��������� ������� ������ ������ ��� ����� ����.");
	AI_StopProcessInfos(self);
};


instance DIA_Fajeth_Perm2(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 9;
	condition = DIA_Fajeth_Perm2_Condition;
	information = DIA_Fajeth_Perm2_Info;
	permanent = TRUE;
	description = "��� ���� ������ ����?";
};


func int DIA_Fajeth_Perm2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fajeth_BELOHNUNG) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_Perm2_Info()
{
	AI_Output(other,self,"DIA_Fajeth_Perm2_15_00");	//��� ���� ������ ����?
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_01");	//�����. ��������� ����� ���.
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_02");	//����� �� ������� ����, ������� ��� ��� ������ - �� ������ ��� ����� �� �������� ����� ������, ����� ��������. ������ ��������.
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_03");	//�� �� �� �������� - �� ������� ����, ���� � �������� �����.
};


instance DIA_Fajeth_ERZABBAU(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 11;
	condition = DIA_Fajeth_ERZABBAU_Condition;
	information = DIA_Fajeth_ERZABBAU_Info;
	permanent = TRUE;
	description = "��� ���� ������ ����?";
};


func int DIA_Fajeth_ERZABBAU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fajeth_BELOHNUNG) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_ERZABBAU_Info()
{
	AI_Output(other,self,"DIA_Fajeth_ERZABBAU_15_00");	//��� ���� ������ ����?
	if(MIS_AllDragonsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_01");	//����� ����� ���������. � ���� �� ���?
		AI_Output(other,self,"DIA_Fajeth_ERZABBAU_15_02");	//������� ������.
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_03");	//��, ����� � �������, ��� ������������ ����� �������. � ��� ����� ����� ����� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_04");	//�� �� ��� ��� ������...
	};
};

