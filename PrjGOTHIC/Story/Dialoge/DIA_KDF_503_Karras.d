
instance DIA_Karras_KAP1_EXIT(C_Info)
{
	npc = KDF_503_Karras;
	nr = 999;
	condition = DIA_Karras_KAP1_EXIT_Condition;
	information = DIA_Karras_KAP1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Karras_KAP1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Karras_KAP1_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Karras_Hello(C_Info)
{
	npc = KDF_503_Karras;
	nr = 1;
	condition = DIA_Karras_Hello_Condition;
	information = DIA_Karras_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Karras_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_NovizenChase != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Karras_Hello_Info()
{
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_00");	//��� � ���� ������� ��� ����, ���������?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_01");	//��� � ���� ������� ��� ����, ����?
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_02");	//����������� ����� ������ ����� ��������������� �����.
		AI_Output(self,other,"DIA_Karras_Hello_10_03");	//��� � ���� ������� ��� ����?
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_04");	//(�����������) ��� �� ������� �����?
	};
};


func void B_Karras_Good()
{
	AI_Output(self,other,"DIA_Karras_Success_10_01");	//�������, ��� ���� ����.
};

instance DIA_Karras_Mission(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_Mission_Condition;
	information = DIA_Karras_Mission_Info;
	permanent = FALSE;
	description = "� ������ �������� �������.";
};


func int DIA_Karras_Mission_Condition()
{
	return TRUE;
};

func void DIA_Karras_Mission_Info()
{
	AI_Output(other,self,"DIA_Karras_Mission_15_00");	//� ������ �������� �������.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Karras_Mission_10_01");	//�������. ���� ���� ������� �������� ����� ��� �������� �������, �������� �� ���.
		AI_Output(self,other,"DIA_Karras_Mission_10_02");	//���� ���� ������, � ������� ��� �� �������� �� ������ ��������������� ����������.
	}
	else if((other.guild == GIL_PAL) || (other.guild == GIL_KDF) || Npc_KnowsInfo(other,DIA_Karras_InnosEyeRetrieved))
	{
		B_Karras_Good();
	}
	else
	{
		AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_02");	//�� ������� ����, �� ��� �� ���������� �� ��� ����� �����������.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Karras_Aufgabe(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_Aufgabe_Condition;
	information = DIA_Karras_Aufgabe_Info;
	permanent = FALSE;
	description = "� ���� ���� ��������� ��� ����?";
};


func int DIA_Karras_Aufgabe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Karras_Mission) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Karras_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_00");	//� ���� ���� ��������� ��� ����?
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_01");	//��. ��� �������� ��������� ������. �� ����� � �������� � ���������������� � ���������� ������� � ��������� ����������. �� ����� �� ���������� ����������� ������������.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_02");	//� ��� ����� ��������� ����. � ����� ���� ������ - � ������ �� ��� ����� ������?
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_03");	//����� ��������� ���, ��� �������� �� ���������� ��������� �� ��� �������.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_04");	//� ����, ����� �� ���������� � ����� � ����� � ���� ��� ������ ��� ����.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_05");	//�� ������ �� ����� - �������?
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_06");	//�������.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_07");	//��� 150 ������� �����. ��� ������ �������������� ���� �������.
	MIS_KarrasVergessen = LOG_Running;
	Log_CreateTopic(Topic_KarrasCharm,LOG_MISSION);
	Log_SetTopicStatus(Topic_KarrasCharm,LOG_Running);
	B_LogEntry(Topic_KarrasCharm,"������ ������ �������� ���� � �����. �� �����, ����� � ������ ��� ��� ������ � ������������, ������� ������������� � ������� �����.");
	B_GiveInvItems(self,other,ItMi_Gold,150);
	if(!Npc_IsDead(Ignaz))
	{
		if((Npc_HasItems(other,ItSc_Charm) + Npc_HasItems(Ignaz,ItSc_Charm)) < 3)
		{
			CreateInvItems(Ignaz,ItSc_Charm,3);
		};
	};
};


instance DIA_Karras_Success(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_Success_Condition;
	information = DIA_Karras_Success_Info;
	permanent = FALSE;
	description = "��� ������, ������� �� ����� ��������.";
};


