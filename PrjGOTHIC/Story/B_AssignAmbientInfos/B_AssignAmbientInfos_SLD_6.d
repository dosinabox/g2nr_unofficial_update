
instance DIA_SLD_6_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_SLD_6_EXIT_Condition;
	information = DIA_SLD_6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_SLD_6_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_6_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_SLD_6_JOIN_Condition;
	information = DIA_SLD_6_JOIN_Info;
	permanent = TRUE;
	description = "� ���� �������������� � ���!";
};


func int DIA_SLD_6_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_SLD_6_JOIN_Info()
{
	AI_Output(other,self,"DIA_SLD_6_JOIN_15_00");	//� ���� �������������� � ���!
	if(MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_SLD_6_JOIN_06_01");	//� ������ �� ���� ���� � ����������. ������ �������, ��� �� ������ ���������. �� �������� ��� �����.
	}
	else if(MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_SLD_6_JOIN_06_02");	//������� �������� - ��� ����, �� �������� � ��� � ���������� - ��� ������ ������. ���� ���� ������ ����� ��� ����, � ���� �� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_SLD_6_JOIN_06_03");	//�������� � ��������. �� ������� ����... (�������)
	};
};


instance DIA_SLD_6_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_SLD_6_PEOPLE_Condition;
	information = DIA_SLD_6_PEOPLE_Info;
	permanent = TRUE;
	description = "��� ���������� �����?";
};


func int DIA_SLD_6_PEOPLE_Condition()
{
	if((other.guild == GIL_SLD) && (Kapitel == 1))
	{
		return TRUE;
	}
	else if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_SLD_6_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_SLD_6_PEOPLE_15_00");	//��� ���������� �����?
	AI_Output(self,other,"DIA_SLD_6_PEOPLE_06_01");	//��� ����� ����������� �����, ���� �� ��� ������ � ����. �� ���� ��������� ��.
	AI_Output(self,other,"DIA_SLD_6_PEOPLE_06_02");	//�� ��� ��������� � ����������� �����. �� �� ������ �� �� ��������� ���� � �������. (�������)
	AI_Output(self,other,"DIA_SLD_6_PEOPLE_06_03");	//������� ��� ���. ���� � ���� ��������� �������� �����, ��, �������, ������������, ��� ����� ������ ��. ��� ��������� ������ ������ � ���� �����.
};


instance DIA_SLD_6_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_SLD_6_LOCATION_Condition;
	information = DIA_SLD_6_LOCATION_Info;
	permanent = TRUE;
	description = "�� ��������� ��������?";
};


func int DIA_SLD_6_LOCATION_Condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_SLD_6_LOCATION_Info()
{
	AI_Output(other,self,"DIA_SLD_6_LOCATION_15_00");	//�� ��������� ��������?
	AI_Output(self,other,"DIA_SLD_6_LOCATION_06_01");	//�� �������� �� ������ ����� �����, �� � ��� ��� ������.
	AI_Output(self,other,"DIA_SLD_6_LOCATION_06_02");	//���� �����, ����� �� ������ ��������� ����� ����������. ��� ��� ���������� ����� ���� ��� ��������.
};


instance DIA_SLD_6_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_SLD_6_STANDARD_Condition;
	information = DIA_SLD_6_STANDARD_Info;
	permanent = TRUE;
	description = "� ��� ����?";
};


func int DIA_SLD_6_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_SLD_6_STANDARD_Info()
{
	AI_Output(other,self,"DIA_SLD_6_STANDARD_15_00");	//� ��� ����?
	if(Kapitel <= 2)
	{
		if((Torlof_KnowsDragons == FALSE) && !Npc_KnowsInfo(other,DIA_Lee_Report))
		{
			if(other.guild == GIL_SLD)
			{
				AI_Output(self,other,"DIA_SLD_6_STANDARD_06_01");	//�� ������ ���� �� ���, ������!
			}
			else
			{
				AI_Output(self,other,"DIA_SLD_6_STANDARD_06_02");	//���� ���� �����?
			};
		}
		else if(other.guild == GIL_SLD)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_03");	//����� � ������� � ��������, � ������� ���� �� �������.
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_04");	//������ - ��� ��� ��������� ���������. ��� �� ��, ��� �����-�� ��� ���� ��� ���������� ���������.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_05");	//��� ��� ���� �����, �� ��� �� ������� ����� �� ������ ����� ���������?
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_06");	//������, ������ ��� �������� �������� ���� ���������� ������� �� ������ � �������� �� ������.
		};
	}
	else if(Kapitel == 3)
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_07");	//���� ����� ����� ������� ���� ����������. ��� ��������� ���� - � �� �� ��������� � ����� � ���������� ������� ����.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_08");	//���� ������� �� �������� �� ������, �� ���� ������ ���� � ��������� ���.
			if(MIS_RescueBennet != LOG_Running)
			{
				MIS_RescueBennet = LOG_Running;
				Log_CreateTopic(TOPIC_RescueBennet,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_RescueBennet,LOG_Running);
				B_LogEntry(TOPIC_RescueBennet,"� ������� ������� ��������� ��������. �������, ��� �� ��� ���������.");
			};
		};
	}
	else if(Kapitel == 4)
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_09");	//��� �� ��� ���������� �����? ����� �� �� ���������� � ������ ������ � ����������?
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_10");	//���� �� ��� ��� � ��������.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_11");	//�� ������ ���� � ������ ��������. � ������, ��� ���� �������� ��� ���������� ������.
		};
	}
	else
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_12");	//����� �� �������� �����, � ����� �����, ��� �� ��� ����� ����������� ����� ����.
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_13");	//�� �������? ��� ���-��! ������ ���� �� ���-�� ������� ����������� � �����.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_14");	//� �������. �� �� �� ����� �������, �� ������ ��� ��������� - ��� ������� ������.
		};
	};
};

func void B_AssignAmbientInfos_SLD_6(var C_Npc slf)
{
	DIA_SLD_6_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_SLD_6_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_SLD_6_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_SLD_6_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_SLD_6_STANDARD.npc = Hlp_GetInstanceID(slf);
};

