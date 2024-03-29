
instance DIA_Addon_Malcom_EXIT(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 999;
	condition = DIA_Addon_Malcom_EXIT_Condition;
	information = DIA_Addon_Malcom_EXIT_Info;
	permanent = TRUE;
	description = "� ������ ����.";
};


func int DIA_Addon_Malcom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Malcom_EXIT_Info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_perm_15_00");	//� ������ ����.
	if(MalcomBotschaft == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Malcom_perm_04_01");	//�� �������� � ����� ��������. ����� �������� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_03");	//��! ����� ���������� �� ������ ������, ������� �� ���� ���-��� �����.
		AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_04");	//����� ���, ��� ������� ����� ��������� �������.
		AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_05");	//��� �������� ��� ���������.
		MalcomBotschaft = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Malcom_Hello(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 1;
	condition = DIA_Addon_Malcom_Hello_Condition;
	information = DIA_Addon_Malcom_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Malcom_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Malcom_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Malcom_Hello_04_01");	//�� �� ������, �����?
	AI_Output(self,other,"DIA_Addon_Malcom_Hello_04_02");	//������, �� �������� ������� ����.
};


instance DIA_Addon_Malcom_WasMachen(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 2;
	condition = DIA_Addon_Malcom_WasMachen_Condition;
	information = DIA_Addon_Malcom_WasMachen_Info;
	description = "�� �����?";
};


func int DIA_Addon_Malcom_WasMachen_Condition()
{
	return TRUE;
};

func void DIA_Addon_Malcom_WasMachen_Info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_WasMachen_15_00");	//�� �����?
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_01");	//� �� ���������... ����� �����, ����� � ������ ��� ��� �������.
	if(Henry.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Malcom_WasMachen_15_02");	//�����?
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_00");	//�� ��������� ����� �������.
	};
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_04");	//��������� ����� � ����� ������ � ����������������.
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_05");	//�������, ��� ���� �������������� ��������� �� ����� �������� � ��� �����.
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_06");	//�� ���-�� �� � ������� �� �������.
};


instance DIA_Addon_Malcom_Entertrupp(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 5;
	condition = DIA_Addon_Malcom_Entertrupp_Condition;
	information = DIA_Addon_Malcom_Entertrupp_Info;
	description = "����� - ��� ��������?";
};


func int DIA_Addon_Malcom_Entertrupp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
};

func void DIA_Addon_Malcom_Entertrupp_Info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_Entertrupp_15_00");	//����� - ��� ��������?
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_03");	//��, �������� ������ ������� ������.
	AI_Output(self,other,"DIA_Addon_Malcom_Add_04_01");	//� ������ �������� ����� ����.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_02");	//�� ������ ��� ����� ���.
	};
};


instance DIA_Addon_Malcom_Lager(C_Info)
{
	npc = PIR_1368_Addon_Malcom;
	nr = 3;
	condition = DIA_Addon_Malcom_Lager_Condition;
	information = DIA_Addon_Malcom_Lager_Info;
	description = "� ��� ��������� ��� ������?";
};


func int DIA_Addon_Malcom_Lager_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
};

func void DIA_Addon_Malcom_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_Lager_15_00");	//� ��� ��������� ��� ������?
	AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_01");	//��������� ���� �� ���� ������ �� �����.
	AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_02");	//�������� ����� �� ������� �����.
};

