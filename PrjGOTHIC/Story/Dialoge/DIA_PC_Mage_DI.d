
instance DIA_Milten_DI_EXIT(C_Info)
{
	npc = PC_Mage_DI;
	nr = 999;
	condition = DIA_Milten_DI_EXIT_Condition;
	information = DIA_Milten_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Milten_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Milten_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Milten_DI_Hello(C_Info)
{
	npc = PC_Mage_DI;
	nr = 3;
	condition = DIA_Milten_DI_Hello_Condition;
	information = DIA_Milten_DI_Hello_Info;
	description = "����� ��� � ������ �������.";
};


func int DIA_Milten_DI_Hello_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_Hello_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_Hello_15_00");	//����� ��� � ������ �������.
	AI_Output(self,other,"DIA_Milten_DI_Hello_03_01");	//�� ��� ������ ���. ��� ���� ���������, ������� �� �� ������������� �� ���� ���.
	AI_Output(other,self,"DIA_Milten_DI_Hello_15_02");	//�� � ���?
	AI_Output(self,other,"DIA_Milten_DI_Hello_03_03");	//������� �� ���� ������ ���� �������, ����� �� ���� ����� ��������� ���� ���� ��.
};


instance DIA_Milten_DI_TRADE(C_Info)
{
	npc = PC_Mage_DI;
	nr = 12;
	condition = DIA_Milten_DI_TRADE_Condition;
	information = DIA_Milten_DI_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "���� ��������� ������ �����?";
};


func int DIA_Milten_DI_TRADE_Condition()
{
	if((Npc_IsDead(UndeadDragon) == FALSE) && Npc_KnowsInfo(other,DIA_Milten_DI_Hello))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_TRADE_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_TRADE_15_00");	//���� ��������� ������ �����?
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItPo_Health_02,Npc_HasItems(self,ItPo_Health_02));
	CreateInvItems(self,ItPo_Health_02,15);
	Npc_RemoveInvItems(self,ItPo_Mana_02,Npc_HasItems(self,ItPo_Mana_02));
	CreateInvItems(self,ItPo_Mana_02,15);
	AI_Output(self,other,"DIA_Milten_DI_TRADE_03_01");	//���� ���� �����.
};


instance DIA_Milten_DI_Rat(C_Info)
{
	npc = PC_Mage_DI;
	nr = 3;
	condition = DIA_Milten_DI_Rat_Condition;
	information = DIA_Milten_DI_Rat_Info;
	description = "����� ����� �� ������ ���� ���?";
};


func int DIA_Milten_DI_Rat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Milten_DI_Hello) && (Npc_IsDead(UndeadDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_Rat_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_15_00");	//������ ���� ��� �����-������ �����?
	AI_Output(self,other,"DIA_Milten_DI_Rat_03_01");	//���. ��� ������� �����, ��� �� ����������� � ���� ������. �� � ���� � ������ ��� ��� ����� �������� ������ ����.
	AI_Output(self,other,"DIA_Milten_DI_Rat_03_02");	//� ���� ���� ���� ������?
	Info_ClearChoices(DIA_Milten_DI_Rat);
	if(SC_InnosEyeVergessen_DI == TRUE)
	{
		Info_AddChoice(DIA_Milten_DI_Rat,"���.",DIA_Milten_DI_Rat_nein);
	}
	else
	{
		Info_AddChoice(DIA_Milten_DI_Rat,"�������.",DIA_Milten_DI_Rat_ja);
	};
};

func void DIA_Milten_DI_Rat_nein()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_nein_15_00");	//���.
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_01");	//(����������) �� �����... ��� �� ������ ������, ���� �� ����������� � ��������� �����, �� �������?
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_02");	//�� ��� � �� �������? ����� � ��� ���� ���� ������������ ����, �� ����� �� �������� ������������ ����.
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_03");	//� �� � ��� �������? ��� �������� ������ ���������, ��� ���� ���������������������� �� ����� ������ ��� ������.
	Info_ClearChoices(DIA_Milten_DI_Rat);
};

