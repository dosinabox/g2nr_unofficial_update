
instance DIA_Pedro_EXIT(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 999;
	condition = DIA_Pedro_EXIT_Condition;
	information = DIA_Pedro_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pedro_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pedro_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pedro_WELCOME(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 1;
	condition = DIA_Pedro_WELCOME_Condition;
	information = DIA_Pedro_WELCOME_Info;
	important = TRUE;
};


func int DIA_Pedro_WELCOME_Condition()
{
	if((other.guild != GIL_NOV) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Pedro_WELCOME_Info()
{
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_00");	//����� ���������� � ��������� ������, ���������.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_01");	//� ���� �����, �������� ����� ������ � ��������� ���� ����� ���������� ���������.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_02");	//��� �� ������?
};


instance DIA_Pedro_Wurst(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_Wurst_Condition;
	information = DIA_Pedro_Wurst_Info;
	permanent = FALSE;
	description = "���, ������ �������, ����!";
};


func int DIA_Pedro_Wurst_Condition()
{
	if(C_CanFeedNOV(self))
	{
		return TRUE;
	};
};

func void DIA_Pedro_Wurst_Info()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_15_00");	//���, ������ �������, ����!
	AI_Output(self,other,"DIA_Pedro_Wurst_09_01");	//� ���, ��� �� ������� ��� ���. ������ ��� ��� ��������.
	B_FeedNOV(self);
	AI_Output(self,other,"DIA_Pedro_Wurst_09_02");	//�� ������ ���� ��� ��� ���� ��������?
	AI_Output(other,self,"DIA_Pedro_Wurst_15_03");	//������ �� ����, ����� �� �� ���� �� ������.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_04");	//��, ����� ���� �������� - ����� ���� �� ������� �����. � �� ���-��� �������� �� ��� - � ���� �����, ��� ������ �������� �������.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_05");	//���� �� �������� �� �������, �� ��������� ���� ���� ���� �� ����������. ��� �������?
	Info_ClearChoices(DIA_Pedro_Wurst);
	if(Npc_HasItems(other,ItFo_Schafswurst))
	{
		Info_AddChoice(DIA_Pedro_Wurst,"�����, ����� ��� ���� �������.",DIA_Pedro_Wurst_JA);
	};
	Info_AddChoice(DIA_Pedro_Wurst,"���, ������ �� ����.",DIA_Pedro_Wurst_NEIN);
};

func void DIA_Pedro_Wurst_JA()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_JA_15_00");	//�����, ����� ��� ���� �������.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	AI_Output(self,other,"DIA_Pedro_Wurst_JA_09_01");	//�������. �������� ������� ������ ����� � ������ �� ������ ������� �����.
	if(C_WorldIsFixed())
	{
		Wld_InsertItem(ItPl_Mana_Herb_01,"FP_ITEM_KLOSTER_HERB_01");
	};
	Info_ClearChoices(DIA_Pedro_Wurst);
};

func void DIA_Pedro_Wurst_NEIN()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_NEIN_15_00");	//���, ������ �� ����.
	AI_Output(self,other,"DIA_Pedro_Wurst_NEIN_09_01");	//�� ������ ����������� ����� ��������, ��? ��, ����� ���������� ��� ����������...
	Info_ClearChoices(DIA_Pedro_Wurst);
};


instance DIA_Pedro_EINLASS(C_Info)
{
	npc = NOV_600_Pedro;
	condition = DIA_Pedro_EINLASS_Condition;
	information = DIA_Pedro_EINLASS_Info;
	permanent = FALSE;
	description = "� ���� ����� � ���������.";
};


func int DIA_Pedro_EINLASS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_WELCOME) && (other.guild != GIL_NOV) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Pedro_EINLASS_Info()
{
	AI_Output(other,self,"DIA_Pedro_EINLASS_15_00");	//� ���� ����� � ���������.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_01");	//������ � ��������� ������ ������ ��� ���� ������.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_02");	//���� �� ������ ���������� ������, ��� � ������ �� ����������� �������. �� ������� ��� ���������� � ��������.
};


