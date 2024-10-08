
instance DIA_PAL_263_EXIT(C_Info)
{
	npc = PAL_263_Wache;
	nr = 999;
	condition = DIA_PAL_263_EXIT_Condition;
	information = DIA_PAL_263_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_263_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_263_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_263_PERM(C_Info)
{
	npc = PAL_263_Wache;
	nr = 2;
	condition = DIA_PAL_263_PERM_Condition;
	information = DIA_PAL_263_PERM_Info;
	permanent = TRUE;
	description = "����������, ������!";
};


func int DIA_PAL_263_PERM_Condition()
{
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_PAL_263_PERM_Info()
{
	AI_Output(other,self,"DIA_PAL_263_PERM_15_00");	//����������, ������!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_PAL_263_PERM_04_01");	//����, ���! ��������� �������, ��� ���������. ������ ����������. �������� ���������, ���� ��������.
	};
	AI_Output(self,other,"DIA_PAL_263_PERM_04_02");	//��������� ����� ������� ��������� ���������� ������� �����. �� � ��� ��� �� ����������� ������ ����������.
	AI_Output(other,self,"DIA_PAL_263_PERM_15_03");	//������, �������.
};


instance DIA_PAL_263_PERM_CIV(C_Info)
{
	npc = PAL_263_Wache;
	nr = 2;
	condition = DIA_PAL_263_PERM_CIV_Condition;
	information = DIA_PAL_263_PERM_CIV_Info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int DIA_PAL_263_PERM_CIV_Condition()
{
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_PAL_263_PERM_CIV_Info()
{
	AI_Output(other,self,"DIA_PAL_263_PERM_OTH_15_00");	//��� ����������?
	AI_Output(self,other,"DIA_PAL_263_PERM_OTH_04_01");	//�� ������ �������� ��� ���������. ���� �� � ��� ������������, �����������. ��� ����� ������.
};


instance DIA_PAL_263_PERM_OTH(C_Info)
{
	npc = PAL_263_Wache;
	nr = 2;
	condition = DIA_PAL_263_PERM_OTH_Condition;
	information = DIA_PAL_263_PERM_OTH_Info;
	permanent = TRUE;
	description = "��� ��������� �����?";
};


func int DIA_PAL_263_PERM_OTH_Condition()
{
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_NOV) || (hero.guild == GIL_KDF) || (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_PAL_263_PERM_OTH_Info()
{
	AI_Output(other,self,"DIA_WACHE_PERM_15_00");	//��� ��������� �����?
	AI_Output(self,other,"DIA_WACHE_PERM_10_01");	//��� ����������� ������ � ��� ��� ���������, �������� ���� � ���������.
	AI_Output(self,other,"DIA_WACHE_PERM_10_02");	//���� �� ������ ������� �� � ������� ���� �� ������ �����.
};

