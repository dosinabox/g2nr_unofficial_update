
instance DIA_BAU_16_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_16_EXIT_Condition;
	information = DIA_BAU_16_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_16_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_16_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_BAU_16_JOIN_Condition;
	information = DIA_BAU_16_JOIN_Info;
	permanent = TRUE;
	description = "�������� ��� ��������� �� ���� ���������!";
};


func int DIA_BAU_16_JOIN_Condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_BAU_16_JOIN_Info()
{
	AI_Output(other,self,"DIA_BAU_16_JOIN_15_00");	//�������� ��� ��������� �� ���� ���������!
	AI_Output(self,other,"DIA_BAU_16_JOIN_16_01");	//��� ��������� ��� ���� �� �����, ������� ������ � ������, ��� ��� �������.
};


instance DIA_BAU_16_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_BAU_16_PEOPLE_Condition;
	information = DIA_BAU_16_PEOPLE_Info;
	permanent = TRUE;
	description = "��� ���������� �����?";
};


func int DIA_BAU_16_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_BAU_16_PEOPLE_15_00");	//��� ���������� �����?
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_01");	//��������, �������.
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_02");	//���� ������ ��, �� ������� ����� ������� ��� ������, ��� �� ���������.
};


instance DIA_BAU_16_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_BAU_16_LOCATION_Condition;
	information = DIA_BAU_16_LOCATION_Info;
	permanent = TRUE;
	description = "��� �� ������ ���������� ����������� �� ���� ���������?";
};


func int DIA_BAU_16_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_LOCATION_Info()
{
	AI_Output(other,self,"DIA_BAU_16_LOCATION_15_00");	//��� �� ������ ���������� ����������� �� ���� ���������?
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_01");	//����� ���� ��� �����. ����� ����� �� �������, � ������ �� ������ ������.
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_02");	//������ � ���� �� ���-������, ����� �������� ��������. ��� ��������� ����� �������.
};


instance DIA_BAU_16_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_BAU_16_STANDARD_Condition;
	information = DIA_BAU_16_STANDARD_Info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int DIA_BAU_16_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_STANDARD_Info()
{
	AI_Output(other,self,"DIA_BAU_16_STANDARD_15_00");	//��� ����������?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_01");	//������� �� ������ ������ �� �������� ��� ���� � ������! �� ������ �� ������ � ��� ����. ������ �� �������� �������� ����!
	}
	else if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_02");	//�������, ��� � ������ �������� ���������� ����� ���. ����� ��� ����� �����.
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_03");	//� �������, ��� � ������ �������� ��������� �������. �� ��� �� �����-�� ������� � ���.
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_04");	//���-�� �� ��������� ���� ������. � ���� �� ����, ������ ��� ��� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_05");	//�������� ����������� � ������ �������� - ���������, �����?
	};
};

func void B_AssignAmbientInfos_BAU_16(var C_Npc slf)
{
	DIA_BAU_16_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_16_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_16_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_16_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_16_STANDARD.npc = Hlp_GetInstanceID(slf);
};

