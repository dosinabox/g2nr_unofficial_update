
instance DIA_SLD_7_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_SLD_7_EXIT_Condition;
	information = DIA_SLD_7_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_SLD_7_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_7_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_SLD_7_JOIN_Condition;
	information = DIA_SLD_7_JOIN_Info;
	permanent = TRUE;
	description = "� ���� �������������� � ���!";
};


func int DIA_SLD_7_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_SLD_7_JOIN_Info()
{
	AI_Output(other,self,"DIA_SLD_7_JOIN_15_00");	//� ���� �������������� � ���!
	if(MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_SLD_7_JOIN_07_01_add");	//����� ����, ��� ��, ����� ���...
	}
	else if(MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_SLD_7_JOIN_07_02");	//� �� ������ ���� ����� � �������� ����� �� ������� ��������, �� ���� ���� ����� ������� �� ���, � �� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_SLD_7_JOIN_07_03");	//��? ������� ������ ��������� �������, � ��� ���������!
	};
};


instance DIA_SLD_7_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_SLD_7_PEOPLE_Condition;
	information = DIA_SLD_7_PEOPLE_Info;
	permanent = TRUE;
	description = "��� ���������� �����?";
};


func int DIA_SLD_7_PEOPLE_Condition()
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

func void DIA_SLD_7_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_SLD_7_PEOPLE_15_00");	//��� ���������� �����?
	AI_Output(self,other,"DIA_SLD_7_PEOPLE_07_01");	//���� ��������� ��. ������ - ��� ������ ����. ����������� ������ ����������� ��� ��� �� ������ �������.
	if(MIS_ReadyforChapter4 == FALSE)
	{
		AI_Output(self,other,"DIA_SLD_7_PEOPLE_07_02");	//� ��� ���� �������. �� ��������� � ��� �� ������ ������ ������ �������.
		AI_Output(self,other,"DIA_SLD_7_PEOPLE_07_03");	//��� ���� ���������� ������ ��������� ����� ���������, �� ������� �� ��� ���� �����. ��� ����� ����� �� ����������� �������.
		AI_Output(self,other,"DIA_SLD_7_PEOPLE_07_04");	//� ���� ������� ��� ��� ����� ���, ��� ��� ���� ������������, ���� ������������ � ���.
	};
};


instance DIA_SLD_7_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_SLD_7_LOCATION_Condition;
	information = DIA_SLD_7_LOCATION_Info;
	permanent = TRUE;
	description = "�������� ��� �� ���� �����.";
};


func int DIA_SLD_7_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_SLD_7_LOCATION_Info()
{
	AI_Output(other,self,"DIA_SLD_7_LOCATION_15_00");	//�������� ��� �� ���� �����.
	AI_Output(self,other,"DIA_SLD_7_LOCATION_07_01");	//���� ����� ��� �������� ��� �������������.
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_SLD_7_LOCATION_07_02");	//��� ��� ���� �� ����� ���-������ ������� ��� ������ �������. � ���� ����� ������� ��������, �����?
	};
};


instance DIA_SLD_7_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_SLD_7_STANDARD_Condition;
	information = DIA_SLD_7_STANDARD_Info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int DIA_SLD_7_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_SLD_7_STANDARD_Info()
{
	AI_Output(other,self,"DIA_SLD_7_STANDARD_15_00");	//��� ����������?
	if(Kapitel <= 2)
	{
		if((Torlof_KnowsDragons == FALSE) && !Npc_KnowsInfo(other,DIA_Lee_Report))
		{
			if(other.guild == GIL_SLD)
			{
				AI_Output(self,other,"DIA_SLD_7_STANDARD_07_01");	//� ��� ���, ��� �� ������������� � ���, �� ����� ��� �������� - ��������� ����� ������ �� ����������.
			}
			else
			{
				AI_Output(self,other,"DIA_SLD_7_STANDARD_07_02");	//����� ������. ����� ����������� � ������. � �����, ��� �������� �� �������� ��������������. (�������)
			};
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_03");	//������� ������ ��������! �� ����� �� � ������ ��������� �� ����� ���������.
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_04");	//� �����, ������ ���� ����� ������ �������� ����� ��� ���, ����� ��� �������� � ������� ������ ��-�� ��������.
		};
	}
	else if(Kapitel == 3)
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
			{
				AI_Output(self,other,"DIA_SLD_7_STANDARD_07_06");	//�������� � �������� ����������� ��������� ����. ������� � ������. �� �� ��������� ����� ����� ������� � �������� ��� ��� �� �����.
				AI_Output(self,other,"DIA_SLD_7_STANDARD_07_07");	//�� ��� ����� �������� �� � ���������������, � ������ ����� ��� ����� ������������ ����...
			}
			else
			{
				AI_Output(self,other,"DIA_SLD_7_STANDARD_07_08");	//� �� ����, ������ �� ����� �������, �� ������ ���, ���� �� ���� �����.
			};
		}
		else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_09");	//���� ������ � �������� ��� ����� �� ��������. ��������, ��� ��� �� ����� ������������ � ������� � ����� ����� �������.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_10");	//��� �� ����������� ������� � ��������? �, �����, � ���� �� ���� �����, �� ����� ���� �������, � ���� ��� ��������.
		};
	}
	else if(Kapitel == 4)
	{
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_05");	//����� ��, ��������, �� ������ ���������� � ���������? ��� ��� ���� �� ������ ��� ��������� ������.
		}
		else if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_11");	//� �����, �� ���� ���������� � ������. ������ � �������.
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_12");	//����� �� ��� �� ����� ������, ���� ������� ��������� � ������ ��������!
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_13");	//��� ������������ �������� - ������ ���� ������.
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_14");	//�� ���� ��� �� �������, ���� ������ �� �� ������� �������� ����� ������.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_SLD_7_STANDARD_07_15");	//��, � ������ �� ���� �������� ��� ���. ����, ��������, �������... � ���� ������� ������.
	};
};

func void B_AssignAmbientInfos_SLD_7(var C_Npc slf)
{
	DIA_SLD_7_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_SLD_7_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_SLD_7_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_SLD_7_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_SLD_7_STANDARD.npc = Hlp_GetInstanceID(slf);
};

