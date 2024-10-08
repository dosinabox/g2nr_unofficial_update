
instance DIA_Garond_EXIT(C_Info)
{
	npc = PAL_250_Garond;
	nr = 999;
	condition = DIA_Garond_EXIT_Condition;
	information = DIA_Garond_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garond_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Garond_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


func void DIA_Garond_PayForCrimesNow()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayNow_15_00");	//� ���� ��������� �����!
	B_GiveInvItems(other,self,ItMi_Gold,Garond_Schulden);
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayNow_10_01");	//������, � ����� �� ���� ����� ������, ����� ������� ��������� ��. �� ����� ������ ������ �� �����������!
	B_GrantPersonalAbsolution(self);
};

func void DIA_Garond_PayForCrimesLater()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayLater_15_00");	//� ���� ��� ������� ������!
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_01");	//����� ���������� ��������� ��� ������ ��� ����� �������.
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_02");	//� � ������������ ����: ���� �� ������ ��������� �������� ������������ � � �������, ���� ���������!
	Garond_LastPetzCounter = B_GetTotalPetzCounter(self);
	Garond_LastPetzCrime = B_GetGreatestPetzCrime(self);
	AI_StopProcessInfos(self);
};

func void DIA_Garond_BuildCrimesDialog()
{
	Info_ClearChoices(DIA_Garond_PMSchulden);
	Info_AddChoice(DIA_Garond_PMSchulden,"� ���� ��� ������� ������!",DIA_Garond_PMSchulden_PayForCrimesLater);
	Info_AddChoice(DIA_Garond_PMSchulden,"������� ��� ����?",DIA_Garond_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Garond_Schulden)
	{
		Info_AddChoice(DIA_Garond_PMSchulden,"� ���� ��������� �����!",DIA_Garond_PMSchulden_PayForCrimesNow);
	};
};

func void DIA_Garond_PMSchulden_PayForCrimesNow()
{
	DIA_Garond_PayForCrimesNow();
	Info_ClearChoices(DIA_Garond_PMSchulden);
};

func void DIA_Garond_PMSchulden_PayForCrimesLater()
{
	DIA_Garond_PayForCrimesLater();
	Info_ClearChoices(DIA_Garond_PMSchulden);
};

func void DIA_Garond_PMSchulden_HowMuchAgain()
{
	AI_Output(other,self,"DIA_Garond_PMSchulden_HowMuchAgain_15_00");	//������� ��� ����?
	B_Say_Gold(self,other,Garond_Schulden);
	DIA_Garond_BuildCrimesDialog();
};

instance DIA_Garond_PMSchulden(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_PMSchulden_Condition;
	information = DIA_Garond_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Garond_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Garond_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Garond_LastPetzCrime))
	{
		return TRUE;
	};
};

