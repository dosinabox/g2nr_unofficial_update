
instance DIA_Vatras_DI_EXIT(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 999;
	condition = DIA_Vatras_DI_EXIT_Condition;
	information = DIA_Vatras_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vatras_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Vatras_DI_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Vatras_DI_HEAL(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 10;
	condition = DIA_Vatras_DI_HEAL_Condition;
	information = DIA_Vatras_DI_HEAL_Info;
	permanent = TRUE;
	description = "������ ����.";
};


func int DIA_Vatras_DI_HEAL_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_HEAL_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_HEAL_15_00");	//������ ����.
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Vatras_DI_HEAL_05_01");	//(������������) ������, ���������� ��� ����. ��� ������������� ������������ ������ ����.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		AI_PrintScreen(PRINT_FullyHealed,-1,-1,FONT_Screen,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_HEAL_05_02");	//���� ���� ������ �� ��������� � �������.
	};
};


instance DIA_Vatras_DI_TRADE(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 11;
	condition = DIA_Vatras_DI_TRADE_Condition;
	information = DIA_Vatras_DI_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "�� ������ ������� ��� ���-������?";
};


func int DIA_Vatras_DI_TRADE_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_TRADE_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_TRADE_15_00");	//�� ������ ������� ��� ���-������?
	AI_Output(self,other,"DIA_Vatras_DI_TRADE_05_01");	//� ��� �� ����������?
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


var int Vatras_DI_HealObsession_Count;
var int Vatras_DI_HealObsession_Day;

instance DIA_Vatras_DI_OBSESSION(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 12;
	condition = DIA_Vatras_DI_OBSESSION_Condition;
	information = DIA_Vatras_DI_OBSESSION_Info;
	permanent = TRUE;
	description = "������ ���. � �������!";
};


func int DIA_Vatras_DI_OBSESSION_Condition()
{
	if((UndeadDragonIsDead == FALSE) && (SC_IsObsessed == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_OBSESSION_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_OBSESSION_15_00");	//������ ���. � �������!
	if(Vatras_DI_HealObsession_Count > 1)
	{
		AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_03");	//������ �������� ��������. ��� ����� ����, ���� ���. � ������ ����� �� ���� ������ ����.
	}
	else if(!C_DaysSinceEvent(Vatras_DI_HealObsession_Day,2))
	{
		AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_04");	//� �� ������ �� ���� ���� ���� ���� ��� ���� ������� � ����� �������� �����. ����������� �����, ���� ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_01");	//������ ��� ����� ������������. ������� ��� ��� ��������� ���� �������� ��������� �� ���� �������.
		AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_02");	//������ �����: ��� ����������� �� ���������� ���� �� ������ �������� ����������.
		CreateInvItems(self,ItPo_HealObsession_MIS,1);
		B_GiveInvItems(self,other,ItPo_HealObsession_MIS,1);
		Vatras_DI_HealObsession_Count += 1;
		Vatras_DI_HealObsession_Day = Wld_GetDay();
	};
};


instance DIA_Vatras_DI_RAT(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 13;
	condition = DIA_Vatras_DI_RAT_Condition;
	information = DIA_Vatras_DI_RAT_Info;
	description = "����� ����� �� ������ ���� ���?";
};


func int DIA_Vatras_DI_RAT_Condition()
{
	if((UndeadDragonIsDead == FALSE) && (SC_IsObsessed == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_RAT_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_RAT_15_00");	//����� ����� �� ������ ���� ���?
	AI_Output(self,other,"DIA_Vatras_DI_RAT_05_01");	//������� �������� �� ������. �����, ��� �� ������ ������ ����� ������� ���� ��������� ���� �����, ����� �� ���������.
	if(Npc_HasItems(other,ItAm_Prot_BlackEye_MIS))
	{
		AI_Output(other,self,"DIA_Vatras_DI_RAT_15_02");	//�� ��������, � ���� ���� ������ ������ ���.
	};
	AI_Output(self,other,"DIA_Vatras_DI_RAT_05_03");	//���� ��� �� ���-�� ���������� � �����, ������� �� ���. � ��������, ��� ����� �������.
};


var int DIA_Vatras_DI_PEDROTOT_VatrasSucked;

instance DIA_Vatras_DI_PEDROTOT(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 3;
	condition = DIA_Vatras_DI_PEDROTOT_Condition;
	information = DIA_Vatras_DI_PEDROTOT_Info;
	description = "� ����� ��������� �����.";
};


func int DIA_Vatras_DI_PEDROTOT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_DI_YOU) || Npc_IsDead(Pedro_DI))
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_PEDROTOT_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_00");	//� ����� ��������� �����.
	Vatras_PedroFound = TRUE;
	B_GivePlayerXP(XP_AmbientKap6);
	self.flags = 0;
	if((MIS_Gorax_KillPedro == LOG_SUCCESS) && Npc_IsDead(Pedro_DI))
	{
		AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_01");	//�� �����.
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_02");	//� ������ �����������. � �� ������ ����� �� ����.
		DIA_Common_WhatDoYouMean();
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_04");	//� ���� � ����� �������������� ���������� � �����������. � ������� �������� ���, ��� ��� �������� � ����.
		DIA_Vatras_DI_PEDROTOT_VatrasSucked = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_05");	//����� ������� ��� ����, �� �������. �� ��������� ��� ������� ��������.
		if(Npc_IsDead(Pedro_DI))
		{
			AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_06");	//��� ����� ������� ������. �� �����.
			AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_07");	//(���������) ��. ����� �������. � ���� �������� �� ��� ������ ����.
		}
		else
		{
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_Vatras_DI_VatrasSucked(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 1;
	condition = DIA_Vatras_DI_VatrasSucked_Condition;
	information = DIA_Vatras_DI_VatrasSucked_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Vatras_DI_VatrasSucked_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Vatras_DI_PEDROTOT_VatrasSucked == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_VatrasSucked_Info()
{
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_00");	//�������� � ���� ����, ������. �� ������ ������ �� ������������ �� ��� ������.
	AI_StopProcessInfos(self);
};


func void B_BuildLearnDialog_Vatras_DI()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	Info_AddChoice(DIA_Vatras_DI_Talente,Dialog_Back,DIA_Vatras_DI_Talente_BACK);
	Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnAttributeString(ATR_MANA_MAX,1),DIA_Vatras_DI_Talente_MANA_1);
	Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnAttributeString(ATR_MANA_MAX,5),DIA_Vatras_DI_Talente_MANA_5);
	if((hero.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 6))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,NAME_Skill_MagicCircles,DIA_Vatras_DI_Talente_CIRCLES);
	};
	Info_AddChoice(DIA_Vatras_DI_Talente,NAME_Skill_Alchemy,DIA_Vatras_DI_Talente_ALCHIMIE);
};

