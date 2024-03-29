
instance DIA_Attila_EXIT(C_Info)
{
	npc = VLK_494_Attila;
	nr = 999;
	condition = DIA_Attila_EXIT_Condition;
	information = DIA_Attila_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Attila_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Attila_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Attila_Hallo(C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_Hallo_Condition;
	information = DIA_Attila_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Attila_Hallo_Condition()
{
	if(MIS_ThiefGuild_sucked == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Attila_Hallo_Info()
{
	AI_Output(self,other,"DIA_Attila_Hallo_09_00");	//(��������) ��, �������. � ���� ����, ���������.
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo,"��� ���� ����� �� ����?",DIA_Attila_Hallo_Was);
	Info_AddChoice(DIA_Attila_Hallo,"��� ��?",DIA_Attila_Hallo_Wer);
	B_GivePlayerXP(XP_Attila_MetHim);
};

func void B_Attila_WhoAreYou()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Wer_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_01");	//���� ����� ������... �� ����� ��� ��� �����? ���� ����� ������ �� ������.
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_02");	//�� ��� ������ �����, ���������. (���� �������)
};

func void DIA_Attila_Hallo_Wer()
{
	B_Attila_WhoAreYou();
	Knows_Attila_Wer = TRUE;
	Info_ClearChoices(DIA_Attila_Hallo);
	if(Knows_Attila_Was == FALSE)
	{
		Info_AddChoice(DIA_Attila_Hallo,"��� ���� ����� �� ����?",DIA_Attila_Hallo_Was);
	};
	Info_AddChoice(DIA_Attila_Hallo,"� ���� ���� ���� ����?",DIA_Attila_Hallo_Theater);
};

func void DIA_Attila_Hallo_Was()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Was_15_00");	//��� ���� ����� �� ����?
	AI_Output(self,other,"DIA_Attila_Hallo_Was_09_01");	//� �����, ����� ��������� ���� ��������� �����. � ����� �����, � ��������� ����� ����.
	Knows_Attila_Was = TRUE;
	Info_ClearChoices(DIA_Attila_Hallo);
	if(Knows_Attila_Wer == FALSE)
	{
		Info_AddChoice(DIA_Attila_Hallo,"��� ��?",DIA_Attila_Hallo_Wer);
	};
	Info_AddChoice(DIA_Attila_Hallo,"��� ������ ���� �� ���?",DIA_Attila_Hallo_Auftrag);
	Info_AddChoice(DIA_Attila_Hallo,"� ���� ���� ���� ����?",DIA_Attila_Hallo_Theater);
};

func void DIA_Attila_Hallo_Theater()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Theater_15_00");	//� ���� ���� ���� ����?
	AI_Output(self,other,"DIA_Attila_Hallo_Theater_09_01");	//�� �� ������ ������� � ���������. ������ ��� ����������� �������� � �������������.
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo,"�, �������, �����.",DIA_Attila_Hallo_Ende);
	Info_AddChoice(DIA_Attila_Hallo,"��� ������ ���� �� ���?",DIA_Attila_Hallo_Auftrag);
	Info_AddChoice(DIA_Attila_Hallo,"������ �� ������ ����� ����?",DIA_Attila_Hallo_Warum);
};

func void DIA_Attila_Hallo_Ende()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Ende_15_00");	//�, �������, �����.
	AI_Output(self,other,"DIA_Attila_Hallo_Ende_09_01");	//�����... � �� ���� ��������� ���� �����. �������. ������ ����� �������.
	AI_DrawWeapon(self);
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo,"��� ������ ���� �� ���?",DIA_Attila_Hallo_Auftrag);
	Info_AddChoice(DIA_Attila_Hallo,"������ �� ������ ����� ����?",DIA_Attila_Hallo_Warum);
};

func void DIA_Attila_Hallo_Auftrag()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Auftrag_15_00");	//��� ������ ���� �� ���?
	AI_Output(self,other,"DIA_Attila_Hallo_Auftrag_09_01");	//��� ������� ��������� �������� � ����, ��� � �.
	AI_Output(self,other,"DIA_Attila_Hallo_Auftrag_09_02");	//� �������� ����� ��������� ��������, ��� � �� ���� ����� ���������� �� �� ���, �� �� ����������.
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo,"������ �� ������ ����� ����?",DIA_Attila_Hallo_Warum);
};

