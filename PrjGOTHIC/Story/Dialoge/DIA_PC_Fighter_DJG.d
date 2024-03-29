
instance DIA_GornDJG_EXIT(C_Info)
{
	npc = PC_Fighter_DJG;
	nr = 999;
	condition = DIA_GornDJG_EXIT_Condition;
	information = DIA_GornDJG_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_GornDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GornDJG_STARTCAMP(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_STARTCAMP_Condition;
	information = DIA_GornDJG_STARTCAMP_Info;
	description = "� ����, �� ������������� � ��������� �� ��������.";
};


func int DIA_GornDJG_STARTCAMP_Condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_STARTCAMP_01") < 1000)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_STARTCAMP_Info()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_15_00");	//� ����, �� ������������� � ��������� �� ��������.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_01");	//� ����� �� ������� � ������ ��������, ������ ��� � ���� ��� ��������� ��� ���� ���� �������, � � ����� ��� ������, ��� ����� ����������.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_02");	//� ����� ���� ��� ���. ����� ����������� ���-�� �� ���. � ����� ������� �� ����� ������� ����� � ����� �����.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_03");	//� �� ��������, ���� ������ � �������� �� ����� ����� ������� ��� ��� ��� ��������.
	Info_AddChoice(DIA_GornDJG_STARTCAMP,"��� ��������.",DIA_GornDJG_STARTCAMP_By);
	Info_AddChoice(DIA_GornDJG_STARTCAMP,"��� �� ���������� ������ ������?",DIA_GornDJG_STARTCAMP_Wohin);
};

func void DIA_GornDJG_STARTCAMP_Wohin()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_Wohin_15_00");	//��� �� ���������� ������ ������?
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_Wohin_12_01");	//� ������� ����� � ������� � ������ ��������, � ����� �����.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_Wohin_12_02");	//��� ������ ����� ������� ��������, ��� ��������� ����.
};

func void DIA_GornDJG_STARTCAMP_By()
{
	DIA_Common_SeeYou();
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_By_12_01");	//���� ���������.
	AI_StopProcessInfos(self);
};


instance DIA_GornDJG_HALLO(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_HALLO_Condition;
	information = DIA_GornDJG_HALLO_Info;
	description = "��� ��� �� ���� �������!";
};


func int DIA_GornDJG_HALLO_Condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1500)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_HALLO_Info()
{
	AI_Output(other,self,"DIA_GornDJG_HALLO_15_00");	//��� ��� �� ���� �������!
	AI_Output(self,other,"DIA_GornDJG_HALLO_12_01");	//�� ���� �� �������� ����� �� ����������.
};


instance DIA_GornDJG_WHATSUP(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_WHATSUP_Condition;
	information = DIA_GornDJG_WHATSUP_Info;
	description = "���-������ �������?";
};


func int DIA_GornDJG_WHATSUP_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_HALLO))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_WHATSUP_Info()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_15_00");	//���-������ �������?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_12_01");	//� ��� ��� �������. ��� �������, ���, �������, � ���� ������ �� �����, ����� ���-�� ����. ����� ��� ����� ���� � ��������� �����.
	Info_ClearChoices(DIA_GornDJG_WHATSUP);
	Info_AddChoice(DIA_GornDJG_WHATSUP,"�����, ��� ������, ������� �������� � ���� ������ ����� �� �����?",DIA_GornDJG_WHATSUP_Lester);
	Info_AddChoice(DIA_GornDJG_WHATSUP,"������?",DIA_GornDJG_WHATSUP_A_Dragon);
	B_LogEntry(TOPIC_Dragonhunter,"���� ��������� � �������� �����������, �������� � ������ �������� � ������. ������ �� ����� ��������� �� ������������ � �������� �����.");
};

