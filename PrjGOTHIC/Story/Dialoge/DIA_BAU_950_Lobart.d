
instance DIA_Lobart_EXIT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 999;
	condition = DIA_Lobart_EXIT_Condition;
	information = DIA_Lobart_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lobart_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lobart_EXIT_Info()
{
	if((Kapitel < 3) && !Npc_HasEquippedArmor(other))
	{
		PlayerVisitedLobartFarmArmorless = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_STOLENCLOTHS(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_STOLENCLOTHS_Condition;
	information = DIA_Lobart_STOLENCLOTHS_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lobart_STOLENCLOTHS_Condition()
{
	if(!Mob_HasItems("CHEST_LOBART",ITAR_Bau_L) && (Lobart_Kleidung_Verkauft == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lobart_STOLENCLOTHS_Info()
{
	if(ArmorEquipped(other,ITAR_Bau_L))
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_00");	//� �� ���� �������� ����� ������! ���� ������� ����������� � ���� ������!
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_01");	//��, ��!
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_02");	//����� �� ��� ��� ��������� ���, �� ����� ������� ������� ����!
	};
	if(Npc_KnowsInfo(other,DIA_Lobart_WorkNOW))
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_03");	//�� ��� �� ���������� ����� ������ ����, ����� ������ � ���� ����, ������� ����������!
	};
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_04");	//����� ���������� ��� ������!
	Info_ClearChoices(DIA_Lobart_STOLENCLOTHS);
	Info_AddChoice(DIA_Lobart_STOLENCLOTHS,"������ �� ����!",DIA_Lobart_STOLENCLOTHS_ForgetIt);
	if(Npc_HasItems(other,ITAR_Bau_L))
	{
		Info_AddChoice(DIA_Lobart_STOLENCLOTHS,"�����, ������ ������� �� �����.",DIA_Lobart_STOLENCLOTHS_HereYouGo);
	}
	else
	{
		Info_AddChoice(DIA_Lobart_STOLENCLOTHS,"� ���� �� ���.",DIA_Lobart_STOLENCLOTHS_DontHaveIt);
		Info_AddChoice(DIA_Lobart_STOLENCLOTHS,"������� ����� ��� ������� ������?",DIA_Lobart_STOLENCLOTHS_HowMuch);
	};
};

func void DIA_Lobart_STOLENCLOTHS_HereYouGo()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_HereYouGo_15_00");	//�����, ������ ������� �� �����.
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_HereYouGo_05_01");	//���� ��� ���� �����, �� ������ ��������� �� ���!
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_HereYouGo_05_02");	//(���������) � ������ ��� �������!
	B_GiveInvItems(other,self,ITAR_Bau_L,1);
	Info_ClearChoices(DIA_Lobart_STOLENCLOTHS);
};

func void DIA_Lobart_STOLENCLOTHS_DontHaveIt()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_DontHaveIt_15_00");	//� ���� �� ���.
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_DontHaveIt_05_01");	//�� ��� ������ ��, ��? (���) � ������ ����, ������!
	Lobart_Kleidung_gestohlen = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_Theft,1);
};

func void DIA_Lobart_STOLENCLOTHS_ForgetIt()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_ForgetIt_15_00");	//������ �� ����!
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_ForgetIt_05_01");	//(���) � ������ ����, ������!
	Lobart_Kleidung_gestohlen = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_Theft,1);
};

func void DIA_Lobart_STOLENCLOTHS_HowMuch()
{
	AI_Output(other,self,"DIA_Lobart_BuyClothes_15_00");	//������� ����� ��� ������� ������?
	B_Say_Gold(self,other,80);
	AI_Output(self,other,"DIA_Lobart_GOLD_05_06");	//� ������� � �� �� �����.
	if(Npc_HasItems(other,ItMi_Gold) >= 80)
	{
		Info_AddChoice(DIA_Lobart_STOLENCLOTHS,"������, � �������, �� �� ���������� ��� ������.",DIA_Lobart_STOLENCLOTHS_GiveGold);
	};
};

func void DIA_Lobart_STOLENCLOTHS_GiveGold()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Ja_15_00");	//������, � �������, �� �� ���������� ��� ������.
	B_GiveInvItems(other,self,ItMi_Gold,80);
	AI_Output(self,other,"DIA_Lobart_DMT_05_01");	//��� ��� ����������.
	Lobart_Kleidung_Verkauft = TRUE;
	LobartGotGoldForStolenClothes = TRUE;
	B_CheckLog();
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_Hallo(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 2;
	condition = DIA_Lobart_Hallo_Condition;
	information = DIA_Lobart_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lobart_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lobart_Hallo_Info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_Hallo_05_00");	//��� �� ��� ���������� �� ���� �����?
		AI_Output(self,other,"DIA_Lobart_Hallo_05_01");	//�� �� ���� �������? �� ������� ���������� �������� ��� �� ������� ������?
		Info_ClearChoices(DIA_Lobart_Hallo);
		Info_AddChoice(DIA_Lobart_Hallo,"� �� �������...",DIA_Lobart_Hallo_What);
		Info_AddChoice(DIA_Lobart_Hallo,"� �� ������!",DIA_Lobart_Hallo_ForTheKing);
		Info_AddChoice(DIA_Lobart_Hallo,"� � �����������!",DIA_Lobart_Hallo_ForThePeasants);
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_Hallo_05_02");	//��� ���� ���� �������?
	};
};

