
instance DIA_Cornelius_Exit(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 999;
	condition = DIA_Cornelius_Exit_Condition;
	information = DIA_Cornelius_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cornelius_Exit_Condition()
{
	return TRUE;
};

func void DIA_Cornelius_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cornelius_Hello(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 2;
	condition = DIA_Cornelius_Hello_Condition;
	information = DIA_Cornelius_Hello_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Cornelius_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CorneliusFlee == FALSE))
	{
		if(RescueBennet_KnowsCornelius == FALSE)
		{
			return TRUE;
		}
		else if(MIS_RescueBennet == LOG_SUCCESS)
		{
			return TRUE;
		};
	};
};

func void DIA_Cornelius_Hello_Info()
{
	if(MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_01");	//(�����������) ��������, � ���� ��� ������� �� �������� � �����.
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Cornelius_SeeMurder(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 4;
	condition = DIA_Cornelius_SeeMurder_Condition;
	information = DIA_Cornelius_SeeMurder_Info;
	permanent = FALSE;
	description = "�� �����, ��� ����� ������, ��?";
};


func int DIA_Cornelius_SeeMurder_Condition()
{
	if(RescueBennet_KnowsCornelius == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cornelius_SeeMurder_Info()
{
	AI_Output(other,self,"DIA_Cornelius_SeeMurder_15_00");	//�� �����, ��� ����� ������, ��?
	AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_01");	//(������) � �� ������ �������� �� ����� �������.
	AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_02");	//���� ����� ��� ���������� ����.
	AI_StopProcessInfos(self);
};


instance DIA_Cornelius_WhatYouSee(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 5;
	condition = DIA_Cornelius_WhatYouSee_Condition;
	information = DIA_Cornelius_WhatYouSee_Info;
	permanent = FALSE;
	description = "��� ������ �� �����?";
};


func int DIA_Cornelius_WhatYouSee_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cornelius_SeeMurder))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_WhatYouSee_Info()
{
	AI_Output(other,self,"DIA_Cornelius_WhatYouSee_15_00");	//��� ������ �� �����?
	AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_01");	//(�����������) ��������, � ���� ��� ������� �� �������� � �����.
	AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_02");	//(�����������) �����, � ������ ������ �� ��������.
	B_LogEntry(TOPIC_RescueBennet,"��������� ������������ ������������� �� ����.");
	AI_StopProcessInfos(self);
};


instance DIA_Cornelius_Enough(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 6;
	condition = DIA_Cornelius_Enough_Condition;
	information = DIA_Cornelius_Enough_Info;
	permanent = FALSE;
	description = "������! ��� �� �����?";
};


func int DIA_Cornelius_Enough_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cornelius_WhatYouSee))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_Enough_Info()
{
	AI_Output(other,self,"DIA_Cornelius_Enough_15_00");	//������! ��� �� �����?
	AI_Output(self,other,"DIA_Cornelius_Enough_13_01");	//(������) �... � �����, ��� �������... ����� ���� � ����� ��������.
	AI_Output(self,other,"DIA_Cornelius_Enough_13_02");	//(������) � ����� �� ����� ���� ��� � ������ ��� ��� � �����.
	AI_Output(other,self,"DIA_Cornelius_Enough_15_03");	//�� � ���� ���������� ������?
	AI_Output(self,other,"DIA_Cornelius_Enough_13_04");	//(���������) ��, �������. � ����� ��� ������ ������������ �������.
	AI_Output(self,other,"DIA_Cornelius_Enough_13_05");	//(���������) �� ��� ������ ������ �������. ��� ����� �������� � �����������.
	AI_StopProcessInfos(self);
};


instance DIA_Cornelius_DontBelieveYou(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 4;
	condition = DIA_Cornelius_DontBelieveYou_Condition;
	information = DIA_Cornelius_DontBelieveYou_Info;
	permanent = TRUE;
	description = "� ���� �� ����.";
};


func int DIA_Cornelius_DontBelieveYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cornelius_Enough) && (Cornelius_TellTruth == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_DontBelieveYou_Info()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_15_00");	//� ���� �� ����.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_13_01");	//(� ��������� ������������) � ���? ��� �� ����������� ������?
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
	Info_AddChoice(DIA_Cornelius_DontBelieveYou,"������� �� ������?",DIA_Cornelius_DontBelieveYou_WhatYouWant);
	Info_AddChoice(DIA_Cornelius_DontBelieveYou,"�� ���� ����� �������� ����� ������, ������?",DIA_Cornelius_DontBelieveYou_WantSurvive);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou,"���� ����� �� ��������� �������� � ���������.",DIA_Cornelius_DontBelieveYou_Monastery);
	}
	else if(hero.guild == GIL_SLD)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou,"� ���� ������� ���������, ��� �� ������.",DIA_Cornelius_DontBelieveYou_KnowYourHome);
	}
	else if(hero.guild == GIL_MIL)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou,"�� ���������������� ���� ������� � ������ - � �������!",DIA_Cornelius_DontBelieveYou_Perjury);
	};
};

