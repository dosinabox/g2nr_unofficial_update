
instance DIA_Addon_Lucia_EXIT(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 999;
	condition = DIA_Addon_Lucia_EXIT_Condition;
	information = DIA_Addon_Lucia_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Lucia_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lucia_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lucia_Hi(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Hi_Condition;
	information = DIA_Addon_Lucia_Hi_Info;
	permanent = FALSE;
	description = "Как дела?";
};


func int DIA_Addon_Lucia_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lucia_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Hi_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Addon_Lucia_Hi_16_01");	//Послушай. Если тебе нужна еда, спроси у Снафа. А если ты хочешь выпить, то ты обратился к нужному человеку.
};


instance DIA_Addon_Lucia_was(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_was_Condition;
	information = DIA_Addon_Lucia_was_Info;
	permanent = FALSE;
	description = "И что же вы здесь пьете?";
};


func int DIA_Addon_Lucia_was_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_was_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_was_15_00");	//И что же вы здесь пьете?
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_01");	//Ну, пива у нас немного. Пиво на остров привозят только паладины.
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_02");	//И пожалуй, это единственная хорошая вещь, которую они привозят...
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_03");	//Так что обычно мы пьем крепкие напитки. У меня есть самогон, грог и белый ром.
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_04");	//Хм-м... Тебе стоит попробовать вот это. Я взяла рецепт у Сэмюэля. Надо признать, он действительно знает свое дело.
	CreateInvItems(self,ItFo_Addon_Liquor,1);
	B_GiveInvItems(self,other,ItFo_Addon_Liquor,1);
	if(!Npc_KnowsInfo(other,DIA_Addon_Scatty_Trinken))
	{
		Log_CreateTopic(TOPIC_Addon_BDT_Trader,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_BDT_Trader,"У Люсии я могу купить выпивку.");
	};
};


instance DIA_Addon_Lucia_Khorinis(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Khorinis_Condition;
	information = DIA_Addon_Lucia_Khorinis_Info;
	permanent = FALSE;
	description = "Ты из Хориниса, верно?";
};


func int DIA_Addon_Lucia_Khorinis_Condition()
{
	if((MIS_LookingForLucia == LOG_Running) || (LuciaMentionedInKhorinis == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Khorinis_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_00");	//Ты из Хориниса, верно?
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_01");	//Ох, не напоминай. Жизнь у меня там была незавидная.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_02");	//Пока в город приходили корабли с заключенными, там еще можно было как-то прожить.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_03");	//Но потом... (смеется) Нет, спасибо. Может быть, это из-за того, что мы на острове... Ладно, в любом случае, с той жизнью покончено.
	if(MIS_LookingForLucia == LOG_Running)
	{
		B_LogEntry(TOPIC_Addon_Lucia,"Похоже, что Люсия в полном порядке. Она сама ушла к бандитам и довольна своей новой жизнью.");
	};
	MIS_LookingForLucia = LOG_SUCCESS;
	B_CheckLog();
};


instance DIA_Addon_Lucia_SadElvrich(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_SadElvrich_Condition;
	information = DIA_Addon_Lucia_SadElvrich_Info;
	permanent = FALSE;
	description = "А как же Элврих?";
};


func int DIA_Addon_Lucia_SadElvrich_Condition()
{
	if((MIS_LookingForLucia == LOG_SUCCESS) && (MIS_LuciasLetter == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_SadElvrich_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_04_add");	//А как же Элврих?
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_06");	//С Элврихом я порвала!
	AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_04");	//Почему?
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_05");	//Он трус! Когда бандиты утащили меня, он даже не попытался мне помочь.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Lucia_Jetzt(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Jetzt_Condition;
	information = DIA_Addon_Lucia_Jetzt_Info;
	permanent = FALSE;
	description = "Что ты собираешься делать?";
};


func int DIA_Addon_Lucia_Jetzt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_Khorinis))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Jetzt_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Jetzt_15_00");	//Что ты собираешься делать?
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_01");	//Посмотрим. Пока я остаюсь здесь, со Снафом, Фиском и остальными.
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_02");	//Ты уже видел Торуса? О Иннос, вот это мужчина!
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_03");	//(смеется) Извини... давай вернемся к твоему вопросу... Цели у меня пока нет. Просто плыву по течению.
};


instance DIA_Addon_Lucia_Paladine(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Paladine_Condition;
	information = DIA_Addon_Lucia_Paladine_Info;
	permanent = FALSE;
	description = "Ты не очень-то любишь паладинов, верно?";
};


func int DIA_Addon_Lucia_Paladine_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_was))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Paladine_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_15_00");	//Ты не очень-то любишь паладинов, верно?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_01");	//Этих фанатиков-убийц, которым платят маги Огня? Нет, не люблю.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_02");	//Лорд Хаген и его громилы заняли город, и все ползают перед ними на брюхе.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_03");	//А мне это не по душе. Я не собиралась ждать, пока они закроют Красную Лампу и посадят меня за решетку.
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		Info_ClearChoices(DIA_Addon_Lucia_Paladine);
		Info_AddChoice(DIA_Addon_Lucia_Paladine,"(промолчать)",DIA_Addon_Lucia_Paladine_BACK);
		Info_AddChoice(DIA_Addon_Lucia_Paladine,"Но паладины сражаются во имя Инноса, который выбирает своих воинов.",DIA_Addon_Lucia_Paladine_WAHL);
		Info_AddChoice(DIA_Addon_Lucia_Paladine,"Паладины - это воины Инноса. Они не убийцы.",DIA_Addon_Lucia_Paladine_MURDER);
	};
};

