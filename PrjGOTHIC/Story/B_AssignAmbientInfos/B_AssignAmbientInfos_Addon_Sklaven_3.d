
instance DIA_Sklaven_3_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Common_EXIT_Condition;
	information = DIA_Common_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


instance DIA_Sklaven_3_STANDARD(C_Info)
{
	nr = 2;
	condition = DIA_Sklaven_3_STANDARD_Condition;
	information = DIA_Sklaven_3_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Sklaven_3_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Sklaven_3_STANDARD_Info()
{
	var int random;
	random = Hlp_Random(3);
	if(random == 0)
	{
		AI_Output(self,other,"DIA_Addon_Sklaven_3_STANDARD_03_00");	//(испуганно) Что ты хочешь от меня? Уйди прочь!
	}
	else if(random == 1)
	{
		AI_Output(self,other,"DIA_Addon_Sklaven_3_STANDARD_03_01");	//(нервно) Я ничего не делал! Оставь меня.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Sklaven_3_STANDARD_03_02");	//(испуганно) Пожалуйста, не трогай меня!
	};
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_Addon_Sklaven_3(var C_Npc slf)
{
	DIA_Sklaven_3_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Sklaven_3_STANDARD.npc = Hlp_GetInstanceID(slf);
};

