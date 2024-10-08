
instance DIA_Addon_Fortuno_EXIT(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 999;
	condition = DIA_Addon_Fortuno_EXIT_Condition;
	information = DIA_Addon_Fortuno_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Fortuno_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Fortuno_Hi(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 2;
	condition = DIA_Addon_Fortuno_Hi_Condition;
	information = DIA_Addon_Fortuno_Hi_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Fortuno_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Fortuno_Geheilt_01 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Hi_Info()
{
	if(MIS_Fortuno_Delusion == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_00");	//(��������) ������ ������ ������� ���... �� ������������...
		AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_01");	//� ������... ������� �����, ����� ������� ���... ��, ��� ����� ����... �� ����� ����... �, ���, ����, ���� �����...
		AI_Output(other,self,"DIA_Addon_Fortuno_Hi_15_02");	//� ����� ��� � �������?
		MIS_Fortuno_Delusion = LOG_Running;
		Log_CreateTopic(Topic_Addon_Fortuno,LOG_MISSION);
		Log_SetTopicStatus(Topic_Addon_Fortuno,LOG_Running);
		B_LogEntry(Topic_Addon_Fortuno,"������� ����� � ���. ��� ����� '������� ���������'.");
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_03");	//�������... ������� ���������... � �� ���� �����...
	Info_ClearChoices(DIA_Addon_Fortuno_Hi);
	Info_AddChoice(DIA_Addon_Fortuno_Hi,Dialog_Ende_v4,DIA_Addon_Fortuno_Hi_BACK);
	Info_AddChoice(DIA_Addon_Fortuno_Hi,"� ���� ���� ������?",DIA_Addon_Fortuno_Hi_HILFE);
	if(Npc_HasItems(other,ItMi_Joint))
	{
		Info_AddChoice(DIA_Addon_Fortuno_Hi,"���, ������ ��� �������� �����.",DIA_Addon_Fortuno_Hi_JOINT);
	};
	if(Npc_HasItems(other,ItMi_Addon_Joint_01))
	{
		Info_AddChoice(DIA_Addon_Fortuno_Hi,"���, ������ ���� '������� ���������'.",DIA_Addon_Fortuno_Hi_GREEN);
	};
};

func void DIA_Addon_Fortuno_Hi_BACK()
{
	Info_ClearChoices(DIA_Addon_Fortuno_Hi);
	DIA_Common_IllBeBackLater();
	AI_WaitTillEnd(self,other);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Fortuno_Hi_HILFE()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_HILFE_15_00");	//� ���� ���� ������?
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_HILFE_13_01");	//�������... ������� ��������� ������� ����������...
};

func void DIA_Addon_Fortuno_Hi_JOINT()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_JOINT_15_00");	//���, ������ ��� �������� �����.
	AI_WaitTillEnd(self,other);
	B_GiveInvItems(other,self,ItMi_Joint,1);
	AI_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_JOINT_13_01");	//�� �������, �� �������, �� �������, �� �������...
};

func void DIA_Addon_Fortuno_Hi_GREEN()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_GREEN_15_00");	//���, ������ ���� '������� ���������'.
	AI_WaitTillEnd(self,other);
	B_GiveInvItems(other,self,ItMi_Addon_Joint_01,1);
	AI_UseItem(self,ItMi_Addon_Joint_01);
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_GREEN_13_01");	//(������� � ����) �-�-�-�...
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_GREEN_13_02");	//��� ������... ��� �... �������... ��� ���������?
	Info_ClearChoices(DIA_Addon_Fortuno_Hi);
	Fortuno_Geheilt_01 = TRUE;
	B_GivePlayerXP(XP_Addon_Fortuno_01);
	B_LogEntry(Topic_Addon_Fortuno,"'������� ���������' ����� ������� ������ � ����.");
};


instance DIA_Addon_Fortuno_wer(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 2;
	condition = DIA_Addon_Fortuno_wer_Condition;
	information = DIA_Addon_Fortuno_wer_Info;
	permanent = FALSE;
	description = "��, ����� ���, ��� � ����� ���������.";
};


func int DIA_Addon_Fortuno_wer_Condition()
{
	if(Fortuno_Geheilt_01 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_wer_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_00");	//��, ����� ���, ��� � ����� ���������.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_01");	//�����-�� � ����������� � �������� �������. ����� ��� ���� � �������.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_02");	//��, �� ��� - ���������� �����������, �� ��� ���, �����������, ����� ���� �����������...
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_03");	//��, � ���� ��� ����������� � ������ ��������. �������� ���-������ ���������.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_04");	//�... � ������ �� �����. ���� ��������� ��� ������...
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_05");	//�� ��, �������������. ��� ���������? ����� �� ������ � ����?
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_06");	//�����... � ����� ������ ������ �... � ������ ����.
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_07");	//��� ������ �����? ��� �� ������ � �����?
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_08");	//(��������) ��� ����. ������� �����, ����� ��� ����� ��� �������� � ������. � � ��� ����� �� �������...
};


