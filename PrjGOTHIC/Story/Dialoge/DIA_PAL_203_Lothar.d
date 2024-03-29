
var int Lothar_ImOV;

instance DIA_Lothar_EXIT(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 999;
	condition = DIA_Lothar_EXIT_Condition;
	information = DIA_Lothar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lothar_EXIT_Condition()
{
	if(Lothar_ImOV == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lothar_FirstEXIT(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 999;
	condition = DIA_Lothar_FirstEXIT_Condition;
	information = DIA_Lothar_FirstEXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende_v1;
};


func int DIA_Lothar_FirstEXIT_Condition()
{
	if(Lothar_ImOV == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_FirstEXIT_Info()
{
	DIA_Common_IHaveToGo_v1();
	if((Lothar_Regeln == FALSE) && (Mil_305_schonmalreingelassen == FALSE))
	{
		AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_01");	//�������! �� ���� �� ������ ����� ������� ������!
		AI_Output(other,self,"DIA_Lothar_FirstEXIT_15_02");	//�����.
	}
	else
	{
		if(Npc_KnowsInfo(other,DIA_Lothar_Dragons) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
		{
			AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_03");	//���� � ��� ���� ��� ������, ��� �� ������������� ����� � ��������, � ���� ����� ������� ��������, ���� ��� ����?
		}
		else
		{
			AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_04");	//���� �� ���������� � ��������, �� ������ ����������� ���� � ������������.
			if(hero.guild != GIL_PAL)
			{
				AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_05");	//����� ������ �������� �������� ������!
			};
		};
		Lothar_ImOV = TRUE;
		Npc_ExchangeRoutine(self,"START");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Lothar_Hallo(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_Hallo_Condition;
	information = DIA_Lothar_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lothar_Hallo_Condition()
{
	if((self.aivar[AIV_TalkedToPlayer] == FALSE) && (Mil_305_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_Hallo_Info()
{
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lothar_Hallo_01_00");	//����, ���������!
	};
	if((Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_MIL))
	{
		AI_Output(self,other,"DIA_Lothar_Hallo_01_01");	//� �� �����, ����� �� �������� ����� ��� ������.
		AI_Output(other,self,"DIA_Lothar_Hallo_15_02");	//�?
		AI_Output(self,other,"DIA_Lothar_Hallo_01_03");	//� ������ � ������ ����� �������� ������ �� ���������� ����������� ��� � �����.
		AI_Output(other,self,"DIA_Lothar_Hallo_15_04");	//�����...
		AI_Output(self,other,"DIA_Lothar_Hallo_01_05");	//�������� �������� ���������� � ���� ������!
		AI_Output(self,other,"DIA_Lothar_Hallo_01_06");	//������, ��� �������� ���...
	};
	AI_Output(self,other,"DIA_Lothar_Hallo_01_07");	//� �����. ������� ������ � ��������� ����� ������.
	AI_Output(self,other,"DIA_Lothar_Hallo_01_08");	//��� �����������, ���� �����, ������ ��� ������ ��������� ���� ������������� ����� ������, ������� ������ ����������� ��� ������ ����� ������.
	AI_Output(self,other,"DIA_Addon_Lothar_Hallo_01_00");	//������� � ������ ������ ��������� ����, ��� ��� ��������� ����� ���� ����������, ����� �� ��������� ��� ������.
	Player_KnowsLordHagen = TRUE;
	B_PlayerEnteredCity();
};


instance DIA_Lothar_MESSAGE(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_MESSAGE_Condition;
	information = DIA_Lothar_MESSAGE_Info;
	permanent = FALSE;
	description = "� ���� ������ ��������� ��� ������������ ���������!";
};


func int DIA_Lothar_MESSAGE_Condition()
{
	if(PAL_205_schonmalreingelassen == FALSE)
	{
		if((hero.guild == GIL_NONE) || (hero.guild == GIL_NOV))
		{
			return TRUE;
		};
	};
};

func void DIA_Lothar_MESSAGE_Info()
{
	AI_Output(other,self,"DIA_Lothar_MESSAGE_15_00");	//� ���� ������ ��������� ��� ������������ ���������!
	AI_Output(self,other,"DIA_Lothar_MESSAGE_01_01");	//�������������� ���� ����� ������ �� ���������.
	AI_Output(self,other,"DIA_Lothar_MESSAGE_01_02");	//�� ��� �������, ���������� �������� ������, �������� ���� �����, �������� ��������� ������.
	AI_Output(other,self,"DIA_Lothar_Add_15_00");	//�� � ������ ��������� � ������ �������!
	AI_Output(self,other,"DIA_Lothar_Add_01_01");	//�� ������ ������������ �������, ��� � ��� ���������!
	AI_Output(self,other,"DIA_Lothar_Add_01_02");	//���� ����� �� ���������.
	AI_Output(self,other,"DIA_Lothar_Add_01_03");	//���� � ���� ������������� ���� ���-�� ������, ��� � ����� �����. �� ������� ����!
	Player_KnowsLordHagen = TRUE;
	if(!Npc_KnowsInfo(other,DIA_Lothar_Hagen))
	{
		Lothar_Day = B_GetDayPlus();
	};
};


instance DIA_Lothar_EyeInnos(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Lothar_EyeInnos_Condition;
	information = DIA_Lothar_EyeInnos_Info;
	permanent = FALSE;
	description = "� ������, ����� �������� ���� ������!";
};


func int DIA_Lothar_EyeInnos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_MESSAGE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_EyeInnos_Info()
{
	AI_Output(other,self,"DIA_Lothar_EyeInnos_15_00");	//� ������, ����� �������� ���� ������!
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_01");	//������ � ����� ������ ������ ���� �����. �������� � ��� �� ����.
		Player_KnowsLordHagen = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_02");	//��������� ���� ������! ������ �� ������ � ���?! �� �� ������������ � ������ ������!
		AI_Output(other,self,"DIA_Lothar_EyeInnos_15_03");	//��� ������ � ��� ���.
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_04");	//� �� ����, ������ �������� �� ����������������, ����� ������� ���� �� �������� ������ ������ ����...
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_05");	//�� ��, ���������, �� ���� � ����, ��� �� ������ ��������� ��� ������ ������.
		AI_Output(other,self,"DIA_Lothar_EyeInnos_15_06");	//��...
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_07");	//� ������ �� ���� ���� ������� �� ����!
		if(Npc_KnowsInfo(other,DIA_Lothar_Dragons))
		{
			AI_Output(self,other,"DIA_Lothar_EyeInnos_01_08");	//������� �� ��� ������ ���� � ��������, � ������ - ��� ���. ����������!
		};
	};
};


instance DIA_Lothar_Dragons(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_Dragons_Condition;
	information = DIA_Lothar_Dragons_Info;
	permanent = FALSE;
	description = "�������� - ����� ������ �������� �������!";
};


func int DIA_Lothar_Dragons_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_MESSAGE) || (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Lothar_Dragons_Info()
{
	AI_Output(other,self,"DIA_Lothar_Dragons_15_00");	//�������� - ����� ������ �������� �������!
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lothar_Dragons_01_01");	//��� �� ����� ���� �������!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_02");	//��� ���� �����������!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_03");	//� ������ � ��� ����� ����� �������. �� ������� ������ ��� ������, ��������� ����� ������� � ��������!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_04");	//� ������� ������� � ������ ����������, ��� ����������� ����� ������ � ��������, � �������� ��� �������� ����������� � ������ ��������. ��� ��� ���������� ���� ����!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_05");	//�� �� ����� ���������, ����� ���-���� ����� ���� ������ ����� �����!
		if(Npc_KnowsInfo(other,DIA_DiegoOw_Hallo))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_was_Diego_15_00");	//�� �������� � �����?
			AI_Output(self,other,"DIA_Lothar_WhoDragons_01_01");	//��. ������ �� ����� �����. ���� � �� ��������.
			AI_Output(self,other,"DIA_Lothar_WhoDragons_01_02");	//(���������) � ������������ ��� - ��� � ����! �� ���� ������� �� ���������� ����������� ��� �� �����!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_Dragons_01_06");	//� ����� ����� �� ����. �� � ��� ������ ��������.
		AI_Output(self,other,"DIA_Lothar_Dragons_01_07");	//����� �����, ���� �� �������� ��� ����� ��� ����. �� ������ ����� ������ �������� ������ ����� �����.
	};
};


instance DIA_Addon_Lothar_Ornament(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 5;
	condition = DIA_Addon_Lothar_Ornament_Condition;
	information = DIA_Addon_Lothar_Ornament_Info;
	description = "�� ������ ���-������ � �������� �������� �� ����� ������ � ����� �������?";
};


func int DIA_Addon_Lothar_Ornament_Condition()
{
	if(MIS_Addon_Cavalorn_GetOrnamentFromPAL == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lothar_Ornament_Info()
{
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_15_00");	//�� ������ ���-������ � �������� �������� �� ����� ������ � ����� �������?
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_01_01");	//�������. �� ���������� ���. ��� �������� ����������� ������.
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_01_02");	//� ������ ���� ��� ����������?
	Info_ClearChoices(DIA_Addon_Lothar_Ornament);
	if(Lord_Hagen_GotOrnament == FALSE)
	{
		Info_AddChoice(DIA_Addon_Lothar_Ornament,"� ��� ����� �������������� ���������.",DIA_Addon_Lothar_Ornament_suche);
	};
	Info_AddChoice(DIA_Addon_Lothar_Ornament,"�� �������, ��� ���������?",DIA_Addon_Lothar_Ornament_normal);
};

func void DIA_Addon_Lothar_Ornament_normal()
{
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_normal_15_00");	//�� �������, ��� ���������?
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_normal_01_01");	//���, ��������� ��������� �������?
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_normal_01_02");	//��������� � ����, ���� �������� ���������� ���� ����.
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_normal_01_03");	//��� �� ���������� �� �� �����. � ��� ������� ��� � ������ � ������ ��������.
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_normal_15_04");	//�������.
};

func void DIA_Addon_Lothar_Ornament_suche()
{
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_suche_15_00");	//� ��� ����� �������������� ���������.
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_suche_15_01");	//��� ������ ���� ���� ���������� �� ����� �������, � ����� ������.
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_suche_01_02");	//��, � ����� ���� �������. �� ����� ��� � ��������� �������. � �������, ��� ��� ���������� ����.
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_suche_01_03");	//���������� � �����, � ����� �� ����� ������. ��������, ��� �� ��� ��� � ����.
	Player_KnowsLordHagen = TRUE;
};


instance DIA_Lothar_WhoDragons(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_WhoDragons_Condition;
	information = DIA_Lothar_WhoDragons_Info;
	permanent = FALSE;
	description = "���-�� ��� ���������� � ��������?";
};


func int DIA_Lothar_WhoDragons_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_Dragons) && !Npc_KnowsInfo(other,DIA_DiegoOw_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Lothar_WhoDragons_Info()
{
	AI_Output(other,self,"DIA_Lothar_WhoDragons_15_00");	//���-�� ��� ���������� � ��������?
	AI_Output(self,other,"DIA_Lothar_WhoDragons_01_01");	//��. ������ �� ����� �����. ���� � �� ��������.
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lothar_WhoDragons_01_02");	//(���������) � ������������ ��� - ��� � ����! �� ���� ������� �� ���������� ����������� ��� �� �����!
	};
};


instance DIA_Lothar_Regeln(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 3;
	condition = DIA_Lothar_Regeln_Condition;
	information = DIA_Lothar_Regeln_Info;
	permanent = FALSE;
	description = "������ - ������� ��� ������ ����� ������!";
};


func int DIA_Lothar_Regeln_Condition()
{
	if(Mil_305_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_Regeln_Info()
{
	AI_Output(other,self,"DIA_Lothar_Regeln_15_00");	//(������ �����) ������ - ������� ��� ������ ����� ������!
	AI_Output(self,other,"DIA_Lothar_Regeln_01_01");	//��-������, �������������� ������� ���� ����� �������������� � ������� ��������, ������ �� ������ ��������.
	AI_Output(self,other,"DIA_Lothar_Regeln_01_02");	//��� ������ ������ � ������� ����� ������ �������� ������ ��������� ���������.
	AI_Output(self,other,"DIA_Lothar_Add_01_04");	//��-������, ��������� ������, ����������� � ������� ��������, � ��������� ����� �������� ��������� ������� ���������. ������ ���� ����� ������ ���� �������� � ����� ���������.
	AI_Output(self,other,"DIA_Lothar_Add_01_05");	//� �-�������, ���, ��� ���������� � ������������, ������ ��������� ����� ���������� ���������.
	AI_Output(self,other,"DIA_Lothar_Regeln_01_05");	//���� �������?
	Player_KnowsLordHagen = TRUE;
	Lothar_Regeln = TRUE;
};


instance DIA_Addon_Lothar_MissingPeople(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Addon_Lothar_MissingPeople_Condition;
	information = DIA_Addon_Lothar_MissingPeople_Info;
	description = "� ������ ��������� ������?";
};


func int DIA_Addon_Lothar_MissingPeople_Condition()
{
	if(SC_HearedAboutMissingPeople == TRUE)
	{
		return TRUE;
	};
	if(Npc_KnowsInfo(other,DIA_Lothar_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lothar_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Lothar_MissingPeople_15_00");	//� ������ ��������� ������?
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_01");	//��, � � ������ ���� ��� ������.
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_02");	//���� ����� ��, ��� ��������� �� ��� ��� �� ��������, ��� ����� �� ����� ���������.
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_03");	//�������������, ��� �������� ������ � ���������� ���������� � �����������.
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_04");	//��� ��� �� ����� �� �������������. ���� �������?
	if(SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
		SC_HearedAboutMissingPeople = TRUE;
	};
};


instance DIA_Lothar_HowCitizen(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 4;
	condition = DIA_Lothar_HowCitizen_Condition;
	information = DIA_Lothar_HowCitizen_Info;
	permanent = FALSE;
	description = "��� � ���� ����� ����������� ����� ������?";
};


func int DIA_Lothar_HowCitizen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_Regeln) && (Player_IsApprentice == APP_NONE))
	{
		if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			return TRUE;
		};
	};
};

func void DIA_Lothar_HowCitizen_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_06");	//��� � ���� ����� ����������� ����� ������?
	AI_Output(self,other,"DIA_Lothar_Add_01_07");	//����������� ������ ����� ��������� ������ ���, ��� ����� ���������� ������!
	AI_Output(self,other,"DIA_Lothar_Add_01_09");	//�� �� �����, ��� �� ������� ��������� ����� ������ ������� ������ ������, ��� �� ��������� �����������!
	AI_Output(self,other,"DIA_Lothar_Add_01_10");	//��� ���������, �� �������� ������ � ������� ����� ������ - � �� ����� ����!
	AI_Output(self,other,"DIA_Lothar_Add_01_11");	//������ ������ ������ ���������, �� ������� �������� ������ � ������!
	Player_KnowsLordHagen = TRUE;
};


instance DIA_Lothar_WoArbeit(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 5;
	condition = DIA_Lothar_WoArbeit_Condition;
	information = DIA_Lothar_WoArbeit_Info;
	permanent = FALSE;
	description = "��� � ���� ����� ������?";
};


func int DIA_Lothar_WoArbeit_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_HowCitizen) && (Player_IsApprentice == APP_NONE))
	{
		if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			return TRUE;
		};
	};
};

func void DIA_Lothar_WoArbeit_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_14");	//��� � ���� ����� ������?
	AI_Output(self,other,"DIA_Lothar_Add_01_15");	//���� �������� ����� �������� ������ �� �������� � ������ ����� ������.
	AI_Output(self,other,"DIA_Lothar_Add_01_16");	//��� ������ ������ ������ ���� �� ������, �� ������� ����������� ����� ������.
	AI_Output(self,other,"DIA_Lothar_Add_01_17");	//������ ������ ������� ������ ����������� � ����, ������ ������ ��������.
	AI_Output(self,other,"DIA_Lothar_Add_01_18");	//���� �� ����� ����� ������ � �������� ��������, ������ �� ����!
	AI_Output(self,other,"DIA_Lothar_Add_01_19");	//��� ����� ������� ��������. ���� �� ��� ���� ���� ���, �� ��������� �� ����!
	AI_Output(other,self,"DIA_Lothar_Add_15_20");	//������� �������� �������� � ������?
	AI_Output(self,other,"DIA_Lothar_Add_01_21");	//��������� � ����, ����� �� ����.
};


instance DIA_Lothar_ToOV(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 6;
	condition = DIA_Lothar_ToOV_Condition;
	information = DIA_Lothar_ToOV_Info;
	permanent = FALSE;
	description = "��� ��� ������� � ������� �������?";
};


func int DIA_Lothar_ToOV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_Regeln) && (Mil_305_schonmalreingelassen == FALSE) && (Player_IsApprentice == APP_NONE) && !Npc_KnowsInfo(other,DIA_Lothar_HelloAgain))
	{
		if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			return TRUE;
		};
	};
};

