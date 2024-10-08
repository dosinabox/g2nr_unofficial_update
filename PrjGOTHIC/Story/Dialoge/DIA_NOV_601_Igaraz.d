
instance DIA_Igaranz_Kap1_EXIT(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 999;
	condition = DIA_Igaraz_Kap1_EXIT_Condition;
	information = DIA_Igaraz_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Igaraz_Kap1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Igaraz_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Igaranz_Hello(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Hello_Condition;
	information = DIA_Igaraz_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Igaraz_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (Knows_Fire_Contest == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Hello_Info()
{
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_00");	//��� � ���� ������� ��� ����, ����?
	}
	else
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_01");	//��� � ���� ������� ��� ����?
	};
};


instance DIA_Igaraz_Wurst(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Wurst_Condition;
	information = DIA_Igaraz_Wurst_Info;
	permanent = FALSE;
	description = "� ������ �������.";
};


func int DIA_Igaraz_Wurst_Condition()
{
	if(C_CanFeedNOV(self))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Wurst_Info()
{
	AI_Output(other,self,"DIA_Igaraz_Wurst_15_00");	//� ������ �������.
	AI_Output(self,other,"DIA_Igaraz_Wurst_13_01");	//�� ��������� �� �������, ��? ������, ����� ����� ���� ��� �������.
	B_FeedNOV(self);
};


instance DIA_Igaranz_NotWork(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 3;
	condition = DIA_Igaraz_NotWork_Condition;
	information = DIA_Igaraz_NotWork_Info;
	permanent = FALSE;
	description = "������ �� �� ���������?";
};


func int DIA_Igaraz_NotWork_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (Knows_Fire_Contest == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_NotWork_Info()
{
	AI_Output(other,self,"DIA_Igaranz_NotWork_15_00");	//������ �� �� ���������?
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_01");	//��� ��������� ������� ������ ������. � �������� ��� ��������.
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_02");	//������� �� ������� ���� - � ����� � ������ ��������� ������ � ����� � ���� ����.
};


instance DIA_Igaranz_Choosen(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Choosen_Condition;
	information = DIA_Igaraz_Choosen_Info;
	permanent = TRUE;
	description = "��� ����� ���������?";
};


func int DIA_Igaraz_Choosen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_NotWork) && (Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (Knows_Fire_Contest == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Choosen_Info()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_15_00");	//��� ����� ���������?
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_01");	//��� ����������, ������� ����� ��������� ������ ��������� ������.
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_02");	//���, ��� �������� ���, ����������� � ���� ����� ����.
	Info_ClearChoices(DIA_Igaranz_Choosen);
	Info_AddChoice(DIA_Igaranz_Choosen,Dialog_Back,DIA_Igaranz_Choosen_back);
	Info_AddChoice(DIA_Igaranz_Choosen,"��� ����� ��������� ������?",DIA_Igaranz_Choosen_TestOfMagic);
	Info_AddChoice(DIA_Igaranz_Choosen,"��� � ���� ����� ���������?",DIA_Igaranz_Choosen_HowChoosen);
};

func void DIA_Igaranz_Choosen_back()
{
	Info_ClearChoices(DIA_Igaranz_Choosen);
};

func void DIA_Igaranz_Choosen_TestOfMagic()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_TestOfMagic_15_00");	//��� ����� ��������� ������?
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_01");	//��� ���������, �������� ������ ����� ���������� ���� ��������� �����������.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_02");	//��� �������, ��� ���������� �������� ����������� ���� � ����������������� ����������.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_03");	//��� ��������� ���������� ��������� � ��� ������� - �� ������ ���� �� ��� ����� ������� ��������� ���.
};

func void DIA_Igaranz_Choosen_HowChoosen()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_HowChoosen_15_00");	//��� � ���� ����� ���������?
	AI_Output(self,other,"DIA_Igaranz_Choosen_HowChoosen_13_01");	//�� �� ������ ������ �� ���. ����� ��������� �������� ����� �����������, � ������ ����� ��������� ��� ����.
};


instance DIA_Igaranz_StudyInnos(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_StudyInnos_Condition;
	information = DIA_Igaraz_StudyInnos_Info;
	permanent = FALSE;
	description = "��� � ���� ������ ������� �������?";
};


