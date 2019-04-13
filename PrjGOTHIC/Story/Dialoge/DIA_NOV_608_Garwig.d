
instance DIA_Garwig_EXIT(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 999;
	condition = DIA_Garwig_EXIT_Condition;
	information = DIA_Garwig_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garwig_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Garwig_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Garwig_Wurst(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 3;
	condition = DIA_Garwig_Wurst_Condition;
	information = DIA_Garwig_Wurst_Info;
	permanent = FALSE;
	description = "Хочешь колбасы?";
};


func int DIA_Garwig_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Garwig_Wurst_15_00");	//Хочешь колбасы?
	AI_Output(self,other,"DIA_Garwig_Wurst_06_01");	//Ах, как вкусно. Огромное спасибо тебе, брат.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft,PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
};


instance DIA_Garwig_Hello(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 3;
	condition = DIA_Garwig_Hello_Condition;
	information = DIA_Garwig_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Garwig_Hello_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Garwig_Hello_Info()
{
	AI_Output(self,other,"DIA_Garwig_Hello_06_00");	//Да пребудет с тобой Иннос, я никогда не видел тебя раньше. Ты новенький здесь?
	AI_Output(other,self,"DIA_Garwig_Hello_15_01");	//Да, я только что стал послушником.
	AI_Output(self,other,"DIA_Garwig_Hello_06_02");	//Тогда я желаю тебе освоиться здесь побыстрее. Дай мне знать, если тебе понадобится помощь.
};


instance DIA_Garwig_Room(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 5;
	condition = DIA_Garwig_Room_Condition;
	information = DIA_Garwig_Room_Info;
	permanent = FALSE;
	description = "Что это за комната?";
};


func int DIA_Garwig_Room_Condition()
{
	return TRUE;
};

func void DIA_Garwig_Room_Info()
{
	AI_Output(other,self,"DIA_Garwig_Room_15_00");	//Что это за комната?
	AI_Output(self,other,"DIA_Garwig_Room_06_01");	//Здесь хранятся священные реликвии монастыря.
	AI_Output(other,self,"DIA_Garwig_Room_15_02");	//Какие реликвии?
	AI_Output(self,other,"DIA_Garwig_Room_06_03");	//Здесь покоится Молот Инноса, а также Щит Огня. Это самые важные реликвии Церкви Инноса здесь, вдали от столицы королевства.
};


instance DIA_Garwig_Hammer(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 99;
	condition = DIA_Garwig_Hammer_Condition;
	information = DIA_Garwig_Hammer_Info;
	permanent = TRUE;
	description = "Расскажи мне об этом молоте.";
};


func int DIA_Garwig_Hammer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garwig_Room))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Hammer_Info()
{
	AI_Output(other,self,"DIA_Garwig_Hammer_15_00");	//Расскажи мне об этом молоте.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_01");	//Это священный Молот Инноса. Этим молотом святой Робар поразил Каменного Часового.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_02");	//В священных писаниях говорится, что Каменный часовой был неуязвим. Он возвышался над полем боя, как башня, и оружие его врагов разбивалось о его каменную кожу.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_03");	//С именем Инноса на устах, Робар бросился на этого монстра и поразил его одним могучим ударом своего молота.
};


instance DIA_Garwig_Shield(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 98;
	condition = DIA_Garwig_Shield_Condition;
	information = DIA_Garwig_Shield_Info;
	permanent = FALSE;
	description = "Расскажи мне об этом щите.";
};


func int DIA_Garwig_Shield_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garwig_Room))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Shield_Info()
{
	AI_Output(other,self,"DIA_Garwig_Shield_15_00");	//Расскажи мне об этом щите.
	AI_Output(self,other,"DIA_Garwig_Shield_06_01");	//Щит Огня принадлежал Доминику в битве на Южных островах.
	AI_Output(self,other,"DIA_Garwig_Shield_06_02");	//Но сила этого щита не должна  больше использоваться - поэтому, мы прибили его на стене.
};


instance DIA_Garwig_Auge(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 4;
	condition = DIA_Garwig_Auge_Condition;
	information = DIA_Garwig_Auge_Info;
	permanent = FALSE;
	description = "А Глаз Инноса тоже храниться здесь?";
};


func int DIA_Garwig_Auge_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garwig_Room) && (Kapitel <= 2))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Auge_Info()
{
	AI_Output(other,self,"DIA_Garwig_Auge_15_00");	//А Глаз Инноса тоже храниться здесь?
	AI_Output(self,other,"DIA_Garwig_Auge_06_01");	//Конечно нет. Что за странная мысль. Никто не знает, где хранится этот божественный артефакт.
};


