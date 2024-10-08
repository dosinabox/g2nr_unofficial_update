
instance DIA_Ehnim_EXIT(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 999;
	condition = DIA_Ehnim_EXIT_Condition;
	information = DIA_Ehnim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ehnim_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ehnim_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_HALLO(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 3;
	condition = DIA_Ehnim_HALLO_Condition;
	information = DIA_Ehnim_HALLO_Info;
	description = "��� ��?";
};


func int DIA_Ehnim_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Ehnim_HALLO_Info()
{
	AI_Output(other,self,"DIA_Ehnim_HALLO_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Ehnim_HALLO_12_01");	//���� ����� ����. � ������� �����.
	if(!C_NpcIsDown(Egill))
	{
		AI_Output(self,other,"DIA_Ehnim_HALLO_12_02");	//� ��������� ��� ��� - ��� ���� �����.
		AI_Output(self,other,"DIA_Ehnim_HALLO_12_03");	//�� �������� �����, �� ����� �����, ��� ��������� ���.
	};
};


instance DIA_Ehnim_FELDARBEIT(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 4;
	condition = DIA_Ehnim_FELDARBEIT_Condition;
	information = DIA_Ehnim_FELDARBEIT_Info;
	description = "��� ���� ������?";
};


func int DIA_Ehnim_FELDARBEIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ehnim_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_FELDARBEIT_Info()
{
	AI_Output(other,self,"DIA_Ehnim_FELDARBEIT_15_00");	//��� ���� ������?
	AI_Output(self,other,"DIA_Ehnim_FELDARBEIT_12_01");	//�� ������ ������? ��� ���� ��� ���� ������. ���� �� � ������ � ����.
	AI_Output(self,other,"DIA_Ehnim_FELDARBEIT_12_02");	//����� ������ ���� ����������, ����� ������� ������� �� ���������� � ���� ���������. ��� ������ ����, ���� �������� �� �������.
};


instance DIA_Ehnim_FELDRAEUBER(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 5;
	condition = DIA_Ehnim_FELDRAEUBER_Condition;
	information = DIA_Ehnim_FELDRAEUBER_Info;
	description = "������ �� ������ �� ������� � ����� �������� ���������?";
};


func int DIA_Ehnim_FELDRAEUBER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ehnim_FELDARBEIT))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_FELDRAEUBER_Info()
{
	AI_Output(other,self,"DIA_Ehnim_FELDRAEUBER_15_00");	//������ �� ������ �� ������� � ����� �������� ���������?
	AI_Output(self,other,"DIA_Ehnim_FELDRAEUBER_12_01");	//� ���� �� �������, ��� ��� ������ �� �����. �� �������� � ���, ��� �� ����� ������ �������� �����.
};


instance DIA_Ehnim_STREIT1(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 6;
	condition = DIA_Ehnim_STREIT1_Condition;
	information = DIA_Ehnim_STREIT1_Info;
	description = "���� ���� ������ ��� �� �� �����.";
};


func int DIA_Ehnim_STREIT1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Egill_FELDRAEUBER) && Npc_KnowsInfo(other,DIA_Ehnim_FELDRAEUBER) && !Npc_KnowsInfo(other,DIA_Egill_STREIT2) && !C_NpcIsDown(Egill))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_STREIT1_Info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT1_15_00");	//���� ���� ������ ��� �� �� �����.
	AI_Output(self,other,"DIA_Ehnim_STREIT1_12_01");	//���? ���� ����? �� �� ������ ��������, ��� ������ ��� ����� ���� �� ����������� � ����� �����.
	AI_Output(self,other,"DIA_Ehnim_STREIT1_12_02");	//��� �� ����� ����� ����� ����.
};


instance DIA_Ehnim_STREIT3(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 7;
	condition = DIA_Ehnim_STREIT3_Condition;
	information = DIA_Ehnim_STREIT3_Info;
	description = "���� ���� ������, ��� �� �������.";
};


func int DIA_Ehnim_STREIT3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Egill_STREIT2) && !C_NpcIsDown(Egill))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_STREIT3_Info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT3_15_00");	//���� ���� ������, ��� �� �������.
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_01");	//���? � ���� ������������� ������� �������� ������� ���?
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_02");	//��� ����� ������� �� ����� ������, � �� ��� �������� ����� ��������� ��� ����.
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_03");	//���, � ����� ��� ���.
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_STREIT5(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 8;
	condition = DIA_Ehnim_STREIT5_Condition;
	information = DIA_Ehnim_STREIT5_Info;
	permanent = TRUE;
	description = "� �����, ��� ����� ����� ������ ������.";
};