func int DIA_Igaraz_StudyInnos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_NotWork) && (Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (Parlan_Erlaubnis == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_StudyInnos_Info()
{
	AI_Output(other,self,"DIA_Igaranz_StudyInnos_15_00");	//��� � ���� ������ ������� �������?
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_01");	//�� ������ �������� ������ � ����������.
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_02");	//������ ������ ������ ���� ���� ����, ������ ����� �� ��������� ��� ��� �������.
};


instance DIA_Igaraz_IMTHEMAN(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_IMTHEMAN_Condition;
	information = DIA_Igaraz_IMTHEMAN_Info;
	important = TRUE;
};


func int DIA_Igaraz_IMTHEMAN_Condition()
{
	if((MIS_Schnitzeljagd == LOG_Running) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && !Npc_KnowsInfo(other,DIA_Igaraz_Stein))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_IMTHEMAN_Info()
{
	AI_Output(self,other,"DIA_Igaraz_IMTHEMAN_13_00");	//(�����) ��� ����������. ����� ������ ����, � � ����� ������� � ��������� ������.
};


instance DIA_Igaraz_METOO(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 19;
	condition = DIA_Igaraz_METOO_Condition;
	information = DIA_Igaraz_METOO_Info;
	permanent = FALSE;
	description = "� ���� - � ���������� ����������� ��������� �����.";
};


func int DIA_Igaraz_METOO_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaraz_IMTHEMAN) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && !Npc_KnowsInfo(other,DIA_Igaraz_Stein))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_METOO_Info()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_15_00");	//� ���� - � ���������� ����������� ��������� �����.
	AI_Output(self,other,"DIA_Igaraz_METOO_13_01");	//��� �� ����������? �� ���� �������� ������, ���� �����������.
	AI_Output(other,self,"DIA_Igaraz_METOO_15_02");	//��� ��� ������� ����� �������� �����, �, ��������, ������� � ��� ����...
	AI_Output(self,other,"DIA_Igaraz_METOO_13_03");	//����� ������������ ���� - � � ������ ��� ���������!
	Info_ClearChoices(DIA_Igaraz_METOO);
	Info_AddChoice(DIA_Igaraz_METOO,Dialog_Back,DIA_Igaraz_METOO_BACK);
	Info_AddChoice(DIA_Igaraz_METOO,"�����, ��� ����� ����������� ������...",DIA_Igaraz_METOO_HELP);
	Info_AddChoice(DIA_Igaraz_METOO,"� ���, ��� ������ �� �����?",DIA_Igaraz_METOO_TELL);
	Info_AddChoice(DIA_Igaraz_METOO,"�� �� ����� ����� ��� �����?",DIA_Igaraz_METOO_AGON);
};

func void DIA_Igaraz_METOO_BACK()
{
	Info_ClearChoices(DIA_Igaraz_METOO);
};

func void DIA_Igaraz_METOO_TELL()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_TELL_15_00");	//� ���, ��� ������ �� �����?
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_01");	//��� ��� � ���� ��� ����� ������� ������, �, �������, ����� ����:
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_02");	//���� �� ������� ������ ����� ���� - �� ��� ������ �� �������.
};

func void DIA_Igaraz_METOO_HELP()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_HELP_15_00");	//�����, ��� ����� ����������� ������...
	AI_Output(self,other,"DIA_Igaraz_METOO_HELP_13_01");	//������ �� ����. � ������� ��� ������� ����. �� ��� ������ ������ ������.
};

func void DIA_Igaraz_METOO_AGON()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_AGON_15_00");	//�� �� ����� ����� ��� �����?
	AI_Output(self,other,"DIA_Igaraz_METOO_AGON_13_01");	//�� ����������� � �������. � ����� � ������, � ��� ���� ����� ������ - �� ����, � �� ����.
};


instance DIA_Igaraz_ADD(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 23;
	condition = DIA_Igaraz_ADD_Condition;
	information = DIA_Igaraz_ADD_Info;
	permanent = FALSE;
	description = "�� ������ ���-������ � '����� �����'?";
};


