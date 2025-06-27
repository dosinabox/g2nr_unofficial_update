
var int Brahim_ToldAboutOldMap;

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
	return TRUE;
};

func void DIA_Brahim_EXIT_Info()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && Npc_HasItems(other,ItWr_ShatteredGolem_MIS) && (Brahim_ToldAboutOldMap == FALSE))
	{
		AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_00");	//Я знал, что этот клочок бумаги заинтересует тебя.
		AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_15_01");	//Какой клочок?
		AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_02");	//Ну, та старая карта, что ты только что купил.
		AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_03");	//Я знаю таких людей, как ты. Вы используете каждый шанс, чтобы найти сокровища.
		Brahim_ToldAboutOldMap = TRUE;
		Info_ClearChoices(DIA_Brahim_EXIT);
		Info_AddChoice(DIA_Brahim_EXIT,Dialog_Back,DIA_Brahim_EXIT_BACK);
		Info_AddChoice(DIA_Brahim_EXIT,"Где ты взял эту карту?",DIA_Brahim_EXIT_WhereGetIt);
		Info_AddChoice(DIA_Brahim_EXIT,"Что это за карта?",DIA_Brahim_EXIT_Content);
		Info_AddChoice(DIA_Brahim_EXIT,"Почему ты не оставил ее себе?",DIA_Brahim_EXIT_KeepIt);
	}
	else
	{
		if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && (Brahim_ItemsGiven_Chapter_1 == TRUE) && (Brahim_ItemsGiven_Chapter_4 == FALSE))
		{
			AI_Output(self,other,"B_BrahimNewMaps_07_00");	//Заходи попозже. Я уверен, что смогу приготовить что-нибудь интересное для тебя.
		};
		B_EquipTrader(self);
		AI_StopProcessInfos(self);
	};
};

func void DIA_Brahim_EXIT_BACK()
{
	Info_ClearChoices(DIA_Brahim_EXIT);
};

func void DIA_Brahim_EXIT_WhereGetIt()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_15_00");	//Где ты взял эту карту?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_01");	//Ох, я нашел ее в стопке старых карт, что я купил недавно.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_02");	//Продавец, должно быть, проглядел ее.
};

func void DIA_Brahim_EXIT_Content()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_Content_15_00");	//Что это за карта?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_01");	//Похоже, это карта сокровищ или что-то вроде.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_02");	//Но, похоже, ты из тех, кто способен выяснить это самостоятельно.
};

func void DIA_Brahim_EXIT_KeepIt()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00");	//Почему ты не оставил ее себе?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_01");	//Я старый человек, и времена, когда я сам искал сокровища, давно прошли.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_02");	//Пусть этим занимаются те, кто помоложе.
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
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Brahim_GREET_07_02");	//Так как ты недавно здесь, возможно, тебе пригодится карта города.
		AI_Output(self,other,"DIA_Brahim_GREET_07_03");	//Это очень недорого и очень полезно, пока ты здесь не освоишься.
	};
	if(Brahim_Trade == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Ибрагим рисует карты и продает их в гавани.");
		Brahim_Trade = TRUE;
	};
};


instance DIA_Addon_Brahim_MissingPeople(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 5;
	condition = DIA_Addon_Brahim_MissingPeople_Condition;
	information = DIA_Addon_Brahim_MissingPeople_Info;
	description = "А правда, что некоторые жители таинственным образом исчезли?";
};


func int DIA_Addon_Brahim_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE))
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
	description = "Покажи мне свои карты.";
};


func int DIA_Brahim_BUY_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brahim_GREET))
	{
		return TRUE;
	};
};

func void DIA_Brahim_BUY_Info()
{
	AI_Output(other,self,"DIA_Brahim_BUY_15_00");	//Покажи мне свои карты.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_01");	//Ты не найдешь лучше даже в монастыре.
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_02");	//Хорошая карта - это очень важно, особенно для людей, прибывших с материка, мистер паладин.
	};
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};

