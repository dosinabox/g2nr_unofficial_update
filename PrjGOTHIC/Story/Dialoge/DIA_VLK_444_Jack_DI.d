
instance DIA_Jack_DI_EXIT(C_Info)
{
	npc = VLK_444_Jack_DI;
	nr = 999;
	condition = DIA_Jack_DI_EXIT_Condition;
	information = DIA_Jack_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jack_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_DI_GREET(C_Info)
{
	npc = VLK_444_Jack_DI;
	nr = 4;
	condition = DIA_Jack_DI_GREET_Condition;
	information = DIA_Jack_DI_GREET_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Jack_DI_GREET_Condition()
{
	if((UndeadDragonIsDead == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Jack_DI_GREET_Info()
{
	if(OrkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_00");	//�������, �� ������, ��� �������, ��������.
		AI_Output(other,self,"DIA_Jack_DI_GREET_15_01");	//�� ��� �� ����� ����� �������.
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_02");	//���� ���������, � ����������� ����� ����� � ����������.
		AI_StopProcessInfos(self);
	}
	else
	{
		if(CaptainIsBackToStartPosition == FALSE)
		{
			AI_Output(other,self,"DIA_Jack_DI_GREET_15_03");	//��� �� ����� �������?
			B_GivePlayerXP(XP_AmbientKap6);
		};
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_04");	//���� �� ��� ����� ��������� ���� ��, � ����� ������� ������. � ����� ��� ��� ����! �� ������?
		AI_Output(other,self,"DIA_Jack_DI_GREET_15_05");	//�� ������ ������. � �� ���� ���������.
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_06");	//����� ����������.
		AI_StopProcessInfos(self);
		if(CaptainIsBackToStartPosition == FALSE)
		{
			Npc_ExchangeRoutine(self,"START");
			CaptainIsBackToStartPosition = TRUE;
		};
	};
};


instance DIA_Jack_DI_UndeadDragonDead(C_Info)
{
	npc = VLK_444_Jack_DI;
	nr = 4;
	condition = DIA_Jack_DI_UndeadDragonDead_Condition;
	information = DIA_Jack_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "� ������ ���. � ��������� �����!";
};


func int DIA_Jack_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Jack_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Jack_DI_UndeadDragonDead_15_00");	//� ������ ���. � ��������� �����!
	AI_Output(self,other,"DIA_Jack_DI_UndeadDragonDead_14_01");	//� ��������, ��� ��� �������� ������. ��, ������ ��������, ��������� ��������� ����� � �� ��� ��� ������.
	AI_Output(self,other,"DIA_Jack_DI_UndeadDragonDead_14_02");	//�� ����� ������� ������� ������?
	Info_ClearChoices(DIA_Jack_DI_UndeadDragonDead);
	Info_AddChoice(DIA_Jack_DI_UndeadDragonDead,"������� �������.",DIA_Jack_DI_UndeadDragonDead_moment);
	Info_AddChoice(DIA_Jack_DI_UndeadDragonDead,"��. �������� � ����.",DIA_Jack_DI_UndeadDragonDead_over);
};

func void DIA_Jack_DI_UndeadDragonDead_moment()
{
	AI_Output(other,self,"DIA_Jack_DI_UndeadDragonDead_moment_15_00");	//������� �������. � ��� ���-��� ������ �������.
	AI_Output(self,other,"DIA_Jack_DI_UndeadDragonDead_moment_14_01");	//����� ����������. � �� ���� ���������� ����� �����.
	AI_StopProcessInfos(self);
};

func void DIA_Jack_DI_UndeadDragonDead_over()
{
	AI_StopProcessInfos(self);
	B_Extro_Avi();
};

