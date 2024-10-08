
instance DIA_Addon_Skip_EXIT(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 999;
	condition = DIA_Addon_Skip_EXIT_Condition;
	information = DIA_Addon_Skip_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Skip_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_EXIT_Info()
{
	if((MIS_ADDON_SkipsGrog == LOG_Running) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_HUT3_01") < 2000))
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_03");	//��� �� ���� ���� ����� ��������...
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_Hello(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_Hello_Condition;
	information = DIA_Addon_Skip_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Skip_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_00");	//���-���, ��� �� ��� ������������ ������� �����?
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_01");	//� ���� ����!
	if(PlayerTalkedToSkipNW == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Hello_08_02");	//������� ����� ����� � �������?
		AI_Output(other,self,"DIA_Addon_Skip_Hello_15_03");	//����, �����?
		AI_Output(self,other,"DIA_Addon_Skip_Hello_08_04");	//(�����) ����, � �������� �� ���� �����������.
		AI_Output(self,other,"DIA_Addon_Skip_Hello_08_05");	//�� ��� �������, ��� � ���-�� ��� ����� ���� ����...
		AI_Output(self,other,"DIA_Addon_Skip_Hello_08_06");	//�� �������!
	};
	B_ReadFakeItem(self,other,Fakeheroface,1);
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_07");	//�� ������ ��������, �������, �� ��� ����� ��.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_08");	//�� �� �������������, ��������. ��� ���� �� ���������� � ������� �������� �� �����.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_SkipADW_BaltramPaket(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 2;
	condition = DIA_Addon_SkipADW_BaltramPaket_Condition;
	information = DIA_Addon_SkipADW_BaltramPaket_Info;
	description = "� ���� ��� ���� ������� �� ���������.";
};


func int DIA_Addon_SkipADW_BaltramPaket_Condition()
{
	if(Npc_HasItems(other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_SkipADW_BaltramPaket_Info()
{
	AI_Output(other,self,"DIA_Addon_SkipADW_BaltramPaket_15_00");	//� ���� ��� ���� ������� �� ���������.
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_01");	//(����������) ��, ������ ���� ������ ������������� ������������� � ������ ����.
	B_GiveInvItems(other,self,ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_02");	//���, ������� ��� ��� �������. ������ � �����, ���� ��� ����.
	B_Skip_GiveRumForBaltram();
};


instance DIA_Addon_Skip_Job(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 3;
	condition = DIA_Addon_Skip_Job_Condition;
	information = DIA_Addon_Skip_Job_Info;
	description = "��� �� ����� �������?";
};


func int DIA_Addon_Skip_Job_Condition()
{
	if(GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Job_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Job_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Addon_Skip_Job_08_01");	//� ������ ��� �������� �� �������� � ������ ��� ����������� �����.
};


instance DIA_Addon_Skip_ADW_GregGetroffen(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 4;
	condition = DIA_Addon_Skip_ADW_GregGetroffen_Condition;
	information = DIA_Addon_Skip_ADW_GregGetroffen_Info;
	description = "� ����� ����� � ��������.";
};


func int DIA_Addon_Skip_ADW_GregGetroffen_Condition()
{
	if((PlayerTalkedToGregNW == TRUE) && (GregIsBack == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Skip_Job))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_ADW_GregGetroffen_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ADW_GregGetroffen_15_00");	//� ����� ����� � ��������.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_01");	//������? ������! ������, ���-�� ����� �� ���.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_02");	//�� ��� ����� ������ ��� ��������� ���� �� ����� �������.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_03");	//�������, � ������ ��������� � ������� � ����������� � ���...
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_04");	//(��������) ���, �������, �� �������. � ����� ������, � ������ ��� ������.
	B_GivePlayerXP(XP_Ambient);
};


var int Skip_Transport_Variation;

instance DIA_Addon_Skip_Transport(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 99;
	condition = DIA_Addon_Skip_Transport_Condition;
	information = DIA_Addon_Skip_Transport_Info;
	permanent = TRUE;
	description = "�� ������ ������� ���� � �������?";
};


func int DIA_Addon_Skip_Transport_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Skip_Job) || (GregIsBack == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Skip_Transport_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Transport_15_00");	//�� ������ ������� ���� � �������?
	if(MIS_ADDON_SkipsGrog != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_01");	//���, ��������. ������ � ������ �� �������. ������� ��� ����� ������� ���� �����.
	}
	else if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_02");	//�� ��������? �� �������� �������, ��������!
	}
	else if(Skip_Transport_Variation == 0)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_03");	//� �� ��������� ��������� ����� ��������� ������� ������ ������, ��� ���� ���� �������������� �������� ���� ������� �� ��������!
		Skip_Transport_Variation = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_04");	//��������� ��� �������: ���!
	};
};


instance DIA_Addon_Skip_Bandits(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_Bandits_Condition;
	information = DIA_Addon_Skip_Bandits_Info;
	description = "��� �� ��� ������ ���������� � ��������?";
};


func int DIA_Addon_Skip_Bandits_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_Bandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Bandits_15_00");	//��� �� ��� ������ ���������� � ��������?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_01");	//�������?! ��� �������� �� ���!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_02");	//��� �� �������, ������ �� ������ ��� ������?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_03");	//�� ���� �������� ���� ���� ��������.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_04");	//������� �� � ���� ���������. � ����� ����, ��������, ��� � ��� ������� ������, ��� ��� �� �����, ���� ��� ������!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_05");	//�� ������� ���� ��� ������� ����� ����.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_06");	//�� ������ ������� ������. ������ � ��� �����!
	AI_Output(other,self,"DIA_Addon_Erol_Bandits_15_06");	//��� ���������?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_07");	//��� ������� �� ��������� �� ��������� ��������.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_08");	//������� � ����� � ���, ����� ������, ��� ��������� � ����� �������.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_09");	//�� ����� � ����� �� ������, ��� ���� ������ �� ����!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_10");	//�� ��� ��� �� ���. ��� ����� ������ � ����� - ����� ����� ������ �����.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_11");	//��� ���� �����, ������: ������� �� ����� ������ ��������.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_12");	//������� �������� �� �������, ��� �������� ��������, ��� ���.
	if(self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		Npc_ExchangeRoutine(self,"START");
	};
};


instance DIA_Addon_Skip_ArmorPrice(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_ArmorPrice_Condition;
	information = DIA_Addon_Skip_ArmorPrice_Info;
	description = "��� ����� ������� ��������.";
};


func int DIA_Addon_Skip_ArmorPrice_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits) && (GregIsBack == FALSE) && !C_SCHasBDTArmor())
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_ArmorPrice_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_00");	//��� ����� ������� ��������.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_01");	//�� ������ ����� �� ������? �� ����� � ���!
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_02");	//��� ������ ��� ������, ��� �� - �� ���� �� ���, ���� �����!
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_02");	//�� �� ������, ��� � ���� ����� ���������� �������?
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_03");	//(��������) � ���� ������ ��� �� ����������, �����? �� ������. � ��� ��� �������� ����� ��������.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_04");	//��, ��������, �� ��� ��� ����� � ������ �����.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_05");	//����� ����, ����� ���� ��������, �� ������� ������ � ���� �������...
	B_LogEntry(TOPIC_Addon_BDTRuestung,"���� ������, ��� ������� ��������� � ������ �����.");
};


