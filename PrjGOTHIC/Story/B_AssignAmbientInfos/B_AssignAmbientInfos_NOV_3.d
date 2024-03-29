
instance DIA_NOV_3_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_NOV_3_EXIT_Condition;
	information = DIA_NOV_3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_NOV_3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NOV_3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Feger1_Permanent;
var int Feger2_Permanent;
var int Feger1_Once;
var int Feger2_Once;

instance DIA_NOV_3_Fegen(C_Info)
{
	nr = 2;
	condition = DIA_NOV_3_Fegen_Condition;
	information = DIA_NOV_3_Fegen_Info;
	permanent = TRUE;
	description = "��� ����� ������, ����� �������� ����� �����������.";
};

func int DIA_NOV_3_Fegen_Condition()
{
	if((MIS_ParlanFegen == LOG_Running) && (NOV_Helfer < 4))
	{
		if(Kapitel == 1)
		{
			return TRUE;
		};
		if(GuildlessMode == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_NOV_3_Fegen_Info()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_15_00");	//��� ����� ������, ����� �������� ����� �����������.
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Feger1))
	{
		if(Feger1_Permanent == FALSE)
		{
			if(NOV_Helfer == 0)
			{
				AI_Output(self,other,"DIA_NOV_3_Fegen_03_01");	//����� �� ����� �������� ����, ��? ������, � ������ ����, �� ������ �� ������ ����� ��� ����-������ ��� � ����.
				if(Feger1_Once == FALSE)
				{
					B_LogEntry(Topic_ParlanFegen,"���������, ����������� ������, ������� ���, ���� � ����� ����� ��� ������ ����������, �������� ������ �������� �������.");
					Feger1_Once = TRUE;
				};
			}
			else
			{
				AI_Output(self,other,"DIA_NOV_3_Fegen_03_02");	//� ������������, ��� ����� ������ ����?
				AI_Output(other,self,"DIA_NOV_3_Fegen_15_03");	//���, � ��� ����� ���������.
				AI_Output(self,other,"DIA_NOV_3_Fegen_03_04");	//����� - �� ����!
				NOV_Helfer += 1;
				Feger1_Permanent = TRUE;
				B_GivePlayerXP(XP_Feger);
				AI_StopProcessInfos(self);
				Npc_ExchangeRoutine(self,"FEGEN");
				B_LogEntry(Topic_ParlanFegen,"��������� �� ������� ������� ��� ��������� �������.");
			};
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_05");	//��������, ����, � ��� ������� ����. ������ ������� �������.
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Feger2))
	{
		if(Feger2_Permanent == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_08");	//�������, � ������. ��, ����������, ������ ������������ ���� �����. ������� �� - ���, ������ � - ����.
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_09");	//� ����� ����� 50 ������� �����, ��� ����� ��������� �� �������.
			if(Feger2_Once == FALSE)
			{
				B_LogEntry(Topic_ParlanFegen,"��������� � ������ ������� ���, ���� � ��� ��� 50 ������� �����.");
				Feger2_Once = TRUE;
			};
			Info_ClearChoices(DIA_NOV_3_Fegen);
			Info_AddChoice(DIA_NOV_3_Fegen,"�������� �����, ������ � �� ���� ��������� ���� ����� �������.",DIA_NOV_3_Fegen_Nein);
			if(Npc_HasItems(other,ItMi_Gold) >= 50)
			{
				Info_AddChoice(DIA_NOV_3_Fegen,"������, � �������.",DIA_NOV_3_Fegen_Ja);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_06");	//� �� ��� ����������. �� ����� ���, � ������ ����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_NOV_3_Fegen_03_07");	//������ �� ���� - � ���� ��� ���������� �������. ����� ����-������ ���.
	};
};

func void DIA_NOV_3_Fegen_Nein()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_Nein_15_00");	//�������� �����, ������ � �� ���� ��������� ���� ����� �������.
	Info_ClearChoices(DIA_NOV_3_Fegen);
};

func void DIA_NOV_3_Fegen_Ja()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_Ja_15_00");	//������, � �������.
	AI_Output(self,other,"DIA_NOV_3_Fegen_Ja_03_01");	//������, ����� � ����� ����������.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	NOV_Helfer += 1;
	B_GivePlayerXP(XP_Feger);
	Feger2_Permanent = TRUE;
	Info_ClearChoices(DIA_NOV_3_Fegen);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FEGEN");
	B_LogEntry(Topic_ParlanFegen,"��������� � ������ ������� ��� ��������� �������.");
};


instance DIA_NOV_3_Wurst(C_Info)
{
	nr = 3;
	condition = DIA_NOV_3_Wurst_Condition;
	information = DIA_NOV_3_Wurst_Info;
	permanent = TRUE;
	description = "������ �������?";
};


func int DIA_NOV_3_Wurst_Condition()
{
	if(C_CanFeedNOV(self))
	{
		return TRUE;
	};
};

func void DIA_NOV_3_Wurst_Info()
{
	AI_Output(other,self,"DIA_NOV_3_Wurst_15_00");	//������ �������?
	AI_Output(self,other,"DIA_NOV_3_Wurst_03_01");	//�������, ����� �� ����. ��� �� ��������� �� ����� �������.
	B_FeedNOV(self);
};


