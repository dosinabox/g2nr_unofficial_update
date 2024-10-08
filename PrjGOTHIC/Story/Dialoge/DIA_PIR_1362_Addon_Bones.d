
instance DIA_Addon_Bones_EXIT(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 999;
	condition = DIA_Addon_Bones_EXIT_Condition;
	information = DIA_Addon_Bones_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Bones_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bones_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


func void B_Addon_Bones_KeineZeit()
{
	AI_Output(self,other,"DIA_Addon_Bones_Train_01_01");	//������, � ���� ������ ������ ��� �������.
	AI_Output(self,other,"DIA_Addon_Bones_Train_01_02");	//��� ����� �������������.
};


instance DIA_Addon_Bones_Anheuern(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 1;
	condition = DIA_Addon_Bones_Anheuern_Condition;
	information = DIA_Addon_Bones_Anheuern_Info;
	description = "��� ���� ������.";
};


func int DIA_Addon_Bones_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Anheuern_15_01");	//��� ���� ������.
	B_Addon_Bones_KeineZeit();
};


instance DIA_Addon_Bones_Hello(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 5;
	condition = DIA_Addon_Bones_Hello_Condition;
	information = DIA_Addon_Bones_Hello_Info;
	permanent = FALSE;
	description = "��� ����?";
};


func int DIA_Addon_Bones_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bones_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Hello_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Addon_Bones_Hello_01_01");	//���� ����������. ������� ����������, �� ���� �������� �� ����������.
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_01");	//� ��������� � ������ �������, ������� ��� ��� ����.
	AI_Output(other,self,"DIA_Addon_Bones_Work_15_02");	//��� ��� �� �������?
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_03");	//� �� ���� ���� �������.
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_04");	//�� ��������, ��������, �� � ������ ��������, ����� �������� ��� �������, � �� ���� ����� ��� ��������.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Bones_Train(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 5;
	condition = DIA_Addon_Bones_Train_Condition;
	information = DIA_Addon_Bones_Train_Info;
	permanent = FALSE;
	description = "�� ������ ���� ����-������ �������?";
};


func int DIA_Addon_Bones_Train_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bones_Hello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_Train_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Train_15_00");	//�� ������ ���� ����-������ �������?
	B_Addon_Bones_KeineZeit();
};


instance DIA_Addon_Bones_Teacher(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 5;
	condition = DIA_Addon_Bones_Teacher_Condition;
	information = DIA_Addon_Bones_Teacher_Info;
	permanent = FALSE;
	description = "��� ����� ����� ����-������ ���� �������?";
};


func int DIA_Addon_Bones_Teacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bones_Train))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_Teacher_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Teacher_15_00");	//��� ����� ����� ����-������ ���� �������?
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_04");	//����� � ������ ��������� ������ ������� ��������.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_05");	//��� ����� ������� ���� ����� ���������.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_07");	//���� ����� ���������� ��������� ������.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_08");	//������ �� ������������ ����� ������� ���������� ������.
	AI_Output(other,self,"DIA_Addon_Bones_Teacher_15_09");	//� ���?
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_10");	//������, ������ ������, � ������ ����� �� �������������.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_11");	//�� �����, ���������� ����� � ������� ��������, ��� � ����� ����������.
	Knows_HenrysEntertrupp = TRUE;
	if(Henry_Addon_TeachPlayer == FALSE)
	{
		Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	};
	if(Morgan_Addon_TeachPlayer == FALSE)
	{
		Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);
	};
};


instance DIA_Addon_Bones_Francis(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 3;
	condition = DIA_Addon_Bones_Francis_Condition;
	information = DIA_Addon_Bones_Francis_Info;
	permanent = FALSE;
	description = "��� �� ������� � ��������?";
};


func int DIA_Addon_Bones_Francis_Condition()
{
	if(C_CanAskPiratesAboutFrancis())
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Francis_15_00");	//��� �� ������� � ��������?
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Bones_Francis_01_03");	//�������� ������. �������� ������ ����� � ��� ����.
		AI_Output(self,other,"DIA_Addon_Bones_Francis_01_04");	//������ ������ ����� ���� ����, ���� ���� �������.
		AI_Output(self,other,"DIA_Addon_Bones_Francis_01_05");	//��� ����� ������ �� ������. ���� �� ��������������, �� ��������� �� ���. ��� � ���.
	}
	else
	{
		B_Addon_Bones_KeineZeit();
	};
};


var int DIA_Addon_Bones_WantArmor_Once;

instance DIA_Addon_Bones_WantArmor(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 2;
	condition = DIA_Addon_Bones_WantArmor_Condition;
	information = DIA_Addon_Bones_WantArmor_Info;
	permanent = TRUE;
	description = "����� ��� ���������� �������.";
};


func int DIA_Addon_Bones_WantArmor_Condition()
{
	if((Greg_GaveArmorToBones == TRUE) && (MIS_Greg_ScoutBandits == FALSE) && !C_SCHasBDTArmor())
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_WantArmor_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_WantArmor_15_00");	//����� ��� ���������� �������.
	AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_01");	//� ��� �� ���������. ���� ��� ������ �������.
	AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_02");	//�� ������ ���, ��� ��� ��� ������� � �� ������ ������ �� ��������.
	if(GregIsBack == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_03");	//���, � �� ���� ���� �� ����. ��� �����, ����� ���� �����.
	};
	if(DIA_Addon_Bones_WantArmor_Once == FALSE)
	{
		B_LogEntry(TOPIC_Addon_BDTRuestung,"����� �� ������ ��� �������, ���� � �� ������ ���������� �����.");
		DIA_Addon_Bones_WantArmor_Once = TRUE;
	};
};


instance DIA_Addon_Bones_GiveArmor(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 2;
	condition = DIA_Addon_Bones_GiveArmor_Condition;
	information = DIA_Addon_Bones_GiveArmor_Info;
	permanent = FALSE;
	description = "�� ������ ������ ��� ������� ��������. ������ �����.";
};


func int DIA_Addon_Bones_GiveArmor_Condition()
{
	if((MIS_Greg_ScoutBandits == LOG_Running) && !C_SCHasBDTArmor())
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_GiveArmor_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_GiveArmor_15_00");	//�� ������ ������ ��� ������� ��������. ������ �����.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_01");	//������ �����? ��, � �-�� ����� ��� ������������� �������� ���� �� ��� �������.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_02");	//�������� � ������ �������� - ��� ������ ������������.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_03");	//����� �� ����� ���� ������� �� ���� �����-������ ������� ������...
	AI_Output(other,self,"DIA_Addon_Bones_GiveArmor_15_04");	//(�����������) �������.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_05");	//��, �������, ��� ���.
	B_GiveArmor(ITAR_BDT_M);
	Bones_ArmorGiven = TRUE;
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_06");	//���� ����������. � ����� ��������� ����� �����.
	self.flags = 0;
	B_SetMortal(Greg);
	B_LogEntry(TOPIC_Addon_BDTRuestung,"������ ����� ������� ���� ��������. ������� � ����!");
	B_GivePlayerXP(XP_Bones_GetBDTArmor);
};

