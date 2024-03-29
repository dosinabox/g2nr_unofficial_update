
instance DIA_Borka_EXIT(C_Info)
{
	npc = VLK_434_Borka;
	nr = 999;
	condition = DIA_Borka_EXIT_Condition;
	information = DIA_Borka_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Borka_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Borka_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Borka_PISSOFF(C_Info)
{
	npc = VLK_434_Borka;
	condition = DIA_Borka_PISSOFF_Condition;
	information = DIA_Borka_PISSOFF_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Borka_PISSOFF_Condition()
{
	if((Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist) || Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Borka_PISSOFF_Info()
{
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_00");	//�� ��! ���� �� �����? �� �����, ����� � ���� ����� - ��� ����� ���������.
	if(Npc_GetDistToWP(other,"NW_CITY_HABOUR_PUFF_IN_01") > 200)
	{
		AI_Output(self,other,"DIA_Borka_PISSOFF_11_01");	//�� ������ ����� ������ � ��������� �������� - ������� ������. ��� ����� �������� ������� �� ���� �������, ���� � �������!
	};
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_02");	//������ �� ����� ������� ������� ����� ���������� ����, ����� �������� ��������� ������������ ����� � '������� ������'.
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_03");	//� ������ � � ���� �������� ����� ���� - ���, ����� - �������� ���� � �����, ����� ��������� ������� �����!
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_04");	//������ ��, � �� �������� �����������, � ������� ������ �� ����� ���� � �������!
	if(MIS_Andre_REDLIGHT != LOG_Running)
	{
		AI_StopProcessInfos_Pickpocket();
	};
};


instance DIA_Borka_TROUBLE(C_Info)
{
	npc = VLK_434_Borka;
	nr = 3;
	condition = DIA_Borka_TROUBLE_Condition;
	information = DIA_Borka_TROUBLE_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Borka_TROUBLE_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && !Npc_IsDead(Nadja) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_ENTRANCE") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Borka_TROUBLE_Info()
{
	AI_Output(self,other,"DIA_Borka_TROUBLE_11_00");	//��� �� ������ ����� � �����������? ������ ������, ����������� � ����� ������������� �����.
	AI_Output(self,other,"DIA_Borka_TROUBLE_11_01");	//��� ��������� �������� ���� ������� ����� ����� ����� �����!
	if(MIS_Andre_REDLIGHT != LOG_Running)
	{
		AI_StopProcessInfos_Pickpocket();
	};
};


instance DIA_Borka_Smoke(C_Info)
{
	npc = VLK_434_Borka;
	nr = 3;
	condition = DIA_Borka_Smoke_Condition;
	information = DIA_Borka_Smoke_Info;
	permanent = FALSE;
	description = "�� �� ������, ��� ����� ������ ������?";
};


func int DIA_Borka_Smoke_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Knows_Borka_Dealer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Borka_Smoke_Info()
{
	AI_Output(other,self,"DIA_Borka_Smoke_15_00");	//�� �� ������, ��� ����� ������ ������?
	AI_Output(self,other,"DIA_Borka_Smoke_11_01");	//���, ����������!
	AI_StopProcessInfos(self);
};


func void B_Borka_RefuseToTalk()
{
	AI_Output(self,other,"DIA_Borka_BUYHERB_11_01");	//��������, ������ ��������, ���. ���, ������ ����, �����-�� ������. � ������ �� ���� �� � ����� ������.
	Borka_RefuseToTalk = TRUE;
};

instance DIA_Borka_BUYHERB(C_Info)
{
	npc = VLK_434_Borka;
	nr = 2;
	condition = DIA_Borka_BUYHERB_Condition;
	information = DIA_Borka_BUYHERB_Info;
	permanent = TRUE;
	description = "� ������, �� �������� ������.";
};


func int DIA_Borka_BUYHERB_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Knows_Borka_Dealer == TRUE) && (Borka_RefuseToTalk == FALSE) && (Nadja_Victim == FALSE) && (Borka_Deal == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Borka_BUYHERB_Info()
{
	AI_Output(other,self,"DIA_Borka_BUYHERB_15_00");	//� ������, �� �������� ������.
	if(Undercover_Failed_Borka == TRUE)
	{
		B_Borka_RefuseToTalk();
	}
	else
	{
		AI_Output(self,other,"DIA_Borka_BUYHERB_11_02");	//��� ��� ������?
		Info_ClearChoices(DIA_Borka_BUYHERB);
		Info_AddChoice(DIA_Borka_BUYHERB,"� �����, ��� �� �����.",DIA_Borka_BUYHERB_Egal);
		Info_AddChoice(DIA_Borka_BUYHERB,"���� �������.",DIA_Borka_BUYHERB_Nadja);
	};
};

func void DIA_Borka_BUYHERB_Egal()
{
	AI_Output(other,self,"DIA_Borka_BUYHERB_Egal_15_00");	//� �����, ��� �� �����.
	AI_Output(self,other,"DIA_Borka_BUYHERB_Egal_11_01");	//� ������ ���� �����, ��� ������� ����, ����� ��������������, ��� ���� ����� ��������.
	Info_ClearChoices(DIA_Borka_BUYHERB);
	Info_AddChoice(DIA_Borka_BUYHERB,"���� �������.",DIA_Borka_BUYHERB_Nadja);
	Info_AddChoice(DIA_Borka_BUYHERB,"��� �� � ����� ����������� ��� ���?",DIA_Borka_BUYHERB_Deal);
};

func void DIA_Borka_BUYHERB_Nadja()
{
	AI_Output(other,self,"DIA_Borka_BUYHERB_NADJA_15_00");	//���� �������.
	AI_Output(self,other,"DIA_Borka_BUYHERB_NADJA_11_01");	//��, ��� ������ ��� � �� ����� ������. ������, ���� �� ����� ������ �����, ��� ������� ��� �����.
	Nadja_Victim = TRUE;
	Undercover_Failed = TRUE;
	Info_ClearChoices(DIA_Borka_BUYHERB);
};

func void DIA_Borka_BUYHERB_Deal()
{
	AI_Output(other,self,"DIA_Borka_BUYHERB_Deal_15_00");	//��� �� � ����� ����������� ��� ���?
	AI_WaitTillEnd(self,other);
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Borka_BUYHERB_Deal_11_01");	//������... �����������. �� ����� ��� 50 ������� �����, � ��������� ���� ������. ������� ��������.
	Info_ClearChoices(DIA_Borka_BUYHERB);
	Borka_Deal = TRUE;
};


instance DIA_Borka_SECOND_CHANCE(C_Info)
{
	npc = VLK_434_Borka;
	nr = 2;
	condition = DIA_Borka_SECOND_CHANCE_Condition;
	information = DIA_Borka_SECOND_CHANCE_Info;
	permanent = TRUE;
	description = B_BuildPriceString("������������. ��� ���� ������.",50);
};


func int DIA_Borka_SECOND_CHANCE_Condition()
{
	if((Borka_Deal == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 50) && (Borka_RefuseToTalk == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Borka_SECOND_CHANCE_Info()
{
	AI_Output(other,self,"DIA_Borka_SECOND_CHANCE_15_00");	//������������. ��� ���� ������.
	if(Undercover_Failed_Borka == TRUE)
	{
		B_Borka_RefuseToTalk();
	}
	else
	{
		B_GiveInvItems(hero,self,ItMi_Gold,50);
		AI_Output(self,other,"DIA_Borka_SECOND_CHANCE_11_01");	//������...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Borka_SECOND_CHANCE_11_02");	//... ���, ����� ������, ��������� �������.
		B_GiveInvItems(self,hero,ItMi_Joint,1);
		Borka_Deal = 2;
	};
	AI_StopProcessInfos(self);
};