func int DIA_Karras_Success_Condition()
{
	if((MIS_KarrasVergessen == LOG_Running) && (Npc_HasItems(other,ItSc_Charm) >= 3) && (MIS_Ignaz_Charm != FALSE))
	{
		return TRUE;
	};
};

func void DIA_Karras_Success_Info()
{
	AI_Output(other,self,"DIA_Karras_Success_15_00");	//��� ������, ������� �� ����� ��������.
	B_GiveInvItems(other,self,ItSc_Charm,3);
	B_Karras_Good();
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Karras_Success_10_02");	//������ �� ������ ��������� ��������� ���� �������� � ����������.
	};
	AI_Output(self,other,"DIA_Karras_Success_10_03");	//� ������ ���� ������ � �������� �������.
	B_GiveInvItems(self,other,ItSc_SumWolf,1);
	MIS_KarrasVergessen = LOG_SUCCESS;
	B_GivePlayerXP(XP_KarrasCharm);
};


instance DIA_Karras_JOB(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_JOB_Condition;
	information = DIA_Karras_JOB_Info;
	permanent = FALSE;
	description = "� ��� ������ �� �����������?";
};


func int DIA_Karras_JOB_Condition()
{
	return TRUE;
};

func void DIA_Karras_JOB_Info()
{
	AI_Output(other,self,"DIA_Karras_JOB_15_00");	//� ��� ������ �� �����������?
	AI_Output(self,other,"DIA_Karras_JOB_10_01");	//� ������� �� �������� ����� ��������� ������������ ����������.
	AI_Output(other,self,"DIA_Karras_JOB_15_02");	//��� ��� ��������?
	AI_Output(self,other,"DIA_Karras_JOB_10_03");	//��, � ������ �� ������ ������� �� ������ ��������� ��� ����.
	AI_Output(self,other,"DIA_Karras_JOB_10_04");	//��� ������ ���������� ������ �������, ���� ��� ����������� ������������ ����� �������� ���� ��������� ������ ����.
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Karras_JOB_10_05");	//����� ����, � ���� ���� ����� ���������� ������, ������� ��� ���� � �������.
		if(other.guild == GIL_NOV)
		{
			AI_Output(self,other,"DIA_Karras_JOB_10_06");	//�� � ���� ������� �� ������ ������ ������ ������.
			Log_CreateTopic(Topic_KlosterTrader,LOG_NOTE);
			B_LogEntries(Topic_KlosterTrader,"������ ������ �� ��������� ����� ������� ��� ������ � ������������. �� ��� ����� � ������ ���� ����� ����.");
			Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
			B_LogNextEntry(Topic_KlosterTeacher,"������ ������ ������� �������� ������. �� ��� ����� � ������ ���� ����� ����.");
		}
		else
		{
			Log_CreateTopic(Topic_KlosterTrader,LOG_NOTE);
			if(Npc_KnowsInfo(other,DIA_Pyrokar_Lernen))
			{
				B_LogEntry(Topic_KlosterTrader,"���� ������ �� ��������� ����� ������� ��� ������ � ������������.");
			}
			else
			{
				B_LogEntries(Topic_KlosterTrader,"���� ������ �� ��������� ����� ������� ��� ������ � ������������.");
				Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
				B_LogNextEntry(Topic_KlosterTeacher,"���� ������ ������� �������� ������.");
			};
		};
	};
};


instance DIA_Karras_Trade(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_Trade_Condition;
	information = DIA_Karras_Trade_Info;
	permanent = TRUE;
	description = DIALOG_TRADE_v4;
	trade = TRUE;
};


func int DIA_Karras_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Karras_JOB) && (Npc_KnowsInfo(other,DIA_Karras_InnosEyeRetrieved) || (hero.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Karras_Trade_Info()
{
	AI_Output(other,self,"DIA_Karras_Trade_15_00");	//������ ��� ���� ������.
	if(Npc_HasItems(other,Holy_Hammer_MIS))
	{
		B_Karras_Good();
		B_ReturnHolyHammer();
	};
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Karras_TEACH(C_Info)
{
	npc = KDF_503_Karras;
	nr = 10;
	condition = DIA_Karras_TEACH_Condition;
	information = DIA_Karras_TEACH_Info;
	permanent = TRUE;
	description = "� ���� ������� ����� ����������.";
};


func int DIA_Karras_TEACH_Condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Karras_JOB))
	{
		return TRUE;
	};
};