instance DIA_Addon_Skip_GregsHut(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_GregsHut_Condition;
	information = DIA_Addon_Skip_GregsHut_Info;
	permanent = FALSE;
	description = "�� ������ �������, ��� ������� � ��� ������?";
};


func int DIA_Addon_Skip_GregsHut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_ArmorPrice) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_GregsHut_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_GregsHut_15_00");	//�� ������ �������, ��� ������� � ��� ������?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_01");	//��-��-��, �� ��� ������!
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_02");	//�� �� �� ����������� �������� � ����� �����?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_03");	//����� ���� ������, �� ������� ���� �� ������ �������� � �������� ��� ������ �� ������� ������.
	if(!C_SCHasBDTArmor())
	{
		B_LogEntry(TOPIC_Addon_BDTRuestung,"� �������� ���� ���� �� ������, �� ��� ��������� ������ � ��� �� �������.");
	};
	Knows_GregsHut = TRUE;
};


instance DIA_Addon_Skip_Francis(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_Francis_Condition;
	information = DIA_Addon_Skip_Francis_Info;
	permanent = FALSE;
	description = "��� �� ������� � ��������?";
};


func int DIA_Addon_Skip_Francis_Condition()
{
	if(C_CanAskPiratesAboutFrancis())
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Francis_15_00");	//��� �� ������� � ��������?
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_01");	//��� ��� ��������.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_02");	//������� ��� ��������. ������� �� ������� �������� �� ��������.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_03");	//�� ����� �� ����� �� ������������ ��� �������.
	if(!Npc_IsDead(Samuel))
	{
		AI_Output(self,other,"DIA_Addon_Skip_Francis_08_04");	//���� ������ ������ ������, �������� � ��������.
		AI_Output(self,other,"DIA_Addon_Skip_Francis_08_05");	//� ���� ����������� � ��������� ������ �� ������ ������.
		AI_Output(self,other,"DIA_Addon_Skip_Francis_08_06");	//��� � ������ ������ ��������, � ������� ������� �� ���� �� ��� �����������...
		if((MIS_Greg_ScoutBandits == FALSE) && !C_SCHasBDTArmor())
		{
			B_LogEntry(TOPIC_Addon_BDTRuestung,"� ������ ���������� � ��������. ��������, �� ������� ���.");
		};
	};
};


