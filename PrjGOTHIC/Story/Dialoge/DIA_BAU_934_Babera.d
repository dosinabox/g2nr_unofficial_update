
instance DIA_Babera_EXIT(C_Info)
{
	npc = BAU_934_Babera;
	nr = 999;
	condition = DIA_Babera_EXIT_Condition;
	information = DIA_Babera_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babera_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Babera_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babera_HALLO(C_Info)
{
	npc = BAU_934_Babera;
	nr = 1;
	condition = DIA_Babera_HALLO_Condition;
	information = DIA_Babera_HALLO_Info;
	description = "Привет, красавица.";
};


func int DIA_Babera_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Babera_HALLO_Info()
{
	AI_Output(other,self,"DIA_Babera_HALLO_15_00");	//Привет, красавица.
	AI_Output(self,other,"DIA_Babera_HALLO_16_01");	//Хватит клеиться ко мне. Скажи лучше сразу, что тебе нужно. Я занята.
};


instance DIA_Babera_WIESIEHTSAUS(C_Info)
{
	npc = BAU_934_Babera;
	nr = 2;
	condition = DIA_Babera_WIESIEHTSAUS_Condition;
	information = DIA_Babera_WIESIEHTSAUS_Info;
	description = "Как идет работа в поле?";
};


func int DIA_Babera_WIESIEHTSAUS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babera_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Babera_WIESIEHTSAUS_Info()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_15_00");	//Как идет работа в поле?
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_16_01");	//Посмотри на эти огромные поля, которые нм нужно обработать, и ты сам все поймешь.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_16_02");	//Ты хочешь поработать на поле?
	Info_ClearChoices(DIA_Babera_WIESIEHTSAUS);
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(DIA_Babera_WIESIEHTSAUS,"Вообще-то нет. Я хочу стать наемником.",DIA_Babera_WIESIEHTSAUS_Nein);
		Info_AddChoice(DIA_Babera_WIESIEHTSAUS,"Может быть.",DIA_Babera_WIESIEHTSAUS_Vielleicht);
	};
};

func void DIA_Babera_WIESIEHTSAUS_Vielleicht()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_Vielleicht_15_00");	//Может быть.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_01");	//Тогда тебе лучше поговорить с нашим фермером, Секобом. Может, у него найдется работа для тебя.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_02");	//Ну, или попробуй найти работу на ферме Онара. Она находится в конце этой дороги.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_03");	//Но только будь повежливее с наемниками. Они не любят чужаков.
	Info_ClearChoices(DIA_Babera_WIESIEHTSAUS);
};

func void DIA_Babera_WIESIEHTSAUS_Nein()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_Nein_15_00");	//Вообще-то нет. Я хочу стать наемником.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Nein_16_01");	//Тогда ты зря сюда пришел. Все наемники на ферме Онара.
	Info_ClearChoices(DIA_Babera_WIESIEHTSAUS);
};


instance DIA_Babera_BRONKO(C_Info)
{
	npc = BAU_934_Babera;
	nr = 3;
	condition = DIA_Babera_BRONKO_Condition;
	information = DIA_Babera_BRONKO_Info;
	description = "(спросить о Бронко)";
};


func int DIA_Babera_BRONKO_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bronko_HALLO) && Npc_KnowsInfo(other,DIA_Babera_WIESIEHTSAUS))
	{
		return TRUE;
	};
};

func void DIA_Babera_BRONKO_Info()
{
	AI_Output(other,self,"DIA_Babera_BRONKO_15_00");	//Скажи, вон тот тип, что стоит там...
	AI_Output(self,other,"DIA_Babera_BRONKO_16_01");	//Это Бронко. Зачем он тебе?
	AI_Output(other,self,"DIA_Babera_BRONKO_15_02");	//Это ваш фермер?
	AI_Output(self,other,"DIA_Babera_BRONKO_16_03");	//(смеется) Это он сказал тебе? Наш фермер Секоб. А Бронко просто болтун и бездельник. Но сильный как бык.
	AI_Output(self,other,"DIA_Babera_BRONKO_16_04");	//Вот почему никто не протестует против того, что он не работает.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Babera_BRONKO_16_05");	//Он никого не боится. Только наемников.
	}
	else
	{
		AI_Output(self,other,"DIA_Babera_BRONKO_16_06");	//Только наемники могут заставить его работать. Он очень боится их.
	};
	Babera_BronkoKeinBauer = TRUE;
};


instance DIA_Babera_Rosi(C_Info)
{
	npc = BAU_934_Babera;
	nr = 3;
	condition = DIA_Babera_Rosi_Condition;
	information = DIA_Babera_Rosi_Info;
	description = "А где Рози?";
};


func int DIA_Babera_Rosi_Condition()
{
	if((MIS_bringRosiBackToSekob == LOG_Running) && (Kapitel >= 5) && (RosiFoundKap5 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Babera_Rosi_Info()
{
	AI_Output(other,self,"DIA_Babera_Rosi_15_00");	//А где Рози?
	AI_Output(self,other,"DIA_Babera_Rosi_16_01");	//Она больше не могла выносить такую жизнь и ушла на север, в лес.
	B_LogEntry(TOPIC_RosisFlucht,"Рози сбежала с фермы Секоба. Бабера говорит, что она направилась на север, в лес.");
	B_LogEntry(TOPIC_bringRosiBackToSekob,"Рози сбежала с фермы Секоба. Бабера говорит, что она направилась на север, в лес.");
};


instance DIA_Babera_DUSTOERST(C_Info)
{
	npc = BAU_934_Babera;
	nr = 10;
	condition = DIA_Babera_DUSTOERST_Condition;
	information = DIA_Babera_DUSTOERST_Info;
	permanent = TRUE;
	description = "А кроме этого?";
};


func int DIA_Babera_DUSTOERST_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babera_BRONKO))
	{
		return TRUE;
	};
};

func void DIA_Babera_DUSTOERST_Info()
{
	AI_Output(other,self,"DIA_Babera_DUSTOERST_15_00");	//Есть что-нибудь еще?
	AI_Output(self,other,"DIA_Babera_DUSTOERST_16_01");	//Я занята.
	AI_StopProcessInfos(self);
};


instance DIA_Babera_PICKPOCKET(C_Info)
{
	npc = BAU_934_Babera;
	nr = 900;
	condition = DIA_Babera_PICKPOCKET_Condition;
	information = DIA_Babera_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20_Female;
};


func int DIA_Babera_PICKPOCKET_Condition()
{
	return C_Beklauen(20,30);
};

func void DIA_Babera_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Babera_PICKPOCKET);
	Info_AddChoice(DIA_Babera_PICKPOCKET,Dialog_Back,DIA_Babera_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Babera_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Babera_PICKPOCKET_DoIt);
};

func void DIA_Babera_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Babera_PICKPOCKET);
};

func void DIA_Babera_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Babera_PICKPOCKET);
};

