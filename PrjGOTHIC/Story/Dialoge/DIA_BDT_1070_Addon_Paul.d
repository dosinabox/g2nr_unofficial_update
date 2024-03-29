
instance DIA_Addon_Paul_EXIT(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 999;
	condition = DIA_Addon_Paul_EXIT_Condition;
	information = DIA_Addon_Paul_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Paul_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Paul_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Paul_Hi(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 1;
	condition = DIA_Addon_Paul_Hi_Condition;
	information = DIA_Addon_Paul_Hi_Info;
	permanent = FALSE;
	description = "� ���� ���� ���-������ �� ���������� �����������?";
};


func int DIA_Addon_Paul_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Paul_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_Hi_15_00");	//� ���� ���� ���-������ �� ���������� �����������?
	AI_Output(self,other,"DIA_Addon_Paul_Hi_03_01");	//� ���� ���� �����. � ���� ������ ��������� ������ ����.
	AI_Output(self,other,"DIA_Addon_Paul_Hi_03_02");	//�� � �� ����� ��. ��� ������������, ��� � ���� �������� �������.
};


instance DIA_Addon_Paul_Huno(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 2;
	condition = DIA_Addon_Paul_Huno_Condition;
	information = DIA_Addon_Paul_Huno_Info;
	permanent = FALSE;
	description = "�� ��������� �� ����?";
};


func int DIA_Addon_Paul_Huno_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_Huno_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_Huno_15_00");	//�� ��������� �� ����?
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_01");	//� ����� ���������� ������� ������, ���� �������� � ���. �� � ��� ��� ������� �� ��� ��� ������.
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_02");	//�� ������, ��� � ��� ������ �� ���������.
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_03");	//� ��� � ���� ��� ��������, ����� ��� ���������� �������� � ����?
};


instance DIA_Addon_Paul_Attentat(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 3;
	condition = DIA_Addon_Paul_Attentat_Condition;
	information = DIA_Addon_Paul_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Paul_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Paul_Attentat_03_00");	//������, ��������. � ��� �� ������ �� ���������! ��� �� ������ �� ����?
};


instance DIA_Addon_Paul_HunoVerdacht(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 4;
	condition = DIA_Addon_Paul_HunoVerdacht_Condition;
	information = DIA_Addon_Paul_HunoVerdacht_Info;
	permanent = FALSE;
	description = "���� ������������� � ������������ � ���������...";
};


func int DIA_Addon_Paul_HunoVerdacht_Condition()
{
	if(((Finn_TellAll == TRUE) || (Emilio_TellAll == TRUE)) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_HunoVerdacht_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_HunoVerdacht_15_00");	//���� ������������� � ������������ � ���������...
	AI_Output(self,other,"DIA_Addon_Paul_HunoVerdacht_03_01");	//� ������ ��� ��� �� ����!
};


instance DIA_Addon_Paul_HunoArbeit(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 5;
	condition = DIA_Addon_Paul_HunoArbeit_Condition;
	information = DIA_Addon_Paul_HunoArbeit_Info;
	permanent = FALSE;
	description = "�� �� �� ��������� �� ����! ��� ��� �� ������ ���-�� �����!";
};


func int DIA_Addon_Paul_HunoArbeit_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_Huno) && Npc_KnowsInfo(other,DIA_Addon_Paul_HunoVerdacht) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_HunoArbeit_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_HunoArbeit_15_00");	//�� �� �� ��������� �� ����! ��� ��� �� ������ ���-�� �����!
	AI_Output(self,other,"DIA_Addon_Paul_HunoArbeit_03_01");	//(� ��������) � ������ �� ���� - ������! ��� ����� ����!
	Npc_ExchangeRoutine(self,"AWAY");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Paul_FearEsteban(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 5;
	condition = DIA_Addon_Paul_FearEsteban_Condition;
	information = DIA_Addon_Paul_FearEsteban_Info;
	permanent = FALSE;
	description = "�� ������, ��� ������� ������� � �����, ���� ������, ��� �� ����������� ����?";
};


func int DIA_Addon_Paul_FearEsteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_HunoArbeit) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_FearEsteban_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_FearEsteban_15_00");	//�� ������, ��� ������� ������� � �����, ���� ������, ��� �� ����������� ����?
	AI_Output(self,other,"DIA_Addon_Paul_FearEsteban_03_01");	//������! ������ ���� � �����. � �� ���� �������� ��������� � �����.
	Npc_ExchangeRoutine(self,"PRESTART");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Paul_MaulPaul(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 5;
	condition = DIA_Addon_Paul_MaulPaul_Condition;
	information = DIA_Addon_Paul_MaulPaul_Info;
	permanent = FALSE;
	description = "���, ����� ���, ��� ���� ��������, ��� � ������� ���� �� ���� ������!";
};


func int DIA_Addon_Paul_MaulPaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_FearEsteban) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_MaulPaul_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_00");	//(����������) ���, ����� ���, ��� ���� ��������, ��� � ������� ���� �� ���� ������!
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_01");	//�� �� ������ ������ ���� ������ ������, ��� �� ��������� �� �����.
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_02");	//(�������) ����!
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_03");	//�� ������ ���������!
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_04");	//(�����������) ���...
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_05");	//(�����������) � ���� ������, ��� � ���� � ���������, ��, �����-�� �����������.
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_06");	//(�����������) ��� ��� ��... �� ��������� �������� �� ��������. ��� ��� �������� ��� ����, �� � ��� �����...
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_07");	//� ������ ������ � ������� ������ �� �������.
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_08");	//�������! ��� ������, ��� ���� �� ��� ������.
	Npc_ExchangeRoutine(self,"START");
	Paul_TellAll = TRUE;
	B_LogEntry(Topic_Addon_Esteban,"��� ������, ��� ���� ��������� ��������, ������ ��� �� ������������� ���� ����.");
};


instance DIA_Addon_BDT_1070_Paul_Mine(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 2;
	condition = DIA_Addon_Paul_Mine_Condition;
	information = DIA_Addon_Paul_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Paul_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && Npc_HasItems(other,ItMi_Addon_Stone_01))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_1070_Paul_Mine_03_00");	//�������! ���, � ����, ����� �� ���� �� ��� ��� ����.
	B_GiveInvItems(self,other,ItMi_Nugget,2);
	Player_SentBuddler += 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Paul_PERM(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 99;
	condition = DIA_Addon_Paul_PERM_Condition;
	information = DIA_Addon_Paul_PERM_Info;
	permanent = TRUE;
	description = "� ����� ��� � �������?";
};


func int DIA_Addon_Paul_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_Huno))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_PERM_15_00");	//� ����� ��� � �������?
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_07") <= 500)
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_01");	//��, � ������ ���� ������ �� ���� �����!
	}
	else if((Paul_TellAll == TRUE) && (Huno_zuSnaf == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_02");	//� ��������� ���� ���, ��� � ����!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_03");	//� ������ ���� ������ ���� ������, ��������!
	};
};

