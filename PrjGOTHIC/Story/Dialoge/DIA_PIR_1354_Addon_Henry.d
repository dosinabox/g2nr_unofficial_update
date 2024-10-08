
instance DIA_Addon_Henry_EXIT(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 999;
	condition = DIA_Addon_Henry_EXIT_Condition;
	information = DIA_Addon_Henry_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Henry_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Henry_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

func void B_Henry_Gold(var int gold)
{
	if(gold == 500)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold500_04_00");	//500 �������.
	}
	else if(gold == 400)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold400_04_00");	//400 �������.
	}
	else if(gold == 300)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold300_04_00");	//300 �������.
	}
	else if(gold == 200)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold200_04_00");	//200 �������.
	}
	else if(gold == 100)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold100_04_00");	//100 �������.
	}
	else
	{
		B_Say_Gold(self,other,gold);
	};
};


const string PIR_1354_Checkpoint = "ADW_PIRATECAMP_WAY_02";
var int Henry_FriendOrFoe;

instance DIA_Addon_Henry_Hello(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 5;
	condition = DIA_Addon_Henry_Hello_Condition;
	information = DIA_Addon_Henry_Hello_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Henry_Hello_Condition()
{
	if(Npc_GetDistToWP(other,PIR_1354_Checkpoint) <= 700)
	{
		if(self.aivar[AIV_PASSGATE] == FALSE)
		{
			Npc_SetRefuseTalk(self,5);
		};
		return FALSE;
	};
	if(C_NpcHasGuardStatus(self,PIR_1354_Checkpoint,GP_NONE) && !Npc_RefuseTalk(self))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Henry_Hello_04_00");	//����!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PIR_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	if(Henry_FriendOrFoe == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Hello_04_01");	//�� ���� ��� ����?
		Info_ClearChoices(DIA_Addon_Henry_Hello);
		Info_AddChoice(DIA_Addon_Henry_Hello,"����!",DIA_Addon_Henry_Hello_Feind);
		Info_AddChoice(DIA_Addon_Henry_Hello,"����!",DIA_Addon_Henry_Hello_Freund);
		Henry_FriendOrFoe = TRUE;
	};
};


func void DIA_Addon_Henry_Hello_Feind()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Feind_15_00");	//����!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_01");	//����� ����������� �� ���� �������, �����?
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_02");	//������, ��� ���� ����, ��� ��������, �� ��������.
	Info_ClearChoices(DIA_Addon_Henry_Hello);
};

func void DIA_Addon_Henry_Hello_Freund()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Freund_15_00");	//����!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Freund_04_01");	//��� ����� ������� �����! � ���� �� ����. ��� ���� ����� ����?
	Info_ClearChoices(DIA_Addon_Henry_Hello);
};


instance DIA_Addon_Henry_SecondWarn(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 2;
	condition = DIA_Addon_Henry_SecondWarn_Condition;
	information = DIA_Addon_Henry_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Henry_SecondWarn_Condition()
{
	if(C_NpcHasGuardStatus(self,PIR_1354_Checkpoint,GP_FirstWarnGiven))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Addon_Henry_SecondWarn_04_00");	//��� ���� ��� ������ - � � ������� ���� ������.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PIR_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Henry_Attack(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 3;
	condition = DIA_Addon_Henry_Attack_Condition;
	information = DIA_Addon_Henry_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Henry_Attack_Condition()
{
	if(C_NpcHasGuardStatus(self,PIR_1354_Checkpoint,GP_SecondWarnGiven))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_Henry_Attack_04_00");	//��� ����������...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


var int Henry_Zoll_WhatFor;

instance DIA_Addon_Henry_WantEnter(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 1;
	condition = DIA_Addon_Henry_WantEnter_Condition;
	information = DIA_Addon_Henry_WantEnter_Info;
	permanent = FALSE;
	description = "� ���� ������� ������.";
};


func int DIA_Addon_Henry_WantEnter_Condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_WantEnter_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_00");	//� ���� ������� ������.
	AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_01");	//������? ��� �, � ����� ������, �� ������ ���������.
	B_Henry_Gold(500);
	if(Henry_Zoll_WhatFor == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_02");	//��? � �� ���?
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_03");	//�� ����� �� ���� ������.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_04");	//� ������ ����� ����� ����, ��� ����� ���� ��������������...
		Henry_Zoll_WhatFor = TRUE;
	};
	if(C_ExpensiveArmorEquipped(other))
	{
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_07");	//� �� ��������� ��������� �������������.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_08");	//��� ��� ��������� ����� �� ���� ���� �� �������.
		if((VisibleGuild(other) != GIL_KDF) && (VisibleGuild(other) != GIL_KDW))
		{
			AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_09");	//��� ���� ��������� ����� �� � ����-�� �����?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_10");	//� ���� �� ���� ������, �� ��� ��?
	};
};

