
instance DIA_Addon_Huno_EXIT(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 999;
	condition = DIA_Addon_Huno_EXIT_Condition;
	information = DIA_Addon_Huno_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Huno_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Huno_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Huno_Abwimmeln(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 1;
	condition = DIA_Addon_Huno_Abwimmeln_Condition;
	information = DIA_Addon_Huno_Abwimmeln_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Huno_Abwimmeln_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		if(Huno_MEGA_Angepisst == TRUE)
		{
			return TRUE;
		};
		if((Huno_zuSnaf == TRUE) && !Npc_KnowsInfo(other,DIA_Addon_Fisk_Meeting))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Huno_Abwimmeln_Info()
{
	if(Huno_MEGA_Angepisst == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Abwimmeln_06_00");	//������ ����� ���� ����� �����? ����������!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Abwimmeln_06_01");	//���� �� �� �����? ��-��, ������ � �������!
	};
	AI_StopProcessInfos(self);
};


var int Knows_Flucht;
var int Huno_Angepisst;

instance DIA_Addon_Huno_Hi(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 1;
	condition = DIA_Addon_Huno_Hi_Condition;
	information = DIA_Addon_Huno_Hi_Info;
	permanent = FALSE;
	description = "� �����, �� � ����� ���� ������ ����.";
};


func int DIA_Addon_Huno_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Huno_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_15_00");	//� �����, �� � ����� ���� ������ ����.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_06_01");	//� �� ����. ����� ������?
	AI_Output(other,self,"DIA_Addon_Huno_Hi_15_02");	//�����? �������, �� ���� � ���-�� ������...
	AI_Output(self,other,"DIA_Addon_Huno_Hi_06_03");	//��... �� ����� ������ �� ������������?
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"���� ������� ������� �� �������.");
	Info_ClearChoices(DIA_Addon_Huno_Hi);
	Info_AddChoice(DIA_Addon_Huno_Hi,"�� ��. � ������ ������.",DIA_Addon_Huno_Hi_JA);
	Info_AddChoice(DIA_Addon_Huno_Hi,"� �����, ���. ���, �� ������������.",DIA_Addon_Huno_Hi_NO);
};

func void DIA_Addon_Huno_Hi_JA()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_JA_15_00");	//�� ��. � ������ ������.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_JA_06_01");	//������ ������... ��... �� ��� ���������� �������... � �����, �� �����.
	AI_Output(other,self,"DIA_Addon_Huno_Hi_JA_15_02");	//��� ��� ������. ��� ���� ��������?
	AI_Output(self,other,"DIA_Addon_Huno_Hi_JA_06_03");	//�������. ��������� ����������� �� �������, ��� � �. ��� ������ ������ ������ ������ ���� �������� �������.
	Info_ClearChoices(DIA_Addon_Huno_Hi);
	Knows_Flucht = TRUE;
};

func void DIA_Addon_Huno_Hi_NO()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_NO_15_00");	//� �����, ���. ���, �� ������������.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_NO_06_01");	//��... ������ � ���� �������... �� �� �����.
	Info_ClearChoices(DIA_Addon_Huno_Hi);
};


instance DIA_Addon_Huno_Blitz(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 2;
	condition = DIA_Addon_Huno_Blitz_Condition;
	information = DIA_Addon_Huno_Blitz_Info;
	permanent = FALSE;
	description = "�����, ��� �� ������?";
};


func int DIA_Addon_Huno_Blitz_Condition()
{
	if((Knows_Flucht == TRUE) && (Huno_Angepisst == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Blitz_Info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Blitz_15_00");	//�����, ��� �� ������?
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_01");	//��, ��� ������ ������� �� �����, �������� ��������� ���������.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_02");	//���-�� ��������, ���-�� �����, � ���-�� ������ ��� ������.
	AI_Output(other,self,"DIA_Addon_Huno_Blitz_15_03");	//� �� ��� �����?
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_04");	//� ������ ��������� �������� ������, ��� ��������� ��� ����� �������, �� � ��� ����� ���� �� ���������� �� ����.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_05");	//��� �� �� �������? � ���� ������� ���� �������� �������! �� ��� ��� �������, ��� � ����� ���� �����.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_06");	//����� ��� �������, ��� ���� ����� �����. ��-�� � ������ ���� � �����.
};


