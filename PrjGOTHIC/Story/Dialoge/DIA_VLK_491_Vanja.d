
instance DIA_Vanja_EXIT(C_Info)
{
	npc = VLK_491_Vanja;
	nr = 999;
	condition = DIA_Vanja_EXIT_Condition;
	information = DIA_Vanja_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vanja_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Vanja_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Vanja_STANDARD(C_Info)
{
	npc = VLK_491_Vanja;
	condition = DIA_Vanja_STANDARD_Condition;
	information = DIA_Vanja_STANDARD_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Vanja_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Vanja_STANDARD_Info()
{
	AI_Output(self,other,"DIA_Vanja_STANDARD_17_00");	//Я занята.
	if((MIS_Andre_REDLIGHT != LOG_Running) || (Knows_Borka_Dealer == TRUE))
	{
		AI_StopProcessInfos_Pickpocket(20);
	};
};


instance DIA_Vanja_DOPE(C_Info)
{
	npc = VLK_491_Vanja;
	nr = 3;
	condition = DIA_Vanja_DOPE_Condition;
	information = DIA_Vanja_DOPE_Info;
	permanent = FALSE;
	description = "Где здесь можно купить травки?";
};


func int DIA_Vanja_DOPE_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Knows_Borka_Dealer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vanja_DOPE_Info()
{
	AI_Output(other,self,"DIA_Vanja_DOPE_15_00");	//Где здесь можно купить травки?
	AI_Output(self,other,"DIA_Vanja_DOPE_17_01");	//Понятия не имею. Лучше не связывайся с этой дрянью.
	if(C_LawArmorEquipped(other))
	{
		AI_Output(self,other,"DIA_Vanja_DOPE_17_02");	//К тому же, если ты будешь продолжать расспрашивать о ней, у тебя могут быть большие проблемы...
	};
};

