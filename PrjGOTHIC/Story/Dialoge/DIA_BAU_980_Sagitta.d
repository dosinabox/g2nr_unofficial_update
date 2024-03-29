
instance DIA_Sagitta_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_EXIT_Condition;
	information = DIA_Sagitta_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sagitta_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_HALLO(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 1;
	condition = DIA_Sagitta_HALLO_Condition;
	information = DIA_Sagitta_HALLO_Info;
	description = "�� ����� ������ ����?";
};


func int DIA_Sagitta_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Sagitta_HALLO_Info()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_15_00");	//�� ����� ������ ����?
	AI_Output(self,other,"DIA_Sagitta_HALLO_17_01");	//������, ��� ���� ����� �� ����, � �����. � ������.
//	Info_ClearChoices(DIA_Sagitta_HALLO);
//	Info_AddChoice(DIA_Sagitta_HALLO,Dialog_Back,DIA_Sagitta_HALLO_ende);
//	Info_AddChoice(DIA_Sagitta_HALLO,"�� ������ �������� ����?",DIA_Sagitta_HALLO_Heil);
//	Info_AddChoice(DIA_Sagitta_HALLO,"��� �� ������� �����?",DIA_Sagitta_HALLO_was);
//	Info_AddChoice(DIA_Sagitta_HALLO,"��� ��?",DIA_Sagitta_HALLO_wer);
};

/*func void DIA_Sagitta_HALLO_wer()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_wer_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_01");	//�� ���, ������� �� ������ ��� ���?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_02");	//���� �������� �������-�������������. � ��� ��������.
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_03");	//�� ����� �� �����, ��� ���������� ���������� ������ ������ ������� � �� �������� �����.
};

func void DIA_Sagitta_HALLO_was()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_was_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_01");	//� ���� ����� �������, ������� ���� �����, � ��������� �������.
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_02");	//��� - ��� ����. �� ���� ��� ��, ��� ��� �����.
};

func void DIA_Sagitta_HALLO_Heil()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_Heil_15_00");	//�� ������ �������� ����?
	AI_Output(self,other,"DIA_Sagitta_HALLO_Heil_17_01");	//�� �� ���� ������, ��? ��� ��� �����, ���� � ����� ����� ���-�� �� � �������.
};

func void DIA_Sagitta_HALLO_ende()
{
	Info_ClearChoices(DIA_Sagitta_HALLO);
};
*/
instance DIA_Sagitta_Pre_Who(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 1;
	condition = DIA_Sagitta_Pre_Who_Condition;
	information = DIA_Sagitta_Pre_Who_Info;
	description = "��� ��?";
};


func int DIA_Sagitta_Pre_Who_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Pre_Who_Info()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_wer_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_01");	//�� ���, ������� �� ������ ��� ���?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_02");	//���� �������� �������-�������������. � ��� ��������.
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_03");	//�� ����� �� �����, ��� ���������� ���������� ������ ������ ������� � �� �������� �����.
};


instance DIA_Sagitta_Pre_Trade(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 1;
	condition = DIA_Sagitta_Pre_Trade_Condition;
	information = DIA_Sagitta_Pre_Trade_Info;
	description = "��� �� ������� �����?";
};


func int DIA_Sagitta_Pre_Trade_Condition()
{
//	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	if(Npc_KnowsInfo(other,DIA_Sagitta_Pre_Who))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Pre_Trade_Info()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_was_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_01");	//� ���� ����� �������, ������� ���� �����, � ��������� �������.
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_02");	//��� - ��� ����. �� ���� ��� ��, ��� ��� �����.
	Log_CreateTopic(TOPIC_OutTrader,LOG_NOTE);
	B_LogEntry(TOPIC_OutTrader,"� �������, ������� �� ������ ������, ����� ������ ��������� ������.");
};


instance DIA_Sagitta_Pre_Heal(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 99;
	condition = DIA_Sagitta_Pre_Heal_Condition;
	information = DIA_Sagitta_Pre_Heal_Info;
	description = "�� ������ �������� ����?";
};