var int Huno_ArmorPerm;

instance DIA_Addon_Huno_Armor(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 3;
	condition = DIA_Addon_Huno_Armor_Condition;
	information = DIA_Addon_Huno_Armor_Info;
	permanent = TRUE;
	description = "��� �� ������� �������.";
};


func int DIA_Addon_Huno_Armor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Huno_Hi) && (Huno_ArmorPerm == FALSE) && (Huno_Angepisst == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Armor_Info()
{
	Info_ClearChoices(DIA_Addon_Huno_Armor);
	AI_Output(other,self,"DIA_Addon_Huno_Armor_15_00");	//��� �� ������� �������.
	if(Huno_ArmorCheap == FALSE)
	{
		if(!Npc_IsDead(Esteban))
		{
			AI_Output(self,other,"DIA_Addon_Huno_Armor_06_01");	//���� ���������� ���. ������? �� ���� ����, � ��������.
			AI_Output(self,other,"DIA_Addon_Huno_Armor_06_02");	//��������� ����� ����� ��� ���� ���� � ������ ��������, ��� � ������.
		};
		BDT_Armor_H_Value = 2100;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_Armor_15_03");	//���� ������, ��� � ���� ������������ �� ������.
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_04");	//����, ��������? ��, ��, � ��� � � ����� ���� ������. �����, ����� ���� ������.
		BDT_Armor_H_Value = 1000;
	};
	Info_AddChoice(DIA_Addon_Huno_Armor,Dialog_Back,DIA_Addon_Huno_Armor_BACK);
	Info_AddChoice(DIA_Addon_Huno_Armor,B_BuildPriceString("������ ������� ������� �������. ������: 50/50/0/0.",BDT_Armor_H_Value),DIA_Addon_Huno_Armor_BUY);
};

func void DIA_Addon_Huno_Armor_BACK()
{
	Info_ClearChoices(DIA_Addon_Huno_Armor);
};

func void DIA_Addon_Huno_Armor_BUY()
{
	AI_Output(other,self,"DIA_Addon_Huno_Armor_Buy_15_00");	//������, � ���� �������.
	if(B_GiveInvItems(other,self,ItMi_Gold,BDT_Armor_H_Value))
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_01");	//�������.
		B_GiveArmor(ITAR_BDT_H);
		Huno_ArmorPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_02");	//��� ������ ���� �� �����������.
	};
	Info_ClearChoices(DIA_Addon_Huno_Armor);
};


instance DIA_Addon_Huno_Attentat(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 4;
	condition = DIA_Addon_Huno_Attentat_Condition;
	information = DIA_Addon_Huno_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION2;
};


func int DIA_Addon_Huno_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_00");	//(�������������) ��� ���� �� ���� �����?
	AI_Output(other,self,"DIA_Addon_Huno_Attentat_15_01");	//������ ����������. ������ �������, � ����� �� ������, ��� ����� �� ����������.
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_02");	//� � ���� �� ����, ��� � ������ �����?
	AI_Output(other,self,"DIA_Addon_Huno_Attentat_15_03");	//��, ������, ��������.
	DIA_Common_06_IKnowNothingAboutIt();
};


var int Huno_nochmal;
var int Huno_SomeThings_PERM;
var int Huno_Counter;

func void B_Addon_Huno_Stress()
{
	AI_Output(self,other,"DIA_Addon_Huno_Stress_06_00");	//(��������) � ������ �������� ����. ������ �� �� ���� ������� ������, ���� � �� �� ������.
	Huno_Angepisst = TRUE;
};


instance DIA_Addon_Huno_SomeThings(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 4;
	condition = DIA_Addon_Huno_SomeThings_Condition;
	information = DIA_Addon_Huno_SomeThings_Info;
	permanent = TRUE;
	description = "� ������ � ���� ����-������ ������.";
};


