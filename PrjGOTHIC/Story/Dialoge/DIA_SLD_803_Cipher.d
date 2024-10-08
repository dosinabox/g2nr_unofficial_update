
instance DIA_Cipher_EXIT(C_Info)
{
	npc = SLD_803_Cipher;
	nr = 999;
	condition = DIA_Cipher_EXIT_Condition;
	information = DIA_Cipher_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cipher_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cipher_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Cipher_Hello(C_Info)
{
	npc = SLD_803_Cipher;
	nr = 1;
	condition = DIA_Cipher_Hello_Condition;
	information = DIA_Cipher_Hello_Info;
	permanent = FALSE;
	description = "��� ����?";
};


func int DIA_Cipher_Hello_Condition()
{
	return TRUE;
};

func void DIA_Cipher_Hello_Info()
{
	AI_Output(other,self,"DIA_Cipher_Hello_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Cipher_Hello_07_01");	//��, � ���� ������-�� ����?
	AI_Output(other,self,"DIA_Cipher_Hello_15_02");	//��������...
	AI_Output(self,other,"DIA_Cipher_Hello_07_03");	//� �������� �������� ������ � �������, �������?
};


instance DIA_Cipher_TradeWhat(C_Info)
{
	npc = SLD_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_TradeWhat_Condition;
	information = DIA_Cipher_TradeWhat_Info;
	permanent = FALSE;
	description = "� ��� �� �������� ������?";
};


func int DIA_Cipher_TradeWhat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_Hello))
	{
		return TRUE;
	};
};

func void DIA_Cipher_TradeWhat_Info()
{
	AI_Output(other,self,"DIA_Cipher_TradeWhat_15_00");	//� ��� �� �������� ������?
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_01");	//��, �� ���������.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_02");	//� ������ � ����� �� ������� ����� ��� �������� �����.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_03");	//������ �������� �� ����� ������ �������� ������. � ���� ���� ��������� ��������� ��������� �� ����.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_04");	//�� �����-�� ������� ����� ��� ����� �� ����� �������!
	Log_CreateTopic(TOPIC_SoldierTrader,LOG_NOTE);
	B_LogEntries(TOPIC_SoldierTrader,"����� - �������� �� ����� �����.");
	Log_CreateTopic(TOPIC_CipherPaket,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CipherPaket,LOG_Running);
	B_LogNextEntry(TOPIC_CipherPaket,"������� ����� ������� ��� �������� �����.");
	if(!Npc_IsDead(Bodo))
	{
		AI_Output(self,other,"DIA_Cipher_TradeWhat_07_05");	//� ����� ������, ��� ��� ����. �� ���� � ��� �� �������, ��� � �, � ������ ���������� ��� �������, ��� �����...
		Log_AddEntry(TOPIC_CipherPaket,"�� �����������, ��� ��� ����� ����.");
	};
	MIS_Cipher_Paket = LOG_Running;
};


instance DIA_Cipher_DoWithThief(C_Info)
{
	npc = SLD_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_DoWithThief_Condition;
	information = DIA_Cipher_DoWithThief_Info;
	permanent = FALSE;
	description = "� ��� �� ����������� ������ � �����?";
};


func int DIA_Cipher_DoWithThief_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_TradeWhat) && !Npc_KnowsInfo(other,DIA_Cipher_DarDieb))
	{
		return TRUE;
	};
};

func void DIA_Cipher_DoWithThief_Info()
{
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_00");	//� ��� �� ����������� ������ � �����?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_01");	//�����-������ � ������ ���, ����� �� ����� ������ ��� �����.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_02");	//� ����� � ����� �������� �������� � �������� ��� ����, ������� �� �� ����� �������.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_03");	//���� � ������� ��� ����� �����, ������� �����, �� ������ � ��������, � ���� ����������� �� ���.
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_04");	//��� ������?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_05");	//��� ������. �� �� ����� ��������� ��������, ����� �� �������� ��� ��������� �������� �����. ��� ������������ ����.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_06");	//� ��� ������ ����������, ��� ������� ��� ����������. � ����� ����� ������.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_07");	//��� ��� ��� ����� ����� ������� ��������� � ����...
};