func int DIA_Sagitta_Pre_Heal_Condition()
{
//	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	if(Npc_KnowsInfo(other,DIA_Sagitta_Pre_Trade))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Pre_Heal_Info()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_Heil_15_00");	//�� ������ �������� ����?
	AI_Output(self,other,"DIA_Sagitta_HALLO_Heil_17_01");	//�� �� ���� ������, ��? ��� ��� �����, ���� � ����� ����� ���-�� �� � �������.
};


instance DIA_Sagitta_TeachAlchemyRequest(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 6;
	condition = DIA_Sagitta_TeachAlchemyRequest_Condition;
	information = DIA_Sagitta_TeachAlchemyRequest_Info;
	permanent = TRUE;
	description = "�� ������ ������� ���� �������� �����?";
};


func int DIA_Sagitta_TeachAlchemyRequest_Condition()
{
//	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO) && (MIS_Sagitta_Herb == FALSE))
	if(Npc_KnowsInfo(other,DIA_Sagitta_Pre_Trade))
	{
		if(MIS_Sagitta_Herb == FALSE)
		{
			return TRUE;
		}
		else if((MIS_Sagitta_Herb == LOG_Running) && Npc_HasItems(self,ItPl_Sagitta_Herb_MIS) && (Sagitta_TeachAlchemy == FALSE))
		{
			return TRUE;
		};
	};
};


var int DIA_Sagitta_TeachAlchemyRequest_OneTime;
var int DIA_Sagitta_TeachAlchemyRequest_ToldAboutPlant;

func void DIA_Sagitta_TeachAlchemyRequest_Info()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_15_00");	//�� ������ ������� ���� �������� �����?
	if(Npc_HasItems(self,ItPl_Sagitta_Herb_MIS))
	{
		Npc_RemoveInvItem(self,ItPl_Sagitta_Herb_MIS);
		AI_Output(self,other,"DIA_Sagitta_Sagitta_Herb_17_01_add");	//�� ������ ���������� ���� ��� ����, ��� ������ ������ � ������������� �����.
		Sagitta_TeachAlchemy = TRUE;
		MIS_Sagitta_Herb = LOG_SUCCESS;
		B_CheckLog();
		Log_CreateTopic(TOPIC_OutTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_OutTeacher,"������������ ������� �� ������ ������ ����� ���������� ��� � �������� ������������� ��������� �����.");
	}
	else if(DIA_Sagitta_TeachAlchemyRequest_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_01");	//��� ���������. ���� ������� � ����� ������.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_02");	//��� �� ������ ���� ���� ��������? ����� ���� ������� ����� ��������, ��� ���� ��������� ��������.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_03");	//� ������ ������� ��� ����� ������ ������, ������� ��������� �� ������ ������������� ���� � ��������.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_04");	//���� �� �� ������ ��� ���� ���������� - ����� ������ ��������, �������� � ���� ��� - � ����� ����.
		DIA_Sagitta_TeachAlchemyRequest_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_05");	//� ��� ������� ����: ��, ����� ����, ��� �� ��������� ��� ���� ������ ����������, ��� � �������.
	};
	if(Sagitta_TeachAlchemy == FALSE)
	{
		Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
		Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"������, �� ��� ��� �� ���������.",DIA_Sagitta_TeachAlchemyRequest_nein);
		Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"��� ��� �� ����������?",DIA_Sagitta_TeachAlchemyRequest_was);
		if(DIA_Sagitta_TeachAlchemyRequest_ToldAboutPlant == TRUE)
		{
			Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"��� ����� ����� ���� ����������?",DIA_Sagitta_TeachAlchemyRequest_wo);
			Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"���������, �����, ��� ������� ����� �� ���-������.",DIA_Sagitta_TeachAlchemyRequest_wo_ja);
		};
	};
};

func void DIA_Sagitta_TeachAlchemyRequest_was()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_was_15_00");	//��� ��� �� ����������?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_was_17_01");	//��� ����� ������ �������� - �����, ���������� ��������� ����. �� ������� ��� �� �������� ����������� �������.
	if(DIA_Sagitta_TeachAlchemyRequest_ToldAboutPlant == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"��� ����� ����� ���� ����������?",DIA_Sagitta_TeachAlchemyRequest_wo);
	};
};

