
instance DIA_BDT_6_EXIT(C_Info)
{
	nr = 999;
	condition = dia_bdt_6_exit_condition;
	information = dia_bdt_6_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_bdt_6_exit_condition()
{
	return TRUE;
};

func void dia_bdt_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_6_STANDARD(C_Info)
{
	nr = 2;
	condition = dia_bdt_6_standard_condition;
	information = dia_bdt_6_standard_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bdt_6_standard_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void b_verschwinde_stimme6()
{
	AI_Output(self,other,"SVM_6_GetOutOfHere");	//Убирайся отсюда!
};

func void dia_bdt_6_standard_info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		AI_Output(self,other,"SVM_6_WhatsThisSupposedToBe");	//Что ты задумал? Что ты тут ошиваешься?
	};
	if(randy == 1)
	{
		b_verschwinde_stimme6();
	};
	if(randy == 2)
	{
		AI_Output(self,other,"SVM_6_NOTNOW");	//Оставь меня в покое!
	};
	AI_StopProcessInfos(self);
};

func void b_assignambientinfos_bdt_6(var C_Npc slf)
{
	dia_bdt_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_bdt_6_standard.npc = Hlp_GetInstanceID(slf);
};