instance DIA_Cipher_WannaJoin(C_Info)
{
	npc = SLD_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_WannaJoin_Condition;
	information = DIA_Cipher_WannaJoin_Info;
	permanent = FALSE;
	description = "� ���� �������������� � ����� ��!";
};


func int DIA_Cipher_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_Hello) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Cipher_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_00");	//� ���� �������������� � ����� ��!
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_01");	//����� ��?! ���� �� ����� ���������� � ��� �� ����, ��� ����� ���������� ���� ��� ������!
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_02");	//������?
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_03");	//�� ������ ��� ����� ���������. � � ������� �� ��� ���� ��� ��.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_04");	//�� ��������� ����� ��� ����� �� �������. �� ����� ������ ������ ����� � �����, ���� �������� �� ������ � ������.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_05");	//������� ������, ��� �� ������ ���������� ������� �� ��������� ������ � ������.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_06");	//� �����, ��� ���� �� ������������ ����� ����������.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_07");	//� ������ ����������� �� ��� ������ ���� ������� �����. � �� ��� ����� ������ ��������������?
};


func void B_CipherHappyForWeedPaket()
{
	AI_Output(self,other,"DIA_Cipher_Joints_07_01");	//�� ������ ����� ��� ���! ������ ��� ����� �������!
	if((other.guild == GIL_NONE) && (GotCipherVote == FALSE))
	{
		AI_Output(self,other,"DIA_Cipher_Joints_07_02");	//� ����������� ���������� �� ����...
		if(Torlof_GenugStimmen == FALSE)
		{
			Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
		};
		B_LogEntry(TOPIC_SLDRespekt,"����� ����������� �� ����, ����� � ���� �������������� � ���������.");
		SCKnowsSLDVotes = TRUE;
		GotCipherVote = TRUE;
	};
	if(MIS_Cipher_BringWeed == LOG_Running)
	{
		MIS_Cipher_BringWeed = LOG_SUCCESS;
		B_GivePlayerXP(XP_CipherWeed);
	};
};

instance DIA_Cipher_YesJoin(C_Info)
{
	npc = SLD_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_YesJoin_Condition;
	information = DIA_Cipher_YesJoin_Info;
	permanent = FALSE;
	description = "� ��� ����� ���� ����� ����� �� ���!";
};


func int DIA_Cipher_YesJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_WannaJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Cipher_YesJoin_Info()
{
	AI_Output(other,self,"DIA_Cipher_YesJoin_15_00");	//� ��� ����� ���� ����� ����� �� ���!
	if(MIS_Cipher_Paket == LOG_SUCCESS)
	{
		B_CipherHappyForWeedPaket();
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_YesJoin_07_01");	//�� ��� ������, ��� �� �������� �� ������� ����������?
		AI_Output(other,self,"DIA_Cipher_YesJoin_15_02");	//�� ��� �� ���������?
		AI_Output(self,other,"DIA_Cipher_YesJoin_07_03");	//��, � ��� ����� ������ �� �����. ������� ��� ��������� ������� �� �������� �����, � �� �������� ��� �����.
		AI_Output(self,other,"DIA_Cipher_YesJoin_07_04");	//� ������, ���� ������� ���-������ �����.
		SCKnowsSLDVotes = TRUE;
		MIS_Cipher_BringWeed = LOG_Running;
		Log_CreateTopic(TOPIC_CipherHerb,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CipherHerb,LOG_Running);
		B_LogEntry(TOPIC_CipherHerb,"����� ����������� �� ����, ���� � ������� ��� ��������� ������� �������� �����.");
	};
};