func void DIA_Garond_PMSchulden_Info()
{
	var int diff;
	if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_00");	//�� ������ �� ����� ���������, ���� �� �� ��������� �����.
	};
	if(B_GetTotalPetzCounter(self) > Garond_LastPetzCounter)
	{
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_01");	//� �� ������, �������� ��� ��������� ���������.
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_02");	//������� � ����, ������, ������ �����������.
		if(Garond_Schulden < 1000)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_03");	//�� � �������, ��� �� �������� ��������� ����� �� ���! �������� ��� ���� �����������, ��� �����...
		}
		else
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_04");	//� ����� ����������� �����. ���� ����� ������ ����������...
		};
		diff = B_GetTotalPetzCounter(self) - Garond_LastPetzCounter;
		if(diff > 0)
		{
			Garond_Schulden += diff * 50;
		};
		if(Garond_Schulden > 1000)
		{
			Garond_Schulden = 1000;
		};
		B_Say_Gold(self,other,Garond_Schulden);
	}
	else if(B_GetGreatestPetzCrime(self) < Garond_LastPetzCrime)
	{
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_05");	//���������� ����� �����������.
		if(Garond_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_06");	//������ ������ ����� �� �������� ���� � ��������.
		};
		if((Garond_LastPetzCrime == CRIME_THEFT) || ((Garond_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_07");	//����� �� ������, ��� �����, ��� �� �������.
		};
		if((Garond_LastPetzCrime == CRIME_ATTACK) || ((Garond_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_08");	//������ ��� ����������, ������������, ��� �� ���������� � �����.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_09");	//������, ��� ��������� ������ ���� �����.
		};
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_10");	//� ������� �� ����, ��� ��� ���������, �� ������������ ����: �� ������ ������� ������!
		if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_11");	//� ������ ������� ���������� ���� �� ������.
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_12");	//� ������ � �� ���� ������� � ���, ��� �� ����� ����� � �����!
			B_GrantPersonalAbsolution(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_13");	//� ���� ������� �� ������ ��������: ���� ��� ����� �������� ��������� ����� � ������ ������.
			B_Say_Gold(self,other,Garond_Schulden);
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_14");	//��� ��� ������ �����?
		};
	};
	if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		DIA_Garond_BuildCrimesDialog();
	};
};


func void DIA_Garond_PETZMASTER_PayForCrimesNow()
{
	DIA_Garond_PayForCrimesNow();
	Info_ClearChoices(DIA_Garond_PETZMASTER);
};

func void DIA_Garond_PETZMASTER_PayForCrimesLater()
{
	DIA_Garond_PayForCrimesLater();
	Info_ClearChoices(DIA_Garond_PETZMASTER);
};

instance DIA_Garond_PETZMASTER(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_PETZMASTER_Condition;
	information = DIA_Garond_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Garond_PETZMASTER_Condition()
{
	if(B_GetGreatestPetzCrime(self) > Garond_LastPetzCrime)
	{
		return TRUE;
	};
};

func void DIA_Garond_PETZMASTER_Info()
{
	Garond_Schulden = 0;
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_00");	//��� ��� �� ����� ����� � �����.
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_01");	//� ��������� ����: ������� ��� ��� ����� ������������, ������ ��� �� ������� �� ��� � ��������?
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_02");	//��� ������ ������� ��� ����� �� �������.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_03");	//� ���� �� ����� ������ ������� - � ������ � ���� ����� �� ������ ����� ������!
		Garond_Schulden = B_GetTotalPetzCounter(self) * 50 + 500;
		if((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_04");	//�� ������ ��� ��� ���� ���������, � ��� ���� ��������.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_05");	//������� ��� ��������� ���� ���-���. �� ����� ��� � ����� �������.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_06");	//� � ���� �� ����� ������ �������. ������� ����.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_07");	//���� ���� ������� ����� ����-������, ������ ����� �� ������ �����. � ������ ��� ����� ���� �� ��������.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_08");	//� �������� �������� �� ���� ����� - � ��� ������ ��������� ��������� ����� ����.
	}
	else if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_09");	//����� �����, ��� �� ����� � ����� �����.
		if((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_10");	//�� ������ ��� ��� ���� ������, ��� ��� ��������.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_11");	//���� ��� ������ �� ���� �� ���������������. ��, ������, �� ��������� ���� ����������� ��������.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_12");	//���� �������� ��������� ����� � �������� ����������� �� ���� ������������!
		Garond_Schulden = B_GetTotalPetzCounter(self) * 50;
	}
	else if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_13");	//� �� �����, ����� ����� ���� ����� ��������� �����.
		if(PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_14");	//� �� ���� ������ � ����� ��� ������ �� �������.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_15");	//���� �������� ��������� �� ��� �����!
		Garond_Schulden = B_GetTotalPetzCounter(self) * 50;
	}
	else if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_16");	//�� �������� ����� ����?! ��� ������������ �������������.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_17");	//���� �������� ��������� �� ��� ����.
		Garond_Schulden = 100;
	};
	AI_Output(other,self,"DIA_Garond_PETZMASTER_15_18");	//�������?
	if(Garond_Schulden > 1000)
	{
		Garond_Schulden = 1000;
	};
	B_Say_Gold(self,other,Garond_Schulden);
	Info_ClearChoices(DIA_Garond_PETZMASTER);
	Info_AddChoice(DIA_Garond_PETZMASTER,"� ���� ��� ������� ������!",DIA_Garond_PETZMASTER_PayForCrimesLater);
	if(Npc_HasItems(other,ItMi_Gold) >= Garond_Schulden)
	{
		Info_AddChoice(DIA_Garond_PETZMASTER,"� ���� ��������� �����!",DIA_Garond_PETZMASTER_PayForCrimesNow);
	};
};