func void DIA_Sagitta_TeachAlchemyRequest_wo()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_15_00");	//��� ����� ����� ���� ����������?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_01");	//�����, ����������� ���, ������������ ������ � ������, ��� ���� ��� ����������� ��������, ����������� ��� �� �����.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_02");	//������ ��� ����������� �� ������������ ������� ������.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_03");	//��� ������ ��� ��� ������ ������� ��� �����, ���������?
	if(DIA_Sagitta_TeachAlchemyRequest_ToldAboutPlant == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"���������, �����, ��� ������� ����� �� ���-������.",DIA_Sagitta_TeachAlchemyRequest_wo_ja);
		DIA_Sagitta_TeachAlchemyRequest_ToldAboutPlant = TRUE;
	};
};

func void DIA_Sagitta_TeachAlchemyRequest_wo_ja()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_15_00");	//���������, �����, ��� ������� ����� �� ���-������.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_17_01");	//����� ���� � ����� �������.
	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
	MIS_Sagitta_Herb = LOG_Running;
	Log_CreateTopic(TOPIC_SagittaHerb,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SagittaHerb,LOG_Running);
	B_LogEntry(TOPIC_SagittaHerb,"������� ����� ����� �������� ��������. ��� ��������� ����, ��� ������ ������ �� ������������ ������� ������.");
};

func void DIA_Sagitta_TeachAlchemyRequest_nein()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_nein_15_00");	//������, �� ��� ��� �� ���������.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_nein_17_01");	//����� ������ ������� ��� ����� �� ������ ������.
	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
};


instance DIA_Sagitta_Sagitta_Herb(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 6;
	condition = DIA_Sagitta_Sagitta_Herb_Condition;
	information = DIA_Sagitta_Sagitta_Herb_Info;
	description = "� ����� ��������� ����.";
};


func int DIA_Sagitta_Sagitta_Herb_Condition()
{
	if(Npc_HasItems(other,ItPl_Sagitta_Herb_MIS) && (MIS_Sagitta_Herb == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Sagitta_Herb_Info()
{
	AI_Output(other,self,"DIA_Sagitta_Sagitta_Herb_15_00");	//� ����� ��������� ����.
	B_GiveInvItems(other,self,ItPl_Sagitta_Herb_MIS,1);
	Npc_RemoveInvItem(self,ItPl_Sagitta_Herb_MIS);
	AI_Output(self,other,"DIA_Sagitta_Sagitta_Herb_17_01");	//�������. ������ �� ������ ���������� ���� ��� ����, ��� ������ ������ � ������������� �����.
	Sagitta_TeachAlchemy = TRUE;
	MIS_Sagitta_Herb = LOG_SUCCESS;
	B_GivePlayerXP(XP_Sagitta_Sonnenaloe);
	Log_CreateTopic(TOPIC_OutTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_OutTeacher,"������������ ������� �� ������ ������ ����� ���������� ��� � �������� ������������� ��������� �����.");
};


instance DIA_Sagitta_Teach(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 6;
	condition = DIA_Sagitta_Teach_Condition;
	information = DIA_Sagitta_Teach_Info;
	permanent = TRUE;
	description = "����� ����� ������ �� ������� ���� ������?";
};


var int DIA_Sagitta_Teach_permanent;

func int DIA_Sagitta_Teach_Condition()
{
//	if((DIA_Sagitta_Teach_permanent == FALSE) && (Sagitta_TeachAlchemy == TRUE) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	if((DIA_Sagitta_Teach_permanent == FALSE) && (Sagitta_TeachAlchemy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Sagitta_Teach_15_00");	//����� ����� ������ �� ������� ���� ������?
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE))
	{
		Info_ClearChoices(DIA_Sagitta_Teach);
		Info_AddChoice(DIA_Sagitta_Teach,Dialog_Back,DIA_Sagitta_Teach_BACK);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString(NAME_HP_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Sagitta_Teach_Health_01);
		talente += 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString(NAME_HP_Extrakt,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Sagitta_Teach_Health_02);
		talente += 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString(NAME_Mana_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Sagitta_Teach_Mana_01);
		talente += 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString(NAME_Mana_Extrakt,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Sagitta_Teach_Mana_02);
		talente += 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString(NAME_Mana_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Sagitta_Teach_Mana_03);
		talente += 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString(NAME_ManaMax_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Sagitta_Teach_Perm_Mana);
		talente += 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE) && C_ShowAlchemySTRDEXDialog())
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString(NAME_DEX_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),DIA_Sagitta_Teach_Perm_DEX);
		talente += 1;
	};
	if(talente > 0)
	{
		if(Alchemy_Explain_Sagitta == FALSE)
		{
			AI_Output(self,other,"DIA_Sagitta_Teach_17_01");	//������ ��� ���������� � �������� ���� �������, � ������� ��������, ��� ���������� ����� ��� ������������� �����.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_02");	//��� ����� ��������� �� ������������ �����. ���� ����� ����������� ������ ��������, � ������� ����� ��������� �������������� �����.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_03");	//���� ����� ������� ����������� ����������� � ��� - ����� ������.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_04");	//�� � �������������� ����������� �� ������ ������ ������ � ����, ���� ��������.
			Alchemy_Explain_Sagitta = TRUE;
		};
		AI_Output(self,other,"DIA_Sagitta_Teach_17_05");	//��� ����� ����� ���� ����������?
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_Teach_17_06");	//�� ��� ������ ���, ���� � ����� ������� ����.
		DIA_Sagitta_Teach_permanent = TRUE;
	};
};

