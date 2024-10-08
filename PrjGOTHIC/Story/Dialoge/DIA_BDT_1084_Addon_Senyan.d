
instance DIA_Addon_Senyan_EXIT(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 999;
	condition = DIA_Addon_Senyan_EXIT_Condition;
	information = DIA_Addon_Senyan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende_v3;
};


func int DIA_Addon_Senyan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Senyan_EXIT_Info()
{
	DIA_Common_SeeYou();
	if(Senyan_Erpressung == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Senyan_EXIT_12_00");	//�� ������, ��� ���� ����� �������...
	}
	else
	{
		AI_WaitTillEnd(self,other);
	};
	AI_StopProcessInfos(self);
};


func void B_Senyan_Attack()
{
	AI_Output(self,other,"DIA_Addon_Senyan_Attack_12_00");	//(����������) ����� ����� �� ��� ��� �����, ��������?
	AI_Output(self,other,"DIA_Addon_Senyan_Attack_12_01");	//(�����) ��, ������, ����������, ��� � ��� �����!
	Senyan_Called = TRUE;
	Senyan_Erpressung = LOG_OBSOLETE;
	B_CheckLog();
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void B_Senyan_Erpressung()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Erpressung_15_00");	//������� �� ������?
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_01");	//(����� �����) �, ���, �� ����, ����������. � �� ���� �������� � ���� ������. � ���� � �� ������ �� ����.
	AI_Output(other,self,"DIA_Addon_Senyan_Erpressung_15_02");	//����� ��� ���� �����?
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_03");	//������� ���-�� ����� ������ ��������. �� ��������� �� ��������������.
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_04");	//����� � �������� � �������� � ���. ����� �����������.
	AI_StopProcessInfos(self);
	Log_CreateTopic(Topic_Addon_Senyan,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Senyan,LOG_Running);
	B_LogEntry(Topic_Addon_Senyan,"������ ����� ����. ��� ��������, ��� � �����. �� ����� ������������ ���� ��� �����-�� ����� �����. �� ������� � ������ ���������� � ���������.");
};


var int Senyan_Msg;
var int Senyan_Bad;
var int Senyan_Good;

instance DIA_Addon_BDT_1084_Senyan_Hi(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 1;
	condition = DIA_Addon_Senyan_Hi_Condition;
	information = DIA_Addon_Senyan_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Senyan_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Senyan_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_12_00");	//�! ��� ��� � ��� �����?
	if(Npc_IsDead(Esteban))
	{
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		B_ReadFakeItem(self,other,Fakeheroface,1);
		AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_12_01");	//��-��, ��-��. ��� �� ���. � ���� ��� ���� ���� ������� ������� � ������ �������.
		Npc_ExchangeRoutine(self,"BAR");
		Senyan_Contact = TRUE;
		Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);
		Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi,"������� - �������.",DIA_Addon_BDT_1084_Senyan_Hi_good);
		Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi,"������� �������� ��� ������ �������.",DIA_Addon_BDT_1084_Senyan_Hi_bad);
	};
};

func void DIA_Addon_BDT_1084_Senyan_Hi_good()
{
	if(Senyan_Msg == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_good_15_00");	//������� - �������.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_good_15_01");	//� ��� �� ������� �������?
	};
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_02");	//��, � �� ����, ��� ���� ��� �������, �� �� ����� ���� ������� ����������� ������.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_03");	//������ �������, ��� ���� ������� - �����, ����� ����, ���� �� �����.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_04");	//� � ������� ���������� � �����������.
	Senyan_Good = TRUE;
	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);
	if(Senyan_Bad == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else
	{
		Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi,"� ��� ��� � ������� ���������?",DIA_Addon_BDT_1084_Senyan_Hi_bad);
	};
};

func void DIA_Addon_BDT_1084_Senyan_Hi_bad()
{
	if(Senyan_Msg == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_00");	//������� �������� ��� ������ �������.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_01");	//� ��� ��� � ������� ���������?
	};
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_02");	//���� ���� �����. � ��� ������. ������-�� ��� ������� ���� ����...
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_03");	//� ���� ��� ������ ����, ��� ����� ����.
	AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_04");	//������ ��� ��������.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_05");	//������, �� �������� �� ����, ��� ������� �������. ������ � ������ � ����� ��������, ���...
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_06");	//...��� ����� ��� ������ � ������, ������ �����. ���� ����� ����� �� �������, ��� �����.
	Senyan_Bad = TRUE;
	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);
	if(Senyan_Good == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else
	{
		Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi,"� ��� �� ������� �������?",DIA_Addon_BDT_1084_Senyan_Hi_good);
	};
};


instance DIA_Addon_Senyan_unterwegs(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 99;
	condition = DIA_Addon_Senyan_unterwegs_Condition;
	information = DIA_Addon_Senyan_unterwegs_Info;
	permanent = TRUE;
	description = "�� ������ ��������...";
};