func void DIA_Milten_DI_Rat_ja()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_ja_15_00");	//�������.
	AI_Output(self,other,"DIA_Milten_DI_Rat_ja_03_01");	//������, ��� � ����� ����� ������ ������. � ������� ���������.
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Milten_DI_Rat);
};


instance DIA_Milten_DI_PEDROTOT(C_Info)
{
	npc = PC_Mage_DI;
	nr = 3;
	condition = DIA_Milten_DI_PEDROTOT_Condition;
	information = DIA_Milten_DI_PEDROTOT_Info;
	description = "� ����� �����.";
};


func int DIA_Milten_DI_PEDROTOT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_DI_YOU))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_PEDROTOT_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_PEDROTOT_15_00");	//� ����� �����.
	AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_01");	//(���������) ���? ���? �����, �� �������? ����, �� ��� ��������� ����������.
	AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_02");	//� ������� �� ����, ��� �� ����� �������.
	B_GivePlayerXP(XP_Ambient);
	if(Npc_IsDead(Pedro_DI))
	{
		AI_Output(other,self,"DIA_Milten_DI_PEDROTOT_15_03");	//�� �����.
		AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_04");	//��? ������. �� ��������� ��� ���� � �����. ���� � �� ���� �������, ��� ��� ���� ���, � ��� �� ��� �� �� ����� ������ ��� ������� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_05");	//� ���� � ��� ������ �����.
	};
};


instance DIA_Milten_DI_TeachMagic(C_Info)
{
	npc = PC_Mage_DI;
	nr = 31;
	condition = DIA_Milten_DI_TeachMagic_Condition;
	information = DIA_Milten_DI_TeachMagic_Info;
	permanent = TRUE;
	description = "� ���� �������� ���� ���������� �����������.";
};


func int DIA_Milten_DI_TeachMagic_Condition()
{
	if((Npc_IsDead(UndeadDragon) == FALSE) && Npc_KnowsInfo(other,DIA_Milten_DI_Hello))
	{
		return TRUE;
	};
};


var int DIA_Milten_DI_TeachMagic_OneTime;

func void DIA_Milten_DI_TeachMagic_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_TeachMagic_15_00");	//� ���� �������� ���� ���������� �����������.
	if(OrkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_01");	//� ������ ���, ��� �����.
	}
	else if(DIA_Milten_DI_TeachMagic_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_02");	//� ������ ����, �� ������ ��� �������, ��� �� ������������, ����� ���� ���������� ���, ��� ��� ���� ������.
		DIA_Milten_DI_TeachMagic_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_03");	//������. ��� �� ������?
	};
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Milten_DI_TeachMagic_MANA_5);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"�������� ���",DIA_Milten_DI_TeachMagic_RUNES);
	};
};

func void DIA_Milten_DI_TeachMagic_MANA_1()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_HIGH))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_1_03_00");	//�� ����� ���� ���� ������.
	};
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Milten_DI_TeachMagic_MANA_5);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"�������� ���",DIA_Milten_DI_TeachMagic_RUNES);
	};
};

func void DIA_Milten_DI_TeachMagic_MANA_5()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_HIGH))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_5_03_00");	//�� ������� ����� ���� ����.
	};
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Milten_DI_TeachMagic_MANA_5);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"�������� ���",DIA_Milten_DI_TeachMagic_RUNES);
	};
};