func void DIA_Addon_Lucia_Paladine_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_Paladine);
};

func void DIA_Addon_Lucia_Paladine_WAHL()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WAHL_15_00");	//Но паладины сражаются во имя Инноса, который выбирает своих воинов.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_01");	//Я верю, что люди сами выбирают свой путь.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_02");	//А твои слова удивляют меня. Ты говоришь, как один из них.
	Info_AddChoice(DIA_Addon_Lucia_Paladine,"Ты когда-нибудь кого-нибудь убивала?",DIA_Addon_Lucia_Paladine_KILL);
};

func void DIA_Addon_Lucia_Paladine_KILL()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_KILL_15_00");	//Ты когда-нибудь кого-нибудь убивала?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_01");	//Нет, и очень этому рада.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_02");	//Давай прекратим говорить о таких серьезных вещах.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_03");	//Лучше выпьем и будем наслаждаться каждым моментом жизни, данной нам богами.
	Info_ClearChoices(DIA_Addon_Lucia_Paladine);
};

func void DIA_Addon_Lucia_Paladine_WEIB()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WEIB_15_00");	//Ты отвергаешь Инноса, падшая девица?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_01");	//Нет, что ты! Просто некоторые люди злоупотребляют его именем.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_02");	//Но я ни на секунду не сомневалась в божественном великолепии Инноса.
};

func void DIA_Addon_Lucia_Paladine_MURDER()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_MURDER_15_00");	//Паладины - это воины Инноса. Они не убийцы.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_01");	//И что с того? На их мечах кровь - так же, как и на мечах бандитов и пиратов.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_02");	//Единственное отличие в том, что они убивают именем Инноса, потому что хотят выжить.
	Info_AddChoice(DIA_Addon_Lucia_Paladine,"Ты отвергаешь Инноса, падшая девица?",DIA_Addon_Lucia_Paladine_WEIB);
};

func void B_Lucia_SoWhat()
{
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_01_add");	//И что с того?
};

instance DIA_Addon_Lucia_Attentat(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 9;
	condition = DIA_Addon_Lucia_Attentat_Condition;
	information = DIA_Addon_Lucia_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Lucia_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Lucia_Attentat_16_00");	//Ничего.
	Info_ClearChoices(DIA_Addon_Lucia_Attentat);
	Info_AddChoice(DIA_Addon_Lucia_Attentat,"(промолчать)",DIA_Addon_Lucia_Attentat_BACK);
	Info_AddChoice(DIA_Addon_Lucia_Attentat,"Я ищу этих ребят, чтобы выступить против Эстебана.",DIA_Addon_Lucia_Attentat_CONTRA);
	Info_AddChoice(DIA_Addon_Lucia_Attentat,"Я убью этих предателей.",DIA_Addon_Lucia_Attentat_PRO);
};

func void DIA_Addon_Lucia_Attentat_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_Attentat);
};

func void DIA_Addon_Lucia_Attentat_CONTRA()
{
	B_Say(other,self,"$ATTENTAT_ADDON_CONTRA");
	B_Lucia_SoWhat();
	Info_ClearChoices(DIA_Addon_Lucia_Attentat);
};

func void DIA_Addon_Lucia_Attentat_PRO()
{
	B_Say(other,self,"$ATTENTAT_ADDON_PRO");
	B_Lucia_SoWhat();
	Info_ClearChoices(DIA_Addon_Lucia_Attentat);
};

instance DIA_Addon_Lucia_Trade(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 99;
	condition = DIA_Addon_Lucia_Trade_Condition;
	information = DIA_Addon_Lucia_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Дай мне что-нибудь выпить.";
};


func int DIA_Addon_Lucia_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_was))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Trade_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Trade_15_00");	//Дай мне что-нибудь выпить.
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Addon_Lucia_lernen(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 19;
	condition = DIA_Addon_Lucia_lernen_Condition;
	information = DIA_Addon_Lucia_lernen_Info;
	permanent = FALSE;
	description = "Ты можешь меня чему-нибудь обучить?";
};


func int DIA_Addon_Lucia_lernen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_lernen_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_lernen_15_00");	//Ты можешь меня чему-нибудь обучить?
	AI_Output(self,other,"DIA_Addon_Lucia_lernen_16_01");	//(смеется) С радостью. Я могу помочь тебе увеличить ловкость.
	Log_CreateTopic(TOPIC_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_BDT_Teacher,"Люсия может помочь мне стать более ловким.");
};


func void B_BuildLearnDialog_Lucia()
{
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,Dialog_Back,DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,B_BuildLearnAttributeString(ATR_DEXTERITY,1),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,B_BuildLearnAttributeString(ATR_DEXTERITY,5),DIA_Addon_Lucia_TEACH_5);
};

instance DIA_Addon_Lucia_TEACH(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 101;
	condition = DIA_Addon_Lucia_TEACH_Condition;
	information = DIA_Addon_Lucia_TEACH_Info;
	permanent = TRUE;
	description = "Я хочу стать более ловким.";
};


func int DIA_Addon_Lucia_TEACH_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_lernen))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_TEACH_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_TEACH_15_00");	//Я хочу стать более ловким.
	B_BuildLearnDialog_Lucia();
};

func void DIA_Addon_Lucia_TEACH_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
};

func void DIA_Addon_Lucia_TEACH_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED))
	{
		B_BuildLearnDialog_Lucia();
	};
};

func void DIA_Addon_Lucia_TEACH_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED))
	{
		B_BuildLearnDialog_Lucia();
	};
};