instance DIA_Addon_Fortuno_FREE(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 5;
	condition = DIA_Addon_Fortuno_FREE_Condition;
	information = DIA_Addon_Fortuno_FREE_Info;
	permanent = FALSE;
	description = "������ �� ���� ������ ������� ���� ������.";
};


func int DIA_Addon_Fortuno_FREE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fortuno_wer))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_FREE_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_00");	//������ �� ���� ������ ������� ���� ������.
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_01");	//��... ��, ��������, ��� ��������.
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_02");	//���� ����� ��������� ������� �������� ��� � ����.
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_03");	//� �� ���-������ ������� ��� ���?
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_04");	//���, � �����, ��� ������ ������� ������ � ����...
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_05");	//���������. �����, ���� ���� ������ ���������� ���� �����, � ����� ���.
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc(Bloodfly,"ADW_PATH_TO_LOCH_01");
	B_LogEntry(Topic_Addon_Fortuno,"����� ������� ����������, �� �� ��� ��� ������ �� ������.");
};


instance DIA_Addon_Fortuno_Herb(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 99;
	condition = DIA_Addon_Fortuno_Herb_Condition;
	information = DIA_Addon_Fortuno_Herb_Info;
	permanent = FALSE;
	description = "���� ����� ��� �������� �����?";
};


