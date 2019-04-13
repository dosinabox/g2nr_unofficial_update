
instance DIA_Khaled_EXIT(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 999;
	condition = DIA_Khaled_EXIT_Condition;
	information = DIA_Khaled_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Khaled_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Khaled_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Khaled_weiter;

instance DIA_Khaled_Hallo(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 1;
	condition = DIA_Khaled_Hallo_Condition;
	information = DIA_Khaled_Hallo_Info;
	permanent = TRUE;
	description = "С тобой все в порядке?";
};


func int DIA_Khaled_Hallo_Condition()
{
	if(Khaled_weiter == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_Hallo_Info()
{
	AI_Output(other,self,"DIA_Khaled_Hallo_15_00");	//С тобой все в порядке?
	if(Npc_KnowsInfo(other,DIA_Lee_WannaJoin))
	{
		AI_Output(self,other,"DIA_Khaled_Hallo_11_01");	//Хм - так ты хочешь присоединиться к нам, да? А у тебя есть хотя бы приличное оружие?
		Khaled_weiter = TRUE;
		Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry(Topic_SoldierTrader,"Халед - торговец оружием.");
	}
	else
	{
		AI_Output(self,other,"DIA_Khaled_Hallo_11_02");	//Если у тебя что-то важное, поговори с Ли. А меня оставь в покое.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Khaled_TRADE(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 700;
	condition = DIA_Khaled_TRADE_Condition;
	information = DIA_Khaled_TRADE_Info;
	permanent = TRUE;
	description = "Какое оружие ты можешь предложить мне?";
	trade = TRUE;
};


func int DIA_Khaled_TRADE_Condition()
{
	if(Khaled_weiter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_TRADE_Info()
{
	AI_Output(other,self,"DIA_Khaled_TRADE_15_00");	//Какое оружие ты можешь предложить мне?
	B_GiveTradeInv(self);
	AI_Output(self,other,"DIA_Khaled_TRADE_11_01");	//Только лучшее. Да ты сам взгляни на него.
};


instance DIA_Khaled_WannaJoin(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 10;
	condition = DIA_Khaled_WannaJoin_Condition;
	information = DIA_Khaled_WannaJoin_Info;
	permanent = TRUE;
	description = "Ты не возражаешь, если я присоединюсь к вам?";
};


func int DIA_Khaled_WannaJoin_Condition()
{
	if((Khaled_weiter == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Khaled_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Khaled_WannaJoin_15_00");	//Ты не возражаешь, если я присоединюсь к вам?
	AI_Output(self,other,"DIA_Khaled_WannaJoin_11_01");	//Когда ты пройдешь испытание, я проголосую за тебя.
	if((MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS) || (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Khaled_WannaJoin_15_02");	//Я его уже прошел.
		AI_Output(self,other,"DIA_Khaled_WannaJoin_11_03");	//Ну, тогда все в порядке.
	};
};


instance DIA_Khaled_Woher(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 3;
	condition = DIA_Khaled_Woher_Condition;
	information = DIA_Khaled_Woher_Info;
	permanent = FALSE;
	description = "Как ты оказался среди наемников?";
};


func int DIA_Khaled_Woher_Condition()
{
	if(Khaled_weiter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_Woher_Info()
{
	AI_Output(other,self,"DIA_Khaled_Woher_15_00");	//Как ты оказался среди наемников?
	AI_Output(self,other,"DIA_Khaled_Woher_11_01");	//Я пришел вместе с Сильвио с юга. Мы состояли в армии наемников, которая сражалась с орками.
};


instance DIA_Khaled_AboutSylvio(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 4;
	condition = DIA_Khaled_AboutSylvio_Condition;
	information = DIA_Khaled_AboutSylvio_Info;
	permanent = FALSE;
	description = "Что ты думаешь о Сильвио?";
};


func int DIA_Khaled_AboutSylvio_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Khaled_Woher))
	{
		return TRUE;
	};
};

func void DIA_Khaled_AboutSylvio_Info()
{
	AI_Output(other,self,"DIA_Khaled_AboutSylvio_15_00");	//Что ты думаешь о Сильвио?
	AI_Output(self,other,"DIA_Khaled_AboutSylvio_11_01");	//Это опасный тип! И многие наемники, что пришли с ним, прислушиваются к его мнению. Тебе лучше не связываться с ним.
};


instance DIA_Khaled_AboutLee(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 5;
	condition = DIA_Khaled_AboutLee_Condition;
	information = DIA_Khaled_AboutLee_Info;
	permanent = FALSE;
	description = "Что ты думаешь о Ли?";
};


func int DIA_Khaled_AboutLee_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Khaled_Woher))
	{
		return TRUE;
	};
};

func void DIA_Khaled_AboutLee_Info()
{
	AI_Output(other,self,"DIA_Khaled_AboutLee_15_00");	//Что ты думаешь о Ли?
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_01");	//Я думаю, единственное, что по-настоящему интересует Ли - как убраться с этого острова.
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_02");	//Он хочет добраться до материка. Похоже, у него там счеты с кем-то...
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_03");	//Но, как бы то ни было, он значительно лучше справляется со своей работой, чем на это способен Сильвио.
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_04");	//Кроме того, он хороший лидер. Большую часть времени мы можем делать здесь что хотим.
};


instance DIA_Khaled_PICKPOCKET(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 900;
	condition = DIA_Khaled_PICKPOCKET_Condition;
	information = DIA_Khaled_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Khaled_PICKPOCKET_Condition()
{
	return C_Beklauen(78,85);
};

func void DIA_Khaled_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Khaled_PICKPOCKET);
	Info_AddChoice(DIA_Khaled_PICKPOCKET,Dialog_Back,DIA_Khaled_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Khaled_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Khaled_PICKPOCKET_DoIt);
};

func void DIA_Khaled_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Khaled_PICKPOCKET);
};

func void DIA_Khaled_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Khaled_PICKPOCKET);
};

