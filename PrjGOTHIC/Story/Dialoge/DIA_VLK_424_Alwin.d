
instance DIA_Alwin_EXIT(C_Info)
{
	npc = VLK_424_Alwin;
	nr = 999;
	condition = DIA_Alwin_EXIT_Condition;
	information = DIA_Alwin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alwin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alwin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alwin_Sheep(C_Info)
{
	npc = VLK_424_Alwin;
	nr = 3;
	condition = DIA_Alwin_Sheep_Condition;
	information = DIA_Alwin_Sheep_Info;
	permanent = FALSE;
	description = "��� ���� ����?";
};


func int DIA_Alwin_Sheep_Condition()
{
	if(!C_AlwinSheepsDead())
	{
		return TRUE;
	};
};

func void DIA_Alwin_Sheep_Info()
{
	AI_Output(other,self,"DIA_Alwin_Sheep_15_00");	//��� ���� ����?
	AI_Output(self,other,"DIA_Alwin_Sheep_12_01");	//������������ ����, ��� ����������� ���, ���������� �� ��� ����. (�������) ��� ��� ���� - ����.
	if(SC_KnowsKlosterTribut == TRUE)
	{
		DIA_Common_CanIBuySheep();
	};
	AI_Output(self,other,"DIA_Alwin_Sheep_12_02");	//��� ���� ����������� ���������. ��� �������� �� � �������� � �������� �� ���.
};


instance DIA_Alwin_Fellan(C_Info)
{
	npc = VLK_424_Alwin;
	nr = 2;
	condition = DIA_Alwin_Fellan_Condition;
	information = DIA_Alwin_Fellan_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alwin_Fellan_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && !Npc_IsDead(Fellan))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Fellan_Info()
{
	AI_Output(self,other,"DIA_Alwin_Fellan_12_00");	//��, ���� ���� ������� ����� ������������ ����� � ���� ������ � ���.
	AI_Output(other,self,"DIA_Alwin_Fellan_15_01");	//� ��� �� ��������?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_02");	//����� �� �� ������� ���� �������? ���, ��� �� �������, ������� ��� �������� � �������� ��������?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_03");	//� ���� � ���� ����� ����� �������. �� ������ �������� �� ����� ������ ������ ����.
};


instance DIA_Alwin_FellanRunning(C_Info)
{
	npc = VLK_424_Alwin;
	nr = 2;
	condition = DIA_Alwin_FellanRunning_Condition;
	information = DIA_Alwin_FellanRunning_Info;
	permanent = FALSE;
	description = "� ���� ���������� � ��������...";
};


func int DIA_Alwin_FellanRunning_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alwin_Fellan))
	{
		return TRUE;
	};
};

func void DIA_Alwin_FellanRunning_Info()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_00");	//� ���� ���������� � ��������...
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_01");	//�� ������ ������ ���? � ����� ���� ���?
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_02");	//�� ����� ���.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_03");	//��, ��� �� ���! ������ - ���� �� ��������� ��� ��������� ��������, � ������� ���� 25 ������� �����.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_04");	//�� � ����� ���� ����� - �� �� ������� ��������� ����� �����. �� ����� � ���. ������������, ��� ����� ������, ��� ��������� ������� �������!
	MIS_AttackFellan = LOG_Running;
	Log_CreateTopic(TOPIC_Alwin,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Alwin,LOG_Running);
	B_LogEntry(TOPIC_Alwin,"����� �����, ����� � �������� ������� ��������� �������� ��������. �������, ������� ��� �� ��� �� �����.");
	Info_ClearChoices(DIA_Alwin_FellanRunning);
	Info_AddChoice(DIA_Alwin_FellanRunning,"� ��������, ��� ����� �������...",DIA_Alwin_FellanRunning_Ok);
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		Info_AddChoice(DIA_Alwin_FellanRunning,"���� � ����� ���� ���, � ���� ����� �������� � ����������...",DIA_Alwin_FellanRunning_Problems);
	};
};

func void DIA_Alwin_FellanRunning_Ok()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Ok_15_00");	//� ��������, ��� ����� �������...
	AI_Output(self,other,"DIA_Alwin_FellanRunning_Ok_12_01");	//������� �� ����. � �����, � ������� ���� 25 �������.
	Info_ClearChoices(DIA_Alwin_FellanRunning);
};