func void DIA_Lobart_Hallo_ForThePeasants()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_ForThePeasants_15_00");	//� � �����������!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_01");	//��! ���� ������ ������� ���� ������ ��� ���� � ������!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_02");	//��� �� �������, ��� ����� ��� ����� ����� ��������?
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_03");	//����� ����, ��� ������ ����, ���� ����� �����, ��� ����.
	Lobart_AgainstKing = TRUE;
	Info_ClearChoices(DIA_Lobart_Hallo);
};

func void DIA_Lobart_Hallo_ForTheKing()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_ForTheKing_15_00");	//� �� ������!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_01");	//(������������) '�� ������!' ����� �������� � ��������� ���������, ����� ������� �������� ���� ����.
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_02");	//�� ��� ��, ������������, ��� �������, ����� ����� �������� ��� �� ��������? � ��� ��� ����������, ����� ���� ���������� ����?
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_03");	//� ����� ����: � ������, �� �������� ���������� �������.
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_04");	//��� ��� ������ ���� � �����, ������ �� ����� �������.
	Lobart_AgainstKing = FALSE;
	Info_ClearChoices(DIA_Lobart_Hallo);
};

func void DIA_Lobart_Hallo_What()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_What_15_00");	//� �� �������...
	AI_Output(self,other,"DIA_Lobart_Hallo_What_05_01");	//���?! �� ������� ���� ��������, �������! � ���� �����, �� ���� �� �������! ��� �� ���� ��?!
};


func void B_StartLobartClothesTopic()
{
	Log_CreateTopic(TOPIC_Kleidung,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Kleidung,LOG_Running);
	B_LogEntry(TOPIC_Kleidung,"������ ������ ����� ������� ��� ������� ������. �� ����� ������� ���� �� ������, ���� � ��������� �� ��� �����. ��� ������ � ������, ��� ������� ��������� ��� ������.");
};

instance DIA_Lobart_KLEIDUNG(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 2;
	condition = DIA_Lobart_KLEIDUNG_Condition;
	information = DIA_Lobart_KLEIDUNG_Info;
	permanent = FALSE;
	description = "��� ����� ��������� ������!";
};


func int DIA_Lobart_KLEIDUNG_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Lobart_STOLENCLOTHS) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lobart_KLEIDUNG_Info()
{
	AI_Output(other,self,"DIA_Lobart_KLEIDUNG_15_00");	//��� ����� ��������� ������!
	AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_01");	//� ���� ���� ���� ��������� ������������ ������� ������.
	AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_02");	//�� ������ ��������� �� ���?
	if(!Npc_KnowsInfo(other,DIA_Lobart_WorkNOW))
	{
		AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_03");	//�� ��� �� ���������� ����� �� ���������... ���� �� ���� �� ���, ��� ���� ������.
		B_StartLobartClothesTopic();
	};
};


instance DIA_Lobart_BuyClothes(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 2;
	condition = DIA_Lobart_BuyClothes_Condition;
	information = DIA_Lobart_BuyClothes_Info;
	permanent = TRUE;
	description = "������� ����� ��� ������� ������?";
};


func int DIA_Lobart_BuyClothes_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_KLEIDUNG) || (Npc_KnowsInfo(other,DIA_Lobart_STOLENCLOTHS) && (Lobart_Kleidung_gestohlen == FALSE)))
	{
		if((Lobart_Kleidung_Verkauft == FALSE) && (other.guild == GIL_NONE))
		{
			return TRUE;
		};
	};
};

var int DIA_Lobart_BuyClothes_Once;

