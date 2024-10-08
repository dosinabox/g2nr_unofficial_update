
instance DIA_Babo_Kap1_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap1_EXIT_Condition;
	information = DIA_Babo_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Babo_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Hello(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Hello_Condition;
	information = DIA_Babo_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Babo_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_Hello_Info()
{
	AI_Output(self,other,"DIA_Babo_Hello_03_00");	//(���������) ������, �� ���� ������� �����, ��?
	AI_Output(other,self,"DIA_Babo_Hello_15_01");	//��. �� ����� �����?
	AI_Output(self,other,"DIA_Babo_Hello_03_02");	//������ ������. ���� ��� ������ ������ �����?
	AI_Output(other,self,"DIA_Babo_Hello_15_03");	//���� ���.
	AI_Output(self,other,"DIA_Babo_Hello_03_04");	//����� ������ ��� ����. ��, ����������, ������ ����� � �������, ����� ��������, ��� �� �������� �������� ����. �� ������ ���������?
	CreateInvItem(other,ItMw_1h_Nov_Mace);
	AI_PrintScreen("������ ����� ��������",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	AI_Output(other,self,"DIA_Babo_Hello_15_05");	//��, ��� ��������� ������������ �������...
	AI_Output(self,other,"DIA_Babo_Hello_03_06");	//���� ������, � ���� ������� ���� ���-����. �� � ���� ���� �������...
};


instance DIA_Babo_Anliegen(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Anliegen_Condition;
	information = DIA_Babo_Anliegen_Info;
	permanent = FALSE;
	description = "��� �� �������?";
};


func int DIA_Babo_Anliegen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_Hello) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_Anliegen_Info()
{
	AI_Output(other,self,"DIA_Babo_Anliegen_15_00");	//��� �� �������?
	AI_Output(self,other,"DIA_Babo_Anliegen_03_01");	//��, ���� �� ���������, ������, ������ ����� � ���������.
	AI_Output(self,other,"DIA_Babo_Anliegen_03_02");	//���� �� ������� ������� ��� ���� ��� ��������� ������, ����� � ���������� ����.
	if(!Npc_IsDead(Sergio))
	{
		AI_Output(other,self,"DIA_Babo_Anliegen_15_03");	//� ��������, ��� ����� �������.
		MIS_Babo_Training = LOG_Running;
		Log_CreateTopic(Topic_BaboTrain,LOG_MISSION);
		Log_SetTopicStatus(Topic_BaboTrain,LOG_Running);
		B_LogEntry(Topic_BaboTrain,"���� � ����� ������� �������� ������ ������� ��������������� � ����, �� ������ ���� ��������� ��������� � ��������� �������.");
	}
	else
	{
		DIA_Common_HeIsDead();
		AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01_add");	//(�����������) ���?! ��� ��� ��� ������?
		DIA_Common_EverythingWillBeAlright();
	};
};


func void B_BaboIsTeacher()
{
	if(Babo_TeachPlayer == FALSE)
	{
		AI_Output(self,other,"DIA_Babo_Sergio_03_02");	//���� ������, � ����� ���� �������� ���� ��������� �������� ������� ���������.
		Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher,"���� ����� ������� ���� ��������� ��������� � ��������� �������.");
		Babo_TeachPlayer = TRUE;
	};
};

instance DIA_Babo_Sergio(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Sergio_Condition;
	information = DIA_Babo_Sergio_Info;
	permanent = FALSE;
	description = "� ��������� � ������. �� ����� ����������� ���� �� ��� ���� ������ ����, � ���� �����.";
};


func int DIA_Babo_Sergio_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sergio_Babo) && !Npc_IsDead(Sergio))
	{
		return TRUE;
	};
};

func void DIA_Babo_Sergio_Info()
{
	AI_Output(other,self,"DIA_Babo_Sergio_15_00");	//� ��������� � ������. �� ����� ����������� ���� �� ��� ���� ������ ����, � ���� �����.
	AI_Output(self,other,"DIA_Babo_Sergio_03_01");	//�������! ����� ����� ��� ����!
	B_BaboIsTeacher();
	if(MIS_HelpBabo == LOG_SUCCESS)
	{
		Npc_ExchangeRoutine(self,"GARDENANDTRAIN");
	}
	else
	{
		Npc_ExchangeRoutine(self,"TRAIN");
	};
	MIS_Babo_Training = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient * 2);
};