func void DIA_Attila_Hallo_Warum()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Warum_15_00");	//������ �� ������ ����� ����?
	if(Halvor_Ausgeliefert == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_01");	//�� ���� �������. ������ �� ����� � ������. ��� �� ������.
	}
	else if(Betrayal_Halvor == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_01_add");	//�� ���� �������. ��� �� ������.
	};
	if(Rengaru_InKnast == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_02");	//�� ������ ������� ���������. �� ����� ���� ������ �������, �� ���� �� ��������� ������ �����.
	};
	if(Nagur_Ausgeliefert == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_03");	//����� ����� �� ������� �� ����� ����. ���-���� �������, ��� ��� ��������������� ������.
	};
	if((Betrayal_Halvor == FALSE) && (Rengaru_InKnast == FALSE) && (Nagur_Ausgeliefert == FALSE))
	{
		B_Say(self,other,"$DIEENEMY");
	};
	AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_04");	//��� ������� ���������� ����. ����� �� ���� ���� ��������� ��� ���� ������, ��� ������� ����.
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo,"� ���� ���� ���� ������ - ����� ������.",DIA_Attila_Hallo_Gold);
	if(!Npc_HasReadiedWeapon(other))
	{
		Info_AddChoice(DIA_Attila_Hallo,"��� ��� ���� �� ������ ���� ������.",DIA_Attila_Hallo_Attacke);
	};
};

func void DIA_Attila_Hallo_Gold()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Gold_15_00");	//� ���� ���� ���� ������ - ����� ������.
	AI_Output(self,other,"DIA_Attila_Hallo_Gold_09_01");	//������. � �� �� ���� ���� ������. ������������ ����, ������� �� ��������� - ���� �����. � ��������� �� �� ����� ������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Attila_Hallo_Attacke()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Attacke_15_00");	//��� ��� ���� �� ������ ���� ������.
	if(Npc_HasEquippedWeapon(other) || Npc_HasReadiedWeapon(other))
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Attacke_09_01");	//������, ����������� � ����� ��������� �����.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Attacke_09_02");	//�� � ���� ��� �������� ������ �� �����. � ���� �������� ����� ���� �������, ���������. ������ ��� ������.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,2);
	};
};


instance DIA_Attila_Willkommen(C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_Willkommen_Condition;
	information = DIA_Attila_Willkommen_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Attila_Willkommen_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ThiefGuild_sucked == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Attila_Willkommen_Info()
{
	AI_Output(self,other,"DIA_Attila_Willkommen_09_00");	//��, �������. � ���� ����, ���������.
	B_GivePlayerXP(XP_Attila_Friend);
	AI_Output(other,self,"DIA_Attila_Willkommen_15_01");	//��� �� � ��� ���� ����� �� ����?
	AI_Output(self,other,"DIA_Attila_Willkommen_09_02");	//��� �������. ����� ���� ��, ��� �� �����. �� ��������� �������� - ���� ���� �� ��� �� ���� �� ����.
	AI_Output(self,other,"DIA_Attila_Willkommen_09_03");	//��������� ����������� ���������� ��� ���� ����������. � ��� ���� ���� ����. ��� ��������� ���.
	AI_Output(other,self,"DIA_Attila_Willkommen_15_04");	//��, ������ ����� ��� ��� ���.
	AI_Output(self,other,"DIA_Attila_Willkommen_09_05");	//� ���� ���� ��� ���� �������. � ��� ��������� � ����� �����, ���������. (���� �������)
	B_GiveInvItems(self,other,ItKe_ThiefGuildKey_MIS,1);
	Attila_Key = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_DropDeadAndKill] = FALSE;
	self.aivar[AIV_ToughGuy] = TRUE;
	Npc_ExchangeRoutine(self,"AFTER");
};


instance DIA_Attila_NachSchluessel(C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_NachSchluessel_Condition;
	information = DIA_Attila_NachSchluessel_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Attila_NachSchluessel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Attila_Wer) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Attila_NachSchluessel_Info()
{
	AI_Output(self,other,"DIA_Attila_NachSchluessel_09_00");	//��� ������ ��������� - ����.
	AI_Output(self,other,"DIA_Attila_NachSchluessel_09_01");	//�� ��� �����, �����, ���� ���� ����� �����������...
	AI_StopProcessInfos_Pickpocket();
};


instance DIA_Attila_Wer(C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_Wer_Condition;
	information = DIA_Attila_Wer_Info;
	permanent = FALSE;
	description = "��� ��?";
};


func int DIA_Attila_Wer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Attila_Willkommen))
	{
		return TRUE;
	};
};

func void DIA_Attila_Wer_Info()
{
	B_Attila_WhoAreYou();
	AI_StopProcessInfos(self);
};

