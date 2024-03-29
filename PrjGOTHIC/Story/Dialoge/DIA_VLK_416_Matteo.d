
instance DIA_Matteo_EXIT(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 999;
	condition = DIA_Matteo_EXIT_Condition;
	information = DIA_Matteo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Matteo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Matteo_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Matteo_Hallo(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_Hallo_Condition;
	information = DIA_Matteo_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Matteo_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Matteo_Hallo_Info()
{
	AI_Output(self,other,"DIA_Matteo_Hallo_09_00");	//��� ���� ������?
};


instance DIA_Matteo_SellWhat(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_SellWhat_Condition;
	information = DIA_Matteo_SellWhat_Info;
	permanent = FALSE;
	description = "��� �� ��������?";
};


func int DIA_Matteo_SellWhat_Condition()
{
	return TRUE;
};

func void DIA_Matteo_SellWhat_Info()
{
	AI_Output(other,self,"DIA_Matteo_SellWhat_15_00");	//��� �� ��������?
	if(Kapitel < 4)
	{
		AI_Output(self,other,"DIA_Matteo_SellWhat_09_01");	//� ���� ���������� ���, ��� ����� ������������ � ����� �����������. ������, ������, ��������... ���� �������.
		AI_Output(self,other,"DIA_Matteo_SellWhat_09_02");	//� ���� ���� ����� ������� ��������� �� ������.
		AI_Output(self,other,"DIA_Matteo_SellWhat_09_03");	//������� ��������� ������� �� ���� �������� - ������ �����. ���� ��� ���������?
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_TRADE_09_01");	//�������.
	};
	if(Knows_Matteo == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"����� ������ ��������� � ����� ����� ������. �� ������� ����������, ������ � ������ ������.");
		Knows_Matteo = TRUE;
	};
};


instance DIA_Matteo_TRADE(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 800;
	condition = DIA_Matteo_TRADE_Condition;
	information = DIA_Matteo_TRADE_Info;
	permanent = TRUE;
	description = DIALOG_TRADE_v4;
	trade = TRUE;
};


func int DIA_Matteo_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};
};


var int Matteo_TradeNewsPermanent;

func void B_MatteoAboutLothar()
{
	AI_Output(self,other,"DIA_Matteo_TRADE_09_01");	//� ��� ���, ��� �������� ���������� ������, ��������� ��������� ����� ����������� ����� ��������.
	AI_Output(self,other,"DIA_Matteo_TRADE_09_02");	//� �������, ��� ����������, ����� ����� ������ �������.
	Matteo_TradeNewsPermanent = 1;
};

func void DIA_Matteo_TRADE_Info()
{
	AI_Output(other,self,"DIA_Matteo_TRADE_15_00");	//������ ��� ���� ������.
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS) && (Matteo_TradeNewsPermanent == 0))
	{
		B_MatteoAboutLothar();
	};
	if((Kapitel == 4) && (Matteo_TradeNewsPermanent < 2))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_04");	//��� ������, ��� �� ����� ���������� ���� ������. ��� �����, ����� �� ��� ������������ ���� ����� �� ��������� ������.
		Matteo_TradeNewsPermanent = 2;
	};
	if((Kapitel == 5) && (Matteo_TradeNewsPermanent < 3))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_03");	//������, �������� ������������� �������� ��������� �� ���� ���. ��� ���� ��������� ������ �� ����� �������.
		if(Matteo_TradeNewsPermanent != 2)
		{
			AI_Output(self,other,"DIA_Matteo_TRADE_09_04");	//��� ������, ��� �� ����� ���������� ���� ������. ��� �����, ����� �� ��� ������������ ���� ����� �� ��������� ������.
		};
		Matteo_TradeNewsPermanent = 3;
	};
	B_GiveTradeInv(self);
	if(MIS_Serpentes_MinenAnteil_KDF == LOG_Running)
	{
		MatteoMinenAnteil = TRUE;
	};
	if(!Npc_HasItems(self,ItMi_Pan) && !Npc_HasItems(other,ItMi_Pan))
	{
		CreateInvItems(self,ItMi_Pan,1);
	};
	Trade_IsActive = TRUE;
};