func int DIA_Addon_Fortuno_Herb_Condition()
{
	if(Fortuno_Geheilt_01 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Herb_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Herb_15_00");	//���� ����� ��� �������� �����?
	AI_Output(self,other,"DIA_Addon_Fortuno_Herb_13_01");	//��-�-�, �����������. � ����� ��� �����, ������� �� ��� ���������.
	AI_Output(self,other,"DIA_Addon_Fortuno_Herb_13_02");	//� ���� ������� �� ��� ������, ��� ����.
};

func void B_Fortuno_InfoManager()
{
	Info_ClearChoices(DIA_Addon_Fortuno_Trade);
	Info_AddChoice(DIA_Addon_Fortuno_Trade,Dialog_Back,DIA_Addon_Fortuno_Trade_BACK);
	if(Npc_HasItems(other,ItPl_SwampHerb) > 1)
	{
		Info_AddChoice(DIA_Addon_Fortuno_Trade,"(������ ��� �������� �����)",DIA_Addon_Fortuno_Trade_all);
	};
	Info_AddChoice(DIA_Addon_Fortuno_Trade,"(������ ���� �������� �����)",DIA_Addon_Fortuno_Trade_1);
};


instance DIA_Addon_Fortuno_Trade(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 100;
	condition = DIA_Addon_Fortuno_Trade_Condition;
	information = DIA_Addon_Fortuno_Trade_Info;
	permanent = TRUE;
	description = "� ���� ���� �������� ����� ��� ����...";
};


func int DIA_Addon_Fortuno_Trade_Condition()
{
	if(Npc_HasItems(other,ItPl_SwampHerb) && Npc_KnowsInfo(other,DIA_Addon_Fortuno_Herb))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Trade_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Trade_15_00");	//� ���� ���� �������� ����� ��� ����...
	B_Fortuno_InfoManager();
};

func void DIA_Addon_Fortuno_Trade_BACK()
{
	Info_ClearChoices(DIA_Addon_Fortuno_Trade);
};

func void DIA_Addon_Fortuno_Trade_all()
{
	var int amount;
	amount = Npc_HasItems(other,ItPl_SwampHerb);
	B_GiveInvItems(other,self,ItPl_SwampHerb,amount);
	B_RemoveEveryInvItem(self,ItPl_SwampHerb);
	B_GiveInvItems(self,other,ItMi_Gold,amount * Value_SwampHerb);
	B_GivePlayerXP(amount * 10);
	TotalSwampHerbsForFortuno += amount;
	Info_ClearChoices(DIA_Addon_Fortuno_Trade);
};

func void DIA_Addon_Fortuno_Trade_1()
{
	B_GiveInvItems(other,self,ItPl_SwampHerb,1);
	B_RemoveEveryInvItem(self,ItPl_SwampHerb);
	B_GiveInvItems(self,other,ItMi_Gold,Value_SwampHerb);
	B_GivePlayerXP(10);
	TotalSwampHerbsForFortuno += 1;
	if(Npc_HasItems(other,ItPl_SwampHerb))
	{
		AI_PrintScreen(ConcatStrings("�������� �������� �����: ",IntToString(Npc_HasItems(other,ItPl_SwampHerb))),-1,-1,FONT_ScreenSmall,2);
		B_Fortuno_InfoManager();
	}
	else
	{
		Info_ClearChoices(DIA_Addon_Fortuno_Trade);
	};
};


instance DIA_Addon_Fortuno_Trank(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 3;
	condition = DIA_Addon_Fortuno_Trank_Condition;
	information = DIA_Addon_Fortuno_Trank_Info;
	permanent = FALSE;
	description = "� ���� ���� �����, ������� ������� ���� ���������.";
};


func int DIA_Addon_Fortuno_Trank_Condition()
{
	if((Fortuno_Geheilt_01 == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Fortuno_FREE) && (Npc_HasItems(other,ItPo_Addon_Geist_01) || Npc_HasItems(other,ItPo_Addon_Geist_02)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Trank_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Trank_15_00");	//� ���� ���� �����, ������� ������� ���� ���������.
	AI_Output(self,other,"DIA_Addon_Fortuno_Trank_13_01");	//� ���� ����.
	if(Npc_HasItems(other,ItPo_Addon_Geist_02))
	{
		B_GiveInvItems(other,self,ItPo_Addon_Geist_02,1);
		AI_UseItem(self,ItPo_Addon_Geist_02);
		B_GivePlayerXP(XP_Addon_Fortuno_02);
	}
	else if(B_GiveInvItems(other,self,ItPo_Addon_Geist_01,1))
	{
		AI_StopProcessInfos(self);
		AI_UseItem(self,ItPo_Addon_Geist_01);
	};
};


instance DIA_Addon_Fortuno_more(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 2;
	condition = DIA_Addon_Fortuno_more_Condition;
	information = DIA_Addon_Fortuno_more_Info;
	permanent = FALSE;
	description = "�?..";
};


func int DIA_Addon_Fortuno_more_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fortuno_Trank))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_more_Info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_00");	//�?..
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_01");	//��! � ����� �����! ������ � �������... �, ������, ��� �� � �������?
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_02");	//��, ��� �� �������? � ����� ������� - ��� ������� �����?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_03");	//� ����� ���... ��������� ��������. � ���. ��� ���� ����� ��������� �����... � ����� �� ��� ����.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_04");	//�� ������� ������� ������ � ������� � ����.
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_05");	//�����? ��� ��� ����� � �����?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_06");	//������ ��������... �� �������� ������ � ���, ��� ������ ���. ������� ����, ������ ����� ��� �����...
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_07");	//� �����?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_08");	//�� �� ������ ������� ������...
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_09");	//�� ����� ��� ������, ��� �� ������ ������� ���, ���� ��������� �������� �����.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_10");	//��� ����� �� ������ ���� �����. ���, ���� �� ����� ��������� �������� ������� ����, ���������� �����.
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_11");	//�������� �����?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_12");	//����� ��������� ����� �������. ��� ��������� � �����.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_13");	//��� � ����� �������� ��������. �� ������, ��� ��� ������ ��� ����.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_14");	//� ����� �� ����� ������������ ��, ��� �� ��� ��������, � ��� ���� �� �����.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_15");	//�� ����������� �� ��� ���������� ��������... � �� ��������� ����.
	MIS_Fortuno_Delusion = LOG_SUCCESS;
	B_LogEntry(TOPIC_Addon_RavenKDW,"������ ����� ������ �������� �� ����� �������.");
	Log_AddEntry(TOPIC_Addon_RavenKDW,"������ �����-�� ������������ �������� ����� ������� �������, ������� �� �������� � �����.");
	Log_AddEntry(TOPIC_Addon_RavenKDW,"����� �������, ��� ��� ������������� ��� ������ ��� ���������� �������� ��������.");
	Npc_ExchangeRoutine(self,"START");
	B_StartOtherRoutine(BDT_10006_Addon_Bandit,"FORTUNO");
	B_StartOtherRoutine(BDT_10010_Addon_Bandit,"FORTUNO");
	B_GivePlayerXP(XP_Addon_Fortuno_03);
};


instance DIA_Addon_Fortuno_Attentat(C_Info)
{
	npc = BDT_1075_Addon_Fortuno;
	nr = 9;
	condition = DIA_Addon_Fortuno_Attentat_Condition;
	information = DIA_Addon_Fortuno_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Fortuno_Attentat_Condition()
{
	if((MIS_Judas == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Fortuno_Trank))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Fortuno_Attentat_13_00");	//���������? ������, �... ������������... ��������� �����. � ������ ��� ��� �� ����.
};