var int DIA_Ehnim_STREIT5_noPerm;

func int DIA_Ehnim_STREIT5_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Egill_STREIT4) && !C_NpcIsDown(Egill) && (DIA_Ehnim_STREIT5_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_STREIT5_Info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_15_00");	//� �����, ��� ����� ����� ������ ������.
	AI_Output(self,other,"DIA_Ehnim_STREIT5_12_01");	//���� ������� �� ��������� �� ����� ����, � ����?
	AI_Output(self,other,"DIA_Ehnim_STREIT5_12_02");	//� ��� ����� �����. ����� ��� ���.
	Info_ClearChoices(DIA_Ehnim_STREIT5);
	Info_AddChoice(DIA_Ehnim_STREIT5,"�����, ��� ������. � � �����.",DIA_Ehnim_STREIT5_gehen);
	Info_AddChoice(DIA_Ehnim_STREIT5,"������ �� �� ������� ��� ��� ���?",DIA_Ehnim_STREIT5_Attack);
};

func void DIA_Ehnim_STREIT5_Attack()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_Attack_15_00");	//������ �� �� ������� ��� ��� ���?
	AI_Output(self,other,"DIA_Ehnim_STREIT5_Attack_12_01");	//������ ����� � ������ ���.
	AI_StopProcessInfos(self);
	DIA_Ehnim_STREIT5_noPerm = TRUE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack(self,Egill,AR_NONE,0);
	B_GivePlayerXP(XP_EgillEhnimStreit);
};

func void DIA_Ehnim_STREIT5_gehen()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_gehen_15_00");	//�����, ��� ������. � � �����.
	AI_Output(self,other,"DIA_Ehnim_STREIT5_gehen_12_01");	//��, ����� ������.
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_PERMKAP1(C_Info)
{
	npc = BAU_944_Ehnim;
	condition = DIA_Ehnim_PERMKAP1_Condition;
	information = DIA_Ehnim_PERMKAP1_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Ehnim_PERMKAP1_Condition()
{
	if((DIA_Ehnim_STREIT5_noPerm == TRUE) && Npc_IsInState(self,ZS_Talk) && ((Kapitel < 3) || (hero.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_PERMKAP1_Info()
{
	AI_Output(self,other,"DIA_Ehnim_PERMKAP1_12_00");	//���� ���� ����, ��� �� ��������? � �����, ���� ����� ����.
	AI_StopProcessInfos_Pickpocket();
};


instance DIA_Ehnim_MoleRatFett(C_Info)
{
	npc = BAU_944_Ehnim;
	condition = DIA_Ehnim_MoleRatFett_Condition;
	information = DIA_Ehnim_MoleRatFett_Info;
	important = TRUE;
};


func int DIA_Ehnim_MoleRatFett_Condition()
{
	if((DIA_Ehnim_STREIT5_noPerm == TRUE) && (Kapitel >= 3) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_MoleRatFett_Info()
{
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_00");	//�� ��� ��� �����?
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_15_01");	//�� ��. ��� ��� ���������?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_02");	//�� ���� ����. ������ �� ����. �����, �� �� ��� ������� �� ����� �������?
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_15_03");	//����� ����. � ���?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_04");	//��, ������ ������. � ������ ����� ���������� � ���� � ��� ���������.
	Info_ClearChoices(DIA_Ehnim_MoleRatFett);
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"� ���� ������ ��� ������� �� ���.",DIA_Ehnim_MoleRatFett_nein);
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"���������? ����� ���������?",DIA_Ehnim_MoleRatFett_was);
	if(Npc_IsDead(Vino))
	{
		Info_AddChoice(DIA_Ehnim_MoleRatFett,"���� �����.",DIA_Ehnim_MoleRatFett_tot);
	};
};

func void DIA_Ehnim_MoleRatFett_tot()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_tot_15_00");	//���� �����.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_tot_12_01");	//� ����. ����-�� �����.
};

func void DIA_Ehnim_MoleRatFett_was()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_15_00");	//���������? ����� ���������?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_01");	//��. ���, ��������, �� ������ �������� �� ����. ���� ������ ��� �������� ��������� � ����� ������ ���������� �������.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_02");	//�� �����, ��� ����� ��� � �����������. � ����, ���������� �� �����, ���� ������� ��������� ���������.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_03");	//��������� ���� ����� �� �������� ���� ���� ��� ���-������, ����� ������� �������� �������, ������������� ���.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_04");	//��������� ����� ��� �����, � ��� ���������. ������� ���������, � �� �� ����� ������� �������.
	if(FoundVinosKellerei == FALSE)
	{
		Log_CreateTopic(TOPIC_FoundVinosKellerei,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_FoundVinosKellerei,LOG_Running);
		B_LogEntry(TOPIC_FoundVinosKellerei,"���� ��������� ���, ��� ���� �������� ��������� ������������ ����� � ���� ����� ����� �����. �� ��������, ����������� �������, ���������, � �������� ��� ����� ������ ������ ���������� ����� ����������.");
		Info_AddChoice(DIA_Ehnim_MoleRatFett,"�? �� ������ ������?",DIA_Ehnim_MoleRatFett_was_Fett);
	}
	else
	{
		DIA_Common_Yeah();
	};
};