var int Matteo_LeatherBought;

instance DIA_Matteo_LEATHER(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 850;
	condition = DIA_Matteo_LEATHER_Condition;
	information = DIA_Matteo_LEATHER_Info;
	permanent = TRUE;
	description = B_BuildPriceString("������ ������� �������. ������: 25/20/5/0.",VALUE_ITAR_Leather_L);
};


func int DIA_Matteo_LEATHER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_SellWhat) && (Matteo_LeatherBought == FALSE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Matteo_LEATHER_Info()
{
	AI_Output(other,self,"DIA_Matteo_LEATHER_15_00");	//������, ����� ��� ��� �������.
	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_Leather_L))
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_01");	//��� ���� ����������. (����������)
		B_GiveArmor(ITAR_Leather_L);
		Matteo_LeatherBought = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_02");	//��� ������� ����� �������� - �� ���, �����������, ����� ����� �����. ��� ��� �����������, ����� � ���� ����� ���������� ������.
	};
};


var int Matteo_Confiscated;

instance DIA_Matteo_Paladine(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 2;
	condition = DIA_Matteo_Paladine_Condition;
	information = DIA_Matteo_Paladine_Info;
	permanent = FALSE;
	description = "��� �� ������ � ���������?";
};


func int DIA_Matteo_Paladine_Condition()
{
	return TRUE;
};

func void DIA_Matteo_Paladine_Info()
{
	AI_Output(other,self,"DIA_Matteo_Paladine_15_00");	//��� �� ������ � ���������?
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS) && (Matteo_TradeNewsPermanent == 0))
	{
		B_MatteoAboutLothar();
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_02");	//������ �������. ������ � �����. �� ������� �������, �� ���� ����������� ����.
		B_EquipTrader(self);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_Paladine_09_01");	//� ��� ���, ��� ��� ������� ������� � �����, � ���� �� ��� ���� ��������.
		AI_Output(self,other,"DIA_Matteo_Paladine_09_02");	//��������� ���, ����� � ��� � ������� �������, ��������� ���������� ��� ������ � ������ ��������, ��� ��� ��� �����!
		AI_Output(other,self,"DIA_Matteo_Paladine_15_03");	//�?
		AI_Output(self,other,"DIA_Matteo_Paladine_09_04");	//������� ��, ��� ���������� ����!
		AI_Output(self,other,"DIA_Matteo_Paladine_09_05");	//�� � ���� ��� ���� ����� � ���� ������, ����� ��� ���������� ������� ��� ������ ��� ���� ������!
		AI_Output(self,other,"DIA_Matteo_Paladine_09_06");	//� ����� ��� ������� ������ � ������������ �������� ���� �������!
		Matteo_Confiscated = TRUE;
	};
};


instance DIA_Matteo_Confiscated(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 2;
	condition = DIA_Matteo_Confiscated_Condition;
	information = DIA_Matteo_Confiscated_Info;
	permanent = FALSE;
	description = "�������� ������� ���� ������?";
};


func int DIA_Matteo_Confiscated_Condition()
{
	if(Matteo_Confiscated == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Matteo_Confiscated_Info()
{
	AI_Output(other,self,"DIA_Matteo_Confiscated_15_00");	//�������� ������� ���� ������?
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_01");	//���, ��� � ���� ��������� �� ������ �����.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_02");	//��� ������ ��������� ��������� ����� ������ �� ����.
	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Matteo_Confiscated_09_03");	//��� ��� �������, ��� ��� �� ������� ���. ���� �� ������� ��������.
	};
};


instance DIA_Matteo_HelpMeToOV(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_HelpMeToOV_Condition;
	information = DIA_Matteo_HelpMeToOV_Info;
	permanent = FALSE;
	description = "�� ������ ������ ��� ������� � ������� �������?";
};