func void DIA_Lothar_ToOV_Info()
{
	AI_Output(other,self,"DIA_Lothar_ToOV_15_00");	//��� ��� ������� � ������� �������?
	AI_Output(self,other,"DIA_Lothar_ToOV_01_01");	//�����, �� ���� ������ ��������?!
	AI_Output(self,other,"DIA_Lothar_ToOV_01_02");	//�� �� ��������� ����������� ����� ������. �� ������ ���� �� �������� - ������ ��� ����� ���� �� ������.
	AI_Output(self,other,"DIA_Lothar_ToOV_01_03");	//���, ��� ��������� �� ����������� �������, ��� ���� �������� ��������� �����!
};


instance DIA_Lothar_ToMiliz(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 7;
	condition = DIA_Lothar_ToMiliz_Condition;
	information = DIA_Lothar_ToMiliz_Info;
	permanent = FALSE;
	description = "� ��� � ���� ��������� �� ������ � ���������?";
};


func int DIA_Lothar_ToMiliz_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_Regeln) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_ToMiliz_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_26");	//� ��� � ���� ��������� �� ������ � ���������?
	if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_27");	//�� ������� �������� ����� ������, �� ������ � ��������� ����������� ������ �������� ������.
		AI_Output(other,self,"DIA_Lothar_Add_15_28");	//�������.
		Player_KnowsLordHagen = TRUE;
	};
	if((MIS_Harad_Orc == LOG_SUCCESS) || (MIS_HakonBandits == LOG_SUCCESS) || (MIS_Thorben_GetBlessings == LOG_SUCCESS) || (MIS_Matteo_Gold == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS) || (MIS_Bosper_Bogen == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_12");	//� ������, �� ��� ������� ��������� ��������� ��������.
	};
	AI_Output(self,other,"DIA_Lothar_Add_01_29");	//���� �� ������ ������ ������, �������� � ������ ����� � ��������.
};


