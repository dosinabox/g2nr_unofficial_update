
var int Daron_Spende;

func void B_DaronSegen(var int gold)
{
	if((gold > 0) || (Daron_Spende >= 1000))
	{
		Daron_Spende += gold;
		if(Daron_Spende < 100)
		{
			if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
			{
				other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
				AI_PrintScreen(PRINT_FullyHealed,-1,-1,FONT_Screen,2);
			};
		}
		else if((Daron_Spende < 250) && (Daron_Bonus1 == FALSE))
		{
			B_RaiseAttributeByPermBonus(other,ATR_MANA_MAX,2);
			other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
			Daron_Bonus1 = TRUE;
		}
		else if((Daron_Spende < 500) && (Daron_Bonus2 == FALSE))
		{
			B_GivePlayerXP(XP_Ambient);
			Daron_Bonus2 = TRUE;
		}
		else if((Daron_Spende >= 750) && (Daron_Spende < 1000) && (Daron_Bonus3 == FALSE))
		{
			B_GivePlayerLP(1);
			Daron_Bonus3 = TRUE;
		}
		else
		{
			B_RaiseAttributeByPermBonus(other,ATR_HITPOINTS_MAX,5);
			other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		};
	};
	if((MIS_Thorben_GetBlessings == LOG_Running) && !C_GotAnyInnosBlessing())
	{
		B_LogEntry(TOPIC_Thorben,"��� ���� ����� ����������� ����.");
	};
	Daron_Blessing = TRUE;
};


instance DIA_Daron_EXIT(C_Info)
{
	npc = KDF_511_Daron;
	nr = 999;
	condition = DIA_Daron_EXIT_Condition;
	information = DIA_Daron_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Daron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Daron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Daron_Hallo(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Daron_Hallo_Condition;
	information = DIA_Daron_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Daron_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Daron_Hallo_Info()
{
	AI_Output(self,other,"DIA_Daron_Hallo_10_00");	//��� � ���� ������� ��� ����? �� ����� ��������� ��������?
	if(hero.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Daron_Hallo_10_01");	//�� ������ ���������� ������ ������� ������, ���, �����, ������ ������������ ������ ��� ������?
	};
};


instance DIA_Daron_Paladine(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Daron_Paladine_Condition;
	information = DIA_Daron_Paladine_Info;
	permanent = FALSE;
	description = "��� ����� ���������� � ����������. �� ������ ������ ��� � ����?";
};


func int DIA_Daron_Paladine_Condition()
{
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Daron_Paladine_Info()
{
	AI_Output(other,self,"DIA_Daron_Paladine_15_00");	//��� ����� ���������� � ����������. �� ������ ������ ��� � ����?
	AI_Output(self,other,"DIA_Daron_Paladine_10_01");	//��, ��� ����� �� ������ ����� ������ � ������� ������� ������. ������ ������� ���� ��������� ������ ��������� � ��������� ������.
	AI_Output(self,other,"DIA_Daron_Paladine_10_02");	//�� �, ������� ��, ���, ����� ����.
	AI_Output(other,self,"DIA_Daron_Paladine_15_03");	//��� � ���� ����� ����� ����?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Daron_Paladine_10_04");	//�� ������ �������� � ��� ����� � �������� ����������. � �� ���������� ���������� �������, ��������, �� ������ ������ � ���� �����.
		AI_Output(self,other,"DIA_Daron_Paladine_10_05");	//������, ���� ���� �����, ����� ������� ������ � ������������� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Paladine_10_05_add");	//���� �����, ����� ������� ������ � ������������� ��������.
	};
};


instance DIA_Daron_AboutSegen(C_Info)
{
	npc = KDF_511_Daron;
	nr = 2;
	condition = DIA_Daron_AboutSegen_Condition;
	information = DIA_Daron_AboutSegen_Info;
	permanent = FALSE;
	description = "� ������, ����� �������� ���� �������������!";
};


func int DIA_Daron_AboutSegen_Condition()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Player_IsApprentice == APP_NONE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_AboutSegen_Info()
{
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_00");	//� ������, ����� �������� ���� �������������!
	if(Daron_Blessing == TRUE)
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_03");	//�� � ��� ��� ���� ��� �������������, ��� ���.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_04");	//������ � �������, ��� ���!
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_01");	//��� ������ - ����� ��, ��������, �������� ������������ ������ ������ ������ ������, ������?
		AI_Output(other,self,"DIA_Daron_AboutSegen_15_02");	//������-�� � ����� �������� ���� �������������, ����� ��������� � ������� � ������ �� �������� � ������ ����� ������...
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_05");	//��, ��� ���! ��� ��������� ������������� ������ � �� ������ ��� ���� ��������� ������������ ����.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_06");	//��� ��� ���� � ��������� � ����� ������ ���������� �� ��������� � ������ ������ ������?
	};
};


