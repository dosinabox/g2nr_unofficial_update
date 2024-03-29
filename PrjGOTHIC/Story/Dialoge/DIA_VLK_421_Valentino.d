
instance DIA_Valentino_EXIT(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 999;
	condition = DIA_Valentino_EXIT_Condition;
	information = DIA_Valentino_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Valentino_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Valentino_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Valentino_HALLO(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 1;
	condition = DIA_Valentino_HALLO_Condition;
	information = DIA_Valentino_HALLO_Info;
	permanent = FALSE;
	description = "���, � ��� � ��� �����?";
};


func int DIA_Valentino_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Valentino_HALLO_Info()
{
	AI_Output(other,self,"DIA_Valentino_HALLO_15_00");	//���, � ��� � ��� �����?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_01");	//���� ����� ���������. � ������� �� ���������� ���� ����, ������ ��� �������, ����� �������.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_02");	//�������� ����.
		AI_Output(self,other,"DIA_Valentino_HALLO_03_03");	//��, ����� ��������, � �� ����� ��������� ������ �������. ��� ��� ����� �������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_04");	//�� �������� � �������� ��������? ��� �������������!
		AI_Output(self,other,"DIA_Valentino_HALLO_03_05");	//������� ���� ������� �����. � ���� ���, ��� ������, ������� �� ������ ����������?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_06");	//��, � �������, ����� �� �������� ������ ����������� ��� ��, ��?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_07");	//��, ���� �� � ���� ���� ������� �� ������, ������� � ����, �� �� �� ���� �� �������. �� ���� ������� �� ����� ����� �������.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_08");	//�� ����� ��������.
	};
};


instance DIA_Valentino_WhoAgain(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 2;
	condition = DIA_Valentino_WhoAgain_Condition;
	information = DIA_Valentino_WhoAgain_Info;
	permanent = FALSE;
	description = "� ������� ����, ��� �� �����!";
};


func int DIA_Valentino_WhoAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Valentino_HALLO) && (other.guild != GIL_KDF) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Valentino_WhoAgain_Info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_01");	//� ������� ����, ��� �� �����!
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_01");	//� ��������� ������������. �������� � �������� ������.
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_02");	//������ ��������, ������� ��������� � �������, ������� ��� � ��������� �� ����.
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_03");	//���� � ���� ���� ��������, ����� �� ��� ����. ��� ��� �� �����.
};


instance DIA_Valentino_Manieren(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 3;
	condition = DIA_Valentino_Manieren_Condition;
	information = DIA_Valentino_Manieren_Info;
	permanent = FALSE;
	description = "������, ��� �������� ������� ���� ������� �������!";
};


func int DIA_Valentino_Manieren_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Valentino_HALLO) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Valentino_Manieren_Info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_02");	//(��������) ������, ��� �������� ������� ���� ������� �������!
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_01");	//���� ��� �� �������! ������ ����, ������� ������. � ����� � ������ ������ �����, � ����� ���� �����������.
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_02");	//�� ���� �������� ���� ������ � ���� ������������� �� ����� ����� ����.
};


var int Valentino_Lo_Perm;
var int Valentino_Hi_Perm;

instance DIA_Valentino_WASNUETZLICHES(C_Info)
{
	npc = VLK_421_Valentino;
	nr = 4;
	condition = DIA_Valentino_WASNUETZLICHES_Condition;
	information = DIA_Valentino_WASNUETZLICHES_Info;
	permanent = TRUE;
	description = "�� ��� ���-������ ������ ������� ���?";
};


func int DIA_Valentino_WASNUETZLICHES_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Valentino_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Valentino_WASNUETZLICHES_Info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_03");	//(��������) �� ��� ���-������ ������ ������� ���?
	if(self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		B_Say(self,other,"$NOTNOW");
	}
	else if((Valentino_Lo_Perm == FALSE) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_01");	//����� ����������, ������� ������ ������ �� ������, ���� ��, ��� ������, � ������, ����� �� ��������� � ����� � ����������.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_02");	//��� � �������� �����, �������. ��� ���� �����, �� ������ ���.
		Valentino_Lo_Perm = TRUE;
	}
	else if((Valentino_Hi_Perm == FALSE) && ((other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_03");	//��� �������� � ����� ��������� ��� ������ ������������. �� ������ ������ �����, ����� ����� �����������.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_04");	//��� ��� �� ����� ������� � ��������.
		Valentino_Hi_Perm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_05");	//� ������ ���� ���, ��� ���� ����� �����. ��������� �� �����.
	};
};