instance DIA_Addon_Skip_Raven(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_Raven_Condition;
	information = DIA_Addon_Skip_Raven_Info;
	permanent = FALSE;
	description = "�� �����-������ ����� ������?";
};


func int DIA_Addon_Skip_Raven_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Raven_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Raven_15_00");	//�� �����-������ ����� ������?
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_01");	//��, ������. ����� �� � ����� �������� � �����, �� ���������, ��� ����� ��������� ����� ����� � ����� �� ���.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_02");	//�� ��� �� ������ ������ ������ ��������� �����. (�������) �������, ��� ��� ����� �� ���� ��������.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_03");	//� ��� � �����, ��� ��� ������������� � ������, ������� ��� �� �����������.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_04");	//� ����, ��� �� ��������� ��� ������ �� ���������� �����, � ���� �������� ��������.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_05");	//������� ��� �����: �� ���������� � �������.
};


instance DIA_Addon_Skip_AngusHank(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_AngusHank_Condition;
	information = DIA_Addon_Skip_AngusHank_Info;
	description = "�������� ��� �� ������ � �����.";
};


func int DIA_Addon_Skip_AngusHank_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_AngusHank_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHank_15_00");	//�������� ��� �� ������ � �����.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_01");	//����� � ���� ������ ���� ����������� � ��������� ���������� �� ������.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_02");	//� ��� � ����� ���� ��������� ������. ���, ��� ��� ����� � ��� ��������.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_03");	//�����, ������� � ��� �����.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_04");	//�� ������� ����� �� ���������. ��-��������, ��� ������ � ���� ������������!
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_05");	//������ � ���� ����������� �� ������, �� ����������� ��� �� ��������.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_06");	//���� ��������� ��������. ��� � ������ � ������� ���� ��������.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_07");	//� �� ��� �����, � ��������� ������������ ������ ��� ���� ��������.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_08");	//�������, ����� ������������. ������ ������ �� ���������. (��������) �� � ��� ��� � ����� ����...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_09");	//(�������) �� ������� ����, 20 �������!
	MIS_ADDON_SkipsGrog = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_SkipsGrog,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_SkipsGrog,LOG_Running);
	B_LogEntry(TOPIC_Addon_SkipsGrog,"������� �������� � ����� 20 ������� �����. �� ����� ������� ��.");
	Log_AddEntry(TOPIC_Addon_SkipsGrog,"����� � ���� ������ ���� ����������� � ���������. � ��� ��� �� ����� �� �����. ������ ������� � ����� ������ ����������.");
};