instance DIA_Garond_Hello(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Hello_Condition;
	information = DIA_Garond_Hello_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Garond_Hello_Condition()
{
	if((Kapitel == 2) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Garond_Hello_Info()
{
	AI_Output(self,other,"DIA_Garond_Hello_10_00");	//������ �� ������? �� �� �� ����������, � �� �� ���� �� ���� �����. ��� ��� �� ��?
	AI_Output(other,self,"DIA_Garond_Hello_15_01");	//� ������ ����� ������.
	AI_Output(self,other,"DIA_Garond_Hello_10_02");	//����� ������?.. �� ������������� ������ ���?! �, ����� ����������!
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_03");	//����� �� ������ ���� ����, ���?
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_04");	//����� ������ �� ����������, ������?
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_05");	//� ����� ���� ������, ����� �������� ����������� ����� ����? ��� �� ������� �����?
	};
};


instance DIA_Garond_NeedProof(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_NeedProof_Condition;
	information = DIA_Garond_NeedProof_Info;
	description = "� ������ �� ����� ������.";
};


func int DIA_Garond_NeedProof_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garond_Hello) && (MIS_OLDWORLD == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Garond_NeedProof_Info()
{
	AI_Output(other,self,"DIA_Garond_NeedProof_15_00");	//� ������ �� ����� ������. �� �����, ����� � ���������� ��� �������������� ����������� ����� ��������.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_01");	//��� �� ������, ����� �������� ��� �������������� � ��������� �����?
	AI_Output(other,self,"DIA_Garond_NeedProof_15_02");	//��, ������ �� ��� � � �����������.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_03");	//��� ��� ����� ��������������? �� ����� �������� ��. �� � �� ���� ��������� ���� ����� � ����� ������, �� ����������� ��� ���������� � ����.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_04");	//�������� - ���� ����� ������ ������ ��� � �������� ����� � � ���, ������� ���� ������� ��� ������.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_05");	//������, � ��� �� ������, ����� � ������?
	AI_Output(self,other,"DIA_Garond_NeedProof_10_06");	//� ��� �����, � ������, ��� ������ ����������. �� � ��� �� ������� �� ��� �� ������ ����� ����.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_07");	//������ ��� ��� ����� � ������ ���, ������� ���� ��� ������.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_08");	//����� �����, � ��� ���� ������, ������� �� �������� ����� ������.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_09");	//��, ������ - ������, � ���� ��� ������.
	MIS_ScoutMine = LOG_Running;
	if(!Npc_IsDead(Jergan))
	{
		Npc_ExchangeRoutine(Jergan,"FAJETH");
		Jergan.aivar[AIV_IgnoresFakeGuild] = FALSE;
		Jergan.aivar[AIV_IgnoresArmor] = FALSE;
	};
	B_LogEntries(Topic_MISOLDWORLD,"������ ��� ����������� ������ �������� ���� �����, �� �����, ����� � �������� ��� ������ ���������� � ������� ���, ������� ���� ������� �� ������.");
	Log_CreateTopic(TOPIC_ScoutMine,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ScoutMine,LOG_Running);
	B_LogNextEntry(TOPIC_ScoutMine,"����������� ������ ��� ��� ���������. �� �������� ��� ������ ���������� �������� ���������� ����. � �� ��� ��� ��� �� ���������.");
	Log_AddEntry(TOPIC_ScoutMine,"� ������ ����� ��� ��� ������ ���������� � ��������, ������� ���� ������� �� ������.");
	if(Diego_ToldAboutSilvestroOre == TRUE)
	{
		Log_AddEntry(TOPIC_ScoutMine,"����� ���������� � ���������� ����� ������ ����� ����, ������� ����������� ����������.");
	};
};


instance DIA_Garond_Why(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Why_Condition;
	information = DIA_Garond_Why_Info;
	permanent = FALSE;
	description = "�� ������ ������ �?";
};


func int DIA_Garond_Why_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Garond_Why_Info()
{
	AI_Output(other,self,"DIA_Garond_Why_15_00");	//�� ������ ������ �?
	AI_Output(self,other,"DIA_Garond_Why_10_01");	//������ ��� �� ������ ��� ����������� ����� ���� �����. ��� ����� ������ ��� ������� ���� �����.
	AI_Output(self,other,"DIA_Garond_Why_10_02");	//���� ���� ���� ��� ��� ������� ���������� ��� ����������� - ������, �� ��� ������ ����� ��������� ��� ���� ������.
};


instance DIA_Garond_Equipment(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Equipment_Condition;
	information = DIA_Garond_Equipment_Info;
	permanent = FALSE;
	description = "��� ����� ����������.";
};


func int DIA_Garond_Equipment_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && ((other.guild == GIL_KDF) || (other.guild == GIL_MIL)))
	{
		return TRUE;
	};
};

func void DIA_Garond_Equipment_Info()
{
	AI_Output(other,self,"DIA_Garond_Equipment_15_00");	//��� ����� ����������.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_01");	//�������� � ����� �������� �����, � �����. �� ����������� � ����� �����.
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_02");	//�������� �� ���� � ��������. �� ������ ���� ��� �����������.
		if(!Npc_KnowsInfo(other,DIA_Keroloth_WantTeach) && !Npc_KnowsInfo(other,DIA_Tandor_Hallo) && !Npc_KnowsInfo(other,DIA_Dobar_Waffe))
		{
			Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
			B_LogEntry(TOPIC_Trader_OC,"������ ������� ������ � �����.");
		};
	};
};


instance DIA_Garond_zahlen(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_zahlen_Condition;
	information = DIA_Garond_zahlen_Info;
	permanent = FALSE;
	description = "������� �� ��������� ��� �� ��� ������?";
};


func int DIA_Garond_zahlen_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Garond_zahlen_Info()
{
	AI_Output(other,self,"DIA_Garond_zahlen_15_00");	//������� �� ��������� ��� �� ��� ������?
	AI_Output(self,other,"DIA_Garond_zahlen_10_01");	//(�������) � �� �������� � ����, ����������.
	AI_Output(self,other,"DIA_Garond_zahlen_10_02");	//��, �����, ������, � ���� ��� ������. � ������� ���� 500 �������, ���� �� ��������� ��� �������.
};


instance DIA_Garond_Wo(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Wo_Condition;
	information = DIA_Garond_Wo_Info;
	permanent = FALSE;
	description = "��� ��� ����� ��� �����?";
};


func int DIA_Garond_Wo_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (Ore_Counter < 3))
	{
		return TRUE;
	};
};

