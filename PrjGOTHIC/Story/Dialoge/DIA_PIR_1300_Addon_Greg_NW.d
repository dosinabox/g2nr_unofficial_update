
instance DIA_Addon_Greg_NW_EXIT(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 999;
	condition = DIA_Addon_Greg_NW_EXIT_Condition;
	information = DIA_Addon_Greg_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Greg_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
	PlayerTalkedToGregNW = TRUE;
};


instance DIA_Addon_Greg_NW_Hallo(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_Hallo_Condition;
	information = DIA_Addon_Greg_NW_Hallo_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_Hallo_Condition()
{
	if(GregLocation == Greg_Farm1)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_00");	//Пст! Эй, ты! Подойди-ка сюда.
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_15_01");	//В чем дело?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_02");	//Ты идешь в город? У тебя там дела?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_03");	//Послушай, ты выглядишь сообразительным парнем. Уверен, ты в жизни далеко пойдешь.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_04");	//Ты не дурак, я вижу это по твоим глазам.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_05");	//Наверняка ты хочешь заработать пригоршню золотых монет, не так ли?
	PlayerTalkedToGregNW = TRUE;
	SC_MeetsGregTime = 1;
	Info_ClearChoices(DIA_Addon_Greg_NW_Hallo);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"Я должен идти.",DIA_Addon_Greg_NW_Hallo_weg);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"Довольно болтать. Говори, чего ты хочешь.",DIA_Addon_Greg_NW_Hallo_schleim);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"Не похоже, чтобы у тебя водились деньги.",DIA_Addon_Greg_NW_Hallo_vorsicht);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"Ты от кого-то прячешься?",DIA_Addon_Greg_NW_Hallo_hide);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo,"Почему бы и нет?",DIA_Addon_Greg_NW_Hallo_ja);
};

func void DIA_Addon_Greg_NW_Hallo_weg()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_weg_15_00");	//Мне надо идти.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_weg_01_01");	//Итак, ты отказываешься мне помогать, верно? Хорошо, я это запомню. Мы еще встретимся!
	AI_StopProcessInfos(self);
	MIS_Addon_Greg_BringMeToTheCity = LOG_FAILED;
};

func void DIA_Addon_Greg_NW_Hallo_ja()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_ja_15_00");	//Почему бы и нет?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_01");	//Ты должен простить невежественного старого моряка! Я чужой в ваших краях и не знаю местных законов.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_02");	//Поэтому мне пришлось на своей шкуре испытать, как стражники встречают в этом городе простых путников.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_03");	//И вот теперь мне нужно попасть в город, а я не знаю, как это сделать.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_04");	//В городе у меня чрезвычайно важное дело. Мой клиент не потерпит задержки даже на день!
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_05");	//Ты же поможешь мне пройти мимо стражников, правда?
	Info_ClearChoices(DIA_Addon_Greg_NW_Hallo);
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW,"Странный человек с повязкой на глазу хочет, чтобы я помог ему попасть в город. Я должен найти для него способ пройти мимо стражников.");
	MIS_Addon_Greg_BringMeToTheCity = LOG_Running;
};

func void DIA_Addon_Greg_NW_Hallo_vorsicht()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_vorsicht_15_00");	//Не похоже, чтобы у тебя водились деньги.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_01");	//Ну, конечно, я не вращаюсь, подобно тебе, в высших кругах общества.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_02");	//Но ты же не откажешься увеличить свое состояние на небольшую сумму, которую я мог бы тебе дать?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_03");	//Ну, что скажешь? Я могу на тебя рассчитывать?
};

func void DIA_Addon_Greg_NW_Hallo_schleim()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_schleim_15_00");	//Довольно болтать. Говори, чего ты хочешь.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_01");	//Вот видишь, это именно то, что я имею в виду.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_02");	//Одни красивые слова никуда тебя не приведут.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_03");	//Я знал, что имею дело с настоящим деловым человеком.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_04");	//И уж наверняка этот деловой человек не откажется от небольшого вознаграждения?
};

func void DIA_Addon_Greg_NW_Hallo_hide()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_hide_15_00");	//Ты от кого-то прячешься?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_hide_01_01");	//Нет, конечно нет! Что за абсурд?! Мне просто нравится стоять среди деревьев - так мне ветер не дует в лицо.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_hide_01_02");	//Но давай лучше поговорим о тебе. Ты берешь работу?
};


instance DIA_Addon_Greg_NW_Stadtwachen(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_Stadtwachen_Condition;
	information = DIA_Addon_Greg_NW_Stadtwachen_Info;
	permanent = TRUE;
	description = "Насчет городских стражников...";
};


func int DIA_Addon_Greg_NW_Stadtwachen_Condition()
{
	if((MIS_Addon_Greg_BringMeToTheCity == LOG_Running) && (GregLocation == Greg_Farm1))
	{
		return TRUE;
	};
};