func void DIA_GornDJG_WHATSUP_Lester()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_Lester_15_00");	//�����, ��� ������, ������� �������� � ���� ������ ����� �� �����?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_Lester_12_01");	//�����. ��, ��������� � ����, ������ ������ �� ����� ���.
	if(!Npc_KnowsInfo(other,DIA_Lester_Hello) && !Npc_KnowsInfo(other,DIA_Lester_BACKINTOWN))
	{
		AI_Output(other,self,"Extro_Tempel_15_04");	//��, ��� �� ��?
		AI_Output(self,other,"INTRO_DiegoGorn_12_00");	//(��������) ������� ��, �� ��� ���. � �� ��� �����?
	};
};

func void DIA_GornDJG_WHATSUP_A_Dragon()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_A_Dragon_15_00");	//������?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_A_Dragon_12_01");	//������ ��������. �����������, ����������� ���, ���������� �����, ��� ����������� ������������. ��, � ��� ������������ ���� � ��������.
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_A_Dragon_12_02");	//��� ����� ������ ������� ������������. ��, ������, ��� �������� ���� ������ �� ��������.
	GornDJG_WhatMonsters = TRUE;
	B_LogEntry(TOPIC_Dragonhunter,"�������� ����������, ���������� �� �����, � ������ �������� � ������ ��������� ������.");
	Info_ClearChoices(DIA_GornDJG_WHATSUP);
};


instance DIA_GornDJG_WHATMONSTERS(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_WHATMONSTERS_Condition;
	information = DIA_GornDJG_WHATMONSTERS_Info;
	description = "� ��� ��� �� �������?";
};


func int DIA_GornDJG_WHATMONSTERS_Condition()
{
	if(GornDJG_WhatMonsters == TRUE)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_WHATMONSTERS_Info()
{
	AI_Output(other,self,"DIA_GornDJG_WHATMONSTERS_15_00");	//� ��� ��� �� �������?
	AI_Output(self,other,"DIA_GornDJG_WHATMONSTERS_12_01");	//� �� ���� ������ ���������� ��, �� ��� ����� �� ���� ����� � � ��� ���������� ����. ��� ���������� ����� ��� ��������, ��������� ������.
	AI_Output(self,other,"DIA_GornDJG_WHATMONSTERS_12_02");	//� ������ ����� ����� �����, ��� ��� ����� � ������� ���. ��� �������, ��� ������ ��� ����������� ���.
};


instance DIA_GornDJG_WAHTABOUTORCS(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_WAHTABOUTORCS_Condition;
	information = DIA_GornDJG_WAHTABOUTORCS_Info;
	description = "��� ������ �����?";
};


func int DIA_GornDJG_WAHTABOUTORCS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_HALLO))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_WAHTABOUTORCS_Info()
{
	AI_Output(other,self,"DIA_GornDJG_WAHTABOUTORCS_15_00");	//��� ������ �����?
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_01");	//� ���������� �� ���� �������. ���������, ������� ��� ��������� ���, ��������� ���-�� ��������. � ����������, ��� �� ��� ����� ��������� ������ ������� �����.
	AI_Output(other,self,"DIA_GornDJG_WAHTABOUTORCS_15_02");	//�� ������ �������, ���� ������, ��� �� ���� ������?
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_03");	//� �� ��������, ���� ������� ������� ��� �������� ���� �������� � �������� ��� ������. �� �������� ��� ��� ���.
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_04");	//���� ��� ��������, ��� ����� ����� ��������� � ������������ ��. �� ��� ����� ����� �������� � ����� �������. � ����� ������� ��� ����� ������.
};


instance DIA_GornDJG_HELPKILLDRACONIANS(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_HELPKILLDRACONIANS_Condition;
	information = DIA_GornDJG_HELPKILLDRACONIANS_Info;
	description = "�� �������� ��� ��������� � ��� ��������?";
};