func void DIA_Karras_TEACH_Info()
{
	var int abletolearn;
	abletolearn = 0;
	DIA_Common_WantToLearnNewRunes();
	Info_ClearChoices(DIA_Karras_TEACH);
	Info_AddChoice(DIA_Karras_TEACH,Dialog_Back,DIA_Karras_TEACH_BACK);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == FALSE))
	{
		Info_AddChoice(DIA_Karras_TEACH,B_BuildLearnString(NAME_SPL_SummonGoblinSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGoblinSkeleton)),DIA_Karras_TEACH_SUMGOBL);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_SummonWolf] == FALSE))
	{
		Info_AddChoice(DIA_Karras_TEACH,B_BuildLearnString(NAME_SPL_SummonWolf,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonWolf)),DIA_Karras_TEACHSummonWolf);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == FALSE))
	{
		Info_AddChoice(DIA_Karras_TEACH,B_BuildLearnString(NAME_SPL_SummonSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonSkeleton)),DIA_Karras_TEACH_SummonSkeleton);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_SummonGolem] == FALSE))
	{
		Info_AddChoice(DIA_Karras_TEACH,B_BuildLearnString(NAME_SPL_SummonGolem,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGolem)),DIA_Karras_TEACH_SummonGolem);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE))
	{
		Info_AddChoice(DIA_Karras_TEACH,B_BuildLearnString(NAME_SPL_SummonDemon,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonDemon)),DIA_Karras_TEACH_SummonDemon);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == FALSE))
	{
		Info_AddChoice(DIA_Karras_TEACH,B_BuildLearnString(NAME_SPL_ArmyOfDarkness,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ArmyOfDarkness)),DIA_Karras_TEACH_ArmyOfDarkness);
		abletolearn += 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Karras_TEACH_10_01");	//� ��������� ������ ��� ������ ����� ����.
		if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0)
		{
			PrintScreen(PRINT_MAGCIRCLES_NEEDFIRST,-1,-1,FONT_ScreenSmall,2);
		};
		Info_ClearChoices(DIA_Karras_TEACH);
	};
};

func void DIA_Karras_TEACH_BACK()
{
	Info_ClearChoices(DIA_Karras_TEACH);
};

func void DIA_Karras_TEACH_SUMGOBL()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGoblinSkeleton);
};

func void DIA_Karras_TEACHSummonWolf()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonWolf);
};

func void DIA_Karras_TEACH_SummonSkeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonSkeleton);
};

func void DIA_Karras_TEACH_SummonGolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGolem);
};

func void DIA_Karras_TEACH_SummonDemon()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonDemon);
};

func void DIA_Karras_TEACH_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ArmyOfDarkness);
};


instance DIA_Karras_CIRCLE4(C_Info)
{
	npc = KDF_503_Karras;
	nr = 3;
	condition = DIA_Karras_CIRCLE4_Condition;
	information = DIA_Karras_CIRCLE4_Info;
	permanent = TRUE;
//	description = B_BuildLearnString("� ���� ������� ��������� ���� �����",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,4));
	description = B_BuildLearnString("��������� ���� �����",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,4));
};


func int DIA_Karras_CIRCLE4_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && Npc_KnowsInfo(other,DIA_Karras_JOB))
	{
		return TRUE;
	};
};

func void DIA_Karras_CIRCLE4_Info()
{
	AI_Output(other,self,"DIA_Karras_CIRCLE4_15_00");	//� ���� ������� ��������� ���� �����.
	if(MIS_ReadyforChapter4 == TRUE)
	{
		if(B_TeachMagicCircle(self,other,4))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_01");	//������. ��� ����� �� ������������ ���� �����������. ����� �� � ��������� ����, �� �������� � ����� ���� ���� ����� �����.
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_02");	//�� ����� ������ ������, � ����� ����� ���������� �������� ���� ����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_04");	//����� ��� �� ������.
	};
};