instance DIA_Daron_Spenden(C_Info)
{
	npc = KDF_511_Daron;
	nr = 3;
	condition = DIA_Daron_Spenden_Condition;
	information = DIA_Daron_Spenden_Info;
	permanent = FALSE;
	description = "� ����� ������������� ������ ��������� �����������?";
};


func int DIA_Daron_Spenden_Condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Daron_Spenden_Info()
{
	AI_Output(other,self,"DIA_Daron_Spenden_15_00");	//� ����� ������������� ������ ��������� �����������?
	AI_Output(self,other,"DIA_Daron_Spenden_10_01");	//��, ��� ������� �� ����, ��� �� ������������. ����� ���������, ��� � ���� ����.
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_Daron_Spenden_10_02");	//(������� � ������� � ��������) �-�-� ���...
	if(Npc_HasItems(other,ItMi_Gold) < 10)
	{
		AI_Output(self,other,"DIA_Daron_Spenden_10_03");	//��, �� ���� ������, ��? ������ ���� �� ��������, ��� � ���� ����.
		if((MIS_Thorben_GetBlessings == LOG_Running) && !C_GotAnyInnosBlessing())
		{
			B_LogEntry(TOPIC_Thorben,"��� ���� ����� �� ����������� ����. ��� �������, ��� ��������, ��� � ������ ������������ ��� ������� ������. ��� ����� �� �� ����������� ����.");
		};
	}
	else
	{
		if(Npc_HasItems(other,ItMi_Gold) < 50)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_04");	//��, �� �� �����, �� � �� �����. 10 ������� ��� ������ - �� ����� �������� ������.
			B_GiveInvItems(other,self,ItMi_Gold,10);
		}
		else if(Npc_HasItems(other,ItMi_Gold) < 100)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_05");	//� ���� ������ 50 ������� �����. ��������� 25 ����� ������ � ������ ��� �������������.
			B_GiveInvItems(other,self,ItMi_Gold,25);
		}
		else
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_06");	//� ���� ������ ��� ������� ����� - ������� �������: '������, ���� ������'.
			AI_Output(self,other,"DIA_Daron_Spenden_10_07");	//������� ������ ���� ������ ����������.
			B_GiveInvItems(other,self,ItMi_Gold,50);
		};
		AI_Output(self,other,"DIA_Daron_Spenden_10_08");	//������������ ���� �� ����� ������. �� ����� � ���� ��� ���� � ��������������.
		B_DaronSegen(0);
		B_GivePlayerXP(XP_InnosSegen);
	};
};


instance DIA_Daron_Woher(C_Info)
{
	npc = KDF_511_Daron;
	nr = 9;
	condition = DIA_Daron_Woher_Condition;
	information = DIA_Daron_Woher_Info;
	permanent = FALSE;
	description = "������ �� ������?";
};


func int DIA_Daron_Woher_Condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Daron_Woher_Info()
{
	AI_Output(other,self,"DIA_Daron_Woher_15_00");	//������ �� ������?
	AI_Output(self,other,"DIA_Daron_Woher_10_01");	//� ������ �� ��������� �����, ������������ � �����.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Daron_Woher_10_02");	//�� ��������� � ���� ����, ��� ���� ������� � ������� ������� ������� ������ ����������� ������� ������.
	};
};