func void B_Henry_NoJoin()
{
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_00");	//���� �� ����������� � ��� ��������������, ���� �� �������.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_01");	//������ ��������� ���������� ������ �������. � �� ������ � ��������� ������� ���� � ���� �� �������.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_02");	//�� �� ������ ��������� ��� �����������.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_03");	//������ �� �������� ������� �������������!
};


instance DIA_Addon_Henry_Einigen2(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 2;
	condition = DIA_Addon_Henry_Einigen2_Condition;
	information = DIA_Addon_Henry_Einigen2_Info;
	description = "��� ���� 500 �������.";
};


func int DIA_Addon_Henry_Einigen2_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_WantEnter) && !Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (Npc_HasItems(other,ItMi_Gold) >= 500))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Einigen2_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Einigen2_15_00");	//��� ���� 500 �������.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Addon_Henry_Einigen2_04_01");	//���������. ����� ���������� � ������!
	if(GregIsBack == FALSE)
	{
		B_Henry_NoJoin();
	};
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance DIA_Addon_Henry_Einigen(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 3;
	condition = DIA_Addon_Henry_Einigen_Condition;
	information = DIA_Addon_Henry_Einigen_Info;
	description = "�� ����� ���-������ ������������?";
};


func int DIA_Addon_Henry_Einigen_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_WantEnter))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Einigen_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Einigen_15_00");	//�� ����� ���-������ ������������?
	AI_Output(self,other,"DIA_Addon_Henry_Einigen_04_01");	//��-�... ������ ��� ��������� �������, � � ������ ���� ������.
};


instance DIA_Addon_Henry_MeatForMorgan(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 4;
	condition = DIA_Addon_Henry_MeatForMorgan_Condition;
	information = DIA_Addon_Henry_MeatForMorgan_Info;
	permanent = FALSE;
	description = "� ������ ������ ������� ����.";
};


func int DIA_Addon_Henry_MeatForMorgan_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (MIS_AlligatorJack_BringMeat == LOG_Running) && Npc_HasItems(other,ItFoMuttonRaw))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_MeatForMorgan_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_00");	//� ������ ������ ������� ����.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_01");	//�! � ��� �� ���� ������?
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_02");	//��������� ����. �� �������, ��� ������ ��� ���� ��� ����.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_03");	//����. ��� �� �� � ����������, �����?
};


instance DIA_Addon_Henry_Malcom(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 5;
	condition = DIA_Addon_Henry_Malcom_Condition;
	information = DIA_Addon_Henry_Malcom_Info;
	description = "���� ������ �������. �� ������, ��� � ������� �������� ��� ������� ���������.";
};


func int DIA_Addon_Henry_Malcom_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (MalcomBotschaft == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Malcom_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Malcom_15_00");	//���� ������ �������. �� ������, ��� � ������� �������� ��� ������� ���������.
	AI_Output(self,other,"DIA_Addon_Henry_Malcom_04_01");	//(������) �� �������... � ��� � ����. ����� �� ��������.
	B_MalcomExident();
};