instance DIA_Karras_CIRCLE5(C_Info)
{
	npc = KDF_503_Karras;
	nr = 3;
	condition = DIA_Karras_CIRCLE5_Condition;
	information = DIA_Karras_CIRCLE5_Info;
	permanent = TRUE;
//	description = B_BuildLearnString("� ���� ������� ����� ���� �����",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,5));
	description = B_BuildLearnString("����� ���� �����",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,5));
};


func int DIA_Karras_CIRCLE5_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && Npc_KnowsInfo(other,DIA_Karras_JOB))
	{
		return TRUE;
	};
};

func void DIA_Karras_CIRCLE5_Info()
{
	AI_Output(other,self,"DIA_Karras_CIRCLE5_15_00");	//� ���� ������� ����� ���� �����.
	if(Kapitel >= 5)
	{
		if(B_TeachMagicCircle(self,other,5))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_01");	//����� �� � ����� ���� �����. ���� ������ ���������� �������������� �����, ����������� � ���, ��� �� ������ �����.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_02");	//��������� ��� ���� �� �����, ���� - ���� ��� ������, � ������ ���� �����.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_03");	//� �� ���� ����������� ���� �� ���� � ������� � ���������� ����� �����. ��� ������� ������ ���� � ����, ����� ������ �����.
			B_LogEntry(Topic_KlosterTeacher,"������ ������� �������� ���� � ������ ���� �����.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_04");	//����� ��� �� ������.
	};
};


instance DIA_Karras_ChasePedro(C_Info)
{
	npc = KDF_503_Karras;
	nr = 31;
	condition = DIA_Karras_ChasePedro_Condition;
	information = DIA_Karras_ChasePedro_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Karras_ChasePedro_Condition()
{
//	if(Npc_IsInState(self,ZS_Talk) && (Kapitel == 3) && (MIS_NovizenChase == LOG_Running))
	if((Kapitel == 3) && (MIS_NovizenChase == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Karras_ChasePedro_Info()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_00");	//����, ���� ������ ������ �������. �� ������ ����� ����� � ������� ���� ������ ���������.
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_01");	//���� ���� �� �������, �� ��� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_02");	//��� �� ������� �����? ����� �� �� ������ ������ ������ ��������� ��������� �����?
		Info_ClearChoices(DIA_Karras_ChasePedro);
		Info_AddChoice(DIA_Karras_ChasePedro,"��� ��������. ���� ������, ����� ������ ����.",DIA_Karras_ChasePedro_Later);
		Info_AddChoice(DIA_Karras_ChasePedro,"��� ��� ����� ������ �� ����.",DIA_Karras_ChasePedro_WontEscape);
	};
};

func void DIA_Karras_ChasePedro_Later()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_Later_15_00");	//��� ��������. ���� ������, ����� ������ ����.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_01");	//�� �� �������������, ��� ��� ������ �������� ��� ���������? ���� ������ - ������� ������.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_02");	//����� �� � ��������� �����������, ��� ���� ������������ ������� � ���� ��������, �� �� ���-�� �������, � �� ������ ������������� ��� ����.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_03");	//��� ����������� �� ���������� �� ������ � ����� ����� ����!
	AI_StopProcessInfos(self);
};

func void DIA_Karras_ChasePedro_WontEscape()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_00");	//��� ��� ����� ������ �� ����.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_01");	//� ����� ������� �� ���, ���� ������ �� �����. ���� �� ��� ������� ���� ��-�� ����, ��� �� ���������� �����, � ����� ���������� � ���, ����� �� �������� ����� ����������.
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_02");	//� � ��� ���� ����� ��������?
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_03");	//� �������� � ������. �� ����� �������� �����������, ����� ����������� ���� ��������� �� ����� ������������.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_04");	//� ������ �� ����� ������� �������. � ��������� ������, �����, ��� ��������� ����� ������� �� ������ ������ �� ������.
	AI_StopProcessInfos(self);
};


