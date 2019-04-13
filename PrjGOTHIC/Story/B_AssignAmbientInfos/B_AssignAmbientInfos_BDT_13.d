
instance DIA_BDT_13_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BDT_13_EXIT_Condition;
	information = DIA_BDT_13_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_13_STANDARD(C_Info)
{
	nr = 2;
	condition = DIA_BDT_13_STANDARD_Condition;
	information = DIA_BDT_13_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_BDT_13_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void B_Verschwinde_Stimme13()
{
	AI_Output(self,other,"DIA_BDT_13_STANDARD_13_01");	//Проваливай!
};

func void DIA_BDT_13_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_BDT_13_STANDARD_13_00");	//Что уставился, как идиот?!
	};
	if(randy == 1)
	{
		B_Verschwinde_Stimme13();
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_BDT_13_STANDARD_13_02");	//Оставь меня в покое, придурок.
	};
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_BDT_13(var C_Npc slf)
{
	dia_bdt_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_bdt_13_standard.npc = Hlp_GetInstanceID(slf);
};