func int DIA_Matteo_HelpMeToOV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_Paladine) && (Player_IsApprentice == APP_NONE))
	{
		if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			return TRUE;
		};
	};
};

func void DIA_Matteo_HelpMeToOV_Info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_00");	//�� ������ ������ ��� ������� � ������� �������?
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_01");	//(�����������) ���? � ��� ���� ����� ���?
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_02");	//� ���� ������ ���������...
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_03");	//���-���... � �� ������� ����� ���� ����������?
	if(Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_04");	//(������� ����) ��, ������ �� ����!
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_05");	//(�������) ��� ��� ������� ��� ���� �����!
	}
	else
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_06");	//� �� �������, ����� ��� ���� ��������.
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_07");	//��������, �� ����.
	};
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_08");	//� �� ���� ��������� ������ � ���� ��������� - ��� ���� �� ��������.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_09");	//�� ���� ���� �� ������� ��, ��� �������, ������� ������, �������������� � ������, ��� �� ������ ����.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_10");	//������ ��� � ��� ���� ������.
};

func void B_Matteo_Preis()
{
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_01");	//������, ��� ����� ����� ��� ����.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_02");	//(������) ������ � ���: ��������� ��� ����� ��� ����?
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_03");	//�� ��� �� ���������?
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_04");	//� ���� ������ ���� - � ����, ��� ��, ���� �� ����� ����������� ����� �����.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_05");	//�� ��� ���� ��������� � ��������� �����.
};


instance DIA_Matteo_HelpMeNow(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_HelpMeNow_Condition;
	information = DIA_Matteo_HelpMeNow_Info;
	permanent = FALSE;
	description = "��� �� ������ ������ ��� ������� � ������� �������?";
};


func int DIA_Matteo_HelpMeNow_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HelpMeToOV) && (Player_IsApprentice == APP_NONE))
	{
		if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			return TRUE;
		};
	};
};

func void DIA_Matteo_HelpMeNow_Info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_00");	//��� �� ������ ������ ��� ������� � ������� �������?
	B_Matteo_Preis();
};


instance DIA_Matteo_LehrlingLater(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_LehrlingLater_Condition;
	information = DIA_Matteo_LehrlingLater_Info;
	permanent = FALSE;
	description = "������ ��� ����� �������� ������ �� ��������.";
};


func int DIA_Matteo_LehrlingLater_Condition()
{
	if(Player_IsApprentice == APP_NONE)
	{
		if((other.guild != GIL_NONE) && (other.guild != GIL_NOV))
		{
			return TRUE;
		};
	};
};

func void DIA_Matteo_LehrlingLater_Info()
{
	AI_Output(other,self,"DIA_Matteo_LehrlingLater_15_00");	//������ ��� ����� �������� ������ �� ��������.
	B_Matteo_Preis();
};


instance DIA_Matteo_PriceOfHelp(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_PriceOfHelp_Condition;
	information = DIA_Matteo_PriceOfHelp_Info;
	permanent = FALSE;
	description = "��� �� ������ �� ���� ������?";
};


func int DIA_Matteo_PriceOfHelp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HelpMeNow) || Npc_KnowsInfo(other,DIA_Matteo_LehrlingLater))
	{
		return TRUE;
	};
};

func void DIA_Matteo_PriceOfHelp_Info()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_15_00");	//��� �� ������ �� ���� ������?
	AI_Output(self,other,"DIA_Matteo_PriceOfHelp_09_01");	//100 ������� �����.
	Info_ClearChoices(DIA_Matteo_PriceOfHelp);
	Info_AddChoice(DIA_Matteo_PriceOfHelp,"��� ��� ���������...",DIA_Matteo_PriceOfHelp_Wow);
	Info_AddChoice(DIA_Matteo_PriceOfHelp,"�� ��, �������!",DIA_Matteo_PriceOfHelp_Cutthroat);
};

