
instance DIA_Nagur_EXIT(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 999;
	condition = DIA_Nagur_EXIT_Condition;
	information = DIA_Nagur_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Nagur_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Nagur_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


func void B_Nagur_LeaveMeAlone()
{
	AI_Output(self,other,"DIA_Nagur_Hallo_08_01");	//��������, ������ ���� � �����, ������?
};

instance DIA_Nagur_Hallo(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 2;
	condition = DIA_Nagur_Hallo_Condition;
	information = DIA_Nagur_Hallo_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Nagur_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Kardif_Diebeswerk_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Hallo_Info()
{
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Nagur_Hallo_08_00");	//��, � ���� ��� �������, ����� ������� � �����. ���� ���� ����� ����������, �������� � ��������.
	}
	else
	{
		B_Nagur_LeaveMeAlone();
	};
	AI_StopProcessInfos(self);
};


var int NagurHack;

func void B_Nagur_Abfertigen()
{
	if(!C_LawArmorEquipped(other))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_02");	//�� �������, � �� ����� ����, ��� �� ����� ������ ������?!
	};
	AI_Output(self,other,"DIA_Nagur_Add_08_03");	//(������������) �� ��� ��� ����, ���� �� �������!
	AI_Output(self,other,"DIA_Nagur_Add_08_04");	//����������!
	NagurHack = TRUE;
	AI_StopProcessInfos(self);
};

func void B_Nagur_RefuseToTalk()
{
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_WaitTillEnd(self,other);
		AI_PlayAni(self,"T_SEARCH");
	};
	B_Nagur_LeaveMeAlone();
	DIA_Common_IllBeBackLater();
	AI_StopProcessInfos(self);
};

instance DIA_Nagur_Job(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 3;
	condition = DIA_Nagur_Job_Condition;
	information = DIA_Nagur_Job_Info;
	permanent = TRUE;
	description = "������ �������, ��� � ���� ����� ���� ������ ��� ����.";
};


