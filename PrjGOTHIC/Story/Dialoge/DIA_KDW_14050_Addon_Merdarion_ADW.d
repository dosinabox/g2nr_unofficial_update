
instance DIA_Addon_Merdarion_ADW_EXIT(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 999;
	condition = DIA_Addon_Merdarion_ADW_EXIT_Condition;
	information = DIA_Addon_Merdarion_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Merdarion_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_ADW_EXIT_Info()
{
	if(DIA_Addon_Saturas_StonePlateHint_Condition() && (MIS_Saturas_LookingForHousesOfRulers == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_11");	//��, � ������, ���� � �� ����� - ������� ����� ���������� � �����.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_12");	//�� ������ ����� ��� ��� ����� ������.
	};
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_FokusGeben) || (Merdarion_GotFocusCount > 0))
	{
		if((SC_ADW_ActivatedAllTelePortStones == FALSE) && (TriggeredTeleporterADW <= Merdarion_GotFocusCount) && !Npc_HasItems(other,ItMi_Focus))
		{
			CreateInvItems(self,ItMi_Focus,1);
			B_GiveInvItems(self,other,ItMi_Focus,1);
		};
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Merdarion_ADWHello(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ADWHello_Condition;
	information = DIA_Addon_Merdarion_ADWHello_Info;
	description = "��� ����?";
};


func int DIA_Addon_Merdarion_ADWHello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_ADWHello_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_01");	//(�������������) ������... ���������, ��?
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_02");	//��-�...
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_03");	//��� ���������������� �����, ������, �� ��������, �� ��� ��� ������, ��� ��� �����.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_04");	//���� ��� ���������, � ��� ��� �������� �����-�� �������.
	Info_ClearChoices(DIA_Addon_Merdarion_ADWHello);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"��� ��� ����� ������?",DIA_Addon_Merdarion_ADWHello_reaktor);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"��� �� �������, ��� �� ����� ������������?",DIA_Addon_Merdarion_ADWHello_was);
};

func void DIA_Addon_Merdarion_ADWHello_was()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_was_15_00");	//��� �� �������, ��� �� ����� ������������?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_01");	//� ���� ���� ���� ����. ������ ��� ����� ���������, ��� ��� ���������� �����.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_02");	//� ���� ��������� ���� ����� ���� ��������, ��� � ��� ����� ������� �����.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_03");	//� �������, ��� ��� ����� �������� �� ������������ ���������� ���������� �������, ����� ��������� �� ����� ��������.
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"��� �� ����� ����� ���������������� ����� ������?",DIA_Addon_Merdarion_ADWHello_wo);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"��� ����� ���� ����������� ���������� ���������� �������?",DIA_Addon_Merdarion_ADWHello_focus);
};

func void DIA_Addon_Merdarion_ADWHello_focus()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_00");	//��� ����� ���� ����������� ���������� ���������� �������?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_01");	//��� �������� � ������ ������ ���� ����. ���������� �����������.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_02");	//� ���� � ���� ���� �� ���� ������������ ������, ������� ���� ������������ ��� �������� ����������� ������� � ������ ��������.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_03");	//��������� � ����, ��������� ����� ����� �� ������ �� ���.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_04");	//��, � �����.
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"�� ������, ��� ���� ����� ���������, ��� ���� ���������� �����.",DIA_Addon_Merdarion_ADWHello_focusProof);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"� ��� ������������ ����� ������?",DIA_Addon_Merdarion_ADWHello_focusWo);
};

func void DIA_Addon_Merdarion_ADWHello_focusWo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusWo_15_00");	//� ��� ������������ ����� ������?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_01");	//��� ���� �������� ���. � ������ ������� ��, ���� �� �� �������� ������ �������������.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_02");	//������, ��� ����� ������.
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"� ������� ����������.",DIA_Addon_Merdarion_ADWHello_Back);
};

func void DIA_Addon_Merdarion_ADWHello_focusProof()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusProof_15_00");	//�� ������, ��� ���� ����� ���������, ��� ���� ���������� �����.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_01");	//���������� ����� ����� ���� ������ � ����� �������.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_02");	//�� � �� ���� ���.
};

func void DIA_Addon_Merdarion_ADWHello_Back()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_Back_15_00");	//� ������� ����������.
	Info_ClearChoices(DIA_Addon_Merdarion_ADWHello);
};

func void DIA_Addon_Merdarion_ADWHello_wo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_wo_15_00");	//��� �� ����� ����� ���������������� ����� ������?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_01");	//�� ���� ��� � �������������� �������. ������� �� ������� �� �� �������?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_02");	//� ���������� ������, ��� �� ��� ��� ����� ��� �����.
};

func void DIA_Addon_Merdarion_ADWHello_reaktor()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_reaktor_15_00");	//��� ��� ����� ������?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_01");	//������ ���� ����� �������� ������.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_02");	//��� ������������ ����� �������� �����, ������� �� ������� �� ������.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_03");	//���� ���������������� ������ ���� ���������, ����� ������ ����� ������ ������������ �� ������ ������ � ������.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_04");	//���� ������, ��������, �������� �����������.
};


instance DIA_Addon_Merdarion_FokusGeben(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_FokusGeben_Condition;
	information = DIA_Addon_Merdarion_FokusGeben_Info;
	description = "��� ��� ������������ ������. � �������� ��������� ����������� ��������.";
};