func void DIA_Garond_Wo_Info()
{
	AI_Output(other,self,"DIA_Garond_Wo_15_00");	//��� ��� ����� ��� �����?
	AI_Output(self,other,"DIA_Garond_Wo_10_01");	//���, ������ ��� �����. �� ��� �������� ��� �������, ��� ��������� �����.
	CreateInvItems(self,ItWr_Map_OldWorld_Oremines_Small_MIS,1);
	B_GiveInvItems(self,other,ItWr_Map_OldWorld_Oremines_Small_MIS,1);
	AI_Output(self,other,"DIA_Garond_Wo_10_02");	//���� � ���� ���� ��� �������, �������� � ���������. �� ��������� ���, ��� ���� ����� ����� � ����������.
	B_LogEntry(TOPIC_ScoutMine,"������� ��������� ����� ���� ��� ���������� � ����������.");
};

func void B_Garond_OreCounter()
{
	Ore_Counter += 1;
	if(Ore_Counter >= 3)
	{
		AI_Output(self,other,"B_Garond_OreCounter3_10_00");	//����! ��� ��� ����������? ������� ��� ������ ������, ����� ������� ��� � ���� �����?!
		AI_Output(self,other,"B_Garond_OreCounter3_10_01");	//��� ���� ����� ��� ������, � � ��� �����, ��� � ��� ����, �� �� ����� ���������� ���� ������ ����, �� ������ ��� �� �����!
		AI_Output(self,other,"B_Garond_OreCounter3_10_02");	//��� ���������� �������� �� ������.
	};
};


instance DIA_Garond_Fajeth(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_Garond_Fajeth_Condition;
	information = DIA_Garond_Fajeth_Info;
	permanent = FALSE;
	description = "� ��������� � ��������.";
};


