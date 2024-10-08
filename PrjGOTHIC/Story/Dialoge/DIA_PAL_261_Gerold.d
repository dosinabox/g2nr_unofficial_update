
instance DIA_Gerold_EXIT(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 999;
	condition = DIA_Gerold_EXIT_Condition;
	information = DIA_Gerold_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gerold_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gerold_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gerold_Hallo(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Hallo_Condition;
	information = DIA_Gerold_Hallo_Info;
	permanent = FALSE;
	description = "��� �� ���������?";
};


func int DIA_Gerold_Hallo_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Gerold_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gerold_Hallo_15_00");	//��� �� ���������?
	AI_Output(self,other,"DIA_Gerold_Hallo_12_01");	//�����������.
	AI_Output(other,self,"DIA_Gerold_Hallo_15_02");	//� ��� ���?
	AI_Output(self,other,"DIA_Gerold_Hallo_12_03");	//��������� ����������� � ������� ����. ��������� ������ - ������� ��� ���.
	AI_Output(self,other,"DIA_Gerold_Hallo_12_04");	//������ �������� ��� ��������� ��� ����.
	KnowsAboutGorn = TRUE;
};


instance DIA_Gerold_Jail(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Jail_Condition;
	information = DIA_Gerold_Jail_Info;
	permanent = FALSE;
	description = "�� ���������� ���� � �������?";
};


