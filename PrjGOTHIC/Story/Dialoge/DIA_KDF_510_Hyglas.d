
instance DIA_Hyglas_Kap1_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap1_EXIT_Condition;
	information = DIA_Hyglas_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Hyglas_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_Feuer(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_Feuer_Condition;
	information = DIA_Hyglas_Feuer_Info;
	permanent = FALSE;
	description = "��� ���������� ������ ��������� �����.";
};


func int DIA_Hyglas_Feuer_Condition()
{
	if((other.guild == GIL_NOV) && (Knows_Fire_Contest == TRUE) && !Npc_KnowsInfo(other,DIA_Pyrokar_FIRE) && Npc_KnowsInfo(other,DIA_Hyglas_JOB))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Feuer_Info()
{
	AI_Output(other,self,"DIA_Hyglas_Feuer_15_00");	//��� ���������� ������ ��������� �����.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_01");	//��������� ����� - ��� ����� �� ������� ������, �� ����� �� ����������.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_02");	//��, ���� �� ��������, ����� ������. ���� � �� ����� �� ����.
};


instance DIA_Hyglas_Hallo(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_Hallo_Condition;
	information = DIA_Hyglas_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hyglas_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Hallo_Info()
{
	AI_Output(self,other,"DIA_Hyglas_Hallo_14_00");	//� ������ ������, ����� ���� � ��������� ������.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_01");	//����, ������ ������ ��� ���� ���������� ������� ��������� �����.
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_02");	//����� ���� �� � ������. ����� ����, �� ������� ����������� � ���� ��������.
	};
};


instance DIA_Hyglas_JOB(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_JOB_Condition;
	information = DIA_Hyglas_JOB_Info;
	permanent = FALSE;
	description = "��� �� ��������, ������?";
};


func int DIA_Hyglas_JOB_Condition()
{
	return TRUE;
};

func void DIA_Hyglas_JOB_Info()
{
	AI_Output(other,self,"DIA_Hyglas_JOB_15_00");	//��� �� ��������, ������?
	AI_Output(self,other,"DIA_Hyglas_JOB_14_01");	//� �������� ���� �������� ���� - ���� ������.
	AI_Output(self,other,"DIA_Hyglas_JOB_14_02");	//��� ��� ���, � � �� �� �����, ������� ������ - � ������ ����, ���������� ������� ��� ����.
	if(other.guild == GIL_NOV)
	{
		AI_Output(other,self,"DIA_Hyglas_JOB_15_03");	//��� ��� ���������! � �� ��� �� �� ������� � ���� �����?
		AI_Output(self,other,"DIA_Hyglas_JOB_14_04");	//����� ������ �����. � ������ ��� ������, ����� ����, ���� �������, ��� ������������ ���� �����.
		Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher,"������ ������ ����� ��������� ���� � ����� ����. �� ��� ����� � ������ ���� ����� ����.");
	};
	if((other.guild == GIL_KDF) && !Npc_KnowsInfo(other,DIA_Pyrokar_Lernen))
	{
		Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher,"���� ������ ����� ��������� ���� � ����� ����.");
	};
};


instance DIA_Hyglas_CONTEST(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_CONTEST_Condition;
	information = DIA_Hyglas_CONTEST_Info;
	permanent = FALSE;
	description = "� ������ ������ ��������� �����.";
};


func int DIA_Hyglas_CONTEST_Condition()
{
	if((MIS_Rune == LOG_Running) && Npc_KnowsInfo(other,DIA_Hyglas_JOB))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_CONTEST_Info()
{
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_00");	//� ������ ������ ��������� �����. ������ ��� ��� ������� ������� ���� �������� ������.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_01");	//� �� ������, ����� � ������ ���� �����?
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_02");	//� �� ���� ������� ������� ��������� ��� �������.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_03");	//���...
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_04");	//������, � ����� ����. �� ������� �� ������ ����� ��� ����������� �����������.
	B_LogEntry(TOPIC_Rune,"������ ����� ������� ���� ��������� ���� �������� ������, ���� � ������� ��� ��� ����������� �����������.");
};