func void DIA_Milten_DI_TeachMagic_RUNES()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	AI_Output(self,other,"DIA_Milten_DI_TeachMagic_RUNES_03_00");	//��, ���! � �� ������� ���������� � ����, �� �� ���-������ ���������.
	if(hero.guild == GIL_PAL)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"���� ���������",DIA_Milten_DI_TeachMagic_Runen_Paladin);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic," ��������� ����",DIA_Milten_DI_TeachMagic_Runen_Circle_4);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic," ����� ����",DIA_Milten_DI_TeachMagic_Runen_Circle_5);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic," ������ ����",DIA_Milten_DI_TeachMagic_Runen_Circle_6);
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_RUNES_03_01");	//��. �� ��� �� ������ �����. ������� �� ������ ������� ������ �����, � ����� � ����� ������ ����.
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	if(player_talent_runes[SPL_PalLight] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString("����",B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalLight)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLight);
	};
	if(player_talent_runes[SPL_PalLightHeal] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString("����� ���������",B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalLightHeal)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLightHeal);
	};
	if(player_talent_runes[SPL_PalHolyBolt] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString("������ ������",B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalHolyBolt)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalHolyBolt);
	};
	if(player_talent_runes[SPL_PalMediumHeal] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString("������� ���������",B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalMediumHeal)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalMediumHeal);
	};
	if(player_talent_runes[SPL_PalRepelEvil] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString("�������� ���",B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalRepelEvil)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalRepelEvil);
	};
	if(player_talent_runes[SPL_PalFullHeal] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString("������� ���������",B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalFullHeal)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalFullHeal);
	};
	if(player_talent_runes[SPL_PalDestroyEvil] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString("����������� ���",B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalDestroyEvil)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalDestroyEvil);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLight()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalLight);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLightHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalLightHeal);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalHolyBolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalHolyBolt);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalMediumHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalMediumHeal);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalRepelEvil()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalRepelEvil);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalFullHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalFullHeal);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalDestroyEvil()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalDestroyEvil);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	if(player_talent_runes[SPL_SummonGolem] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_SummonGolem,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGolem)),DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_SummonGolem);
	};
	if(player_talent_runes[SPL_DestroyUndead] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_DestroyUndead,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_DestroyUndead)),DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_DestroyUndead);
	};
	if(player_talent_runes[SPL_LightningFlash] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_LightningFlash,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightningFlash)),DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_LightningFlash);
	};
	if(player_talent_runes[SPL_ChargeFireball] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_ChargeFireball);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_ChargeFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_SummonGolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGolem);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_DestroyUndead()
{
	B_TeachPlayerTalentRunes(self,other,SPL_DestroyUndead);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_LightningFlash()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightningFlash);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	if(player_talent_runes[SPL_IceWave] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_IceWave,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceWave)),DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_IceWave);
	};
	if(player_talent_runes[SPL_SummonDemon] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_SummonDemon,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonDemon)),DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_SummonDemon);
	};
	if(player_talent_runes[SPL_FullHeal] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_FullHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FullHeal)),DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_FullHeal);
	};
	if(player_talent_runes[SPL_Pyrokinesis] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Pyrokinesis);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_IceWave()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceWave);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_SummonDemon()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonDemon);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_FullHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FullHeal);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	if(player_talent_runes[SPL_Firerain] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Firerain);
	};
	if(player_talent_runes[SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_BreathOfDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_BreathOfDeath)),DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_BreathOfDeath);
	};
	if(player_talent_runes[SPL_MassDeath] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_MassDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MassDeath)),DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_MassDeath);
	};
	if(player_talent_runes[SPL_ArmyOfDarkness] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_ArmyOfDarkness,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ArmyOfDarkness)),DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_ArmyOfDarkness);
	};
	if(player_talent_runes[SPL_Shrink] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_Shrink,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Shrink)),dia_milten_di_teachmagic_runen_circle_6_spl_shrink);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_BreathOfDeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_BreathOfDeath);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_MassDeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MassDeath);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ArmyOfDarkness);
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_shrink()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Shrink);
};

func void DIA_Milten_DI_TeachMagic_BACK()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
};