instance DIA_Addon_Skip_AngusHankDead(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_AngusHankDead_Condition;
	information = DIA_Addon_Skip_AngusHankDead_Info;
	permanent = FALSE;
	description = "������ ������ � �����...";
};


func int DIA_Addon_Skip_AngusHankDead_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits) && !Npc_HasItems(Angus,ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_AngusHankDead_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_00");	//������ ������ � �����...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_01");	//���?
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_01");	//� �� �����.
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_03");	//��� ������.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_03");	//�����... �������...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_04");	//��� �, ����� ����� ���� �������.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_05");	//���� �� ��� ����� �� ������, �������� �����.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_06");	//�� ���������� ������� ��� �������. �� ��� �����.
};


instance DIA_Addon_Skip_AngusHankMurder(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_AngusHankMurder_Condition;
	information = DIA_Addon_Skip_AngusHankMurder_Info;
	permanent = FALSE;
	description = "� ����, ��� ���� ����� � ������.";
};


func int DIA_Addon_Skip_AngusHankMurder_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_AngusHankDead) && (SC_Knows_JuanMurderedAngus == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_AngusHankMurder_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_JuanMurder_15_00");	//� ����, ��� ���� ����� � ������.
	if(MIS_ADDON_SkipsGrog == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_04");	//���� �� ����������, ��� �� ����. ��� � ���� ������?!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_01");	//������. �� ��� ��� ������. ����� ������ �������?
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_02");	//����� ��� �� ������� ������� �� ������ ������.
	};
};


func int C_SCHasSkipsGrog()
{
	if(Npc_HasItems(hero,ItMi_Grog_Crate) >= 5)
	{
		return TRUE;
	}
	else if((Npc_HasItems(hero,ItMi_Grog_Crate) == 4) && (Npc_HasItems(hero,ItFo_Addon_Grog) >= 4))
	{
		return TRUE;
	}
	else if((Npc_HasItems(hero,ItMi_Grog_Crate) == 3) && (Npc_HasItems(hero,ItFo_Addon_Grog) >= 8))
	{
		return TRUE;
	}
	else if((Npc_HasItems(hero,ItMi_Grog_Crate) == 2) && (Npc_HasItems(hero,ItFo_Addon_Grog) >= 12))
	{
		return TRUE;
	}
	else if((Npc_HasItems(hero,ItMi_Grog_Crate) == 1) && (Npc_HasItems(hero,ItFo_Addon_Grog) >= 16))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItFo_Addon_Grog) >= 20)
	{
		return TRUE;
	};
	return FALSE;
};

instance DIA_Addon_Skip_Grog(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 9;
	condition = DIA_Addon_Skip_Grog_Condition;
	information = DIA_Addon_Skip_Grog_Info;
	permanent = TRUE;
	description = "�� ������ �����...";
};