func void DIA_Sagitta_Teach_BACK()
{
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void DIA_Sagitta_Teach_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void DIA_Sagitta_Teach_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void DIA_Sagitta_Teach_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void DIA_Sagitta_Teach_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void DIA_Sagitta_Teach_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};

func void DIA_Sagitta_Teach_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
};


instance DIA_Sagitta_HEAL(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 99;
	condition = DIA_Sagitta_HEAL_Condition;
	information = DIA_Sagitta_HEAL_Info;
	permanent = TRUE;
	description = "������ ����.";
};


func int DIA_Sagitta_HEAL_Condition()
{
//	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	if(Npc_KnowsInfo(other,DIA_Sagitta_Pre_Heal))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_HEAL_Info()
{
	AI_Output(other,self,"DIA_Sagitta_HEAL_15_00");	//������ ����.
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Sagitta_HEAL_17_01");	//����� ���������, ��� ��� � ����. ���. ��� ���� � ������ ������� ��� ���� ����.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		AI_PrintScreen(PRINT_FullyHealed,-1,-1,FONT_Screen,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEAL_17_02");	//� ��������� ������ ���� �� ����� �������.
	};
};


instance DIA_Sagitta_TRADE(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 1;
	condition = DIA_Sagitta_TRADE_Condition;
	information = DIA_Sagitta_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "����� ������ �� ������ ���������� ���?";
};