instance DIA_Garwig_SLEEP(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 23;
	condition = DIA_Garwig_SLEEP_Condition;
	information = DIA_Garwig_SLEEP_Info;
	permanent = TRUE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Garwig_SLEEP_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Garwig_SLEEP_Info()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Garwig_SLEEP_06_01");	//Я страж священных артефактов.
	Info_ClearChoices(DIA_Garwig_SLEEP);
	Info_AddChoice(DIA_Garwig_SLEEP,Dialog_Back,DIA_Garwig_SLEEP_BACK);
	Info_AddChoice(DIA_Garwig_SLEEP,"Что если я сменю тебя ненадолго?",DIA_Garwig_SLEEP_EXCHANGE);
	Info_AddChoice(DIA_Garwig_SLEEP,"Почему эти артефакты охраняются?",DIA_Garwig_SLEEP_THIEF);
	Info_AddChoice(DIA_Garwig_SLEEP,"Ты когда-нибудь спишь?",DIA_Garwig_SLEEP_NEVER);
};

func void DIA_Garwig_SLEEP_BACK()
{
	Info_ClearChoices(DIA_Garwig_SLEEP);
};

func void DIA_Garwig_SLEEP_EXCHANGE()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_EXCHANGE_15_00");	//Что если я сменю тебя ненадолго?
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_01");	//Это испытание? Маги послали тебя испытать меня, правильно? Оох, я знал это!
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_02");	//Но я пройду это испытание. Скажи своим магам, что я был непоколебимым как скала и что я буду сопротивляться всем искушениям. Что я хороший страж.
};

func void DIA_Garwig_SLEEP_THIEF()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_THIEF_15_00");	//Почему эти артефакты охраняются? Есть причины полагать, что они могут быть украдены?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_01");	//Что за бредовая мысль. С чего ты это взял?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_02");	//Только те, кто служит Инносу, могут входить в монастырь. И ни у кого из истинных верующих такая мысль даже появиться не может.
};

func void DIA_Garwig_SLEEP_NEVER()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_NEVER_15_00");	//Ты когда-нибудь спишь?
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_01");	//Что за необычное замечание. Конечно же, я никогда не сплю. Сам Иннос дарует мне силы обходиться без сна.
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_02");	//Как же иначе мог бы я выполнять священные обязанности стража?
	Info_ClearChoices(DIA_Garwig_SLEEP);
	Info_AddChoice(DIA_Garwig_SLEEP,"Ты действительно НИКОГДА не спишь?",DIA_Garwig_SLEEP_AGAIN);
};

func void DIA_Garwig_SLEEP_AGAIN()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_AGAIN_15_00");	//Ты действительно НИКОГДА не спишь?
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_01");	//Нет. Если страж заснет, он провалит свое испытание.
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_02");	//Но я не провалюсь, ведь Иннос дает мне силы и выносливость, и я никогда не устаю.
};


instance DIA_Garwig_THIEF(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 2;
	condition = DIA_Garwig_THIEF_Condition;
	information = DIA_Garwig_THIEF_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Garwig_THIEF_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_HasItems(hero,Holy_Hammer_MIS) == 1))
	{
		return TRUE;
	};
};

func void DIA_Garwig_THIEF_Info()
{
	if(Hammer_Taken == TRUE)
	{
		AI_Output(self,other,"DIA_Garwig_THIEF_06_00");	//(разочаровано) Вор! Ты опозорил не только себя и меня, но и весь монастырь!
		AI_Output(self,other,"DIA_Garwig_THIEF_06_01");	//Ты поплатишься за это святотатство. И, заклинаю Инносом - ВЕРНИ МНЕ ЭТОТ МОЛОТ!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_THIEF_06_02");	//(в отчаянии) Молот исчез! Как это могло произойти?
		AI_Output(self,other,"DIA_Garwig_THIEF_06_03");	//Я провалил испытание. Иннос накажет меня!
	};
};


instance DIA_Garwig_Abgeben(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 2;
	condition = DIA_Garwig_Abgeben_Condition;
	information = DIA_Garwig_Abgeben_Info;
	permanent = TRUE;
	description = "Я принес молот назад.";
};


func int DIA_Garwig_Abgeben_Condition()
{
	if(Npc_HasItems(other,Holy_Hammer_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Garwig_Abgeben_Info()
{
	AI_Output(other,self,"DIA_Garwig_Abgeben_15_00");	//Я принес молот назад.
	if(Hammer_Taken == TRUE)
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_01");	//Ах ты подлый вор!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_02");	//Так это ты взял его...
	};
	AI_Output(self,other,"DIA_Garwig_Abgeben_06_03");	//Но я не вправе судить тебя. Пусть Иннос осудит тебя, и ты понесешь заслуженную кару!
	B_GiveInvItems(other,self,Holy_Hammer_MIS,1);
	Hammer_Taken = FALSE;
};


instance DIA_Garwig_PICKPOCKET(C_Info)
{
	npc = Nov_608_Garwig;
	nr = 900;
	condition = DIA_Garwig_PICKPOCKET_Condition;
	information = DIA_Garwig_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Garwig_PICKPOCKET_Condition()
{
	return C_Beklauen(52,80);
};

func void DIA_Garwig_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Garwig_PICKPOCKET);
	Info_AddChoice(DIA_Garwig_PICKPOCKET,Dialog_Back,DIA_Garwig_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Garwig_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Garwig_PICKPOCKET_DoIt);
};

func void DIA_Garwig_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Garwig_PICKPOCKET);
};

func void DIA_Garwig_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Garwig_PICKPOCKET);
};