instance DIA_Cipher_Joints(C_Info)
{
	npc = SLD_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_Joints_Condition;
	information = DIA_Cipher_Joints_Info;
	permanent = TRUE;
	description = "������ �������� �����...";
};


func int DIA_Cipher_Joints_Condition()
{
	if(MIS_Cipher_BringWeed == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Cipher_Joints_Info()
{
	AI_Output(other,self,"DIA_Cipher_Joints_15_00");	//������ �������� �����...
	if(MIS_Cipher_Paket == LOG_SUCCESS)
	{
		B_CipherHappyForWeedPaket();
	}
	else
	{
		Info_ClearChoices(DIA_Cipher_Joints);
		Info_AddChoice(DIA_Cipher_Joints,"���������, ��� ����� �������...",DIA_Cipher_Joints_Running);
		if(Npc_HasItems(other,ItMi_Joint))
		{
			Info_AddChoice(DIA_Cipher_Joints,"��� ��������� ������� ��� ����...",DIA_Cipher_Joints_Success);
		};
	};
};

func void DIA_Cipher_Joints_Running()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Running_15_00");	//���������, ��� ����� �������...
	Info_ClearChoices(DIA_Cipher_Joints);
};

func void DIA_Cipher_Joints_Success()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Success_15_00");	//��� ��������� ������� ��� ����...
	if(B_GiveInvItems(other,self,ItMi_Joint,10))
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_01");	//��! � �� ��� �������!
		if((other.guild == GIL_NONE) && (GotCipherVote == FALSE))
		{
			AI_Output(self,other,"DIA_Cipher_Joints_Success_07_05");	//�����, �� �������� ��� �����.
			if(Torlof_GenugStimmen == FALSE)
			{
				Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
			};
			B_LogEntry(TOPIC_SLDRespekt,"����� ����������� �� ����, ����� � ���� �������������� � ���������.");
			SCKnowsSLDVotes = TRUE;
			GotCipherVote = TRUE;
		};
		MIS_Cipher_BringWeed = LOG_SUCCESS;
		B_GivePlayerXP(XP_CipherWeed);
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_03");	//��� ���? �� � ������ ��� �� ���� �������!
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_04");	//��� ����� ���� �� 10 �������.
	};
	Info_ClearChoices(DIA_Cipher_Joints);
};


instance DIA_Cipher_TRADE(C_Info)
{
	npc = SLD_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_TRADE_Condition;
	information = DIA_Cipher_TRADE_Info;
	permanent = TRUE;
	description = DIALOG_TRADE_v4;
	trade = TRUE;
};


func int DIA_Cipher_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};

func void DIA_Cipher_TRADE_Info()
{
	AI_Output(other,self,"DIA_Cipher_TRADE_15_00");	//������ ��� ���� ������.
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
	if(!Npc_HasItems(self,ItPl_SwampHerb) && !Npc_HasItems(self,ItMi_Joint) && !Npc_HasItems(self,ItMi_Addon_Joint_01))
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_02");	//� ���� ������ ��� �������� �����. �� ������ ���-������ ���?
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_01");	//�������. �������.
	};
};


func void B_Cipher_DarLost()
{
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_03");	//���� ������� ������� �� ������ ��� ������ � ��� ������!
};

instance DIA_Cipher_DarDieb(C_Info)
{
	npc = SLD_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_DarDieb_Condition;
	information = DIA_Cipher_DarDieb_Info;
	permanent = FALSE;
	description = "� ����, ��� ���� ���� �����.";
};