instance DIA_Addon_Henry_BaltramPack(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 6;
	condition = DIA_Addon_Henry_BaltramPack_Condition;
	information = DIA_Addon_Henry_BaltramPack_Info;
	description = "� ���� ������� ��� �����. �� �����?";
};


func int DIA_Addon_Henry_BaltramPack_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && Npc_HasItems(other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_BaltramPack_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_BaltramPack_15_00");	//� ���� ������� ��� �����. �� �����?
	AI_Output(self,other,"DIA_Addon_Henry_BaltramPack_04_01");	//��, ���� �����. � ���?
};


var int Henry_Amount;

instance DIA_Addon_Henry_Tribut(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 7;
	condition = DIA_Addon_Henry_Tribut_Condition;
	information = DIA_Addon_Henry_Tribut_Info;
	permanent = TRUE;
	description = "�������� ���� ������.";
};


func int DIA_Addon_Henry_Tribut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (self.aivar[AIV_PASSGATE] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Tribut_Info()
{
	Henry_Amount = 500;
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_15_00");	//�������� ���� ������.
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_01");	//��-�...
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_02");	//�� ������ ��� ��������� �� ������ �� ���������.
		Henry_Amount -= 100;
	};
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_MeatForMorgan))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_03");	//��������� ���� ���������� ���� ��� �������� �� ����������, ����� �������� ���� �������.
		Henry_Amount -= 100;
	};
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_BaltramPack))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_04");	//� ���� ������� ��� �����.
		Henry_Amount -= 100;
	};
	if(MIS_Henry_FreeBDTTower == LOG_SUCCESS)
	{
		if(Henry_Amount < 500)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_00");	//� ��� ����� �����:
		};
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_01");	//�� ���������� � ����� ���������, ��������� � �����.
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_02");	//�� ����� �, ��� � ���� ����� ���� ���������� � ��������.
		Henry_Amount -= 200;
	};
	if(Henry_Amount <= 0)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_03");	//������, ���? ������ ������ ���������.
		self.aivar[AIV_PASSGATE] = TRUE;
		Info_ClearChoices(DIA_Addon_Henry_Tribut);
	}
	else
	{
		B_Henry_Gold(Henry_Amount);
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_05");	//���� �� ��������, ������ �����������. ��� ������.
		Info_ClearChoices(DIA_Addon_Henry_Tribut);
		Info_AddChoice(DIA_Addon_Henry_Tribut,"�����, ��� ������� �����.",DIA_Addon_Henry_Tribut_nein);
		if(Npc_HasItems(other,ItMi_Gold) >= Henry_Amount)
		{
			Info_AddChoice(DIA_Addon_Henry_Tribut,"������. ��� ������.",DIA_Addon_Henry_Tribut_ja);
		};
	};
};

func void DIA_Addon_Henry_Tribut_ja()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_ja_15_00");	//������. ��� ������.
	B_GiveInvItems(other,self,ItMi_Gold,Henry_Amount);
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_ja_04_01");	//���������. ����� ���������� � ������!
	if(GregIsBack == FALSE)
	{
		B_Henry_NoJoin();
	};
	Info_ClearChoices(DIA_Addon_Henry_Tribut);
	self.aivar[AIV_PASSGATE] = TRUE;
};

func void DIA_Addon_Henry_Tribut_nein()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_nein_15_00");	//�����, ��� ������� �����.
	if(Henry_Amount < 500)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_nein_04_03");	//���������! � � ��� ������ ���� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_nein_04_04");	//� ����� ������ ������ ��������� ������.
	};
	Info_ClearChoices(DIA_Addon_Henry_Tribut);
};


instance DIA_Addon_Henry_Palisade(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 11;
	condition = DIA_Addon_Henry_Palisade_Condition;
	information = DIA_Addon_Henry_Palisade_Info;
	permanent = FALSE;
	description = "��� �� ����� �������?";
};