instance DIA_Hyglas_TALENT_FIREBOLT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 800;
	condition = DIA_Hyglas_TALENT_FIREBOLT_Condition;
	information = DIA_Hyglas_TALENT_FIREBOLT_Info;
	permanent = TRUE;
	description = B_BuildLearnString("���� �������� ������",B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firebolt));
};


func int DIA_Hyglas_TALENT_FIREBOLT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_CONTEST) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE))
	{
		return TRUE;
	};
};

var int Firebolt_Scroll_Once;

func void DIA_Hyglas_TALENT_FIREBOLT_Info()
{
	AI_Output(other,self,"DIA_Hyglas_TALENT_FIREBOLT_15_00");	//����� ���� ��������� ���� �������� ������.
	if(Npc_HasItems(other,ItSc_Firebolt) && Npc_HasItems(other,ItMi_RuneBlank) && Npc_HasItems(other,ItMi_Sulfur))
	{
		if(B_TeachPlayerTalentRunes(self,other,SPL_Firebolt))
		{
			AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_01");	//����� ������� ���� �������� ������, �� ������ ���������� �� ������ ����� ���� � ������ ������.
			AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_02");	//���� ������ �������� ������ ��������� � ��� ����, � �� ������� ����������� ������ ������.
			AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_03");	//����� � ���� ����� ��� �����������, ������� � ������� ����� � ������ ���� ����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_CONTEST_14_04");	//������, � ����� ����. �� ������� �� ������ ����� ��� ����������� �����������.
		if(Firebolt_Scroll_Once == FALSE)
		{
			if(!Npc_HasItems(other,ItSc_Firebolt))
			{
				B_LogEntry(TOPIC_Rune,"���� � ���� ��� ������ �������� ������, ������ �� ������ ������� ���� �������� ����.");
				if(!Npc_IsDead(Gorax))
				{
					CreateInvItem(Gorax,ItSc_Firebolt);
					B_LogEntry(TOPIC_Rune,"��������, � ����� ������ ����� ������ � �������.");
				}
				else
				{
					Wld_InsertItem(ItSc_Firebolt,"FP_ITEM_KLOSTER_01");
					B_LogEntry(TOPIC_Rune,"������, ��� ��� �������� ������ ���� ������ �� ����� ���������.");
				};
				Firebolt_Scroll_Once = TRUE;
			};
		};
		AI_StopProcessInfos(self);
	};
};


instance DIA_Hyglas_FIREBOLT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_FIREBOLT_Condition;
	information = DIA_Hyglas_FIREBOLT_Info;
	permanent = TRUE;
	description = "����� ����������� ����� ��� �������� ���� �������� ������?";
};


func int DIA_Hyglas_FIREBOLT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_CONTEST) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_FIREBOLT_Info()
{
	AI_Output(other,self,"DIA_Hyglas_FIREBOLT_15_00");	//����� ����������� ����� ��� �������� ���� �������� ������?
	DIA_Common_14_GoReadAboutIt();
};


instance DIA_Hyglas_BLANK_RUNE(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_BLANK_RUNE_Condition;
	information = DIA_Hyglas_BLANK_RUNE_Info;
	permanent = FALSE;
	description = "��� � ���� ����� ������ ������?";
};