var int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld;
var int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein;
var int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino;

func void DIA_Addon_Greg_NW_Stadtwachen_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_15_00");	//Насчет городских стражников...
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_01_01");	//Да? У тебя есть мысль?
	Info_ClearChoices(DIA_Addon_Greg_NW_Stadtwachen);
	Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"Я должен еще подумать.",DIA_Addon_Greg_NW_Stadtwachen_nochnicht);
	if(DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"Ты не думал о подкупе?",DIA_Addon_Greg_NW_Stadtwachen_geld);
	};
	if((DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein == FALSE) && Npc_HasItems(other,ItWr_Passierschein))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"У меня есть пропуск в город.",DIA_Addon_Greg_NW_Stadtwachen_Schein);
	};
	if((MIS_Addon_Lester_PickForConstantino != 0) && (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino == FALSE))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"Ты можешь попасть в город, сказав, что ты сборщик трав.",DIA_Addon_Greg_NW_Stadtwachen_constantino);
	};
	if(Npc_HasItems(other,ITAR_Bau_L) || Npc_HasItems(other,ITAR_Bau_M))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen,"Они пропустят тебя, если на тебе будет одежда крестьянина.",DIA_Addon_Greg_NW_Stadtwachen_klamotten);
	};
};

func void DIA_Addon_Greg_NW_Stadtwachen_klamotten()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_00");	//Они пропустят тебя, если на тебе будет одежда крестьянина.
	if(Npc_HasItems(other,ITAR_Bau_L))
	{
		B_GiveInvItems(other,self,ITAR_Bau_L,1);
	}
	else
	{
		B_GiveInvItems(other,self,ITAR_Bau_M,1);
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_01");	//Это как раз то, что мне нужно! Я знал, что могу на тебя положиться, приятель.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_02");	//Если я буду одет как местный деревенский мужлан, никто не будет обращать на меня внимания.
	if(Npc_HasItems(self,ITAR_Bau_L))
	{
		AI_EquipArmor(self,ITAR_Bau_L);
	}
	else
	{
		AI_EquipArmor(self,ITAR_Bau_M);
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_03");	//Отлично! Вот твоя награда.
	CreateInvItems(self,ItMi_Gold,50);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	B_GivePlayerXP(XP_Greg_NW_GiveBauArmor);
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_04");	//Что? Жалкие 50 золотых монет? Ты, должно быть, шутишь.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_05");	//Золото - это не самое важное на свете, друг мой. Возьми пока то, что я тебе предлагаю.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_06");	//У меня есть предчувствие, что мы скоро встретимся снова.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_07");	//И кто знает, может быть, у меня будет возможность отплатить тебе услугой за услугу. Береги себя!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Markt");
	B_LogEntry(TOPIC_Addon_Greg_NW,"Я дал ему одежду крестьянина. В ней он может пройти в город.");
	MIS_Addon_Greg_BringMeToTheCity = LOG_SUCCESS;
};

func void DIA_Addon_Greg_NW_Stadtwachen_nochnicht()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_nochnicht_15_00");	//Я должен еще подумать.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_nochnicht_01_01");	//Хорошо. Но поспеши, у меня мало времени.
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Greg_NW_Stadtwachen_Schein()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_Schein_15_00");	//У меня есть пропуск в город.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_Schein_01_01");	//(саркастически) Ага. Ты хочешь сказать, что я должен выдать себя за горожанина?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_Schein_01_02");	//Посмотри на меня, мальчик! В это не поверит даже последний идиот.
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein = TRUE;
};

func void DIA_Addon_Greg_NW_Stadtwachen_constantino()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_constantino_15_00");	//Ты можешь попасть в город, сказав, что ты сборщик трав.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_constantino_01_01");	//Что? Я что, похож на человека, который собирает в лесах цветочки?
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino = TRUE;
};

func void DIA_Addon_Greg_NW_Stadtwachen_geld()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_geld_15_00");	//Ты не думал о подкупе?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_geld_01_01");	//Если бы я мог подкупить стражников, я был бы уже в городе.
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld = TRUE;
};


instance DIA_Addon_Greg_NW_PERM(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_PERM_Condition;
	information = DIA_Addon_Greg_NW_PERM_Info;
	permanent = TRUE;
	description = "Еще кое-что...";
};