func int DIA_Addon_Henry_Palisade_Condition()
{
	return TRUE;
};

func void DIA_Addon_Henry_Palisade_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_01");	//� ��� �� �������? � ������ ���������� �� ���, ����� ��� ������ ������ ��������� �������� � ����.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_02");	//���� �� �� ����� ��������, ������� ���� ���� ��� �������� ����� ��� ���.
	};
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_03");	//����� � �����, ���������� �� � ������ ������ ����������� ����� ����.
};


instance DIA_Addon_Henry_Palisade_WhatFor(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 12;
	condition = DIA_Addon_Henry_Palisade_WhatFor_Condition;
	information = DIA_Addon_Henry_Palisade_WhatFor_Info;
	permanent = FALSE;
	description = "����� ��� ����������� ��������?";
};


func int DIA_Addon_Henry_Palisade_WhatFor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_WhatFor_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_WhatFor_15_00");	//����� ��� ����������� ��������?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_10");	//�� �� ����� ����� ������ ������� ��� ��������!
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_02");	//��� ������� ������� � ������ ����! � ��������� ����� ��� ���������� ��������� ������ ������, ��� ����� � �������� ����������� �������.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_11");	//��������� �������� ���� ���������� � ����� � ��� ������.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_12");	//� ������, ��� ��� ��������� �����.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_03");	//�� ���� ��� ��������� �����, ��� ����� ������� �� ���, �� �� ��� ��������, ��� ��� �� ����� ��� �������.
	if(MIS_Henry_FreeBDTTower != LOG_SUCCESS)
	{
		Log_CreateTopic(TOPIC_Addon_BanditsTower,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BanditsTower,LOG_Running);
		B_LogEntry(TOPIC_Addon_BanditsTower,"��������� �������� ������ ����� � ��� �� ���������� ������.");
	};
};

func void B_Henry_WhereIsTower()
{
	AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_08");	//��� ������ ��������� �����?
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_07");	//��� �� �� � ������������� ������ �������.
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_08");	//�� ������� ����� �� ��������� �����.
};


instance DIA_Addon_Henry_Turmbanditen(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 13;
	condition = DIA_Addon_Henry_Turmbanditen_WhatFor_Condition;
	information = DIA_Addon_Henry_Turmbanditen_WhatFor_Info;
	permanent = TRUE;
	description = "������ �������� � �����...";
};


func int DIA_Addon_Henry_Turmbanditen_WhatFor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade_WhatFor) && (MIS_Henry_FreeBDTTower != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Turmbanditen_WhatFor_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Turmbanditen_15_00");	//������ �������� � �����...
	if(C_TowerBanditsDead())
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_01");	//��?
		AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_01");	//��� ������.
		if(GotPartyMemberForTowerBandits == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_03");	//�� ���������� � ���� � ��������? ������� �������� ���� ���� ��������!
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_04");	//����� ����, �����-������ �� ���� ������� ��������� �������!
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_02");	//���������! ��� �, ����� ��������� ������.
		};
		B_ResetHenryPirates();
		MIS_Henry_FreeBDTTower = LOG_SUCCESS;
		B_LogEntry(TOPIC_Addon_BanditsTower,"������� �� ����� �����.");
		B_GivePlayerXP(XP_Addon_Henry_FreeBDTTower);
	}
	else if(MIS_Henry_FreeBDTTower == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_07");	//��� ��� �� ������?
		B_Henry_WhereIsTower();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_05");	//���� �� ���������� ���������� � ���� ��������������, ������ �� ����!
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_06");	//����� � ����� ���� ����� ������� �� ����� ������. ��� ����������� � ��������.
	};
	Knows_HenrysEntertrupp = TRUE;
};