func int DIA_Cipher_DarDieb_Condition()
{
	if((Dar_Dieb == TRUE) && (Sipher_KnowsDarStoleHisWeed == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cipher_DarDieb_Info()
{
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_00");	//� ����, ��� ���� ���� �����.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_01");	//���? ��� ��� ����?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_02");	//���, ��� ������ ���� �� ��������� - ���.
	Sipher_KnowsDarStoleHisWeed = TRUE;
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		AI_Output(self,other,"DIA_Cipher_DarDieb_07_03");	//���� �������! ��� ��?
		AI_Output(other,self,"DIA_Cipher_DarDieb_15_04");	//���� ���� �� ������� ���, ��� ���� �� �������, � ���� ������ ��� ����� ����. �� ������ ��� � ��������.
		AI_Output(self,other,"DIA_Cipher_DarDieb_07_05");	//��� ��?!
		if(!Npc_IsDead(Dar))
		{
			AI_Output(other,self,"DIA_Cipher_DarDieb_15_06");	//�� ������, �� ����...
			AI_Output(self,other,"DIA_Cipher_DarDieb_07_07");	//� �������� ���!
			AI_StopProcessInfos(self);
			other.aivar[AIV_INVINCIBLE] = FALSE;
			if(Npc_GetDistToNpc(self,Dar) > FIGHT_DIST_CANCEL)
			{
				self.aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL * 2;
			};
			B_Attack(self,Dar,AR_NONE,0);
		}
		else
		{
			DIA_Common_HeIsDead();
			B_Cipher_DarLost();
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		B_Cipher_DarLost();
		B_GivePlayerXP(XP_AmbientKap1);
		AI_StopProcessInfos(self);
	};
};


instance DIA_Cipher_DarLOST(C_Info)
{
	npc = SLD_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_DarLOST_Condition;
	information = DIA_Cipher_DarLOST_Info;
	permanent = FALSE;
	description = "�� ������ �� ���� ��������... ������ ���� �����?";
};


func int DIA_Cipher_DarLOST_Condition()
{
	if(Dar_LostAgainstCipher == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cipher_DarLOST_Info()
{
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_00");	//�� ������ �� ���� ��������... ������ ���� �����?
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_01");	//(��������) ��, ������� �����.
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_02");	//�� �� ��� ����, � �������...
	B_Cipher_DarLost();
	B_GivePlayerXP(XP_Ambient * 2);
};


instance DIA_Cipher_KrautPaket(C_Info)
{
	npc = SLD_803_Cipher;
	nr = 2;
	condition = DIA_Cipher_KrautPaket_Condition;
	information = DIA_Cipher_KrautPaket_Info;
	permanent = FALSE;
	description = "��� �������� �� ���� ��� �������� �����?";
};


func int DIA_Cipher_KrautPaket_Condition()
{
	if(Npc_HasItems(other,ItMi_HerbPaket) && (MIS_Cipher_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Cipher_KrautPaket_Info()
{
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_00");	//��� �������� �� ���� ��� �������� �����?
	B_GiveInvItems(other,self,ItMi_HerbPaket,1);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_01");	//��, ���! ��� �� ����� ���?
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_02");	//��� ������ �������...
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_03");	//�����, ��� �� �����, �� ������ � ����, ��� �� ��� �������.
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Cipher_WannaJoin) && (GotCipherVote == FALSE))
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_02");	//�� �������� ��� �����.
		if(Torlof_GenugStimmen == FALSE)
		{
			Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
		};
		B_LogEntry(TOPIC_SLDRespekt,"����� ����������� �� ����, ����� � ���� �������������� � ���������.");
		SCKnowsSLDVotes = TRUE;
		GotCipherVote = TRUE;
	};
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_04");	//��, ������ ��� � �������.
	CreateInvItems(other,ItMi_Joint,10);
	CreateInvItems(other,ItMi_Gold,200);
	AI_PrintScreen("10 ������� ��������",-1,43,FONT_ScreenSmall,3);
	AI_PrintScreen("200 ������� ��������",-1,40,FONT_ScreenSmall,3);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_05");	//������ � ������ ���� ��������...
	Npc_RemoveInvItem(self,ItMi_HerbPaket);
	CreateInvItems(self,ItMi_Joint,30);
	MIS_Cipher_Paket = LOG_SUCCESS;
	B_GivePlayerXP(XP_CipherPaket);
};