func int DIA_Addon_Greg_NW_PERM_Condition()
{
	if(((MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS) || (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)) && (GregLocation == Greg_Farm1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_PERM_15_00");	//Еще кое-что...
	AI_Output(self,other,"DIA_Addon_Greg_NW_PERM_01_01");	//Послушай, сынок. У меня есть неотложные дела.
	AI_Output(self,other,"DIA_Addon_Greg_NW_PERM_01_02");	//Мы поговорим попозже. Понятно?
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Greg_NW_MeetGregSecondTime(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_MeetGregSecondTime_Condition;
	information = DIA_Addon_Greg_NW_MeetGregSecondTime_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_MeetGregSecondTime_Condition()
{
	if(GregLocation == Greg_Taverne)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_MeetGregSecondTime_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_00");	//Вы только посмотрите!
	if(MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_01");	//Мальчик-фермер.
	}
	else if(MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_02");	//Паренек, который так грубо отказался мне помочь. Итак, мы встретились снова...
	}
	else if(MIS_Addon_Greg_BringMeToTheCity == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_03");	//(зло) Я думал, что ты хочешь мне помочь! А ты просто сбежал.
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_04");	//Ты думал, я так там и застряну, верно?
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_05");	//Что ж, это очередной раз доказывает, что никто не поможет тебе, кроме тебя самого. Но на этот раз ты от меня просто так не уйдешь.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_06");	//Ты как раз вовремя.
	SC_SawGregInTaverne = TRUE;
};


instance DIA_Addon_Greg_NW_wer(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_wer_Condition;
	information = DIA_Addon_Greg_NW_wer_Info;
	description = "А кто ты вообще такой?";
};


func int DIA_Addon_Greg_NW_wer_Condition()
{
	if(GregLocation >= Greg_Taverne)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_wer_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_wer_15_00");	//А кто ты вообще такой?
	AI_Output(self,other,"DIA_Addon_Greg_NW_wer_01_01");	//Это не твое дело.
	AI_Output(self,other,"DIA_Addon_Greg_NW_wer_01_02");	//Если бы я хотел тебе представиться, я бы, наверное, это уже сделал, не так ли?
};


instance DIA_Addon_Greg_NW_was(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_was_Condition;
	information = DIA_Addon_Greg_NW_was_Info;
	description = "Итак, что тебе от меня надо?";
};


func int DIA_Addon_Greg_NW_was_Condition()
{
	if(GregLocation == Greg_Taverne)
	{
		return TRUE;
	};
};

func void B_Greg_Search_Dexter()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_00");	//Мне нужно найти одного человека. В городе его нет, и где его искать, тоже никто не знает.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_01");	//Он тощий, волосы у него черные, и он носит доспехи красного цвета.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_02");	//Насколько мне известно, он был заключенным в колонии. А имя его вроде бы начинается с буквы 'Д'.
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW,"Человек с повязкой на глазу ищет кого-то, чье имя начинается на букву 'Д'.");
	SC_KnowsGregsSearchsDexter = TRUE;
};

func void DIA_Addon_Greg_NW_was_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_15_00");	//Что тебе от меня нужно?
	if(MIS_Addon_Greg_BringMeToTheCity != 0)
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_was_15_01");	//У тебя все еще проблемы с городской стражей?
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_01_02");	//(угрожающе) Сейчас у ТЕБЯ начнутся проблемы, придурок.
	};
	B_Greg_Search_Dexter();
	Info_ClearChoices(DIA_Addon_Greg_NW_was);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Ты говоришь о Диего?",DIA_Addon_Greg_NW_was_Diego);
	if((Bdt13_Dexter_verraten == TRUE) || (Ranger_SCKnowsDexter == TRUE))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_was,"Тебе нужен Декстер?",DIA_Addon_Greg_NW_was_Dexter);
	};
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Не знаю никого, кто подходит под это описание.",DIA_Addon_Greg_NW_was_no);
};

func void DIA_Addon_Greg_NW_was_GregUnsicher()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_GregUnsicher_01_00");	//Может быть, и так. Я не помню, как его зовут...
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_GregUnsicher_01_01");	//Мне нужно увидеть его, чтобы узнать.
};

func void DIA_Addon_Greg_NW_was_UnNun()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_UnNun_15_00");	//Что-нибудь еще?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_UnNun_01_01");	//Да, господин болтун. Есть кое-что еще.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_UnNun_01_02");	//Мне нужно оружие. Мне нужна провизия. Золото мне тоже не помешает.
	Info_ClearChoices(DIA_Addon_Greg_NW_was);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Я не могу тебе помочь.",DIA_Addon_Greg_NW_was_NoHelp);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Провизия? Ты в таверне!",DIA_Addon_Greg_NW_was_Orlan);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Оружие? Оружие можно купить у наемников.",DIA_Addon_Greg_NW_was_SLD);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Вот тебе 10 золотых.",DIA_Addon_Greg_NW_was_HierGold);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"А ты не мог купить оружие в городе?",DIA_Addon_Greg_NW_was_Waffenhaendler);
	Info_AddChoice(DIA_Addon_Greg_NW_was,"Золото? Всем нам нужно золото.",DIA_Addon_Greg_NW_was_Gold);
};

