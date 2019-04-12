
instance DIA_Skalven_3_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Skalven_3_EXIT_Condition;
	information = DIA_Skalven_3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Skalven_3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Skalven_3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Skalven_3_STANDARD(C_Info)
{
	nr = 2;
	condition = DIA_Skalven_3_STANDARD_Condition;
	information = DIA_Skalven_3_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Skalven_3_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Skalven_3_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_Addon_Sklaven_3_STANDARD_03_00");	//(испуганно) Что ты хочешь от меня? Уйди прочь!
	};
	if(randy == 1)
	{
		AI_Output(self,other,"DIA_Addon_Sklaven_3_STANDARD_03_01");	//(нервно) Я ничего не делал! Оставь меня.
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_Addon_Sklaven_3_STANDARD_03_02");	//(испуганно) Пожалуйста, не трогай меня!
	};
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_Addon_Sklaven_3(var C_Npc slf)
{
	DIA_Skalven_3_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Skalven_3_STANDARD.npc = Hlp_GetInstanceID(slf);
};