func int DIA_Garond_Fajeth_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (Fajeth_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garond_Fajeth_Info()
{
	AI_Output(other,self,"DIA_Garond_Fajeth_15_00");	//� ��������� � ��������.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_01");	//��� �� ����� ������� ���?
	AI_Output(other,self,"DIA_Garond_Fajeth_15_02");	//��� ���� ������ ��� ����� ����.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_03");	//���... ��� �����? ��� �� ����� ��� ����� - ��� ����� ��� �����.
	AI_Output(other,self,"DIA_Garond_Fajeth_15_04");	//�� �����, ����� � ������� ���� - ��� ����� ��� ����.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_05");	//���? � ������ ������� ��� ����� �� ������ ������? �� ����� ������ �� ����.
	B_Garond_OreCounter();
	B_GivePlayerXP(XP_Fajeth_Ore);
};


instance DIA_Garond_Silvestro(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_Garond_Silvestro_Condition;
	information = DIA_Garond_Silvestro_Info;
	permanent = FALSE;
	description = "������ ����� ����������...";
};


func int DIA_Garond_Silvestro_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (Silvestro_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garond_Silvestro_Info()
{
	AI_Output(other,self,"DIA_Garond_Silvestro_15_00");	//������ ����� ����������...
	AI_Output(self,other,"DIA_Garond_Silvestro_10_01");	//�� ����� ���? �� ������� � ���?
	if(!Npc_HasItems(Silvestro,ItWr_Silvestro_MIS) || Npc_KnowsInfo(other,DIA_DiegoOw_Mine))
	{
		AI_Output(other,self,"DIA_Garond_Silvestro_15_02");	//���, ��� ��������� � �����, ������. ���������� ����������.
		AI_Output(self,other,"DIA_Garond_Silvestro_10_05");	//����! ��� ���� ������� ���� - �� ������� ����� ���������� � �� �����.
	}
	else
	{
		AI_Output(other,self,"DIA_Neoras_Rezept_15_04");	//� ��� �� ����� ���.
	};
	AI_Output(self,other,"DIA_Garond_Silvestro_10_03");	//� ��� ������ ����? �� ������, ������� ��� ������?
	AI_Output(other,self,"DIA_Garond_Silvestro_15_04");	//�� ������� �������� ��������� ������. ��� � ������ - �� ���� �� ����� � �����.
	B_Garond_OreCounter();
	B_GivePlayerXP(XP_Silvestro_Ore);
};


instance DIA_Garond_Marcos(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_Garond_Marcos_Condition;
	information = DIA_Garond_Marcos_Info;
	permanent = FALSE;
	description = "� �������� �������.";
};


func int DIA_Garond_Marcos_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (Marcos_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garond_Marcos_Info()
{
	AI_Output(other,self,"DIA_Garond_Marcos_15_00");	//� �������� �������.
	AI_Output(self,other,"DIA_Garond_Marcos_10_01");	//�? ��� �� ����� ��������? ������� ���� �� ����� ��� ���?
	AI_Output(other,self,"DIA_Garond_Marcos_15_02");	//������ �����. �� ������� �����, ����� ����������� ���� � ���������� �����.
	AI_Output(other,self,"DIA_Garond_Marcos_15_03");	//������ �� �������� ��� ����� � ��������� ������ �� ��������� �����. �� ������ �������� ������������.
	AI_Output(self,other,"DIA_Garond_Marcos_10_04");	//���? ����� ������ ����� - � �� ������� �����? ����, ��� ��� ��� �����.
	AI_Output(self,other,"DIA_Garond_Marcos_10_05");	//� ��� ����� ��� ����?.. ��� �, �����, � ����� � ���� ���� �������.
	if(!Npc_IsDead(Marcos_Guard1))
	{
		B_DeletePetzCrime(Marcos_Guard1);
		Marcos_Guard1.flags = 0;
		Marcos_Guard1.aivar[AIV_ToughGuy] = TRUE;
		Marcos_Guard1.aivar[AIV_CommentedPlayerCrime] = FALSE;
		AI_Teleport(Marcos_Guard1,"OW_STAND_GUARDS");
		B_StartOtherRoutine(Marcos_Guard1,"MARCOS");
	};
	if(!Npc_IsDead(Marcos_Guard2))
	{
		B_DeletePetzCrime(Marcos_Guard2);
		Marcos_Guard2.flags = 0;
		Marcos_Guard2.aivar[AIV_ToughGuy] = TRUE;
		Marcos_Guard2.aivar[AIV_CommentedPlayerCrime] = FALSE;
		AI_Teleport(Marcos_Guard2,"OW_STAND_GUARDS");
		B_StartOtherRoutine(Marcos_Guard2,"MARCOS");
	};
	B_Garond_OreCounter();
	MIS_Marcos_Jungs = LOG_SUCCESS;
	B_GivePlayerXP(XP_Marcos_Ore);
};


instance DIA_Garond_Success(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Success_Condition;
	information = DIA_Garond_Success_Info;
	permanent = FALSE;
	description = "��� ������ ������ ��� ����� ������?";
};


func int DIA_Garond_Success_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (Ore_Counter >= 3))
	{
		return TRUE;
	};
};

func void DIA_Garond_Success_Info()
{
	AI_Output(other,self,"DIA_Garond_Success_15_00");	//��� ������ ������ ��� ����� ������?
	AI_Output(self,other,"DIA_Garond_Success_10_01");	//� ����� ��������� � ��� ���� ������ ������ ���� - � �� �������� � ��� ���� ������ ������� �����.
	AI_Output(self,other,"DIA_Garond_Success_10_02");	//�� �������� ���� ������. ���� ����� ������ �������� �� ����. ��� ������ �������� - ����� ��������� ���.
	CreateInvItems(self,ItWr_PaladinLetter_MIS,1);
	B_GiveInvItems(self,other,ItWr_PaladinLetter_MIS,1);
	KnowsPaladins_Ore = TRUE;
	B_LogEntry(Topic_MISOLDWORLD,"����������� ������ ��� ��� ������. ��� ������ ���� ���������� ��� ������������� ���� ����. � ���� ������� ��� ����� ������.");
	MIS_ScoutMine = LOG_SUCCESS;
	B_GivePlayerXP(XP_ScoutMine);
	MIS_ReadyForChapter3 = TRUE;
};


instance DIA_Garond_SLD(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_SLD_Condition;
	information = DIA_Garond_SLD_Info;
	permanent = FALSE;
	description = "��� ������ ������?";
};


func int DIA_Garond_SLD_Condition()
{
	if((MIS_ScoutMine == LOG_SUCCESS) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Garond_SLD_Info()
{
	AI_Output(other,self,"DIA_Garond_SLD_15_00");	//��� ������ ������?
	AI_Output(self,other,"DIA_Garond_SLD_10_01");	//��, ��, �����. � ������ ���� ������� ������. ��� ���� �������.
	B_GiveInvItems(self,other,ItMi_Gold,500);
};


instance DIA_Garond_Running(C_Info)
{
	npc = PAL_250_Garond;
	nr = 10;
	condition = DIA_Garond_Running_Condition;
	information = DIA_Garond_Running_Info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int DIA_Garond_Running_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (Ore_Counter < 3))
	{
		return TRUE;
	};
};

func void DIA_Garond_Running_Info()
{
	AI_Output(other,self,"DIA_Garond_Running_15_00");	//��� ����������?
	if(Ore_Counter == 2)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_01");	//������ � ��� ������ �������� � ��������� ����� - � �������, ��� ��� ����� ������� �������.
	}
	else if(Ore_Counter == 1)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_02");	//��� ����� ������� � ���� ������ ������. � ��� ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Running_10_03");	//�� ������ ����� ���� �����. ��� ����� ����� ������� � ���, ��� ������� ���� � ������� ����.
	};
};


instance DIA_Garond_Gorn(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Gorn_Condition;
	information = DIA_Garond_Gorn_Info;
	permanent = FALSE;
	description = "� ����, ����� �� ��������� �����.";
};


func int DIA_Garond_Gorn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_MiltenOW_Gorn) && (Kapitel == 2) && Npc_KnowsInfo(other,DIA_Garond_NeedProof))
	{
		return TRUE;
	};
};