func void DIA_Addon_Greg_NW_was_NoHelp()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_NoHelp_15_00");	//Я не могу тебе помочь.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_01");	//(зло) Нет, ты не ХОЧЕШЬ мне помочь.
	if((MIS_Addon_Greg_BringMeToTheCity == LOG_Running) || (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_02");	//Второй раз ты отказываешься выполнить мою просьбу.
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_03");	//Мой тебе совет: постарайся сделать так, чтобы я тебя больше не видел.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_04");	//Я запомню это, будь уверен.
	};
	MIS_Addon_Greg_RakeCave = LOG_OBSOLETE;
	GregLocation = Greg_Bigcross;
	AI_StopProcessInfos(self);
	AI_UseMob(self,"BENCH",-1);
	Npc_ExchangeRoutine(self,"Bigcross");
	B_StartOtherRoutine(BAU_974_Bauer,"Start");
};

func void DIA_Addon_Greg_NW_was_Gold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Gold_15_00");	//Золото? Всем нам нужно золото.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_01");	//Возможно. Но что бы ты сделал, если бы оно у тебя было? Уверен, ты спустил бы его по кабакам и борделям.
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Gold_15_02");	//А у тебя, конечно, есть мысли получше...
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_03");	//Да ты бы залез от страха под камень, если бы узнал, кто я такой.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_04");	//Так что прекрати болтать, или я отрежу твой неугомонный язык.
};

func void DIA_Addon_Greg_NW_was_Waffenhaendler()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Waffenhaendler_15_00");	//А ты не мог купить оружие в городе?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Waffenhaendler_01_01");	//Ты шутишь? Городские торговцы продают один хлам!
};

func void DIA_Addon_Greg_NW_was_HierGold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_HierGold_15_00");	//Вот тебе 10 золотых.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_01");	//(смеется) Можешь оставить себе свои жалкие сбережения. У меня есть мысль получше.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_02");	//Неподалеку отсюда есть пещера. Это одно из тех мест, где я когда-то зарыл свои сокровища.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_03");	//Пещера для меня слишком опасна. Я хочу, чтобы ты мне помог.
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW,"Я предложил человеку с повязкой на глазу золото, но он отказался. Я должен пойти с ним в его пещеру.");
	MIS_Addon_Greg_RakeCave = LOG_Running;
	Info_ClearChoices(DIA_Addon_Greg_NW_was);
};

func void DIA_Addon_Greg_NW_was_SLD()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_SLD_15_00");	//Оружие? Оружие можно купить у наемников.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_01");	//Интересно. Я уже слышал, что толстяк Онар нанял ребят для охраны.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_02");	//Неплохо для сухопутной крысы.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_03");	//Да, идея хорошая. Думаю, я действительно нанесу им визит.
};

func void DIA_Addon_Greg_NW_was_Orlan()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Orlan_15_00");	//Провизия? Ты в таверне!
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Orlan_01_01");	//Дурак-трактирщик не даст тебе ни крошки, пока ты ему не заплатишь.
};

func void DIA_Addon_Greg_NW_was_no()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_no_15_00");	//Не знаю никого, кто подходит под это описание.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_no_01_01");	//Я так и знал.
	DIA_Addon_Greg_NW_was_UnNun();
};

func void DIA_Addon_Greg_NW_was_Diego()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Diego_15_00");	//Ты говоришь о Диего?
	DIA_Addon_Greg_NW_was_GregUnsicher();
	DIA_Addon_Greg_NW_was_UnNun();
};

func void DIA_Addon_Greg_NW_was_Dexter()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Dexter_15_00");	//Тебе нужен Декстер?
	DIA_Addon_Greg_NW_was_GregUnsicher();
	DIA_Addon_Greg_NW_was_UnNun();
};


instance DIA_Addon_Greg_NW_RakeCaveLos(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RakeCaveLos_Condition;
	information = DIA_Addon_Greg_NW_RakeCaveLos_Info;
	description = "Пойдем в твою пещеру.";
};


func int DIA_Addon_Greg_NW_RakeCaveLos_Condition()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_RakeCaveLos_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCaveLos_15_00");	//Пойдем в твою пещеру.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveLos_01_01");	//Следуй за мной.
	AI_StopProcessInfos(self);
	AI_UseMob(self,"BENCH",-1);
	Npc_ExchangeRoutine(self,"RakeCave");
};

func void B_Greg_GoNow()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_03");	//Ну и чего ты ждешь? Иди внутрь и забирай вещи.
};


instance DIA_Addon_Greg_NW_RakeCaveThere(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RakeCaveThere_Condition;
	information = DIA_Addon_Greg_NW_RakeCaveThere_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_RakeCaveThere_Condition()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_RakeCaveThere_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_00");	//Ну что, приятель, вот и пещера.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_01");	//Вот тебе кирка.
	B_GiveInvItems(self,other,ItMw_2H_Axe_L_01,1);
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_02");	//Я закопал свои вещи где-то внутри. Место отмечено крестом.
	B_Greg_GoNow();
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCaveThere_15_04");	//А как же ты?
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_05");	//Кто-то же должен защищать тыл. А теперь - иди внутрь.
	Log_CreateTopic(TOPIC_Addon_Greg_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW,LOG_Running);
	B_LogEntry(TOPIC_Addon_Greg_NW,"Этот парень хочет, чтобы я достал из пещеры его вещи. Он закопал их, а место пометил крестом. Для работы он дал мне кирку.");
	MIS_Addon_Greg_RakeCave_Day = Wld_GetDay();
};


