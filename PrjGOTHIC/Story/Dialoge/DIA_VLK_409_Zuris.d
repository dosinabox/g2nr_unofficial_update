
instance DIA_Zuris_EXIT(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 999;
	condition = DIA_Zuris_EXIT_Condition;
	information = DIA_Zuris_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Zuris_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Zuris_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Zuris_PICKPOCKET(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 900;
	condition = DIA_Zuris_PICKPOCKET_Condition;
	information = DIA_Zuris_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Его зелье будет украсть легко)";
};


func int DIA_Zuris_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Zuris_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Zuris_PICKPOCKET);
	Info_AddChoice(DIA_Zuris_PICKPOCKET,Dialog_Back,DIA_Zuris_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Zuris_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Zuris_PICKPOCKET_DoIt);
};

func void DIA_Zuris_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		CreateInvItems(self,ItPo_Health_03,1);
		B_GiveInvItems(self,other,ItPo_Health_03,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Zuris_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Zuris_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Zuris_PICKPOCKET);
};


instance DIA_Zuris_Sperre(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Sperre_Condition;
	information = DIA_Zuris_Sperre_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Zuris_Sperre_Condition()
{
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Sperre_Info()
{
	AI_Output(self,other,"DIA_Zuris_Sperre_14_00");	//Ты заключенный, сбежавший из горнодобывающей колонии. Проваливай!
	AI_StopProcessInfos(self);
};


instance DIA_Zuris_GREET(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_GREET_Condition;
	information = DIA_Zuris_GREET_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Zuris_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Sperre == FALSE) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Zuris_GREET_Info()
{
	AI_Output(self,other,"DIA_Zuris_GREET_14_00");	//Я Зурис, специалист по зельям.
	AI_Output(self,other,"DIA_Zuris_GREET_14_01");	//Тебе нужна лечебная эссенция или магический эликсир? Тогда ты обратился по адресу.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Зурис торгует зельями на рыночной площади.");
};


var int Zuris_einmal;

instance DIA_Zuris_WAREZ(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_WAREZ_Condition;
	information = DIA_Zuris_WAREZ_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свои товары.";
};


func int DIA_Zuris_WAREZ_Condition()
{
	return TRUE;
};

func void DIA_Zuris_WAREZ_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Zuris_WAREZ_15_00");	//Покажи мне свои товары.
	if((Zuris_einmal == FALSE) && !Npc_KnowsInfo(other,DIA_Zuris_Potions))
	{
		AI_Output(self,other,"DIA_Zuris_GREET_14_02");	//Я только что получил несколько новых зелий. Мой гость, Мастер Дарон, Маг Огня, принес мне их из монастыря.
		Zuris_einmal = TRUE;
	};
};


instance DIA_Zuris_Potions(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_POTIONS_Condition;
	information = DIA_Zuris_POTIONS_Info;
	permanent = FALSE;
	description = "Ты сам готовишь свои зелья?";
};


func int DIA_Zuris_POTIONS_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Zuris_GREET))
	{
		return TRUE;
	};
};

func void DIA_Zuris_POTIONS_Info()
{
	AI_Output(other,self,"DIA_Zuris_POTIONS_15_00");	//Ты сам готовишь свои зелья?
	AI_Output(self,other,"DIA_Zuris_POTIONS_14_01");	//Нет, я получаю их из монастыря или покупаю у Константино, алхимика.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Zuris_POTIONS_14_02");	//Если тебя интересуют рецепты приготовления зелий, тебе нужно поговорить с ним. Ему как раз нужен помощник.
		AI_Output(self,other,"DIA_Zuris_POTIONS_14_03");	//Но он слишком туп, чтобы нанять кого-нибудь самому. И к тому же, упрям как мул.
	};
	AI_Output(self,other,"DIA_Zuris_Add_14_00");	//Он всегда проходит мимо меня, когда выходит через восточные ворота собирать растения для своих зелий.
};


instance DIA_Zuris_Kraut(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Kraut_Condition;
	information = DIA_Zuris_Kraut_Info;
	permanent = FALSE;
	description = "А где именно Константино собирает травы?";
};


