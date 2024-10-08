
instance DIA_BAU_7_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_7_EXIT_Condition;
	information = DIA_BAU_7_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_7_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_7_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_BAU_7_JOIN_Condition;
	information = DIA_BAU_7_JOIN_Info;
	permanent = TRUE;
	description = "��� �� ������ � ���������?";
};


func int DIA_BAU_7_JOIN_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_BAU_7_JOIN_Info()
{
	DIA_Common_TellMeAboutSLD();
	AI_Output(self,other,"DIA_BAU_7_JOIN_07_01");	//���� ����� �� ��� ������ ����� �����.
	AI_Output(self,other,"DIA_BAU_7_JOIN_07_02");	//����������� �� ��� ����� ���� ���, ��� ����� ��� ����� ����������� ��. �� ��� �� ��� �������� ���.
};


instance DIA_BAU_7_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_7_PEOPLE_Condition;
	information = DIA_BAU_7_PEOPLE_Info;
	permanent = TRUE;
	description = "��� ����� �������?";
};


func int DIA_BAU_7_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_BAU_7_PEOPLE_15_00");	//��� ����� �������?
	AI_Output(self,other,"DIA_BAU_7_PEOPLE_07_01");	//��� ������� ����� ����������� �����. ������ ����� ������ ����. �� �� ����� �� � ������.
};


instance DIA_BAU_7_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_7_LOCATION_Condition;
	information = DIA_BAU_7_LOCATION_Info;
	permanent = TRUE;
	description = "�������� ��� ��������� � ������� ������.";
};


func int DIA_BAU_7_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_LOCATION_Info()
{
	AI_Output(other,self,"DIA_BAU_7_LOCATION_15_00");	//�������� ��� ��������� � ������� ������.
	AI_Output(self,other,"DIA_BAU_7_LOCATION_07_01");	//��� ������� ����� �� ������� ������ ����������� �����. ����� ������ ��������� � ������.
	AI_Output(self,other,"DIA_BAU_7_LOCATION_07_02");	//� ����� ������� - �� ����������� � ���-������. �� ������ ������� ���� �� ������. � ��� ����� ������� �������� ��������.
};


instance DIA_BAU_7_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_BAU_7_STANDARD_Condition;
	information = DIA_BAU_7_STANDARD_Info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int DIA_BAU_7_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_STANDARD_Info()
{
	AI_Output(other,self,"DIA_BAU_7_STANDARD_15_00");	//��� ����������?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_01");	//�� �������� ������������� - �� ������ �� ������ ������ ������. ������ ��� ����� ������ �� ������ ��� ���. � ��� ������!
	}
	else if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_02");	//������ ��� ������ ���������� ����.
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_03");	//��� ������ � ������� � ��������! ������ ������ ������ ������ ������ �������� ����� �� ������� �����.
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_04");	//���� ���������: ��������� ����� ����� ������ ������� ����� ������ �������� � ��������� ����� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_05");	//������, ����� ������� ����������, �������� �������� �� ����, ����� �������� �� ������. ����� ��� ������ ��� �����������.
	};
};

func void B_AssignAmbientInfos_BAU_7(var C_Npc slf)
{
	DIA_BAU_7_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_7_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_7_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_7_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_7_STANDARD.npc = Hlp_GetInstanceID(slf);
};