instance DIA_Karras_NeedInfo(C_Info)
{
	npc = KDF_503_Karras;
	nr = 31;
	condition = DIA_Karras_NeedInfo_Condition;
	information = DIA_Karras_NeedInfo_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Karras_NeedInfo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Karras_ChasePedro) && (Kapitel == 3) && (hero.guild != GIL_KDF) && (MIS_NovizenChase == LOG_Running) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Karras_NeedInfo_Info()
{
	AI_Output(self,other,"DIA_Karras_NeedInfo_10_00");	//�� ������, ��� ���� ����� ������. ��� ��� ��!
	AI_StopProcessInfos(self);
};


instance DIA_Karras_InnosEyeRetrieved(C_Info)
{
	npc = KDF_503_Karras;
	nr = 1;
	condition = DIA_Karras_InnosEyeRetrieved_Condition;
	information = DIA_Karras_InnosEyeRetrieved_Info;
	permanent = FALSE;
	description = "� ������ ����� ���� ������.";
};


func int DIA_Karras_InnosEyeRetrieved_Condition()
{
//	if((Kapitel == 3) && (MIS_NovizenChase == LOG_SUCCESS))
	if(MIS_NovizenChase == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Karras_InnosEyeRetrieved_Info()
{
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_00");	//� ������ ����� ���� ������.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_01");	//� ��� ���, ��� ���� ������� ������� ���� �� ��� �����.
	if(other.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_Success_10_02");	//������ �� ������ ��������� ��������� ���� �������� � ����������.
		AI_Output(self,other,"DIA_Karras_JOB_10_05");	//����� ����, � ���� ���� ����� ���������� ������, ������� ��� ���� � �������.
		Log_CreateTopic(Topic_KlosterTrader,LOG_NOTE);
		B_LogEntry(Topic_KlosterTrader,"������ ������ �� ��������� ����� ������� ��� ������ � ������������.");
	};
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_02");	//�� ��������� ��� ��� �������� ��� ����. ���� ������������� ����� ����� � ���������� �� � ����� � ����������� ��������������.
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_03");	//� ��� ������������ ��� �� ����� �����.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_04");	//������ �� ����� ��� �����. �������� ��������. ����� ��������. ������ �� ���� �� �����, ���� ����� ��������, � ���� ���.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_05");	//���� ��� �������� � ��������� ���������� �����. �� ����� ��������� � ���� � �� ������� �������.
	B_GivePlayerXP(XP_AmbientKap3);
};


instance DIA_Karras_KAP3_Perm(C_Info)
{
	npc = KDF_503_Karras;
	nr = 5;
	condition = DIA_Karras_KAP3_Perm_Condition;
	information = DIA_Karras_KAP3_Perm_Info;
	permanent = TRUE;
	description = "��� ������������ ���� ������������?";
};


func int DIA_Karras_KAP3_Perm_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Karras_JOB))
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP3_Perm_Info()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_00");	//��� ������������ ���� ������������?
	if((MIS_KarrasResearchDMT == FALSE) && (PyrokarToldKarrasToResearchDMT == TRUE) && (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_01");	//� ���� �������� ���-��� �� ������.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_02");	//� ��� ��� �����?
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_03");	//��� ����� ��������� ������������ �������������. ��, �� ������� ����, ��� ��������� ��� ���������� ��� �������� �������.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_04");	//���� ��������� ��� ������� � ����.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_05");	//���� ��! ����� ������ ���������!
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_06");	//� ������� ���� ���������, �� � ���� ������������ ���������, ����� ������� ����� ��������� �����������.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_07");	//�� �� ��� �� �������� ��� ���-������, ������������� ��, ��� ��������...
		MIS_KarrasResearchDMT = LOG_Running;
		B_LogEntry(TOPIC_DEMENTOREN,"����� ���������� ���� ������������, ������� ����� ���-������, ��� ���� � ������ �������� � �������.");
		Info_ClearChoices(DIA_Karras_KAP3_Perm);
		Info_AddChoice(DIA_Karras_KAP3_Perm,Dialog_Back,DIA_Karras_KAP3_Perm_Back);
		Info_AddChoice(DIA_Karras_KAP3_Perm,"� �������� ���-������ �������.",DIA_Karras_KAP3_Perm_WillSee);
		Info_AddChoice(DIA_Karras_KAP3_Perm,"����� ����� � ����� ��������� ������?",DIA_Karras_KAP3_Perm_Sleeper);
		Info_AddChoice(DIA_Karras_KAP3_Perm,"��� ������ ���� �����?",DIA_Karras_KAP3_Perm_Material);
	}
	else if(MIS_KarrasResearchDMT == LOG_Running)
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_08");	//� ��� ��� ������� ��� �������������� ������ �� ������.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_09");	//��� ������ � ���-������ ������, �, ������� ��, ���������� ���������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_10");	//� ����� ����� �������. ����� �� ��� ������������ ���������� ��������� ��� ��������� - ����������� ������ ����������.
	};
};

