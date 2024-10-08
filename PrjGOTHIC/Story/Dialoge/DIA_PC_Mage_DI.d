
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
	B_EquipTrader(self);
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
	if(UndeadDragonIsDead == FALSE)
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
	if((UndeadDragonIsDead == FALSE) && Npc_KnowsInfo(other,DIA_Milten_DI_Hello))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_TRADE_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_TRADE_15_00");	//���� ��������� ������ �����?
	B_GiveTradeInv(self);
	B_RefreshInvItemToAmount(self,ItPo_Health_02,15);
	B_RefreshInvItemToAmount(self,ItPo_Mana_02,15);
	AI_Output(self,other,"DIA_Milten_DI_TRADE_03_01");	//���� ���� �����.
	Trade_IsActive = TRUE;
};


instance DIA_Milten_DI_Rat(C_Info)
{
	npc = PC_Mage_DI;
	nr = 3;
	condition = DIA_Milten_DI_Rat_Condition;
	information = DIA_Milten_DI_Rat_Info;
	description = "������ ���� ��� �����-������ �����?";
};


func int DIA_Milten_DI_Rat_Condition()
{
	if((UndeadDragonIsDead == FALSE) && Npc_KnowsInfo(other,DIA_Milten_DI_Hello))
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
	if((SC_InnosEyeVergessen_DI == TRUE) && (XardasDIBagOpened == FALSE))
	{
		AI_Output(other,self,"DIA_Milten_DI_Rat_nein_15_00");	//���.
		AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_01");	//(����������) �� �����... ��� �� ������ ������, ���� �� ����������� � ��������� �����, �� �������?
		AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_02");	//�� ��� � �� �������? ����� � ��� ���� ���� ������������ ����, �� ����� �� �������� ������������ ����.
		AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_03");	//� �� � ��� �������? ��� �������� ������ ���������, ��� ���� ���������������������� �� ����� ������ ��� ������.
	}
	else
	{
		AI_Output(other,self,"DIA_Milten_DI_Rat_ja_15_00");	//�������.
		AI_Output(self,other,"DIA_Milten_DI_Rat_ja_03_01");	//������, ��� � ����� ����� ������ ������. � ������� ���������.
		if(SC_InnosEyeVergessen_DI == FALSE)
		{
			B_GivePlayerXP(XP_AmbientKap6);
		};
	};
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
	if(Npc_KnowsInfo(other,DIA_Pedro_DI_YOU) || Npc_IsDead(Pedro_DI))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_PEDROTOT_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_PEDROTOT_15_00");	//� ����� �����.
	AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_01");	//(���������) ���? ���? �����, �� �������? ����, �� ��� ��������� ����������.
	AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_02");	//� ������� �� ����, ��� �� ����� �������.
	if(Npc_IsDead(Pedro_DI))
	{
		AI_Output(other,self,"DIA_Milten_DI_PEDROTOT_15_03");	//�� �����.
		AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_04");	//��? ������. �� ��������� ��� ���� � �����. ���� � �� ���� �������, ��� ��� ���� ���, � ��� �� ��� �� �� ����� ������ ��� ������� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_05");	//� ���� � ��� ������ �����.
	};
	B_GivePlayerXP(XP_AmbientKap6);
};


func void B_BuildLearnDialog_Milten_DI()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnAttributeString(ATR_MANA_MAX,1),DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnAttributeString(ATR_MANA_MAX,5),DIA_Milten_DI_TeachMagic_MANA_5);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,NAME_Skill_Runes,DIA_Milten_DI_TeachMagic_RUNES);
	}
	else if(hero.guild == GIL_PAL)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,NAME_Skill_PalRunes,DIA_Milten_DI_TeachMagic_RUNES);
	};
};

func void B_BuildLearnDialog_Runes_Milten_DI()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_SubTeachMagic_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,NAME_Circle_6,DIA_Milten_DI_TeachMagic_Runen_Circle_6);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,NAME_Circle_5,DIA_Milten_DI_TeachMagic_Runen_Circle_5);
	};
	Info_AddChoice(DIA_Milten_DI_TeachMagic,NAME_Circle_4,DIA_Milten_DI_TeachMagic_Runen_Circle_4);
};

func void B_BuildLearnDialog_PalRunes_Milten_DI()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_SubTeachMagic_BACK);
	if(PLAYER_TALENT_RUNES[SPL_PalLight] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_PalLight,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalLight)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLight);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalLightHeal] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_PalLightHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalLightHeal)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLightHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalHolyBolt] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_PalHolyBolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalHolyBolt)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalHolyBolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalMediumHeal] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_PalMediumHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalMediumHeal)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalMediumHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalRepelEvil] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_PalRepelEvil,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalRepelEvil)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalRepelEvil);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalFullHeal] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_PalFullHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalFullHeal)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalFullHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_PalDestroyEvil,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_PalDestroyEvil)),DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalDestroyEvil);
	};
};

func void DIA_Milten_RunesComment_01()
{
	AI_Output(self,other,"DIA_Milten_DI_TeachMagic_RUNES_03_00");	//��, ���! � �� ������� ���������� � ����, �� �� ���-������ ���������.
};