instance DIA_Daron_Innos(C_Info)
{
	npc = KDF_511_Daron;
	nr = 9;
	condition = DIA_Daron_Innos_Condition;
	information = DIA_Daron_Innos_Info;
	permanent = FALSE;
	description = "�������� ��� �� ������.";
};


func int DIA_Daron_Innos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Woher) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_Innos_Info()
{
	AI_Output(other,self,"DIA_Daron_Innos_15_00");	//�������� ��� �� ������.
	AI_Output(self,other,"DIA_Daron_Innos_10_01");	//�����, ��� ���������� ������� - ��� ���� � �����.
	AI_Output(self,other,"DIA_Daron_Innos_10_02");	//�� ������� ����� � �������� ����������� ����� ���� �� �����. �� ���� �� ����� � ������.
	AI_Output(self,other,"DIA_Daron_Innos_10_03");	//�� ������� � ��������� �� ��� �����. �� ������������ ���������� �������� ��� ���� � ����������� ��� �����.
};


instance DIA_Daron_Kloster(C_Info)
{
	npc = KDF_511_Daron;
	nr = 10;
	condition = DIA_Daron_Kloster_Condition;
	information = DIA_Daron_Kloster_Info;
	permanent = FALSE;
	description = "�������� ��� ��������� � ���������.";
};


func int DIA_Daron_Kloster_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Woher) && (other.guild != GIL_NOV) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_Kloster_Info()
{
	AI_Output(other,self,"DIA_Daron_Kloster_15_00");	//�������� ��� ��������� � ���������.
	AI_Output(self,other,"DIA_Daron_Kloster_10_01");	//�� ������� ����� ��������� ���� ������ �����. �� ���� ����� ���� �� �������������� ������ ������.
	AI_Output(self,other,"DIA_Daron_Kloster_10_02");	//�� ����� ������ ����������� � ��������� ������� � �������� ���.
	AI_Output(self,other,"DIA_Daron_Kloster_10_03");	//��� �� ������ ������������ ����.
};


instance DIA_Daron_Stadt(C_Info)
{
	npc = KDF_511_Daron;
	nr = 99;
	condition = DIA_Daron_Stadt_Condition;
	information = DIA_Daron_Stadt_Info;
	permanent = FALSE;
	description = "� ��� �� ������� � ������?";
};


