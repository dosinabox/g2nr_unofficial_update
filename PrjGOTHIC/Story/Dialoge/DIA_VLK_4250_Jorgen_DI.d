
instance DIA_Jorgen_DI_EXIT(C_Info)
{
	npc = VLK_4250_Jorgen_DI;
	nr = 999;
	condition = DIA_Jorgen_DI_EXIT_Condition;
	information = DIA_Jorgen_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jorgen_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jorgen_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jorgen_DI_Hallo(C_Info)
{
	npc = VLK_4250_Jorgen_DI;
	nr = 4;
	condition = DIA_Jorgen_DI_Hallo_Condition;
	information = DIA_Jorgen_DI_Hallo_Info;
	permanent = TRUE;
	description = "��� � �������?";
};


func int DIA_Jorgen_DI_Hallo_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_Jorgen_DI_Hallo_15_00");	//��� � �������?
	if(OrkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_DI_Hallo_07_01");	//������� - ���� ��� ������� �� ������������ � ���...
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_DI_Hallo_07_02");	//��� �� �������� ��������� ����� �����. ��� ��� ���������� - ����� ��������� ������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Jorgen_DI_UndeadDragonDead(C_Info)
{
	npc = VLK_4250_Jorgen_DI;
	nr = 4;
	condition = DIA_Jorgen_DI_UndeadDragonDead_Condition;
	information = DIA_Jorgen_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "����� ������ �����.";
};


func int DIA_Jorgen_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Jorgen_DI_UndeadDragonDead_15_00");	//����� ������ �����.
	AI_Output(self,other,"DIA_Jorgen_DI_UndeadDragonDead_07_01");	//��� ������� �������. �������, ��� ������ ������ �� ����� �� ���� �������?
	Info_ClearChoices(DIA_Jorgen_DI_UndeadDragonDead);
	Info_AddChoice(DIA_Jorgen_DI_UndeadDragonDead,"������� �������.",DIA_Jorgen_DI_UndeadDragonDead_moment);
	Info_AddChoice(DIA_Jorgen_DI_UndeadDragonDead,"���, �� ����� ������������ � ����.",DIA_Jorgen_DI_UndeadDragonDead_over);
};

func void DIA_Jorgen_DI_UndeadDragonDead_moment()
{
	AI_Output(other,self,"DIA_Jorgen_DI_UndeadDragonDead_moment_15_00");	//������� �������. � ����� ������� ���-���.
	AI_Output(self,other,"DIA_Jorgen_DI_UndeadDragonDead_moment_07_01");	//������. �� ����������.
	AI_StopProcessInfos(self);
};

func void DIA_Jorgen_DI_UndeadDragonDead_over()
{
	AI_StopProcessInfos(self);
	B_Extro_Avi();
};

