
instance DIA_Mil_304_Torwache_EXIT(C_Info)
{
	npc = MIL_304_Torwache;
	nr = 999;
	condition = DIA_Mil_304_Torwache_EXIT_Condition;
	information = DIA_Mil_304_Torwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_304_Torwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_304_Torwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Mil_304_Torwache_WASMACHSTDU(C_Info)
{
	npc = MIL_304_Torwache;
	nr = 3;
	condition = DIA_Mil_304_Torwache_WASMACHSTDU_Condition;
	information = DIA_Mil_304_Torwache_WASMACHSTDU_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Mil_304_Torwache_WASMACHSTDU_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mil_304_Torwache_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Mil_304_Torwache_WASMACHSTDU_15_00");	//��� ����?
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Mil_304_Torwache_WASMACHSTDU_08_01");	//��� �� �� ��� ����������. � �������� ���� �����������, ��� ���� ������ �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_304_Torwache_WASMACHSTDU_08_02");	//��, ������ ����� ���� ����� '��� ���������'. �������� � ���� ����, �������?
	};
	AI_StopProcessInfos(self);
};