func void DIA_Lobart_BuyClothes_Info()
{
	Wert_LobartsRuestung = 80;
	AI_Output(other,self,"DIA_Lobart_BuyClothes_15_00");	//������� ����� ��� ������� ������?
	AI_Output(self,other,"DIA_Lobart_BuyClothes_05_01");	//���. ���������...
	if(Npc_KnowsInfo(other,DIA_Lobart_STOLENCLOTHS))
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_02");	//����� �� ��� ��� ��������� ���, �� ����� ������� ������� ����!
		Wert_LobartsRuestung += 20;
	};
	if(Lobart_AgainstKing == TRUE)
	{
		Wert_LobartsRuestung -= 10;
	};
	if(LobartClothesDiscount == TRUE)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_02");	//�� ������� ��� ���� �� ����.
		Wert_LobartsRuestung -= 10;
	};
	if(MIS_Hilda_PfanneKaufen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_03");	//�� ����� ���� ����.
		Wert_LobartsRuestung -= 10;
	};
	if(MIS_Vino_Wein == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_04");	//���� �������, ��� �� ����� ����� ���. � ��� ���-��� �� ������ - ������ �� �� �����-�� ����� � ��������� �����������.
		Wert_LobartsRuestung -= 10;
	};
	if(MIS_Maleth_Bandits == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_05");	//����� �������, ��� �� ������� ��������. ��� ������� ���������� ��� ����� �������. �������, ��� ������� ��� �� ���!
		Wert_LobartsRuestung -= 10;
	};
	B_Say_Gold(self,other,Wert_LobartsRuestung);
	if(Wert_LobartsRuestung == 30)
	{
		AI_Output(self,other,"DIA_Lobart_GOLD_05_06");	//� ������� � �� �� �����.
		if(DIA_Lobart_BuyClothes_Once == FALSE)
		{
			B_LogEntry(TOPIC_Kleidung,"�� �� �� ������� �� ��� ������, ��� �� 30 ������� �����.");
			DIA_Lobart_BuyClothes_Once = TRUE;
		};
	};
	Info_ClearChoices(DIA_Lobart_BuyClothes);
	Info_AddChoice(DIA_Lobart_BuyClothes,"��� ��� ��� ������� ������ ��� ����.",DIA_Lobart_BuyClothes_NotYet);
	Info_AddChoice(DIA_Lobart_BuyClothes,B_BuildPriceString("������ ������� ������. ������: 15/10/0/0.",Wert_LobartsRuestung),DIA_Lobart_BuyClothes_BUY);
};

func void DIA_Lobart_BuyClothes_BUY()
{
	AI_Output(other,self,"DIA_Lobart_BuyClothes_BUY_15_00");	//����� ����� ���� ��� ������� ������.
	if(B_GiveInvItems(other,self,ItMi_Gold,Wert_LobartsRuestung))
	{
		if(Npc_HasItems(self,ITAR_Bau_L))
		{
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_01");	//������, ��� �������. ������� ����� � ���� ���������. ���, �����!
			B_GiveInvItems(self,other,ITAR_Bau_L,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_02");	//� ���� ���� ���� ������, ��� �� ������� ����������� ����.
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_03");	//�� ���� �� ����� ����� ���-������ ��� ��� ����������!
			self.aivar[AIV_IGNORE_Theft] = TRUE;
			if(!Npc_IsDead(Hilda))
			{
				Hilda.aivar[AIV_IGNORE_Theft] = TRUE;
			};
		};
		Lobart_Kleidung_Verkauft = TRUE;
		B_CheckLog();
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_04");	//� ���� ������������ ������!
	};
	Info_ClearChoices(DIA_Lobart_BuyClothes);
};

func void DIA_Lobart_BuyClothes_NotYet()
{
	AI_Output(other,self,"DIA_Lobart_BuyClothes_NotYet_15_00");	//��� ��� ��� ������� ������ ��� ����.
	AI_Output(self,other,"DIA_Lobart_BuyClothes_NotYet_05_01");	//��� ������...
	Info_ClearChoices(DIA_Lobart_BuyClothes);
};


instance DIA_Lobart_AufstandInfo(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_AufstandInfo_Condition;
	information = DIA_Lobart_AufstandInfo_Info;
	permanent = FALSE;
	description = "��� ���� ����� ����?";
};


func int DIA_Lobart_AufstandInfo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_Hallo) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_AufstandInfo_Info()
{
	AI_Output(other,self,"DIA_Lobart_AufstandInfo_15_00");	//��� ���� ����� ����?
	AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_01");	//�� �� ������, ��� ����� ���� ����? �������, �� ������ ������ ��������? �� �� ������ ����������� �����!
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_02");	//�� ���������� ������� ������� ������� ����, ���������� ������, ������ ������������.
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_03");	//�� � ��� ���, ��� � ������� ������ ��������, ��������� ������ ������������ � ��� ��� ���� � ���� - � ������� ��������� ��� ��� ����� ������� ���, ��� � ��� ����.
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_04");	//���� ��� ����� ������������ � ������, � ��� ������ �� ��������� ��� ����� ����.
	};
	AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_05");	//��������� ������� ����� ���������! ���� ��� ������ �� ���!
};


instance DIA_Lobart_OnarStory(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_OnarStory_Condition;
	information = DIA_Lobart_OnarStory_Info;
	permanent = FALSE;
	description = "�������� ��� ��������� �� ���� �����...";
};