func void DIA_Cornelius_DontBelieveYou_WhatYouWant()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_00");	//������� �� ������?
	if(Cornelius_PayForProof == FALSE)
	{
		AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_01");	//(��������) � ���� �� ������ ������, ����� ��������� ���.
		AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_02");	//�������?
		B_LogEntry(TOPIC_RescueBennet,"��������� ����� ������������� �� ���� �� 2000 �������.");
		Cornelius_PayForProof = TRUE;
	};
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_03");	//2000 �������. ��... ����� �, ��������, ���������� ���� ����� ������.
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void DIA_Cornelius_DontBelieveYou_WantSurvive()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WantSurvive_15_00");	//�� ���� ����� �������� ����� ������, ������?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_01");	//(���������) ���� �� �������� �� ����, ���� �������.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_02");	//� ���� ����� ����������� ������. ��� ��� ���� �� ����� ������� ���� ���� �� �������.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_03");	//� ������ �������� ������! ��� � ������ ������!
	AI_StopProcessInfos(self);
};

func void DIA_Cornelius_DontBelieveYou_Monastery()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_00");	//���� ����� �� ��������� �������� � ���������.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_01");	//(����� ��� ���) ��� �� ���� ������ �������?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_02");	//��, � ��� ���� ������ ��������� �������� ������. ����� ����������� ������.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_03");	//���, ����������, �� �����. � ����� ���� ���, ��� �� ������ ������.
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void DIA_Cornelius_DontBelieveYou_KnowYourHome()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_00");	//� ���� ������� ���������, ��� �� ������.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_01");	//(����� ��� ���) ��� �� ���� ������ �������?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_02");	//�������, ��� ������ ������������� � �����. �� ����� �� �������� ��� ��������.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_03");	//�� �� ������ ������� ���. ��� ����� ����!
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_04");	//������ ��������.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_05");	//� ����� ���, ��� �� ������, ������ �� ����� �����.
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void DIA_Cornelius_DontBelieveYou_Perjury()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Perjury_15_00");	//�� ���������������� ���� ������� � ������ - � �������!
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_01");	//�� ��������� �������� ���? �����-�� ������ �������� �������� ���, ��������� �����������?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_02");	//���� �� ���������� �� ���������, � ����������, ����� ���� �����������.
//	Cornelius_ThreatenByMilSC = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Cornelius_PayCornelius(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 4;
	condition = DIA_Cornelius_PayCornelius_Condition;
	information = DIA_Cornelius_PayCornelius_Info;
	permanent = FALSE;
	description = "��� ������.";
};


func int DIA_Cornelius_PayCornelius_Condition()
{
	if((Cornelius_PayForProof == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 2000) && (Cornelius_TellTruth == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_PayCornelius_Info()
{
	AI_Output(other,self,"DIA_Cornelius_PayCornelius_15_00");	//��� ������.
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_01");	//����� � �� ���� ����������, ��� �� ��� ����.
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_02");	//������, ���� ������, ���� ��� ������ �� �������.
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_03");	//�������, ��� ��� ������ ���.
	Cornelius_TellTruth = TRUE;
};


instance DIA_Cornelius_RealStory(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 4;
	condition = DIA_Cornelius_RealStory_Condition;
	information = DIA_Cornelius_RealStory_Info;
	permanent = TRUE;
	description = "��� ��� ��������� �� ����� ����?";
};


func int DIA_Cornelius_RealStory_Condition()
{
	if(Cornelius_TellTruth == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cornelius_RealStory_Info()
{
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_00");	//��� ��� ��������� �� ����� ����?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_01");	//� �� �����, ��� ���������. � ������� ������ �� ��, ��� ������ ����� ��������.
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_02");	//� �������� ������� ������ ��� �� ����. � ��� ����� ���� ������.
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_03");	//��� �������� ����?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_04");	//���� ���������� ����, ��� � ������. �� ����� ����, ���� � �����������.
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_05");	//�� ����� ����������� ��������� ����� ����� ������ �������?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_06");	//� ���� ��� �� ����� �� ���. � �� ��������� ���������� � ������.
	if(Npc_HasItems(self,ItWr_CorneliusTagebuch_MIS))
	{
		AI_Output(self,other,"DIA_Cornelius_RealStory_13_07");	//� ��� ���� ��� �������, �� �������� ����������� ���������������.
		B_GiveInvItems(self,other,ItWr_CorneliusTagebuch_MIS,1);
	};
	B_LogEntry(TOPIC_RescueBennet,"��������� ������. ��� ���������, ����� ����� ������� � ������. �� �� �� ������� ���, ��� �������� ���. �� ���� ������ �� ������.");
	CorneliusFlee = TRUE;
	self.aivar[AIV_EnemyOverride] = TRUE;
	self.guild = GIL_BDT;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLEE");
};


instance DIA_Cornelius_Fleeing(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 1;
	condition = DIA_Cornelius_Fleeing_Condition;
	information = DIA_Cornelius_Fleeing_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Cornelius_Fleeing_Condition()
{
	if((CorneliusFlee == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_Fleeing_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