instance DIA_Addon_Henry_Palisade_Bandits(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 14;
	condition = DIA_Addon_Henry_Palisade_Bandits_Condition;
	information = DIA_Addon_Henry_Palisade_Bandits_Info;
	permanent = FALSE;
	description = "������ �� �������, ��� ������� ����� �� ��� �������?";
};


func int DIA_Addon_Henry_Palisade_Bandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade_WhatFor))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_Bandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Bandits_15_00");	//������ �� �������, ��� ������� ����� �� ��� �������?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_04");	//������ ��� ����� ���� � ��������� �����! � �� ��� �����?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_05");	//������� ��� ���� ������. �� �������� ���� ��������, ��� ���� �� ���� ������ � �������� ��� � �����.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_06");	//�� ������ ��� ������� �������� �� ������� ������.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_07");	//������ ������ �����, ��� �� ��� �����.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_08");	//�����, �� ����� ���� �������. ���� ������� ������� ��������� ������ �� ����������.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_09");	//������ �������� ���� ����� ���������� �� ������. �� ��� � ���� �����-�� ���� - � ����� ������� � �����.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_10");	//�� ����� ���������� ���� ����� �����������.
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_11");	//(�������������) ���� ������, ��� ���� � ��� ���������� �� �������. �� ����-�� �� �� ��������...
	};
};


var int Henry_EnterCrewMember;

instance DIA_Addon_Henry_Entercrew(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 31;
	condition = DIA_Addon_Henry_Entercrew_Condition;
	information = DIA_Addon_Henry_Entercrew_Info;
	permanent = TRUE;
	description = "� ���� �������������� � ������ ������.";
};


func int DIA_Addon_Henry_Entercrew_Condition()
{
	if((Knows_HenrysEntertrupp == TRUE) && (Henry_EnterCrewMember == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Entercrew_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_00");	//� ���� �������������� � ������ ������.
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_00");	//(�������) ���, ��� ���� �� ������, ��������!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_01");	//������� ���� ���� ������� � ������!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_06");	//�� ��� �, ����� ����������!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_07");	//��� ���� ���� ��� �� ��������.
		if(MIS_Henry_FreeBDTTower == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_02");	//��-�. � �� �������� ���� ����� ������ �� ���� ����� � �������� �������� � ����� ��������...
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_03");	//�� �� ��� ��� ������.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_05");	//�� ������ ���������� �� ��������, �������������� � �����!
			if(Npc_IsDead(SawPirate) && Npc_IsDead(HammerPirate))
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_04");	//��� ���� ����� ������, ��� ��� ���� �������� �������� ���� � ��������.
				B_LogEntry(TOPIC_Addon_BanditsTower,"����� �����, ����� � ���������� � ��������� ����� ���������. ������ �� ��� ����� �� �����.");
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_06");	//������ ������ �� ���� �����, � ��������� � ����� ���������.
				B_LogEntry(TOPIC_Addon_BanditsTower,"����� �����, ����� � ���������� � ��������� ����� ���������. � ���� ����� � ����� ������ �� ��� ������.");
				Henry_GetPartyMember = TRUE;
			};
			B_Henry_WhereIsTower();
			AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_09");	//����, ���!
			MIS_Henry_FreeBDTTower = LOG_Running;
		};
		Henry_EnterCrewMember = TRUE;
	};
};


instance DIA_Addon_Henry_Owen(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 32;
	condition = DIA_Addon_Henry_Owen_Condition;
	information = DIA_Addon_Henry_Owen_Info;
	description = "��� ���� ���� ��� �����-������ �������?";
};