instance DIA_Pedro_TEMPEL(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_TEMPEL_Condition;
	information = DIA_Pedro_TEMPEL_Info;
	permanent = FALSE;
	description = "��� ����� �������, ����� ���� ������� � ���������?";
};


func int DIA_Pedro_TEMPEL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_EINLASS) && (other.guild != GIL_NOV) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Pedro_TEMPEL_Info()
{
	AI_Output(other,self,"DIA_Pedro_TEMPEL_15_00");	//��� ����� �������, ����� ���� ������� � ���������?
	if(other.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_01");	//����������� � ��������� ���������� ��� ���� - �� ��� ������ ���� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_02");	//���� �� ������ ���� �������� � �������� ������, �� ������ ����� � ��������� ������� ���������.
		if(Pedro_NOV_Aufnahme_LostInnosStatue_Daron == FALSE)
		{
			AI_Output(self,other,"DIA_ADDON_Pedro_TEMPEL_09_03");	//����� ������ ������� ������ �������� ��� ������.
			AI_Output(self,other,"DIA_ADDON_Pedro_TEMPEL_09_04");	//���� � 1000 �������.
			AI_Output(other,self,"DIA_Pedro_TEMPEL_15_04");	//��� ����� ���� ������.
			AI_Output(self,other,"DIA_Pedro_TEMPEL_09_05");	//��� ���� ����, ��� �� ��������� ����� ����� � �������� ����� ������. ����� �� ������ ������, ��� ���� ���������� ����������� ����� �������.
			B_KlosterTributInfo();
		};
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_06");	//� ���������� ������� - ����� �� �� ������� ���������� �� ������ ������� ����� ������ ������.
	};
};


func void B_GiveLostStatueToPedro()
{
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_Abgeben_15_00");	//� ���� ������ ��������� ����?
	AI_Output(self,other,"DIA_Addon_Pedro_Statuette_Abgeben_09_01");	//�������. � ���������� � ���. ��������� ���� �� ��������.
	B_GiveInvItems(other,self,ItMi_LostInnosStatue_Daron,1);
	Npc_RemoveInvItem(self,ItMi_LostInnosStatue_Daron);
	PedroGotLostInnosStatue = TRUE;
	LostInnosStatueInMonastery = TRUE;
	MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_ReturnedLostInnosStatue_Daron);
};

instance DIA_Addon_Pedro_Statuette(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Addon_Pedro_Statuette_Condition;
	information = DIA_Addon_Pedro_Statuette_Info;
	permanent = FALSE;
	description = "� ���� ���� ��� ��� ���������. �����, ��� ������� �� ���������.";
};


func int DIA_Addon_Pedro_Statuette_Condition()
{
	if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron) && (MIS_Addon_Daron_GetStatue == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pedro_Statuette_Info()
{
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_15_00");	//� ���� ���� ��� ��� ���������. �����, ��� ������� �� ���������.
	if(Npc_KnowsInfo(other,DIA_Pedro_TEMPEL) && (other.guild != GIL_NOV) && (other.guild != GIL_KDF))
	{
		AI_Output(other,self,"DIA_Addon_Pedro_Statuette_15_01");	//������ � ���� �����?
	};
	if((other.guild == GIL_NONE) || ((other.guild == GIL_NOV) && (DIA_Gorax_GOLD_perm == FALSE)))
	{
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_02");	//��, �����, ��� � ����� �������������� ���������������, �� ������ ����� ����������� ���������.
		Pedro_NOV_Aufnahme_LostInnosStatue_Daron = TRUE;
		B_LogEntry(TOPIC_Addon_RangerHelpKDF,TOPIC_Addon_PedroPass);
	}
	else if((other.guild != GIL_NOV) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_03");	//�����, ���� ��� ������������� �� ������� ���� ���� ������.
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_04");	//�� ��� ������ ���� ����. ��������� ��� ���� ������.
	}
	else
	{
		B_Say(self,other,"$ABS_GOOD");
		B_GiveLostStatueToPedro();
	};
};


instance DIA_Addon_Pedro_Statuette_Abgeben(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Addon_Pedro_Statuette_Abgeben_Condition;
	information = DIA_Addon_Pedro_Statuette_Abgeben_Info;
	permanent = FALSE;
	description = "� ���� ������ ��������� ����?";
};


func int DIA_Addon_Pedro_Statuette_Abgeben_Condition()
{
	if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron) && Npc_KnowsInfo(other,DIA_Addon_Pedro_Statuette) && (LostInnosStatueInMonastery == FALSE))
	{
		if((other.guild != GIL_NONE) && (other.guild != GIL_NOV) && (other.guild != GIL_KDF))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Pedro_Statuette_Abgeben_Info()
{
	B_GiveLostStatueToPedro();
};


instance DIA_Pedro_Rules(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_Rules_Condition;
	information = DIA_Pedro_Rules_Info;
	permanent = FALSE;
	description = "��� ��� �� �������, �� ������� �� ������?";
};


func int DIA_Pedro_Rules_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_TEMPEL))
	{
		return TRUE;
	};
};

