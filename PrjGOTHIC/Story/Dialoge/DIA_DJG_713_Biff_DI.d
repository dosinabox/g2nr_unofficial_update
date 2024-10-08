
instance DIA_Biff_DI_EXIT(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 999;
	condition = DIA_Biff_DI_EXIT_Condition;
	information = DIA_Biff_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Biff_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Biff_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Biff_DI_HALLO(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 10;
	condition = DIA_Biff_DI_HALLO_Condition;
	information = DIA_Biff_DI_HALLO_Info;
	important = TRUE;
};


func int DIA_Biff_DI_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_HALLO_Info()
{
	AI_Output(self,other,"DIA_Biff_DI_HALLO_07_00");	//�? ��� ��� �� ���������, ��� �� ��� ������?
	if(!Npc_KnowsInfo(other,DIA_Biff_DI_ORKS))
	{
		AI_Output(other,self,"DIA_Biff_DI_HALLO_15_01");	//��� � ��� ������� ���� ������, � ����?
	};
	AI_Output(other,self,"DIA_Biff_DI_HALLO_15_02");	//������ ���� ������ - �������� �������.
	AI_Output(other,self,"DIA_Biff_DI_HALLO_15_03");	//��� �� ��������� ����� �����.
	AI_Output(self,other,"DIA_Biff_DI_HALLO_07_04");	//����. ���� �� � ���� ��� �������, � �� ����� ������� � ��������.
	AI_StopProcessInfos(self);
};


instance DIA_Biff_DI_perm(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 5;
	condition = DIA_Biff_DI_perm_Condition;
	information = DIA_Biff_DI_perm_Info;
	permanent = TRUE;
	description = "�� ����� ��� ��������?";
};


func int DIA_Biff_DI_perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Biff_DI_HALLO) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_perm_Info()
{
	AI_Output(other,self,"DIA_Biff_DI_perm_15_00");	//�� ����� ��� ��������?
	AI_Output(self,other,"DIA_Biff_DI_perm_07_01");	//(�������) ��, ��. ��� ����.
	AI_StopProcessInfos(self);
};


instance DIA_Biff_DI_ORKS(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 5;
	condition = DIA_Biff_DI_ORKS_Condition;
	information = DIA_Biff_DI_ORKS_Info;
	important = TRUE;
};


func int DIA_Biff_DI_ORKS_Condition()
{
	if((Npc_GetDistToWP(self,"DI_SHIP_03") < 1000) && (OrkSturmDI == TRUE) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_ORKS_Info()
{
	AI_Output(self,other,"DIA_Biff_DI_ORKS_07_00");	//��� ������� �����!
	AI_Output(other,self,"DIA_Biff_DI_ORKS_15_01");	//����, ��� �� ������� �����? �� ������ ��� �������� �������.
	AI_Output(self,other,"DIA_Biff_DI_ORKS_07_02");	//�� ������ �� �� �������.
	B_GivePlayerXP(XP_AmbientKap6);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Biff_DI_UNDEADDRGDEAD(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 4;
	condition = DIA_Biff_DI_UNDEADDRGDEAD_Condition;
	information = DIA_Biff_DI_UNDEADDRGDEAD_Info;
	important = TRUE;
};


func int DIA_Biff_DI_UNDEADDRGDEAD_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_UNDEADDRGDEAD_Info()
{
	AI_Output(self,other,"DIA_Biff_DI_UNDEADDRGDEAD_07_00");	//���, ��� �������?
	AI_Output(other,self,"DIA_Biff_DI_UNDEADDRGDEAD_15_01");	//����� �� ��.
	AI_Output(self,other,"DIA_Biff_DI_UNDEADDRGDEAD_07_02");	//� ������, ���� �...
	AI_Output(other,self,"DIA_Biff_DI_UNDEADDRGDEAD_15_03");	//�� ������ ����������� ���� ������, ���� ������.
	AI_Output(self,other,"DIA_Biff_DI_UNDEADDRGDEAD_07_04");	//�������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PLUNDERTEMPEL");
};


instance DIA_Biff_DI_plunder(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 5;
	condition = DIA_Biff_DI_plunder_Condition;
	information = DIA_Biff_DI_plunder_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Biff_DI_plunder_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Biff_DI_UNDEADDRGDEAD))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_plunder_Info()
{
	AI_Output(self,other,"DIA_Biff_DI_plunder_07_00");	//����. �� ������.
	AI_StopProcessInfos(self);
};