instance DIA_Lothar_ToPaladins(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 7;
	condition = DIA_Lothar_ToPaladins_Condition;
	information = DIA_Lothar_ToPaladins_Info;
	permanent = FALSE;
	description = "��� ��� ����� �������, ����� �������� ������� ��� � ����?";
};


func int DIA_Lothar_ToPaladins_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_ToMiliz) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Lothar_ToPaladins_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_30");	//��� ��� ����� �������, ����� �������� ������� ��� � ����?
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_31");	//(���������) ���? �� ���� �� ��������� ������ ���������!
	};
	if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_32");	//�� ���� �� ���������!
	};
	AI_Output(self,other,"DIA_Lothar_Add_01_33");	//��� �� ���� ������ ������ � ���, ����� ������ ������� ��������?
	AI_Output(self,other,"DIA_Lothar_Add_01_34");	//������ �������� �� ������ ���������, ������� ����������� ���������� ������ �������, ���� �������� ����� �����.
	AI_Output(self,other,"DIA_Lothar_Add_01_35");	//(������) ���� �� ������ ����� ���������, ������� ���� ���� ����� ������ � ��������� ����, ��� �������!
};


instance DIA_Lothar_WoAndre(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 8;
	condition = DIA_Lothar_WoAndre_Condition;
	information = DIA_Lothar_WoAndre_Info;
	permanent = FALSE;
	description = "��� ��� ����� ��������� ��������� ������?";
};