func void DIA_Karras_KAP3_Perm_Back()
{
	Info_ClearChoices(DIA_Karras_KAP3_Perm);
};

func void DIA_Karras_KAP3_Perm_Sleeper()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Sleeper_15_00");	//����� ����� � ����� ��������� ������?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01");	//� ������ � ������. ��, ������ �� ��������� � ���� ����������, � ������ �� ���� ������� �� ����.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02");	//� ���� ����� ����� ��������� ������������ ���������� �������, � ����� �� ��� ����� ���� ���������.
};

func void DIA_Karras_KAP3_Perm_Corpse()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Corpse_15_00");	//�� ������, ����� � ������ ���� ����, ��� ��?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_01");	//���! �� � ��� �����?! ���������, �������������� ����������� ������������ �������� � ������ ���������, ������� ������.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_02");	//����� ����������, ���� �� ������� �����-������ ��������, �������� ��� ���� ��������.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_03");	//������� ������������ ����, ��������� � ���, ������ ���� ���������� ���������� ��� ��������.
};

func void DIA_Karras_KAP3_Perm_Material()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Material_15_00");	//��� ������ ���� �����?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Material_10_01");	//������ � ����? ����� �������, ������� ����������� ������ ���� ���������.
	Info_AddChoice(DIA_Karras_KAP3_Perm,"�� ������, ����� � ������ ���� ����, ��� ��?",DIA_Karras_KAP3_Perm_Corpse);
};

func void DIA_Karras_KAP3_Perm_WillSee()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_WillSee_15_00");	//� �������� ���-������ �������.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_WillSee_10_01");	//��� ���� �� ����� ��������. � ���� � ������� ������ �������� ��������������.
	Info_ClearChoices(DIA_Karras_KAP3_Perm);
};


instance DIA_Karras_HaveBook(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_HaveBook_Condition;
	information = DIA_Karras_HaveBook_Info;
	permanent = FALSE;
	description = "� ������ �������� ���������. ����� ����, �� ���-������ ���� �������.";
};