func int DIA_Lobart_OnarStory_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_AufstandInfo) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_OnarStory_Info()
{
	AI_Output(other,self,"DIA_Lobart_OnarStory_15_00");	//�������� ��� ��������� �� ���� �����...
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_01");	//�� ���� �������, ����� ���? ��� ������ � ���� ���������� ���� � ����� �����, ��� �� �� ������?
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_02");	//���� - ����� ������� ������ � ���� ���������. �� ������ ��������� � �������.
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_03");	//�������, �� ����� ���������, ����� �� �� ������� �� ��� ����� ��������� ������!
		if(other.guild != GIL_MIL)
		{
			AI_Output(self,other,"DIA_Lobart_OnarStory_05_04");	//�� ���� ������ ��� �� ���.
			AI_Output(self,other,"DIA_Lobart_OnarStory_05_05");	//��� �� �� �� ����, ������ �� ���� ����������� ������ �� ������������ ������� �� ��� �����.
		};
	};
};


instance DIA_Lobart_SldInfo(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_SldInfo_Condition;
	information = DIA_Lobart_SldInfo_Info;
	permanent = FALSE;
	description = "� ��� ��� ��������, ������� ����� ����?";
};


func int DIA_Lobart_SldInfo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_OnarStory) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_SldInfo_Info()
{
	AI_Output(other,self,"DIA_Lobart_SldInfo_15_00");	//� ��� ��� ��������, ������� ����� ����?
	AI_Output(self,other,"DIA_Lobart_SldInfo_05_01");	//� ���� ��� ���� �� ���� ������. ����������������, ����������� �� ��� - ������ ���������� �� �������.
	if(other.guild != GIL_SLD)
	{
		AI_Output(self,other,"DIA_Lobart_SldInfo_05_02");	//(������������) � ����, ������������, �� ��� ����� �������...
	};
};


instance DIA_Lobart_WhichSide(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_WhichSide_Condition;
	information = DIA_Lobart_WhichSide_Info;
	permanent = FALSE;
	description = "� ��� ������ ����? ��-�� �� ���� �������? �������� ��� ������?";
};


func int DIA_Lobart_WhichSide_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_AufstandInfo) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_WhichSide_Info()
{
	AI_Output(other,self,"DIA_Lobart_WhichSide_15_00");	//� ��� ������ ����? ��-�� �� ���� �������? �������� ��� ������?
	AI_Output(self,other,"DIA_Lobart_WhichSide_05_01");	//� ������� ������ � ������, ����� � ���� ���� ����������� ��������.
	AI_Output(self,other,"DIA_Lobart_WhichSide_05_02");	//�� � ���� ��� �����. � �� ��� ����� �� ����, ��� ������.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WhichSide_05_03");	//������ ���� ���� �����, � ���� ���������� ����� ��������� ������ ����, ��� �� ����� �������������� � ����.
		AI_Output(self,other,"DIA_Lobart_WhichSide_05_04");	//��� ������ ����������� �������� ��� ��� �� ������������, �� ���� ��� ������ �� �������� ������� ���� ������� ��� ������.
	};
};


instance DIA_Lobart_WorkNOW(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_WorkNOW_Condition;
	information = DIA_Lobart_WorkNOW_Info;
	permanent = FALSE;
	description = "� ��� ������.";
};


func int DIA_Lobart_WorkNOW_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_AufstandInfo) || Npc_KnowsInfo(other,DIA_Lobart_STOLENCLOTHS) || Npc_KnowsInfo(other,DIA_Lobart_KLEIDUNG))
	{
		if(Kapitel < 3)
		{
			return TRUE;
		};
	};
};

func void DIA_Lobart_WorkNOW_Info()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_15_00");	//� ��� ������.
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_01");	//��� �� ����� ��� ���� ���������� ��������. �� � ���� ���������� ���� �������� ������.
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_02");	//� ���� �������, �� ������ ������ �� ����. ����� ����� ��� ��������� �������� ���-����� ��������� ��� ����.
	if((hero.guild == GIL_NONE) && (LobartGotGoldForStolenClothes == FALSE))
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_05_03");	//� ���� ��������� ���� �������. ��� ���� ��������� ������.
		if(Lobart_Kleidung_Verkauft == FALSE)
		{
			AI_Output(self,other,"DIA_Lobart_WorkNOW_05_04");	//��� ������ ����� �������� ������. � �� ���� ������ ���� �� ������ ���, �� � ���� ������� ���� �� �������, ���� �� ����������� �� ����.
			if(!Npc_HasEquippedArmor(other))
			{
				AI_Output(self,other,"DIA_Lobart_WorkNOW_05_05");	//���� �� ����, ��� �� ���������, � �� ������: ���� ������.
			};
			if(!Npc_KnowsInfo(other,DIA_Lobart_KLEIDUNG))
			{
				B_StartLobartClothesTopic();
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Lobart_WorkNOW_05_06");	//�� � ���� ��� ���� ������, ��� ��� ��, ��������, �������� ������.
		};
	};
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_07");	//������ ��������� - �� ��������� ���� �� ������� ����� ������� ����.
	Info_ClearChoices(DIA_Lobart_WorkNOW);
	Info_AddChoice(DIA_Lobart_WorkNOW,"� ������ ������� ����? ��, ������ ����, ������!",DIA_Lobart_WorkNOW_WannaFoolMe);
	Info_AddChoice(DIA_Lobart_WorkNOW,"������...",DIA_Lobart_WorkNOW_Ok);
};