func int DIA_Nagur_Job_Condition()
{
	if((DIA_Kardif_Diebeswerk_permanent == TRUE) && (Nagur_Job_Dia1_Passed == FALSE) && (NagurHack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Job_Info()
{
	AI_Output(other,self,"DIA_Nagur_Job_15_00");	//������ �������, ��� � ���� ����� ���� ������ ��� ����.
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_00");	//�����, � ������, ��� ������ ��� ����� �� ���������! (�������)
		B_Nagur_Abfertigen();
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_01");	//�����, � ������, ��� ������ ��� ����������� ������.
		B_Nagur_Abfertigen();
	}
	else
	{
		if(C_MartinIsNear())
		{
			B_Nagur_RefuseToTalk();
		}
		else
		{
			Nagur_Job_Dia1_Passed = TRUE;
			AI_Output(self,other,"DIA_Nagur_Job_08_01");	//(����������) ���, ���... �� ����� ��������� ������. �����. �� ����� ������ �� ���� ��������, �������?
			AI_Output(other,self,"DIA_Nagur_Job_15_02");	//��� ��� ������?
			AI_Output(self,other,"DIA_Nagur_Job_08_03");	//��� ������, ��� �� ������ ������, ��� � �����, � ������ �������� ����� �� ������.
			AI_Output(self,other,"DIA_Nagur_Job_08_04");	//���� ���� ��� �� ����������, �� � ���� ��� ������ ��� ����.
			Info_ClearChoices(DIA_Nagur_Job);
			Info_AddChoice(DIA_Nagur_Job,"�� ��������. ������� ��������� �� ���������.",DIA_Nagur_Job_Halbe);
			Info_AddChoice(DIA_Nagur_Job,"������, �� ����� �������.",DIA_Nagur_Job_Klar);
		};
	};
};

func void DIA_Nagur_Job_Klar()
{
	AI_Output(other,self,"DIA_Nagur_Job_Klar_15_00");	//������, �� ����� �������.
	AI_Output(self,other,"DIA_Nagur_Job_Klar_08_01");	//�������. ����� ��� ��� �����, ����� ������ ����� ���������� ���� ������.
	Nagur_Deal = 80;
	Info_ClearChoices(DIA_Nagur_Job);
};

func void DIA_Nagur_Job_Halbe()
{
	AI_Output(other,self,"DIA_Nagur_Job_Halbe_15_00");	//�� ��������. ������� ��������� �� ���������.
	AI_Output(self,other,"DIA_Nagur_Job_Halbe_08_01");	//������, ��� �������. ������� ��, �� ����� ������ ������������ ������.
	Nagur_Deal = 120;
	Info_ClearChoices(DIA_Nagur_Job);
};


instance DIA_Nagur_Auftrag(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 4;
	condition = DIA_Nagur_Auftrag_Condition;
	information = DIA_Nagur_Auftrag_Info;
	permanent = TRUE;
	description = "������������. ��� ����� � ���� ����?";
};


func int DIA_Nagur_Auftrag_Condition()
{
	if((Nagur_Job_Dia1_Passed == TRUE) && (Nagur_Job_Dia2_Passed == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Auftrag_Info()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_15_00");	//������������. ��� ����� � ���� ����?
	if(C_MartinIsNear())
	{
		B_Nagur_RefuseToTalk();
	}
	else
	{
		Nagur_Job_Dia2_Passed = TRUE;
		AI_Output(self,other,"DIA_Nagur_Auftrag_08_01");	//�� ������ �������� ���������, ���? ���� ���, ������ ����� ���������� � ���.
		AI_Output(self,other,"DIA_Nagur_Auftrag_08_02");	//� ����� ��������� ���� ���������, ������������ ��� ������ � ����� �����.
		if(!Npc_IsDead(Bote))
		{
			AI_Output(self,other,"DIA_Nagur_Auftrag_08_03");	//������, � ���� ��� ���������, ���� � �� ��������� ��� ������. � ������ ��������� �������� ������ ������ �������� �� ����������. � �� ������ ��.
			B_DeletePetzCrime(Bote);
			B_RemoveNpc(VLK_4006_Bote);
			Bote_Killed = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Nagur_Auftrag_08_03_add");	//������, � ���� ��� ���������. � �� ������ ��.
		};
		AI_Output(self,other,"DIA_Nagur_Auftrag_08_04");	//�� ������ ��������� �� ������ � ��������� � ����� ������� � �����.
		AI_Output(self,other,"DIA_Nagur_Auftrag_08_05");	//����� �� ��������� �� ���, � � ������ �� ����������������� ����������. �� ���� �������� ���� �� ���.
		AI_Output(self,other,"DIA_Nagur_Auftrag_08_06");	//� �� ������� ������� ��� ������ ���. �� ��� �����?
		Info_ClearChoices(DIA_Nagur_Auftrag);
		Info_AddChoice(DIA_Nagur_Auftrag,"������, ������������.",DIA_Nagur_Auftrag_Okay);
		Info_AddChoice(DIA_Nagur_Auftrag,"��� ��� ����� ���������?",DIA_Nagur_Auftrag_Baltram);
		Info_AddChoice(DIA_Nagur_Auftrag,"����� ��� ���������� � ����������?",DIA_Nagur_Auftrag_Wann);
		Info_AddChoice(DIA_Nagur_Auftrag,"� ��� ����� �����?",DIA_Nagur_Auftrag_Akil);
		Info_AddChoice(DIA_Nagur_Auftrag,"����� ��������� �����?",DIA_Nagur_Auftrag_Gewinn);
	};
};

func void DIA_Nagur_Auftrag_Akil()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Akil_15_00");	//� ��� ����� �����?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_01");	//������� �� ������ ����� ��������� ������, ��� ��������� �� �������� �������.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_02");	//���� �� ������� �� ������ �������, ������ ������� ��������, ���������� � �����.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_03");	//��������� �� ��� � ��������� �� ����� �����.
};

func void DIA_Nagur_Auftrag_Gewinn()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Gewinn_15_00");	//����� ��������� �����?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Gewinn_08_01");	//�� ���� ������� �����. ��, � �����, �� ����� 400 �����.
};

