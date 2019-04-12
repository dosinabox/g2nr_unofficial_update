
instance DIA_Addon_Tonak_EXIT(C_Info)
{
	npc = STRF_1120_Addon_Tonak;
	nr = 999;
	condition = DIA_Addon_Tonak_EXIT_Condition;
	information = DIA_Addon_Tonak_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Tonak_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Tonak_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Tonak_Hi(C_Info)
{
	npc = STRF_1120_Addon_Tonak;
	nr = 2;
	condition = DIA_Addon_Tonak_Hi_Condition;
	information = DIA_Addon_Tonak_Hi_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Tonak_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Sklaven_Flucht == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Tonak_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Tonak_Hi_03_00");	//Что тебе нужно? Я - всего лишь пленный рабочий. Я не сделал ничего плохого.
	AI_StopProcessInfos(self);
};