func int DIA_Addon_Henry_Owen_Condition()
{
//	if((MIS_Henry_FreeBDTTower == LOG_SUCCESS) && (Henry_EnterCrewMember == TRUE) && !Npc_IsDead(Malcom))
	if((MIS_Henry_FreeBDTTower == LOG_SUCCESS) && (Henry_EnterCrewMember == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Owen_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Owen_15_01");	//��� ���� ���� ��� �����-������ �������?
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_01");	//�� ��� ��������� ���� ���� ����� ������ ������ ��� ���������.
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_05");	//��� ������ ���� ��������� ������� � ����.
	if(!Npc_KnowsInfo(other,DIA_Addon_Henry_Malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_06");	//�� ������ �������� ������, � ������ �� ���-�������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_07");	//������� ������, ��� ��������� ������ ������ ��������� �����. �� �� �������� ��!
	};
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_08");	//����� ���, ��� ��� ������� �����!
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_09");	//���, ������! ����� ����� ��� �����. ������� ������� ���������.
	B_MalcomExident();
	MIS_Henry_HolOwen = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_HolOwen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HolOwen,LOG_Running);
	B_LogEntry(TOPIC_Addon_HolOwen,"����� ����� ������ ��� ������������� ���������. � ������ ������� �� ���� �����. ��� � �������� ����� ����� � ������.");
};

func void B_Addon_Henry_MalcomsDead()
{
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_00");	//��� � ���������?
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_Add_15_01");	//�� �����.
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_02");	//�������. ������, ����� ����������� �� ����...
};


instance DIA_Addon_Henry_Owen2(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 33;
	condition = DIA_Addon_Henry_Owen2_Condition;
	information = DIA_Addon_Henry_Owen2_Info;
	permanent = TRUE;
	description = "������ �����, ��������...";
};


func int DIA_Addon_Henry_Owen2_Condition()
{
	if(MIS_Henry_HolOwen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Owen2_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_00");	//������ �����, ��������...
	if(Npc_IsDead(Owen))
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_01");	//�� �����.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_02");	//���� ������! ������, ��� �������� ��������� ���� ������ ��������.
		if(!Npc_IsDead(Morgan))
		{
			AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_03");	//������ ����� ������� ������� ������������� ��� ������ ������ �������.
		};
		B_Addon_Henry_MalcomsDead();
		MIS_Henry_HolOwen = LOG_OBSOLETE;
		B_LogEntry(TOPIC_Addon_HolOwen,"���� � ������� ������.");
		Log_SetTopicStatus(TOPIC_Addon_HolOwen,LOG_OBSOLETE);
	}
	else if(Owen_ComesToHenry == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_03");	//���� ����� �������� ������.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_04");	//����� ������. � ����� �������.
		B_Addon_Henry_MalcomsDead();
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_05");	//��� ���� �������.
		B_GiveInvItems(self,other,ItMi_Gold,200);
		if(Npc_KnowsInfo(other,DIA_Addon_Greg_RavenDead))
		{
			B_StartOtherRoutine(Owen,"POSTSTART");
		}
		else
		{
			B_StartOtherRoutine(Owen,"PRESTART");
		};
		MIS_Henry_HolOwen = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Owen_ComesToHenry);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_06");	//�������, ��� ��������� ������ ���������?
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_07");	//�������� ������, � ������ �� ���-�������.
	};
};


var int Henry_PERM_Once;

instance DIA_Addon_Henry_Palisade_CanHelp(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 34;
	condition = DIA_Addon_Henry_Palisade_CanHelp_Condition;
	information = DIA_Addon_Henry_Palisade_CanHelp_Info;
	permanent = TRUE;
	description = "���� ����� ������?";
};