func void DIA_Lobart_WorkNOW_Ok()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_Ok_15_00");	//������...
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_Ok_05_01");	//����� ����������, ���� � �� ���������.
	};
	Log_CreateTopic(TOPIC_Rueben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Rueben,LOG_Running);
	if(Lobart_Kleidung_Verkauft == FALSE)
	{
		B_LogEntry(TOPIC_Rueben,"������ ������ �����, ����� � ������ ���� �� ����. �� ��� �� �������� ��� ������� ��� ������� ��� ������ �� ����������� ��������� ����.");
	}
	else
	{
		B_LogEntry(TOPIC_Rueben,"������ ������ �����, ����� � ������ ���� �� ����.");
	};
	MIS_Lobart_Rueben = LOG_Running;
	Info_ClearChoices(DIA_Lobart_WorkNOW);
};

func void DIA_Lobart_WorkNOW_WannaFoolMe()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_WannaFoolMe_15_00");	//� ������ ������� ����? ��, ������ ����, ������!
	AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_01");	//��������� ������� ������ �� ��� '����������� �����������', ��?
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_02");	//����� �� ���� ��� �������� � ���� �����!
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_03");	//������ � ���� ��� ������ ������ ��� ����.
	};
	Log_CreateTopic(TOPIC_Rueben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Rueben,LOG_Running);
	if(Lobart_Kleidung_Verkauft == FALSE)
	{
		B_LogEntry(TOPIC_Rueben,"������ ������ �����, ����� � ������ ���� �� ����. �� ��� �� �������� ��� ������� ��� ������� ��� ������ �� ����������� ��������� ����.");
	}
	else
	{
		B_LogEntry(TOPIC_Rueben,"������ ������ �����, ����� � ������ ���� �� ����.");
	};
	MIS_Lobart_Rueben = LOG_Running;
	Info_ClearChoices(DIA_Lobart_WorkNOW);
};


instance DIA_Lobart_RuebenRunning(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_RuebenRunning_Condition;
	information = DIA_Lobart_RuebenRunning_Info;
	permanent = TRUE;
	description = "��� ���� ����!";
};


func int DIA_Lobart_RuebenRunning_Condition()
{
	if((MIS_Lobart_Rueben == LOG_Running) && Npc_HasItems(other,ItPl_Beet) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_RuebenRunning_Info()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_00");	//��� ���� ����!
	if(Npc_HasItems(other,ItPl_Beet) >= 20)
	{
		if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_01");	//��, ������, �� �� ����� �� ����������, ��� ��������.
		};
		if(!Npc_IsDead(Hilda))
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_02");	//������ �� ���� ���� � ��� � ����� ��, ����� ��� ����������� ��.
			MIS_Lobart_RuebenToHilda = LOG_Running;
			Log_CreateTopic(TOPIC_Ruebenbringen,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Ruebenbringen,LOG_Running);
			B_LogEntry(TOPIC_Ruebenbringen,"� ������ ������� ��������� ���� ���� �������, ����������� � ����.");
		};
		MIS_Lobart_Rueben = LOG_SUCCESS;
		B_GivePlayerXP(XP_LobartHolRueben);
		AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_03");	//��� ������ ���� �����?
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_04");	//� ���� ���� ���� 5 ������� �����.
		if((Lobart_Kleidung_Verkauft == TRUE) || (hero.guild != GIL_NONE))
		{
			B_GiveInvItems(self,other,ItMi_Gold,5);
			if(hero.guild == GIL_NONE)
			{
				AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_02");	//������ �� ������ �� ��� �����.
			};
		}
		else if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_05");	//... ��� ������� ���� ������ �������. ��� ���������?
			Info_ClearChoices(DIA_Lobart_RuebenRunning);
			Info_AddChoice(DIA_Lobart_RuebenRunning,"����� ������ ������ �������!",DIA_Lobart_RuebenRunning_Billiger);
			Info_AddChoice(DIA_Lobart_RuebenRunning,"��� ��� 5 ������� �����!",DIA_Lobart_RuebenRunning_Gold);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_06");	//�� �� �� ������ � ��������!
		if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_07");	//�� ���, ���� ���������?! �������, ��� �������, ��� ��� �� ���, ����� ���� �������� ������ � ����� ���������!
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_08");	//����������� �� ���� � ������� ������! ������� ��� � ������ ����, ��� ���� ������!
		};
		AI_StopProcessInfos(self);
	};
};