func void DIA_Pedro_Rules_Info()
{
	AI_Output(other,self,"DIA_Pedro_Rules_15_00");	//��� ��� �� �������, �� ������� �� ������?
	AI_Output(self,other,"DIA_Pedro_Rules_09_01");	//����� - ��� ������ � ������. ������� �� ������� �� ���� � �� ��������� ������������.
	AI_Output(self,other,"DIA_Pedro_Rules_09_02");	//���� �� ��������� ������ ����� �� ����� ������ ��� �������� ���� �������������, ���� �������� ��������� �� ��� �����.
	AI_Output(self,other,"DIA_Pedro_Rules_09_03");	//����� ����� ��� ��������� � ����.
	AI_Output(self,other,"DIA_Pedro_Rules_09_04");	//������ �����������, �� ������ ��������� ���������� � �������� �� ���� ����� ����.
	AI_Output(other,self,"DIA_Pedro_Rules_15_05");	//�������.
	AI_Output(self,other,"DIA_Pedro_Rules_09_06");	//����� ����, ��������� ������ ��������� ������ � ��������� �� ����� ������.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_Rules_09_07");	//���� �� ����� ��������� ���� ��������, � � ���� ���� ���������� ������, �� ������ ������� ���� � ��������� � �������� ����������.
	};
};


instance DIA_Pedro_AUFNAHME(C_Info)
{
	npc = NOV_600_Pedro;
	condition = DIA_Pedro_AUFNAHME_Condition;
	information = DIA_Pedro_AUFNAHME_Info;
	permanent = TRUE;
	description = "� ���� ����� �����������.";
};


var int DIA_Pedro_AUFNAHME_NOPERM;

func int DIA_Pedro_AUFNAHME_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_Rules) && (DIA_Pedro_AUFNAHME_NOPERM == FALSE) && (other.guild != GIL_NOV) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void B_DIA_Pedro_AUFNAHME_Choice()
{
	Info_ClearChoices(DIA_Pedro_AUFNAHME);
	Info_AddChoice(DIA_Pedro_AUFNAHME,"� ��� ������� ������� ��� ����.",DIA_Pedro_AUFNAHME_NO);
	Info_AddChoice(DIA_Pedro_AUFNAHME,"��, � ���� ��������� ���� ����� �������� ������.",DIA_Pedro_AUFNAHME_YES);
};

