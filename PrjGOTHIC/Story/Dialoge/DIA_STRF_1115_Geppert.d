
instance DIA_Geppert_EXIT(C_Info)
{
	npc = STRF_1115_Geppert;
	nr = 999;
	condition = DIA_Geppert_EXIT_Condition;
	information = DIA_Geppert_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Geppert_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Geppert_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Geppert_HALLO(C_Info)
{
	npc = STRF_1115_Geppert;
	nr = 4;
	condition = DIA_Geppert_HALLO_Condition;
	information = DIA_Geppert_HALLO_Info;
	important = TRUE;
};


func int DIA_Geppert_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Geppert_HALLO_Info()
{
	AI_Output(self,other,"DIA_Geppert_HALLO_10_00");	//����! ��� ����?
	AI_Output(self,other,"DIA_Geppert_HALLO_10_01");	//�� ������ �� �� ���, ����� ��������� ���� �����, � �����? ���?
	AI_Output(self,other,"DIA_Geppert_HALLO_10_02");	//� ������ ������������ ����. � �� �� ��� �� ������� �����.
};


instance DIA_Geppert_WHAT(C_Info)
{
	npc = STRF_1115_Geppert;
	nr = 1;
	condition = DIA_Geppert_WHAT_Condition;
	information = DIA_Geppert_WHAT_Info;
	description = "��� �� ������� �����?";
};


func int DIA_Geppert_WHAT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Geppert_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Geppert_WHAT_Info()
{
	AI_Output(other,self,"DIA_Geppert_HALLO_Wasmachtihr_15_00");	//��� �� ������� �����?
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_01");	//��� �� ��������� ������? � ��������� ����� �� ����� ������.
		AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_02");	//������ ������ ������ �� �����. ���� ���� ����, ���� ����������.
	}
	else
	{
		AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_03");	//��������� ������. ���������! ��� �� ���? � ���� ������ �� ��������� ������ ���� �������.
	};
	AI_Output(self,other,"DIA_Geppert_HALLO_Wasmachtihr_10_04");	//� �� ������� �����, � �����. � �����.
};

instance DIA_Geppert_WHO(C_Info)
{
	npc = STRF_1115_Geppert;
	nr = 2;
	condition = DIA_Geppert_WHO_Condition;
	information = DIA_Geppert_WHO_Info;
	description = "�� ��������� ���������, ���������?";
};


func int DIA_Geppert_WHO_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Geppert_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Geppert_WHO_Info()
{
	AI_Output(other,self,"DIA_Geppert_HALLO_Flucht_15_00");	//�� ��������� ���������, ���������?
	AI_Output(self,other,"DIA_Geppert_HALLO_Flucht_10_01");	//����� �� ��������������. � ������ ���, ��-������, � ������� � ��� ������� ����?
};

instance DIA_Geppert_BRATEN(C_Info)
{
	npc = STRF_1115_Geppert;
	nr = 5;
	condition = DIA_Geppert_BRATEN_Condition;
	information = DIA_Geppert_BRATEN_Info;
	permanent = TRUE;
	description = "���� ������ ��� ��������� ������.";
};


func int DIA_Geppert_BRATEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Geppert_WHAT) && Npc_KnowsInfo(other,DIA_Geppert_WHO))
	{
		return TRUE;
	};
};

func void DIA_Geppert_BRATEN_Info()
{
	AI_Output(other,self,"DIA_Geppert_BRATEN_15_00");	//���� ������ ��� ��������� ������.
	AI_Output(self,other,"DIA_Geppert_BRATEN_10_01");	//�� ������!
	AI_StopProcessInfos(self);
};


instance DIA_Geppert_PICKPOCKET(C_Info)
{
	npc = STRF_1115_Geppert;
	nr = 900;
	condition = DIA_Geppert_PICKPOCKET_Condition;
	information = DIA_Geppert_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Geppert_PICKPOCKET_Condition()
{
	return C_Beklauen(56,5);
};

func void DIA_Geppert_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Geppert_PICKPOCKET);
	Info_AddChoice(DIA_Geppert_PICKPOCKET,Dialog_Back,DIA_Geppert_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Geppert_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Geppert_PICKPOCKET_DoIt);
};

func void DIA_Geppert_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Geppert_PICKPOCKET);
};

func void DIA_Geppert_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Geppert_PICKPOCKET);
};