func int DIA_Addon_Skip_Grog_Condition()
{
	if(MIS_ADDON_SkipsGrog == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Grog_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_15_00");	//�� ������ �����...
	if(C_SCHasSkipsGrog())
	{
		Info_ClearChoices(DIA_Addon_Skip_Grog);
		Info_AddChoice(DIA_Addon_Skip_Grog,Dialog_Back,DIA_Addon_Skip_Grog_back);
		Info_AddChoice(DIA_Addon_Skip_Grog,"��� ���� 20 �������.",DIA_Addon_Skip_Grog_geben);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Skip_Grog_15_01");	//� ���� ������� 20 �������, �����?
		AI_Output(self,other,"DIA_Addon_Skip_Grog_08_02");	//��, ���� ������! ��� ��� ������.
	};
};

func void DIA_Addon_Skip_Grog_back()
{
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};

func void DIA_Addon_Skip_Grog_geben()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_00");	//��� ���� 20 �������.
	if(Npc_HasItems(other,ItMi_Grog_Crate) >= 5)
	{
		B_GiveInvItems(other,self,ItMi_Grog_Crate,5);
	}
	else if((Npc_HasItems(other,ItMi_Grog_Crate) == 4) && (Npc_HasItems(other,ItFo_Addon_Grog) >= 4))
	{
		B_GiveInvItems(other,self,ItMi_Grog_Crate,4);
		Npc_RemoveInvItems(other,ItFo_Addon_Grog,4);
		CreateInvItems(self,ItFo_Addon_Grog,4);
		AI_PrintScreen("4 ��������� ������ (����)",-1,40,FONT_ScreenSmall,2);
	}
	else if((Npc_HasItems(other,ItMi_Grog_Crate) == 3) && (Npc_HasItems(other,ItFo_Addon_Grog) >= 8))
	{
		B_GiveInvItems(other,self,ItMi_Grog_Crate,3);
		Npc_RemoveInvItems(other,ItFo_Addon_Grog,8);
		CreateInvItems(self,ItFo_Addon_Grog,8);
		AI_PrintScreen("8 ��������� ������ (����)",-1,40,FONT_ScreenSmall,2);
	}
	else if((Npc_HasItems(other,ItMi_Grog_Crate) == 2) && (Npc_HasItems(other,ItFo_Addon_Grog) >= 12))
	{
		B_GiveInvItems(other,self,ItMi_Grog_Crate,2);
		Npc_RemoveInvItems(other,ItFo_Addon_Grog,12);
		CreateInvItems(self,ItFo_Addon_Grog,12);
		AI_PrintScreen("12 ��������� ������ (����)",-1,40,FONT_ScreenSmall,2);
	}
	else if((Npc_HasItems(other,ItMi_Grog_Crate) == 1) && (Npc_HasItems(other,ItFo_Addon_Grog) >= 16))
	{
		B_GiveInvItems(other,self,ItMi_Grog_Crate,1);
		Npc_RemoveInvItems(other,ItFo_Addon_Grog,16);
		CreateInvItems(self,ItFo_Addon_Grog,16);
		AI_PrintScreen("16 ��������� ������ (����)",-1,40,FONT_ScreenSmall,2);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Grog) >= 20)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,20);
	};
	B_LogEntry(TOPIC_Addon_SkipsGrog,"���� ������� ����� ���� 20 ������� ����� � ������ ����� ��������.");
	MIS_ADDON_SkipsGrog = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_SkipsGrog);
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_01");	//���? ��� ��� ��� ������?
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_02");	//��-�...
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_03");	//�����, � ������� �� ���.
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_04");	//����� ����, � ���� �������� ���-������ ������������ ������?
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_05");	//��-�... ���������... � ���� ���� ��� ��� ������.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_06");	//� ������� ��� � ����� � �����-�� ������� �������� ������ ���� ��� �����.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_07");	//������, ������� ��� ��������, ������, ��� ��� ���������. �� ����, ������ �� ���.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_08");	//���� ������, � ��� ���� ��� ������ �����?
	Info_ClearChoices(DIA_Addon_Skip_Grog);
	Info_AddChoice(DIA_Addon_Skip_Grog,"� ������ ������.",DIA_Addon_Skip_Grog_gold);
	Info_AddChoice(DIA_Addon_Skip_Grog,"� ������ ������.",DIA_Addon_Skip_Grog_ring);
};

func void DIA_Addon_Skip_Grog_ring()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_ring_15_00");	//� ������ ������.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_ring_08_01");	//�����.
	B_GiveInvItems(self,other,ItRi_Prot_Edge_02,1);
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};

func void DIA_Addon_Skip_Grog_gold()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_gold_15_00");	//� ������ ������.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_gold_08_01");	//������.
	B_GiveInvItems(self,other,ItMi_Gold,Value_Grog * 20);
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};


instance DIA_Addon_Skip_News(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 776;
	condition = DIA_Addon_Skip_News_Condition;
	information = DIA_Addon_Skip_News_Info;
	permanent = FALSE;
	description = "�� ������ ��� ���-������ �������?";
};


