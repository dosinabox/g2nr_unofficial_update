
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
	Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry(Topic_SoldierTrader,"����� - �������� �� ����� �����.");
	Log_CreateTopic(Topic_CipherPaket,LOG_MISSION);
	Log_SetTopicStatus(Topic_CipherPaket,LOG_Running);
	B_LogEntry(Topic_CipherPaket,"������� ����� ������� ��� �������� �����.");
	if(!Npc_IsDead(Bodo))
	{
		AI_Output(self,other,"DIA_Cipher_TradeWhat_07_05");	//� ����� ������, ��� ��� ����. �� ���� � ��� �� �������, ��� � �, � ������ ���������� ��� �������, ��� �����...
		B_LogEntry(Topic_CipherPaket,"�� �����������, ��� ��� ����� ����.");
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
	if(Npc_KnowsInfo(other,DIA_Cipher_TradeWhat))
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
	B_GivePlayerXP(XP_CipherWeed);
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
		B_GivePlayerXP(XP_CipherWeed);
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_YesJoin_07_01");	//�� ��� ������, ��� �� �������� �� ������� ����������?
		AI_Output(other,self,"DIA_Cipher_YesJoin_15_02");	//�� ��� �� ���������?
		AI_Output(self,other,"DIA_Cipher_YesJoin_07_03");	//��, � ��� ����� ������ �� �����. ������� ��� ��������� ������� �� �������� �����, � �� �������� ��� �����.
		AI_Output(self,other,"DIA_Cipher_YesJoin_07_04");	//� ������, ���� ������� ���-������ �����.
		SCKnowsSLDVotes = TRUE;
		MIS_Cipher_BringWeed = LOG_Running;
		Log_CreateTopic(Topic_CipherHerb,LOG_MISSION);
		Log_SetTopicStatus(Topic_CipherHerb,LOG_Running);
		B_LogEntry(Topic_CipherHerb,"����� ����������� �� ����, ���� � ������� ��� ��������� ������� �������� �����.");
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
		MIS_Cipher_BringWeed = LOG_SUCCESS;
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
	if(Npc_HasItems(self,ItMi_Joint))
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_01");	//�������. �������.
	}
	else if(!Npc_HasItems(self,ItPl_SwampHerb))
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_02");	//� ���� ������ ��� �������� �����. �� ������ ���-������ ���?
	};
	Trade_IsActive = TRUE;
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
	if(((Dar_Dieb == TRUE) || (Dar_Verdacht == TRUE)) && !Npc_IsDead(Dar))
	{
		return TRUE;
	};
};

func void DIA_Cipher_DarDieb_Info()
{
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_00");	//� ����, ��� ���� ���� �����.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_01");	//���? ��� ��� ����?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_02");	//���, ��� ������ ���� �� ��������� - ���.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_03");	//���� �������! ��� ��?
	if((Dar_Dieb == TRUE) || (DIA_Kardif_Paket_perm == TRUE))
	{
		AI_Output(other,self,"DIA_Cipher_DarDieb_15_04");	//���� ���� �� ������� ���, ��� ���� �� �������, � ���� ������ ��� ����� ����. �� ������ ��� � ��������.
		AI_Output(self,other,"DIA_Cipher_DarDieb_07_05");	//��� ��?!
	};
	if(!Npc_IsDead(Dar))
	{
		AI_Output(other,self,"DIA_Cipher_DarDieb_15_06");	//�� ������, �� ����...
		AI_Output(self,other,"DIA_Cipher_DarDieb_07_07");	//� �������� ���!
		AI_StopProcessInfos(self);
		other.aivar[AIV_INVINCIBLE] = FALSE;
		B_Attack(self,Dar,AR_NONE,0);
	}
	else
	{
		AI_Output(other,self,"DIA_Lobart_VINOTOT_15_01");	//�� �����.
		AI_Output(self,other,"DIA_Cipher_DarLOST_07_03");	//���� ������� ������� �� ������ ��� ������ � ��� ������!
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
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_03");	//���� ������� ������� �� ������ ��� ������ � ��� ������!
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
	Npc_RemoveInvItems(self,ItMi_Joint,10);
	CreateInvItems(other,ItMi_Joint,10);
	CreateInvItems(other,ItMi_Gold,200);
	AI_PrintScreen("10 ������� ��������",-1,43,FONT_ScreenSmall,4);
	AI_PrintScreen("200 ������� ��������",-1,40,FONT_ScreenSmall,4);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_05");	//������ � ������ ���� ��������...
	Npc_RemoveInvItems(self,ItMi_HerbPaket,1);
	CreateInvItems(self,ItMi_Joint,40);
	MIS_Cipher_Paket = LOG_SUCCESS;
	B_GivePlayerXP(XP_CipherPaket);
};


instance DIA_CipherSLD_PICKPOCKET(C_Info)
{
	npc = SLD_803_Cipher;
	nr = 900;
	condition = DIA_CipherSLD_PICKPOCKET_Condition;
	information = DIA_CipherSLD_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_CipherSLD_PICKPOCKET_Condition()
{
	return C_Beklauen(65,65);
};

func void DIA_CipherSLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_CipherSLD_PICKPOCKET);
	Info_AddChoice(DIA_CipherSLD_PICKPOCKET,Dialog_Back,DIA_CipherSLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_CipherSLD_PICKPOCKET,DIALOG_PICKPOCKET,DIA_CipherSLD_PICKPOCKET_DoIt);
};

func void DIA_CipherSLD_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_CipherSLD_PICKPOCKET);
};

func void DIA_CipherSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_CipherSLD_PICKPOCKET);
};