func int DIA_Karras_HaveBook_Condition()
{
	if((MIS_KarrasResearchDMT == LOG_Running) && Npc_HasItems(hero,ITWR_DementorObsessionBook_MIS) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int KarrasGotResearchDMTBook_Day;

func void DIA_Karras_HaveBook_Info()
{
	AI_Output(other,self,"DIA_Karras_HaveBook_15_00");	//� ������ �������� ���������. ����� ����, �� ���-������ ���� �������.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_01");	//������.
	Npc_RemoveInvItems(other,ITWR_DementorObsessionBook_MIS,1);
	AI_PrintScreen("�������� ������",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	AI_Output(self,other,"DIA_Karras_HaveBook_10_02");	//��, ��� ����� �������. � ������ ������� ��� �����.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_03");	//�� � ��� ������ � �����.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_04");	//�� ����� ������, ������ - ��� ������ ����������� ��������� �����, ��������� ��������.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_05");	//��� �������� ����� �������� ������������ � �������� ������������ �������.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_06");	//������ � ���� �� ���� �������, ����� �� �� ���� � �������� ������������� ������������ ��� � ������ ���������� ��������.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_07");	//������ �������. ����� � ����������� ����� ������� ������.
	MIS_KarrasResearchDMT = LOG_SUCCESS;
	B_LogEntry(TOPIC_DEMENTOREN,"������ ���� ������������ �������� ��������� ��� ����������� ����� ������������. � ������ ��������� � ���� �����.");
	KarrasGotResearchDMTBook_Day = Wld_GetDay();
	B_GivePlayerXP(XP_KarrasResearchDMT);
};


instance DIA_Karras_ResearchDMTEnd(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_ResearchDMTEnd_Condition;
	information = DIA_Karras_ResearchDMTEnd_Info;
	permanent = TRUE;
	description = "������� ���-������ ����� �� ������?";
};


func int DIA_Karras_ResearchDMTEnd_Condition()
{
	if((MIS_KarrasResearchDMT == LOG_SUCCESS) && (hero.guild == GIL_KDF) && (SC_KnowsMadPsi == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Karras_ResearchDMTEnd_Info()
{
	AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_00");	//������� ���-������ ����� �� ������?
	if(C_DaysSinceEvent(KarrasGotResearchDMTBook_Day,2))
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_01");	//��. ������ � ����, ��� ��� ��� ��� ������ �������� � ����������������.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_02");	//����������!
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_03");	//�����-�� ��� ���� ������, ��� �� ��� �. ��� ������� ����������� ������, �������� ���� �������� ����� ����� �������� ����������.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_04");	//��� �������� ����� ����������, � ����� ����� ������� ����������, ������������ ����� �� ������������� ����� �������� ���, � �� �������� �� �� ����� �������� �������� ���� ����.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_05");	//������� ��, ��� �� ����� ��� ������ ���, �� ���������� ����������� �����, � ��� ������� �� ���������� ��������� �� �������������� ������.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_06");	//�� ������ ��������� ������������. ������, ��� ������ ���� ��������� �������� ������.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_07");	//������, ���� �� ���� ��������� �����, � �� ����� ����������, ��� �� ����� ����� � ������������.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_08");	//�������. ��� ��� ���� ����� �����������.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_09");	//������? ��� �������, ��� ��� ��������� ������ ��� ������ ��������. ��������, ��� ��� ���� ������, � ����� ��������� ������ �� ���, ��� ��� ���� ������?
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_10");	//� ���� ���� �������. ��� ��� ������ �� �������� �������. � ���� ���� ������.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_11");	//�������, �� ���������, � ��� ������ ����. ���� ���������, ����.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_12");	//��, ������� ��! ��� ���� ��������. ��� �� ������ �� �����.
		CreateInvItems(other,ITWR_DementorObsessionBook_MIS,1);
		AI_PrintScreen("�������� ��������",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		SC_KnowsMadPsi = TRUE;
		B_LogEntry(TOPIC_DEMENTOREN,"������������ ������� ����������� �������. ������, ���� ����� ����� ������� � ��������� �������.");
		B_GivePlayerXP(XP_SC_KnowsMadPsi);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_13");	//� ������� ��� ����. ������ �����.
	};
};


instance DIA_Karras_Prot_BlackEye(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_Prot_BlackEye_Condition;
	information = DIA_Karras_Prot_BlackEye_Info;
	permanent = TRUE;
	description = "���� �� ������ ���������� �� ���������� ���� ������?";
};


func int DIA_Karras_Prot_BlackEye_Condition()
{
	if((hero.guild == GIL_KDF) && (Pyrokar_AskKarrasAboutDMTAmulett == TRUE) && (MIS_Karras_FindBlessedStone == FALSE) && Npc_KnowsInfo(other,DIA_Karras_JOB))
	{
		return TRUE;
	};
};

func void DIA_Karras_Prot_BlackEye_Info()
{
	AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_00");	//���� �� ������ ���������� �� ���������� ���� ������?
	if(SC_KnowsMadPsi == TRUE)
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_01");	//�������. ������, ������������� �� ����� � �������������� �����, ��� �� ������� �������� ��������.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_02");	//� ���������, � ���� �� �������� ����� ������.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_03");	//��������� �� �������, ����������� ����, ������� �� ����� ������.
		AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_04");	//������. � �������� ��������� ����� ������.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_05");	//��, ������ ���. �� ���� �� �����, ����� ��������� �����-������ ������, �� ������� ����?
		B_LogEntry(TOPIC_DEMENTOREN,"������ ����� ���� ��� ��������� ������ �� ���������� ���� ������. ��� ����� ��� ����� ������ �� �������������� �����. ��������� ������ ������� �� ����� ������.");
		MIS_Karras_FindBlessedStone = LOG_Running;
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_06");	//������� �� ����. � ���� ���� ������� ����, ����� ���� ����� �� ���� ������. ����� ��� ��� ��� ��� �������.
	};
};