func int DIA_Addon_Merdarion_FokusGeben_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_ADWHello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_FokusGeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_FokusGeben_15_00");	//��� ��� ������������ ������. � �������� ��������� ����������� ��������.
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_01");	//������. �� ���� ���������, ������� ����?
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_02");	//������� ������ � ���� ������, ���� �� �� ��������.
	CreateInvItems(self,ItMi_Focus,1);
	B_GiveInvItems(self,other,ItMi_Focus,1);
	Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
	B_LogEntry(TOPIC_Addon_TeleportsADW,"��� ���� ��������� ��� ��� ���� �� ������ ������������ ������, ������� �������������� ��� �������� ������� ������ ������ ��������. � ��� ������� � ���� ����������� ������������ �����-������ ��������.");
};


var int Merdarion_GotFocusCount;

instance DIA_Addon_Merdarion_FirstFocus(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_FirstFocus_Condition;
	information = DIA_Addon_Merdarion_FirstFocus_Info;
	description = "� ����������� ���� �� ���������������� ������.";
};


func int DIA_Addon_Merdarion_FirstFocus_Condition()
{
	if(TriggeredTeleporterADW != 0)
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_FirstFocus_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_00");	//� ����������� ���� �� ���������������� ������.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_01");	//��, � ����. ������, � ��� ����.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_02");	//� ��������� � ������� �� ����.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_03");	//�� �����, ����� �� ��������� ������������ ��� ��������� ���������������� �����.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_04");	//���� �� ������ ������ ������������ �� ����� ����� ������ � ������, ��� ��� ����� ������� � �������������.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_05");	//��� ��� ���� ������������ ������.
	CreateInvItems(self,ItMi_Focus,1);
	B_GiveInvItems(self,other,ItMi_Focus,1);
	Merdarion_GotFocusCount = 1;
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_06");	//��������� �� ���, ���� �������.
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_07");	//� ����������.
	B_GivePlayerXP(XP_Addon_ActivatedTeleportStone);
	B_LogEntry(TOPIC_Addon_TeleportsADW,"��������� ��� ��� ��� ���� ������������ ������. � ������ ����������� ������������ ��� ���������. ��������� ����� �������� ���� ������ ������� �� ���� ��������� ����������.");
};


var int DIA_Addon_Merdarion_ActivateTeleports_OneTime;

instance DIA_Addon_Merdarion_ActivateTeleports(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ActivateTeleports_Condition;
	information = DIA_Addon_Merdarion_ActivateTeleports_Info;
	permanent = TRUE;
	description = "� ����������� ��� ���� ���������������� ������.";
};


func int DIA_Addon_Merdarion_ActivateTeleports_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_FirstFocus) && (TriggeredTeleporterADW > Merdarion_GotFocusCount) && (Merdarion_GotFocusCount < 6))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ActivateTeleports_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_00");	//� ����������� ��� ���� ���������������� ������.
	if(SC_ADW_ActivatedAllTelePortStones == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_01");	//��� ��� ��������� ������������ ������.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_02");	//�������, ����������.
		CreateInvItems(self,ItMi_Focus,1);
		B_GiveInvItems(self,other,ItMi_Focus,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_08");	//�� �������� �������� ������. ��� �������� ������ ���������� ����.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_09");	//������ ��� ��� ��������. ������������ �������, ������?
	};
	if(DIA_Addon_Merdarion_ActivateTeleports_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_03");	//��� ���� ������?
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_04");	//��� ����������. � �� �� ��������� �� ������.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_05");	//� ���� ���� ���� ������� ������, ��� �������?
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_06");	//���� �� ��������.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_07");	//���������...
		DIA_Addon_Merdarion_ActivateTeleports_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_10");	//��� ��������� ������� �����.
	B_GivePlayerXP(XP_Addon_ActivatedTeleportStone);
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Merdarion_GotFocusCount += 1;
};


instance DIA_Addon_Merdarion_ADW_PreTeachMana(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ADW_PreTeachMana_Condition;
	information = DIA_Addon_Merdarion_ADW_PreTeachMana_Info;
	description = "�� ������ �������� ��� ���������� �����������?";
};


func int DIA_Addon_Merdarion_ADW_PreTeachMana_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_ADWHello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ADW_PreTeachMana_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PreTeachMana_15_00");	//�� ������ �������� ��� ���������� �����������?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PreTeachMana_06_01");	//� ���� ��������� ���������� ����� ���������� �������.
	Merdarion_Addon_TeachMana = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,"��������� ����� ��������� ��� ���������� �������.");
};


var int Merdarion_ADW_Empty;

func void B_BuildLearnDialog_Merdarion()
{
	if(RealAttributeValue(ATR_MANA_MAX) >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_00");	//��, ��� �� �������, ������� �� ����� ���� ������������.
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_01");	//�� ��� ������ ���, ���� �� � ���� ��� �������.
		Merdarion_ADW_Empty = TRUE;
	}
	else
	{
		Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
		Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,Dialog_Back,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);
		Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,B_BuildLearnAttributeString(ATR_MANA_MAX,1),DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
		Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,B_BuildLearnAttributeString(ATR_MANA_MAX,5),DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
	};
};

instance DIA_Addon_Merdarion_ADW_TEACH_MANA(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 99;
	condition = DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition;
	information = DIA_Addon_Merdarion_ADW_TEACH_MANA_Info;
	permanent = TRUE;
	description = "� ���� ��������� ��� ���������� �������.";
};


func int DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition()
{
	if((Merdarion_Addon_TeachMana == TRUE) && (Merdarion_ADW_Empty == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_TEACH_MANA_15_00");	//� ���� ��������� ��� ���������� �������.
	B_BuildLearnDialog_Merdarion();
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK()
{
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_1()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_HIGH))
	{
		B_BuildLearnDialog_Merdarion();
	};
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_5()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_HIGH))
	{
		B_BuildLearnDialog_Merdarion();
	};
};