func int DIA_Lothar_WoAndre_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Lothar_Regeln) || Npc_KnowsInfo(other,DIA_Lothar_MESSAGE)) && (Andre.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_WoAndre_Info()
{
	AI_Output(other,self,"DIA_Lothar_WoAndre_15_00");	//��� ��� ����� ��������� ��������� ������?
	AI_Output(self,other,"DIA_Lothar_WoAndre_01_01");	//����� ����� ����� ����� � �������� � ��������������� ����� ������.
};


instance DIA_Lothar_Schlafen(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 9;
	condition = DIA_Lothar_Schlafen_Condition;
	information = DIA_Lothar_Schlafen_Info;
	permanent = FALSE;
	description = "��� � ���� �������� ����?";
};


func int DIA_Lothar_Schlafen_Condition()
{
	if(other.guild != GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Lothar_Schlafen_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_22");	//��� � ���� �������� ����?
	AI_Output(self,other,"DIA_Lothar_Add_01_23");	//���� �� ����� ����� ��� �������, ��� � �����, ����������� ����� ���������.
	AI_Output(self,other,"DIA_Lothar_Add_01_24");	//�������� ������ �� ������ ���� ��������, ������� ������� � ���� �����.
	AI_Output(self,other,"DIA_Lothar_Add_01_25");	//������������� �������� � �������� ������� ���� ������ ���.
};


instance DIA_Lothar_PermB4OV(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 3;
	condition = DIA_Lothar_PermB4OV_Condition;
	information = DIA_Lothar_PermB4OV_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lothar_PermB4OV_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Mil_305_schonmalreingelassen == FALSE) && (Lothar_Regeln == TRUE) && !Npc_KnowsInfo(other,DIA_Lothar_HelloAgain))
	{
		if(Npc_KnowsInfo(other,DIA_Lothar_MESSAGE) || Npc_KnowsInfo(other,DIA_Lothar_Hagen))
		{
			if((Lothar_Reported == TRUE) || (Lothar_Day >= Wld_GetDay()))
			{
				return TRUE;
			};
		}
		else
		{
			return TRUE;
		};
	};
};