func int DIA_Daron_Stadt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Woher) || (other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Daron_Stadt_Info()
{
	AI_Output(other,self,"DIA_Daron_Stadt_15_00");	//� ��� �� ������� � ������?
	AI_Output(self,other,"DIA_Daron_Stadt_10_01");	//� ��������� ��������� � ����������� ������� ������ �������� � ����������� �������.
	AI_Output(self,other,"DIA_Daron_Stadt_10_02");	//� ��� ������� ������� ��� ���� ���� ����� ������ � �������� ������.
};


instance DIA_Addon_Daron_GuildHelp(C_Info)
{
	npc = KDF_511_Daron;
	nr = 5;
	condition = DIA_Addon_Daron_GuildHelp_Condition;
	information = DIA_Addon_Daron_GuildHelp_Info;
	description = "� ������, � ��� ������� ������ ���������.";
};


func int DIA_Addon_Daron_GuildHelp_Condition()
{
	if(MIS_Addon_Vatras_Go2Daron == FALSE)
	{
		if(other.guild == GIL_NOV)
		{
			DIA_Addon_Daron_GuildHelp.description = "� ���� ���� �����-������ ������� ��� ����?";
			return TRUE;
		}
		else if(other.guild != GIL_NONE)
		{
			DIA_Addon_Daron_GuildHelp.description = "� ���� ����� ������������ ���...";
			return TRUE;
		};
	}
	else if(MIS_Addon_Vatras_Go2Daron == LOG_Running)
	{
		DIA_Addon_Daron_GuildHelp.description = "� ������, � ��� ������� ������ ���������.";
		return TRUE;
	};
};

func void DIA_Addon_Daron_GuildHelp_Info()
{
	if(MIS_Addon_Vatras_Go2Daron == FALSE)
	{
		if(other.guild == GIL_NOV)
		{
			DIA_Common_AnyMissionForMe();
		}
		else if(other.guild != GIL_NONE)
		{
			DIA_Common_YouLookSoSad();
		};
	}
	else if(MIS_Addon_Vatras_Go2Daron == LOG_Running)
	{
		AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_00");	//� ������, � ��� ������� ������ ���������.
		AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_01");	//�������? �� ���� ���� ������ ��� ���� ������.
		AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_02");	//� ��� ��������?
	};
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_03");	//� ���������� � ��������� ���� ���������� ����������� ���������. �� �� ��� ��� ��� � �� �����.
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_04");	//������� ��� ��������?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_05");	//���. �� � ������� � ����������� ������ � �������. � �������� ��� � ������ ���������.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_06");	//�� ����� � ����������� � ���������, �� ���� ������ ������� � �������� �� � ����.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_07");	//(�������) � �� ���� �� ���� ��� ��������. ����, � ������ ��������, ���� ����.
	MIS_Addon_Vatras_Go2Daron = LOG_SUCCESS;
	Info_ClearChoices(DIA_Addon_Daron_GuildHelp);
	if(Hlp_IsValidNpc(Gobbo_DaronsStatuenKlauer))
	{
		if(Npc_HasItems(Gobbo_DaronsStatuenKlauer,ItMi_LostInnosStatue_Daron))
		{
			Info_AddChoice(DIA_Addon_Daron_GuildHelp,"������, ������ ��� � ��������?",DIA_Addon_Daron_GuildHelp_gobbos);
		};
	};
	Info_AddChoice(DIA_Addon_Daron_GuildHelp,"��� ������ �� ������� ���������?",DIA_Addon_Daron_GuildHelp_wo);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp,"�� �� ������� ������� ���������?",DIA_Addon_Daron_GuildHelp_wiederholen);
};

func void DIA_Addon_Daron_GuildHelp_wiederholen()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_wiederholen_15_00");	//�� �� ������� ������� ���������?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_wiederholen_10_01");	//�������, �������! � ����� �� �����. �� ���, ��������������.
};

func void DIA_Addon_Daron_GuildHelp_gobbos()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_gobbos_15_00");	//������, ������ ��� � ��������?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_gobbos_10_01");	//����� ��� ��������� � ��� � �����, ��� �������� � ����������.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_gobbos_10_02");	//������ � �� �� �����. ��������, ��� ����� � �����-������ ������.
};

func void DIA_Addon_Daron_GuildHelp_wo()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_wo_15_00");	//��� ������ �� ������� ���������?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_wo_10_01");	//�� ���� � ���������, ���������� �� ������� ������.
	Info_AddChoice(DIA_Addon_Daron_GuildHelp,"� ������� ����������. � ����� ���������.",DIA_Addon_Daron_GuildHelp_auftrag);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp,"������� ������? ��� ��� ���������?",DIA_Addon_Daron_GuildHelp_woTaverne);
};

func void DIA_Addon_Daron_GuildHelp_woTaverne()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_woTaverne_15_00");	//������� ������? ��� ��� ���������?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_woTaverne_10_01");	//���� �� ������� �� ������ ����� ��� ������ � ������� ����� �� ������, �� ������� �� �������� �������� ����.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_woTaverne_10_02");	//��� � ���� ������� ������, '������� ������'.
};

func void DIA_Addon_Daron_GuildHelp_auftrag()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_auftrag_15_00");	//� ������� ����������. � ����� ���������.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_auftrag_10_01");	//�� �������� ���� �����, � �� ������� �� ���� �� ����������, �������������� ���� �� �������� ������.
	Info_ClearChoices(DIA_Addon_Daron_GuildHelp);
	MIS_Addon_Daron_GetStatue = LOG_Running;
	if(other.guild == GIL_NONE)
	{
		B_LogEntry(TOPIC_Addon_RangerHelpKDF,TOPIC_Addon_DaronGobbos);
	}
	else
	{
		Log_CreateTopic(TOPIC_Addon_HelpDaron,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HelpDaron,LOG_Running);
		B_LogEntry(TOPIC_Addon_HelpDaron,TOPIC_Addon_DaronGobbos);
	};
};


