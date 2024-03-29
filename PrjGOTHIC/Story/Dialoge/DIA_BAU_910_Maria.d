
instance DIA_Maria_EXIT(C_Info)
{
	npc = BAU_910_Maria;
	nr = 999;
	condition = DIA_Maria_EXIT_Condition;
	information = DIA_Maria_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Maria_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Maria_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Maria_Hallo(C_Info)
{
	npc = BAU_910_Maria;
	nr = 1;
	condition = DIA_Maria_Hallo_Condition;
	information = DIA_Maria_Hallo_Info;
	permanent = FALSE;
	description = "��� ��?";
};


func int DIA_Maria_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Maria_Hallo_Info()
{
	AI_Output(other,self,"DIA_Maria_Hallo_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Maria_Hallo_17_01");	//� ���� �����, �����.
	AI_Output(self,other,"DIA_Maria_Hallo_17_02");	//��� ���� ����� �����?
};


instance DIA_Maria_Umsehen(C_Info)
{
	npc = BAU_910_Maria;
	nr = 2;
	condition = DIA_Maria_Umsehen_Condition;
	information = DIA_Maria_Umsehen_Info;
	permanent = FALSE;
	description = "� ������ ����� ����������, ��� �� ������...";
};


func int DIA_Maria_Umsehen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_Umsehen_Info()
{
	AI_Output(other,self,"DIA_Maria_Umsehen_15_00");	//� ������ ����� ����������, ��� �� ������...
	AI_Output(self,other,"DIA_Maria_Umsehen_17_01");	//����� ������� ����� ����� �� �����, ���� � ���� ����� �� �������!
	AI_Output(self,other,"DIA_Maria_Umsehen_17_02");	//��� ��� � ����� ����.
};


instance DIA_Maria_Soeldner(C_Info)
{
	npc = BAU_910_Maria;
	nr = 3;
	condition = DIA_Maria_Soeldner_Condition;
	information = DIA_Maria_Soeldner_Info;
	permanent = FALSE;
	description = "���� ��������� ��������?";
};


func int DIA_Maria_Soeldner_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Umsehen))
	{
		return TRUE;
	};
};

func void DIA_Maria_Soeldner_Info()
{
	AI_Output(other,self,"DIA_Maria_Soeldner_15_00");	//���� ��������� ��������?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_01");	//��, ������ � ���, ��� � ������ ��� ������� - � ��� ���, ��� �� �����, ���� ����� ����� ����������� ����������.
	}
	else
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_02");	//��. ��, ���� � ��� ���, ��� ������ ��������, ���� �� �� ����� ����� ����������.
	};
	AI_Output(self,other,"DIA_Maria_Soeldner_17_03");	//����� �� ���� ��� ���� �� ����, ���� ��������� ��������� ��������� �� ������ � ������� ���.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_04");	//��� �������� ������� ����� ������. � ���� ����. � ������ �� ������ ��� ������.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_05");	//��������� �� ��� ���� ��������, ��� ����� �����.
	if(VisibleGuild(other) == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_06");	//������ �� ����� ���� �������, ������. � ����, ��� �� ��� �� �����.
	};
};


instance DIA_Maria_Mission(C_Info)
{
	npc = BAU_910_Maria;
	nr = 4;
	condition = DIA_Maria_Mission_Condition;
	information = DIA_Maria_Mission_Info;
	permanent = FALSE;
	description = "� ��� ��� ������ � ����?";
};


func int DIA_Maria_Mission_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Soeldner) && (MIS_Maria_BringPlate != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Maria_Mission_Info()
{
	AI_Output(other,self,"DIA_Maria_Mission_15_00");	//� ��� ��� ������ � ����?
	AI_Output(self,other,"DIA_Maria_Mission_17_01");	//� �������� ������ � �������. ��� ���� ������� ��� ��������� �������. ������� �������.
	if(VisibleGuild(other) != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Mission_17_02");	//�������, ��� ������ ������� � ������� � ������-������ ���������� ���������.
	};
	MIS_Maria_BringPlate = LOG_Running;
};


instance DIA_Maria_BringPlate(C_Info)
{
	npc = BAU_910_Maria;
	nr = 5;
	condition = DIA_Maria_BringPlate_Condition;
	information = DIA_Maria_BringPlate_Info;
	permanent = FALSE;
	description = "� ������ ������� �������. ��� �� ����?";
};


func int DIA_Maria_BringPlate_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Hallo) && Npc_HasItems(other,ItMi_MariasGoldPlate))
	{
		return TRUE;
	};
};

func void DIA_Maria_BringPlate_Info()
{
	AI_Output(other,self,"DIA_Maria_BringPlate_15_00");	//� ������ ������� �������. ��� �� ����?
	B_GiveInvItems(other,self,ItMi_MariasGoldPlate,1);
	AI_Output(self,other,"DIA_Maria_BringPlate_17_01");	//��! ��� ���! �������� ���� �������!
	MIS_Maria_BringPlate = LOG_SUCCESS;
	B_GivePlayerXP(XP_Maria_Teller);
};


var int Maria_Belohnung;

instance DIA_Maria_Belohnung(C_Info)
{
	npc = BAU_910_Maria;
	nr = 6;
	condition = DIA_Maria_Belohnung_Condition;
	information = DIA_Maria_Belohnung_Info;
	permanent = TRUE;
	description = "� ��� ������ ����� ��������������?";
};