func int DIA_Igaraz_ADD_Condition()
{
	if(((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) || (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_66") <= 3500)) && (MIS_Golem == LOG_Running) && !Npc_KnowsInfo(other,DIA_Igaraz_Stein) && Npc_KnowsInfo(other,DIA_Igaraz_METOO))
	{
		if(!Npc_IsDead(Magic_Golem))
		{
			return TRUE;
		};
	};
};

func void DIA_Igaraz_ADD_Info()
{
	AI_Output(other,self,"DIA_Igaraz_Add_15_00");	//�� ������ ���-������ � '����� �����'?
	AI_Output(self,other,"DIA_Igaraz_Add_13_01");	//(��������) ���! ���� ��� ������� ���������?
	AI_Output(other,self,"DIA_Igaraz_Add_15_02");	//��, � ���?
	AI_Output(self,other,"DIA_Igaraz_Add_13_03");	//�, �������, �����������, ��� �� ���� � ����...
	AI_Output(self,other,"DIA_Igaraz_Add_13_04");	//�� ������ �� ������, ��� �������� ��� ���������...
	AI_Output(other,self,"DIA_Igaraz_Add_15_05");	//��� ��� ����� ��� ����� �����?
	AI_Output(self,other,"DIA_Igaraz_Add_13_06");	//������ ��� �� ���� ��������. ������ ��������� ����� �� ������� ����.
	AI_Output(self,other,"DIA_Igaraz_Add_13_07");	//��������� ���� �� �������� � ����. ��� ������ ���� ���-�� ���.
	AI_Output(self,other,"DIA_Igaraz_Add_13_08");	//���� �� ������� �� ����� - ������, �� ����� ������� ������.
	AI_Output(self,other,"DIA_Igaraz_Add_13_09");	//(�������) ���� ���� ������ ������� ���� ������...
	AI_Output(self,other,"DIA_Igaraz_Add_13_10");	//��� ���, ��� � ���� ������� ����... (� ���������) ��� ���� ��� �� ������ ���� ���� ���������!
};


instance DIA_Igaraz_Pruefung(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 22;
	condition = DIA_Igaraz_Pruefung_Condition;
	information = DIA_Igaraz_Pruefung_Info;
	permanent = TRUE;
	description = "������� ���-������ �����?";
};


func int DIA_Igaraz_Pruefung_Condition()
{
	if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Igaraz_METOO))
	{
		if(!C_FireContestRuneFound())
		{
			return TRUE;
		};
	};
};

func void DIA_Igaraz_Pruefung_Info()
{
	AI_Output(other,self,"DIA_Igaraz_Pruefung_15_00");	//������� ���-������ �����?
	AI_Output(self,other,"DIA_Igaraz_Pruefung_13_01");	//���� ���, �� � ��������� ������.
	AI_StopProcessInfos(self);
	if(Igaraz_Wait == FALSE)
	{
		Npc_ExchangeRoutine(self,"CONTESTWAIT");
		Igaraz_Wait = TRUE;
	};
};


instance DIA_Igaraz_Stein(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 1;
	condition = DIA_Igaraz_Stein_Condition;
	information = DIA_Igaraz_Stein_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Igaraz_Stein_Condition()
{
	if((MIS_Schnitzeljagd == LOG_Running) && (other.guild == GIL_NOV))
	{
		if(C_FireContestRuneFound())
		{
			return TRUE;
		};
	};
};

func void DIA_Igaraz_Stein_Info()
{
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_00");	//��, �������. ��� ����� ����������...
	AI_Output(other,self,"DIA_Igaraz_Seufz_15_01");	//� ��� �� �����...
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_02");	//� ���� ����� ��������� ����� ���. ����� ������������ ���� � � ������ ������ ���.
	if(Npc_KnowsInfo(other,DIA_Ulf_Abrechnung))
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_03");	//���-�� � ��� ��� ������.
	}
	else
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_04");	//�� �� ������, ��� ������� ���.
	};
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_05");	//������ �������. ��� ����� ��, ��� �� �����. � ���� ������ ����� �������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};


instance DIA_Igaranz_TalkAboutBabo(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_TalkAboutBabo_Condition;
	information = DIA_Igaraz_TalkAboutBabo_Info;
	permanent = FALSE;
	description = "��� ����� ���������� � ����.";
};


func int DIA_Igaraz_TalkAboutBabo_Condition()
{
	if(MIS_BabosDocs == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Igaraz_TalkAboutBabo_Info()
{
	AI_Output(other,self,"DIA_Igaranz_TalkAboutBabo_15_00");	//��� ����� ���������� � ����.
	AI_Output(self,other,"DIA_Igaranz_TalkAboutBabo_13_01");	//(���������) ��, � ��� ����?
};


instance DIA_Igaranz_BabosBelongings(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_BabosBelongings_Condition;
	information = DIA_Igaraz_BabosBelongings_Info;
	permanent = FALSE;
	description = "� ���� ���� ���-���, ������������� ����.";
};


func int DIA_Igaraz_BabosBelongings_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_TalkAboutBabo))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_BabosBelongings_Info()
{
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_00");	//� ���� ���� ���-���, ������������� ����.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_01");	//� ��� �� ��� ����� ����?
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_02");	//��������� ������� ������. ���� ����� �� �������� �� �����.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_03");	//(����������) ��? ���� ��! ���� �����������. �������� ��������, � ��������� �� �������� �� � ����. ������, ��� ������ ������������ ���������.
};


instance DIA_Igaranz_WhereDocs(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_WhereDocs_Condition;
	information = DIA_Igaraz_WhereDocs_Info;
	permanent = FALSE;
	description = "��� ��� ������?";
};