instance DIA_Addon_Greg_NW_RakeCavePlundered(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RakeCavePlundered_Condition;
	information = DIA_Addon_Greg_NW_RakeCavePlundered_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_RakeCavePlundered_Condition()
{
	if(((MIS_Addon_Greg_RakeCave_Day <= (Wld_GetDay() - 2)) || (RAKEPLACE[1] == TRUE)) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_01_00");	//Что ты там так долго делал? Нашел то, что я тебя просил?
	if(RAKEPLACE[1] == TRUE)
	{
		Info_AddChoice(DIA_Addon_Greg_NW_RakeCavePlundered,"Да, я выкопал кошелек с золотом.",DIA_Addon_Greg_NW_RakeCavePlundered_gold);
	};
	Info_AddChoice(DIA_Addon_Greg_NW_RakeCavePlundered,"Нет.",DIA_Addon_Greg_NW_RakeCavePlundered_No);
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_No()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_No_15_00");	//Нет.
	if(RAKEPLACE[1] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_01");	//Испытываешь мое терпение, сынок?
		AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_No_15_02");	//Э-э... там ничего не было.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_03");	//Тысяча чертей! Я так и знал! Меня опять опередили.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_04");	//Ну ладно. Мне нужно идти. Увидимся.
	AI_StopProcessInfos(self);
	GregLocation = Greg_Bigcross;
	Npc_ExchangeRoutine(self,"Bigcross");
	B_StartOtherRoutine(BAU_974_Bauer,"Start");
};


var int B_Greg_RakePlaceBriefing_OneTime;

func void B_Greg_RakePlaceBriefing()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_00");	//Так, посмотрим... На озере с двумя водопадами есть небольшой островок.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_01");	//На верхних пастбищах есть еще два места, где я закопал сокровища.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_02");	//Одно - за находящейся там фермой, а второе - рядом с входом в проход, у водопада.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_03");	//От верхних пастбищ к полям Онара ведет лестница.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_04");	//В долине, в которую она спускается, есть еще один тайник.
	if(B_Greg_RakePlaceBriefing_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_Addon_Greg_NW,"Человек рассказал мне, что есть несколько мест, где он закопал свои вещи: 1) На маленьком острове на озере с двумя водопадами. 2) На верхнем пастбище за фермой. 3) У водопадов неподалеку от ворот прохода. 4) В низине под лестницей, ведущей от верхних пастбищ к полям землевладельца. Я должен найти все его закопанные вещи. Он будет ждать меня у перекрестка на полях.");
		B_Greg_RakePlaceBriefing_OneTime = TRUE;
	};
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_gold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_00");	//Да, я выкопал кошелек с золотом.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_01");	//(жадно) Давай его сюда.
	if(Npc_HasItems(other,ItSe_GoldPocket25) || (Npc_HasItems(other,ItMi_Gold) >= 25))
	{
		if(B_GiveInvItems(other,self,ItSe_GoldPocket25,1))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_02");	//Держи.
		}
		else if(B_GiveInvItems(other,self,ItMi_Gold,25))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_03");	//Я его открыл, внутри было 25 золотых. Вот они.
		};
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_04");	//Очень хорошо.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_05");	//От тебя, оказывается, может быть хоть какой-то толк.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_06");	//Ладно, слушай внимательно. Есть еще несколько мест, где я закопал свои вещи. И я хочу, чтобы ты мне их принес.
		B_Greg_RakePlaceBriefing();
		Greg_SuchWeiter = TRUE;
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_07");	//Я буду ждать тебя у перекрестка на полях Онара. Не подведи меня - ты об этом пожалеешь.
		AI_StopProcessInfos(self);
		GregLocation = Greg_Bigcross;
		Npc_ExchangeRoutine(self,"Bigcross");
		B_GivePlayerXP(XP_Addon_RakeCavePlundered);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_08");	//У меня уже ничего нет.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_09");	//Дерьмо собачье! Мне что, заставить тебя отдать мои вещи силой?
		AI_StopProcessInfos(self);
		MIS_Addon_Greg_RakeCave = LOG_FAILED;
		GregLocation = Greg_Bigcross;
		Npc_ExchangeRoutine(self,"Bigcross");
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_Addon_Greg_NW_LakeCave(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 100;
	condition = DIA_Addon_Greg_NW_LakeCave_Condition;
	information = DIA_Addon_Greg_NW_LakeCave_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_LakeCave_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (GregLocation >= Greg_Taverne) && (GregLocation < Greg_Dexter) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000) && (Greg_SuchWeiter == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_LakeCave_Info()
{
	B_Greg_GoNow();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Greg_NW_WhereTreasures(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 10;
	condition = DIA_Addon_Greg_NW_WhereTreasures_Condition;
	information = DIA_Addon_Greg_NW_WhereTreasures_Info;
	permanent = TRUE;
	description = "Повтори, где ты зарыл свои вещи?";
};


func int DIA_Addon_Greg_NW_WhereTreasures_Condition()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_WhereTreasures_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WhereTreasures_15_00");	//Повтори, где ты зарыл свои вещи?
	B_Greg_RakePlaceBriefing();
};


instance DIA_Addon_Greg_NW_PermTaverne(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 99;
	condition = DIA_Addon_Greg_NW_PermTaverne_Condition;
	information = DIA_Addon_Greg_NW_PermTaverne_Info;
	permanent = TRUE;
	description = "Еще кое-что...";
};


func int DIA_Addon_Greg_NW_PermTaverne_Condition()
{
	if(((GregLocation == Greg_Bigcross) && (Npc_KnowsInfo(other,DIA_Addon_Greg_NW_Bigcross) == FALSE) && (((Npc_GetDistToWP(self,"BIGCROSS") < 1000) == FALSE) || (MIS_Addon_Greg_RakeCave == LOG_SUCCESS))) || ((GregLocation == Greg_Dexter) && Npc_KnowsInfo(other,DIA_Addon_Greg_NW_WasWillstDu)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_PermTaverne_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_PermTaverne_15_00");	//Еще кое-что...
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_01");	//Сначала принеси мне все мои вещи. Потом мы поговорим.
	}
	else if(MIS_Addon_Greg_RakeCave == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_02");	//Конечно, я благодарен, что ты мне помог. Но это не делает нас друзьями. Понимаешь, о чем я?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_03");	//Мы и так слишком долго болтаем.
	};
};


instance DIA_Addon_Greg_NW_Bigcross(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_Bigcross_Condition;
	information = DIA_Addon_Greg_NW_Bigcross_Info;
	description = "Как дела?";
};


func int DIA_Addon_Greg_NW_Bigcross_Condition()
{
	if((GregLocation == Greg_Bigcross) && (Npc_GetDistToWP(self,"BIGCROSS") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_Bigcross_Info()
{
	if((MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED) || (MIS_Addon_Greg_RakeCave == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_00");	//Это же наш господин Ненадежность!
	};
	AI_Output(other,self,"DIA_Addon_Greg_NW_Bigcross_15_01");	//Как дела?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_02");	//Так себе. От наемников оказалось мало пользы.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_03");	//Я ожидал, что они - храбрые ребята.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_04");	//Но на поверку оказалось, что это всего лишь болтливые хвастуны.
	if((MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_05");	//Ну что, ты нашел мои вещи?
		if((RAKEPLACE[1] == FALSE) || (RAKEPLACE[2] == FALSE) || (RAKEPLACE[3] == FALSE) || (RAKEPLACE[4] == FALSE) || (RAKEPLACE[5] == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_Bigcross_15_06");	//Нет, еще не все.
			AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_07");	//Так поторопись! Не так уж это и сложно.
		};
	};
};


instance DIA_Addon_Greg_NW_WhatWantFromSLD(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_WhatWantFromSLD_Condition;
	information = DIA_Addon_Greg_NW_WhatWantFromSLD_Info;
	description = "Что тебе было нужно от наемников?";
};


func int DIA_Addon_Greg_NW_WhatWantFromSLD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_NW_Bigcross) && (GregLocation == Greg_Bigcross) && (Npc_GetDistToWP(self,"BIGCROSS") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_WhatWantFromSLD_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WhatWantFromSLD_15_00");	//Что тебе было нужно от наемников?
	if(SC_KnowsGregsSearchsDexter == FALSE)
	{
		B_Greg_Search_Dexter();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_WhatWantFromSLD_01_01");	//Я тебе уже говорил. Я ищу человека в красной броне.
		AI_Output(self,other,"DIA_Addon_Greg_NW_WhatWantFromSLD_01_02");	//Но эти кретины даже не поняли, о ком я говорю.
	};
};


instance DIA_Addon_Greg_NW_DexterFound(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_DexterFound_Condition;
	information = DIA_Addon_Greg_NW_DexterFound_Info;
	description = "Я думаю, что тебе нужен человек по имени Декстер.";
};


func int DIA_Addon_Greg_NW_DexterFound_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_NW_Bigcross) && (GregLocation == Greg_Bigcross) && ((Bdt13_Dexter_verraten == TRUE) || (Ranger_SCKnowsDexter == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_DexterFound_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_15_00");	//Я думаю, что тебе нужен человек по имени Декстер.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_01_01");	//Черт возьми, откуда мне знать его имя?!
	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
	Info_AddChoice(DIA_Addon_Greg_NW_DexterFound,"Я просто предположил.",DIA_Addon_Greg_NW_DexterFound_weg);
	Info_AddChoice(DIA_Addon_Greg_NW_DexterFound,"Я могу помочь тебе его найти.",DIA_Addon_Greg_NW_DexterFound_together);
	Info_AddChoice(DIA_Addon_Greg_NW_DexterFound,"Думаю, я могу помочь тебе его найти.",DIA_Addon_Greg_NW_DexterFound_wo);
};

func void DIA_Addon_Greg_NW_DexterFound_weg()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_weg_15_00");	//Я просто предположил.
	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
};

func void DIA_Addon_Greg_NW_DexterFound_wo()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_00");	//Думаю, я могу помочь тебе его найти.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_01");	//Действительно? И где же он сейчас?
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_02");	//Недалеко отсюда.
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_03");	//Похоже, он стал главарем шайки бандитов.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_04");	//Ха! Да, похоже, это он.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_05");	//Я знал, что этот трус прячется где-то здесь.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_06");	//Теперь все, что мне осталось сделать, - обыскать все убежища и тайные укрытия в округе.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_07");	//Я найду этого ублюдка, и твоя помощь мне не нужна.
	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Addon_Greg_NW_DexterFound_together()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_together_15_00");	//Я могу помочь тебе его найти.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_together_01_01");	//Нет, я пойду один. У меня с ним свои личные счеты.
};