func void B_DaronGivesReward()
{
	AI_Output(self,other,"DIA_Addon_Daron_ReturnedStatue_10_01");	//��� ���������� �������! �� ������ ���� �����.
	AI_Output(self,other,"DIA_Addon_Daron_ReturnedStatue_10_02");	//����� ��� ��� � ���� ���� �������������.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
	TOPIC_End_RangerHelpKDF = TRUE;
};

instance DIA_Addon_Daron_FoundStatue(C_Info)
{
	npc = KDF_511_Daron;
	nr = 5;
	condition = DIA_Addon_Daron_FoundStatue_Condition;
	information = DIA_Addon_Daron_FoundStatue_Info;
	description = "� ����� ���������.";
};


func int DIA_Addon_Daron_FoundStatue_Condition()
{
	if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron) && (MIS_Addon_Daron_GetStatue == LOG_Running) && (LostInnosStatueInMonastery == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Daron_FoundStatue_Info()
{
	AI_Output(other,self,"DIA_Addon_Daron_FoundStatue_15_00");	//� ����� ���������.
	if(other.guild == GIL_KDF)
	{
		B_GiveInvItems(other,self,ItMi_LostInnosStatue_Daron,1);
		Npc_RemoveInvItem(self,ItMi_LostInnosStatue_Daron);
		B_DaronGivesReward();
		B_GivePlayerXP(XP_Addon_ReturnedLostInnosStatue_Daron + XP_Addon_ReportLostInnosStatue2Daron);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_01");	//����� ������!
		AI_Output(other,self,"DIA_Addon_Daron_FoundStatue_15_02");	//��� �� ������ � ��� ������?
		AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_03");	//�? ������. �� ��� ��� ��� ��������� ��� ���� ���������.
		AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_04");	//�� �������� �� � ���������, �����.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_05");	//�������, ���� �� ��������� ������, ���� �� �� ����������� ��������� ���������� ����� �������� ���������.
			AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_06");	//�� � ������, ��� �� �� ����������. ���� �� ������ ������� ������ ���, �����?
		};
		AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_07");	//������, �����! �� �������� � ����� �����.
	};
};


instance DIA_Addon_Daron_ReturnedStatue(C_Info)
{
	npc = KDF_511_Daron;
	nr = 5;
	condition = DIA_Addon_Daron_ReturnedStatue_Condition;
	information = DIA_Addon_Daron_ReturnedStatue_Info;
	description = "� ����� ���� ��������� � ���������. ������ ���� �������.";
};


func int DIA_Addon_Daron_ReturnedStatue_Condition()
{
	if(LostInnosStatueInMonastery == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Daron_ReturnedStatue_Info()
{
	AI_Output(other,self,"DIA_Addon_Daron_ReturnedStatue_15_00");	//� ����� ���� ��������� � ���������. ������ ���� �������.
	B_DaronGivesReward();
	B_GivePlayerXP(XP_Addon_ReportLostInnosStatue2Daron);
};


instance DIA_Daron_arm(C_Info)
{
	npc = KDF_511_Daron;
	nr = 10;
	condition = DIA_Daron_arm_Condition;
	information = DIA_Daron_arm_Info;
	permanent = FALSE;
	description = "� ��� ��� ������!";
};


func int DIA_Daron_arm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Daron_Stadt) && (Npc_HasItems(other,ItMi_Gold) < 10) && (other.guild == GIL_NONE) && (Daron_Spende == 0))
	{
		return TRUE;
	};
};

