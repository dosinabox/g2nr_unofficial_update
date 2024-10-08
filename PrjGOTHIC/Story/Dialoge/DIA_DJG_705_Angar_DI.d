
instance DIA_Angar_DI_EXIT(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 999;
	condition = DIA_Angar_DI_EXIT_Condition;
	information = DIA_Angar_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Angar_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Angar_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Angar_DI_HALLO(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 10;
	condition = DIA_Angar_DI_HALLO_Condition;
	information = DIA_Angar_DI_HALLO_Info;
	permanent = TRUE;
	description = "��� ��?";
};


func int DIA_Angar_DI_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Angar_DI_HALLO_Info()
{
	AI_Output(other,self,"DIA_Angar_DI_HALLO_15_00");	//��� ��?
	if(UndeadDragonIsDead == FALSE)
	{
		AI_Output(self,other,"DIA_Angar_DI_HALLO_04_01");	//�������� ���� ����� ������ ������������.
		AI_Output(self,other,"DIA_Angar_DI_HALLO_04_02");	//����. ��� �����-������ ������ ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_DI_HALLO_04_03");	//�� �������� ��� ���. ����� ���������� ������.
	};
};


instance DIA_Angar_DI_ORKS(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 5;
	condition = DIA_Angar_DI_ORKS_Condition;
	information = DIA_Angar_DI_ORKS_Info;
	important = TRUE;
};


func int DIA_Angar_DI_ORKS_Condition()
{
	if((OrkSturmDI == TRUE) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_ORKS_Info()
{
	AI_Output(self,other,"DIA_Angar_DI_ORKS_04_00");	//����, ���� ������, ����� ������������. ��������� ����� ����� ����� ������ ��� ������.
	AI_Output(other,self,"DIA_Angar_DI_ORKS_15_01");	//� �����, ��� ����.
	AI_Output(self,other,"DIA_Angar_DI_ORKS_04_02");	//����� ������������.
	Info_ClearChoices(DIA_Angar_DI_ORKS);
	Info_AddChoice(DIA_Angar_DI_ORKS,"����������.",DIA_Angar_DI_ORKS_no);
	Info_AddChoice(DIA_Angar_DI_ORKS,"��� ������ ��� � �������� �������.",DIA_Angar_DI_ORKS_follow);
};

func void DIA_Angar_DI_ORKS_follow()
{
	AI_Output(other,self,"DIA_Angar_DI_ORKS_follow_15_00");	//��� ������ ��� � �������� �������.
	AI_Output(self,other,"DIA_Angar_DI_ORKS_follow_04_01");	//������. �� �� ������� ������. ������!
	Angar_DI_Party = LOG_Running;
	B_GivePlayerXP(XP_AmbientKap6);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOWDI");
};

func void DIA_Angar_DI_ORKS_no()
{
	AI_Output(other,self,"DIA_Angar_DI_ORKS_no_15_00");	//����������.
	AI_Output(self,other,"DIA_Angar_DI_ORKS_no_04_01");	//���� ����� ��������. � � ����� ���-��� ����� � ���.
	AI_StopProcessInfos(self);
};


func void B_AngarStays()
{
	AI_Output(other,self,"DIA_Angar_DI_FOLLOW_15_00");	//��������� �� �����.
	if(Npc_GetDistToWP(self,"SKELETTE") < 4000)
	{
		AI_Output(other,self,"DIA_Angar_DI_FOLLOW_15_01");	//�� ��������� � ��� ����������.
		AI_Output(self,other,"DIA_Angar_DI_FOLLOW_04_02");	//�����.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FIREDRAGONISLAND");
		if(Angar_DI_Party != LOG_SUCCESS)
		{
			B_GivePlayerXP(XP_AmbientKap6);
			Angar_DI_Party = LOG_SUCCESS;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_DI_FOLLOW_04_03");	//�������.
		AI_StopProcessInfos(self);
		if(Npc_GetDistToWP(self,"SHIP") < 10000)
		{
			Npc_ExchangeRoutine(self,"START");
		}
		else if(Npc_IsDead(FireDragonIsland))
		{
			Npc_ExchangeRoutine(self,"FIREDRAGONISLAND");
		}
		else if(Npc_IsDead(AntiPaladin_DI))
		{
			Npc_ExchangeRoutine(self,"ORKOBERST_DI");
		}
		else if(Npc_IsDead(Troll_DI))
		{
			Npc_ExchangeRoutine(self,"TROLL_DI");
		}
		else
		{
			Npc_ExchangeRoutine(self,"START");
		};
		Angar_DI_Party = LOG_OBSOLETE;
	};
};


instance DIA_Angar_DI_FOLLOW(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 5;
	condition = DIA_Angar_DI_FOLLOW_Condition;
	information = DIA_Angar_DI_FOLLOW_Info;
	permanent = TRUE;
	description = "��������� �� �����.";
};


func int DIA_Angar_DI_FOLLOW_Condition()
{
	if(Angar_DI_Party == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_FOLLOW_Info()
{
	B_AngarStays();
};


instance DIA_Angar_DI_FOLLOWAGAIN(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 5;
	condition = DIA_Angar_DI_FOLLOWAGAIN_Condition;
	information = DIA_Angar_DI_FOLLOWAGAIN_Info;
	permanent = TRUE;
	description = "��� �� ����.";
};


func int DIA_Angar_DI_FOLLOWAGAIN_Condition()
{
	if(Angar_DI_Party == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_FOLLOWAGAIN_Info()
{
	AI_Output(other,self,"DIA_Angar_DI_FOLLOWAGAIN_15_00");	//��� �� ����.
	AI_Output(self,other,"DIA_Angar_DI_FOLLOWAGAIN_04_01");	//�� ����� ������.
	Angar_DI_Party = LOG_Running;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOWDI");
};


instance DIA_Angar_DI_FOLLOWSTOP(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 5;
	condition = DIA_Angar_DI_FOLLOWSTOP_Condition;
	information = DIA_Angar_DI_FOLLOWSTOP_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Angar_DI_FOLLOWSTOP_Condition()
{
	if(Angar_DI_Party == LOG_Running)
	{
		if(!Npc_IsDead(FireDragonIsland))
		{
			if(Npc_GetDistToWP(self,"DI_DRACONIANAREA_16") < 3000)
			{
				return TRUE;
			};
		};
		if(Npc_GetDistToWP(self,"SKELETTE") < 3000)
		{
			return TRUE;
		};
	};
};

func void DIA_Angar_DI_FOLLOWSTOP_Info()
{
	AI_Output(self,other,"DIA_Angar_DI_FOLLOWSTOP_04_00");	//����! ��� �������� ���� ������ ���� � ���!
	B_AngarStays();
};


instance DIA_Angar_DI_UNDEADDRGDEAD(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 2;
	condition = DIA_Angar_DI_UNDEADDRGDEAD_Condition;
	information = DIA_Angar_DI_UNDEADDRGDEAD_Info;
	description = "��� �������.";
};


func int DIA_Angar_DI_UNDEADDRGDEAD_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_UNDEADDRGDEAD_Info()
{
	AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_00");	//��� �������.
	AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_01");	//����� ��, �������, ���������� ������?
	AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_02");	//��. ���� ��������.
	AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_03");	//����� �� ����� ������ �������. ��� � �������� � ����� ���, ����� �� �������� �����.
	if(Angar_KnowsMadPsi == TRUE)
	{
		AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_04");	//�������, ������ ������ �� ������ ����� ����� �� �������� � �����.
		AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_05");	//��� ����� ����. ������ ���� ����� ������. ��� ���� ���� ���� �� ����������. ��� �����?
	};
	AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_06");	//��� �� ������ ������ ������?
	AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_07");	//����� ����, � ����� ���-������ � ����� ��������. � ����� �� ��������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Angar_DI_FOUNDAMULETT(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 7;
	condition = DIA_Angar_DI_FOUNDAMULETT_Condition;
	information = DIA_Angar_DI_FOUNDAMULETT_Info;
	description = "� ����� ���� ������.";
};


func int DIA_Angar_DI_FOUNDAMULETT_Condition()
{
	if(Npc_HasItems(other,ItAm_Mana_Angar_MIS) && (SC_KnowsAngarsAmulett == TRUE) && (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_FOUNDAMULETT_Info()
{
	B_AngarsAmulettAbgeben();
	DIA_Angar_FOUNDAMULETT_besonders();
};


instance DIA_Angar_SCTellsAngarAboutMadPsi2_DI(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 8;
	condition = DIA_Angar_SCTellsAngarAboutMadPsi2_DI_Condition;
	information = DIA_Angar_SCTellsAngarAboutMadPsi2_DI_Info;
	description = "�������� ������� ���� ���������� ����.";
};


func int DIA_Angar_SCTellsAngarAboutMadPsi2_DI_Condition()
{
	if((SC_KnowsMadPsi == TRUE) && (Angar_KnowsMadPsi == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_SCTellsAngarAboutMadPsi2_DI_Info()
{
	B_SCTellsAngarAboutMadPsi();
	B_SCTellsAngarAboutMadPsi2();
};