instance DIA_Addon_Greg_NW_CaughtDexter(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_CaughtDexter_Condition;
	information = DIA_Addon_Greg_NW_CaughtDexter_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_CaughtDexter_Condition()
{
	if((GregLocation == Greg_Dexter) && (Npc_IsDead(Dexter) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_CaughtDexter_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter_01_00");	//(громко) Ну и где эта свинья?
	AI_Output(other,self,"DIA_Addon_Greg_NW_CaughtDexter_15_01");	//Кто, главарь? Прямо здесь.
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter_01_02");	//Тогда прочь с моей дороги!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DexterHouseRun");
};


instance DIA_Addon_Greg_NW_WodennNu(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_WodennNu_Condition;
	information = DIA_Addon_Greg_NW_WodennNu_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_WodennNu_Condition()
{
	if((GregLocation == Greg_Dexter) && (Npc_IsDead(Dexter) == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_HUT_10") < 500))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_WodennNu_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_WodennNu_01_00");	//И куда же он делся?
	AI_Output(other,self,"DIA_Addon_Greg_NW_WodennNu_15_01");	//Был здесь.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WodennNu_01_02");	//Ну так пойди и отыщи его!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Greg_NW_CaughtDexter2(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_CaughtDexter2_Condition;
	information = DIA_Addon_Greg_NW_CaughtDexter2_Info;
	important = TRUE;
};


func int DIA_Addon_Greg_NW_CaughtDexter2_Condition()
{
	if((GregLocation == Greg_Dexter) && Npc_IsDead(Dexter))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_CaughtDexter2_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter2_01_00");	//Ага. Значит, Декстер свое получил?
	AI_Output(other,self,"DIA_Addon_Greg_NW_CaughtDexter2_15_01");	//Похоже, он мертв.
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter2_01_02");	//Не могу сказать, что мне его жалко. Проверь, что у него было с собой.
	Npc_ExchangeRoutine(self,"DexterHouseWalk");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Greg_NW_RavensLetter(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_RavensLetter_Condition;
	information = DIA_Addon_Greg_NW_RavensLetter_Info;
	description = "Я нашел только это письмо.";
};


func int DIA_Addon_Greg_NW_RavensLetter_Condition()
{
	if((GregLocation == Greg_Dexter) && Npc_KnowsInfo(other,DIA_Addon_Greg_NW_CaughtDexter2) && Npc_HasItems(other,ItWr_RavensKidnapperMission_Addon) && Npc_IsDead(Dexter))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_RavensLetter_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_00");	//Я нашел только это письмо.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_01");	//Покажи.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_02");	//Черт возьми! Это мне совсем не поможет.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_03");	//Нельзя было его просто так убивать.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_04");	//Скажи, ты, случайно, не знаешь, как попасть за горный хребет на северо-востоке Хориниса?
	if((Nefarius_NW.aivar[AIV_TalkedToPlayer] == TRUE) && (Saturas_NW.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_05");	//Возможно, через портал, который обнаружили маги воды.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_06");	//Что это за бред?
		AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_07");	//Маги воды... А мысли получше у тебя есть?
	};
	AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_08");	//Нет.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_09");	//(вздыхает) Значит, я здесь застрял.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_10");	//На Декстера у меня была последняя надежда.
};


instance DIA_Addon_Greg_NW_WasWillstDu(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_WasWillstDu_Condition;
	information = DIA_Addon_Greg_NW_WasWillstDu_Info;
	description = "А что тебе было нужно от Декстера?";
};


func int DIA_Addon_Greg_NW_WasWillstDu_Condition()
{
	if((GregLocation == Greg_Dexter) && Npc_KnowsInfo(other,DIA_Addon_Greg_NW_RavensLetter))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_WasWillstDu_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_15_00");	//А что тебе было нужно от Декстера?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_01_01");	//Я приплыл сюда из-за северо-восточных гор. И я хочу туда вернуться.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_01_02");	//Я надеялся, что это ублюдок расскажет мне, как добраться туда без корабля.
	Npc_ExchangeRoutine(self,"DexterThrone");
	Info_ClearChoices(DIA_Addon_Greg_NW_WasWillstDu);
	Info_AddChoice(DIA_Addon_Greg_NW_WasWillstDu,"А что находится за этими горами?",DIA_Addon_Greg_NW_WasWillstDu_da);
	if(Skip_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		Info_AddChoice(DIA_Addon_Greg_NW_WasWillstDu,"Недалеко от города я встретил пирата по имени Скип.",DIA_Addon_Greg_NW_WasWillstDu_Skip);
	};
};

func void DIA_Addon_Greg_NW_WasWillstDu_da()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_da_15_00");	//А что находится за этими горами?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_01");	//Э-э, тебе даже не стоит пытаться туда попасть.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_02");	//Земли там суровые. Такому человеку, как ты, долго там не протянуть.
};