func int DIA_Addon_Senyan_unterwegs_Condition()
{
	if((MIS_Judas == FALSE) && Npc_KnowsInfo(other,DIA_Addon_BDT_1084_Senyan_Hi) && !Npc_IsDead(Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_unterwegs_Info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_unterwegs_15_00");	//�� ������ ��������...
	AI_Output(self,other,"DIA_Addon_Senyan_unterwegs_12_01");	//�� ��� ��������� � ���?
	AI_Output(other,self,"DIA_Addon_Senyan_unterwegs_15_02");	//��� ���.
	AI_Output(self,other,"DIA_Addon_Senyan_unterwegs_12_03");	//����� ���� ������� ������� ��� ��������.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Senyan_Attentat(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 2;
	condition = DIA_Addon_Senyan_Attentat_Condition;
	information = DIA_Addon_Senyan_Attentat_Info;
	permanent = FALSE;
	description = "� ��������� � ���������.";
};


func int DIA_Addon_Senyan_Attentat_Condition()
{
	if((MIS_Judas == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_BDT_1084_Senyan_Hi) && !Npc_IsDead(Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_Attentat_Info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_00");	//� ��������� � ���������.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_01");	//� �� ������ ���� � ���������?
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_02");	//�� ������ ��� ����� ����, ��� ������ ������. �� ���-������ ������ ��� ���?
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_03");	//�� ������ ����. � ���� ��� ���. � ��� ���������� ����� ����������.
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_04");	//��?
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_05");	//� ����, ����� �� �������� ���� �������. ����� �� ����� ���������.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_06");	//(�������) � ����� �� ��� ������� - �� ������ ��� ��� ����.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_07");	//� � ������ �������.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_08");	//� ���� ���������� � ����� ������� - �� ������� �� ����. �������� ���� ������ � ������ �� ������. ��� ���������, ��� ����� ��������� � ���� ������.
	Info_ClearChoices(DIA_Addon_Senyan_Attentat);
	Info_AddChoice(DIA_Addon_Senyan_Attentat,"�� �� ����� � ���� ��� �����...",DIA_Addon_Senyan_Attentat_JA);
	Info_AddChoice(DIA_Addon_Senyan_Attentat,"������ �� ����!",DIA_Addon_Senyan_Attentat_NO);
};

func void DIA_Addon_Senyan_Attentat_NO()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_NO_15_00");	//������ �� ����!
	Info_ClearChoices(DIA_Addon_Senyan_Attentat);
	B_Senyan_Attack();
};

func void DIA_Addon_Senyan_Attentat_JA()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_JA_15_00");	//��-�, �� �� ����� � ���� ��� �����...
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_JA_12_01");	//� ����, ��� �� ������ ������������.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_JA_12_02");	//(�����) ����� �� ��������� ���� ������ - � ��������� �� ������ - � ��������, ��� �������, �� ����� ������ ������. � ������ ���!
	Senyan_Erpressung = LOG_Running;
	Info_ClearChoices(DIA_Addon_Senyan_Attentat);
	B_LogEntry(Topic_Addon_Senyan,"������ �����, ����� � ����� ��������� � ���� ���. ����� ����� � ������ ���� �������.");
};


instance DIA_Addon_Senyan_ChangePlan(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 3;
	condition = DIA_Addon_Senyan_ChangePlan_Condition;
	information = DIA_Addon_Senyan_ChangePlan_Info;
	permanent = FALSE;
	description = "� ���������. �� ������ �� �������� ������!";
};


func int DIA_Addon_Senyan_ChangePlan_Condition()
{
	if((Senyan_Erpressung == LOG_Running) && (Snaf_Tip_Senyan == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_ChangePlan_Info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_ChangePlan_15_00");	//� ���������. �� ������ �� �������� ������!
	B_Senyan_Attack();
};


/*instance DIA_Addon_BDT_1084_Senyan_Found(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 3;
	condition = DIA_Addon_Senyan_Found_Condition;
	information = DIA_Addon_Senyan_Found_Info;
	permanent = FALSE;
	description = "� ����� ���������. ��� ����.";
};


func int DIA_Addon_Senyan_Found_Condition()
{
	if((Senyan_Erpressung == LOG_Running) && (MIS_Judas == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_Found_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Found_15_00");	//� ����� ���������. ��� ����.
	B_Senyan_Attack();
};*/


instance DIA_Addon_BDT_1084_Senyan_derbe(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 1;
	condition = DIA_Addon_Senyan_derbe_Condition;
	information = DIA_Addon_Senyan_derbe_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Senyan_derbe_Condition()
{
	if(Senyan_Contact == TRUE)
	{
		if(Npc_IsDead(Esteban))
		{
			return TRUE;
		};
		if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Duell))
		{
			return TRUE;
		};
		if(Esteban_KnowsFiskAsTraitor == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Senyan_derbe_Info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_derbe_12_00");	//(� ������) �� �� �������� ���� ����������!
	B_Senyan_Attack();
};