func int DIA_Maria_Belohnung_Condition()
{
	if((MIS_Maria_BringPlate == LOG_SUCCESS) && (Maria_Belohnung == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Maria_Belohnung_Info()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_15_00");	//� ��� ������ ����� ��������������?
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_01");	//�� ��������� ��������� �� ����� ����, ��?
		AI_Output(other,self,"DIA_Maria_Belohnung_15_02");	//�����.
		AI_Output(self,other,"DIA_Maria_Belohnung_17_03");	//������� ��� ��� ������ ����?
		if(Npc_KnowsInfo(other,DIA_Onar_HowMuch))
		{
			if(Onar_SOLD_Gold == 50)
			{
				AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_50_15_00");	//50 �������.
			}
			else if(Onar_SOLD_Gold == 40)
			{
				AI_Output(other,self,"DIA_Maria_Belohnung_15_03_40_add");	//40 �����.
			}
			else if(Onar_SOLD_Gold == 30)
			{
				AI_Output(other,self,"DIA_Maria_Belohnung_15_03_30_add");	//30 �������.
			}
			else if(Onar_SOLD_Gold == 20)
			{
				AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_20_15_00");	//20.
			}
			else if(Onar_SOLD_Gold == 10)
			{
				AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_10_15_00");	//10 �������.
			}
			else if(Onar_SOLD_Gold < 10)
			{
				AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_04");	//... �� � ���� ��� ���� � 10 �����.
			};
			AI_Output(self,other,"DIA_Maria_Belohnung_17_04");	//����� ������������. ��� � ���� � �����, ����� �� ������ ���� ������.
			AI_Output(other,self,"DIA_Maria_Belohnung_15_05");	//�� �������, �� ���������?
			AI_Output(self,other,"DIA_Maria_Belohnung_17_06");	//�� �����, ��� �����, ���� �� ���������. ������ ���.
			Maria_MehrGold = TRUE;
			Maria_Belohnung = TRUE;
		}
		else
		{
			DIA_Common_Well();
			AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_02");	//����� �� ���, ����� �������� ������ ��������� � ���� �����.
		};
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_07");	//�� ������ ����� ��������� �� ���� �����?
		Info_ClearChoices(DIA_Maria_Belohnung);
		Info_AddChoice(DIA_Maria_Belohnung,"������-�� ���.",DIA_Maria_Belohnung_Gold);
		Info_AddChoice(DIA_Maria_Belohnung,"��.",DIA_Maria_Belohnung_SOLD);
	}
	else
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_08");	//���, ������ ���. �� ��������.
		B_GiveInvItems(self,other,ItMi_Gold,50);
		Maria_Belohnung = TRUE;
	};
};

func void DIA_Maria_Belohnung_Gold()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_Gold_15_00");	//������-�� ���.
	AI_Output(self,other,"DIA_Maria_Belohnung_Gold_17_01");	//����� ������ ��� ������ � �������� �������. �� �������� ���.
	B_GiveInvItems(self,other,ItMi_Gold,50);
	Maria_Belohnung = TRUE;
	Info_ClearChoices(DIA_Maria_Belohnung);
};

func void DIA_Maria_Belohnung_SOLD()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_SOLD_15_00");	//��.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_01");	//������, ���� �� ������ �������� �����, � ��������, ����� �� ������� ������� ���������.
	if(!Npc_KnowsInfo(other,DIA_Onar_HowMuch))
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_02");	//����� �� ���, ����� �������� ������ ��������� � ���� �����.
	};
	Info_ClearChoices(DIA_Maria_Belohnung);
};


instance DIA_Maria_AboutOnar(C_Info)
{
	npc = BAU_910_Maria;
	nr = 7;
	condition = DIA_Maria_AboutOnar_Condition;
	information = DIA_Maria_AboutOnar_Info;
	permanent = FALSE;
	description = "�������� ��� �� �����.";
};


func int DIA_Maria_AboutOnar_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_AboutOnar_Info()
{
	AI_Output(other,self,"DIA_Maria_AboutOnar_15_00");	//�������� ��� �� �����.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_01");	//�� ������� �������. ������� ��������� � ����� ���������������, �� � ��� � ���� ���� ���� ����������.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_02");	//� �������� ������ ����: '������ �� ���������� �������� �� ������ ��� ���������� � �����'?
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_03");	//'������ �� ���-������', - ������� �.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_04");	//� �� ����� ���������. � ������ ��� �������, ��� �� ����� �����.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_05");	//��, ���� ��������, �� ���� ������������� �����, ����� ���?
};


instance DIA_Maria_PERM(C_Info)
{
	npc = BAU_910_Maria;
	nr = 8;
	condition = DIA_Maria_PERM_Condition;
	information = DIA_Maria_PERM_Info;
	permanent = FALSE;
	description = "��� ����������� ���� � ��������� �����?";
};


func int DIA_Maria_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_PERM_Info()
{
	AI_Output(other,self,"DIA_Maria_PERM_15_00");	//��� ����������� ���� � ��������� �����?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_01");	//���� ������ ��������.
		AI_Output(self,other,"DIA_Maria_PERM_17_02");	//������� �� ��������, ��� ��� ���������� ������� �� ���� �����, �� ��� ������ ����, � ������ ��������.
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_03");	//������� ������ ���� ��������� ���� �����. � ����� �����, ��� ��������.
	}
	else if(Kapitel >= 4)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_04");	//� ��� ���, ��� ����� ��������� ���� ������, ����� ����������� ���������.
	};
};