instance DIA_Milten_DI_DementorObsessionBook(C_Info)
{
	npc = PC_Mage_DI;
	nr = 99;
	condition = DIA_Milten_DI_DementorObsessionBook_Condition;
	information = DIA_Milten_DI_DementorObsessionBook_Info;
	description = "��� �����, �������� ���������, ������� ���� � ���-��?";
};


func int DIA_Milten_DI_DementorObsessionBook_Condition()
{
	if(Npc_HasItems(other,ITWR_DementorObsessionBook_MIS))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_DementorObsessionBook_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_DementorObsessionBook_15_00");	//��� �����, �������� ���������, ������� ���� � ���-��?
	AI_Output(self,other,"DIA_Milten_DI_DementorObsessionBook_03_01");	//������� - ������� �� ����� ������.
	AI_Output(self,other,"DIA_Milten_DI_DementorObsessionBook_03_02");	//������. � ���� ������� ����, ����� ������� ���-���� ����� �� ����.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Milten_DI_DragonEgg(C_Info)
{
	npc = PC_Mage_DI;
	nr = 99;
	condition = DIA_Milten_DI_DragonEgg_Condition;
	information = DIA_Milten_DI_DragonEgg_Info;
	description = "�� ���� ���� � ���������� ������?";
};


func int DIA_Milten_DI_DragonEgg_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonEgg_MIS))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_DragonEgg_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_DragonEgg_15_00");	//�� ���� ���� � ���������� ������?
	AI_Output(self,other,"DIA_Milten_DI_DragonEgg_03_01");	//���, �� ������. � ������, ��� �������� ������� ���-�� ���� ������� ����� �� ���.
	AI_Output(self,other,"DIA_Milten_DI_DragonEgg_03_02");	//��, ����������, �� ��������� ���� � �������. � ������� �� ����, ��� ��� ���������.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Milten_DI_UndeadDragonDead(C_Info)
{
	npc = PC_Mage_DI;
	nr = 31;
	condition = DIA_Milten_DI_UndeadDragonDead_Condition;
	information = DIA_Milten_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "������. ���� �������!";
};


func int DIA_Milten_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};


var int DIA_Milten_DI_UndeadDragonDead_OneTime;

func void DIA_Milten_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_00");	//������. ���� �������! ���� ������ ����� ����� ����.
	if(DIA_Milten_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_01");	//��� ���� ������ ������� �������� ����� �� ����?
		AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_02");	//���� ���� ������, ���� � ����.
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_03");	//(�������) ��, �����-������ ������ ������ ��������? ��, �����������, ��������� ���.
		if(hero.guild == GIL_KDF)
		{
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_04");	//��� �� ����������� ������ ������?
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_05");	//� ����� �� ��������� ����������� ��������, ����� ������������� ���� ����. �� �� ����� ����� ������ �� ����������.
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_06");	//� ������� �� ����� � ���, ��� ���� ����� ����. � ��� ���� ���?
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_07");	//� ���� �� ����.
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_08");	//(�������) ����, ��� ������. ��, ������. �� ������ ��� ���� ���. ����� ��� ������������� ������� ��� �������?
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_09");	//���. ����� ����.
		};
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_10");	//�� �����, �������, � �����, ��� �������, ��� ���� ������ ����� - ������� �������.
		DIA_Milten_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_11");	//���� ����� ����� � �������� � ������� ���, ����� �� �������� �����.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Mage_DI_PICKPOCKET(C_Info)
{
	npc = PC_Mage_DI;
	nr = 900;
	condition = DIA_Mage_DI_PICKPOCKET_Condition;
	information = DIA_Mage_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Mage_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(45,120);
};

func void DIA_Mage_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mage_DI_PICKPOCKET);
	Info_AddChoice(DIA_Mage_DI_PICKPOCKET,Dialog_Back,DIA_Mage_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mage_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Mage_DI_PICKPOCKET_DoIt);
};

func void DIA_Mage_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mage_DI_PICKPOCKET);
};

func void DIA_Mage_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mage_DI_PICKPOCKET);
};