func void DIA_Garond_Gorn_Info()
{
	AI_Output(other,self,"DIA_Garond_Gorn_15_00");	//� ����, ����� �� ��������� �����.
	AI_Output(self,other,"DIA_Garond_Gorn_10_01");	//� �� ���� ��������� ���. �� �������� ������� ����� ������������ � ������ ����������� �� ���.
	AI_Output(other,self,"DIA_Garond_Gorn_15_02");	//���� � ��������� ����� �� ����?
	AI_Output(self,other,"DIA_Garond_Gorn_10_03");	//��� �������� - �� ��������� ���� ����� ��������. � ���� �������� �� ����� 1000 �������.
	AI_Output(other,self,"DIA_Garond_Gorn_15_04");	//��� �������� �����.
	AI_Output(self,other,"DIA_Garond_Gorn_10_05");	//���� ����� ���� �� ���������. ������� ��� ��� ������, � � �������� ���.
	MIS_RescueGorn = LOG_Running;
	B_LogEntry(TOPIC_RescueGorn,"������ ������� ������ ������� ����� �� ������������ �����.");
};


instance DIA_Garond_Pay(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Pay_Condition;
	information = DIA_Garond_Pay_Info;
	permanent = TRUE;
	description = B_BuildPriceString("� ���� ������ ����� �������.",1000);
};


func int DIA_Garond_Pay_Condition()
{
	if((MIS_RescueGorn == LOG_Running) && (Kapitel == 2) && (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_Pay_Info()
{
	AI_Output(other,self,"DIA_Garond_Pay_15_00");	//� ���� ������ ����� �������.
	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_01");	//������. �� ������ ����� � �������� � ������� ���, ��� � ���������� ���������� �����.
		Garond_Kerkerauf = TRUE;
		B_LogEntry(TOPIC_RescueGorn,"� �������� �������. ������ � ���� ���������� ����� �� �������. �������� ������� �� ����� ��������������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_02");	//����� ������� ��� 1000 ������� �����.
	};
};


instance DIA_Garond_Perm2(C_Info)
{
	npc = PAL_250_Garond;
	nr = 9;
	condition = DIA_Garond_Perm2_Condition;
	information = DIA_Garond_Perm2_Info;
	permanent = TRUE;
	description = "��� �� ���������� ������ ������?";
};


func int DIA_Garond_Perm2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garond_Success) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Garond_Perm2_Info()
{
	AI_Output(other,self,"DIA_Garond_Perm2_15_00");	//��� �� ���������� ������ ������?
	AI_Output(self,other,"DIA_Garond_Perm2_10_01");	//� ��� ��� ������������. �� - ��� ������������ �������, � ��� ���� ����� ������� ��� ������������.
	AI_Output(self,other,"DIA_Garond_Perm2_10_02");	//�� �� �� ����� ����� � ����� �������� ������, ����� �� �� ������� ��� ��� ����� ��������� � ���� ������� ���.
};


instance DIA_Garond_WASGIBTSNEUES(C_Info)
{
	npc = PAL_250_Garond;
	nr = 30;
	condition = DIA_Garond_WASGIBTSNEUES_Condition;
	information = DIA_Garond_WASGIBTSNEUES_Info;
	permanent = TRUE;
	description = "��� ������?";
};


func int DIA_Garond_WASGIBTSNEUES_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Garond_WASGIBTSNEUES_Info()
{
	AI_Output(other,self,"DIA_Garond_WASGIBTSNEUES_15_00");	//��� ������?
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_01");	//����. ��� �� ��� ����������? ��� ����� ������������!
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_02");	//���� ������ ������� �����. �� ��� �� ����� ��������� ������� - ��� ����� ������� ������������!
};


instance DIA_Garond_BACKINKAP4(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = DIA_Garond_BACKINKAP4_Condition;
	information = DIA_Garond_BACKINKAP4_Info;
	permanent = FALSE;
	description = "� ��������.";
};


func int DIA_Garond_BACKINKAP4_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Garond_BACKINKAP4_Info()
{
	DIA_Common_ImBack();
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_01");	//� ��� ��� ����. � ��� ������ ������������?
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_02");	//���� ����� ��������, ��� ������ �� ���� ����������. ������� ����� ���������.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_03");	//���� ��� �� �������. ��� ����� ������. ���� ��� ��������� � ���������. ��� �� ������������ �����.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_04");	//��� ���� ��������, � � ��� ������������� ��������.
	if(!Npc_KnowsInfo(other,DIA_Garond_WASGIBTSNEUES))
	{
		AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_02");	//���� ������ ������� �����. �� ��� �� ����� ��������� ������� - ��� ����� ������� ������������!
	};
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_05");	//������� ���������.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_06");	//�� ������ � ���� ���� � ����� ������, ��������� �� ��������, ��� ��? ��, �������, ������ ������ ���, �� ��� ������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_07");	//�� ������ � ���� ��������� �� ��������? ���, �������, ����� ������ ���, �� �� ������� ����.
	};
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_08");	//���� ����� �� ������� � ��������� ����� ����� �����, � ������ �� ���� �������������.
	if(!Npc_IsDead(DJG_Angar))
	{
		if(DJG_AngarGotAmulett == TRUE)
		{
			AI_Teleport(DJG_Angar,"OW_CAVALORN_01");
			B_StartOtherRoutine(DJG_Angar,"LeavingOW");
		}
		else
		{
			AI_Teleport(DJG_Angar,"OW_DJG_WATCH_STONEHENGE_01");
			B_StartOtherRoutine(DJG_Angar,"Start");
			DJG_Angar_SentToStones = TRUE;
		};
	};
	//TODO ���� MIS_Kervo_KillLurker != LOG_SUCCESS, �� � ������ ��������� ����� ����� � �������� ��� ������ ���������
	B_StartOtherRoutine(Kjorn,"START");
	B_StartOtherRoutine(Godar,"START");
	B_StartOtherRoutine(Hokurn,"START");
	B_StartOtherRoutine(GornDJG,"START");
	B_StartOtherRoutine(Kurgan,"START");
	B_KillAnimal(Kervo_Lurker1);
	B_KillAnimal(Kervo_Lurker2);
	B_KillAnimal(Kervo_Lurker3);
	B_KillAnimal(Kervo_Lurker4);
	B_KillAnimal(Kervo_Lurker5);
	B_KillAnimal(Kervo_Lurker6);
	B_KillAnimal(Kervo_Lurker7);
	if(DJG_BiffParty == FALSE)
	{
		B_StartOtherRoutine(Biff,"START");
	};
};