var int DIA_Babo_Teach_permanent;
var int Babo_Labercount;

func void B_BuildLearnDialog_Babo()
{
	if(VisibleTalentValue(NPC_TALENT_2H) < TeachLimit_2H_Babo)
	{
		Info_ClearChoices(DIA_Babo_Teach);
		Info_AddChoice(DIA_Babo_Teach,Dialog_Back,DIA_Babo_Teach_Back);
		Info_AddChoice(DIA_Babo_Teach,B_BuildLearnTalentString(other,NPC_TALENT_2H,1),DIA_Babo_Teach_2H_1);
		Info_AddChoice(DIA_Babo_Teach,B_BuildLearnTalentString(other,NPC_TALENT_2H,5),DIA_Babo_Teach_2H_5);
	}
	else
	{
		if(RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Babo)
		{
			DIA_Babo_Teach_permanent = TRUE;
		};
		PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_2H_Babo)),-1,53,FONT_Screen,2);
		AI_Output(self,other,"DIA_DIA_Babo_Teach_Back_03_00");	//�� ������ ������ � ��������� ������, ��� � ��� �� ������� ����.
		AI_StopProcessInfos(self);
	};
};

func void B_BaboTeachComment()
{
	if(Babo_Labercount == 0)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_03_00");	//�������� �� ������. ����� - ���� �����, � ���� ���� ������� ���� ����.
	}
	else if(Babo_Labercount == 1)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_03_01");	//����� ������ ������� �� ����������� ���������� - �� �������� ���!
	}
	else if(Babo_Labercount == 2)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_03_02");	//���� �� �� �� ��� - ������ ���� � ����� ���� �����.
	}
	else if(Babo_Labercount == 3)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_03_03");	//����� ������ ������ ����� � ���. ���� � ���� ��� ������� �����, ���� ����� - ���� ����� ������ ������� �������.
	}
	else if(Babo_Labercount == 4)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_00");	//����� ������ ��������� �� ������ ����� �������, �� ����� � ����� �������.
	}
	else if(Babo_Labercount == 5)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_01");	//�� ������ ��������, �� ������ ������� �� ������ ���������.
	}
	else if(Babo_Labercount == 6)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_02");	//�����, �� ������ ����������, ����� �� ������������� ���������� � �� ����� ��� ����� �������������� ����.
	}
	else if(Babo_Labercount == 7)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_03");	//����� �� �������� ���, �� ������ �������.
	};
	Babo_Labercount += 1;
	if(Babo_Labercount > 7)
	{
		Babo_Labercount = 0;
	};
};

instance DIA_Babo_Teach(C_Info)
{
	npc = NOV_612_Babo;
	nr = 100;
	condition = DIA_Babo_Teach_Condition;
	information = DIA_Babo_Teach_Info;
	permanent = TRUE;
	description = "� ����� � ��������.";
};


func int DIA_Babo_Teach_Condition()
{
	if((Babo_TeachPlayer == TRUE) && (DIA_Babo_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Babo_Teach_Info()
{
	AI_Output(other,self,"DIA_Babo_Teach_15_00");	//� ����� � ��������.
	B_BuildLearnDialog_Babo();
};

func void DIA_Babo_Teach_Back()
{
	Info_ClearChoices(DIA_Babo_Teach);
};

func void DIA_Babo_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,TeachLimit_2H_Babo))
	{
		B_BaboTeachComment();
		B_BuildLearnDialog_Babo();
	};
};

func void DIA_Babo_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,TeachLimit_2H_Babo))
	{
		B_BaboTeachComment();
		B_BuildLearnDialog_Babo();
	};
};

instance DIA_Babo_Wurst(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Wurst_Condition;
	information = DIA_Babo_Wurst_Info;
	permanent = FALSE;
	description = "���, ����� �������.";
};


