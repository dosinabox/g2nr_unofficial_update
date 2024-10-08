
instance DIA_Addon_Bloodwyn_EXIT(C_Info)
{
	npc = BDT_1085_Addon_Bloodwyn;
	nr = 999;
	condition = DIA_Addon_Bloodwyn_EXIT_Condition;
	information = DIA_Addon_Bloodwyn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Bloodwyn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bloodwyn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Bloodwyn_Dead(C_Info)
{
	npc = BDT_1085_Addon_Bloodwyn;
	nr = 2;
	condition = DIA_Addon_Bloodwyn_Dead_Condition;
	information = DIA_Addon_Bloodwyn_Dead_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Bloodwyn_Dead_Condition()
{
	if(Npc_GetDistToWP(self,"BL_RAVEN_09") <= 1000)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bloodwyn_Dead_Info()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Dead_04_00");	//��, ��� �� ���� �����?
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Dead_15_01");	//����� ����.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Dead_04_02");	//������... �������� �����.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void Bloodwyn_Choices_1()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"� � �����, � ���� ���������.",DIA_Addon_Bloodwyn_Wait_GOOD1);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"����� �����-������ �������� �����.",DIA_Addon_Bloodwyn_Wait_BAD1);
};

func void Bloodwyn_Choices_2()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"� ���, ��-������, �������� ������?",DIA_Addon_Bloodwyn_Wait_GOOD2);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"�� � ������ ������ ����...",DIA_Addon_Bloodwyn_Wait_BAD2);
};

func void Bloodwyn_Choices_3()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"��������, � ���� �� ���� ������� �����������...",DIA_Addon_Bloodwyn_Wait_GOOD3);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"��, ��� ���� ��� ����� ������� ������...",DIA_Addon_Bloodwyn_Wait_BAD3);
};


instance DIA_Addon_Bloodwyn_Wait(C_Info)
{
	npc = BDT_1085_Addon_Bloodwyn;
	nr = 2;
	condition = DIA_Addon_Bloodwyn_Wait_Condition;
	information = DIA_Addon_Bloodwyn_Wait_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Bloodwyn_Wait_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Minecrawler_Killed > 9))
	{
		return TRUE;
	};
};

var int Bloodwyn_KnowsSC;

func void DIA_Addon_Bloodwyn_Wait_Info()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_04_00");	//�� ���� ���������? �������. ������ �������� �. ����������.
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_15_01");	//������� �������.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_04_02");	//�� ��� �����?
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_15_03");	//��� ����� ���-��� ��������.
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"� ��� ������.",DIA_Addon_Bloodwyn_Wait_Raven);
};

func void DIA_Addon_Bloodwyn_Wait_Raven()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_00");	//� ��� ������.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_01");	//���, � ������ �� �������, ��� ����� ������� �������� � �����... ������, �� ��... ��� ��?
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_02");	//�� - ��� ������, �������� �� ���� ��� ��� �����. ��� �� ����� �������?! �� �� ����� �����!
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_03");	//��� ������� ��� �� ����.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_04");	//��� ������ ��� ����������, �� �� ���� �� �� ������. �� ���� ��� � �������� ����!
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_05");	//��� � ��� ������, �� ���� �� �����������, � ��� ������.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_06");	//� ���� ����, � �� �������� ��� �� ����� �������!
	Bloodwyn_KnowsSC = TRUE;
	Bloodwyn_Choices_1();
};

func void DIA_Addon_Bloodwyn_Wait_FIGHT()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_15_00");	//������ ���������. ������.
	if(Bloodwyn_KnowsSC == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_04_01");	//(������������) ��� ����� ��� ������� ������! ����� ��� ��������� ����! ��-��-��! ����, �������!
	}
	else
	{
		B_Say(self,other,"$KILLENEMY");
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void Bloodwyn_Lach()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Lach_04_00");	//��-��-�� - � ��� ����� ���� ����!
};

func void Bloodwyn_Wut()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wut_04_00");	//�-��! ��, ������ �����!
	self.attribute[ATR_STRENGTH] -= 5;
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,-25);
	if(self.attribute[ATR_HITPOINTS] > 25)
	{
		self.attribute[ATR_HITPOINTS] -= 25;
	};
};

func void Bloodwyn_Next_1()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_SayChoice_2_04_00");	//� � ������� ������� �������, �� ������� � ��������!
};

func void Bloodwyn_Next_2()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_SayChoice_3_04_00");	//�� �� ������� �������� ����, � ������ ���� ������! ��� ������ ����!
};

func void DIA_Addon_Bloodwyn_Wait_GOOD1()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD1_15_00");	//� � �����, � ���� ���������.
	Bloodwyn_Wut();
	Bloodwyn_Next_1();
	Bloodwyn_Choices_2();
};

func void DIA_Addon_Bloodwyn_Wait_BAD1()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD1_15_00");	//����� �����-������ �������� �����.
	Bloodwyn_Lach();
	Bloodwyn_Next_1();
	Bloodwyn_Choices_2();
};

func void DIA_Addon_Bloodwyn_Wait_GOOD2()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD2_15_00");	//� ���, ��-������, �������� ������?
	Bloodwyn_Wut();
	Bloodwyn_Next_2();
	Bloodwyn_Choices_3();
};

func void DIA_Addon_Bloodwyn_Wait_BAD2()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD2_15_00");	//�� � ������ ������ ����...
	Bloodwyn_Lach();
	Bloodwyn_Next_2();
	Bloodwyn_Choices_3();
};

func void DIA_Addon_Bloodwyn_Wait_GOOD3()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD3_15_00");	//��������, � ���� �� ���� ������� �����������...
	Bloodwyn_Wut();
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
};

func void DIA_Addon_Bloodwyn_Wait_BAD3()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD3_15_00");	//��, ��� ���� ��� ����� ������� ������...
	Bloodwyn_Lach();
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
};