func void B_Matteo_RegDichAb()
{
	AI_Output(self,other,"B_Matteo_RegDichAb_09_00");	//����������� ��� �����! ��� �� ���� ������ � ���� � ����.
	AI_Output(other,self,"B_Matteo_RegDichAb_15_01");	//� ���?
	AI_Output(self,other,"B_Matteo_RegDichAb_09_02");	//� ��������, ��� ��� ������.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_03");	//������, ���������� ��������, ��� ����� �� ������ ��� ����.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_04");	//�� ��� ��������� ������������ ��������� ���������� � ����� ������� - ��� ��������, ��� ������ � ��� ����.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_05");	//� ����, ����� �� ����� �� ��� ���� ����. �� ������ ������, ������� - ���� ����� ����������� �������.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_06");	//������� ��� ��� ������, � � ������ ����.
	MIS_Matteo_Gold = LOG_Running;
	Log_CreateTopic(TOPIC_Matteo,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Matteo,LOG_Running);
	B_LogEntry(TOPIC_Matteo,"���������� �������� ������� ������ ������ ������ 100 ������� �����. ���� � ����� �� ���, �� ������� ��� ������� � ������� �������.");
};

func void DIA_Matteo_PriceOfHelp_Cutthroat()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Cutthroat_15_00");	//�� ��, �������!
	B_Matteo_RegDichAb();
	Info_ClearChoices(DIA_Matteo_PriceOfHelp);
};

func void DIA_Matteo_PriceOfHelp_Wow()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Wow_15_00");	//��� ��� ���������...
	B_Matteo_RegDichAb();
	Info_ClearChoices(DIA_Matteo_PriceOfHelp);
};


instance DIA_Matteo_WoGritta(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 2;
	condition = DIA_Matteo_WoGritta_Condition;
	information = DIA_Matteo_WoGritta_Info;
	permanent = FALSE;
	description = "��� ��� ����� ��� ������?";
};


func int DIA_Matteo_WoGritta_Condition()
{
	if(MIS_Matteo_Gold == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Matteo_WoGritta_Info()
{
	AI_Output(other,self,"DIA_Matteo_WoGritta_15_00");	//��� ��� ����� ��� ������?
	AI_Output(self,other,"DIA_Matteo_WoGritta_09_01");	//��� � ��� �������, ��� ���������� ��������. ��� ��� ��������� ���� �� �����, ������ �� �������.
};


instance DIA_Matteo_GoldRunning(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 500;
	condition = DIA_Matteo_GoldRunning_Condition;
	information = DIA_Matteo_GoldRunning_Info;
	permanent = TRUE;
	description = "��� ���� 100 �������!";
};


func int DIA_Matteo_GoldRunning_Condition()
{
	if(MIS_Matteo_Gold == LOG_Running)
	{
		if(Npc_KnowsInfo(other,DIA_Gritta_WantsMoney))
		{
			return TRUE;
		};
		if(Npc_IsDead(Gritta))
		{
			return TRUE;
		};
	};
};

func void DIA_Matteo_GoldRunning_Info()
{
	AI_Output(other,self,"DIA_Matteo_GoldRunning_15_00");	//��� ���� 100 �������!
	if(Npc_IsDead(Gritta))
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_01");	//�� ���� ������ ����� ������! � �� �������, ��� ����� ������� ��!
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_02");	//� �� ���� ����� �������� ��������� � ����� ����. �� ������ ������ � ����� ������! �� ���� ���� ���������� �� ����!
		MIS_Matteo_Gold = LOG_FAILED;
		B_CheckLog();
		B_EquipTrader(self);
		AI_StopProcessInfos(self);
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		if(Npc_HasItems(Gritta,ItMi_Gold) < 80)
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_03");	//�? ���� �����-������ ��������?
			AI_Output(other,self,"DIA_Matteo_GoldRunning_15_04");	//������ ������, � ��� ������ �� ��������.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_05");	//������! �� �������� ���� ����� ������.
		}
		else
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_06");	//�� ������ ��������� �� ���? ��, � �� ���������, ����� �� ��������� ��� ������ �� ���!
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_07");	//�� ��� �� - 100 ������� ���� 100 �������.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_08");	//�� �������� ���� ����� ������.
		};
		MIS_Matteo_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Matteo_Gold);
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_09");	//� ���� �������� �� ������? � �� ���� 100 ������� �����.
	};
};


