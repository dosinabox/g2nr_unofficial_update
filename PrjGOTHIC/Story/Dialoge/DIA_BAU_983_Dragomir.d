
instance DIA_Dragomir_EXIT(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 999;
	condition = DIA_Dragomir_EXIT_Condition;
	information = DIA_Dragomir_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragomir_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dragomir_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dragomir_Hello(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 1;
	condition = DIA_Dragomir_Hello_Condition;
	information = DIA_Dragomir_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragomir_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragomir_Hello_12_00");	//������������� ��� ������ �� ����?
	AI_Output(self,other,"DIA_Dragomir_Hello_12_01");	//����� ���� �� �������� ������������, �������� ����� �� ������ ����.
};


instance DIA_Dragomir_OutHere(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_OutHere_Condition;
	information = DIA_Dragomir_OutHere_Info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int DIA_Dragomir_OutHere_Condition()
{
	return TRUE;
};

func void DIA_Dragomir_OutHere_Info()
{
	AI_Output(other,self,"DIA_Dragomir_OutHere_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Dragomir_OutHere_12_01");	//��, ������ � ������� ������� ����� ��� ����, ��� ������ � � ���� �����.
	AI_Output(self,other,"DIA_Dragomir_OutHere_12_02");	//���������� �������� ����� �����, ������, ��� ������ �� �����������.
};


instance DIA_Dragomir_Settlers(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Settlers_Condition;
	information = DIA_Dragomir_Settlers_Info;
	permanent = FALSE;
	description = "� ��� ��� � ���� ������?";
};


func int DIA_Dragomir_Settlers_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragomir_OutHere))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Settlers_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Settlers_15_00");	//� ��� ��� � ���� ������?
	AI_Output(self,other,"DIA_Dragomir_Settlers_12_01");	//������� �� ����. ��������, �����-������ ��������. � �������, ��� ������, ��� ����� ����� ������� ������.
};


instance DIA_Dragomir_Dangerous(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Dangerous_Condition;
	information = DIA_Dragomir_Dangerous_Info;
	permanent = FALSE;
	description = "� ����� ����� �� ������?";
};


func int DIA_Dragomir_Dangerous_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragomir_OutHere))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Dangerous_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_00");	//� ����� ����� �� ������?
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_01");	//��... �� �����, ���� �� ������ �������� �� ����. ��� ������� ��� ������������ ������ ����.
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_02");	//��. �� �� ����� �� � �������.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_03");	//�� ������������, ���� �� ������, ��� ���������� � ���. ��, � ���� ��� ������� ��������. ��, � ���������, � ������� ���.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_04");	//� ������ ������� ������ �� �����, � ����. ��� ��������� ������� �������� ���� � ���������� �������.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_05");	//���� � �������� ��� �� �����������, �� ���� �������� ��� ������� ������� � ������ �� ����.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_06");	//��� �������� ������ �� ���� ���.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_07");	//� ����� � �����, ������� ����������� �� ���� ����. � �����, ��� �� ��� ��� ����� ���, � ����� ��������� ����� �� ������.
	Log_CreateTopic(TOPIC_DragomirsArmbrust,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DragomirsArmbrust,LOG_Running);
	B_LogEntry(TOPIC_DragomirsArmbrust,"�������� ������� ���� ������� � �������� �������� �����, ����������� ������ � �������� �����.");
	MIS_DragomirsArmbrust = LOG_Running;
};


instance DIA_Dragomir_Armbrust(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Armbrust_Condition;
	information = DIA_Dragomir_Armbrust_Info;
	permanent = FALSE;
	description = "���. � ����� ���� �������.";
};


func int DIA_Dragomir_Armbrust_Condition()
{
	if((MIS_DragomirsArmbrust == LOG_Running) && Npc_HasItems(other,ItRw_DragomirsArmbrust_MIS))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Armbrust_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_00");	//���. � ����� ���� �������.
	B_GiveInvItems(other,self,ItRw_DragomirsArmbrust_MIS,1);
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_01");	//�����, ��� ��� �������. ������ �� ������ ���, ��� �� ����� � ����� ��������� �����?
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_02");	//� ��� � ���� ������?
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_03");	//��� ���� ����� ����������� � ����� �������. �� ��� �����, �������.
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_04");	//�����������, � ����� ��������� �� ��� ���� ������. �������, ����� ����� ����������.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	MIS_DragomirsArmbrust = LOG_SUCCESS;
	B_GivePlayerXP(XP_DragomirsArmbrust);
	AI_EquipBestRangedWeapon(self);
};


