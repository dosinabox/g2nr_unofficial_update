
instance DIA_Addon_Pardos_NW_EXIT(C_Info)
{
	npc = STRF_1127_Addon_Pardos_NW;
	nr = 999;
	condition = DIA_Addon_Pardos_NW_EXIT_Condition;
	information = DIA_Addon_Pardos_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Pardos_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Pardos_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Pardos_NW_Hi(C_Info)
{
	npc = STRF_1127_Addon_Pardos_NW;
	nr = 2;
	condition = DIA_Addon_Pardos_NW_Hi_Condition;
	information = DIA_Addon_Pardos_NW_Hi_Info;
	permanent = FALSE;
	description = "Как идут дела?";
};


func int DIA_Addon_Pardos_NW_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Pardos_NW_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Pardos_NW_Hi_15_00");	//Как идут дела?
	if(Npc_GetDistToWP(self,"NW_FARM3_HOUSE_IN_NAVI_2") <= 1000)
	{
		AI_Output(self,other,"DIA_Addon_Pardos_NW_Hi_03_01");	//(усмехается) Это же мой спаситель. Спасибо. Теперь я, наконец, могу отдохнуть.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Pardos_NW_Hi_03_01_add");	//(усмехается) Это же мой спаситель. Спасибо.
	};
	AI_Output(other,self,"DIA_Addon_Pardos_NW_Hi_15_02");	//Удачи.
};