func void DIA_Addon_Greg_NW_WasWillstDu_Skip()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_Skip_15_00");	//Недалеко от города я встретил пирата по имени Скип.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_Skip_01_01");	//А, этот идиот. Я ждал его три дня, почему он не появился раньше?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_Skip_01_02");	//Ничего, я ему еще покажу, что к чему.
	SC_KnowsConnectionSkipGreg = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Greg_NW_FoundTreasure(C_Info)
{
	npc = PIR_1300_Addon_Greg_NW;
	nr = 5;
	condition = DIA_Addon_Greg_NW_FoundTreasure_Condition;
	information = DIA_Addon_Greg_NW_FoundTreasure_Info;
	permanent = TRUE;
	description = "Я нашел все закопанные вещи.";
};


func int DIA_Addon_Greg_NW_FoundTreasure_Condition()
{
	if((RAKEPLACE[1] == TRUE) && (RAKEPLACE[2] == TRUE) && (RAKEPLACE[3] == TRUE) && (RAKEPLACE[4] == TRUE) && (RAKEPLACE[5] == TRUE) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_FoundTreasure_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_15_00");	//Я нашел все закопанные вещи.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_01_01");	//Тогда у тебя должно быть около ста золотых, золотая чаша, серебряное блюдо и амулет. Давай их сюда.
	Info_ClearChoices(DIA_Addon_Greg_NW_FoundTreasure);
	Info_AddChoice(DIA_Addon_Greg_NW_FoundTreasure,"У меня с собой их нет.",DIA_Addon_Greg_NW_FoundTreasure_not);
	if((Npc_HasItems(other,ItSe_GoldPocket100) || (Npc_HasItems(other,ItMi_Gold) >= 100)) && Npc_HasItems(other,ItMi_GoldCup) && Npc_HasItems(other,ItMi_SilverChalice) && Npc_HasItems(other,ItAm_Prot_Point_01))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_FoundTreasure,"Вот твои вещи.",DIA_Addon_Greg_NW_FoundTreasure_ja);
	};
};

func void DIA_Addon_Greg_NW_FoundTreasure_ja()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_00");	//Вот твои вещи.
	if(B_GiveInvItems(other,self,ItSe_GoldPocket100,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_01");	//Кошелек со ста золотыми.
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_02");	//100 золотых.
	};
	if(B_GiveInvItems(other,self,ItMi_GoldCup,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_03");	//Золотая чаша.
	};
	if(B_GiveInvItems(other,self,ItMi_SilverChalice,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_04");	//Серебряное блюдо.
	};
	if(B_GiveInvItems(other,self,ItAm_Prot_Point_01,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_05");	//И амулет.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_06");	//Очень хорошо. Вижу, тебе хватило ума не присваивать себе мои вещи.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_07");	//Вот твоя доля.
	B_GiveInvItems(self,other,ItMi_Gold,30);
	Info_ClearChoices(DIA_Addon_Greg_NW_FoundTreasure);
	MIS_Addon_Greg_RakeCave = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Greg_RakeCave);
};

func void DIA_Addon_Greg_NW_FoundTreasure_not()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_not_15_00");	//У меня с собой их нет.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_not_01_01");	//Тогда поторопить и принеси их мне, пока я не рассердился.
	AI_StopProcessInfos(self);
};