func void DIA_Milten_RunesComment_02()
{
	AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_1_03_00");	//�� ����� ���� ���� ������.
};

func void DIA_Milten_RunesComment_03()
{
	AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_5_03_00");	//�� ������� ����� ���� ����.
};

var int DIA_Milten_DI_TeachMagic_OneTime;

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
	if((UndeadDragonIsDead == FALSE) && Npc_KnowsInfo(other,DIA_Milten_DI_Hello))
	{
		return TRUE;
	};
};

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
	B_BuildLearnDialog_Milten_DI();
};

func void DIA_Milten_DI_TeachMagic_MANA_1()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MAX))
	{
		DIA_Milten_RunesComment_02();
		B_BuildLearnDialog_Milten_DI();
	};
};

func void DIA_Milten_DI_TeachMagic_MANA_5()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MAX))
	{
		DIA_Milten_RunesComment_03();
		B_BuildLearnDialog_Milten_DI();
	};
};

func void DIA_Milten_DI_TeachMagic_RUNES()
{
	DIA_Common_WantToLearnNewRunes();
	if(hero.guild == GIL_PAL)
	{
		DIA_Milten_RunesComment_01();
		B_BuildLearnDialog_PalRunes_Milten_DI();
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4)
	{
		B_BuildLearnDialog_Runes_Milten_DI();
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_RUNES_03_01");	//��. �� ��� �� ������ �����. ������� �� ������ ������� ������ �����, � ����� � ����� ������ ����.
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLight()
{
	B_TeachPlayerPalRunes(self,other,SPL_PalLight);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLightHeal()
{
	B_TeachPlayerPalRunes(self,other,SPL_PalLightHeal);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalHolyBolt()
{
	B_TeachPlayerPalRunes(self,other,SPL_PalHolyBolt);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalMediumHeal()
{
	B_TeachPlayerPalRunes(self,other,SPL_PalMediumHeal);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalRepelEvil()
{
	B_TeachPlayerPalRunes(self,other,SPL_PalRepelEvil);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalFullHeal()
{
	B_TeachPlayerPalRunes(self,other,SPL_PalFullHeal);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalDestroyEvil()
{
	B_TeachPlayerPalRunes(self,other,SPL_PalDestroyEvil);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,B_BuildLearnDialog_Runes_Milten_DI);
	if(PLAYER_TALENT_RUNES[SPL_SummonGolem] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_SummonGolem,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGolem)),DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_SummonGolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_DestroyUndead] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_DestroyUndead,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_DestroyUndead)),DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_DestroyUndead);
	};
	if(PLAYER_TALENT_RUNES[SPL_LightningFlash] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_LightningFlash,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightningFlash)),DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_LightningFlash);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE)
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
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,B_BuildLearnDialog_Runes_Milten_DI);
	if(PLAYER_TALENT_RUNES[SPL_IceWave] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_IceWave,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceWave)),DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_IceWave);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_SummonDemon,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonDemon)),DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_SummonDemon);
	};
	if(PLAYER_TALENT_RUNES[SPL_FullHeal] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_FullHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FullHeal)),DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_FullHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Pyrokinesis);
	};
	if(PLAYER_TALENT_RUNES[SPL_Shrink] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_Shrink,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Shrink)),DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Shrink);
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

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Shrink()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Shrink);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,B_BuildLearnDialog_Runes_Milten_DI);
	if(PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Firerain);
	};
	if(PLAYER_TALENT_RUNES[SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_BreathOfDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_BreathOfDeath)),DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_BreathOfDeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_MassDeath] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_MassDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MassDeath)),DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_MassDeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,B_BuildLearnString(NAME_SPL_ArmyOfDarkness,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ArmyOfDarkness)),DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_ArmyOfDarkness);
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

func void DIA_Milten_DI_SubTeachMagic_BACK()
{
	B_BuildLearnDialog_Milten_DI();
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
	B_GivePlayerXP(XP_AmbientKap6);
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
	B_GivePlayerXP(XP_AmbientKap6);
};


instance DIA_Milten_DI_UndeadDragonDead(C_Info)
{
	npc = PC_Mage_DI;
	nr = 31;
	condition = DIA_Milten_DI_UndeadDragonDead_Condition;
	information = DIA_Milten_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "������. ���� �������! ���� ������ ����� ����� ����.";
};


func int DIA_Milten_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
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
	};
	AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_11");	//���� ����� ����� � �������� � ������� ���, ����� �� �������� �����.
	AI_StopProcessInfos(self);
	if(DIA_Milten_DI_UndeadDragonDead_OneTime == FALSE)
	{
		if(Lester_IsOnBoard != LOG_SUCCESS)
		{
			Npc_ExchangeRoutine(self,"SITTINGSHIPDI");
		}
		else
		{
			Npc_ExchangeRoutine(self,"START");
		};
	};
	DIA_Milten_DI_UndeadDragonDead_OneTime = TRUE;
};

