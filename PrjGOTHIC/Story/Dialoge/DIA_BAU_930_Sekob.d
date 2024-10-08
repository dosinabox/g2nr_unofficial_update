
instance DIA_Sekob_EXIT(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 999;
	condition = DIA_Sekob_EXIT_Condition;
	information = DIA_Sekob_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sekob_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sekob_EXIT_Info()
{
	if(Kapitel >= 3)
	{
		self.flags = 0;
	};
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Sekob_HALLO(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 3;
	condition = DIA_Sekob_HALLO_Condition;
	information = DIA_Sekob_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sekob_HALLO_Condition()
{
	if((Kapitel < 3) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_HALLO_Info()
{
	AI_Output(self,other,"DIA_Sekob_HALLO_01_00");	//��� �� ������� �� ���� �����? ����� ������ �������. ����������.
	AI_Output(other,self,"DIA_Sekob_HALLO_15_01");	//������� � ���� ��������� ������ ��� �� ������� �����, ������� ������ �� �����������?
	AI_Output(self,other,"DIA_Sekob_HALLO_01_02");	//� �� ������� �����, �����, ��������, �����-������ � �� ������� �������� ����� ����� ����� ��������������. �� �� ��� ����, ���� ����, ��� ������� ���-������ � ������ �����.
};


instance DIA_Sekob_PermVorMis(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 3;
	condition = DIA_Sekob_PermVorMis_Condition;
	information = DIA_Sekob_PermVorMis_Info;
	permanent = TRUE;
	description = "��������...";
};


func int DIA_Sekob_PermVorMis_Condition()
{
	if((Kapitel < 3) && (MIS_Torlof_HolPachtVonSekob == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_PermVorMis_Info()
{
	AI_Output(other,self,"DIA_Sekob_PermVorMis_15_00");	//��������...
	AI_Output(self,other,"DIA_Sekob_PermVorMis_01_01");	//� ���� ������ ��� ��� ���� ������� ������. �����!
};


instance DIA_Sekob_ZAHLPACHT(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 5;
	condition = DIA_Sekob_ZAHLPACHT_Condition;
	information = DIA_Sekob_ZAHLPACHT_Info;
	permanent = FALSE;
	description = "���� �����, ����� ��, �������, �������� �����.";
};


func int DIA_Sekob_ZAHLPACHT_Condition()
{
	if(MIS_Torlof_HolPachtVonSekob == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Sekob_ZAHLPACHT_Info()
{
	AI_Output(other,self,"DIA_Sekob_ZAHLPACHT_15_00");	//��� ����� ����������� �������� ��������������. �� ����� ����� ���� ���������. ���� �����, ����� ��, �������, �������� �����. �� ������ ��� ������� ��� ��� ��������� ������ �����.
	AI_Output(self,other,"DIA_Sekob_ZAHLPACHT_01_01");	//���? � �� ������ ������� ����� ����? �� �� ��� �� ������ � ���!
	AI_Output(self,other,"DIA_Sekob_ZAHLPACHT_01_02");	//�������� ������, ���� � �� ����� �� ����.
	self.aivar[AIV_DefeatedByPlayer] = FALSE;
};


instance DIA_Sekob_KohleRaus(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 5;
	condition = DIA_Sekob_KohleRaus_Condition;
	information = DIA_Sekob_KohleRaus_Info;
	permanent = TRUE;
	description = "����� ���� ������, ��� � ����� ���� ��������� ����.";
};


func int DIA_Sekob_KohleRaus_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sekob_ZAHLPACHT) && (self.aivar[AIV_DefeatedByPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_KohleRaus_Info()
{
	AI_Output(other,self,"DIA_Sekob_KohleRaus_15_00");	//����� ���� ������, ��� � ����� ���� ��������� ����.
	AI_Output(self,other,"DIA_Sekob_KohleRaus_01_01");	//�� �� �������� �� ����� �� ����� ��������, ����������. ������ �� ��!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Sekob_InformOnar(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 5;
	condition = DIA_Sekob_InformOnar_Condition;
	information = DIA_Sekob_InformOnar_Info;
	permanent = FALSE;
	description = "��� �, ����� ��� �������� �������� �� ���� �����.";
};


func int DIA_Sekob_InformOnar_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sekob_ZAHLPACHT) && (self.aivar[AIV_DefeatedByPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_InformOnar_Info()
{
	AI_Output(other,self,"DIA_Sekob_InformOnar_15_00");	//��� �, ����� ��� �������� �������� �� ���� �����.
	AI_Output(self,other,"DIA_Sekob_InformOnar_01_01");	//���� ��� �� �������! ������ ������� �����, ��� � ���� ������ ���. ��� ��������� ������.
	MIS_Sekob_RedeMitOnar = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Sekob_Defeated(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 5;
	condition = DIA_Sekob_Defeated_Condition;
	information = DIA_Sekob_Defeated_Info;
	permanent = FALSE;
	description = "��� �� ������� ������?!";
};


func int DIA_Sekob_Defeated_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == TRUE) && Npc_KnowsInfo(other,DIA_Sekob_ZAHLPACHT) && (Sekob_Pachtbezahlt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_Defeated_Info()
{
	AI_Output(other,self,"DIA_Sekob_Defeated_15_00");	//��� �� ������� ������?!
	AI_Output(self,other,"DIA_Sekob_Defeated_01_01");	//�� ��� ���� ������, ����������. � ������ ���, ��� �� �������.
	AI_Output(other,self,"DIA_Sekob_Defeated_15_02");	//������� �����.
	AI_Output(self,other,"DIA_Sekob_Defeated_01_03");	//(�����) ��, ��������, �� � ���� ������ ���. � ������� ������, � ��� ����� �� ������.
	AI_Output(self,other,"DIA_Sekob_Defeated_01_04");	//��� ��������� ������ ��������� ����� �� ������. � ���� ��������� �����, �� ��� ������ �����. ��� ����� ����.
	Info_ClearChoices(DIA_Sekob_Defeated);
	Info_AddChoice(DIA_Sekob_Defeated,"������� �����, ��� � ���� ����.",DIA_Sekob_Defeated_hart);
	if(Onar_WegenSekob == FALSE)
	{
		Info_AddChoice(DIA_Sekob_Defeated,"������, � �������� � ������.",DIA_Sekob_Defeated_weich);
	};
};

func void DIA_Sekob_Defeated_weich()
{
	AI_Output(other,self,"DIA_Sekob_Defeated_weich_15_00");	//������, � �������� � ������.
	AI_Output(self,other,"DIA_Sekob_Defeated_weich_01_01");	//�������, ��������. �������� �������!
	MIS_Sekob_RedeMitOnar = LOG_Running;
	AI_StopProcessInfos(self);
};

func void B_Sekob_Kassieren()
{
	AI_Output(self,other,"DIA_Sekob_Kassieren_01_01");	//(��������������) ���, ����������, ���, ������ ������. � ���� �������� ������, ���� �� �������� ���� � �����.
	CreateInvItems(self,ItMi_Gold,60);
	B_GiveInvItems(self,other,ItMi_Gold,60);
	AI_Output(other,self,"DIA_Sekob_Kassieren_15_02");	//��� ������, ��� ���� �� ��� �� � ������.
	AI_Output(self,other,"DIA_Sekob_Kassieren_01_03");	//(� ��������) � �������.
	Sekob_Pachtbezahlt = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Sekob_Defeated_hart()
{
	AI_Output(other,self,"DIA_Sekob_Kassieren_15_00_add");	//������� �����, ��� � ���� ����.
	B_Sekob_Kassieren();
};


instance DIA_Sekob_Again(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 5;
	condition = DIA_Sekob_Again_Condition;
	information = DIA_Sekob_Again_Info;
	permanent = TRUE;
	description = "������ �����...";
};


func int DIA_Sekob_Again_Condition()
{
	if((MIS_Sekob_RedeMitOnar == LOG_Running) && Npc_KnowsInfo(other,DIA_Sekob_Defeated) && (Sekob_Pachtbezahlt == FALSE) && (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Sekob_Again_Info()
{
	AI_Output(other,self,"DIA_Sekob_Again_15_00");	//������ �����...
	AI_Output(self,other,"DIA_Sekob_Again_01_01");	//�� ���������� � ������, ������?
	Info_ClearChoices(DIA_Sekob_Again);
	Info_AddChoice(DIA_Sekob_Again,"� ���������.",DIA_Sekob_Again_Nein);
	if(Onar_WegenSekob == TRUE)
	{
		Info_AddChoice(DIA_Sekob_Again,"� ���������...",DIA_Sekob_Again_verarscht);
	}
	else
	{
		Info_AddChoice(DIA_Sekob_Again,"�������.",DIA_Sekob_Again_Ja);
	};
};

func void DIA_Sekob_Again_Nein()
{
	AI_Output(other,self,"DIA_Sekob_Again_Nein_15_00");	//� ���������.
	DIA_Sekob_Defeated_hart();
};

func void DIA_Sekob_Again_Ja()
{
	AI_Output(other,self,"DIA_Sekob_Again_Ja_15_00");	//�������.
	AI_Output(self,other,"DIA_Sekob_Again_Ja_01_01");	//� ���� ���������.
	AI_StopProcessInfos(self);
};

func void DIA_Sekob_Again_verarscht()
{
	MIS_Sekob_RedeMitOnar = LOG_SUCCESS;
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_00");	//� ���������...
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_01");	//�? ��� �� ������?
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_02");	//������, �� ������ ��� �������� �������� ���� ������.
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_03");	//�� ���? ��� ������ � ������?
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_04");	//�� ������� �������� ����.
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_05");	//� ������ ������ - ������!
	AI_Output(other,self,"DIA_Sekob_Kassieren_15_00");	//������ ����� ����. ����� ��� ����� �� ����������, � ���� ������� ������� �� �����. ������� �����, ��� � ���� ����.
	B_Sekob_Kassieren();
};


instance DIA_Sekob_PERMKAP1(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 6;
	condition = DIA_Sekob_PERMKAP1_Condition;
	information = DIA_Sekob_PERMKAP1_Info;
	permanent = TRUE;
	description = "� ��������� ��� �� ��������� �������, �������?";
};


func int DIA_Sekob_PERMKAP1_Condition()
{
	if((Sekob_Pachtbezahlt == TRUE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Sekob_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Sekob_PERMKAP1_15_00");	//� ��������� ��� �� ��������� �������, �������?
	AI_Output(self,other,"DIA_Sekob_PERMKAP1_01_01");	//(���� ��� ���) ��� � ������, ����� ��������� �����...
	AI_StopProcessInfos(self);
};


instance DIA_Sekob_DMT(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 30;
	condition = DIA_Sekob_DMT_Condition;
	information = DIA_Sekob_DMT_Info;
	description = "���-������ ���������?";
};


func int DIA_Sekob_DMT_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Sekob_DMT_Info()
{
	AI_Output(other,self,"DIA_Sekob_DMT_15_00");	//���-������ ���������?
	AI_Output(self,other,"DIA_Sekob_DMT_01_01");	//�� ������ ������ ���. ��� ��� ������ ���� � ������ �����.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_02");	//��, ����� ������, ���� ������ ���������� � ���������, ������?
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_03");	//� ����, ��� ��, ��������, �� ����������� ��������������������, �� � ������� ����.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_04");	//�� ������ ������ ���, �, ������� ���.
	};
	AI_Output(self,other,"DIA_Sekob_DMT_01_05");	//��� ���� �������, ��� ����-�� ����. �� ������-�� � ���� ����?!
	AI_Output(self,other,"DIA_Sekob_DMT_01_06");	//����������, ������ ���. ������� �� ��������.
	Log_CreateTopic(TOPIC_SekobDMT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SekobDMT,LOG_Running);
	B_LogEntry(TOPIC_SekobDMT,"������ ���� ������� ������ �� ����. ����� �����, ����� � ������ ��.");
};


instance DIA_Sekob_DMTWEG(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 31;
	condition = DIA_Sekob_DMTWEG_Condition;
	information = DIA_Sekob_DMTWEG_Info;
	description = "���� ��� ����. ����� � ������ ����� ������ ���.";
};


func int DIA_Sekob_DMTWEG_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Sekob_DMT))
	{
		if(C_SekobDementorsDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Sekob_DMTWEG_Info()
{
	AI_Output(other,self,"DIA_Sekob_DMTWEG_15_00");	//���� ��� ����. ����� � ������ ����� ������ ���.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
//		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_01");	//� ����, ��� �� ��������� ����� ����������.
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_01_add");	//� ����! �������� �������!
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_02");	//�� ������� ���������. ���� ����� ���������, ��� �� ��� ������� ���� ����� ����.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_03");	//������� ����, � ������� ���. ��� �� � ���� ������� ��� ������ �����������?!
	};
	TOPIC_END_SekobDMT = TRUE;
	B_GivePlayerXP(XP_SekobDMTWEG);
	AI_StopProcessInfos(self);
	if(Kapitel < 5)
	{
		Npc_ExchangeRoutine(self,"START");
	}
	else
	{
		Npc_ExchangeRoutine(self,"OBSESSED");
	};
	if(Rosi_FleeFromSekob_Kap5 == FALSE)
	{
		B_StartOtherRoutine(Rosi,"START");
		B_StartOtherRoutine(Till,"START");
	};
	if(BalthasarMovedToBengar == FALSE)
	{
		B_StartOtherRoutine(Balthasar,"START");
	};
	B_StartOtherRoutine(Rega,"START");
	B_StartOtherRoutine(Babera,"START");
	B_StartOtherRoutine(SekobsBauer1,"START");
	B_StartOtherRoutine(SekobsBauer2,"START");
	if(MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Bronko,"START");
	}
	else
	{
		B_StartOtherRoutine(Bronko,"PRESTART");
	};
};


instance DIA_Sekob_BELOHNUNG(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 32;
	condition = DIA_Sekob_BELOHNUNG_Condition;
	information = DIA_Sekob_BELOHNUNG_Info;
	description = "�� ��� ������, ��� ����.";
};


func int DIA_Sekob_BELOHNUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sekob_DMTWEG) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Sekob_BELOHNUNG_Info()
{
	DIA_Common_NotSoFastMyFriend();
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		if(RosiToldAboutSekob == TRUE)
		{
			AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_01");	//������ ���� �������� �������� ���� ������� ������� � ������ �� ���� �����, ��� � �������...
		};
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_02");	//� �� �������. ��� ��� ���� �����?
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_03");	//�� ���-�� ��� ������ � �������, ��� ��� �����������?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_04");	//���� ���������� ������ ����. ��� ��� ���� � ������ ����� ������ � ����� ����?
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_05");	//� ��� �� �������, �, ������� ���. ��������, ���...
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_06");	//���?
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_07");	//����� �������� ����. ��������� ��� ����� � �������� ������� �� �������� �� ���� � �� ��������� �������� ���� ������.
	};
	AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_08");	//���, ��� � ���� ������� - ��� ���� ���� ������� ������ � ������� ���� �������� ����.
	AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_09");	//����� ����� ��� ����. � ���������.
	AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_10");	//���.
	CreateInvItems(self,ItMi_Gold,250);
	B_GiveInvItems(self,other,ItMi_Gold,250);
	AI_StopProcessInfos(self);
};


instance DIA_Sekob_PERM(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 80;
	condition = DIA_Sekob_PERM_Condition;
	information = DIA_Sekob_PERM_Info;
	permanent = TRUE;
	description = "���-������ ��������� �����������?";
};


func int DIA_Sekob_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sekob_BELOHNUNG) && (Kapitel >= 3) && (NpcObsessedByDMT_Sekob == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_PERM_Info()
{
	AI_Output(other,self,"DIA_Sekob_PERM_15_00");	//���-������ ��������� �����������?
	if((hero.guild == GIL_KDF) && (Kapitel >= 5))
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		if(MIS_BringRosiBackToSekob == LOG_FAILED)
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_01");	//����������.
		}
		else if(MIS_BringRosiBackToSekob == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_02");	//���. ������ ����������.
		}
		else if((Rosi_FleeFromSekob_Kap5 == TRUE) && (MIS_BringRosiBackToSekob != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_03");	//��� ���� �������. ������� � �� ������ ����� ��������, �� ��� ��� � �� ���������.
			AI_Output(self,other,"DIA_Sekob_PERM_01_04");	//� ����������, ��� ��� ������� � ���, �������� �� ������� ��������.
			if(MIS_BringRosiBackToSekob != LOG_Running)
			{
				AI_Output(self,other,"DIA_Sekob_PERM_01_05");	//����� ��� ������: ���� �� ������� ��, ������� �� ����� �����.
				MIS_BringRosiBackToSekob = LOG_Running;
				Log_CreateTopic(TOPIC_BringRosiBackToSekob,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_BringRosiBackToSekob,LOG_Running);
				B_LogEntry(TOPIC_BringRosiBackToSekob,"���� ������ ���� �������. ����� �����, ����� ��� ���������.");
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_06");	//������ � ��� ���, ��� ��� ������� � ������ ��������� ��� ���.
		};
	};
};


instance DIA_Sekob_Heilung(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 55;
	condition = DIA_Sekob_Heilung_Condition;
	information = DIA_Sekob_Heilung_Info;
	permanent = TRUE;
	description = "� ���� ��������.";
};


func int DIA_Sekob_Heilung_Condition()
{
	if((NpcObsessedByDMT_Sekob == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF) && (Kapitel >= 5))
	{
		return TRUE;
	};
};


var int DIA_Sekob_Heilung_oneTime;

func void DIA_Sekob_Heilung_Info()
{
	AI_Output(other,self,"DIA_Sekob_Heilung_15_00");	//� ���� ��������.
	if(DIA_Sekob_Heilung_oneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Sekob_Heilung_01_01");	//��, ��� �����. �� ��� ��������, ������� ���. �������� �����, ���� � �� ������ � ���� ����� ������.
		AI_Output(other,self,"DIA_Sekob_Heilung_15_02");	//(���� ��� ���) ������� ������.
		B_NpcClearObsessionByDMT(self);
		DIA_Sekob_Heilung_oneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sekob_Heilung_01_03");	//�� ���, ���� �� �������?!
		AI_Output(other,self,"DIA_Sekob_Heilung_15_04");	//(���� ��� ���) ����������� ������.
		B_NpcClearObsessionByDMT(self);
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_Sekob_ROSIBACKATSEKOB(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 53;
	condition = DIA_Sekob_ROSIBACKATSEKOB_Condition;
	information = DIA_Sekob_ROSIBACKATSEKOB_Info;
	description = "� ������ ���� ���� �����.";
};


func int DIA_Sekob_ROSIBACKATSEKOB_Condition()
{
	if(!Npc_IsDead(Rosi) && (MIS_BringRosiBackToSekob == LOG_Running))
	{
		if((Npc_GetDistToWP(Rosi,"NW_FARM4_IN_04") < 3000) || (Npc_GetDistToWP(Rosi,"NW_BIGFARM_FARM4_PATH_01") < 3000))
		{
			return TRUE;
		};
	};
};

func void DIA_Sekob_ROSIBACKATSEKOB_Info()
{
	AI_Output(other,self,"DIA_Sekob_ROSIBACKATSEKOB_15_00");	//� ������ ���� ���� �����.
	AI_Output(self,other,"DIA_Sekob_ROSIBACKATSEKOB_01_01");	//�����������. ���, ������ ��� �� ���� �����.
	MIS_BringRosiBackToSekob = LOG_SUCCESS;
	CreateInvItems(self,ItMi_Gold,650);
	B_GiveInvItems(self,other,ItMi_Gold,650);
	B_GivePlayerXP(XP_AmbientKap5);
	B_NpcClearObsessionByDMT(self);
	Rosi.aivar[AIV_PARTYMEMBER] = FALSE;
	B_StartOtherRoutine(Rosi,"START");
	if(!Npc_IsDead(Till))
	{
		Till.aivar[AIV_PARTYMEMBER] = FALSE;
		B_StartOtherRoutine(Till,"START");
	};
};


instance DIA_Sekob_ROSINEVERBACK(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 56;
	condition = DIA_Sekob_ROSINEVERBACK_Condition;
	information = DIA_Sekob_ROSINEVERBACK_Info;
	description = "���� ������� �� �������� � ����.";
};


func int DIA_Sekob_ROSINEVERBACK_Condition()
{
	if((MIS_RosisFlucht == LOG_SUCCESS) && (MIS_BringRosiBackToSekob == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Sekob_ROSINEVERBACK_Info()
{
	AI_Output(other,self,"DIA_Sekob_ROSINEVERBACK_15_00");	//���� ������� �� �������� � ����. � ����� �� � ���������� �����.
	AI_Output(self,other,"DIA_Sekob_ROSINEVERBACK_01_01");	//����������?.. �� ����?
	AI_Output(other,self,"DIA_Sekob_ROSINEVERBACK_15_02");	//�� ����.
	AI_Output(self,other,"DIA_Sekob_ROSINEVERBACK_01_03");	//�� ��������� �� ����, ������� ������.
	self.flags = 0;
	B_NpcClearObsessionByDMT(self);
	B_Attack(self,other,AR_NONE,1);
	MIS_BringRosiBackToSekob = LOG_FAILED;
	B_GivePlayerXP(XP_AmbientKap5);
};

