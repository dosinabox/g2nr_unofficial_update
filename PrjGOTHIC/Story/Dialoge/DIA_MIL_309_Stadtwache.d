
instance DIA_Mil_309_Stadtwache_EXIT(C_Info)
{
	npc = MIL_309_Stadtwache;
	nr = 999;
	condition = DIA_Mil_309_Stadtwache_EXIT_Condition;
	information = DIA_Mil_309_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_309_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_309_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Mil_309_Stadtwache_Hallo(C_Info)
{
	npc = MIL_309_Stadtwache;
	nr = 2;
	condition = DIA_Mil_309_Stadtwache_Hallo_Condition;
	information = DIA_Mil_309_Stadtwache_Hallo_Info;
	permanent = TRUE;
	description = "� ��� ����?";
};


func int DIA_Mil_309_Stadtwache_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Mil_309_Stadtwache_Hallo_Info()
{
	AI_Output(other,self,"DIA_Mil_309_Stadtwache_Hallo_15_00");	//� ��� ����?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_01");	//��� � �������. �� �� ������ ���� ���������.
	}
	else if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_05");	//����������� ����, ������ ������, �������!
	}
	else if(Stadtwache_310.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_02");	//��������. �� �� ����� ���������� ���� � �����.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_03");	//�� � ��� ���� �����, � ���������� ���������.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_04");	//������� �������� �� ����� ���� ������� - ��� ������ ������� ������� ��������.
	}
	else
	{
		if(Mil_309_News == FALSE)
		{
			AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_06");	//��������, �� ������ ����� ���������� � ������. �� ��� �� ��������, ��� �� ������ ������ ����� ���, ��� ���� �����������������.
			AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_07");	//���� �� �� ��������������� ������������ ������, �� ��������� ���� ����� �����!
			MIl_309_News = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_08");	//����� - �������!
		};
	};
	AI_StopProcessInfos(self);
};