func int DIA_Babo_Wurst_Condition()
{
	if(C_CanFeedNOV(self))
	{
		return TRUE;
	};
};

func void DIA_Babo_Wurst_Info()
{
	AI_Output(other,self,"DIA_Babo_Wurst_15_00");	//���, ����� �������.
	AI_WaitTillEnd(self,other);
	B_FeedNOV(self);
	AI_Output(self,other,"DIA_Babo_Wurst_03_01");	//�-�-�, ������� �������, �������! ����� ����������� ���� - �-�-�, ��� ��� ��� ���� ��������!
	AI_Output(other,self,"DIA_Babo_Wurst_15_02");	//����� � ���� �� ������ ������� ��� ������.
	AI_Output(self,other,"DIA_Babo_Wurst_03_03");	//� ���� ��� ����� �� ���� �������� ������, ��� �����. ��, �� ��, ��� ������������� ��� ����. �� �� ������. ��� �� ����� ������ �����-�� �������?
	AI_Output(self,other,"DIA_Babo_Wurst_03_04");	//�� ��, � ��� ���� �� ��� ������ '�������� ������'.
	Info_ClearChoices(DIA_Babo_Wurst);
	if(Npc_HasItems(other,ItFo_Schafswurst))
	{
		Info_AddChoice(DIA_Babo_Wurst,"������, ����� ��� ���� �������.",DIA_Babo_Wurst_JA);
	};
	Info_AddChoice(DIA_Babo_Wurst,"���, � �� ������ �����.",DIA_Babo_Wurst_NEIN);
};

func void DIA_Babo_Wurst_JA()
{
	AI_Output(other,self,"DIA_Babo_Wurst_JA_15_00");	//������, ����� ��� ���� �������.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	AI_Output(self,other,"DIA_Babo_Wurst_JA_03_01");	//�������. ��� ���� ������.
	B_GiveInvItems(self,other,ItSc_Firebolt,1);
	Info_ClearChoices(DIA_Babo_Wurst);
};

func void DIA_Babo_Wurst_NEIN()
{
	AI_Output(other,self,"DIA_Babo_Wurst_NEIN_15_00");	//���, � �� ������ �����.
	AI_Output(self,other,"DIA_Babo_Wurst_NEIN_03_01");	//������, �� ���, ���� �� ��� �����, ��� ����� ���������� ��������� �� �����, �?
	Info_ClearChoices(DIA_Babo_Wurst);
};


instance DIA_Babo_YouAndAgon(C_Info)
{
	npc = NOV_612_Babo;
	nr = 3;
	condition = DIA_Babo_YouAndAgon_Condition;
	information = DIA_Babo_YouAndAgon_Info;
	permanent = FALSE;
	description = "��� ��������� ����� ����� � ������?";
};


func int DIA_Babo_YouAndAgon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Opolos_Monastery) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_YouAndAgon_Info()
{
	AI_Output(other,self,"DIA_Babo_YouAndAgon_15_00");	//��� ��������� ����� ����� � ������?
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_01");	//��, �� ��������� � ���, ��� ����� ��������� �� �������� ��������.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_02");	//���� ������� �� ���, ��� ����� ������ �������� ����� ������ ������.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_03");	//� ����� ��� ������ ������, �� ������� � ���� ����.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_04");	//������ ���� ��������� ���������� ��������� ���� � ���������.
};


instance DIA_Babo_WhyDidAgon(C_Info)
{
	npc = NOV_612_Babo;
	nr = 4;
	condition = DIA_Babo_WhyDidAgon_Condition;
	information = DIA_Babo_WhyDidAgon_Info;
	permanent = FALSE;
	description = "����� ���� ������ ���?";
};


func int DIA_Babo_WhyDidAgon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_YouAndAgon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_WhyDidAgon_Info()
{
	AI_Output(other,self,"DIA_Babo_WhyDidAgon_15_00");	//����� ���� ������ ���?
	AI_Output(self,other,"DIA_Babo_WhyDidAgon_03_01");	//���� ����� ������ �������� ��� �� ����. � �����, �� ������ �� �������, ����� ���-�� ����������� ����� ���.
};


