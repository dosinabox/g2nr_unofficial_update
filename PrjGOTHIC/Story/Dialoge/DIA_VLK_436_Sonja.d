
instance DIA_Sonja_EXIT(C_Info)
{
	npc = VLK_436_Sonja;
	nr = 999;
	condition = DIA_Sonja_EXIT_Condition;
	information = DIA_Sonja_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sonja_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sonja_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sonja_STANDARD(C_Info)
{
	npc = VLK_436_Sonja;
	condition = DIA_Sonja_STANDARD_Condition;
	information = DIA_Sonja_STANDARD_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Sonja_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Sonja_STANDARD_Info()
{
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Sonja_STANDARD_16_00");	//Если хочешь развлечься, поговори с Бромором.
	}
	else if((other.guild == GIL_DJG) && (Sonja_Says == FALSE))
	{
		AI_Output(self,other,"DIA_Sonja_STANDARD_16_01");	//У таких парней, как ты, одна проблема - вас больше интересуют орки, чем мы.
		Sonja_Says = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sonja_STANDARD_16_02");	//Если ты хочешь поговорить, иди, найди себе женщину, и женись на ней.
	};
	if((MIS_Andre_REDLIGHT != LOG_Running) || (Knows_Borka_Dealer == TRUE))
	{
		AI_StopProcessInfos_Pickpocket(58);
	};
};

instance DIA_Sonja_WEED(C_Info)
{
	npc = VLK_436_Sonja;
	nr = 2;
	condition = DIA_Sonja_WEED_Condition;
	information = DIA_Sonja_WEED_Info;
	permanent = TRUE;
	description = "Ты не знаешь, где мне купить травки?";
};


func int DIA_Sonja_WEED_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Knows_Borka_Dealer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sonja_WEED_Info()
{
	AI_Output(other,self,"DIA_Meldor_Smoke_15_00");	//Ты не знаешь, где мне купить травки?
	AI_Output(self,other,"DIA_Babera_DUSTOERST_16_01");	//Я занята.
	AI_StopProcessInfos(self);
};

