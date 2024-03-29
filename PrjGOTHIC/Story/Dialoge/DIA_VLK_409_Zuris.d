
instance DIA_Zuris_EXIT(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 999;
	condition = DIA_Zuris_EXIT_Condition;
	information = DIA_Zuris_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Zuris_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Zuris_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Zuris_PICKPOCKET(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 900;
	condition = DIA_Zuris_PICKPOCKET_Condition;
	information = DIA_Zuris_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(������� ��� ����� ����� �������� ������)";
};


func int DIA_Zuris_PICKPOCKET_Condition()
{
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (other.attribute[ATR_DEXTERITY] >= 30))
	{
		return TRUE;
	};
};

func void DIA_Zuris_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Zuris_PICKPOCKET);
	Info_AddChoice(DIA_Zuris_PICKPOCKET,Dialog_Back,DIA_Zuris_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Zuris_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Zuris_PICKPOCKET_DoIt);
};

func void DIA_Zuris_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		CreateInvItem(other,ItPo_Health_03);
		AI_PrintScreen(ConcatStrings(NAME_HP_Elixier,PRINT_ItemTaken),-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		B_LogEntry(Topic_PickPocket,ConcatStrings("�����",ConcatStrings(PRINT_PickPocketSuccess,"�������� �������.")));
	}
	else
	{
		B_ResetThiefLevel();
		B_LogEntry(Topic_PickPocket,ConcatStrings("�����",PRINT_PickPocketFailed));
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
	Info_ClearChoices(DIA_Zuris_PICKPOCKET);
};

func void DIA_Zuris_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Zuris_PICKPOCKET);
};


instance DIA_Zuris_Sperre(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Sperre_Condition;
	information = DIA_Zuris_Sperre_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Zuris_Sperre_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Sperre == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Sperre_Info()
{
	AI_Output(self,other,"DIA_Zuris_Sperre_14_00");	//�� �����������, ��������� �� ��������������� �������. ����������!
	AI_StopProcessInfos(self);
};


instance DIA_Zuris_GREET(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_GREET_Condition;
	information = DIA_Zuris_GREET_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Zuris_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Sperre == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Zuris_GREET_Info()
{
	AI_Output(self,other,"DIA_Zuris_GREET_14_00");	//� �����, ���������� �� ������.
	AI_Output(self,other,"DIA_Zuris_GREET_14_01");	//���� ����� �������� �������� ��� ���������� �������? ����� �� ��������� �� ������.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"����� ������� ������� �� �������� �������.");
};


var int Zuris_einmal;

instance DIA_Zuris_WAREZ(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 800;
	condition = DIA_Zuris_WAREZ_Condition;
	information = DIA_Zuris_WAREZ_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_v4;
};


func int DIA_Zuris_WAREZ_Condition()
{
	return TRUE;
};

func void DIA_Zuris_WAREZ_Info()
{
	AI_Output(other,self,"DIA_Zuris_WAREZ_15_00");	//������ ��� ���� ������.
	if(Zuris_einmal == FALSE)
	{
		AI_Output(self,other,"DIA_Zuris_GREET_14_02");	//� ������ ��� ������� ��������� ����� �����. ��� �����, ������ �����, ��� ����, ������ ��� �� �� ���������.
		Zuris_einmal = TRUE;
	};
	if(MIS_Serpentes_MinenAnteil_KDF == LOG_Running)
	{
		ZurisMinenAnteil = TRUE;
	};
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Zuris_Potions(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_POTIONS_Condition;
	information = DIA_Zuris_POTIONS_Info;
	permanent = FALSE;
	description = "�� ��� �������� ���� �����?";
};


func int DIA_Zuris_POTIONS_Condition()
{
	return TRUE;
};

func void DIA_Zuris_POTIONS_Info()
{
	AI_Output(other,self,"DIA_Zuris_POTIONS_15_00");	//�� ��� �������� ���� �����?
	AI_Output(self,other,"DIA_Zuris_POTIONS_14_01");	//���, � ������� �� �� ��������� ��� ������� � �����������, ��������.
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Zuris_POTIONS_14_02");	//���� ���� ���������� ������� ������������� �����, ���� ����� ���������� � ���. ��� ��� ��� ����� ��������.
		AI_Output(self,other,"DIA_Zuris_POTIONS_14_03");	//�� �� ������� ���, ����� ������ ����-������ ������. � � ���� ��, ����� ��� ���.
	};
	AI_Output(self,other,"DIA_Zuris_Add_14_00");	//�� ������ �������� ���� ����, ����� ������� ����� ��������� ������ �������� �������� ��� ����� �����.
};


instance DIA_Zuris_Kraut(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Kraut_Condition;
	information = DIA_Zuris_Kraut_Info;
	permanent = FALSE;
	description = "� ��� ������ ����������� �������� �����?";
};


func int DIA_Zuris_Kraut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Zuris_Potions))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Kraut_Info()
{
	AI_Output(other,self,"DIA_Zuris_Add_15_01");	//� ��� ������ ����������� �������� �����?
	AI_Output(self,other,"DIA_Zuris_Add_14_02");	//�� ������ ������� ����� ��������� ������ ������, � ����� �������� � ���� ������.
	AI_Output(self,other,"DIA_Zuris_Add_14_03");	//�� ���-�� ������ ���, ��� ����� ���, ��� ��� �����, ������ ���, �� ����������� �������� ������.
	Wld_InsertItem(ItPl_Mana_Herb_01,"FP_ITEM_HERB_01");
	Wld_InsertItem(ItPl_Mana_Herb_02,"FP_ITEM_HERB_02");
	Wld_InsertItem(ItPl_Mana_Herb_03,"FP_ITEM_HERB_03");
	Wld_InsertItem(ItPl_Health_Herb_01,"FP_ITEM_HERB_04");
	Wld_InsertItem(ItPl_Health_Herb_02,"FP_ITEM_HERB_05");
	Wld_InsertItem(ItPl_Health_Herb_03,"FP_ITEM_HERB_06");
	Wld_InsertItem(ItPl_Speed_Herb_01,"FP_ITEM_HERB_07");
	Wld_InsertItem(ItPl_Temp_Herb,"FP_ITEM_HERB_08");
	Wld_InsertItem(ItPl_Strength_Herb_01,"FP_ITEM_HERB_09");
	Wld_InsertItem(ItPl_Dex_Herb_01,"FP_ITEM_HERB_10");
};