func void DIA_Nagur_Auftrag_Baltram()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Baltram_15_00");	//��� ��� ����� ���������?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Baltram_08_01");	//��� �������� ��������� �� �������� �������.
};

func void DIA_Nagur_Auftrag_Wann()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Wann_15_00");	//����� ��� ���������� � ����������?
	if(Bote_Killed == TRUE)
	{
		AI_Output(self,other,"DIA_Nagur_Auftrag_Wann_08_01");	//�� ������ ������� ��� ����� ������. �� ��� ������ ������, ��� ��� ��������� ������� ��� �� ��������. (������� ����)
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Auftrag_Wann_08_01_add");	//�� ������ ������� ��� ����� ������.
	};
};

func void DIA_Nagur_Auftrag_Okay()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Okay_15_00");	//������, ������������.
	if(Bote_Killed == TRUE)
	{
		AI_Output(self,other,"DIA_Nagur_Auftrag_Okay_08_01");	//�������. ����� �� ���� - �� ���� �� ����������� �������� ����, ���� ����� ����� �� �� ������, ��� � ����� ����������! �� ������� �� ����!
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Auftrag_Okay_08_01_add");	//�������. ����� �� ����.
	};
	MIS_Nagur_Bote = LOG_Running;
	Log_CreateTopic(TOPIC_Nagur,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Nagur,LOG_Running);
	B_LogEntry(TOPIC_Nagur,"� ������ ��������� ��������� ����� ���� � �������� �������� �� ����������. ����� � ������ ������� ������� � ������� ����� � �������� �� ������.");
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_Success(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 5;
	condition = DIA_Nagur_Success_Condition;
	information = DIA_Nagur_Success_Info;
	permanent = FALSE;
	description = "� ������ �����.";
};


