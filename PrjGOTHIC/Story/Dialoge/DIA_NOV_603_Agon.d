
instance DIA_Agon_EXIT(C_Info)
{
	npc = NOV_603_Agon;
	nr = 999;
	condition = DIA_Agon_EXIT_Condition;
	information = DIA_Agon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Agon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Agon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Agon_Hello(C_Info)
{
	npc = NOV_603_Agon;
	nr = 2;
	condition = DIA_Agon_Hello_Condition;
	information = DIA_Agon_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Agon_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Schnitzeljagd != LOG_Running) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Agon_Hello_Info()
{
	AI_Output(self,other,"DIA_Agon_Hello_07_00");	//(������������) ��� ���� �����?
};


instance DIA_Agon_Wurst(C_Info)
{
	npc = NOV_603_Agon;
	nr = 2;
	condition = DIA_Agon_Wurst_Condition;
	information = DIA_Agon_Wurst_Info;
	permanent = FALSE;
	description = "���, � ���� ���� ������� ������� ��� ����.";
};


func int DIA_Agon_Wurst_Condition()
{
	if(C_CanFeedNOV(self))
	{
		return TRUE;
	};
};

func void DIA_Agon_Wurst_Info()
{
	AI_Output(other,self,"DIA_Agon_Wurst_15_00");	//���, � ���� ���� ������� ������� ��� ����.
	AI_Output(self,other,"DIA_Agon_Wurst_07_01");	//������ �������, ������ ���... ������ ������... ���� ��� ������ �� ������ �� ����.
	AI_Output(other,self,"DIA_Agon_Wurst_15_02");	//��� �� ������ ������� ��� ���?
	AI_Output(self,other,"DIA_Agon_Wurst_07_03");	//�����, ����� �� ����!
	B_FeedNOV(self);
};


instance DIA_Agon_New(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_New_Condition;
	information = DIA_Agon_New_Info;
	permanent = FALSE;
	description = "� ������� �����.";
};


func int DIA_Agon_New_Condition()
{
	if((MIS_Schnitzeljagd == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Agon_New_Info()
{
	AI_Output(other,self,"DIA_Agon_New_15_00");	//� ������� �����.
	AI_Output(self,other,"DIA_Agon_New_07_01");	//� ����.
	AI_Output(self,other,"DIA_Agon_New_07_02");	//���� � ���� ��� ��� ������, �������� � ��������. �� ������� ���� ���-������.
};


instance DIA_Agon_YouAndBabo(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_YouAndBabo_Condition;
	information = DIA_Agon_YouAndBabo_Info;
	permanent = FALSE;
	description = "��� ��������� ����� ����� � ����?";
};


func int DIA_Agon_YouAndBabo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Opolos_Monastery) && (MIS_Schnitzeljagd == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Agon_YouAndBabo_Info()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_15_00");	//��� ��������� ����� ����� � ����?
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_01");	//���� �� ����� ������ �����, ��� �� �������.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_02");	//(����������) ����� �������� ���-���: � ���� ��������� ���, ��� ����� ������. ���, ��� ������������� ��� �����.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_03");	//� ������ �� ������� ������ � ���� �� ����, � �� ������� �� ����� ���������� ����.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
	Info_AddChoice(DIA_Agon_YouAndBabo,"����� ��, ����������, �� ������ ������������ ���� �����?",DIA_Agon_YouAndBabo_AllTogether);
	Info_AddChoice(DIA_Agon_YouAndBabo,"������ ������ ������, ����� ����� ������ �� ����.",DIA_Agon_YouAndBabo_InnosWay);
	Info_AddChoice(DIA_Agon_YouAndBabo,"� �����, �� �������.",DIA_Agon_YouAndBabo_Understand);
};

func void DIA_Agon_YouAndBabo_AllTogether()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_AllTogether_15_00");	//����� ��, ����������, �� ������ ������������ ���� �����?
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_01");	//��, ���������, ������ ������������ ���� ����� ������� ������.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_02");	//��, ����������, �� ����� ��� �����. (�������) ����� �� ����� ������ � ���� �� ����.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
};

func void DIA_Agon_YouAndBabo_InnosWay()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_InnosWay_15_00");	//������ ������ ������, ����� ����� ������ �� ����.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_InnosWay_07_01");	//��� ����� ������ ������������ ���������������� ������, � ����� �� ������� ���.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
};

func void DIA_Agon_YouAndBabo_Understand()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_Understand_15_00");	//� �����, �� �������.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_Understand_07_01");	//�������. ����� � ����� �����, � �������� �� ���� ��������.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
};


instance DIA_Agon_GetHerb(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_GetHerb_Condition;
	information = DIA_Agon_GetHerb_Info;
	permanent = TRUE;
	description = "��� �� ����������� �����?";
};


func int DIA_Agon_GetHerb_Condition()
{
	if(MIS_Schnitzeljagd == FALSE)
	{
		if(Npc_GetDistToWP(self,"NW_MONASTERY_HERB_05") > 600)
		{
			DIA_Agon_GetHerb.description = "��� �� ����� �����������?";
		}
		else
		{
			DIA_Agon_GetHerb.description = "��� �� ����������� �����?";
		};
		return TRUE;
	};
};