func void DIA_Alwin_FellanRunning_Problems()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Problems_15_00");	//���� � ����� ���� ���, � ���� ����� �������� � ����������...
	AI_Output(self,other,"DIA_Alwin_Add_12_00");	//�����, � �����, ����� �� �������� �������� �� �����...
	AI_Output(self,other,"DIA_Alwin_Add_12_01");	//�� ���� �� �������� ���-������, ��� ������ ����, � ���� ����� ������� ��������.
};


instance DIA_Alwin_FellanSuccess(C_Info)
{
	npc = VLK_424_Alwin;
	nr = 4;
	condition = DIA_Alwin_FellanSuccess_Condition;
	information = DIA_Alwin_FellanSuccess_Info;
	permanent = FALSE;
	description = "������ ������ �� ����� �������.";
};


func int DIA_Alwin_FellanSuccess_Condition()
{
	if((MIS_AttackFellan == LOG_Running) && ((FellanGeschlagen == TRUE) || Npc_IsDead(Fellan)))
	{
		return TRUE;
	};
};

func void DIA_Alwin_FellanSuccess_Info()
{
	AI_Output(other,self,"DIA_Alwin_FellanSuccess_15_00");	//������ ������ �� ����� �������.
	if(!Npc_IsDead(Fellan))
	{
		AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_01");	//���� ��! ������ ��� ����� �����. �������-��. � �� �����, �� ������� �� ����������.
		AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_02");	//�� ������ ��� ������� ������. ������ ���, � ��� ���� 30 ������� �����.
		B_GiveInvItems(self,other,ItMi_Gold,30);
		MIS_AttackFellan = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		B_Say(self,other,"$YOUMURDERER");
		B_Say(self,other,"$GETOUTOFHERE");
		MIS_AttackFellan = LOG_FAILED;
		B_MemorizePlayerCrime(self,other,CRIME_MURDER);
		B_CheckLog();
		AI_StopProcessInfos(self);
	};
};


func void B_AlwinAboutDeadSheeps()
{
	AI_Output(self,other,"DIA_Alwin_Endlos_12_13");	//��, ������ � ���� �� ���� ��������� ������ ������� �� ����� �����.
};

instance DIA_Alwin_Endlos(C_Info)
{
	npc = VLK_424_Alwin;
	nr = 8;
	condition = DIA_Alwin_Endlos_Condition;
	information = DIA_Alwin_Endlos_Info;
	permanent = TRUE;
	description = "��� ���� ����?";
};


func int DIA_Alwin_Endlos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alwin_Sheep))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Endlos_Info()
{
	AI_Output(other,self,"DIA_Alwin_Endlos_15_00");	//��� ���� ����?
	if(C_AlwinSheepsDead())
	{
		B_AlwinAboutDeadSheeps();
	}
	else if((MIS_AttackFellan != LOG_SUCCESS) && !Npc_IsDead(Fellan))
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_01");	//���� ����� ������� ������ �� � ���. ������� ��� ��� ����������.
	}
	else if(Kapitel <= 2)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_02");	//���� ���� � ���������� ��� ����� � �����. ����� ��� ��� ����. (������ �������)
	}
	else if(Kapitel == 3)
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_03");	//�, �������, ����� ���� �� ���. �� ���� ��� ��������� �������!
			AI_Output(other,self,"DIA_Alwin_Endlos_15_04");	//��� ����?
			AI_Output(self,other,"DIA_Alwin_Endlos_12_05");	//��� ��������, ������� ���� ��������. ������� ��, ��� ������.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_06");	//��� ������ ����� ������, ����� �� ��� ��������� �� �����.
		}
		else
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_07");	//���� ����� �������, ��� ��� �������� � �����.
			AI_Output(other,self,"DIA_Alwin_Endlos_15_08");	//� �����, ��� ���� - ��� ���� ����.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_09");	//���������, �� � ����� ������ ��� ���� ����. � ���� � ���� ����, ������� ���� ������������� ��� ��������� ������� �������.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_10");	//�� ��� ��������� ������. ���� ������ ���� ����.
		};
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_11");	//���������� ������, �������� �� ���, ��� ���� ���� - ����� �����!
	}
	else
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_12");	//� ������ �� '��������'. ���� ����� ��������, ����� ��� ���� ����� �� �������� ��� ��� �����.
		B_AlwinAboutDeadSheeps();
	};
};