instance DIA_Babo_PlantLore(C_Info)
{
	npc = NOV_612_Babo;
	nr = 5;
	condition = DIA_Babo_PlantLore_Condition;
	information = DIA_Babo_PlantLore_Info;
	permanent = FALSE;
	description = "������, �� ������ ������������ � ���������?";
};


func int DIA_Babo_PlantLore_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_YouAndAgon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_PlantLore_Info()
{
	AI_Output(other,self,"DIA_Babo_PlantLore_15_00");	//������, �� ������ ������������ � ���������?
	AI_Output(self,other,"DIA_Babo_PlantLore_03_01");	//� ��� � ����� ���� �������, ��� �� ���������� ��������� �����, � � �������� ���-���� � �������.
	AI_Output(self,other,"DIA_Babo_PlantLore_03_02");	//� �� ��� ����� ����� �������� � ����.
	MIS_HelpBabo = LOG_Running;
	Log_CreateTopic(Topic_BaboGaertner,LOG_MISSION);
	Log_SetTopicStatus(Topic_BaboGaertner,LOG_Running);
	B_LogEntry(Topic_BaboGaertner,"���� ��������� �� ����������� �����, � �� ��������� ����.");
};


instance DIA_Babo_Fegen(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Fegen_Condition;
	information = DIA_Babo_Fegen_Info;
	permanent = FALSE;
	description = "� ������ ��������� ����� �����������.";
};