func void DIA_Ehnim_MoleRatFett_was_Fett()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_15_00");	//�? �� ������ ������?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_12_01");	//��, �������. ����� ������. ��� ����������. ����������� ����, ����� � ����. �� ���������� ���� ��� ������ ����������� �����.
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"������ ��� ����� ����.",DIA_Ehnim_MoleRatFett_was_Fett_habenwill);
};


var int Ehnim_MoleRatFettOffer;

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_00");	//������ ��� ����� ����.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_01");	//��� ��������� ���� ��������, ��������. �� ����� ����� ����������� � ���� ����� ������.
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_02");	//�������?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_03");	//���. 100 �������?
	Ehnim_MoleRatFettOffer = 100;
	Info_ClearChoices(DIA_Ehnim_MoleRatFett);
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"��� ������� �����.",DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel);
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"������������.",DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_15_00");	//������������.
	if(B_GiveInvItems(other,self,ItMi_Gold,Ehnim_MoleRatFettOffer))
	{
		AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_01");	//������. ���, �����.
		if(Npc_HasItems(self,ItMi_Moleratlubric_MIS))
		{
			B_GiveInvItems(self,other,ItMi_Moleratlubric_MIS,1);
			if(!Npc_IsDead(Vino))
			{
				AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_02");	//(���� ��� ���) ���� ����� ���� �� ���.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_03");	//����, � ���� �� ��� ����������? ��� �� ������. ������. ������, � ���� �� �� ��������. ���, ������ ���� ������ �����.
			B_GiveInvItems(self,other,ItMi_Gold,Ehnim_MoleRatFettOffer);
			if(!C_NpcIsDown(Egill))
			{
				AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_04");	//����� ����������, ��� �������� ����� �����. ��� �������.
				AI_StopProcessInfos(self);
				other.aivar[AIV_INVINCIBLE] = FALSE;
				B_Attack(self,Egill,AR_NONE,0);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_05");	//��� ������-�� �� ���������. ������� �� ��������������� � ������, � ����� �����������, ��� � ���� ���� ��� �����! �����, � �� ���� ���� ������!
	};
	AI_StopProcessInfos(self);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_15_00");	//��� ������� �����.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_12_01");	//������, ������. 70 �������. �� ��� ��� ��������� ����.
	Ehnim_MoleRatFettOffer = 70;
	Info_ClearChoices(DIA_Ehnim_MoleRatFett);
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"��� ��� ����� ������� �����.",DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch);
	Info_AddChoice(DIA_Ehnim_MoleRatFett,"������������.",DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_immernoch_15_00");	//��� ��� ����� ������� �����.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_immernoch_12_01");	//(�������) ����� ������ �� ����. ������.
	AI_StopProcessInfos(self);
};

func void DIA_Ehnim_MoleRatFett_nein()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_nein_15_00");	//� ���� ������ ��� ������� �� ���.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_nein_12_01");	//����� �� ���� ��������� ����, ������.
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_PERMKAP3(C_Info)
{
	npc = BAU_944_Ehnim;
	condition = DIA_Ehnim_PERMKAP3_Condition;
	information = DIA_Ehnim_PERMKAP3_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Ehnim_PERMKAP3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ehnim_MoleRatFett) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_PERMKAP3_Info()
{
	AI_Output(self,other,"DIA_Ehnim_PERMKAP3_12_00");	//� ���� ��� ������� �� ����.
	AI_StopProcessInfos_Pickpocket();
};