func void DIA_Lobart_RuebenRunning_Gold()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_Gold_15_00");	//��� ��� 5 ������� �����!
	AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_01");	//�����.
	B_GiveInvItems(self,other,ItMi_Gold,5);
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_02");	//������ �� ������ �� ��� �����.
	};
	Info_ClearChoices(DIA_Lobart_RuebenRunning);
};

func void DIA_Lobart_RuebenRunning_Billiger()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_Billiger_15_00");	//����� ������ ������ �������!
	AI_Output(self,other,"DIA_Lobart_RuebenRunning_Billiger_05_01");	//������! � ����� ���� �� �� 10 ������� �������.
	LobartClothesDiscount = TRUE;
	Info_ClearChoices(DIA_Lobart_RuebenRunning);
};


instance DIA_Lobart_MoreWork(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_MoreWork_Condition;
	information = DIA_Lobart_MoreWork_Info;
	permanent = TRUE;
	description = "� ���� ���� ��� �����-������ ������ ��� ����?";
};


func int DIA_Lobart_MoreWork_Condition()
{
	if(((MIS_Lobart_Rueben == LOG_Running) || (MIS_Lobart_Rueben == LOG_SUCCESS)) && (Kapitel < 3))
	{
		if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			return TRUE;
		};
	};
};

func void DIA_Lobart_MoreWork_Info()
{
	AI_Output(other,self,"DIA_Lobart_MoreWork_15_00");	//� ���� ���� ��� �����-������ ������ ��� ����?
	if(MIS_Lobart_Rueben == LOG_Running)
	{
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_01");	//������� ������ ���� � ����. � ��� ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_02");	//���, �� �� ������ �������� � ���� ���� ��� ������ �� ����. ��������, �� ����� ������.
	};
};


instance DIA_Lobart_ANDREHELPLOBART(C_Info)
{
	npc = BAU_950_Lobart;
	condition = DIA_Lobart_ANDREHELPLOBART_Condition;
	information = DIA_Lobart_ANDREHELPLOBART_Info;
	description = "���� �������� � ���� �����. � ���� ���-������ ������ ����?";
};


