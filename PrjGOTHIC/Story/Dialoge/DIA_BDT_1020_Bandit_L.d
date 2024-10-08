
instance DIA_BDT_1020_Wegelagerer_EXIT(C_Info)
{
	npc = BDT_1020_Bandit_L;
	nr = 999;
	condition = DIA_Wegelagerer_EXIT_Condition;
	information = DIA_Wegelagerer_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wegelagerer_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wegelagerer_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

func void B_BuildWegelagererDialogOptions()
{
	Info_ClearChoices(DIA_BDT_1020_Wegelagerer_FirstWarn);
	if(Npc_HasItems(other,ItMi_Gold) >= 20)
	{
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"������, ��� ������.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"������, � ���� ��� �����.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"����� � ���� ������!",DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
	if((Wegelagerer_Surprise == FALSE) && (MIS_Schnitzeljagd == LOG_Running) && !Npc_KnowsInfo(other,DIA_Agon_GolemDead) && !Npc_KnowsInfo(other,DIA_Agon_GolemLives))
	{
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"�����, �� �� ����� ����������?",DIA_BDT_1020_Wegelagerer_AGON);
	};
};

const string BDT_1020_Wegelagerer_Checkpoint = "NW_TROLLAREA_PATH_46";
var int Wegelagerer_Spared;
var int Wegelagerer_Hello_Once;

instance DIA_BDT_1020_Wegelagerer_FirstWarn(C_Info)
{
	npc = BDT_1020_Bandit_L;
	nr = 1;
	condition = DIA_BDT_1020_Wegelagerer_FirstWarn_Condition;
	information = DIA_BDT_1020_Wegelagerer_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_BDT_1020_Wegelagerer_FirstWarn_Condition()
{
	if(C_NpcHasGuardStatus(self,BDT_1020_Wegelagerer_Checkpoint,GP_NONE) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_47") < 1000))
	{
		return TRUE;
	};
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_Info()
{
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_1020_Wegelagerer_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	if(Wegelagerer_Spared == TRUE)
	{
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_06_01");	//(����������) 20 �������, � �� ����� ����� ��������.
		B_BuildWegelagererDialogOptions();
	}
	else
	{
		if(Wegelagerer_Hello_Once == FALSE)
		{
			AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_00");	//��, ��, ������!
			AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_15_01");	//��� ���� �����?
			Wegelagerer_Hello_Once = TRUE;
		};
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_02");	//���� �� ������ �������� �� �����, ���� ����� ���������� ��������� ����� �� ������ �������� � ��� - � ������!
		Info_ClearChoices(DIA_BDT_1020_Wegelagerer_FirstWarn);
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"������� �� ������?",DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch);
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"�� ������.",DIA_BDT_1020_Wegelagerer_FirstWarn_Joke);
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"�������� � ������!",DIA_BDT_1020_Wegelagerer_PissOff);
		if((Wegelagerer_Surprise == FALSE) && (MIS_Schnitzeljagd == LOG_Running) && !Npc_KnowsInfo(other,DIA_Agon_GolemDead) && !Npc_KnowsInfo(other,DIA_Agon_GolemLives))
		{
			Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"�����, �� �� ����� ����������?",DIA_BDT_1020_Wegelagerer_AGON);
		};
	};
};

func void DIA_BDT_1020_Wegelagerer_AGON()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_AGON_15_00");	//�����, �� �� ����� ����������?
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_AGON_06_01");	//(���������) �-�... ���? ����... (������) ����� ����.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_AGON_06_02");	//��� ��� 20 �������, � � ����� ����!
	Wegelagerer_Surprise = TRUE;
	B_BuildWegelagererDialogOptions();
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_15_00");	//������� �� ������?
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_06_01");	//(����������) 20 �������, � �� ����� ����� ��������.
	B_BuildWegelagererDialogOptions();
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_Joke()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_15_00");	//�� ������.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_01");	//� ����� �� �������?
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_02");	//���� � �� ����� 20 ������� �� ����, ��� �� �������� ��� ������...
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_03");	//...� �������� ����. ��� ��� ����� ���� �������.
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	B_BuildWegelagererDialogOptions();
};