func int DIA_Zuris_Kraut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Zuris_Potions))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Kraut_Info()
{
	AI_Output(other,self,"DIA_Zuris_Add_15_01");	//А где именно Константино собирает травы?
	AI_Output(self,other,"DIA_Zuris_Add_14_02");	//Он всегда выходит через восточные ворота города, а затем исчезает в лесу налево.
	AI_Output(self,other,"DIA_Zuris_Add_14_03");	//Он как-то сказал мне, что почти все, что ему нужно, растет там, за исключением царского щавеля.
	Wld_InsertItem(ItPl_Mana_Herb_01,"FP_ITEM_HERB_01");
	Wld_InsertItem(ItPl_Mana_Herb_02,"FP_ITEM_HERB_02");
	Wld_InsertItem(ItPl_Mana_Herb_03,"FP_ITEM_HERB_03");
	Wld_InsertItem(ItPl_Health_Herb_01,"FP_ITEM_HERB_04");
	Wld_InsertItem(ItPl_Health_Herb_02,"FP_ITEM_HERB_05");
	Wld_InsertItem(ItPl_Health_Herb_03,"FP_ITEM_HERB_06");
	Wld_InsertItem(ItPl_Speed_Herb_01,"FP_ITEM_HERB_07");
	Wld_InsertItem(ItPl_Temp_Herb,"FP_ITEM_HERB_08");
	Wld_InsertItem(ItPl_Strength_Herb_01,"FP_ITEM_HERB_09");
	Wld_InsertItem(ItPl_Dex_Herb_01,"FP_ITEM_HERB_10");
};


instance DIA_Zuris_Kronstoeckel(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Kronstoeckel_Condition;
	information = DIA_Zuris_Kronstoeckel_Info;
	permanent = FALSE;
	description = "Константино говорил тебе, где можно найти царский щавель?";
};


func int DIA_Zuris_Kronstoeckel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Zuris_Kraut))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Kronstoeckel_Info()
{
	AI_Output(other,self,"DIA_Zuris_Add_15_04");	//Константино говорил тебе, где можно найти царский щавель?
	AI_Output(self,other,"DIA_Zuris_Add_14_05");	//Он как-то упоминал, что он растет около каменных кругов.
	AI_Output(self,other,"DIA_Zuris_Add_14_06");	//Около фермы Лобарта, эта ферма находится неподалеку от других ворот, есть один из таких каменных кругов.
	AI_Output(self,other,"DIA_Zuris_Add_14_07");	//Насколько я помню, он стоит на холме. Там когда-то была могила, или что-то вроде этого.
	Wld_InsertItem(ItPl_Perm_Herb,"FP_ITEM_HERB_11");
};


instance DIA_Zuris_WHERE(C_Info)
{
	npc = VLK_409_Zuris;
	condition = DIA_Zuris_WHERE_Condition;
	information = DIA_Zuris_WHERE_Info;
	permanent = FALSE;
	description = "Где я могу найти Константино?";
};


func int DIA_Zuris_WHERE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Zuris_Potions) && (Constantino.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Zuris_WHERE_Info()
{
	AI_Output(other,self,"DIA_Zuris_WHERE_15_00");	//Где я могу найти Константино?
	AI_Output(self,other,"DIA_Zuris_WHERE_14_01");	//Его дом находится в туннеле около кузницы Гарада. Его будет нетрудно найти.
};


instance DIA_Zuris_Kloster(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Kloster_Condition;
	information = DIA_Zuris_Kloster_Info;
	description = "Расскажи мне о монастыре.";
};


func int DIA_Zuris_Kloster_Condition()
{
	if(Zuris_einmal == TRUE)
	{
		return FALSE;
	};
};

func void DIA_Zuris_Kloster_Info()
{
	AI_Output(other,self,"DIA_Zuris_Kloster_14_00");	//Расскажи мне о монастыре.
	AI_Output(self,other,"DIA_Zuris_Kloster_14_01");	//Тебе лучше поговорить об этом с самим Мастером Дароном. Он знает больше меня.
};


instance DIA_Zuris_Minenanteil(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 3;
	condition = DIA_Zuris_Minenanteil_Condition;
	information = DIA_Zuris_Minenanteil_Info;
	description = "Ты продаешь шахтерские акции?";
};


func int DIA_Zuris_Minenanteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Zuris_Minenanteil_15_00");	//Ты продаешь шахтерские акции?
	AI_Output(self,other,"DIA_Zuris_Minenanteil_14_01");	//Да. Это оказалось не самое выгодное дело. Это последний раз, когда я ввязываюсь в подобное сомнительное предприятие!
	B_GivePlayerXP(XP_Ambient);
};

