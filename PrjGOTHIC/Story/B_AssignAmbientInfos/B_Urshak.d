
var int urshak_sucked;

instance DIA_Urshak_EXIT(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 999;
	condition = DIA_Urshak_EXIT_Condition;
	information = DIA_Urshak_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Urshak_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Urshak_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Urshak_HALLO(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 5;
	condition = DIA_Urshak_HALLO_Condition;
	information = DIA_Urshak_HALLO_Info;
	important = TRUE;
};


func int DIA_Urshak_HALLO_Condition()
{
//	if(Npc_IsInState(self,ZS_Talk) && (URSHAK_SUCKED == FALSE))
	if(URSHAK_SUCKED == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Urshak_HALLO_Info()
{
	AI_Output(self,other,"DIA_Urshak_HALLO_18_00");	//(агрессивно) КРОТОК ДЖАБАР!!!
	AI_Output(self,other,"DIA_Urshak_HALLO_18_01");	//Стой! Моя знать тебя. Ты друг человек с мягким голосом.
	AI_Output(self,other,"DIA_Urshak_HALLO_18_02");	//Друг убивать злого демона КРУШАКА.
	B_GivePlayerXP(XP_UrshakFound);
	Log_CreateTopic(TOPIC_Urshak,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Urshak,LOG_Running);
	B_LogEntry(TOPIC_Urshak,"Я нашел своего старого друга-орка - Ур-Шака.");
	Info_ClearChoices(DIA_Urshak_HALLO);
	Info_AddChoice(DIA_Urshak_HALLO,"Что ты делаешь здесь?",DIA_Urshak_HALLO_freund);
	Info_AddChoice(DIA_Urshak_HALLO,"Говорящий орк?",DIA_Urshak_HALLO_wer);
};

func void DIA_Urshak_HALLO_wer()
{
	AI_Output(other,self,"DIA_Urshak_HALLO_wer_15_00");	//Говорящий орк?
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_01");	//Твоя забывать Ур-Шак? Это печалить меня.
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_02");	//Ур-Шак помогать другу много дней раньше получить УЛУ-МУЛУ для ходить в моя деревня. Орки уважать друга, и друг не умирать от руки орков.
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_03");	//Друг потом ходить в храм орков и изгонять злого демона. Много дней раньше. Твоя не помнить?
};

func void DIA_Urshak_HALLO_freund()
{
	AI_Output(other,self,"DIA_Urshak_HALLO_freund_15_00");	//Ты выбрал не лучшее время, чтобы встать у меня на пути. Я чуть не убил тебя. Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Urshak_HALLO_freund_18_01");	//Ур-Шак смотреть на землю и видеть, что стало с землей и мой народ.
	Info_ClearChoices(DIA_Urshak_HALLO);
};


instance DIA_Urshak_WASMACHENORKS(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = DIA_Urshak_WASMACHENORKS_Condition;
	information = DIA_Urshak_WASMACHENORKS_Info;
	description = "Почему орки нападают на людей?";
};


func int DIA_Urshak_WASMACHENORKS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HALLO) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_WASMACHENORKS_Info()
{
	AI_Output(other,self,"DIA_Urshak_WASMACHENORKS_15_00");	//Почему орки нападают на людей?
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_01");	//Ур-Шак всегда говорить народ орков, что люди не зло и с ними надо дружить.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_02");	//Но шаман не слушать Ур-Шак. Ур-Шак в немилость у свой народ.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_03");	//Поэтому Ур-Шак не знать точно о большой план войны против людей.
	B_LogEntry(TOPIC_Urshak,"Он все еще никак не может заставить свой народ выслушать его. Он все еще изгнанник.");
};


instance DIA_Urshak_SOVIELE(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 7;
	condition = DIA_Urshak_SOVIELE_Condition;
	information = DIA_Urshak_SOVIELE_Info;
	description = "Почему вас здесь так много?";
};


func int DIA_Urshak_SOVIELE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HALLO) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_SOVIELE_Info()
{
	AI_Output(other,self,"DIA_Urshak_SOVIELE_15_00");	//Почему вас здесь так много?
	AI_Output(self,other,"DIA_Urshak_SOVIELE_18_01");	//Орки приходить с гор, но другие приплывать на кораблях и делать большой забор.
};