instance DIA_Vatras_DI_Talente(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 14;
	condition = DIA_Vatras_DI_Talente_Condition;
	information = DIA_Vatras_DI_Talente_Info;
	permanent = TRUE;
	description = "����� ���� �����.";
};


func int DIA_Vatras_DI_Talente_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_Talente_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_Talente_15_00");	//����� ���� �����.
	AI_Output(self,other,"DIA_Vatras_DI_Talente_05_01");	//� ������ ���, ��� � ���� �����.
	B_BuildLearnDialog_Vatras_DI();
};

func void DIA_Vatras_DI_Talente_MANA_1()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MAX))
	{
		B_BuildLearnDialog_Vatras_DI();
	};
};

func void DIA_Vatras_DI_Talente_MANA_5()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MAX))
	{
		B_BuildLearnDialog_Vatras_DI();
	};
};

func void DIA_Vatras_DI_Talente_CIRCLES()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	Info_AddChoice(DIA_Vatras_DI_Talente,Dialog_Back,DIA_Vatras_DI_SubTalente_BACK);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Circle_1,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,1)),DIA_Vatras_DI_Talente_Circle_1);
	}
	else if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Circle_2,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,2)),DIA_Vatras_DI_Talente_Circle_2);
	}
	else if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Circle_3,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,3)),DIA_Vatras_DI_Talente_Circle_3);
	}
	else if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Circle_4,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,4)),DIA_Vatras_DI_Talente_Circle_4);
	}
	else if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Circle_5,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,5)),DIA_Vatras_DI_Talente_Circle_5);
	}
	else if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Circle_6,B_GetLearnCostTalent(other,NPC_TALENT_MAGE,6)),DIA_Vatras_DI_Talente_Circle_6);
	};
};