func int DIA_Igaraz_WhereDocs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_BabosBelongings) && (GotIgarazChestKey == FALSE))
	{
		if(!C_WorldIsFixed())
		{
			return TRUE;
		};
		if(Mob_HasItems("CHEST_IGARAZ",ItWr_BabosDocs_MIS))
		{
			return TRUE;
		};
	};
};

func void DIA_Igaraz_WhereDocs_Info()
{
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_00");	//��� ��� ������?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_01");	//(������) ��, ������� ��, � �� ����� �� ��� ����. �����, ����� �� ���� ������.
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_02");	//��� ���?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_03");	//� ����� �� � �������. � ���� �� ���� ���� ������� �� ��������.
};


instance DIA_Igaranz_BabosJob(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_BabosJob_Condition;
	information = DIA_Igaraz_BabosJob_Info;
	permanent = FALSE;
	description = "��� ���� ������ ������ ��� ����?";
};


func int DIA_Igaraz_BabosJob_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_BabosJob_Info()
{
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_00");	//��� ���� ������ ������ ��� ����?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_01");	//���� �� � ����, ��� ���� ������� ������� � ����� ��-�� ���������� ������ �������� �����, � �� ����� �����������, ����� ���-������ ������ ����� ��� ����� � ������������ ����.
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_02");	//�� ������ ���������� �������� �����?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_03");	//�������. ��� ��� ��� ������ �� ��������� ��-�� �������, ���� �� ������ � ������ ������� �����.
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_04");	//�� ����� �� ������ ���������� �� ����. �� ���� ������������ ������������.
};


instance DIA_Igaranz_Price(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_Price_Condition;
	information = DIA_Igaraz_Price_Info;
	permanent = FALSE;
	description = "������� �� ������ �� ��� ������?";
};


func int DIA_Igaraz_Price_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Price_Info()
{
	AI_Output(other,self,"DIA_Igaranz_Price_15_00");	//������� �� ������ �� ��� ������?
	AI_Output(self,other,"DIA_Igaranz_Price_13_01");	//(�������) ��, ������-�� ������, ��� ����������� ��������. ����� ����� ����� ��������� ���-������ ��������.
	AI_Output(self,other,"DIA_Igaranz_Price_13_02");	//�� � ���� ��� ������� ��������� ����� ������� ��-�� ���������� �������.
	AI_Output(self,other,"DIA_Igaranz_Price_13_03");	//300 �����, � �� ������ ������ � ����� �������� ���, ��� ��������.
};


instance DIA_Igaranz_BuyIt(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 31;
	condition = DIA_Igaraz_BuyIt_Condition;
	information = DIA_Igaraz_BuyIt_Info;
	permanent = TRUE;
	description = "� ���� ������ ��� ������.";
};


func int DIA_Igaraz_BuyIt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Igaranz_Price) && (GotIgarazChestKey == FALSE) && Npc_HasItems(self,ItKe_IgarazChest_MIS))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_BuyIt_Info()
{
	AI_Output(other,self,"DIA_Igaranz_BuyIt_15_00");	//� ���� ������ ��� ������.
	if(B_GiveInvItems(other,self,ItMi_Gold,300))
	{
		AI_Output(self,other,"DIA_Igaranz_BuyIt_13_01");	//��������, � ������ �� ���� ����������. � ��� ���� ���� �� ����� �������. � ��� ��� ����� ������ ������ ���.
		self.aivar[AIV_IGNORE_Theft] = TRUE;
		if(!Npc_IsDead(Feger2))
		{
			Feger2.aivar[AIV_IGNORE_Theft] = TRUE;
		};
		if(!Npc_IsDead(Feger3))
		{
			Feger3.aivar[AIV_IGNORE_Theft] = TRUE;
		};
		B_GiveInvItems(self,other,ItKe_IgarazChest_MIS,1);
		GotIgarazChestKey = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Igaranz_Price_13_03");	//300 �����, � �� ������ ������ � ����� �������� ���, ��� ��������.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Igaranz_Perm(C_Info)
{
	npc = NOV_601_Igaraz;
	nr = 2;
	condition = DIA_Igaraz_Perm_Condition;
	information = DIA_Igaraz_Perm_Info;
	permanent = FALSE;
	description = "� ���� ���� ���-������ ���������� ��� ����?";
};


func int DIA_Igaraz_Perm_Condition()
{
	if((Kapitel >= 3) && (other.guild != GIL_KDF) && (MIS_BabosDocs != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Perm_Info()
{
	AI_Output(other,self,"DIA_Igaranz_Perm_15_00");	//� ���� ���� ���-������ ���������� ��� ����?
	AI_Output(self,other,"DIA_Igaranz_Perm_13_01");	//���... ���.
	AI_StopProcessInfos(self);
};

