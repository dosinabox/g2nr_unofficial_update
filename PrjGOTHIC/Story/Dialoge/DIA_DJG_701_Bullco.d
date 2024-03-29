
instance DIA_BullcoDJG_EXIT(C_Info)
{
	npc = DJG_701_Bullco;
	nr = 999;
	condition = DIA_BullcoDJG_EXIT_Condition;
	information = DIA_BullcoDJG_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BullcoDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BullcoDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BullcoDJG_HALLO(C_Info)
{
	npc = DJG_701_Bullco;
	nr = 5;
	condition = DIA_BullcoDJG_HALLO_Condition;
	information = DIA_BullcoDJG_HALLO_Info;
	description = "� ��� ����?";
};


func int DIA_BullcoDJG_HALLO_Condition()
{
	if(!Npc_IsDead(DJG_Sylvio))
	{
		return TRUE;
	};
};

func void DIA_BullcoDJG_HALLO_Info()
{
	AI_Output(other,self,"DIA_BullcoDJG_HALLO_15_00");	//� ��� ����?
	AI_Output(self,other,"DIA_BullcoDJG_HALLO_06_01");	//����� ��� �������! �� �������, ������ ������� �������, ����� �� ��� ������ ����.
	AI_Output(self,other,"DIA_BullcoDJG_HALLO_06_02");	//����� ���� ��������� ������ ����, ��� ����� ���� �� ��������!
	AI_StopProcessInfos(self);
};


instance DIA_BullcoDJG_WARTEMAL(C_Info)
{
	npc = DJG_701_Bullco;
	nr = 6;
	condition = DIA_BullcoDJG_WARTEMAL_Condition;
	information = DIA_BullcoDJG_WARTEMAL_Info;
	permanent = TRUE;
	description = "� ��� ��������� � �������?";
};


func int DIA_BullcoDJG_WARTEMAL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_BullcoDJG_HALLO) || Npc_KnowsInfo(other,DIA_Bullco_WASNUN))
	{
		return TRUE;
	};
};

func void DIA_BullcoDJG_WARTEMAL_Info()
{
	AI_Output(other,self,"DIA_BullcoDJG_WARTEMAL_15_00");	//� ��� ��������� � �������?
	if(Npc_KnowsInfo(other,DIA_Bullco_WASNUN))
	{
		AI_Output(self,other,"DIA_BullcoDJG_WARTEMAL_06_01");	//�� ����� � ���� �� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_BullcoDJG_WARTEMAL_06_02");	//������ �� ������! � ��������! � ���� ��������� ������ ��� ����� �������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Bullco_SYLVIODEAD(C_Info)
{
	npc = DJG_701_Bullco;
	nr = 7;
	condition = DIA_Bullco_SYLVIODEAD_Condition;
	information = DIA_Bullco_SYLVIODEAD_Info;
	important = TRUE;
};


func int DIA_Bullco_SYLVIODEAD_Condition()
{
	if(Npc_IsDead(DJG_Sylvio))
	{
		return TRUE;
	};
};

func void DIA_Bullco_SYLVIODEAD_Info()
{
	AI_Output(self,other,"DIA_Bullco_SYLVIODEAD_06_00");	//����. ������� �����.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


func void DIA_Bullco_DontGetLost()
{
	AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_alleine_06_01");	//������ �� ���������.
};

func void DIA_Bullco_LeaveMeAlone()
{
	AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_06_01");	//������� �� ����!
};

instance DIA_Bullco_WASNUN(C_Info)
{
	npc = DJG_701_Bullco;
	nr = 8;
	condition = DIA_Bullco_WASNUN_Condition;
	information = DIA_Bullco_WASNUN_Info;
	description = "��� �� ������ ������ ������, ����� ������� �����?";
};


func int DIA_Bullco_WASNUN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bullco_SYLVIODEAD))
	{
		return TRUE;
	};
};