func void DIA_Vatras_DI_Talente_ALCHIMIE()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	Info_AddChoice(DIA_Vatras_DI_Talente,Dialog_Back,DIA_Vatras_DI_SubTalente_BACK);
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_HP_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Vatras_DI_Talente_POTION_Health_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_HP_Extrakt,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Vatras_DI_Talente_POTION_Health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_HP_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),DIA_Vatras_DI_Talente_POTION_Health_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Mana_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Vatras_DI_Talente_POTION_Mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Mana_Extrakt,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Vatras_DI_Talente_POTION_Mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Mana_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Vatras_DI_Talente_POTION_Mana_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_Speed_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Speed)),DIA_Vatras_DI_Talente_POTION_Speed);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) && C_ShowAlchemySTRDEXDialog())
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_STR_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_STR)),DIA_Vatras_DI_Talente_POTION_Perm_STR);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE) && C_ShowAlchemySTRDEXDialog())
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_DEX_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),DIA_Vatras_DI_Talente_POTION_Perm_DEX);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_ManaMax_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Vatras_DI_Talente_POTION_Perm_Mana);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente,B_BuildLearnString(NAME_HPMax_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),DIA_Vatras_DI_Talente_POTION_Perm_Health);
	};
};

func void DIA_Vatras_DI_Talente_Circle_1()
{
	B_TeachMagicCircle(self,other,1);
	DIA_Vatras_DI_Talente_CIRCLES();
};

func void DIA_Vatras_DI_Talente_Circle_2()
{
	B_TeachMagicCircle(self,other,2);
	DIA_Vatras_DI_Talente_CIRCLES();
};

func void DIA_Vatras_DI_Talente_Circle_3()
{
	B_TeachMagicCircle(self,other,3);
	DIA_Vatras_DI_Talente_CIRCLES();
};

func void DIA_Vatras_DI_Talente_Circle_4()
{
	B_TeachMagicCircle(self,other,4);
	DIA_Vatras_DI_Talente_CIRCLES();
};

func void DIA_Vatras_DI_Talente_Circle_5()
{
	if(B_TeachMagicCircle(self,other,5))
	{
		AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_5_05_00");	//������ �� ��� ������ �����. ��������� ����������, ��������� �����, �� �����.
	};
	DIA_Vatras_DI_Talente_CIRCLES();
};

func void DIA_Vatras_DI_Talente_Circle_6()
{
	if(B_TeachMagicCircle(self,other,6))
	{
		AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_00");	//�� ������ ����� ������� ������ � �����.
		AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_01");	//����� ���� ���� ���������� �����, � ���� ������������ �������� ����� ��� �������� ���������. ��� �� ������ ������� ���� ����.
	};
	B_BuildLearnDialog_Vatras_DI();
};

func void DIA_Vatras_DI_Talente_POTION_Health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	DIA_Vatras_DI_Talente_ALCHIMIE();
};

func void DIA_Vatras_DI_Talente_POTION_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
	DIA_Vatras_DI_Talente_ALCHIMIE();
};

func void DIA_Vatras_DI_Talente_POTION_Health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
	DIA_Vatras_DI_Talente_ALCHIMIE();
};

func void DIA_Vatras_DI_Talente_POTION_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	DIA_Vatras_DI_Talente_ALCHIMIE();
};

func void DIA_Vatras_DI_Talente_POTION_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
	DIA_Vatras_DI_Talente_ALCHIMIE();
};

func void DIA_Vatras_DI_Talente_POTION_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
	DIA_Vatras_DI_Talente_ALCHIMIE();
};

func void DIA_Vatras_DI_Talente_POTION_Speed()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Speed);
	DIA_Vatras_DI_Talente_ALCHIMIE();
};

func void DIA_Vatras_DI_Talente_POTION_Perm_STR()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR);
	DIA_Vatras_DI_Talente_ALCHIMIE();
};

func void DIA_Vatras_DI_Talente_POTION_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
	DIA_Vatras_DI_Talente_ALCHIMIE();
};

func void DIA_Vatras_DI_Talente_POTION_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
	DIA_Vatras_DI_Talente_ALCHIMIE();
};

func void DIA_Vatras_DI_Talente_POTION_Perm_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
	DIA_Vatras_DI_Talente_ALCHIMIE();
};

func void DIA_Vatras_DI_SubTalente_BACK()
{
	B_BuildLearnDialog_Vatras_DI();
};

func void DIA_Vatras_DI_Talente_BACK()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
};


var int DIA_Vatras_DI_DementorObsessionBook_OneTime;
var int VatrasBookCount;

instance DIA_Vatras_DI_DementorObsessionBook(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 15;
	condition = DIA_Vatras_DI_DementorObsessionBook_Condition;
	information = DIA_Vatras_DI_DementorObsessionBook_Info;
	permanent = TRUE;
	description = "� ������ �������� ���������.";
};