func int DIA_Addon_Henry_Palisade_CanHelp_Condition()
{
	if((MIS_Henry_HolOwen == LOG_SUCCESS) || (MIS_Henry_HolOwen == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_CanHelp_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_00");	//���� ����� ������?
	if(Henry_PERM_Once == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_01");	//�� ������ ���-������ � ��������� ����������?
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_02");	//������ ������, ���.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_03");	//����� ������ �� ���� ����� �� �����. ������ ����-������ ���.
		Henry_PERM_Once = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_04");	//������ �������� �� ������ ������, � �� ��������. ������ �� ����� ���� �������.
	};
};


instance DIA_Addon_Henry_WhatTeach(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 21;
	condition = DIA_Addon_Henry_WhatTeach_Condition;
	information = DIA_Addon_Henry_WhatTeach_Info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ����� ���������?";
};


func int DIA_Addon_Henry_WhatTeach_Condition()
{
	if((Knows_HenrysEntertrupp == TRUE) && (Henry_Addon_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_WhatTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_WhatTeach_Add_15_00");	//�� ������ ������� ���� ����� ���������?
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_01");	//(�������) ������� ������� �� ������ � ������, � ����� ��� �� �� ���� ���������.
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_02");	//���� �������� �������� � ����� �� ����.
//		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_03");	//�������, ������ ���?
		if(!Npc_KnowsInfo(other,DIA_Addon_Bones_Teacher))
		{
			Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
			B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
		};
		Henry_Addon_TeachPlayer = TRUE;
	};
};


var int Henry_merke2h;
var int Henry_merkeCbow;
var int Henry_Labercount;
var int Henry_Comment2H;
var int DIA_Henry_Teacher_permanent;
var int DIA_Henry_TeachState_2H;
var int DIA_Henry_TeachState_Crossbow;

func void B_Henry_NoMore_2H()
{
	AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00");	//������ �� ��������� ������ ��� ��������� �������.
};

func void B_Henry_NoMoreTeach()
{
	AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01");	//�� ������ �� ���������� � ��������.
};

func void B_BuildLearnDialog_Henry()
{
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	if(VisibleTalentValue(NPC_TALENT_2H) < TeachLimit_2H_Henry)
	{
		Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnTalentString(other,NPC_TALENT_2H,1),DIA_Addon_Henry_Teach_2H_1);
		Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnTalentString(other,NPC_TALENT_2H,5),DIA_Addon_Henry_Teach_2H_5);
		DIA_Henry_TeachState_2H = 1;
	}
	else
	{
		if((DIA_Henry_TeachState_2H == 1) && (DIA_Henry_TeachState_Crossbow != 2))
		{
			PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_2H_Henry)),-1,53,FONT_Screen,2);
			B_Henry_NoMore_2H();
		};
		DIA_Henry_TeachState_2H = 2;
	};
	if(VisibleTalentValue(NPC_TALENT_CROSSBOW) < TeachLimit_Crossbow_Henry)
	{
		Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnTalentString(other,NPC_TALENT_CROSSBOW,1),DIA_Addon_Henry_Teach_CB_1);
		Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnTalentString(other,NPC_TALENT_CROSSBOW,5),DIA_Addon_Henry_Teach_CB_5);
		DIA_Henry_TeachState_Crossbow = 1;
	}
	else
	{
		if((DIA_Henry_TeachState_Crossbow == 1) && (DIA_Henry_TeachState_2H != 2))
		{
			PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_Crossbow_Henry)),-1,53,FONT_Screen,2);
			B_Say(self,other,"$NOLEARNYOUREBETTER");
		};
		DIA_Henry_TeachState_Crossbow = 2;
	};
	if((RealTalentValue(NPC_TALENT_2H) >= DIA_Henry_TeachState_2H) && (RealTalentValue(NPC_TALENT_CROSSBOW) >= TeachLimit_Crossbow_Henry))
	{
		DIA_Henry_Teacher_permanent = TRUE;
	};
	if((DIA_Henry_TeachState_2H == 2) && (DIA_Henry_TeachState_Crossbow == 2))
	{
		PrintScreen(PRINT_NoLearnTotalMAXReached,-1,53,FONT_Screen,2);
		B_Henry_NoMoreTeach();
		AI_StopProcessInfos(self);
	};
};

func void B_Henry_Comment2H()
{
	if(Henry_Comment2H == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_03");	//������� �� �������: ������ ����� ���, ��� �� �������� ���������� �����!
		Henry_Comment2H = TRUE;
	};
};