func int DIA_Hyglas_BLANK_RUNE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_CONTEST) && (MIS_Rune == LOG_Running) && !Npc_HasItems(other,ItMi_RuneBlank) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE))
	{
		if(SC_KnowsBlankRuneForFirebolt == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Hyglas_BLANK_RUNE_Info()
{
	AI_Output(other,self,"DIA_Hyglas_BLANK_RUNE_15_00");	//��� � ���� ����� ������ ������?
	AI_Output(self,other,"DIA_Hyglas_BLANK_RUNE_14_01");	//��������, ���� ���� ���������� ������ ��������� ����� - �� ���. ������ ������ � ��� ���������.
};


instance DIA_Hyglas_GOTRUNE(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_GOTRUNE_Condition;
	information = DIA_Hyglas_GOTRUNE_Info;
	permanent = FALSE;
	description = "� ������ ����.";
};


func int DIA_Hyglas_GOTRUNE_Condition()
{
	if((MIS_Rune == LOG_Running) && Npc_HasItems(other,ItRu_FireBolt) && !Npc_KnowsInfo(other,DIA_Ulthar_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_GOTRUNE_Info()
{
	AI_Output(other,self,"DIA_Hyglas_GOTRUNE_15_00");	//� ������ ����.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_01");	//������, ������. � �����, �� ������ ���� ����. �������, ��� ���� �� ��� �� � ������.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_02");	//������ ��� � ������� � ������ ��� ����� ������ �����.
	B_LogEntry(TOPIC_Rune,"� ������ ���� '�������� ������'.");
};


instance DIA_Hyglas_TEACH(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 15;
	condition = DIA_Hyglas_TEACH_Condition;
	information = DIA_Hyglas_TEACH_Info;
	permanent = TRUE;
	description = "� ���� ������� ����� ����������.";
};


func int DIA_Hyglas_TEACH_Condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Hyglas_JOB))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_TEACH_Info()
{
	var int abletolearn;
	abletolearn = 0;
	DIA_Common_WantToLearnNewRunes();
	Info_ClearChoices(DIA_Hyglas_TEACH);
	Info_AddChoice(DIA_Hyglas_TEACH,Dialog_Back,DIA_Hyglas_TEACH_BACK);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),DIA_Hyglas_TEACH_InstantFireball);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_Firestorm] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_Firestorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firestorm)),DIA_Hyglas_TEACH_Firestorm);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),DIA_Hyglas_TEACH_ChargeFireball);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),DIA_Hyglas_TEACH_Pyrokinesis);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH,B_BuildLearnString(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),DIA_Hyglas_TEACH_Firerain);
		abletolearn += 1;
	};
	if(abletolearn < 1)
	{
		if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0)
		{
			B_Say(self,other,"$NOLEARNNOPOINTS");
			PrintScreen(PRINT_MAGCIRCLES_NEEDFIRST,-1,-1,FONT_ScreenSmall,2);
		}
		else
		{
			B_Say(self,other,"$NOLEARNOVERPERSONALMAX");
		};
		Info_ClearChoices(DIA_Hyglas_TEACH);
	};
};

func void DIA_Hyglas_TEACH_BACK()
{
	Info_ClearChoices(DIA_Hyglas_TEACH);
};

func void DIA_Hyglas_TEACH_InstantFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void DIA_Hyglas_TEACH_ChargeFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void DIA_Hyglas_TEACH_Pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void DIA_Hyglas_TEACH_Firestorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firestorm);
};

func void DIA_Hyglas_TEACH_Firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};

instance DIA_Hyglas_BringBook(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 38;
	condition = DIA_Hyglas_BringBook_Condition;
	information = DIA_Hyglas_BringBook_Info;
	permanent = FALSE;
	description = "���� �����-������ �������?";
};


func int DIA_Hyglas_BringBook_Condition()
{
	if((Kapitel >= 3) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_BringBook_Info()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_00");	//���� �����-������ �������?
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_01");	//���, ��. ��, ��, ��������, ������� ��� ������ � ������ �����.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_02");	//� �������� ��.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_03");	//���! � ������ �������� � ���� ����. � ��������� ������, �� ��������� ����� ������ ���������.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_04");	//���� ���� ����� ������, ��������� ���� ������ ��������� � ������ ����������� � ���������� �����. � �������, �� ������, ��� ��� ��������.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_05");	//���. ��, ���� ���� �������...
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_06");	//��, ������, � �������. ��, � �� ���� ��������� ���� ������ ��� ������, �� ���, �����������, ���������� ������� ��������. � � �� ����� ��������.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_07");	//������� � ����, ����� �� ������ ��� �� ������ �����. ��� ���������� '������������ ���� �����'. ����, ��������, �������� �������� ��, �� � ������, ��� �� ���������� � ����.
	Info_ClearChoices(DIA_Hyglas_BringBook);
	Info_AddChoice(DIA_Hyglas_BringBook,"������� ��� ����� ���.",DIA_Hyglas_BringBook_GetItYourself);
	Info_AddChoice(DIA_Hyglas_BringBook,"� ��� � �� ��� ������?",DIA_Hyglas_BringBook_GetForIt);
	Info_AddChoice(DIA_Hyglas_BringBook,"� �������� ����� ��.",DIA_Hyglas_BringBook_Yes);
};

