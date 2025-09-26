
instance DIA_MIL_304_Torwache_EXIT(C_Info)
{
	npc = MIL_304_Torwache;
	nr = 999;
	condition = DIA_MIL_304_Torwache_EXIT_Condition;
	information = DIA_MIL_304_Torwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MIL_304_Torwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MIL_304_Torwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_304_Torwache_WASMACHSTDU(C_Info)
{
	npc = MIL_304_Torwache;
	nr = 3;
	condition = DIA_MIL_304_Torwache_WASMACHSTDU_Condition;
	information = DIA_MIL_304_Torwache_WASMACHSTDU_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_MIL_304_Torwache_WASMACHSTDU_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_MIL_304_Torwache_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_MIL_304_Torwache_WASMACHSTDU_15_00");	//Как дела?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_MIL_304_Torwache_WASMACHSTDU_08_01");	//Мне не на что жаловаться. Я выполняю свои обязанности, как того желает Иннос.
	}
	else
	{
		AI_Output(self,other,"DIA_MIL_304_Torwache_WASMACHSTDU_08_02");	//Эй, хватит нести чушь вроде 'как поживаешь'. Убирайся с глаз моих, понятно?
	};
	AI_StopProcessInfos(self);
};