func int DIA_Babo_Fegen_Condition()
{
	if(MIS_ParlanFegen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Babo_Fegen_Info()
{
	AI_Output(other,self,"DIA_Babo_Fegen_15_00");	//� ������ ��������� ����� �����������.
	AI_Output(self,other,"DIA_Babo_Fegen_03_01");	//�� ������� �� ���� ������� ����� ������. ������ ��� - � ������ ����. ���� �� �� ��� �� ���������� ������.
	AI_Output(self,other,"DIA_Babo_Fegen_03_02");	//�� ��� ����� ����� ������ � ����������� '����� �����'. ������, ��� �������, � ��� ���� ��������� �������� ����� � ���.
	AI_Output(self,other,"DIA_Babo_Fegen_03_03");	//� ������, �����������, � ���� �������� ��� ����������. ��� ��� ���� �� ��� ��������� ���� ������, � ������ ����.
	B_LogEntry(Topic_ParlanFegen,"���� ������� ��� �������� ����� �����������, ���� � ������� ��� ������ � ����������� '����� �����'.");
};


instance DIA_Babo_Windfaust(C_Info)
{
	npc = NOV_612_Babo;
	nr = 3;
	condition = DIA_Babo_Windfaust_Condition;
	information = DIA_Babo_Windfaust_Info;
	permanent = TRUE;
	description = "������ ������...";
};


var int DIA_Babo_Windfaust_permanent;

func int DIA_Babo_Windfaust_Condition()
{
	if((MIS_ParlanFegen == LOG_Running) && Npc_KnowsInfo(other,DIA_Babo_Fegen) && (DIA_Babo_Windfaust_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Babo_Windfaust_Info()
{
	AI_Output(other,self,"DIA_Babo_Windfaust_15_00");	//������ ������...
	AI_Output(self,other,"DIA_Babo_Windfaust_03_01");	//� ���� ���� ������ '����� �����' ��� ����?
	if(B_GiveInvItems(other,self,ItSc_Windfist,1))
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_02");	//��� ������, ������� �� ����� ��������.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_03");	//�������. ����� � ������ ���� ��������� �����.
		NOV_Helfer += 1;
		DIA_Babo_Windfaust_permanent = TRUE;
		B_GivePlayerXP(XP_Feger);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"SWEEP");
		B_LogEntry(Topic_ParlanFegen,"���� ������� ��� �������� ����� �����������.");
	}
	else
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_04");	//���, ���� ���.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_05");	//������, � �������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Life(C_Info)
{
	npc = NOV_612_Babo;
	nr = 10;
	condition = DIA_Babo_Life_Condition;
	information = DIA_Babo_Life_Info;
	permanent = TRUE;
	description = "��� ����� � ���������?";
};


func int DIA_Babo_Life_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Babo_Life_Info()
{
	AI_Output(other,self,"DIA_Babo_Life_15_00");	//��� ����� � ���������?
	AI_Output(self,other,"DIA_Babo_Life_03_01");	//�� ���� ����������, �� � ������� �� �����, ��� ����� ����� ������� �������. ���� �� ��������� �������, ���� ����������.
	AI_Output(self,other,"DIA_Babo_Life_03_02");	//�������, ������ ���������� ����� ������� ������ ������ � ����������, ����� ������������� ����� ����������.
	AI_Output(self,other,"DIA_Babo_Life_03_03");	//�� � �����, ��� ������ ���������� � ��������� ������ - ��� ��������� ��������� ���� ������.
	if(!Npc_KnowsInfo(other,DIA_Igaranz_Choosen))
	{
		AI_Output(other,self,"DIA_Babo_Life_15_04");	//��� �� ��� ������� �� ���������, � ��� �� ���������?
		AI_Output(self,other,"DIA_Babo_Life_03_05");	//�������� � ������ ��������. �� ������ ����� �� ����.
	};
};


var int Babo_XPgiven;

instance DIA_Babo_HowIsIt(C_Info)
{
	npc = NOV_612_Babo;
	nr = 1;
	condition = DIA_Babo_HowIsIt_Condition;
	information = DIA_Babo_HowIsIt_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Babo_HowIsIt_Condition()
{
	if((hero.guild == GIL_KDF) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Babo_HowIsIt_Info()
{
	AI_Output(other,self,"DIA_Babo_HowIsIt_15_00");	//��� ����?
	if(MIS_HelpBabo == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_01");	//(�����) � ��������� ����� �� ������ ��� ���������.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_02");	//��� �������� �������� � ����, � � �������, ��� ���� �������� ����, ������.
		if(Babo_XPgiven == FALSE)
		{
			B_GivePlayerXP(XP_AmbientKap2);
			Babo_XPgiven = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_03");	//(���������) �... �... ������, ������.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_04");	//�, � ������� ������� � ������� �� ������������ �����.
	};
	B_BaboIsTeacher();
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Kap3_Hello(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_Hello_Condition;
	information = DIA_Babo_Kap3_Hello_Info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int DIA_Babo_Kap3_Hello_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Hello_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Hello_15_00");	//��� �� ������� �����?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_01");	//(����������) � ������� ��������� �������, ������ ���, ���, ����� ���� ��������� �������� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_02");	//� �� ������ �������� � �����. ���� �� ��� �������� ��� �� ������, ���� �������, ��� � ������ � �������.
	};
};


instance DIA_Babo_Kap3_KeepTheFaith(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_KeepTheFaith_Condition;
	information = DIA_Babo_Kap3_KeepTheFaith_Info;
	permanent = FALSE;
	description = "�� �� ������ ������ ����.";
};


func int DIA_Babo_Kap3_KeepTheFaith_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Babo_Kap3_Hello) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_KeepTheFaith_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_00");	//�� �� ������ ������ ����.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_01");	//(����������� ��������) ���... � ���� �������, ��� ������ �� ����������. �������!
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_02");	//�� ��� �������� ����� ������� ���������.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_03");	//��, ������. � ���� ������ ������� ���, �������.
	B_BaboIsTeacher();
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Babo_Kap3_Unhappy(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_Unhappy_Condition;
	information = DIA_Babo_Kap3_Unhappy_Info;
	permanent = FALSE;
	description = "�� �� ��������� �������� �������.";
};


func int DIA_Babo_Kap3_Unhappy_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Babo_Kap3_Hello) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Unhappy_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_15_00");	//�� �� ��������� �������� �������.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_01");	//(����������� ��������) ���... � ���� �������, �� ���� ��� � �������, ������.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_02");	//������... ��, � �� ���� ����������.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"����� �������� �������.",DIA_Babo_Kap3_Unhappy_Lament);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"�� �����, ���-�� �� ������ �������.",DIA_Babo_Kap3_Unhappy_TellMe);
};