func void DIA_Daron_arm_Info()
{
	AI_Output(other,self,"DIA_Daron_arm_15_00");	//� ��� ��� ������!
	AI_Output(self,other,"DIA_Daron_arm_10_01");	//��, �� ������� �� ������. ��� ������������� � ��� ������� �������. ������ ��� ������, �������, ��� ������� ����.
	AI_Output(self,other,"DIA_Daron_arm_10_02");	//�� �� ������ ����� ���� ������, � ����� � ���� �� ����� ���������� � ������. � �� ������� ������������ ��� ������ ������ ������, ����� � ���, ��� ��� �������� ����.
	B_GiveInvItems(self,other,ItMi_Gold,20);
};


var int DIA_Daron_Spende_permanent;

instance DIA_Daron_Spende(C_Info)
{
	npc = KDF_511_Daron;
	nr = 800;
	condition = DIA_Daron_Spende_Condition;
	information = DIA_Daron_Spende_Info;
	permanent = TRUE;
	description = "� ���� ������� �������������...";
};

func int DIA_Daron_Spende_Condition()
{
	if((DIA_Daron_Spende_permanent == FALSE) && Npc_KnowsInfo(other,DIA_Daron_Spenden) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_Spende_Info()
{
	AI_Output(other,self,"DIA_Daron_Spende_15_00");	//� ���� ������� �������������...
	if(Daron_Spende < 1000)
	{
		Info_ClearChoices(DIA_Daron_Spende);
		Info_AddChoice(DIA_Daron_Spende,"� ������ ��� ��������.",DIA_Daron_Spende_BACK);
		Info_AddChoice(DIA_Daron_Spende,"�� � ���� ������������ ������...",DIA_Daron_Spende_NoGold);
		Info_AddChoice(DIA_Daron_Spende,"(50 �������)",DIA_Daron_Spende_50);
		Info_AddChoice(DIA_Daron_Spende,"(100 �������)",DIA_Daron_Spende_100);
		Info_AddChoice(DIA_Daron_Spende,"(200 �������)",DIA_Daron_Spende_200);
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_10_01");	//�� ��� ����������� ��� ����� 1000 ������� �����.
		AI_Output(self,other,"DIA_Daron_Spende_10_02");	//������������� ������ ������ �������� � �����.
		B_DaronSegen(0);
		DIA_Daron_Spende_permanent = TRUE;
	};
};

func void DIA_Daron_Spende_NoGold()
{
	AI_Output(other,self,"DIA_Daron_Spende_BACK_15_00");	//�� � ���� ������������ ������...
	AI_Output(self,other,"DIA_Daron_Spende_BACK_10_01");	//��� �� ����� ��������, ��� ���. �� ������ �������� ������������� �����.
};

func void DIA_Daron_Spende_BACK()
{
	DIA_Common_INeedToThinkAboutIt();
	Info_ClearChoices(DIA_Daron_Spende);
};


func void DIA_Daron_Spende_50()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_00");	//������������ ���� �� ����� ������. �� ����� � ���� ��� ���� � ��������������.
		B_DaronSegen(50);
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_01");	//�� ������ ���������� ��������� ��� ���������, ���� � ���� ������ ������������ ������.
	};
	Info_ClearChoices(DIA_Daron_Spende);
};

func void DIA_Daron_Spende_100()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_00");	//�����, �� ����, ��������� ���� �����������.
		AI_Output(self,other,"DIA_Daron_Spende_100_10_01");	//� ������������ ����� �������� �� ������ �����. �� ����� ���� ���� ����� ��� ��� �����.
		B_DaronSegen(100);
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_02");	//����� ������� - ���� ������ ��������, ������ ���� ����. � ���� �� ������ ������������, ������� ���� ���.
	};
	Info_ClearChoices(DIA_Daron_Spende);
};

func void DIA_Daron_Spende_200()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_00");	//�����, ���������� ����� ��������. �� ����� ���� ���� ����� ��� ��� �����.
		AI_Output(self,other,"DIA_Daron_Spende_200_10_01");	//������ ��� ���� ���� ��������� ������.
		B_DaronSegen(200);
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_02");	//���� �� ������ ������������ ������� ������, ��� � ���� ������ ���� �� ����.
	};
	Info_ClearChoices(DIA_Daron_Spende);
};