instance DIA_Matteo_Zustimmung(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 4;
	condition = DIA_Matteo_Zustimmung_Condition;
	information = DIA_Matteo_Zustimmung_Info;
	permanent = TRUE;
	description = "������ ��� ����� �������� ������ �� ��������!";
};


var int DIA_Matteo_Zustimmung_perm;

func int DIA_Matteo_Zustimmung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) && ((MIS_Matteo_Gold == LOG_Running) || (MIS_Matteo_Gold == LOG_SUCCESS)) && (Player_IsApprentice == APP_NONE) && (DIA_Matteo_Zustimmung_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_Zustimmung_Info()
{
	AI_Output(other,self,"DIA_Matteo_Zustimmung_15_00");	//������ ��� ����� �������� ������ �� ��������!
	if(MIS_Matteo_Gold == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_01");	//�� ��������, � ������� ���� ��������.
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_02");	//������ ������� ������� �� ���� � ���� ������ �������.
		B_GivePlayerXP(XP_Zustimmung);
		B_LogEntry(TOPIC_Lehrling,"������ ���� ��� ���� ���������, ���� � ������ ����� �������� ������� �������.");
		DIA_Matteo_Zustimmung_perm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_03");	//����� ���� �������. ������� ������� ���� ����� ������ � ������� ��� ������!
	};
};


instance DIA_Matteo_HowCanYouHelp(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 4;
	condition = DIA_Matteo_HowCanYouHelp_Condition;
	information = DIA_Matteo_HowCanYouHelp_Info;
	permanent = FALSE;
	description = "��� ������ �� ����������� ������ ���?";
};


func int DIA_Matteo_HowCanYouHelp_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Matteo_HelpMeNow) || Npc_KnowsInfo(other,DIA_Matteo_LehrlingLater)) && (Player_IsApprentice == APP_NONE) && (MIS_Matteo_Gold != LOG_FAILED))
	{
		return TRUE;
	};
};

func void DIA_Matteo_HowCanYouHelp_Info()
{
	AI_Output(other,self,"DIA_Matteo_HowCanYouHelp_15_00");	//��� ������ �� ����������� ������ ���?
	AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_01");	//��� ������. � ��������� ���� �������, ����� ������� ������ ������� �������� ����� ���� � �������.
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_02");	//���� ��������, �� ������������� ������� ����������� ������ � ������� ������� � ������� �������. ������ �����, �� ������� ���-������ ����������.
	};
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"������ ����� ������ ��� ����� �������� ������ �� ��������.");
};


instance DIA_Matteo_WoAlsLehrling(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 4;
	condition = DIA_Matteo_WoAlsLehrling_Condition;
	information = DIA_Matteo_WoAlsLehrling_Info;
	permanent = FALSE;
	description = "� � ���� � ���� ��������� � �������?";
};


func int DIA_Matteo_WoAlsLehrling_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_WoAlsLehrling_Info()
{
	AI_Output(other,self,"DIA_Matteo_WoAlsLehrling_15_00");	//� � ���� � ���� ��������� � �������?
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_01");	//� ������ ������� �� ���� �����.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_02");	//��� ����� ���� ������ �����, ������-������ ������, ������� ������ ��� ������� �����������.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_03");	//���� �� ��� ����������� ������� ����.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_04");	//�� �����, ����� � ���� ���� �������� ������ �������. ����� ������ ��������.
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"� ���� ����� �������� �������-������� �������, ������� ������, �������� ������� ��� �������� �����������.");
	Log_AddEntry(TOPIC_Lehrling,"������ ��� � ����� ��������, � ������ �������� ��������� ������ ��������.");
};