var int Garond_DragonCounter;
var int Garond_SwampdragonKilled_OneTime;
var int Garond_RockdragonKilled_OneTime;
var int Garond_FireDragonKilled_OneTime;
var int Garond_IcedragonKilled_OneTime;
var int DIA_Garond_DragonPlettBericht_NoPerm;

instance DIA_Garond_DragonPlettBericht(C_Info)
{
	npc = PAL_250_Garond;
	nr = 11;
	condition = DIA_Garond_DragonPlettBericht_Condition;
	information = DIA_Garond_DragonPlettBericht_Info;
	permanent = TRUE;
	description = "� ���� ���� ������� � ��������.";
};


func int DIA_Garond_DragonPlettBericht_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Garond_BACKINKAP4) && (Garond_DragonCounter < MIS_KilledDragons) && (DIA_Garond_DragonPlettBericht_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_DragonPlettBericht_Info()
{
	var int CurrentDragonCount;
	var int Drachengeld;
	var int XP_LocalGarond;
	AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_00");	//� ���� ���� ������� � ��������.
	AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_01");	//����������.
	CurrentDragonCount = 0;
	if(Npc_IsDead(SwampDragon) && (Garond_SwampdragonKilled_OneTime == FALSE))
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_02");	//� ���� ������� � ������ � ������� ������.
		Garond_SwampdragonKilled_OneTime = TRUE;
		CurrentDragonCount += 1;
	};
	if(Npc_IsDead(RockDragon) && (Garond_RockdragonKilled_OneTime == FALSE))
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_03");	//������ � �������� ��������, � ��� ������, �����.
		Garond_RockdragonKilled_OneTime = TRUE;
		CurrentDragonCount += 1;
	};
	if(Npc_IsDead(FireDragon) && (Garond_FireDragonKilled_OneTime == FALSE))
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_04");	//�������� ������ �� ������� �� ��� ������ �� ����� ���������� ���.
		Garond_FireDragonKilled_OneTime = TRUE;
		CurrentDragonCount += 1;
	};
	if(Npc_IsDead(IceDragon) && (Garond_IcedragonKilled_OneTime == FALSE))
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_05");	//� ��� � �������� ������� ������ � ����������� � ��������, ��������� ���.
		Garond_IcedragonKilled_OneTime = TRUE;
		CurrentDragonCount += 1;
	};
	AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_06");	//��� ������� �������. ���. ������ ��� ������. �������, ��� ������� ���� �������� ���� ����������.
	Drachengeld = CurrentDragonCount * Garond_KilledDragonGeld;
	XP_LocalGarond = CurrentDragonCount * XP_Garond_KilledDragon;
	B_GivePlayerXP(XP_LocalGarond);
	CreateInvItems(self,ItMi_Gold,Drachengeld);
	B_GiveInvItems(self,other,ItMi_Gold,Drachengeld);
	Garond_DragonCounter = MIS_KilledDragons;
	if(MIS_AllDragonsDead == TRUE)
	{
		DIA_Garond_DragonPlettBericht_NoPerm = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_09");	//� ��������� ����� ���� ��� ��������� ��������?
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_10");	//�� �������, ���. � ��������� ������ ��� �������� �������.
	};
};


instance DIA_Garond_OricExperte(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = DIA_Garond_OricExperte_Condition;
	information = DIA_Garond_OricExperte_Info;
	permanent = FALSE;
	description = "�� ������ ��� ���-������ ���������� � ��������?";
};