func void DIA_Babo_Kap3_Unhappy_Lament()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_00");	//����� �������� �������.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_01");	//(���������) �... �... �... ����������, �� ������ �����.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_02");	//� �� ����, ����� ���� ����� ��������.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_03");	//� ������� ��� ����.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_TellMe()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_00");	//�� �����, ���-�� �� ������ �������.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_01");	//� ��... ������ �� ������� �����?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_02");	//� ����� �� ����, ��� ����� ����� �����������?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_03");	//��... ������. � ���� �������� � ����� �� �����������. �� ����������� ����.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_04");	//�����, ����������.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_05");	//������, ��� ����� ����� ����������, ����� ��� ������ ������.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_06");	//�� �������� �������� �� �����, ���� � �� ���� ������ ��, ��� �� �������.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"� �����, ��� ��� �� ����� ������� � ��� ������.",DIA_Babo_Kap3_Unhappy_Privat);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"��� �� ������ ������ ��� ����?",DIA_Babo_Kap3_Unhappy_ShouldDo);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"��� ��� ���� �� ������?",DIA_Babo_Kap3_Unhappy_Documents);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"����� ����, � ���� ������ ����?",DIA_Babo_Kap3_Unhappy_CanHelpYou);
};

func void DIA_Babo_Kap3_Unhappy_Privat()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_00");	//� �����, ��� ��� �� ����� ������� � ��� ������.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Privat_03_01");	//� �������, ���� �� ����� ��������. � ��� � ���� ���-������ ���������.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_02");	//� ����, �� ����������.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_ShouldDo()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_ShouldDo_15_00");	//��� �� ������ ������ ��� ����?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_01");	//��� ��� ������ ��������. ��� ���... �� ���������� ������.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_02");	//��� ���� ������ �� �������, ��� �����, ���� ���... ����������.
};

func void DIA_Babo_Kap3_Unhappy_Documents()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_00");	//��� ��� ���� �� ������?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_01");	//(����������) ���... ������ �� ��������. ��� ���... ������ ����.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_02");	//�� �����, ������.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_03");	//���... ���... ��������� ���������� ������. ������ ����������.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_04");	//� ������ �� ���� ����������.
};

func void DIA_Babo_Kap3_Unhappy_CanHelpYou()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_00");	//����� ����, � ���� ������ ����?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_01");	//�� �������� ���?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_02");	//��... ��������... ��� ������� ��...
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_03");	//(��������) ������� ��, � ������� ���� �� ���.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_04");	//�������?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_05");	//��, � ���� �� ��� ����� �����, �� � ��� �� ���� ���� ������ � �����������. � ���� ���� �������� ����������.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"� ����� �� ���� ����������� � ����.",DIA_Babo_Kap3_Unhappy_No);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"� ��������, ��� ����� �������.",DIA_Babo_Kap3_Unhappy_Yes);
};

func void DIA_Babo_Kap3_Unhappy_No()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_No_15_00");	//� ����� �� ���� ����������� � ����.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_No_03_01");	//����� � ���� ��� ������, ��� �������� ������������ ������.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_Yes()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_00");	//� ��������, ��� ����� �������.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_01");	//(���������) ������?! � ����, � ���� ���������! � ����!
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_02");	//���� ����� ������ ��������, ��� ������ ������ ���� ����. ����� �� ��������� �� � ����, � ��� ����� � �������.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_03");	//����������. ��������� ��������. � � ���������� �� ���������.
	MIS_BabosDocs = LOG_Running;
	Log_CreateTopic(TOPIC_BabosDocs,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BabosDocs,LOG_Running);
	B_LogEntry(TOPIC_BabosDocs,"������ ����������� ���������� ���� ������-�� �����������.");
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};