instance DIA_Matteo_WieZustimmung(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_Matteo_WieZustimmung_Condition;
	information = DIA_Matteo_WieZustimmung_Info;
	permanent = FALSE;
	description = "��� ��� �������� ��������� ������ ��������?";
};


func int DIA_Matteo_WieZustimmung_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Matteo_WoAlsLehrling) || Npc_KnowsInfo(other,DIA_Matteo_WarumNichtBeiDir)) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_WieZustimmung_Info()
{
	AI_Output(other,self,"DIA_Matteo_WieZustimmung_15_00");	//��� ��� �������� ��������� ������ ��������?
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_01");	//�� ������ ������ ������� ��. ��� � �������� � ����.
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_02");	//��, � ���� ���� �� ���� �� ��� ����� ������ ����, ���� �� ��������� � �������! ��� ��� ���������� ����������� ��!
	B_LogEntry(TOPIC_Lehrling,"� ����� �������� ��������� ��������, ������ ���� � ������� ���� � ������ ������� ����� ����.");
};


instance DIA_Matteo_WarumNichtBeiDir(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_WarumNichtBeiDir_Condition;
	information = DIA_Matteo_WarumNichtBeiDir_Info;
	permanent = FALSE;
	description = "� ������ �� �� �������� ���� � �������?";
};


func int DIA_Matteo_WarumNichtBeiDir_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_WarumNichtBeiDir_Info()
{
	AI_Output(other,self,"DIA_Matteo_WarumNichtBeiDir_15_00");	//� ������ �� �� �������� ���� � �������?
	if(MIS_Matteo_Gold != LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_01");	//� �� ���� - �� ������ ������� �� ����������.
		AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_02");	//� ������ ������� ���� ��� ������ �������.
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		B_EquipTrader(self);
		AI_StopProcessInfos(self);
	};
};


instance DIA_Matteo_OtherWay(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_OtherWay_Condition;
	information = DIA_Matteo_OtherWay_Info;
	permanent = FALSE;
	description = "� ���� ������ ������ ������� � ������� �������?";
};


func int DIA_Matteo_OtherWay_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) || (MIS_Matteo_Gold == LOG_FAILED)) && (Mil_305_schonmalreingelassen == FALSE) && (Player_IsApprentice == APP_NONE))
	{
		if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			return TRUE;
		};
	};
};

func void DIA_Matteo_OtherWay_Info()
{
	AI_Output(other,self,"DIA_Matteo_OtherWay_15_00");	//� ���� ������ ������ ������� � ������� �������?
	if(MIS_Matteo_Gold != LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Matteo_OtherWay_09_01");	//��������... ���� � ���-������ ��������, � ��� ���� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_02");	//� �� ���� ����� �������� ��������� � ����� ����. �� ������ ������ � ����� ������! �� ���� ���� ���������� �� ����!
		B_EquipTrader(self);
		AI_StopProcessInfos(self);
	};
};


instance DIA_Matteo_Minenanteil(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_Minenanteil_Condition;
	information = DIA_Matteo_Minenanteil_Info;
	description = "� ����, � ���� ����� ������ ������� ���� � ����� ��������������� ��������.";
};


func int DIA_Matteo_Minenanteil_Condition()
{
	if((other.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && (MatteoMinenAnteil == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Matteo_Minenanteil_15_00");	//� ����, � ���� ����� ������ ������� ���� � ����� ��������������� ��������. ��� ������ �� ����?
	AI_Output(self,other,"DIA_Matteo_Minenanteil_09_01");	//(������) �����? ��. � ������ ��� �������? ������� �� ����, ��� � ���� ��. �������, ���� �����.
	B_GivePlayerXP(XP_Ambient);
};