func void DIA_Pedro_AUFNAHME_Info()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_15_00");	//� ���� ����� �����������.
	Npc_PerceiveAll(self);
	if(hero.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_01");	//�� ��� ������ ���� ����. ���� ����� ������ ��� ����.
		DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	}
	else if(Npc_KnowsInfo(other,DIA_Addon_Pedro_Statuette))
	{
		AI_Output(self,other,"DIA_Addon_Pedro_AUFNAHME_09_02");	//���� ������� ������������? ���� ����� ��� ���� ��� �� �����.
		B_DIA_Pedro_AUFNAHME_Choice();
	}
	else if((Npc_HasItems(hero,ItMi_Gold) >= Summe_Kloster) && Wld_DetectNpc(self,Follow_Sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 1000))
	{
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_03");	//� ����, �� ������ ����������� ����������. ���� �� ������������� ������� �����, �� ������ ����� �����������.
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_04");	//������, ���� �� ������� ��� �������, ���� ����� �� ����� - ������ �������, ���� �� ��� ����!
		B_DIA_Pedro_AUFNAHME_Choice();
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_02");	//�� �� ������ ����������� ����������.
	};
};

func void DIA_Pedro_AUFNAHME_YES()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_00");	//��, � ���� ��������� ���� ����� �������� ������.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_01");	//����� ����� ����������, ����. � ��� ���� ���� ���� �� ������������ �����.
	CreateInvItems(self,ItKe_Innos_MIS,1);
	B_GiveInvItems(self,other,ItKe_Innos_MIS,1);
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_02");	//� ���� ������ ������������� �������� ����� �������, �� ������ ��� ������� ��� ������ � ����� ������.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_03");	//������ �� ���������. ���� ��� ���� � ���� ����, ��� ������ �� ���� ������ ��������.
	B_SetGuild(hero,GIL_NOV);
	B_GiveArmor(ITAR_NOV_L);
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_04");	//����� �� ������� � ���������, ������� � �������. � ����� ������� �� ����� �������� �� ����.
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_05");	//��� ����������� ������ �������?
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_06");	//���� ��� ���. �������� � �������� ��������. �� ����������� ���� � ������� �� ����� ������.
	DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	NOV_Aufnahme = LOG_SUCCESS;
	SLD_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	B_GivePlayerXP(XP_AufnahmeNovize);
	if(!Npc_IsDead(Gorax))
	{
		if(Npc_HasItems(Gorax,ItKe_Innos_MIS))
		{
			Npc_RemoveInvItem(Gorax,ItKe_Innos_MIS);
		};
		CreateInvItems(Gorax,ItBe_Addon_NOV_01,1);
	};
	if(Npc_KnowsInfo(other,DIA_Addon_Pedro_Statuette))
	{
		Pedro_NOV_Aufnahme_LostInnosStatue_Daron = TRUE;
		Liesel_Giveaway = LOG_OBSOLETE;
	};
	if(MIS_Addon_Daron_GetStatue == LOG_Running)
	{
		Log_CreateTopic(TOPIC_Addon_HelpDaron,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HelpDaron,LOG_Running);
		Log_AddEntry(TOPIC_Addon_HelpDaron,TOPIC_Addon_DaronGobbos);
		Log_AddEntry(TOPIC_Addon_HelpDaron,TOPIC_Addon_PedroPass);
	};
	AI_StopProcessInfos(self);
};

func void DIA_Pedro_AUFNAHME_NO()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_NO_15_00");	//� ��� ������� ������� ��� ����.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_NO_09_01");	//�����������, ����� ������ �����.
	Info_ClearChoices(DIA_Pedro_AUFNAHME);
};


instance DIA_Pedro_Monastery(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 90;
	condition = DIA_Pedro_Monastery_Condition;
	information = DIA_Pedro_Monastery_Info;
	permanent = TRUE;
	description = "�������� ��� � ����� � ���������.";
};


func int DIA_Pedro_Monastery_Condition()
{
	if(other.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Pedro_Monastery_Info()
{
	AI_Output(other,self,"DIA_Pedro_Monastery_15_00");	//�������� ��� � ����� � ���������.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_01");	//�� ����� � ���������, ����� ������� ������. ��, ����������, ��������� ��������� ������ � ������� �������, ����� � ��� ���������� ����� �����������.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_02");	//���� ������������� �� ����, � ����� ������� ��������� �����.
};