func int DIA_Lobart_ANDREHELPLOBART_Condition()
{
	if(MIS_AndreHelpLobart == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Lobart_ANDREHELPLOBART_Info()
{
	AI_Output(other,self,"DIA_Lobart_ANDREHELPLOBART_15_00");	//���� �������� � ���� �����. � ���� ���-������ ������ ����?
	AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_01");	//��, �������. ���� ��� ������ �� ���� ��������� ������� ��������.
	AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_02");	//�������� �� ����. ���� �� �������, ���!
	B_LogEntry(TOPIC_Feldraeuber,"���� ������� ��������� �������� ���������. �� �����, ����� � ������� ��.");
	MIS_LobartKillBugs = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_BUGDEAD(C_Info)
{
	npc = BAU_950_Lobart;
	condition = DIA_Lobart_BUGDEAD_Condition;
	information = DIA_Lobart_BUGDEAD_Info;
	permanent = FALSE;
	description = "� ���������� � ����� �������!";
};


func int DIA_Lobart_BUGDEAD_Condition()
{
	if(MIS_LobartKillBugs == LOG_Running)
	{
		if(C_LobartBugsDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Lobart_BUGDEAD_Info()
{
	AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_00");	//� ���������� � ����� �������!
	AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_01");	//�������. �� �� ����� �� ������ ����������. � ������������ ���� �������. ���, ����� ������������.
	B_StartOtherRoutine(Vino,"Start");
	B_StartOtherRoutine(LobartsBauer1,"Start");
	B_StartOtherRoutine(LobartsBauer2,"Start");
	CreateInvItems(self,ItMi_Gold,20);
	B_GiveInvItems(self,other,ItMi_Gold,20);
	MIS_LobartKillBugs = LOG_SUCCESS;
	MIS_AndreHelpLobart = LOG_SUCCESS;
	B_CheckLog();
	Log_AddEntry(TOPIC_Feldraeuber,"���� ������� ������� �� ������� ��������. � ��������� �� ����.");
};


instance DIA_Lobart_BUGALIVE(C_Info)
{
	npc = BAU_950_Lobart;
	condition = DIA_Lobart_BUGALIVE_Condition;
	information = DIA_Lobart_BUGALIVE_Info;
	permanent = TRUE;
	description = "� �����, � ���������� �� ����� �������!";
};


func int DIA_Lobart_BUGALIVE_Condition()
{
	if(MIS_LobartKillBugs == LOG_Running)
	{
		if(!C_LobartBugsDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Lobart_BUGALIVE_Info()
{
	AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_02");	//� �����, � ���������� �� ����� �������!
	AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_03");	//�� ������� ������ ����. � ��� ��� ���� ��. ���� �� ������ ���� ������, ���� ������ ������ � �������.
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_DMT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 30;
	condition = DIA_Lobart_DMT_Condition;
	information = DIA_Lobart_DMT_Info;
	description = "��� ���� �����?";
};


func int DIA_Lobart_DMT_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_DMT_Info()
{
	AI_Output(other,self,"DIA_Lobart_DMT_15_00");	//��� ���� �����?
	AI_Output(self,other,"DIA_Lobart_DMT_05_01");	//��� ��� ����������.
	AI_Output(self,other,"DIA_Lobart_DMT_05_02");	//���������� ��������� ��� ����� � ������ ����� � ������������� �� ������ � �� ���� �����.
	Info_ClearChoices(DIA_Lobart_DMT);
	Info_AddChoice(DIA_Lobart_DMT,Dialog_Ende,DIA_Lobart_DMT_BACK);
	if((hero.guild == GIL_KDF) && (Vino_isAlive_Kap3 == TRUE))
	{
		AI_Output(self,other,"DIA_Lobart_DMT_05_03");	//��� ����� ���������� � ���-�� � ����, � ����� �������� ������ � ���.
		if(NpcObsessedByDMT_Vino == FALSE)
		{
			Info_AddChoice(DIA_Lobart_DMT,"���� ��� �������� ����?",DIA_Lobart_DMT_VinoWohin);
		};
		Info_AddChoice(DIA_Lobart_DMT,"����� � ��� ���� � ����?",DIA_Lobart_DMT_VinoWas);
	};
	if(!Npc_IsDead(Hilda) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Lobart_DMT_05_04");	//������ ����� ����� ��� ���� ����� ������ ��������. ��� ����� �� ������ � �������. � ��� ����� ������ �����.
		if(MIS_HealHilda != LOG_SUCCESS)
		{
			Info_AddChoice(DIA_Lobart_DMT,"������ �� �� �������� ���� � ������?",DIA_Lobart_DMT_FrauHeilen);
		};
	};
	AI_Output(self,other,"DIA_Lobart_DMT_05_05");	//��� ����� �����������!
	Info_AddChoice(DIA_Lobart_DMT,"������ �� ������ �� �������� � ����� ������ � ������?",DIA_Lobart_DMT_hof);
	Info_AddChoice(DIA_Lobart_DMT,"�� ������� � ������ � ������?",DIA_Lobart_DMT_spokeToThem);
};

func void DIA_Lobart_DMT_FrauHeilen()
{
	AI_Output(other,self,"DIA_Lobart_DMT_FrauHeilen_15_00");	//������ �� �� �������� ���� � ������?
	AI_Output(self,other,"DIA_Lobart_DMT_FrauHeilen_05_01");	//�� ������ ������� � ����� � �������, �� � � ����� �� �����, ���� �� ���� ����� ����� ����� ����.
	if(MIS_HealHilda == FALSE)
	{
		Log_CreateTopic(TOPIC_HealHilda,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_HealHilda,LOG_Running);
		B_LogEntry(TOPIC_HealHilda,"���� ������� ������ ������, �� � ������� ���� ���������, ������� ����� �������� ��.");
		MIS_HealHilda = LOG_Running;
	};
};

func void DIA_Lobart_DMT_BACK()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_Lobart_DMT_spokeToThem()
{
	AI_Output(other,self,"DIA_Lobart_DMT_spokeToThem_15_00");	//�� ������� � ������ � ������?
	AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_01");	//�������. �� ��� �� ����� ������ �������.
	AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_02");	//� �����, ��� ����-�� ����.
};

func void DIA_Lobart_DMT_hof()
{
	AI_Output(other,self,"DIA_Lobart_DMT_hof_15_00");	//������ �� ������ �� �������� � ����� ������ � ������?
	AI_Output(self,other,"DIA_Lobart_DMT_hof_05_01");	//� �� ����� �����. �� � �����, ��� ��� ������ ������ ������ ����������. ��� ��, �������.
	AI_Output(self,other,"DIA_Lobart_DMT_hof_05_02");	//�� ������� ���-�� ��������� ������!
};

func void DIA_Lobart_DMT_VinoWas()
{
	AI_Output(other,self,"DIA_Lobart_DMT_VinoWas_15_00");	//����� � ��� ���� � ����?
	AI_Output(self,other,"DIA_Lobart_DMT_VinoWas_05_01");	//��� �� �������. ��� ������ ����� ��� � �����.
};

func void DIA_Lobart_DMT_VinoWohin()
{
	AI_Output(other,self,"DIA_Lobart_DMT_VinoWohin_15_00");	//���� ��� �������� ����?
	AI_Output(self,other,"DIA_Lobart_DMT_VinoWohin_05_01");	//��� ����� �����, �� ���� ����.
};

instance DIA_Lobart_VINOTOT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 32;
	condition = DIA_Lobart_VINOTOT_Condition;
	information = DIA_Lobart_VINOTOT_Info;
	description = "���� �� ��������.";
};


func int DIA_Lobart_VINOTOT_Condition()
{
	if((Npc_IsDead(Vino) || (NpcObsessedByDMT_Vino == TRUE)) && Npc_KnowsInfo(other,DIA_Lobart_DMT) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Lobart_VINOTOT_Info()
{
	AI_Output(other,self,"DIA_Lobart_VINOTOT_15_00");	//���� �� ��������.
	if(Npc_IsDead(Vino))
	{
		DIA_Common_HeIsDead();
	}
	else
	{
		AI_Output(other,self,"DIA_Lobart_VINOTOT_15_02");	//��� ����� ��� � ���.
	};
	AI_Output(self,other,"DIA_Lobart_VINOTOT_05_03");	//�, �����. �������, ���� ���� ������ ����� ����������.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Lobart_PERM(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 80;
	condition = DIA_Lobart_PERM_Condition;
	information = DIA_Lobart_PERM_Info;
	permanent = TRUE;
	description = "������ ���� �����!";
};


func int DIA_Lobart_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_DMT) && (Kapitel >= 3))
	{
		if(Npc_KnowsInfo(other,DIA_Lobart_ORKSWEG) || Npc_KnowsInfo(other,DIA_Lobart_VINOTOT) || (MIS_HealHilda == LOG_SUCCESS))
		{
			return TRUE;
		};
	};
};

func void DIA_Lobart_PERM_Info()
{
	AI_Output(other,self,"DIA_Lobart_PERM_15_00");	//������ ���� �����!
	AI_Output(self,other,"DIA_Lobart_PERM_05_01");	//� ���������.
};


instance DIA_Lobart_ORKPROBLEM(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 41;
	condition = DIA_Lobart_ORKPROBLEM_Condition;
	information = DIA_Lobart_ORKPROBLEM_Info;
	description = "� ���� �������� � ������.";
};


func int DIA_Lobart_ORKPROBLEM_Condition()
{
	if((Kapitel >= 4) && ((other.guild == GIL_PAL) || (other.guild == GIL_DJG)) && Npc_KnowsInfo(other,DIA_Lobart_DMT))
	{
		if(!C_LobartOrksDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Lobart_ORKPROBLEM_Info()
{
	AI_Output(other,self,"DIA_Lobart_ORKPROBLEM_15_00");	//� ���� �������� � ������.
	AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_01");	//(���) ����. �� �����-������ ��� ��� ��������?!
	AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_02");	//���� ��� ����� ������������, ��� ����� �� ����� ������ � ���� ������� �����.
	Log_CreateTopic(TOPIC_LobartsOrkProblem,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LobartsOrkProblem,LOG_Running);
	B_LogEntry(TOPIC_LobartsOrkProblem,"�� ����� ������� ���������� ����. �� �����, ����� � ������� ��� �� ���.");
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_ORKSWEG(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 42;
	condition = DIA_Lobart_ORKSWEG_Condition;
	information = DIA_Lobart_ORKSWEG_Info;
	description = "� ������� ���� ����� �� �����.";
};


func int DIA_Lobart_ORKSWEG_Condition()
{
	if((Kapitel >= 4) && ((other.guild == GIL_PAL) || (other.guild == GIL_DJG)))
	{
		if(C_LobartOrksDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Lobart_ORKSWEG_Info()
{
	AI_Output(other,self,"DIA_Lobart_ORKSWEG_15_00");	//� ������� ���� ����� �� �����.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_01");	//������ �� ������� ��������, ��� �������� ������ �� ������ ��� ���, ������� ��������.
	};
	AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_02");	//����� ������. � �� ���� ���� ���� �� ��� �����, �� � �������, �� ������� ��� ���� �������������.
	B_StartOtherRoutine(Vino,"Start");
	B_StartOtherRoutine(LobartsBauer1,"Start");
	B_StartOtherRoutine(LobartsBauer2,"Start");
	TOPIC_END_LobartsOrkProblem = TRUE;
	B_GivePlayerXP(XP_KilledLobartOrks);
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
};