instance DIA_Urshak_ZAUN(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 8;
	condition = DIA_Urshak_ZAUN_Condition;
	information = DIA_Urshak_ZAUN_Info;
	description = "Что скрывается за этим частоколом орков на востоке?";
};


func int DIA_Urshak_ZAUN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HALLO) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_ZAUN_Info()
{
	AI_Output(other,self,"DIA_Urshak_ZAUN_15_00");	//Что скрывается за этим частоколом орков на востоке?
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_01");	//Орки всегда делать большой забор и готовить лагерь к война.
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_02");	//Забор хорошо для война. Скрывать сила армия и защищать орков.
};


instance DIA_Urshak_WASHASTDUVOR(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 9;
	condition = DIA_Urshak_WASHASTDUVOR_Condition;
	information = DIA_Urshak_WASHASTDUVOR_Info;
	description = "Что вы планируете делать дальше?";
};


func int DIA_Urshak_WASHASTDUVOR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HALLO) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_WASHASTDUVOR_Info()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_00");	//Что вы планируете делать дальше?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_01");	//Ур-Шак ждать, пока разведчики орков приводить Ур-Шак к Хош-Пак.
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_02");	//Кто такой Хош-Пак?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_03");	//Очень большой шаман. Иметь большое влияние на воинов и делать большие планы для орков.
	B_LogEntry(TOPIC_Urshak,"Ур-Шак хочет встретиться с шаманом орков Хош-Паком и убедить его принять Ур-Шака назад в совет шаманов.");
	Info_ClearChoices(DIA_Urshak_WASHASTDUVOR);
	Info_AddChoice(DIA_Urshak_WASHASTDUVOR,Dialog_Back,DIA_Urshak_WASHASTDUVOR_weiter);
	Info_AddChoice(DIA_Urshak_WASHASTDUVOR,"Где я могу найти этого Хош-Пака?",DIA_Urshak_WASHASTDUVOR_);
	Info_AddChoice(DIA_Urshak_WASHASTDUVOR,"Почему ты тогда не пойдешь к нему?",DIA_Urshak_WASHASTDUVOR_hoshpak);
};

func void DIA_Urshak_WASHASTDUVOR_hoshpak()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_hoshpak_15_00");	//Почему ты тогда не пойдешь к нему?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_01");	//Ур-Шак пытаться и пытаться получить опять честь и старое место в совет шаманов.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_02");	//Но пока Хош-Пак не слушать Ур-Шак. Орки убивать Ур-Шак если видеть его без разведчиков. Ур-Шак должен говорить с Хош-Пак.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_03");	//Может быть, это удаваться сегодня.
};

func void DIA_Urshak_WASHASTDUVOR_()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_Urshak_15_00");	//Где я могу найти этого Хош-Пака?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_Urshak_18_01");	//Он там где может наблюдать за воины орков у крепости у большой вулкан, чтобы Хош-Пак мочь контролировать воины.
};

func void DIA_Urshak_WASHASTDUVOR_weiter()
{
	Info_ClearChoices(DIA_Urshak_WASHASTDUVOR);
};


instance DIA_Urshak_HOSHPAKDEAD(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 9;
	condition = DIA_Urshak_HOSHPAKDEAD_Condition;
	information = DIA_Urshak_HOSHPAKDEAD_Info;
	description = "Хош-Пак мертв.";
};


