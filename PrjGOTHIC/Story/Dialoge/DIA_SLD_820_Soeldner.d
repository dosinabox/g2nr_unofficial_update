
instance DIA_Sld_820_EXIT(C_Info)
{
	npc = SLD_820_Soeldner;
	nr = 999;
	condition = DIA_Sld_820_EXIT_Condition;
	information = DIA_Sld_820_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sld_820_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sld_820_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sld_820_Halt(C_Info)
{
	npc = SLD_820_Soeldner;
	nr = 1;
	condition = DIA_Sld_820_Halt_Condition;
	information = DIA_Sld_820_Halt_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sld_820_Halt_Condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Sld_820_Halt_Info()
{
	if(Npc_GetDistToWP(other,"NW_BIGFARM_HOUSE_01") >= 500)
	{
		AI_Output(self,other,"DIA_Sld_820_Halt_07_00");	//� ���� �� �����?
		AI_Output(other,self,"DIA_Sld_820_Halt_15_01");	//� ���, ������� ��.
	};
	AI_Output(self,other,"DIA_Sld_820_Halt_07_02");	//���� ������ ��� �� ��, ����� �� �� ������� � ��� ������ ����� ����!
	if(VisibleGuild(other) == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Sld_820_Halt_07_03");	//����� �� ����� ���������! �� ������ ��� � ������.
	};
	AI_Output(other,self,"DIA_Sld_820_Halt_15_04");	//� ���� ���������� � ��!
	AI_Output(self,other,"DIA_Sld_820_Halt_07_05");	//��� ���� ����� �� ����?
	Info_ClearChoices(DIA_Sld_820_Halt);
	Info_AddChoice(DIA_Sld_820_Halt,"�� � � ������ ��������...",DIA_Sld_820_Halt_KenneLee);
	if(other.guild == GIL_NONE)
	{
		Info_AddChoice(DIA_Sld_820_Halt,"� ���� �������������� � ���������!",DIA_Sld_820_Halt_WannaJoin);
	};
};

func void B_Sld_820_LeeIsRight()
{
	AI_Output(self,other,"B_Sld_820_LeeIsRight_07_00");	//�� � ������ �����. � ���� �� ������� ��������� ����-���� ���!
};

func void DIA_Sld_820_Halt_WannaJoin()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_WannaJoin_15_00");	//� ���� �������������� � ���������!
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_01");	//��, ������ �������� ����! ����� ����������.
	B_Sld_820_LeeIsRight();
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_02");	//�� ������ ������������: ������ ����� � �����! �� ����� �� �����, ����� � ��� ������������ �����������. �������� ����� ����� ����.
	AI_StopProcessInfos(self);
};

func void DIA_Sld_820_Halt_KenneLee()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_KenneLee_15_00");	//�� � � ������ ��������...
	AI_Output(self,other,"DIA_Sld_820_Halt_KenneLee_07_01");	//�� �������� ��? � �� ���� � ���! �� ��� �����, �������, � ���� �� �� ������ ����, ����� �������... (�������)
	B_Sld_820_LeeIsRight();
	AI_StopProcessInfos(self);
};


instance DIA_Sld_820_PERM(C_Info)
{
	npc = SLD_820_Soeldner;
	nr = 1;
	condition = DIA_Sld_820_PERM_Condition;
	information = DIA_Sld_820_PERM_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Sld_820_PERM_Condition()
{
	return TRUE;
};

func void DIA_Sld_820_PERM_Info()
{
	AI_Output(other,self,"DIA_Sld_820_PERM_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Sld_820_PERM_07_01");	//�������, ���� ������, �� �� ���� ��������� �����.
	AI_StopProcessInfos(self);
};