instance DIA_Zuris_Kronstoeckel(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Kronstoeckel_Condition;
	information = DIA_Zuris_Kronstoeckel_Info;
	permanent = FALSE;
	description = "����������� ������� ����, ��� ����� ����� ������� ������?";
};


func int DIA_Zuris_Kronstoeckel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Zuris_Kraut))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Kronstoeckel_Info()
{
	AI_Output(other,self,"DIA_Zuris_Add_15_04");	//����������� ������� ����, ��� ����� ����� ������� ������?
	AI_Output(self,other,"DIA_Zuris_Add_14_05");	//�� ���-�� ��������, ��� �� ������ ����� �������� ������.
	AI_Output(self,other,"DIA_Zuris_Add_14_06");	//����� ����� �������, ��� ����� ��������� ���������� �� ������ �����, ���� ���� �� ����� �������� ������.
	AI_Output(self,other,"DIA_Zuris_Add_14_07");	//��������� � �����, �� ����� �� �����. ��� �����-�� ���� ������, ��� ���-�� ����� �����.
	Wld_InsertItem(ItPl_Perm_Herb,"FP_ITEM_HERB_11");
};


instance DIA_Zuris_WHERE(C_Info)
{
	npc = VLK_409_Zuris;
	condition = DIA_Zuris_WHERE_Condition;
	information = DIA_Zuris_WHERE_Info;
	permanent = FALSE;
	description = "��� � ���� ����� �����������?";
};


func int DIA_Zuris_WHERE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Zuris_Potions))
	{
		return TRUE;
	};
};

func void DIA_Zuris_WHERE_Info()
{
	AI_Output(other,self,"DIA_Zuris_WHERE_15_00");	//��� � ���� ����� �����������?
	AI_Output(self,other,"DIA_Zuris_WHERE_14_01");	//��� ��� ��������� � ������� ����� ������� ������. ��� ����� �������� �����.
};


instance DIA_Zuris_Kloster(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Kloster_Condition;
	information = DIA_Zuris_Kloster_Info;
	description = "�������� ��� � ���������.";
};


func int DIA_Zuris_Kloster_Condition()
{
	if((Zuris_einmal == TRUE) || Npc_KnowsInfo(other,DIA_Zuris_Potions))
	{
		if(other.guild != GIL_KDF)
		{
			return TRUE;
		};
	};
};

func void DIA_Zuris_Kloster_Info()
{
	AI_Output(other,self,"DIA_Zuris_Kloster_14_00");	//�������� ��� � ���������.
	AI_Output(self,other,"DIA_Zuris_Kloster_14_01");	//���� ����� ���������� �� ���� � ����� �������� �������. �� ����� ������ ����.
};


instance DIA_Zuris_Minenanteil(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 3;
	condition = DIA_Zuris_Minenanteil_Condition;
	information = DIA_Zuris_Minenanteil_Info;
	description = "�� �������� ���������� �����?";
};


func int DIA_Zuris_Minenanteil_Condition()
{
	if((other.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && (ZurisMinenAnteil == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Zuris_Minenanteil_15_00");	//�� �������� ���������� �����?
	AI_Output(self,other,"DIA_Zuris_Minenanteil_14_01");	//��. ��� ��������� �� ����� �������� ����. ��� ��������� ���, ����� � ���������� � �������� ������������ �����������!
	B_GivePlayerXP(XP_Ambient);
};

