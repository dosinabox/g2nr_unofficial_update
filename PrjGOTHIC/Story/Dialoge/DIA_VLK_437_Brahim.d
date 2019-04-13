
var int Brahim_ShowedMaps;

func void B_BrahimNewMaps()
{
	if(Brahim_ShowedMaps == TRUE)
	{
		AI_Output(self,other,"B_BrahimNewMaps_07_00");	//Заходи попозже. Я уверен, что смогу приготовить что-нибудь интересное для тебя.
	};
};


instance DIA_Brahim_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_EXIT_Condition;
	information = DIA_Brahim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brahim_EXIT_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Brahim_EXIT_Info()
{
	B_BrahimNewMaps();
	AI_StopProcessInfos(self);
};


instance DIA_Brahim_PICKPOCKET(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 900;
	condition = DIA_Brahim_PICKPOCKET_Condition;
	information = DIA_Brahim_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Brahim_PICKPOCKET_Condition()
{
	return C_Beklauen(15,15);
};

func void DIA_Brahim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
	Info_AddChoice(DIA_Brahim_PICKPOCKET,Dialog_Back,DIA_Brahim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brahim_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Brahim_PICKPOCKET_DoIt);
};

func void DIA_Brahim_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
};

func void DIA_Brahim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
};


instance DIA_Brahim_GREET(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 2;
	condition = DIA_Brahim_GREET_Condition;
	information = DIA_Brahim_GREET_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Brahim_GREET_Condition()
{
	return TRUE;
};

func void DIA_Brahim_GREET_Info()
{
	AI_Output(other,self,"DIA_Brahim_GREET_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Brahim_GREET_07_01");	//Меня зовут Ибрагим. Я рисую карты и продаю их.
	AI_Output(self,other,"DIA_Brahim_GREET_07_02");	//Так как ты недавно здесь, возможно, тебе пригодится карта города.
	AI_Output(self,other,"DIA_Brahim_GREET_07_03");	//Это очень недорого и очень полезно, пока ты здесь не освоишься.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Ибрагим рисует карты и продает их в гавани.");
};


instance DIA_Addon_Brahim_MissingPeople(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 5;
	condition = DIA_Addon_Brahim_MissingPeople_Condition;
	information = DIA_Addon_Brahim_MissingPeople_Info;
	description = "А правда, что некоторые жители таинственным образом исчезли? ";
};


func int DIA_Addon_Brahim_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (ENTERED_ADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brahim_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Brahim_MissingPeople_15_00");	//А правда, что некоторые жители таинственным образом исчезли?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_01");	//Я слышал об этом. Но я не уверен, что это правда.
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_02");	//Оглядись вокруг. Неужели ты хочешь провести в этой дыре свои золотые годы?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_03");	//Неудивительно, что люди уезжают отсюда.
};


instance DIA_Brahim_BUY(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 9;
	condition = DIA_Brahim_BUY_Condition;
	information = DIA_Brahim_BUY_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне твои карты.";
};


func int DIA_Brahim_BUY_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Brahim_GREET))
	{
		return TRUE;
	};
};

func void DIA_Brahim_BUY_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Brahim_BUY_15_00");	//Покажи мне твои карты.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_01");	//Ты не найдешь лучше даже в монастыре.
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_02");	//Хорошая карта - это очень важно, особенно для людей, прибывших с материка, мистер Паладин.
	};
	Brahim_ShowedMaps = TRUE;
};


instance DIA_Brahim_Kap3_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_Kap3_EXIT_Condition;
	information = DIA_Brahim_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brahim_Kap3_EXIT_Condition()
{
	if((Kapitel >= 3) && (Npc_KnowsInfo(other,DIA_Brahim_Kap3_First_EXIT) || (Npc_HasItems(other,ItWr_ShatteredGolem_MIS) == 0)))
	{
		return TRUE;
	};
};

func void DIA_Brahim_Kap3_EXIT_Info()
{
	if(Kapitel <= 4)
	{
		B_BrahimNewMaps();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Brahim_Kap3_First_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_Kap3_First_EXIT_Condition;
	information = DIA_Brahim_Kap3_First_EXIT_Info;
	permanent = FALSE;
	description = Dialog_Ende;
};


func int DIA_Brahim_Kap3_First_EXIT_Condition()
{
	if((Kapitel >= 3) && (Npc_HasItems(other,ItWr_ShatteredGolem_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Brahim_Kap3_First_EXIT_Info()
{
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_00");	//Я знал, что этот клочок бумаги заинтересует тебя.
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_15_01");	//Какой клочок?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_02");	//Ну, та старая карта, что ты только что купил.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_03");	//Я знаю таких людей, как ты. Вы используете каждый шанс, чтобы найти сокровища.
	Info_ClearChoices(DIA_Brahim_Kap3_First_EXIT);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,Dialog_Back,DIA_Brahim_Kap3_First_EXIT_BACK);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,"Где ты взял эту карту?",DIA_Brahim_Kap3_First_EXIT_WhereGetIt);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,"Что это за карта?",DIA_Brahim_Kap3_First_EXIT_Content);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,"Почему ты не оставил ее себе?",DIA_Brahim_Kap3_First_EXIT_KeepIt);
};

func void DIA_Brahim_Kap3_First_EXIT_BACK()
{
	Info_ClearChoices(DIA_Brahim_Kap3_First_EXIT);
};

func void DIA_Brahim_Kap3_First_EXIT_WhereGetIt()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_15_00");	//Где ты взял эту карту?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_01");	//Ох, я нашел ее в стопке старых карт, что я купил недавно.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_02");	//Продавец, должно быть, проглядел ее.
};

func void DIA_Brahim_Kap3_First_EXIT_Content()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_Content_15_00");	//Что это за карта?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_01");	//Похоже, это карта сокровищ или что-то вроде.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_02");	//Но, похоже, ты из тех, кто способен выяснить это самостоятельно.
};

func void DIA_Brahim_Kap3_First_EXIT_KeepIt()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00");	//Почему ты не оставил ее себе?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_01");	//Я старый человек, и времена, когда я сам искал сокровища, давно прошли.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_02");	//Пусть этим занимаются те, кто помоложе.
};