func void DIA_Lothar_PermB4OV_Info()
{
	AI_Output(self,other,"DIA_Lothar_PermB4OV_01_00");	//��� ���� ��������� �� ������ ���������� � ������ �����!
	AI_StopProcessInfos(self);
};


var int Lothar_Reported;

func int C_Lothar_Reported()
{
	if((Npc_KnowsInfo(other,DIA_Lothar_MESSAGE) || Npc_KnowsInfo(other,DIA_Lothar_Hagen)) && (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE) && (Lothar_Day < Wld_GetDay()) && (Lothar_Reported == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void B_Lothar_Reported()
{
	AI_Output(self,other,"DIA_Lothar_Add_01_48");	//� ������� ����� ������, ��� �� ������� ���������� � ���...
	AI_Output(other,self,"DIA_Lothar_Add_15_49");	//�? ��� �� ������?
	AI_Output(self,other,"DIA_Lothar_Add_01_50");	//�� ������� �� ������ � ����.
	if(Npc_KnowsInfo(other,DIA_Lothar_Dragons))
	{
		AI_Output(other,self,"DIA_Lothar_Add_15_51");	//������� ���. �� ������ ��� � ��������?
		AI_Output(self,other,"DIA_Lothar_Add_01_52");	//����� � �� ������� ����, ����� �� ��������� ����� ���� �����?!
	};
	Lothar_Reported = TRUE;
};

instance DIA_Lothar_HelloAgain(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_HelloAgain_Condition;
	information = DIA_Lothar_HelloAgain_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lothar_HelloAgain_Condition()
{
	if(Mil_305_schonmalreingelassen == TRUE)
	{
		return TRUE;
	};
	if(Lothar_ImOV == TRUE)
	{
		if(Npc_GetDistToWP(self,"NW_CITY_LOTHAR") < 1000)
		{
			return TRUE;
		};
	};
};

func void DIA_Lothar_HelloAgain_Info()
{
	if(self.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_00");	//��! ����� ��!
		if((Player_IsApprentice > APP_NONE) && ((other.guild == GIL_NONE) || (other.guild == GIL_NOV)))
		{
			AI_Output(other,self,"DIA_Lothar_Add_15_08");	//������ � ������ ������ �� ��������!
		};
	};
	if(Player_TalkedAboutDragonsToSomeone == TRUE)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_62");	//����� ���, ����� � ������� ������������ ������? ������ ���������� � ��������!
		AI_Output(other,self,"DIA_Lothar_Add_15_63");	//������ ���� �����?..
		AI_Output(self,other,"DIA_Lothar_Add_01_64");	//��� �� ���� ����!
		AI_Output(self,other,"DIA_Lothar_Add_01_65");	//��� ���� ��������� ���, �������?!
	};
	if(Npc_KnowsInfo(other,DIA_Lothar_ToOV))
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_01");	//��� ���� ��� �� ������� �������� ������ � ������� �������!
		AI_Output(self,other,"DIA_Lothar_Add_01_13");	//������, �� ����� ��������� �������� ������, ��?
	};
	if((VisibleGuild(other) == GIL_KDF) || (VisibleGuild(other) == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_36");	//��� �� ���� ��� ������?
		if(other.guild != GIL_KDF)
		{
			DIA_Common_Well();
		};
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Lothar_Add_15_37");	//� ������ ��������� �����.
		AI_Output(self,other,"DIA_Lothar_Add_01_38");	//����������. ����� ��, ��� ���������� �����, ����� ���� ����� ������...
	}
	else if(other.guild == GIL_SLD)
	{
		if(self.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Lothar_Add_01_39");	//�� ���� �� ������������� � ��������� �����, ���?
		};
		AI_Output(self,other,"DIA_Lothar_Add_01_40");	//��� �� ����� ����?
		if((Hagen_FriedenAbgelehnt == TRUE) || Npc_HasItems(other,ItWr_Passage_MIS))
		{
			AI_Output(other,self,"DIA_Lothar_Add_15_41");	//� ������ ����������� ���� �� ��...
			AI_Output(self,other,"DIA_Lothar_Add_01_42");	//��! ���� ����� ������� �� ���������� �� ���.
			Player_KnowsLordHagen = TRUE;
		}
		else
		{
			if(Player_IsApprentice > APP_NONE)
			{
				AI_Output(other,self,"DIA_Lothar_Add_15_08");	//������ � ������ ������ �� ��������!
			}
			else
			{
				DIA_Common_Well();
			};
		};
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_43");	//��� � ������, �� ������������ � ������ �����?
		if(Npc_KnowsInfo(other,DIA_Lothar_ToMiliz))
		{
			AI_Output(self,other,"DIA_Lothar_Add_01_44");	//� ������� ����, ��� �� ������ �������������� � ���������, ������ ���� ������� ����������� ������.
			if(Player_IsApprentice > APP_NONE)
			{
				AI_Output(other,self,"DIA_Lothar_Add_15_08");	//������ � ������ ������ �� ��������!
			};
		};
		AI_Output(self,other,"DIA_Lothar_Add_01_45");	//��� � �������, �� ������ ���� � ���� ���������.
		AI_Output(self,other,"DIA_Lothar_Add_01_46");	//���... �������, �� �����, ��� ������.
	};
	if(!Npc_KnowsInfo(other,DIA_Lothar_Hallo))
	{
		AI_Output(self,other,"DIA_Lothar_Hallo_01_07");	//� �����. ������� ������ � ��������� ����� ������.
	};
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_02");	//���� ����, � ������� �� ������ ������ �������. � ��������� ������ �� ������ ��������� ������ ��� �� ������, ��� ����� ����.
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_03");	//���� ����� ������� ������ � ���� ���������. �� ������� �� �� �������� ��� ������� - ��� ������ ���������.
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV) || (other.guild == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_04");	//������ ������ ����� ����������� ������� ��������� - ��� ���� ���������� ������ ������!
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_08");	//� ���� �������� ����� ������� ��������. ��� ��� �������� � ��� � ���������.
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_05");	//���� �������� �� ��, ��� �� ������ ���� ������ ������.
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_06");	//������ ������ ���������, �� ����� ��������� ������ � ����� ���������.
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_07");	//�� ���� ����� ��-�������� � ��������.
	};
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_09");	//�� ������ ���� �����?
	AI_Output(other,self,"DIA_Lothar_HelloAgain_15_10");	//�������.
	if(C_Lothar_Reported())
	{
		B_Lothar_Reported();
	};
};


instance DIA_Lothar_Hagen(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Lothar_Hagen_Condition;
	information = DIA_Lothar_Hagen_Info;
	permanent = FALSE;
	description = "��� � ���� ����� ����� ������?";
};


func int DIA_Lothar_Hagen_Condition()
{
	if((Player_KnowsLordHagen == TRUE) && (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_Hagen_Info()
{
	AI_Output(other,self,"DIA_Lothar_Hagen_15_00");	//��� � ���� ����� ����� ������?
	AI_Output(self,other,"DIA_Lothar_Hagen_01_01");	//�� � ������, � ����� �������� ��������.
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lothar_Hagen_01_02");	//�� ���� �� ������ ��� ��� ������ �� �� �������.
	};
	if(!Npc_KnowsInfo(other,DIA_Lothar_MESSAGE))
	{
		Lothar_Day = B_GetDayPlus();
	};
};


instance DIA_Lothar_Reported(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_Reported_Condition;
	information = DIA_Lothar_Reported_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lothar_Reported_Condition()
{
	if(C_Lothar_Reported())
	{
		return TRUE;
	};
};

func void DIA_Lothar_Reported_Info()
{
	B_Lothar_Reported();
	AI_StopProcessInfos(self);
};


instance DIA_Lothar_OWRunning(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Lothar_OWRunning_Condition;
	information = DIA_Lothar_OWRunning_Info;
	permanent = FALSE;
	description = "� ��������� � ������ �������...";
};


func int DIA_Lothar_OWRunning_Condition()
{
	if((MIS_OLDWORLD == LOG_Running) && !Npc_HasItems(hero,ItWr_PaladinLetter_MIS) && Npc_KnowsInfo(other,DIA_Lothar_Dragons))
	{
		return TRUE;
	};
};

func void DIA_Lothar_OWRunning_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_53");	//� ��������� � ������ �������...
	AI_Output(self,other,"DIA_Lothar_Add_01_54");	//�? �� �� ������� ��� ������ ����������� � ��������, ���?
	AI_Output(other,self,"DIA_Lothar_Add_15_55");	//��, � ������� ���...
	AI_Output(self,other,"DIA_Lothar_Add_01_56");	//����� ���, ��� ��� ��������...
	AI_Output(other,self,"DIA_Lothar_Add_15_57");	//�� ������ ���� ������ ��������������...
	AI_Output(self,other,"DIA_Lothar_Add_01_58");	//�� ��� �, ����� �����. (���� ��� ���) ��� �� �������...
	AI_StopProcessInfos(self);
};


instance DIA_Lothar_OWRunningBrief(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Lothar_OWRunningBrief_Condition;
	information = DIA_Lothar_OWRunningBrief_Info;
	permanent = FALSE;
	description = "� ���� ���� ��������������! ��� ������ �� ������������ �������!";
};


func int DIA_Lothar_OWRunningBrief_Condition()
{
	if((MIS_OLDWORLD == LOG_Running) && Npc_HasItems(hero,ItWr_PaladinLetter_MIS) && Npc_KnowsInfo(other,DIA_Lothar_Dragons))
	{
		return TRUE;
	};
};

func void DIA_Lothar_OWRunningBrief_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_59");	//� ���� ���� ��������������! ��� ������ �� ������������ �������!
	AI_PrintScreen("������ ������� ����� ������ ������",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	AI_Output(self,other,"DIA_Lothar_Add_01_60");	//��� ������� ������������� ����������?
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_UseMob(self,"THRONE",-1);
		B_TurnToNpc(self,other);
	};
	B_ReadFakeItem(self,other,Fakescroll,1);
	AI_Output(self,other,"DIA_Lothar_Add_01_61");	//� ��� ������������ � ����. � ���� ������ ������ � �������� �� ��� ���������.
	AI_PrintScreen("������ ������� ����� ������ ��������",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
};


instance DIA_Lothar_PERM(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 3;
	condition = DIA_Lothar_PERM_Condition;
	information = DIA_Lothar_PERM_Info;
	permanent = TRUE;
	description = "������ ����������� �� ���� �� ��������� �����?";
};


func int DIA_Lothar_PERM_Condition()
{
	if(Mil_305_schonmalreingelassen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_PERM_Info()
{
	AI_Output(other,self,"DIA_Lothar_PERM_15_00");	//������ ����������� �� ���� �� ��������� �����?
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV) || (other.guild == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_01");	//��, ���� ����� ������� ���������� ����� ����. ������ �� ��������� ��� ������ ����.
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_02");	//�� ������ �������� ���� �� ����. � �������� ����� ��������� ������ � ���� ����������� ������ ������������ � ������ ����� � �������!
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_03");	//���.
	};
};

