
instance DIA_328_Miliz_EXIT(C_Info)
{
	npc = MIL_328_Miliz;
	nr = 999;
	condition = DIA_328_Miliz_EXIT_Condition;
	information = DIA_328_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_328_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_328_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Mil_328_Checkpoint = "NW_CITY_HABOUR_HUT_03_IN_05";

instance DIA_328_Miliz_Hi(C_Info)
{
	npc = MIL_328_Miliz;
	nr = 1;
	condition = DIA_328_Miliz_Hi_Condition;
	information = DIA_328_Miliz_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_328_Miliz_Hi_Condition()
{
	return TRUE;
};

func void DIA_328_Miliz_Hi_Info()
{
	B_PlayerEnteredCity();
	AI_Output(self,other,"DIA_328_Miliz_Hi_08_00");	//��, ���� ������ ������ �����. �������?
	if(Npc_GetDistToWP(other,"NW_CITY_HABOUR_HUT_03_IN_06") <= 600)
	{
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	}
	else
	{
		AI_Output(other,self,"DIA_328_Miliz_Hi_15_01");	//��� �� �����?
		AI_Output(self,other,"DIA_328_Miliz_Hi_08_02");	//��� �� ���� ����! ����� � �������. �����?
		AI_Output(other,self,"DIA_328_Miliz_Hi_15_03");	//�������? ��� ���? ��� ����� ���������?
		AI_Output(self,other,"DIA_328_Miliz_Hi_08_04");	//��, ���� ����� ��������� � ���� �������, �����? ��� ��� ����������, ��� � ������� ���� �����.
		other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_328_Checkpoint);
		AI_StopProcessInfos_Pickpocket();
		Npc_SetRefuseTalk(self,20);
	};
};


instance DIA_328_Miliz_Kill(C_Info)
{
	npc = MIL_328_Miliz;
	nr = 2;
	condition = DIA_328_Miliz_Kill_Condition;
	information = DIA_328_Miliz_Kill_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_328_Miliz_Kill_Condition()
{
	if(Npc_KnowsInfo(other,DIA_328_Miliz_Hi))
	{
		if(Npc_IsInState(self,ZS_Talk))
		{
			return TRUE;
		}
		else if(!Npc_RefuseTalk(self))
		{
			return TRUE;
		}
		else if((Npc_GetDistToWP(other,Mil_328_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
		{
			return TRUE;
		};
	};
};

func void DIA_328_Miliz_Kill_Info()
{
	AI_Output(self,other,"DIA_328_Miliz_Kill_08_00");	//��, �� ��� ��� �����! ����� � �� ������ ����, ����� �� ����������?
	AI_Output(self,other,"DIA_328_Miliz_Kill_08_01");	//��, �������! ������ � ������ ����, ��� ����� �������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