func int DIA_Nagur_Success_Condition()
{
	if((MIS_Nagur_Bote == LOG_Running) && Npc_HasItems(other,ItMi_BaltramPaket) && (Nagur_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Success_Info()
{
	AI_Output(other,self,"DIA_Nagur_Success_15_00");	//� ������ �����.
	B_GiveInvItems(other,self,ItMi_BaltramPaket,1);
	Npc_RemoveInvItem(self,ItMi_BaltramPaket);
	AI_Output(self,other,"DIA_Nagur_Success_08_01");	//�������. ������ ��� ����� ������� ���. ������ ������.
	NagurDay = B_GetDayPlus();
	B_GivePlayerXP(XP_NagurOnlyGaveMoney);
	B_LogEntry(TOPIC_Nagur,"����� ������� �������. �� �������� ��� ������� ������.");
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_Deal(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 6;
	condition = DIA_Nagur_Deal_Condition;
	information = DIA_Nagur_Deal_Info;
	permanent = TRUE;
	description = "�� ��� ������ ������?";
};


var int DIA_Nagur_Deal_permanent;

func int DIA_Nagur_Deal_Condition()
{
	if((DIA_Nagur_Deal_permanent == FALSE) && (MIS_Nagur_Bote == LOG_Running) && (Nagur_Ausgeliefert == FALSE) && Npc_KnowsInfo(other,DIA_Nagur_Success))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Deal_Info()
{
	AI_Output(other,self,"DIA_Nagur_Deal_15_00");	//�� ��� ������ ������?
	if(B_GetDayPlus() > NagurDay)
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_01");	//��, �� �� ������� �����, ��� �����������. � ������� ������ 300 �����.
		AI_Output(self,other,"DIA_Nagur_Deal_08_02");	//����� ���� ����� ����� ���� ��������...
		AI_Output(self,other,"DIA_Nagur_Deal_08_03");	//� ������ ������� ���� ������� ������� - ���� ������ �� ��, ��� �� ����� ����.
		AI_Output(self,other,"DIA_Nagur_Deal_08_04");	//�������� 240 ������� �����. �� ������� �� ��� ������������. ��� ���� ����.
		B_GiveInvItems(self,other,ItMi_Gold,Nagur_Deal);
		AI_Output(self,other,"DIA_Nagur_Deal_08_05");	//�� ������ ���������. � ������� �� ���� ���� ��������.
		AI_Output(self,other,"DIA_Nagur_Deal_08_06");	//��� �� ����� ������ - �� ����.
		MIS_Nagur_Bote = LOG_SUCCESS;
		MIS_Baltram_ScoutAkil = LOG_FAILED;
		B_GivePlayerXP(XP_Nagur_Bote);
		DIA_Nagur_Deal_permanent = TRUE;
		Diebesgilde_Okay += 1;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_07");	//���� ��� ���. �� ��� ����� �����. � �� ���� �����������.
	};
};


instance DIA_Nagur_Auftraggeber(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 7;
	condition = DIA_Nagur_Auftraggeber_Condition;
	information = DIA_Nagur_Auftraggeber_Info;
	permanent = FALSE;
	description = "��� ���� �������?";
};


func int DIA_Nagur_Auftraggeber_Condition()
{
	if((MIS_Nagur_Bote == LOG_SUCCESS) && !Npc_KnowsInfo(other,DIA_Nagur_Sign))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Auftraggeber_Info()
{
	AI_Output(other,self,"DIA_Nagur_Auftraggeber_15_00");	//��� ���� �������?
	AI_Output(self,other,"DIA_Nagur_Auftraggeber_08_01");	//�� ���, ������������� �������, ��� � ������ ��� ������ � ����� ����?
};


instance DIA_Nagur_Knast(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 7;
	condition = DIA_Nagur_Knast_Condition;
	information = DIA_Nagur_Knast_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Nagur_Knast_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Nagur_Ausgeliefert == TRUE))
	{
		if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_NAGUR") <= 1000)
		{
			return TRUE;
		};
	};
};

func void DIA_Nagur_Knast_Info()
{
	AI_Output(self,other,"DIA_Nagur_Knast_08_00");	//�� ������ ����! ��� ���� ������� ������ - � ������ ����������!
	AI_StopProcessInfos_Pickpocket();
};


instance DIA_Nagur_Sign(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 800;
	condition = DIA_Nagur_Sign_Condition;
	information = DIA_Nagur_Sign_Info;
	permanent = FALSE;
	description = DIALOG_SecretSign;
};


func int DIA_Nagur_Sign_Condition()
{
	if((MIS_Nagur_Bote == LOG_SUCCESS) && (Knows_SecretSign == TRUE) && (Nagur_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Sign_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Nagur_Sign_08_00");	//��� ���� ������� ���. ������ �� ������, ��� ��� �������.
	AI_Output(self,other,"DIA_Nagur_Sign_08_01");	//�� ������� � ���, ��� ������ ������� ���� - ��� �� ���������, ��� �� �����. �� ���� �� ���, � ������ ��� ����� ��������.
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	B_GivePlayerXP(XP_NagurGotThief);
	AI_StopProcessInfos(self);
};


instance DIA_Nagur_Perm(C_Info)
{
	npc = VLK_493_Nagur;
	nr = 7;
	condition = DIA_Nagur_Perm_Condition;
	information = DIA_Nagur_Perm_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Nagur_Perm_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Nagur_Bote == LOG_SUCCESS) && (Nagur_Ausgeliefert == FALSE))
	{
		if(Npc_KnowsInfo(other,DIA_Nagur_Sign))
		{
			return TRUE;
		};
		if(Knows_SecretSign == TRUE)
		{
			return FALSE;
		};
		if(Npc_KnowsInfo(other,DIA_Nagur_Auftraggeber))
		{
			return TRUE;
		};
	};
};

func void DIA_Nagur_Perm_Info()
{
	if(Npc_KnowsInfo(other,DIA_Nagur_Sign))
	{
		AI_Output(self,other,"DIA_Nagur_Perm_08_00");	//����� ����-������ ���, ����� ������ ����� ������. � � ���� ������ ������ ��� ��� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Fazit_08_00");	//���� ������ ������, �� � �� ������ � ����� ��������. ��� ��� ������ ������������.
	};
	AI_StopProcessInfos_Pickpocket();
};

