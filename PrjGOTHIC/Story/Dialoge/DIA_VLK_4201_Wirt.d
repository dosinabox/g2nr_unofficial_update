
instance DIA_Wirt_EXIT(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 999;
	condition = DIA_Wirt_EXIT_Condition;
	information = DIA_Wirt_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wirt_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wirt_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Wirt_GiveBeer;
var int Wirt_GiveBeer_Day;

instance DIA_Wirt_Hallo(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 2;
	condition = DIA_Wirt_Hallo_Condition;
	information = DIA_Wirt_Hallo_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Wirt_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Wirt_Hallo_Info()
{
	var int randy;
	if(other.guild == GIL_PAL)
	{
		randy = Hlp_Random(3);
	}
	else
	{
		randy = Hlp_Random(4);
	};
	if((Wirt_GiveBeer == FALSE) || (Wirt_GiveBeer_Day < Wld_GetDay()))
	{
		AI_Output(self,other,"DIA_Wirt_Hallo_14_00");	//��, �� ���������, �������. ������� ��������� ����.
		B_GiveInvItems(self,other,ItFo_Beer,1);
		Wirt_GiveBeer_Day = B_GetDayPlus();
		Wirt_GiveBeer = TRUE;
	};
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_Wirt_Hallo_14_02");	//��� ������ �����, ��� ������ ��������� ���� ����� ������.
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_Wirt_Hallo_14_01");	//���� ����� ����������� �� ��������� ����� ����������� ����.
	}
	else if(randy == 2)
	{
		AI_Output(self,other,"DIA_Wirt_Hallo_14_04");	//����� �������� � �������� ��� ������, �� ���� '������ �����������' ��������� ����� ������ ���� �� ���� �������.
	}
	else if(randy == 3)
	{
		AI_Output(self,other,"DIA_Wirt_Hallo_14_03");	//�������� �� ���� ���������� ����. � �� ������ ���������� ����� ���� � ������������ ������.
	};
	AI_StopProcessInfos_Pickpocket();
};