func int DIA_Garond_OricExperte_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Garond_BACKINKAP4) && (MIS_AllDragonsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_OricExperte_Info()
{
	AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_07");	//�� ������ ��� ���-������ ���������� � ��������?
	if(!Npc_IsDead(Oric))
	{
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_08");	//��� ����� ���������� ������� ������. ����� ��� ��������-������� ���� ��������� ���� �� ����.
		B_LogEntry(TOPIC_DRACHENJAGD,"������� �� ����� ������ ������ ������������, ��� ������� ���� � ���������, ���� ��� �������, ��� �� ��� ���������.");
		Log_AddEntry(TOPIC_DRACHENJAGD,"� ������� �����, ����������� �� ���������, ��������, ���� �������� ���������� ��� ����.");
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_10");	//�� �������, ���. � ��������� ������ ��� �������� �������.
	};
};


instance DIA_Garond_AllDragonDead(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = DIA_Garond_AllDragonDead_Condition;
	information = DIA_Garond_AllDragonDead_Info;
	permanent = FALSE;
	description = "��� ������� ������.";
};


func int DIA_Garond_AllDragonDead_Condition()
{
	if((MIS_AllDragonsDead == TRUE) && (DIA_Garond_DragonPlettBericht_NoPerm == TRUE) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Garond_AllDragonDead_Info()
{
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_00");	//��� ������� ������.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_01");	//(�����������) ���? �� ���� ��� ������� ������ ������?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_02");	//���. ������� �� ������������.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_03");	//����� �� ������� ���� �������������� �����?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_04");	//��, ��� ���, �� � ��� ����� ���� ���� ������. �� ������ ���������� � ��� ����.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_05");	//�, � ���������, ����� �� ���� ���� ������. � ������ �������� ����, � ��� ��������� ����, ������, ���� ��� ��� �����.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_06");	//���� �������� ������� ��� ������.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_07");	//�� ������� ���� �����.
};


var int DIA_Garond_JanBecomeSmith_OneTime;

instance DIA_Garond_JanBecomeSmith(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = DIA_Garond_JanBecomeSmith_Condition;
	information = DIA_Garond_JanBecomeSmith_Info;
	permanent = TRUE;
	description = "� ���� ���������� � �������.";
};


func int DIA_Garond_JanBecomeSmith_Condition()
{
	if((MIS_JanBecomesSmith == LOG_Running) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Garond_JanBecomeSmith_Info()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_00");	//� ���� ���������� � �������.
	if(DIA_Garond_JanBecomeSmith_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_01");	//����� �������? �� �����.
		AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_02");	//�� ���, ��������? ����� ������ ������� ���...
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_03");	//���, � ������ � ���.
		if(hero.guild == GIL_DJG)
		{
			AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_04");	//�� ������� �� ��������, ��� � �, � ������� ������.
		}
		else
		{
			AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_05");	//����� �� ��������� �� ��������. �� ������.
		};
		AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_06");	//��� ������. ��� ���������� ������ ������, ����.
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_07");	//�� ����� �� ���������� � �������.
		AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_08");	//�������. ��� �� �������, � ���� �������� ���?
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_09");	//��.
		AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_10");	//���� �� ��� ������, �� �� ������ ���������� �� ����.
		DIA_Garond_JanBecomeSmith_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_11");	//���� ��-�� ���� ��������� ��������, �� ��� �������� ��. ��������?
	Info_ClearChoices(DIA_Garond_JanBecomeSmith);
	Info_AddChoice(DIA_Garond_JanBecomeSmith,"� ������� ��� ����.",DIA_Garond_JanBecomeSmith_No);
	Info_AddChoice(DIA_Garond_JanBecomeSmith,"� ������� �� ���.",DIA_Garond_JanBecomeSmith_Yes);
};


func void DIA_Garond_JanBecomeSmith_No()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_No_15_00");	//� ������� ��� ����.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_01");	//��� � ���� �������� ���, ���� ���� �� ������������ � ���?
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_02");	//���� �� ���� ����� �� ������ ����������, ���� �� �� �������� ������� �� �������� � �������.
	Info_ClearChoices(DIA_Garond_JanBecomeSmith);
};

func void DIA_Garond_JanBecomeSmith_Yes()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_Yes_15_00");	//� ������� �� ���.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_Yes_10_01");	//������. �� ����� �������� � �������. ��, ������� ��, �� ������ ������������ ���� ����� ������.
	Info_ClearChoices(DIA_Garond_JanBecomeSmith);
	MIS_JanBecomesSmith = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};

instance DIA_Garond_PERM5(C_Info)
{
	npc = PAL_250_Garond;
	nr = 59;
	condition = DIA_Garond_PERM5_Condition;
	information = DIA_Garond_PERM5_Info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int DIA_Garond_PERM5_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Garond_PERM5_Info()
{
	AI_Output(other,self,"DIA_Garond_PERM5_15_00");	//��� ����������?
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Garond_PERM5_10_01");	//��� �� ������! �����-�� ������� ������� ��������� ������� ������. ������ �� �������� ������ ��� ������.
		AI_Output(self,other,"DIA_Garond_PERM5_10_02");	//��, �������� � �� ����� ���������...
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_PERM5_10_03");	//�� ��� ����� ������ ��� ����, ���� ����� �� �������� ��� ����� ������.
	};
};