func void B_Henry_CommentFightSkill()
{
	if(Henry_Labercount == 0)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Teach_Back_04_00");	//���� ������ ������.
		Henry_Labercount = 1;
	}
	else if(Henry_Labercount == 1)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_01");	//�� ������ �������. �����, ���� ������� ����� ��������� �������.
		Henry_Labercount = 2;
	}
	else if(Henry_Labercount == 2)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_02");	//���� ������ ���������� � ��� �� ����, �� ����� �� ������� � �������� ��������� ����� �������.
		Henry_Labercount = 0;
	};
};

instance DIA_Addon_Henry_Teach(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 6;
	condition = DIA_Addon_Henry_Teach_Condition;
	information = DIA_Addon_Henry_Teach_Info;
	permanent = TRUE;
	description = "��� ����!";
};


func int DIA_Addon_Henry_Teach_Condition()
{
	if((Henry_Addon_TeachPlayer == TRUE) && (DIA_Henry_Teacher_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Teach_15_00");	//��� ����!
	Henry_merke2h = other.HitChance[NPC_TALENT_2H];
	Henry_merkeCbow = other.HitChance[NPC_TALENT_CROSSBOW];
	B_BuildLearnDialog_Henry();
};

func void DIA_Addon_Henry_Teach_Back()
{
	if((other.HitChance[NPC_TALENT_2H] > Henry_merke2h) || (other.HitChance[NPC_TALENT_CROSSBOW] > Henry_merkeCbow))
	{
		B_Henry_CommentFightSkill();
	};
	Info_ClearChoices(DIA_Addon_Henry_Teach);
};

func void DIA_Addon_Henry_Teach_CB_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,TeachLimit_Crossbow_Henry))
	{
		B_BuildLearnDialog_Henry();
	};
};

func void DIA_Addon_Henry_Teach_CB_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,TeachLimit_Crossbow_Henry))
	{
		B_BuildLearnDialog_Henry();
	};
};

func void DIA_Addon_Henry_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,TeachLimit_2H_Henry))
	{
		B_Henry_Comment2H();
		B_BuildLearnDialog_Henry();
	};
};

func void DIA_Addon_Henry_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,TeachLimit_2H_Henry))
	{
		B_Henry_Comment2H();
		B_BuildLearnDialog_Henry();
	};
};


instance DIA_Addon_Henry_Palisade_Train(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 11;
	condition = DIA_Addon_Henry_Palisade_Train_Condition;
	information = DIA_Addon_Henry_Palisade_Train_Info;
	permanent = FALSE;
	description = "���� - ��� ��������?";
};


func int DIA_Addon_Henry_Palisade_Train_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_Train_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_00");	//���� - ��� ��������?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_01");	//��. �� ��� ���� �� - ������� ����. ��� �������?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_02");	//�� - ������� �������. ����� �� � ��� �����������, ���� ����� �� ���� �� ������� ��� ������. �� ���� �� ������� �� ���� ��������.
	if((PlayerTalkedToGregNW == TRUE) || (Greg.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_03");	//� � ��� ��� ����������.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_04");	//����� ������. ������, �� ���������, � ��� � ������.
	};
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_05");	//�������, ��� ������ ��� � ������.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_06");	//���� ��������� �������.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_07");	//�� ����� ���� ����� ����� ������� ����� � �������, ��� �� ��������.
	};
};


instance DIA_Addon_Henry_YourOwnTrupp(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 1;
	condition = DIA_Addon_Henry_YourOwnTrupp_Condition;
	information = DIA_Addon_Henry_YourOwnTrupp_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Henry_YourOwnTrupp_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		if(C_HowManyPiratesInParty() > 0)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Henry_YourOwnTrupp_Info()
{
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_04");	//����, ������� ��� ���� � ������������ ����������� �����.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_05");	//���������� � ���, ����� ���� ���� �� ������ ����� ����!
	AI_StopProcessInfos(self);
};