func int DIA_Urshak_HOSHPAKDEAD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_WASHASTDUVOR) && Npc_IsDead(Hosh_Pak) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_HOSHPAKDEAD_Info()
{
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_00");	//Хош-Пак мертв.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_01");	//Хош-Пак мертв? РУШТАСОК!
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_02");	//Мое сердце большая печаль. Ур-Шак никогда не забывать великий орк делать Ур-Шак шаман.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_03");	//Я понимаю. Хош-Пак был твоим учителем.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_04");	//Ур-Шак теперь должен носить ношу горя, должен дать Хош-Пак последний обряд. Ур-Шак надо идти.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_05");	//Друг лучше уходить проход. Слишком опасно здесь.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_06");	//Ур-Шак печалиться, если человек тоже умирать.
	B_LogEntry(TOPIC_Urshak,"Хош-Пак мертв. Мой друг-орк направляется к палатке Хош-Пака. Он скорбит по своему наставнику. Я должен отпустить его.");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,20);
	Npc_ExchangeRoutine(self,"Start");
//	Wld_InsertNpc(OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_01");
//	Wld_InsertNpc(OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_02");
	Wld_InsertNpc(OrcWarrior_Scout,"OW_HOSHPAK_05");
	Wld_InsertNpc(OrcWarrior_Scout,"FP_ROAM_HOSHPAK_05");
};


instance DIA_Urshak_GEH(C_Info)
{
	npc = NONE_110_Urshak;
	condition = DIA_Urshak_GEH_Condition;
	information = DIA_Urshak_GEH_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Urshak_GEH_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HOSHPAKDEAD) && (Npc_GetDistToWP(self,"OW_HOSHPAK_04") > 1000) && (URSHAK_SUCKED == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Urshak_GEH_Info()
{
	AI_Output(self,other,"DIA_Urshak_GEH_18_00");	//Друг лучше уходить проход.
	AI_StopProcessInfos(self);
};


instance DIA_Urshak_HOSHPAKRACHE(C_Info)
{
	npc = NONE_110_Urshak;
	condition = DIA_Urshak_HOSHPAKRACHE_Condition;
	information = DIA_Urshak_HOSHPAKRACHE_Info;
	important = TRUE;
};


func int DIA_Urshak_HOSHPAKRACHE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HOSHPAKDEAD) && (Npc_GetDistToWP(self,"OW_HOSHPAK_04") <= 1000) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_HOSHPAKRACHE_Info()
{
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_00");	//(агрессивно) ХОРТОК! Я узнавать, что ты быть здесь, когда Хош-Пак убивать. Твоя делать большая ошибка, чужак.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKRACHE_15_01");	//Я вижу, ты занял свое место здесь. Ты обманул меня.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKRACHE_15_02");	//Твое положение среди твоих людей выше, чем ты это говорил. Теперь ты сам не более чем инструмент в руках дьявола.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_03");	//Чужак прав. Ур-Шак наполняться только ненависть и месть теперь.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_04");	//Ур-Шак видеть большая ошибка доверять злой человек. Ур-Шак сожалеть звать человек другом и помогать ему не быть убит.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_05");	//Чужак теперь покидать долина и идти проход. Ур-Шак не будет убивать чужак сейчас. Честь шаман говорит Ур-Шак не убивать.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_06");	//Следующий раз мы встречаться мы враги. Твоя лучше уходить сейчас.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
	B_LogEntry(TOPIC_Urshak,"Ур-Шак был принят назад, в совет шаманов орков. Теперь он на стороне врага и немного напряжен. Лучше мне не вставать у него на пути, пока я не решу все дела с орками. К тому времени он должен успокоиться.");
	B_GivePlayerXP(XP_UrshakBecomesShaman);
};


instance DIA_Urshak_KEINEWAHL(C_Info)
{
	npc = NONE_110_Urshak;
	condition = DIA_Urshak_KEINEWAHL_Condition;
	information = DIA_Urshak_KEINEWAHL_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Urshak_KEINEWAHL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HOSHPAKRACHE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Urshak_KEINEWAHL_Info()
{
	AI_Output(self,other,"DIA_Urshak_KEINEWAHL_18_00");	//Твоя уходить. Моя больше не говорить с чужак.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
};