func void DIA_Bullco_WASNUN_Info()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_15_00");	//��� �� ������ ������ ������, ����� ������� �����?
	AI_Output(self,other,"DIA_Bullco_WASNUN_06_01");	//������� �� ����. �����, ����� ����� ������ ��������� �� ��������, ���� � ��� �� �����.
	Info_AddChoice(DIA_Bullco_WASNUN,"��� �� ������ �������� ���� ������.",DIA_Bullco_WASNUN_kopfab);
	Info_AddChoice(DIA_Bullco_WASNUN,"�� ������, ��� ���������?",DIA_Bullco_WASNUN_woandere);
};

func void DIA_Bullco_WASNUN_woandere()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_15_00");	//�� ������, ��� ���������?
	if(Npc_KnowsInfo(other,DIA_Garond_BACKINKAP4))
	{
		AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_06_01");	//�����, ��. �� ������� ����, � ����� ������ �� ��� � ���� ��� ���.
		Info_AddChoice(DIA_Bullco_WASNUN,"������ ���� � ������ ��������� �� ��������.",DIA_Bullco_WASNUN_woandere_zuihnen);
	}
	else
	{
		DIA_Bullco_LeaveMeAlone();
		AI_StopProcessInfos(self);
	};
};

func void DIA_Bullco_WASNUN_woandere_zuihnen()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_15_00");	//������ ���� � ������ ��������� �� ��������.
	AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_06_01");	//��, � �� ���� �����.
	Info_ClearChoices(DIA_Bullco_WASNUN);
	Info_AddChoice(DIA_Bullco_WASNUN,"��� ������. � ��� �� �����.",DIA_Bullco_WASNUN_woandere_zuihnen_alleine);
	Info_AddChoice(DIA_Bullco_WASNUN,"�������, ���� � ������� ���� � �����.",DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen);
	Info_AddChoice(DIA_Bullco_WASNUN,"� ������� ���� 50 ������� �� ���.",DIA_Bullco_WASNUN_woandere_zuihnen_Geld);
};

func void DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_15_00");	//�������, ���� � ������� ���� � �����.
	DIA_Bullco_LeaveMeAlone();
	AI_StopProcessInfos(self);
};

func void DIA_Bullco_WASNUN_woandere_zuihnen_Geld()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_15_00");	//� ������� ���� 50 ������� �� ���.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_01");	//������. ����� �� ����.
		AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_02");	//��� �� ����. � ������ ���� ����, ��� � ��������� ��� ����� ������ ��������� �� ��������.
		Bullco_Guide = LOG_Running;
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			B_TurnToNpc(self,other);
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Guide");
	}
	else
	{
		AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_03");	//� ���� ��� 50 �������, � � �� ������� �� ��� ����. ����������.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Bullco_WASNUN_woandere_zuihnen_alleine()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_alleine_15_00");	//��� ������. � ��� �� �����.
	DIA_Bullco_DontGetLost();
	AI_StopProcessInfos(self);
};

func void DIA_Bullco_WASNUN_kopfab()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_kopfab_15_00");	//��� �� ������ �������� ���� ������.
	AI_Output(self,other,"DIA_Bullco_WASNUN_kopfab_06_01");	//������ ���� �����.
	Info_AddChoice(DIA_Bullco_WASNUN,"������� ������. �� ������� ����� ����� ����� � ������.",DIA_Bullco_WASNUN_kopfab_angriff);
};

func void DIA_Bullco_WASNUN_kopfab_angriff()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_kopfab_angriff_15_00");	//������� ������. �� ������� ����� ����� ����� � ������.
	AI_Output(self,other,"DIA_Bullco_WASNUN_kopfab_angriff_06_01");	//��� ���� � ����.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Bullco_GuideEnd(C_Info)
{
	npc = DJG_701_Bullco;
	nr = 8;
	condition = DIA_Bullco_GuideEnd_Condition;
	information = DIA_Bullco_GuideEnd_Info;
	important = TRUE;
};


func int DIA_Bullco_GuideEnd_Condition()
{
	if(Bullco_Guide == LOG_Running)
	{
		if(Npc_GetDistToWP(self,"OW_MOVEMENT_BGOBBO1") <= 300)
		{
			return TRUE;
		};
	};
};

func void DIA_Bullco_GuideEnd_Info()
{
	DIA_Bullco_DontGetLost();
	Bullco_Guide = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DJGVorposten");
};