func void DIA_Hyglas_BringBook_GetItYourself()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetItYourself_15_00");	//������� ��� ����� ���.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_01");	//��� �� ������ �������� �� ���� � ����� ����?! ���� ��������� �����������, �� ������ ��������� �������� �� ���!
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_02");	//�������� � ���� ���� � ������� � ����� ���������.
	MIS_HyglasBringBook = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Hyglas_BringBook);
};

func void DIA_Hyglas_BringBook_GetForIt()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_00");	//� ��� � �� ��� ������?
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_01");	//��� �� ������ � ����?
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_02");	//��, � �� ����� �����, ��� �� ���� ���, ���� � ������� ��� �����.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_03");	//������. � ��� �� ������ ��������? ���� � ���� ���� �����, ����� ��������� ��� ���� ������� � ������, ��� ���� ����������� ������ ���.
};

func void DIA_Hyglas_BringBook_Yes()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_Yes_15_00");	//� �������� ����� ��.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_01");	//������ - ��� ��������� ��� �����, � � ����� �������� ������� ������.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_02");	//�� �� ����� �� ��� ������� ����� �������. ��� ��� �������-��, �����, � ��� ����� ����.
	MIS_HyglasBringBook = LOG_Running;
	Info_ClearChoices(DIA_Hyglas_BringBook);
	Log_CreateTopic(TOPIC_HyglasBringBook,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HyglasBringBook,LOG_Running);
	B_LogEntry(TOPIC_HyglasBringBook,"������ �����, ����� � ������ ��� ����� '������������ ���� �����'. ��� ����� ���� � ������ �� ��������� � ������.");
};


instance DIA_Hyglas_HaveBook(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 38;
	condition = DIA_Hyglas_HaveBook_Condition;
	information = DIA_Hyglas_HaveBook_Info;
	permanent = FALSE;
	description = "� ������ ���� �����.";
};


func int DIA_Hyglas_HaveBook_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_BringBook) && Npc_HasItems(other,ItWr_Astronomy_MIS))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_HaveBook_Info()
{
	AI_Output(other,self,"DIA_Hyglas_HaveBook_15_00");	//� ������ ���� �����.
	if(MIS_HyglasBringBook == LOG_Running)
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_01");	//����� ������, ����� �� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_02");	//�� ��� �� ���������. ����� ������. ��� ��� �� ��� �����?
	};
	B_GiveInvItems(other,self,ItWr_Astronomy_MIS,1);
	AI_Output(self,other,"DIA_Hyglas_HaveBook_14_03");	//������ �� ������ ���������. � � ������ ���������� � �������� �� ���������.
	MIS_HyglasBringBook = LOG_SUCCESS;
	B_GivePlayerXP(XP_HyglasBringBook);
};


instance DIA_Hyglas_Kap4_PERM(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 49;
	condition = DIA_Hyglas_Kap4_PERM_Condition;
	information = DIA_Hyglas_Kap4_PERM_Info;
	permanent = TRUE;
	description = "������ ���� �� �����?";
};


func int DIA_Hyglas_Kap4_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_BringBook))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap4_PERM_Info()
{
	AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_00");	//������ ���� �� �����?
	if(MIS_HyglasBringBook == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_01");	//��, � �� ������ ������, �� ������� ������������ �����, ������, ����� ������ ���������.
		AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_02");	//������ ���� ���������?
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_03");	//��, ������� ����� ������, ������, ����� �����. ����� ������ ��������� ����� ����, ������� ������������� �� � ������� �����, ����� �������� ����� � ���� �������.
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_04");	//������ ����� ������������ ��� �������, ����� ����� � ��� ���, �� �������� �������������.
//		Hyglas_SendsToKarras = TRUE;
	}
	else if(MIS_HyglasBringBook == LOG_Running)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_05");	//���, � ��� ��� ��� ��� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_06");	//� ������� ����, ��� ��� ����� ��������� ���� ������������, �� �� ���, ������� ��, ����������� ������ �������, ���� � ���� �� ����� ����������� ����������.
	};
};