func int DIA_Gerold_Jail_Condition()
{
	if((Kapitel == 2) && Npc_KnowsInfo(other,DIA_Gerold_Hallo) && (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Jail_Info()
{
	AI_Output(other,self,"DIA_Gerold_Jail_15_00");	//�� ���������� ���� � �������?
	AI_Output(self,other,"DIA_Gerold_Jail_12_01");	//���. ����� �� ����� ������� � �������. ��� �������� ����. ����, ������� � ���� ���������.
	AI_Output(self,other,"DIA_Gerold_Jail_12_02");	//����� ��� �� �������, ���� �� ������ ������� � �������� ����� ��������. ����� �� ����.
};


instance DIA_Gerold_Ausnahme(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Ausnahme_Condition;
	information = DIA_Gerold_Ausnahme_Info;
	permanent = FALSE;
	description = "�� �� ��� �� ������� ���������� ��� ����?";
};


func int DIA_Gerold_Ausnahme_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gerold_Jail) && (Kapitel == 2) && (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Ausnahme_Info()
{
	AI_Output(other,self,"DIA_Gerold_Ausnahme_15_00");	//�� �� ��� �� ������� ���������� ��� ����?
	AI_Output(self,other,"DIA_Gerold_Ausnahme_12_01");	//���.
};


instance DIA_Gerold_Gold(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Gold_Condition;
	information = DIA_Gerold_Gold_Info;
	permanent = FALSE;
	description = "� ���, ���� � ������� �������?";
};


func int DIA_Gerold_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gerold_Ausnahme) && (Kapitel == 2) && (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Gold_Info()
{
	AI_Output(other,self,"DIA_Gerold_Gold_15_00");	//� ���, ���� � ������� �������?
	AI_Output(self,other,"DIA_Gerold_Gold_12_01");	//... ��...
	AI_Output(self,other,"DIA_Gerold_Gold_12_02");	//���.
};


instance DIA_Gerold_Deal(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Deal_Condition;
	information = DIA_Gerold_Deal_Info;
	permanent = FALSE;
	description = "� ���� ���� ������� ��� ������ �� �����������. �� ������ �������� ��?";
};


func int DIA_Gerold_Deal_Condition()
{
	if((MIS_RescueGorn == LOG_Running) && Npc_HasItems(other,ItWr_LetterForGorn_MIS) && (Kapitel == 2) && (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Deal_Info()
{
	AI_Output(other,self,"DIA_Gerold_Deal_15_00");	//� ���� ���� ������� ��� ������ �� �����������. �� ������ �������� ��?
	AI_Output(self,other,"DIA_Gerold_Deal_12_01");	//��... � ��������, � �� ���� ����������� ��� �����. ��� ���� ��� �������?
	AI_Output(other,self,"DIA_Gerold_Deal_15_02");	//��� �����.
	AI_Output(self,other,"DIA_Gerold_Deal_12_03");	//��� ����� ������ �����������. � �� �����, ��� ������ ����������. �� ���� ��� ��� ���� ��� �����, �� ������ ����� ������������.
	AI_Output(other,self,"DIA_Gerold_Deal_15_04");	//��� �� ������ �� ���?
	AI_Output(self,other,"DIA_Gerold_Deal_12_05");	//���� ����� ��������� ����� ����� ������ �������. � ���� ���������� ���.
	AI_Output(self,other,"DIA_Gerold_Deal_12_06");	//������� ��� ������� � ������� ������� ����� - � ������� �������� ����.
	AI_Output(self,other,"DIA_Gerold_Deal_12_07");	//������� ����, ����� ������ ��� ���... ��, ����� ������ �������. � ����, � ���� ��������� ������� ��� ���. ��� ��� ������, ����� ������� ��������.
	B_LogEntry(TOPIC_RescueGorn,"���� � ������� �������� �������, ����, ���� � ���, �� �������� ������� �����.");
};


instance DIA_Gerold_Stuff(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Stuff_Condition;
	information = DIA_Gerold_Stuff_Info;
	permanent = TRUE;
	description = "� ������ ���� ���-���. ��� ���, ��� �� � ������.";
};


var int DIA_Gerold_Stuff_permanent;

func int DIA_Gerold_Stuff_Condition()
{
	if(Npc_HasItems(other,ItWr_LetterForGorn_MIS) && Npc_KnowsInfo(other,DIA_Gerold_Deal) && (Kapitel == 2) && (DIA_Gerold_Stuff_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Stuff_Info()
{
	AI_Output(other,self,"DIA_Gerold_Stuff_15_00");	//� ������ ���� ���-���. ��� ���, ��� �� � ������.
	if(Npc_HasItems(other,ItFo_Honey) && Npc_HasItems(other,ItFo_Bread) && Npc_HasItems(other,ItFo_Wine) && Npc_HasItems(other,ItFo_Sausage))
	{
		Npc_RemoveInvItem(other,ItFo_Honey);
		AI_PrintScreen("��� �����",-1,34,FONT_ScreenSmall,2);
		Npc_RemoveInvItem(other,ItFo_Bread);
		AI_PrintScreen("���� �����",-1,37,FONT_ScreenSmall,2);
		Npc_RemoveInvItem(other,ItFo_Wine);
		AI_PrintScreen("���� ������",-1,40,FONT_ScreenSmall,2);
		Npc_RemoveInvItem(other,ItFo_Sausage);
		AI_PrintScreen("������� ������",-1,43,FONT_ScreenSmall,2);
		AI_Output(self,other,"DIA_Gerold_Stuff_12_01");	//������, ��� ��������. ������� � ���� � �����?
		AI_Output(other,self,"DIA_Gerold_Stuff_15_02");	//��, ���. �� ������, ��� ��� �����.
		B_GiveInvItems(other,self,ItWr_LetterForGorn_MIS,1);
		AI_Output(self,other,"DIA_Gerold_Stuff_12_03");	//������ ������, �� � ����� ������� ��� ������� ��.
		DayContactGorn = Wld_GetDay();
		DIA_Gerold_Stuff_permanent = TRUE;
		B_LogEntry(TOPIC_RescueGorn,"������� ������� ��, ��� �����, � �������� �������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_Stuff_12_04");	//������, ����� � ���� ����� ��, ��� � ������.
	};
};


instance DIA_Gerold_Antwort(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Antwort_Condition;
	information = DIA_Gerold_Antwort_Info;
	permanent = TRUE;
	description = "���� ������� �������?";
};


var int DIA_Gerold_Antwort_permanent;

func int DIA_Gerold_Antwort_Condition()
{
	if((DIA_Gerold_Stuff_permanent == TRUE) && (Kapitel == 2) && (DIA_Gerold_Antwort_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Antwort_Info()
{
	AI_Output(other,self,"DIA_Gerold_Antwort_15_00");	//���� ������� �������?
	if(!Npc_HasItems(self,ItWr_LetterForGorn_MIS))
	{
		B_Say(self,other,"$NOTNOW");
		DIA_Gerold_Antwort_permanent = TRUE;
	}
	else if((DayContactGorn < Wld_GetDay()) || (MIS_RescueGorn == LOG_SUCCESS))
	{
		Npc_RemoveInvItem(self,ItWr_LetterForGorn_MIS);
		AI_Output(self,other,"DIA_Gerold_Antwort_12_01");	//��, � � ������ �������� ���� ��� �����:
		AI_Output(other,self,"DIA_Gerold_Antwort_15_02");	//�?
		AI_Output(self,other,"DIA_Gerold_Antwort_12_03");	//'��� ��������� � ����� �����'.
		AI_Output(other,self,"DIA_Gerold_Antwort_15_04");	//�� ������ ���-������ ���?
		AI_Output(self,other,"DIA_Gerold_Antwort_12_05");	//���. ������� �� ����, ��� ��� ������. � �� ������?
		AI_Output(other,self,"DIA_Gerold_Antwort_15_06");	//��������. �� ���� �� ����� ������ ��������� ����� �� ����� ������.
		AI_Output(self,other,"DIA_Gerold_Antwort_12_07");	//��, ��������, �� ����.
		GornsTreasure = TRUE;
		DIA_Gerold_Antwort_permanent = TRUE;
		B_LogEntry(TOPIC_RescueGorn,"���� �������, ��� ��� ������ ��������� � ����� �����.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_GornsAnswer_12_08");	//��� ���. ����� �������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Gerold_SetGornFree(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_SetGornFree_Condition;
	information = DIA_Gerold_SetGornFree_Info;
	permanent = FALSE;
	description = "�������� �����. ��� ������ ������������ �������.";
};


func int DIA_Gerold_SetGornFree_Condition()
{
	if((Garond_Kerkerauf == TRUE) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Gerold_SetGornFree_Info()
{
	AI_Output(other,self,"DIA_Gerold_SetGornFree_15_00");	//�������� �����. ��� ������ ������������ �������.
	AI_Output(self,other,"DIA_Gerold_SetGornFree_12_01");	//��� ��� �������� �� ����. ��� ����, �� ������ ����� ����.
	CreateInvItems(self,ItKe_PrisonKey_MIS,1);
	B_GiveInvItems(self,other,ItKe_PrisonKey_MIS,1);
	B_LogEntry(TOPIC_RescueGorn,"������� ��� ��� ���� �� ������.");
};


instance DIA_Gerold_Perm(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 900;
	condition = DIA_Gerold_Perm_Condition;
	information = DIA_Gerold_Perm_Info;
	permanent = TRUE;
	description = "�� �����-������ �����?";
};


func int DIA_Gerold_Perm_Condition()
{
	if((Kapitel < 4) && Npc_KnowsInfo(other,DIA_Gerold_Gold) && (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Perm_Info()
{
	AI_Output(other,self,"DIA_Gerold_Perm_15_00");	//�� �����-������ �����?
	AI_Output(self,other,"DIA_Gerold_Perm_12_01");	//���. ��� ����� ������ ��� ���� ������� �� ����� �� �����.
};


instance DIA_Gerold_KAP4_ALLESRUHIG(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 30;
	condition = DIA_Gerold_KAP4_ALLESRUHIG_Condition;
	information = DIA_Gerold_KAP4_ALLESRUHIG_Info;
	description = "��� ����?";
};


func int DIA_Gerold_KAP4_ALLESRUHIG_Condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Gerold_KAP4_ALLESRUHIG_Info()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_01");	//����, ��.
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_02");	//��?
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_03");	//� ���� ����� ��� ������ � ������������. ������ ����� ������ ���� �����.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_04");	//���� � �� ����� ���-������ ��������� ���, � ����� � ������ ����� ������ ������� �������.
	Info_ClearChoices(DIA_Gerold_KAP4_ALLESRUHIG);
	Info_AddChoice(DIA_Gerold_KAP4_ALLESRUHIG,"��� �� ��� ��������.",DIA_Gerold_KAP4_ALLESRUHIG_Nein);
	Info_AddChoice(DIA_Gerold_KAP4_ALLESRUHIG,"��������, � ���� �������� ����.",DIA_Gerold_KAP4_ALLESRUHIG_geben);
};

func void DIA_Gerold_KAP4_ALLESRUHIG_geben()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_geben_15_00");	//��������, � ���� �������� ����.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_01");	//�� � ��� �����? ������ �� �����! ���� ���-������ ��� ������, � ���� ����� �������� ���� ����� ������, ���� �� ���������, � ��� �.
	if(!Wld_IsTime(23,10,8,0))
	{
		AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_02");	//�� ������� ���� � �����, ����� ��� ����� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_03");	//������� ����� � ����, ���� ��������� �� ��������� �� ����� ���. � �� ���� ����� �� ������.
	};
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_04");	//� �����, � ��� ����� � ����� ������ ���. � ���� ����� ���� ���.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_05");	//�� ������, ����� ��� �� ��������� �������� ����� ����� ��� �����-������ ����� ����� ����, �� �����?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOOD");
	Log_CreateTopic(TOPIC_GeroldGiveFood,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GeroldGiveFood,LOG_Running);
	B_LogEntry(TOPIC_GeroldGiveFood,"������ ����� ������ ����. ��� ����� �������� �������� ���-������ ������, ���� �� � �������� �� ������� �����-������ ��������. � ������ ����������� � ��� � ���� �����, ����� ��� �����.");
	MIS_GeroldGiveFood = LOG_Running;
};

func void DIA_Gerold_KAP4_ALLESRUHIG_Nein()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_15_00");	//��� �� ��� ��������.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_01");	//���� ����� ��������. ����-�� ����� ������ ��������� �� ������.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_02");	//���� ���� �� � �� �������� ���, �� ������� ������� � ����� � ���� ���� ������������ ��������.
	AI_StopProcessInfos(self);
};


var int Gerold_FoodCounter;

instance DIA_Gerold_FOOD(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 31;
	condition = DIA_Gerold_FOOD_Condition;
	information = DIA_Gerold_FOOD_Info;
	important = TRUE;
};


func int DIA_Gerold_FOOD_Condition()
{
	if((Npc_GetDistToWP(self,"OC_MAGE_IN") < 500) && (MIS_GeroldGiveFood == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Gerold_MoreFood()
{
	Info_ClearChoices(DIA_Gerold_FOOD);
	if(Gerold_FoodCounter > 8)
	{
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_00");	//����� ����������. ����� ����������! ������ ���� ��������� ����� �� ����� ������ �����.
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_01");	//��� ��� ������. � ��� ����� ������ �� ���� �� ���� ������ �����, � ���� ���, ����� ����, ����������.
		CreateInvItems(self,ItMi_Gold,450);
		B_GiveInvItems(self,other,ItMi_Gold,450);
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_02");	//� ������ � ����� �����, ���� ����� �� ������ ���.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		MIS_GeroldGiveFood = LOG_SUCCESS;
		B_GivePlayerXP(XP_GeroldGiveFood);
	}
	else
	{
		if(Gerold_FoodCounter == 0)
		{
			Info_AddChoice(DIA_Gerold_FOOD,"������ � ���� ������ ���.",DIA_Gerold_FOOD_nichts);
		}
		else
		{
			Info_AddChoice(DIA_Gerold_FOOD,"��� ���, ��� � ���� ����.",DIA_Gerold_FOOD_kaese_nichtmehr);
			if(Gerold_FoodCounter < 5)
			{
				AI_Output(self,other,"DIA_Gerold_MoreFood_12_03");	//�������. ����� ����. � ��� � ���� ����?
			}
			else
			{
				AI_Output(self,other,"DIA_Gerold_MoreFood_12_04");	//��. ���, ���!
			};
		};
		if(Npc_HasItems(other,ItFo_FishSoup) || Npc_HasItems(other,ItFo_EddasFishSoup))
		{
			Info_AddChoice(DIA_Gerold_FOOD,"(���� ���)",DIA_Gerold_FOOD_Suppe);
		};
		if(Npc_HasItems(other,ItFo_Stew))
		{
			Info_AddChoice(DIA_Gerold_FOOD,"(���� ��������)",DIA_Gerold_FOOD_Stew);
		};
		if(Npc_HasItems(other,ItFoMutton) || Npc_HasItems(other,ItFo_NiclasBacon))
		{
			Info_AddChoice(DIA_Gerold_FOOD,"(���� ������� ����)",DIA_Gerold_FOOD_fleisch);
		};
		if(Npc_HasItems(other,ItFo_Bacon))
		{
			Info_AddChoice(DIA_Gerold_FOOD,"(���� ������)",DIA_Gerold_FOOD_schinken);
		};
		if(Npc_HasItems(other,ItFo_Cheese))
		{
			Info_AddChoice(DIA_Gerold_FOOD,"(���� ���)",DIA_Gerold_FOOD_kaese);
		};
		if(Npc_HasItems(other,ItFo_Sausage) || Npc_HasItems(other,ItFo_Schafswurst))
		{
			Info_AddChoice(DIA_Gerold_FOOD,"(���� �������)",DIA_Gerold_FOOD_Wurst);
		};
		Gerold_FoodCounter += 1;
	};
};

func void DIA_Gerold_FOOD_Info()
{
	AI_Output(self,other,"DIA_Gerold_FOOD_12_00");	//��� �� ���. � ���? � ���� ���� ���-������ ������?
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_nichts()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_nichts_15_00");	//������ � ���� ������ ���.
	AI_Output(self,other,"DIA_Gerold_FOOD_nichts_12_01");	//������� ���������� � ��� ������, � ����� ������ �������� ����?
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Npc_ExchangeRoutine(self,"START");
	MIS_GeroldGiveFood = LOG_FAILED;
	B_GivePlayerXP(50);
};

func void DIA_Gerold_FOOD_kaese_nichtmehr()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_kaese_nichtmehr_15_00");	//��� ���, ��� � ���� ����.
	AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_01");	//� �, ��-������, ������ � ���? �����, ��� ��� �� �����, ��� ������. ���, ������ ������� ������ �� ���.
	CreateInvItems(self,ItMi_Gold,50);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_02");	//������. � ������ ��� ����� ������������ �� ��� ����.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	MIS_GeroldGiveFood = LOG_OBSOLETE;
	if(Gerold_FoodCounter < 4)
	{
		B_GivePlayerXP(120);
	}
	else
	{
		B_GivePlayerXP(XP_GeroldGiveFood / 2);
	};
};

func void B_FeedGerold(var int food)
{
	B_GiveInvItems(other,self,food,1);
	B_UseItem(self,food);
};

func void DIA_Gerold_FOOD_kaese()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_kaese_15_00");	//��� ������ ������� ����� ����?
	B_FeedGerold(ItFo_Cheese);
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_Wurst()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Wurst_15_00");	//����� �������?
	if(Npc_HasItems(other,ItFo_Sausage))
	{
		B_FeedGerold(ItFo_Sausage);
	}
	else
	{
		B_FeedGerold(ItFo_Schafswurst);
	};
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_schinken()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_schinken_15_00");	//� ���� ���� ���� ���� ������.
	B_FeedGerold(ItFo_Bacon);
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_fleisch()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_fleisch_15_00");	//����� ����?
	if(Npc_HasItems(other,ItFoMutton))
	{
		B_FeedGerold(ItFoMutton);
	}
	else
	{
		B_FeedGerold(ItFo_NiclasBacon);
	};
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_Suppe()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Suppe_15_00");	//������� ��� ��� ������ �� ��������, ���� ��� �� �������?
	if(Npc_HasItems(other,ItFo_FishSoup))
	{
		B_FeedGerold(ItFo_FishSoup);
	}
	else
	{
		B_FeedGerold(ItFo_EddasFishSoup);
	};
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_Stew()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Suppe_15_00");	//������� ��� ��� ������ �� ��������, ���� ��� �� �������?
	B_FeedGerold(ItFo_Stew);
	DIA_Gerold_MoreFood();
};

instance DIA_Gerold_PERM4(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 41;
	condition = DIA_Gerold_PERM4_Condition;
	information = DIA_Gerold_PERM4_Info;
	permanent = TRUE;
	description = "��� ��� �������?";
};


func int DIA_Gerold_PERM4_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gerold_KAP4_ALLESRUHIG))
	{
		return TRUE;
	};
};

func void DIA_Gerold_PERM4_Info()
{
	AI_Output(other,self,"DIA_Gerold_PERM4_15_00");	//��� ��� �������?
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_01");	//���� ���� ������� ��� �����, ���� ������ ������� �� ������� ���.
	}
	else if(MIS_GeroldGiveFood == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_02");	//��, ������ ����, ������. � ���� ������ �� �����. ������� ��� ���.
	}
	else if(MIS_GeroldGiveFood == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_03");	//��. �� ��� ��, ������� �� ������.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_04");	//��� � �������, ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_05");	//����������!
	};
	AI_StopProcessInfos(self);
};

