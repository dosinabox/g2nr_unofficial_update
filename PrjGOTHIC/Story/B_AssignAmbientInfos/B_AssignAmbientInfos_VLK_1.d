
instance DIA_VLK_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_1_EXIT_Condition;
	information = DIA_VLK_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_1_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_1_JOIN_Condition;
	information = DIA_VLK_1_JOIN_Info;
	permanent = TRUE;
	description = "��� ��� ����� ����������� ����� ������?";
};


func int DIA_VLK_1_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_VLK_1_JOIN_Info()
{
	AI_Output(other,self,"DIA_VLK_1_JOIN_15_00");	//��� ��� ����� ����������� ����� ������?
	AI_Output(self,other,"DIA_VLK_1_JOIN_01_01");	//����� ���� ��������� ������! ���, � ���� ���� ������� � ��������, ��������� ���������� ������.
};


instance DIA_VLK_1_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_1_PEOPLE_Condition;
	information = DIA_VLK_1_PEOPLE_Info;
	permanent = TRUE;
	description = "� ��� ����� ����� ����������� ��������?";
};


func int DIA_VLK_1_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_1_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_VLK_1_PEOPLE_15_00");	//� ��� ����� ����� ����������� ��������?
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_01");	//(�������) �� ���������� ������� ��� ���� ���������� � �����. �� ����� ������ �������� � ��������� ��� ������ � ������.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_02");	//�� ����������� ���� �����. �� ������ ����� ����������, �� ������ � �� ������.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_03");	//���� ����� - ��� ������ ����. �� ����������� ��������� ������, � ����� ��������� � �������� �����.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_04");	//���� ������ ����-�� ��������� ���������, ���� ������� ������ ��������� ����� ������ �����.
	Player_KnowsLordHagen = TRUE;
};


instance DIA_VLK_1_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_1_LOCATION_Condition;
	information = DIA_VLK_1_LOCATION_Info;
	permanent = TRUE;
	description = "��� ����������� ���� � ������?";
};


func int DIA_VLK_1_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_1_LOCATION_Info()
{
	AI_Output(other,self,"DIA_VLK_1_LOCATION_15_00");	//��� ����������� ���� � ������?
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_01");	//����� �� ������ ������ ����� ���, ��� ������ ����� �����������. ���� � �������� �� �����, ���� � ������ ����� ������.
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_02");	//�� ����� ���, ��� ����� ��������, ����� ��������.
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_03");	//���� � ���� ������������ �����, �����, ��������, ��������� ����� ������ ������ ����. ��� ��� ��������� � ����� ������ ��������� ��������, ���� ���� �� ������ ����� ������.
};


instance DIA_VLK_1_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_1_STANDARD_Condition;
	information = DIA_VLK_1_STANDARD_Info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int DIA_VLK_1_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_1_STANDARD_Info()
{
	AI_Output(other,self,"DIA_VLK_1_STANDARD_15_00");	//��� ����������?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_01");	//� ��� ��� ��� ������ ������, �������� �������� � ������� ��������������� ���������� ������������. ��� �����, ��� �� ���������. ��� ��� ����� ������.
	}
	else if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_02");	//���� ����� ������� ������. �� ��� ��� �� ���������� �������������� � �����. ���� ��������� �� ���������, ������ ������� ����� ���� ����� ������ ���, ��� �������.
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_03");	//� ������, ��� ������� ������������ � ������. ������� ������ ���� � ������ �����. ���� ����������, ��� ������� ����� � ����� ������ �� ��� � ������.
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_04");	//� ������, ��� ��������� �� ��������� ����� ����������� ��������� �� ��������. ��, �� ������� ����, ��� �������� ���� ���-�� ��������!
	}
	else
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_05");	//�������, ��� ������� ����������! ���� ����� �������� ����� �����, ����� ������� ��������� ������ �� ������ ��������.
	};
};

func void B_AssignAmbientInfos_VLK_1(var C_Npc slf)
{
	DIA_VLK_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_1_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_1_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_1_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_1_STANDARD.npc = Hlp_GetInstanceID(slf);
};