instance DIA_Karras_KarrasBlessedStone(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_KarrasBlessedStone_Condition;
	information = DIA_Karras_KarrasBlessedStone_Info;
	description = "� ������ ��������� ������ � �������������� �����.";
};


func int DIA_Karras_KarrasBlessedStone_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_HasItems(other,ItMi_KarrasBlessedStone_MIS) && (MIS_Karras_FindBlessedStone == LOG_Running))
	{
		return TRUE;
	};
};


var int KarrasMakesBlessedStone_Day;

func void DIA_Karras_KarrasBlessedStone_Info()
{
	AI_Output(other,self,"DIA_Karras_KarrasBlessedStone_15_00");	//� ������ ��������� ������ � �������������� �����.
	B_GiveInvItems(other,self,ItMi_KarrasBlessedStone_MIS,1);
	Npc_RemoveInvItem(self,ItMi_KarrasBlessedStone_MIS);
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_01");	//��� ������. �������, ��� ������ ��-�������� ����� �� ����� ������?
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_02");	//������. � ������ ��� ���� ������, ���������� �� ������� ������� ������.
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_03");	//��� ��� ������� �������. ��� ���� ����� ����������.
	KarrasMakesBlessedStone_Day = Wld_GetDay();
	MIS_Karras_FindBlessedStone = LOG_SUCCESS;
	B_LogEntry(TOPIC_DEMENTOREN,"������ ���� ��� ������, ������� ����� �������� ���� �� ���������� ���� ������. ��� ������ ������ ��������� ��� �����.");
	B_GivePlayerXP(XP_Karras_FoundBlessedStone);
	AI_StopProcessInfos(self);
};


instance DIA_Karras_ItAm_Prot_BlackEye_MIS(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_ItAm_Prot_BlackEye_MIS_Condition;
	information = DIA_Karras_ItAm_Prot_BlackEye_MIS_Info;
	permanent = TRUE;
	description = "��� ��� ������ ��������� �������, ��� �� ������ ���?";
};


var int DIA_Karras_ItAm_Prot_BlackEye_MIS_NoPerm;

func int DIA_Karras_ItAm_Prot_BlackEye_MIS_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Karras_FindBlessedStone == LOG_SUCCESS) && (DIA_Karras_ItAm_Prot_BlackEye_MIS_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Karras_ItAm_Prot_BlackEye_MIS_Info()
{
	AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_MIS_15_00");	//��� ��� ������ ��������� �������, ��� �� ������ ���?
	if(C_DaysSinceEvent(KarrasMakesBlessedStone_Day,2))
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_MIS_10_01");	//� ��������. ���, �������. �� ��������� ����� �������.
		CreateInvItems(self,ItAm_Prot_BlackEye_MIS,1);
		B_GiveInvItems(self,other,ItAm_Prot_BlackEye_MIS,1);
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_MIS_10_02");	//���� ���, �� ������, � ������ �� ������ �������� ���� � ���� ���������� ��������.
		AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_MIS_15_03");	//�������.
		B_LogEntry(TOPIC_DEMENTOREN,"������ ��� ��� ������, ������� ����� �������� ���� �� ������� ������� ������.");
		DIA_Karras_ItAm_Prot_BlackEye_MIS_NoPerm = TRUE;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_MIS_10_04");	//�����������. � ��� ��� ������� ��� ���.
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_03");	//�� ��� ������ �� ��������.
	};
};