func int DIA_Addon_Huno_SomeThings_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Huno_Attentat) && (Huno_SomeThings_PERM == FALSE) && ((Finn_TellAll == TRUE) || (Paul_TellAll == TRUE) || (Emilio_TellAll == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_SomeThings_Info()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_00");	//� ������ � ���� ����-������ ������.
	if(Huno_nochmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_01");	//��?
		Huno_nochmal = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_02");	//�����? (���������) �������, ��� ���� �����?
	};
	Huno_Counter = 0;
	if(Finn_TellAll == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_03");	//� ������, ��� ���� �� ���� �� ����� �� ����� ���������!
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_04");	//(�������������) ��� ���?
		Huno_Counter += 1;
	};
	if(Paul_TellAll == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_05");	//��� ����������, ��� �� ���������� ��������.
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_06");	//(�������������) ���������...
		Huno_Counter += 1;
	};
	if(Emilio_TellAll == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_07");	//������ �������� ���� ���! �� ������ ���-�� � ���������, ������ �� ������ ��������!
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_08");	//(��������) ������, �� ������ �� �������� ������?
		if(Huno_Counter > 0)
		{
			AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_09");	//�� ������ �� ������������, ��� ����������� ����!
			AI_WaitTillEnd(self,other);
			AI_PlayAni(self,"T_SEARCH");
			AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_10");	//� ��� ��� ��� ������?
			Huno_SomeThings_PERM = TRUE;
			B_LogEntry(Topic_Addon_Esteban,"������, � ���� ���� �� �������.");
			Info_ClearChoices(DIA_Addon_Huno_SomeThings);
			Info_AddChoice(DIA_Addon_Huno_SomeThings,"� ���� ������ �� ���� �������, ����!",DIA_Addon_Huno_SomeThings_Contra);
			Info_AddChoice(DIA_Addon_Huno_SomeThings,"���� �� ����������� ���������, �� �� ��� �����������!",DIA_Addon_Huno_SomeThings_Pro);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_11");	//(���������) �����, ��� ���� ����� � ��� ���������? ������, ��� ����� ����������� �������.
			B_Addon_Huno_Stress();
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_12");	//��, ����������, ��� ���...
		B_Addon_Huno_Stress();
		AI_StopProcessInfos(self);
	};
};

func void DIA_Addon_Huno_SomeThings_Pro()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Pro_15_00");	//���� �� ����������� ���������, �� �� ��� �����������!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Pro_06_01");	//(�����������) �� � ����� ���� ����� �����, ��� ������ ��������? �������, ��� ������� ����������� � ��������?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Pro_06_02");	//����� ��� ������!
	Huno_MEGA_Angepisst = TRUE;
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Huno_SomeThings_Contra()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_00");	//� ���� ������ �� ���� �������, ����!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_01");	//������ ��������? �� ��� �, ������.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_02");	//� �������� ������ ����� �� �������.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_03");	//� ����������, ��� ������� �������� � ����� ����. ����� ������� ��� �� ����������.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_04");	//�������, �� �� ���� � ���� ����������. ���� �������� �� ������ ����� � ���� ��������. ������� �� ������.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_05");	//������ �� ������?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_06");	//��� � �������� ���� �� ���, � ������� ������� - �� �����...
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_07");	//� ��� ����� ����� ������� �������?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_08");	//��� ��� ���� �� ��������. �� ��� ��� ���� � ����� ���� �����, ��� ��� ����. � �� ����� ��� � ������ �������� �����.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_09");	//����� �� ������. �� ������ ����� ���.
	MIS_Huno_Stahl = LOG_Running;
	Huno_Angepisst = FALSE;
	Log_CreateTopic(Topic_Addon_Huno,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Huno,LOG_Running);
	B_LogEntry(Topic_Addon_Huno,"���� ���� ������� �� ������, ������� ��� ������ ���� ��������� �� �������. �� ������, ��� �� ����� ��� �������� ������� �� ����� ����. �� �������� �� �������.");
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	Info_AddChoice(DIA_Addon_Huno_SomeThings,"����� ��� �������, ��� ����� �� ������!",DIA_Addon_Huno_SomeThings_TellMeNow);
	Info_AddChoice(DIA_Addon_Huno_SomeThings,"������, � ������� ����.",DIA_Addon_Huno_SomeThings_Mission);
};

