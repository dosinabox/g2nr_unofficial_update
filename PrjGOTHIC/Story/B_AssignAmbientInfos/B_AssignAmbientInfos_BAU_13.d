
instance DIA_BAU_13_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_13_EXIT_Condition;
	information = DIA_BAU_13_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_13_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_BAU_13_JOIN_Condition;
	information = DIA_BAU_13_JOIN_Info;
	permanent = TRUE;
	description = "�������� ��� ��������� �� ���� ���������!";
};


func int DIA_BAU_13_JOIN_Condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_BAU_13_JOIN_Info()
{
	AI_Output(other,self,"DIA_BAU_13_JOIN_15_00");	//�������� ��� ��������� �� ���� ���������!
	AI_Output(self,other,"DIA_BAU_13_JOIN_13_01");	//���� � ���� � ���� �����-�� ��������, ��� � ��. ��, �������, ������ ��� ������. �� ������ ����� ����� � ������ ���������.
	AI_Output(self,other,"DIA_BAU_13_JOIN_13_02");	//���� ���-�� �� ��� ����� ���� �����������, �� ������� ��������� �� ������������.
};


instance DIA_BAU_13_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_13_PEOPLE_Condition;
	information = DIA_BAU_13_PEOPLE_Info;
	permanent = TRUE;
	description = "��� ���������� �����?";
};


func int DIA_BAU_13_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_BAU_13_PEOPLE_15_00");	//��� ���������� �����?
	AI_Output(self,other,"DIA_BAU_13_PEOPLE_13_01");	//���� ���� ��������� ��� ������ - �� ��������. ���� ������ ��, �� ������ ����� �����, ������� ��� ��� ����� ������������ ��� ��������.
	AI_Output(self,other,"DIA_BAU_13_PEOPLE_13_02");	//� �� ����� �� ��������� � ��� �����, ���� �� ��������� ����� ������, ��� ��� ���� ����� ��������.
};


instance DIA_BAU_13_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_13_LOCATION_Condition;
	information = DIA_BAU_13_LOCATION_Info;
	permanent = TRUE;
	description = "��� �� ������ ������� �� ���� ������?";
};


func int DIA_BAU_13_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_LOCATION_Info()
{
	AI_Output(other,self,"DIA_BAU_13_LOCATION_15_00");	//��� �� ������ ������� �� ���� ������?
	AI_Output(self,other,"DIA_BAU_13_LOCATION_13_01");	//����� ���� ��� �����. ����� ����� � ������� � ������ � ������ � ����� ������.
	AI_Output(self,other,"DIA_BAU_13_LOCATION_13_02");	//�� ���-������ ���� ������ �� ������������ �����. ��� ��������� ����� �������.
};


instance DIA_BAU_13_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_BAU_13_STANDARD_Condition;
	information = DIA_BAU_13_STANDARD_Info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int DIA_BAU_13_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_STANDARD_Info()
{
	AI_Output(other,self,"DIA_BAU_13_STANDARD_15_00");	//��� ����������?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_01");	//������ �� ������ ������ �� �������� ��� ������ � ����! ��� �� ����� ������ � ��� ����, ����� �� ������ ����������!
	}
	else if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_02");	//��������� �� ������ �� ������� ������ ��������. ���� ������� ����, �� ����� ������� �� �������� ������.
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_03");	//�������! ����� �����, ��� � ������ �������� ��������� �������. ��� ����� ��������� �� �������!
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_04");	//������� ����, ��� ������� � ��� ����������� � ������ ��������. ��, �� ��� - ��� ��� ������� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_05");	//����� ������ ����� ������� � ��� ����� �������� ������� �� ���� ������, ����� �� ����� ����� ��������� � �������.
	};
};

func void B_AssignAmbientInfos_BAU_13(var C_Npc slf)
{
	DIA_BAU_13_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_13_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_13_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_13_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_13_STANDARD.npc = Hlp_GetInstanceID(slf);
};