func void B_GiveBaboDocs()
{
	AI_WaitTillEnd(self,other);
	if(Npc_HasItems(other,ItWr_BabosDocs_MIS))
	{
		B_GiveInvItems(other,self,ItWr_BabosDocs_MIS,1);
	}
	else
	{
		B_GiveInvItems(other,self,ItWr_BabosPinUp_MIS,1);
		Npc_RemoveInvItem(other,ItWr_BabosLetter_MIS);
		CreateInvItem(self,ItWr_BabosLetter_MIS);
		AI_PrintScreen("������ ���� ������",-1,43,FONT_ScreenSmall,2);
	};
	B_ReadFakeItem(self,other,Fakescroll,1);
	MIS_BabosDocs = LOG_SUCCESS;
	if(!Npc_IsDead(Igaraz))
	{
		Igaraz.aivar[AIV_IGNORE_Theft] = FALSE;
	};
	if(!Npc_IsDead(Feger2))
	{
		Feger2.aivar[AIV_IGNORE_Theft] = FALSE;
	};
	if(!Npc_IsDead(Feger3))
	{
		Feger3.aivar[AIV_IGNORE_Theft] = FALSE;
	};
	if(BabosDocsRejected == TRUE)
	{
		B_GivePlayerXP(XP_BabosDocs / 2);
	}
	else
	{
		B_GivePlayerXP(XP_BabosDocs);
	};
};

func int C_SCHasBabosDocs()
{
	if(Npc_HasItems(other,ItWr_BabosDocs_MIS))
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItWr_BabosPinUp_MIS) && Npc_HasItems(other,ItWr_BabosLetter_MIS))
	{
		return TRUE;
	};
	return FALSE;
};

instance DIA_Babo_Kap3_HaveYourDocs(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_HaveYourDocs_Condition;
	information = DIA_Babo_Kap3_HaveYourDocs_Info;
	permanent = FALSE;
	description = "� ����� ���� �������.";
};


func int DIA_Babo_Kap3_HaveYourDocs_Condition()
{
	if(MIS_BabosDocs == LOG_Running)
	{
		if(C_SCHasBabosDocs())
		{
			return TRUE;
		};
	};
};

func void DIA_Babo_Kap3_HaveYourDocs_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_00");	//� ����� ���� �������.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_01");	//������? �������, �� ���� ����. � ���� �� ����, ��� ����������� ����.
	DIA_Common_YeahJustRelax();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_03");	//(������) ��� ������������� ���? �� ������? ������ ���.
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"� ������� �� ���� � ����.",DIA_Babo_Kap3_HaveYourDocs_KeepThem);
	if((BabosDocsOpen == TRUE) || Npc_KnowsInfo(other,DIA_Igaranz_BabosJob) || Npc_KnowsInfo(other,DIA_Igaranz_Price))
	{
		Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"������, �������� ��� ��������������, ���� �������.",DIA_Babo_Kap3_HaveYourDocs_IWantMore);
	};
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"���, �����.",DIA_Babo_Kap3_HaveYourDocs_HereTheyAre);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_15_00");	//� ������� �� ���� � ����.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01");	//(�����������) ���?! ��� ��� ��� ������? ��� �� �������?
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"������ ����.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"��� ��� ����.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern);
	if(Npc_KnowsInfo(other,DIA_Igaranz_BabosJob))
	{
		Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"������ � � ������ ��������.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner);
	};
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_00");	//������ ����.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_01");	//(�����) ��-��, �� ��� ���-�� �� ������. ��� �� ���?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_02");	//�����.
	B_GiveBaboDocs();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_03");	//� �� ����� ������� ����, �� � ������ ����� ���������.
	CreateInvItems(self,ItSc_MediumHeal,1);
	B_GiveInvItems(self,other,ItSc_MediumHeal,1);
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_04");	//��� ������. ����������� ������ ���������.
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_00");	//��� ��� ����.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_03_01");	//��� ������ ����������� ���. �� �� ������ ����� �������� �� ����.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_02");	//��� ��������.
	BabosDocsRejected = TRUE;
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_00");	//������ � � ������ ��������.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_01");	//(�����������) ���? �� �� ������ ��������� �� ���� ���.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_02");	//� � �����, ��� ����. � �������� � ���� ��� ������, ����� ��� ���� ��������� ���, ��� ����.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_03");	//� ������ ���������� ���������� ����� � ��������.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_04");	//� �� ���� ��������� ������ ����������.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_05");	//�� ������. ���������� ������ ������. ����� �������� ����.
	BabosDocsRejected = TRUE;
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,Dialog_Ende,DIA_Babo_Kap3_HaveYourDocs_End);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"�������� ����.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"���� ���, ����� ��������?",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_NothingToDo);
};