var int Dragomir_TeachPlayer;
const int Dragomir_TeachingCost = 150;

instance DIA_Dragomir_Learn(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Learn_Condition;
	information = DIA_Dragomir_Learn_Info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ����-������?";
};


func int DIA_Dragomir_Learn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragomir_Dangerous) && (Dragomir_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Learn_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_15_00");	//�� ������ ������� ���� ����-������?
	if(VisibleAttributeValue(ATR_DEXTERITY) < 30)
	{
		AI_Output(self,other,"DIA_Dragomir_Learn_12_01");	//������, ��� � ����� ������� ���� ����-������, �� ������ �������� ���� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Dragomir_Learn_12_02");	//���� �� ������ ���������. ��� � ��� �������, � ������ ������� ������� � ���������.
		AI_Output(other,self,"DIA_Dragomir_Learn_15_03");	//������� �� ������?
		B_Say_Gold(self,other,Dragomir_TeachingCost);
		Info_ClearChoices(DIA_Dragomir_Learn);
		Info_AddChoice(DIA_Dragomir_Learn,"��������, �����.",DIA_Dragomir_Learn_Later);
		if(Npc_HasItems(other,ItMi_Gold) >= Dragomir_TeachingCost)
		{
			Info_AddChoice(DIA_Dragomir_Learn,"��� ���� ������.",DIA_Dragomir_Learn_Here);
		};
	};
};

func void DIA_Dragomir_Learn_Later()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Later_15_00");	//��������, �����.
	Info_ClearChoices(DIA_Dragomir_Learn);
};

func void DIA_Dragomir_Learn_Here()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Here_15_00");	//��� ���� ������.
	B_GiveInvItems(other,self,ItMi_Gold,Dragomir_TeachingCost);
	AI_Output(self,other,"DIA_Dragomir_Learn_Here_12_01");	//������, �� ����� ������ ���� ������.
	Dragomir_TeachPlayer = TRUE;
	Info_ClearChoices(DIA_Dragomir_Learn);
	Log_CreateTopic(TOPIC_OutTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_OutTeacher,"�������� ����� ������� ���� ������������ ���������.");
};


var int DIA_Dragomir_Teach_permanent;

func void B_BuildLearnDialog_Dragomir()
{
	if(VisibleTalentValue(NPC_TALENT_CROSSBOW) < TeachLimit_Crossbow_Dragomir)
	{
		Info_ClearChoices(DIA_Dragomir_Teach);
		Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
		Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnTalentString(other,NPC_TALENT_CROSSBOW,1),DIA_Dragomir_Teach_CROSSBOW_1);
		Info_AddChoice(DIA_Dragomir_Teach,B_BuildLearnTalentString(other,NPC_TALENT_CROSSBOW,5),DIA_Dragomir_Teach_CROSSBOW_5);
	}
	else
	{
		if(RealTalentValue(NPC_TALENT_CROSSBOW) >= TeachLimit_Crossbow_Dragomir)
		{
			DIA_Dragomir_Teach_permanent = TRUE;
		};
		PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_Crossbow_Dragomir)),-1,53,FONT_Screen,2);
		AI_Output(self,other,"DIA_Dragomir_Teach_12_00");	//� ������ ������ �� ���� ������� ����. ���� ����� �������� ������� �������.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Dragomir_Teach(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Teach_Condition;
	information = DIA_Dragomir_Teach_Info;
	permanent = TRUE;
	description = "����� ���� ����-������.";
};


func int DIA_Dragomir_Teach_Condition()
{
	if((Dragomir_TeachPlayer == TRUE) && (DIA_Dragomir_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Teach_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Teach_15_00");	//����� ���� ����-������.
	B_BuildLearnDialog_Dragomir();
};

func void DIA_Dragomir_Teach_Back()
{
	Info_ClearChoices(DIA_Dragomir_Teach);
};

func void DIA_Dragomir_Teach_CROSSBOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,TeachLimit_Crossbow_Dragomir))
	{
		B_BuildLearnDialog_Dragomir();
	};
};

func void DIA_Dragomir_Teach_CROSSBOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,TeachLimit_Crossbow_Dragomir))
	{
		B_BuildLearnDialog_Dragomir();
	};
};