instance DIA_NOV_3_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_NOV_3_JOIN_Condition;
	information = DIA_NOV_3_JOIN_Info;
	permanent = TRUE;
	description = "� ���� ����� �����!";
};


func int DIA_NOV_3_JOIN_Condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_NOV_3_JOIN_Info()
{
	AI_Output(other,self,"DIA_NOV_3_JOIN_15_00");	//� ���� ����� �����!
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_01");	//����� ����� ��� ����������. �� ������ �������� �� ��� ���������� ���������� � �������� ���� ���� ��������� � ���� ����.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_02");	//����� ����� ����� ���� - ��� ���������� �����, � �� ����� ���������.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_03");	//�� ������ �������� ���������, � �����, ��������, � ���� �������� ����.
};


instance DIA_NOV_3_PEOPLE(C_Info)
{
	nr = 5;
	condition = DIA_NOV_3_PEOPLE_Condition;
	information = DIA_NOV_3_PEOPLE_Info;
	permanent = TRUE;
	description = "��� ����������� ���� ���������?";
};


func int DIA_NOV_3_PEOPLE_Condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_NOV_3_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_NOV_3_PEOPLE_15_00");	//��� ����������� ���� ���������?
	AI_Output(self,other,"DIA_NOV_3_PEOPLE_03_01");	//��, ����������, ������ ����� ����� ����. ��, � ���� �������, ����������� ������ �����, ��������� �� ���� ����� ����������� �����.
	AI_Output(self,other,"DIA_NOV_3_PEOPLE_03_02");	//�� �� ��� ���� ����������� �������� ������. ��� ������ ����� ����� �� �����, �� ��������� �� ������� �����������.
};


instance DIA_NOV_3_LOCATION(C_Info)
{
	nr = 6;
	condition = DIA_NOV_3_LOCATION_Condition;
	information = DIA_NOV_3_LOCATION_Info;
	permanent = TRUE;
	description = "��� �� ������ ������� ��� �� ���� ���������?";
};


func int DIA_NOV_3_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_NOV_3_LOCATION_Info()
{
	AI_Output(other,self,"DIA_NOV_3_LOCATION_15_00");	//��� �� ������ ������� ��� �� ���� ���������?
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_01");	//�� ����� ������ �������� ���� ��������. �� ���������� ���� � ������ ����.
	if(hero.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_NOV_3_LOCATION_03_02");	//����� ���� ����������, �� ���� � ��� �������� ������ ����� � ��������� �����������.
		AI_Output(self,other,"DIA_NOV_3_LOCATION_03_03");	//�� ��, ��������� ����������, ������ �� ���, ����� ���� ����� ���� �� � ��� �� ���������.
	};
};


instance DIA_NOV_3_STANDARD(C_Info)
{
	nr = 10;
	condition = DIA_NOV_3_STANDARD_Condition;
	information = DIA_NOV_3_STANDARD_Info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int DIA_NOV_3_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_NOV_3_STANDARD_Info()
{
	AI_Output(other,self,"DIA_NOV_3_STANDARD_15_00");	//��� ����������?
	if(Kapitel == 1)
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_01");	//� �� ��� �����������! �� ��� ���������� ������ � ���� � �������.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_02");	//����� ����� ������ ���, ����� ������� ������� ����� ���� ��� ������ � ���� ����.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_03");	//����� ����� ��������� ������. ���� �� ����������� ����� ����� ������ � ���� ����.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_04");	//����� �� ��������� � ���������� ���������.
		};
	}
	else if(Kapitel < 4)
	{
		if((Pedro_Traitor == TRUE) && (MIS_NovizenChase != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_05");	//������ ������ ��������� ������� ���� �������! ���, ������ ����, ����� ������, ���� ��� ������ ����� ��������� �����.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_06");	//����� ��� � ���� ��������� ������ ����. � �����, ��� �� �����, ������� �� �������� �� ������� ���������, �������� ��� ���� � ������� ��� �������� ��� ��������� �������.
		}
		else if(MIS_NovizenChase == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_07");	//�� ������ ��� ��� �������. ��� ����� �� ��� �� ������� ������ ������ ��� ������ ���������.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_08");	//�� ������� � ������ ������ ��������� ��� ��������� �����.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_09");	//������� �� ������ �������� ����� ���������. � �����, ��� ����� ���������� ���������� ��� ������� ����������.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_10");	//�������, ��� �� ���������, ������������� � ������ ��������, ��� ������� ������. ������ ����� ����� �����, ��� ����� ������.
		};
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_NOV_3_STANDARD_03_11");	//�������, ��� �� ������ ���������� �������� � ������� ������ �������. ���� ������ ��������� �������� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_NOV_3_STANDARD_03_12");	//����� ������, ������ ����� ��� �����������. �� ������ ��������� �� ���� ������ ���� - ������ � ��� ������� �� ����� ������������� ���.
	};
};

func void B_AssignAmbientInfos_NOV_3(var C_Npc slf)
{
	DIA_NOV_3_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_STANDARD.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_Fegen.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_Wurst.npc = Hlp_GetInstanceID(slf);
};