func void DIA_Babo_Kap3_HaveYourDocs_End()
{
	AI_StopProcessInfos(self);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_15_00");	//�������� ����.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_03_01");	//� ���� ������ ��� ������.
	AI_StopProcessInfos(self);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_NothingToDo()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_15_00");	//���� ���, ����� ��������?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_03_01");	//� ��� �������, ��, ������ ���, �� ��������� �� ����.
	AI_StopProcessInfos(self);
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_00");	//������, �������� ��� ��������������, ���� �������.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_01");	//�� �� ����� ���������. ���� �� ������?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_02");	//� ��� � ���� ����?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_03");	//� ���� ���� ���� 121 ������� ������ - ��� ���, ��� � ���� ����.
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"����� ������������.",DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"������������.",DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough);
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_15_00");	//����� ������������.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_03_01");	//�� � ���� ��� ������ �����. ���� �� � ���� �� ���� ������, ���� �� ���� �� ���� � ���������.
	BabosDocsRejected = TRUE;
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_15_00");	//������������.
	B_GiveBaboDocs();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_03_01");	//��� ������ � ������.
	CreateInvItems(self,ItSc_MediumHeal,1);
	CreateInvItems(self,ItMi_Gold,121);
	B_GiveInvItems(self,other,ItSc_MediumHeal,1);
	B_GiveInvItems(self,other,ItMi_Gold,121);
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_HereTheyAre()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00");	//���, �����.
	B_GiveBaboDocs();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01");	//��, ��� �� �����.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02");	//�� ����� ��?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03");	//��� ����� �����-�� ��������?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04");	//���, ����� ��� � ���� � �����.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05");	//������ � �������, ��� ����� ����� ����� ��������.
	CreateInvItems(self,ItSc_MediumHeal,1);
	B_GiveInvItems(self,other,ItSc_MediumHeal,1);
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};


instance DIA_Babo_Kap3_HaveYourDocs2(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_HaveYourDocs2_Condition;
	information = DIA_Babo_Kap3_HaveYourDocs2_Info;
	permanent = FALSE;
	description = "�����.";
};


func int DIA_Babo_Kap3_HaveYourDocs2_Condition()
{
	if(BabosDocsRejected == TRUE)
	{
		if(C_SCHasBabosDocs())
		{
			return TRUE;
		};
	};
};

func void DIA_Babo_Kap3_HaveYourDocs2_Info()
{
	DIA_Common_TakeIt();
	B_GiveBaboDocs();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05");	//������ � �������, ��� ����� ����� ����� ��������.
	CreateInvItems(self,ItSc_MediumHeal,1);
	B_GiveInvItems(self,other,ItSc_MediumHeal,1);
};


instance DIA_Babo_Kap3_Perm(C_Info)
{
	npc = NOV_612_Babo;
	nr = 39;
	condition = DIA_Babo_Kap3_Perm_Condition;
	information = DIA_Babo_Kap3_Perm_Info;
	permanent = TRUE;
	description = "�� ������� ����� �������?";
};


func int DIA_Babo_Kap3_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_Kap3_Hello))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Perm_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_00");	//�� ������� ����� �������?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_01");	//(�������������) ��, �������. ��� ���� � �������� � ���� ������ ������� ��� ����.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_02");	//(���������) � �� ���� ���������� ����������, �� � ���� ����� ��� �������.
		AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_03");	//������ ����������.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_04");	//(����������) �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_05");	//��� ������, �� ��� ����� ������������ � ������, ����� ��� �� �� ��� �� ��������� �� �������.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_06");	//� �� ���� ����� ��������� �� ��������, ����� ��������� ���� ������ � �� ���� ����������.
	};
	AI_StopProcessInfos(self);
};