func int DIA_GornDJG_HELPKILLDRACONIANS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_WHATMONSTERS) && Npc_KnowsInfo(other,DIA_GornDJG_WAHTABOUTORCS) && !Npc_IsDead(RockDragon))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_HELPKILLDRACONIANS_Info()
{
	AI_Output(other,self,"DIA_GornDJG_HELPKILLDRACONIANS_15_00");	//�� �������� ��� ��������� � ��� ��������?
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_01");	//� ���� �� ����. �����, ���� ��� ����� ������ �����, ��� ������ � ���������.
	AI_Output(other,self,"DIA_GornDJG_HELPKILLDRACONIANS_15_02");	//��� ��������!
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_03");	//����� �� ���� ������. � ������� �� ����� ����, ���� �������, ���������? �� � ������ �������...
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_04");	//�����! ����� � ������ ����� �����? ����� �� ��� ����������� � ������� ���� ������ � ��������.
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_05");	//��������� �������� �� ��������. ����� ����, � ���� ���������� ������� ��������, ��� ������ ���.
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_06");	//��� ��� �����, ����� ������ �����!
	B_LogEntry(TOPIC_Dragonhunter,"���� ����� ������ ��� ��������� ����� ����������� �� �������� � ������.");
};


instance DIA_GornDJG_LOSGEHTS(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_LOSGEHTS_Condition;
	information = DIA_GornDJG_LOSGEHTS_Info;
	description = "����� � �����!";
};


func int DIA_GornDJG_LOSGEHTS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_HELPKILLDRACONIANS))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_LOSGEHTS_Info()
{
	AI_Output(other,self,"DIA_GornDJG_LOSGEHTS_15_00");	//����� � �����!
	AI_Output(self,other,"DIA_GornDJG_LOSGEHTS_12_01");	//��� � ������ �������, ��? �� � ����, ���� �� ����: ��� ��� ���. �� ���� ��� � ����� ������!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"RunToRockRuinBridge");
};


instance DIA_GornDJG_BISHIERHIN(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_BISHIERHIN_Condition;
	information = DIA_GornDJG_BISHIERHIN_Info;
	important = TRUE;
};


func int DIA_GornDJG_BISHIERHIN_Condition()
{
	if(Npc_GetDistToWP(self,"LOCATION_19_01") < 1000)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_BISHIERHIN_Info()
{
	AI_Output(self,other,"DIA_GornDJG_BISHIERHIN_12_00");	//��� ���� ������� �������. �� � ������, �������, � ���������� �� ���������� ���. ����� �� ����! � � ����� ����� � ���� ��������� �� ������.
	AI_Output(other,self,"DIA_GornDJG_BISHIERHIN_15_01");	//��� �������. ��� ��������!
	AI_Output(self,other,"DIA_GornDJG_BISHIERHIN_12_02");	//� ���� ������� �� ���!
	B_LogEntry(TOPIC_Dragonhunter,"���� �������� �� ���� ���������� ����. �� ����� ���������� ��������� �� ������.");
	B_GivePlayerXP(XP_GornDJGPlateauClear);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_GornDJG_DRAGONDEAD(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_DRAGONDEAD_Condition;
	information = DIA_GornDJG_DRAGONDEAD_Info;
	description = "�������� ������ �����!";
};


func int DIA_GornDJG_DRAGONDEAD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_WHATSUP) && (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1000) && Npc_IsDead(RockDragon))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_DRAGONDEAD_Info()
{
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_00");	//�������� ������ �����!
	AI_Output(self,other,"INTRO_DiegoGorn_12_02");	//��! �� ���������� ���?
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_01");	//� ������ �� ����� ������! �� ��� � ���� �������� � ������?
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_02");	//��!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_03");	//��-��-��! � ��� � �����! ��� �� �� �� ��������, ��� ����� �� ����� �� ��������!
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_04");	//��� �� ����������� ������ ������?
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_05");	//� ������ ����� ��� �������, � ����� ������� � ��. �����, �� ��� ��� ����������!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_06");	//���� ��� ������ �� ���� ����. ������ ����� ��������� � ����� �������.
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_07");	//��� ��������!
	B_GivePlayerXP(XP_AmbientKap4);
};