func int DIA_Vatras_DI_DementorObsessionBook_Condition()
{
	if(Npc_HasItems(other,ITWR_DementorObsessionBook_MIS))
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_DementorObsessionBook_Info()
{
	VatrasBookCount = Npc_HasItems(other,ITWR_DementorObsessionBook_MIS);
	AI_Output(other,self,"DIA_Vatras_DI_DementorObsessionBook_15_00");	//� ������ �������� ���������.
	if(DIA_Vatras_DI_DementorObsessionBook_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_DI_DementorObsessionBook_05_01");	//��. � �����, ����� ����� �����, ���� � ������ ��� � ��������� � ��������. ����, �������, ��� ������� ��������� ������.
		DIA_Vatras_DI_DementorObsessionBook_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_DementorObsessionBook_05_02");	//� ���� ���� ���? ������� ��� ���, ��� �������.
	};
	B_GiveInvItems(other,self,ITWR_DementorObsessionBook_MIS,VatrasBookCount);
	Npc_RemoveInvItems(self,ITWR_DementorObsessionBook_MIS,VatrasBookCount);
	B_GivePlayerXP(XP_AmbientKap6 * VatrasBookCount);
};


instance DIA_Vatras_DI_UndeadDragonDead(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 2;
	condition = DIA_Vatras_DI_UndeadDragonDead_Condition;
	information = DIA_Vatras_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "� ������ ���.";
};


func int DIA_Vatras_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};


var int DIA_Vatras_DI_UndeadDragonDead_OneTime;

func void DIA_Vatras_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Vatras_DI_UndeadDragonDead_15_00");	//� ������ ���.
	if(DIA_Vatras_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_01");	//� ����, � �������� ���.
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_02");	//�� ����� ���� �������, �� �������� �� ����� �� ���������.
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_04");	//�����, ��� ��� ��� ����� ���� ������ � ������ ����� ����� �� ����.
		if(hero.guild == GIL_DJG)
		{
			AI_Output(other,self,"DIA_Vatras_DI_UndeadDragonDead_15_03");	//���� � ������ �����������, ��� � ���, � �����, ���� ��� ���� ������ � �����, �������� ����� ������� �� ����� ����?
		};
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_05");	//��� ������ ������� ������ ���������� � ���� ���. ��� ����� ������� �� ��������.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_06");	//��� ���� ����� �� ������ �������� ���.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_15");	//������ ���� ������ ����� ����� �������� ������ � ������ ������� ������!
		AI_Output(other,self,"DIA_Vatras_Add_15_16");	//����� �� �� ����� ���.
		AI_Output(self,other,"DIA_Vatras_Add_05_17");	//(������) �� ��� � ������ - ���� ������.
		DIA_Vatras_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_09");	//����� ��������, ����� �� �������� ����� ��� ����� �������. ��������������� ��� ����� ���� �������.
};


instance DIA_Addon_Vatras_PissOffForever_DI(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 1;
	condition = DIA_Addon_Vatras_PissOffForever_DI_Condition;
	information = DIA_Addon_Vatras_PissOffForever_DI_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Vatras_PissOffForever_DI_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Vatras_DI_PEDROTOT_VatrasSucked == FALSE))
	{
		if(VatrasPissedOffForever == TRUE)
		{
			return TRUE;
		};
		if((MadKillerCount >= 7) && (MadKillerCount > VatrasMadKillerCount))
		{
			return TRUE;
		};
	};
};


var int DIA_Addon_Vatras_PissOffForever_DI_OneTime;

func void DIA_Addon_Vatras_PissOffForever_DI_Info()
{
	if(DIA_Addon_Vatras_PissOffForever_DI_OneTime == FALSE)
	{
		B_LastWarningVatras();
		DIA_Addon_Vatras_PissOffForever_DI_OneTime = TRUE;
	};
	B_VatrasPissedOff();
};


instance DIA_Addon_Vatras_DI_Stoneplate(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 16;
	condition = DIA_Addon_Vatras_DI_Stoneplate_Condition;
	information = DIA_Addon_Vatras_Stoneplate_Info;
	description = "� ���� � ����� ���� �������� ��������. �� ��� �� �� ��� ���������� � ��� ���-������?";
};


func int DIA_Addon_Vatras_DI_Stoneplate_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Addon_Vatras_Stoneplate) && (C_ScHasMagicStonePlate() || Npc_HasItems(other,ItWr_StonePlateCommon_Addon)))
	{
		return TRUE;
	};
};

instance DIA_Addon_Vatras_DI_SellStonplate(C_Info)
{
	npc = VLK_439_Vatras_DI;
	nr = 16;
	condition = DIA_Addon_Vatras_SellStonplate_Condition;
	information = DIA_Addon_Vatras_SellStonplate_Info;
	permanent = TRUE;
	description = "� ������ ���� ��� ��������...";
};