func void DIA_BDT_1020_Wegelagerer_PissOff()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_PissOff_15_00");	//�������� � ������!
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_01");	//��, ����� ������� ����� �� ������ ����������� �����.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_02");	//������ ����� ��������� ���� ����.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void B_WegelagererToldAboutAgon()
{
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_02");	//������, ���� ��������� ������ ����� ����� ���� �����.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_03");	//��-�����, �� ������� ���������, ��� ����� �����������... � ������ ����������.
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_15_00");	//������, ��� ������.
	B_GiveInvItems(other,self,ItMi_Gold,20);
	if(Wegelagerer_Surprise == FALSE)
	{
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_01");	//(����������) ����� ����, 20 ������� - ��� �� ����� �� ������� ����� �� �����. �� ������ ���������.
	}
	else
	{
		B_WegelagererToldAboutAgon();
	};
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_15_00");	//������, � ���� ��� �����.
	if(Wegelagerer_Spared == FALSE)
	{
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_01");	//�� ��, �������� ������� ������� �������.
		if(Npc_HasEquippedMeleeWeapon(other) || Npc_HasReadiedWeapon(other))
		{
			AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_02");	//����� ����� �������� ��� - ����� ��� ���� ������. � � ������� ����.
			Info_ClearChoices(DIA_BDT_1020_Wegelagerer_FirstWarn);
			Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"������ �� ����.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon);
			Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn,"���, ������ ��� ������.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon);
		}
		else
		{
			AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_03");	//����� ���� ���: �����������, ����� � ���� ����� ������. ��� ����� - ��� �����.
			Wegelagerer_Spared = TRUE;
			self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		B_Say(self,other,"$DIEENEMY");
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_Never()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_15_00");	//����� � ���� ������!
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_06_01");	//�� ����, �� ��-�������� �� ������?
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_15_00");	//������ �� ����.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_06_01");	//�����, ��-�������, ��� ��-�������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void B_BDT_1020_Wegelagerer_PassGranted()
{
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_06_01");	//��, ��� �� ����������.
	self.aivar[AIV_PASSGATE] = TRUE;
	if(Wegelagerer_Surprise == TRUE)
	{
		DIA_Common_NovicePassedBy();
		B_WegelagererToldAboutAgon();
	};
	AI_StopProcessInfos(self);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_15_00");	//���, ������ ��� ������.
	if(!Npc_HasReadiedWeapon(other))
	{
		AI_DrawWeapon(other);
	};
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_06_01");	//������ �� ����� ������. �� �������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
};


instance DIA_BDT_1020_Wegelagerer_SecondWarn(C_Info)
{
	npc = BDT_1020_Bandit_L;
	nr = 2;
	condition = DIA_BDT_1020_Wegelagerer_SecondWarn_Condition;
	information = DIA_BDT_1020_Wegelagerer_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_BDT_1020_Wegelagerer_SecondWarn_Condition()
{
	if(C_NpcHasGuardStatus(self,BDT_1020_Wegelagerer_Checkpoint,GP_FirstWarnGiven) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_47") < 1000))
	{
		return TRUE;
	};
};

func void DIA_BDT_1020_Wegelagerer_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_06_00");	//�� ������������� ������ �������� ������? ��� ������.
	Info_ClearChoices(DIA_BDT_1020_Wegelagerer_SecondWarn);
	if(Npc_HasItems(other,ItMi_Gold) >= 20)
	{
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_SecondWarn,"��� ���� ������.",DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney);
	};
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_SecondWarn,"� �� ��� ���� �� �����.",DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney);
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_1020_Wegelagerer_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
};

func void DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_15_00");	//��� ���� ������.
	B_GiveInvItems(other,self,ItMi_Gold,20);
	B_BDT_1020_Wegelagerer_PassGranted();
};

func void DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_15_00");	//� �� ��� ���� �� �����.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_06_01");	//����� � ��� �� ������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_BDT_1020_Wegelagerer_Attack(C_Info)
{
	npc = BDT_1020_Bandit_L;
	nr = 3;
	condition = DIA_BDT_1020_Wegelagerer_Attack_Condition;
	information = DIA_BDT_1020_Wegelagerer_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_BDT_1020_Wegelagerer_Attack_Condition()
{
	if(C_NpcHasGuardStatus(self,BDT_1020_Wegelagerer_Checkpoint,GP_SecondWarnGiven) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_47") < 1000))
	{
		return TRUE;
	};
};

func void DIA_BDT_1020_Wegelagerer_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance BDT_1020_Bandit_L_GetLost(C_Info)
{
	npc = BDT_1020_Bandit_L;
	nr = 2;
	condition = BDT_1020_Bandit_L_GetLost_Condition;
	information = BDT_1020_Bandit_L_GetLost_Info;
	important = TRUE;
	permanent = TRUE;
};


func int BDT_1020_Bandit_L_GetLost_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_47") >= 1000))
	{
		return TRUE;
	};
};

func void BDT_1020_Bandit_L_GetLost_Info()
{
	B_Say(self,other,"$GETOUTOFHERE");
	AI_StopProcessInfos(self);
};

instance DIA_BDT_1020_Wegelagerer_AGON2(C_Info)
{
	npc = BDT_1020_Bandit_L;
	nr = 900;
	condition = DIA_Wegelagerer_AGON2_Condition;
	information = DIA_Wegelagerer_AGON2_Info;
	permanent = FALSE;
	description = "���� ���� �� �������� ���������?";
};


func int DIA_Wegelagerer_AGON2_Condition()
{
	if((Wegelagerer_Surprise == FALSE) && (MIS_Schnitzeljagd == LOG_Running) && !Npc_KnowsInfo(other,DIA_Agon_GolemDead) && !Npc_KnowsInfo(other,DIA_Agon_GolemLives))
	{
		return TRUE;
	};
};

func void DIA_Wegelagerer_AGON2_Info()
{
	DIA_Common_NovicePassedBy();
	B_WegelagererToldAboutAgon();
	AI_StopProcessInfos(self);
};