func int DIA_Addon_Skip_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_News_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_News_15_00");	//�� ������ ��� ���-������ �������?
	AI_Output(self,other,"DIA_Addon_Skip_News_08_01");	//���� �� ������ ���������, ��� � �������. �� �������� �� ���� ������.
	if(!Npc_KnowsInfo(other,DIA_Addon_Garett_Hello) && !Npc_KnowsInfo(other,DIA_Addon_Garett_Anheuern))
	{
		Log_CreateTopic(Topic_Addon_PIR_Trader,LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
	};
};


instance DIA_Addon_Skip_Anheuern(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 11;
	condition = DIA_Addon_Skip_Anheuern_Condition;
	information = DIA_Addon_Skip_Anheuern_Info;
	permanent = FALSE;
	description = "�� ������ ��� ������.";
};


func int DIA_Addon_Skip_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Anheuern_Info()
{
	DIA_Common_YouGottaHelpMe();
	AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_01");	//����� �������?
	AI_Output(other,self,"DIA_Addon_Skip_Anheuern_15_01");	//��� ���� ������.
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_02");	//����, �� ���� � ����� �����. ���������!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_03");	//���� ����� ����� � ����� ��� �����!
	};
	AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_04");	//� ������� ��������� ������!
};


instance DIA_Addon_Skip_ComeOn(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 12;
	condition = DIA_Addon_Skip_ComeOn_Condition;
	information = DIA_Addon_Skip_ComeOn_Info;
	permanent = TRUE;
	description = "������ �� ����.";
};


func int DIA_Addon_Skip_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Skip_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ComeOn_15_00");	//������ �� ����.
	if(C_GregsPiratesTooFar())
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_02");	//�������. ����� ������� �������� � ������...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_01");	//����!
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			B_TurnToNpc(self,other);
		};
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_Skip_GoHome(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 13;
	condition = DIA_Addon_Skip_GoHome_Condition;
	information = DIA_Addon_Skip_GoHome_Info;
	permanent = TRUE;
	description = "�� ��� ������ �� �����.";
};


func int DIA_Addon_Skip_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_GoHome_15_00");	//�� ��� ������ �� �����.
	AI_Output(self,other,"DIA_Addon_Skip_GoHome_08_01");	//��� �, �� ������� �����������. ���� ���, �� ������ ����� ���� � ������.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Skip_TooFar(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 14;
	condition = DIA_Addon_Skip_TooFar_Condition;
	information = DIA_Addon_Skip_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Skip_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && C_GregsPiratesTooFar())
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_01");	//�� ����� ���������� ������!
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_02");	//���� �� ����� ������, �� �� ��� �� �����������!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_03");	//���� �� ����� ������, �� �� ���� �� �����������!
	};
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_Treffpunkt(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_Treffpunkt_Condition;
	information = DIA_Addon_Skip_Treffpunkt_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Skip_Treffpunkt_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_CANYON_TELEPORT_PATH_06") <= 800) && (CanyonRazorBodyCount < 10))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Treffpunkt_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_00");	//���� �� �������� ���� �����, �� ����������� �����, � �������.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_02");	//������!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_Orks(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_Orks_Condition;
	information = DIA_Addon_Skip_Orks_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Skip_Orks_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Orks_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_01");	//����! �������� ���� ������!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_AllRazorsDead(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_AllRazorsDead_Condition;
	information = DIA_Addon_Skip_AllRazorsDead_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Skip_AllRazorsDead_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (CanyonRazorBodyCount >= 10))
	{
		if((Npc_GetDistToWP(self,"ADW_CANYON_PATH_TO_LIBRARY_31A") <= 6000) || (Npc_GetDistToWP(self,"ADW_CANYON_PATH_TO_MINE2_18") <= 6000))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Skip_AllRazorsDead_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_03");	//������, �� �������� ���� �����������.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_04");	//���� ������, �� ����� ��������� ����� ���.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_05");	//������ �� ������ �� �������.
	AI_StopProcessInfos(self);
};