func void DIA_Addon_Huno_SomeThings_Mission()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Mission_15_00");	//������, � ������� ����.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Mission_06_01");	//������. ���������, ����� �� ���� ��������.
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Huno_SomeThings_TellMeNow()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_00");	//����� ��� �������, ��� ����� �� ������!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_01");	//���. �� ������� ������, �������, �� � ���� �� �������.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_02");	//������, ���� �� ��� ��������, ��� ��� ���, ���� ��� �������� �������� ������ ������ ����� - ��������.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_03");	//�������.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_04");	//(��������) �����. � ��������� �������. �� ������ ���, ��� � ����� ����, �����?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_05");	//��� � ������� � �������� � ��������. �� ������, ��� ������ ������.
	B_LogEntry(Topic_Addon_Esteban,"���� ������, ��� � ������ ���������� �� ������.");
	Huno_zuSnaf = TRUE;
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Huno_Paket(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 3;
	condition = DIA_Addon_Huno_Paket_Condition;
	information = DIA_Addon_Huno_Paket_Info;
	permanent = FALSE;
	description = "��� ���� �����.";
};


func int DIA_Addon_Huno_Paket_Condition()
{
	if((MIS_Huno_Stahl == LOG_Running) && Npc_HasItems(other,ItMi_Addon_Steel_Paket))
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Paket_Info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Paket_15_00");	//��� ���� �����.
	B_GiveInvItems(other,self,ItMi_Addon_Steel_Paket,1);
	Npc_RemoveInvItem(self,ItMi_Addon_Steel_Paket);
	AI_Output(self,other,"DIA_Addon_Huno_Paket_06_01");	//� ����? �� ��� ���?
	AI_Output(other,self,"DIA_Addon_Huno_Paket_15_02");	//���, ��� �� ���.
	AI_Output(self,other,"DIA_Addon_Huno_Paket_06_03");	//� ��� � ����. ����� ������� ����� �� ���� ����.
	if(Huno_zuSnaf == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_04");	//� �� ������. ���� �������, � �� ������.
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_05");	//���, ������ ���. ��������� �������.
		B_GiveInvItems(self,other,ItMi_Gold,200);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_Paket_15_06");	//� ������ ����� ��������� � ����� ��������.
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_07");	//������ ���� ������� ���� ���� � �������. �������� � ��������.
		B_LogEntry(Topic_Addon_Esteban,"���� ������, ��� � ������ ���������� �� ������.");
		Huno_zuSnaf = TRUE;
	};
	MIS_Huno_Stahl = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_HunoStahl);
};


instance DIA_Addon_Huno_Trade(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 888;
	condition = DIA_Addon_Huno_Trade_Condition;
	information = DIA_Addon_Huno_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_v3;
};


func int DIA_Addon_Huno_Trade_Condition()
{
	if(Huno_Angepisst == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Trade_Info()
{
	B_Say(other,self,"$TRADE_3");
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};

instance DIA_Huno_RepairNecklace(C_Info)
{
	npc = BDT_1099_Addon_Huno;
	nr = 600;
	condition = DIA_Huno_RepairNecklace_Condition;
	information = DIA_Huno_RepairNecklace_Info;
	permanent = FALSE;
	description = "�� ������ ������ �������������?";
};


func int DIA_Huno_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(other,ItMi_InnosEye_Broken_MIS) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		if(!Npc_KnowsInfo(other,DIA_Bennet_ShowInnosEye))
		{
			return TRUE;
		};
	};
};

func void DIA_Huno_RepairNecklace_Info()
{
	DIA_Common_CanYouRepairJewelry();
	DIA_Common_06_IKnowNothingAboutIt();
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	AI_StopProcessInfos(self);
};