func void DIA_Agon_GetHerb_Info()
{
	if(Npc_GetDistToWP(self,"NW_MONASTERY_HERB_05") > 600)
	{
		DIA_Common_WhatAreYouGuysDoingHere();
	}
	else
	{
		AI_Output(other,self,"DIA_Agon_GetHerb_15_00");	//��� �� ����������� �����?
	};
	AI_Output(self,other,"DIA_Agon_GetHerb_07_01");	//�� �������� ��������� �������� �����, �� ������� ������ ������ ������� �����.
};


instance DIA_Agon_GolemDead(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_GolemDead_Condition;
	information = DIA_Agon_GolemDead_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Agon_GolemDead_Condition()
{
	if(MIS_Schnitzeljagd == LOG_Running)
	{
		if(Npc_IsDead(Magic_Golem))
		{
			return TRUE;
		};
	};
};

func void DIA_Agon_GolemDead_Info()
{
	AI_Output(self,other,"DIA_Agon_GolemDead_07_00");	//(������������) �� �������!
	AI_Output(self,other,"DIA_Agon_GolemDead_07_01");	//� ��� ����� ������! � �������!
	Info_ClearChoices(DIA_Agon_GolemDead);
	Info_AddChoice(DIA_Agon_GolemDead,"������ ���� ���� ������� ��������� ������ �����.",DIA_Agon_GolemDead_NoWay);
	Info_AddChoice(DIA_Agon_GolemDead,"��������!",DIA_Agon_GolemDead_ShutUp);
	Info_AddChoice(DIA_Agon_GolemDead,"����������, �� ������������� �������� ���.",DIA_Agon_GolemDead_Congrat);
};

func void DIA_Agon_GolemDead_NoWay()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_NoWay_15_00");	//(���������) ������ ���� ���� ������� ��������� ������ �����.
	AI_Output(self,other,"DIA_Agon_GolemDead_NoWay_07_01");	//�� ������ ����� ����? � ���� ������ �� ���������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Agon_GolemDead_ShutUp()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_15_00");	//��������!
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_01");	//(����������) ��� ����������, �� ��������! ������� � ����.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_02");	//������ ��� ������� ����� �����.
	Info_ClearChoices(DIA_Agon_GolemDead);
	Info_AddChoice(DIA_Agon_GolemDead,"����� � ���. ���� ������ ���.",DIA_Agon_GolemDead_ShutUp_MyChest);
	Info_AddChoice(DIA_Agon_GolemDead,"�� �������.",DIA_Agon_GolemDead_ShutUp_YouWin);
};

func void DIA_Agon_GolemDead_ShutUp_MyChest()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_MyChest_15_00");	//����� � ���. ���� ������ ���.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_MyChest_07_01");	//(� ������) ���, �� �� �������� �����. � ���� ����.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Agon_GolemDead_ShutUp_YouWin()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_YouWin_15_00");	//�� �������.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_01");	//(� ������) ���, ���� �� �������� ����. �� ��������� ���������� �� ����.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_02");	//� �� ������ �����!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Agon_GolemDead_Congrat()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_00");	//����������, �� ������������� �������� ���.
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_01");	//(�����������) ��� ��� ������? ��� �� �������?
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_02");	//�� � ��� ���?
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_03");	//(������) �� ������ �������� ��� ������. �� ������ ����� ���� � ������� ��� ����� ����!
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_04");	//� ���� ������ �� ������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};


instance DIA_Agon_GolemLives(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_GolemLives_Condition;
	information = DIA_Agon_GolemLives_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Agon_GolemLives_Condition()
{
	if(MIS_Schnitzeljagd == LOG_Running)
	{
		if(!Npc_IsDead(Magic_Golem))
		{
			return TRUE;
		};
	};
};

func void DIA_Agon_GolemLives_Info()
{
	AI_Output(self,other,"DIA_Agon_GolemLives_07_00");	//(���������) �� ����� ��� ����� ������ ����. ����� �� ����� ����...
	AI_Output(self,other,"DIA_Agon_GolemLives_07_01");	//(����������) ����� �� ����� ����! � �� ������� ���.
	AI_Output(self,other,"DIA_Agon_GolemLives_07_02");	//���� ���� ������� ����� �� ������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};


instance DIA_Agon_Perm(C_Info)
{
	npc = NOV_603_Agon;
	nr = 2;
	condition = DIA_Agon_Perm_Condition;
	information = DIA_Agon_Perm_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Agon_Perm_Condition()
{
	if((Kapitel >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Agon_Perm_Info()
{
	AI_Output(other,self,"DIA_Agon_Perm_15_00");	//��� ����?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_01");	//��, ������� �� ���� ������, �, �������. � ����������� �������, � � ������, ��� ����� ���� ������� � ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_02");	//(��������) �� ����� ���� ����� �����, � ��������� ������. ������� �� ������ ����� ���� �������������� � �� �������� ���� �� ������. ������.
	};
	AI_StopProcessInfos(self);
};