func int DIA_Sagitta_TRADE_Condition()
{
//	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	if(Npc_KnowsInfo(other,DIA_Sagitta_Pre_Trade))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_TRADE_Info()
{
	AI_Output(other,self,"DIA_Sagitta_TRADE_15_00");	//����� ������ �� ������ ���������� ���?
	AI_Output(self,other,"DIA_Sagitta_TRADE_17_01");	//�������.
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Sagitta_OBSESSION(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 40;
	condition = DIA_Sagitta_OBSESSION_Condition;
	information = DIA_Sagitta_OBSESSION_Info;
	description = "� ������ �����-�� ������� ���������� �������. ��� ����� ������.";
};


func int DIA_Sagitta_OBSESSION_Condition()
{
	if((SC_IsObsessed == TRUE) && (SC_ObsessionTimes < 1) && Npc_KnowsInfo(other,DIA_Sagitta_Pre_Heal))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_OBSESSION_Info()
{
	AI_Output(other,self,"DIA_Sagitta_OBSESSION_15_00");	//� ������ �����-�� ������� ���������� �������. ��� ����� ������.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_01");	//� ����, ��� ���� ������������, ����� ��������������. �� ����� ��� ����������� ������� ������� ������.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_02");	//��� � ��������, ������� ���� ���������. ���� �������� ������ ����� ������������.
};


instance DIA_Sagitta_Thekla(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 30;
	condition = DIA_Sagitta_Thekla_Condition;
	information = DIA_Sagitta_Thekla_Info;
	description = "����� ������� ���� � ���� �� �������.";
};


func int DIA_Sagitta_Thekla_Condition()
{
	if((MIS_Thekla_Paket == LOG_Running) && Npc_KnowsInfo(other,DIA_Sagitta_Pre_Who))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Thekla_Info()
{
	AI_Output(other,self,"DIA_Sagitta_Thekla_15_00");	//����� ������� ���� � ���� �� �������.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_01");	//��, ��. ������-�� � ������� �� ��� ��������� ���� �����.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_02");	//���, ����� �����. � ������������ � ���!
	CreateInvItems(self,ItMi_TheklasPaket,1);
	B_GiveInvItems(self,other,ItMi_TheklasPaket,1);
	B_GivePlayerXP(150);
};


instance DIA_Sagitta_HEALRANDOLPH(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 20;
	condition = DIA_Sagitta_HEALRANDOLPH_Condition;
	information = DIA_Sagitta_HEALRANDOLPH_Info;
	permanent = TRUE;
	description = "� ��������� ���������� �������.";
};


var int DIA_Sagitta_HEALRANDOLPH_GotOne;
var int DIA_Sagitta_HEALRANDOLPH_KnowsPrice;

func int DIA_Sagitta_HEALRANDOLPH_Condition()
{
	if((MIS_HealRandolph == LOG_Running) && !Npc_HasItems(other,ItPo_HealRandolph_MIS) && Npc_KnowsInfo(other,DIA_Sagitta_Pre_Who))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_HEALRANDOLPH_Info()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_00");	//� ��������� ���������� �������.
	if(DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_01");	//� ����� ���� ������ �����������?!
	};
	if(DIA_Sagitta_HEALRANDOLPH_GotOne == TRUE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_02");	//� ��� ������ ��� ���������. �� ���������� �� �� � ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_03");	//� ��� ���� ��������� ��� ����. ��� �������� ��� �� ���� �� ���� ����.
	};
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_04");	//�� ��� ��������� ���� � 300 �������.
	if(DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
	{
		AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_05");	//���?
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_06");	//������������, ��� �� ������ �������� ����� ��������� - ��� ������, �����.
		DIA_Sagitta_HEALRANDOLPH_KnowsPrice = TRUE;
	};
	Info_ClearChoices(DIA_Sagitta_HEALRANDOLPH);
	Info_AddChoice(DIA_Sagitta_HEALRANDOLPH,"���. ������� ������ �� ����� ������?!",DIA_Sagitta_HEALRANDOLPH_no);
	Info_AddChoice(DIA_Sagitta_HEALRANDOLPH,"��� ���� ������.",DIA_Sagitta_HEALRANDOLPH_geld);
};

func void DIA_Sagitta_HEALRANDOLPH_geld()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_geld_15_00");	//��� ���� ������.
	if(B_GiveInvItems(other,self,ItMi_Gold,300))
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_01");	//����� ������. �� ������ ������ ����������� �� ���� �������������� ���� �������.
		CreateInvItems(self,ItPo_HealRandolph_MIS,1);
		B_GiveInvItems(self,other,ItPo_HealRandolph_MIS,1);
		DIA_Sagitta_HEALRANDOLPH_GotOne = TRUE;
		B_LogEntry(TOPIC_HealRandolph,"������� ���� ��� ��������� ��� ���������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_02");	//���� � ���� �� ����� ���� �����, � ���� ������������� �� ���� �� ����.
	};
	Info_ClearChoices(DIA_Sagitta_HEALRANDOLPH);
};

func void DIA_Sagitta_HEALRANDOLPH_no()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_no_15_00");	//���. ������� ������ �� ����� ������?!
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_no_17_01");	//(�������) �� �� ��� ���� �����? ��� �� ���� ������!
	Info_ClearChoices(DIA_Sagitta_HEALRANDOLPH);
};

