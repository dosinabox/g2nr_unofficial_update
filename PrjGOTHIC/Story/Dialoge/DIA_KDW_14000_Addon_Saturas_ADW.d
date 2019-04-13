
instance DIA_Addon_Saturas_ADW_EXIT(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 999;
	condition = DIA_Addon_Saturas_ADW_EXIT_Condition;
	information = DIA_Addon_Saturas_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Saturas_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXIT_14_00");	//Пусть Аданос защитит тебя.
};


instance DIA_Addon_Saturas_ADWStart(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = DIA_Addon_Saturas_ADWStart_Condition;
	information = DIA_Addon_Saturas_ADWStart_Info;
	important = TRUE;
};


func int DIA_Addon_Saturas_ADWStart_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_ADWStart_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_00");	//Благодари Аданоса! Наконец-то ты здесь. Мы думали, что ты не появишься снова.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_15_01");	//(смущенно) Что? Как вы успели ЗДЕСЬ оказаться?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_02");	//Ты прошел через портал, мы последовали за тобой. Наша дорога была недолгой.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_03");	//Однако тебя там не было. Мы здесь уже несколько дней.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_15_04");	//(удивленно) НЕСКОЛЬКО ДНЕЙ? Разве это возможно?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_05");	//После того как мы не смогли тебя нигде найти, Нефариус решил выяснить, что могло случиться. Казалось, до настоящего момента все его усилия были тщетны.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_06");	//Ладно. Теперь ты здесь и можешь приступить к работе.
	Wld_InsertNpc(Giant_Rat,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc(Giant_Rat,"ADW_PORTALTEMPEL_11");
	Info_ClearChoices(DIA_Addon_Saturas_ADWStart);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Что происходило тем временем?",DIA_Addon_Saturas_ADWStart_was);
};

func void DIA_Addon_Saturas_ADWStart_was()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_was_15_00");	//Что происходило тем временем?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_01");	//Мы узнали много нового.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_02");	//Землетрясения здесь действительно гораздо сильнее. Сейчас мы находимся не так далеко от их эпицентра.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_03");	//Мы можем с уверенностью сказать, что строители этих древних сооружений в свое время возвели город на этом месте.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_04");	//Однако по какой-то причине их культура пришла в упадок.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_05");	//Но пока мы можем только предполагать, почему это произошло.
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Есть какие-нибудь следы пропавших людей?",DIA_Addon_Saturas_ADWStart_missingPeople);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Как насчет Ворона?",DIA_Addon_Saturas_ADWStart_Raven);
};

func void DIA_Addon_Saturas_ADWStart_Raven()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_Raven_15_00");	//Как насчет Ворона?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_01");	//В письме Ворона говорится о храме, в который он пытался проникнуть.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_02");	//Мы едины во мнении, что Ворон ищет способ осквернить храм Аданоса.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_03");	//Очевидно, землетрясение возникает из-за сопротивления могущественного заклинания нечестивым чарам.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_04");	//На воротах храма лежит магическая печать, и именно ее магия оживляет каменных стражей.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_05");	//Храм защищается. Мы должны остановить Ворона до того, как он ворвется в святая святых.
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Что дальше?",DIA_Addon_Saturas_ADWStart_wastun);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Ворон всего лишь бывший рудный барон, а не маг. Разве ОН может осуществить подобное?",DIA_Addon_Saturas_ADWStart_RavenOnlyBaron);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Что Ворону нужно в храме?",DIA_Addon_Saturas_ADWStart_RavenAim);
};

func void DIA_Addon_Saturas_ADWStart_RavenAim()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_RavenAim_15_00");	//Что Ворону нужно в храме?
	AI_Output(self,other,"DIA_Addon_Bodo_14_01");	//Мы знаем только, что это касается могущественного артефакта, каким-то образом связанного с Аданосом и Белиаром.
	AI_Output(self,other,"DIA_Addon_Bodo_14_02");	//(мрачно) Естественно, мы не ждем от него ничего хорошего...
};

func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00");	//Ворон всего лишь бывший рудный барон, а не маг. Разве ОН может осуществить подобное?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01");	//Возможно, он будет действовать не сам, а наймет какого-нибудь мага-отступника.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02");	//Так или иначе, мы ДОЛЖНЫ предотвратить зло.
};

func void DIA_Addon_Saturas_ADWStart_missingPeople()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_missingPeople_15_00");	//Есть какие-нибудь следы пропавших людей?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_missingPeople_14_01");	//Только вчера мы нашли тело рыбака. Оно лежало под развалинами к востоку отсюда.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_missingPeople_14_02");	//Похоже, что это был рыбак из Хориниса. Взгляни там.
	Saturas_AboutWilliam = TRUE;
	B_LogEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche);
};

func void DIA_Addon_Saturas_ADWStart_wastun()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun_15_00");	//Что дальше?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_01");	//Мы останемся здесь и продолжим изучать древнюю культуру.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_02");	//В древних письменах зодчих скрыты многие и многие тайны, которые мы должны разгадать, если хотим понять, что здесь произошло.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_03");	//Тем временем, некоторые вещи для нас должен сделать ты...
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Что я должен сделать?",DIA_Addon_Saturas_ADWStart_wastun2);
};

func void DIA_Addon_Saturas_ADWStart_wastun2()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_00");	//Что я должен сделать?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_01");	//Ты должен найти Ворона и не дать ему осквернить храм Аданоса.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_02");	//То есть я должен буду УБИТЬ его?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_03");	//Если это будет единственным способом его остановить, то, именем Аданоса, да!
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_04");	//Собирай все древние реликвии и записи зодчих, которые ты найдешь, и приноси их нам.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_05");	//Мы должны узнать как можно больше об этих людях и их гибели.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_06");	//Мы сможем расстроить планы Ворона, только если будем видеть их насквозь.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_07");	//Кроме того, ты должен найти способ освободить рабов.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_08");	//(цинично) И это все? Я сделаю все это одной левой.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_09");	//(раздраженно) Я знаю, что прошу слишком о многом. Воспринимай это как шанс вернуть мое доверие.
	MIS_ADDON_Saturas_GoToRaven = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_RavenKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_RavenKDW,"Ворон оскверняет святой храм Аданоса. Я должен остановить его, даже если мне придется его убить.");
	Log_CreateTopic(TOPIC_Addon_Sklaven,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Sklaven,"Сатурас хочет, чтобы я освободил рабов.");
	Log_CreateTopic(TOPIC_Addon_Relicts,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Relicts,"Сатурас хочет, чтобы я приносил ему все, что поможет узнать новую информацию о зодчих.");
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Тогда я пойду.",DIA_Addon_Saturas_ADWStart_back);
};

func void DIA_Addon_Saturas_ADWStart_back()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_back_15_00");	//Тогда я пойду.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_01");	//Еще одно... Ворон собрал вокруг себя большую шайку бандитов.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_02");	//В твое отсутствие к нам прибыл еще один член Кольца Воды.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_03");	//Мы отправили его на болото. Он не вернулся.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_04");	//Подозреваем, что бандиты нападают на всех, кто выглядит иначе, чем они.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_05");	//Поэтому тебе следует обзавестись такими же доспехами, как у них.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_06");	//Это единственный способ подобраться к ним поближе так, чтобы на тебя сразу же не напали.
	Log_CreateTopic(TOPIC_Addon_BDTRuestung,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung,LOG_Running);
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Бандиты убивают всех, кто не выглядит, как они. Чтобы попасть к ним, мне нужны бандитские доспехи.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Addon_Saturas_PoorRanger(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_PoorRanger_Condition;
	information = DIA_Addon_Saturas_PoorRanger_Info;
	description = "Кем был тот бедняга, которого вы послали на болото?";
};


func int DIA_Addon_Saturas_PoorRanger_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_PoorRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PoorRanger_15_00");	//Кем был тот бедняга, которого вы послали на болото?
	AI_Output(self,other,"DIA_Addon_Saturas_PoorRanger_14_01");	//Его звали Ланс.
	AI_Output(self,other,"DIA_Addon_Saturas_PoorRanger_14_02");	//Боюсь, он не ушел далеко.
	Log_CreateTopic(TOPIC_Addon_Lance,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lance,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Lance,"Сатурас послал на болото человека по имени Ланс. Он боится, что Лансу не удалось далеко уйти.");
};


instance DIA_Addon_Saturas_Piraten(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_Piraten_Condition;
	information = DIA_Addon_Saturas_Piraten_Info;
	description = "Где можно найти бандитские доспехи моего размера?";
};


func int DIA_Addon_Saturas_Piraten_Condition()
{
	if((AlligatorJack.aivar[AIV_TalkedToPlayer] == FALSE) && (Greg.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Piraten_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Piraten_15_00");	//Где можно найти бандитские доспехи моего размера?
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_01");	//Кажется, к западу отсюда был лагерь пиратов.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_02");	//Насколько нам известно, они поддерживают связь с бандитами.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_03");	//Думаю, что они не нападут на тебя, когда ты подойдешь.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_04");	//Возможно, они смогут тебе чем-нибудь помочь.
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Сатурас сказал, что пираты могут помочь мне достать доспехи бандитов.");
};


instance DIA_Addon_Saturas_LanceLeiche(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_LanceLeiche_Condition;
	information = DIA_Addon_Saturas_LanceLeiche_Info;
	description = "Я нашел тело Ланса.";
};


func int DIA_Addon_Saturas_LanceLeiche_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_PoorRanger) && !Npc_HasItems(NONE_Addon_114_Lance_ADW,ItRi_LanceRing))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_LanceLeiche_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_LanceLeiche_15_00");	//Я нашел тело Ланса.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceLeiche_14_01");	//Да пребудет его душа в царстве Аданоса.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceLeiche_14_02");	//Будь осторожней, сынок. Я не хочу скорбеть об еще одной такой потере.
	TOPIC_End_Lance = TRUE;
	B_GivePlayerXP(XP_Addon_LanceLeiche);
};


instance DIA_Addon_Saturas_LanceRing(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_LanceRing_Condition;
	information = DIA_Addon_Saturas_LanceRing_Info;
	description = "У меня аквамариновое кольцо Ланса.";
};


func int DIA_Addon_Saturas_LanceRing_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_LanceLeiche) && Npc_HasItems(other,ItRi_LanceRing))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_LanceRing_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_LanceRing_15_00");	//У меня аквамариновое кольцо Ланса.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceRing_14_01");	//Лучше отдай его мне, чтобы оно не попало в дурные руки.
	B_GiveInvItems(other,self,ItRi_LanceRing,1);
	B_GivePlayerXP(XP_Addon_LanceRing);
};


instance DIA_Addon_Saturas_Tokens(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 10;
	condition = DIA_Addon_Saturas_Tokens_Condition;
	information = DIA_Addon_Saturas_Tokens_Info;
	permanent = TRUE;
	description = "Насчет реликвий...";
};


func int DIA_Addon_Saturas_Tokens_Condition()
{
	if(Saturas_SCBroughtAllToken == FALSE)
	{
		return TRUE;
	};
};


var int DIA_Addon_Saturas_Tokens_OneTime;
var int Saturas_SCBroughtAllToken;
var int Saturas_BroughtTokenAmount;
var int ScBroughtToken;
var int Saturas_SCFound_ItMi_Addon_Stone_01;
var int Saturas_SCFound_ItMi_Addon_Stone_02;
var int Saturas_SCFound_ItMi_Addon_Stone_03;
var int Saturas_SCFound_ItMi_Addon_Stone_04;
var int Saturas_SCFound_ItMi_Addon_Stone_05;

func void DIA_Addon_Saturas_Tokens_Info()
{
	var int BroughtToken;
	var int XP_BroughtTokens;
	var int Kohle;
	AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_00");	//Насчет реликвий...
	if((DIA_Addon_Saturas_Tokens_OneTime == FALSE) && (C_ScHasMagicStonePlate() || Npc_HasItems(other,ItWr_StonePlateCommon_Addon)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_01");	//У меня для тебя кое-что есть.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_02");	//Нам уже известны подобные каменные таблички. От них нам мало прока.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_03");	//Должно же быть что-то еще.
		DIA_Addon_Saturas_Tokens_OneTime = TRUE;
	};
	BroughtToken = 0;
	XP_BroughtTokens = 0;
	if((Npc_HasItems(other,ItMi_Addon_Stone_01) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_02) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_03) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_04) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_05) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_04");	//Как насчет ЭТОГО?
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_05");	//Выглядит неплохо. Где ты это нашел?
		B_LogEntry(TOPIC_Addon_Relicts,"Я отдал Сатурасу следующие реликвии:");
		if(Npc_HasItems(other,ItMi_Addon_Stone_01) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
			Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE;
			BroughtToken += 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_06");	//Бандиты используют эти таблички в качестве денег.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_07");	//На табличках знак Куарходрона, великого воина.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_08");	//Это и есть тот командующий, по вине сына которого, Радемеса, погиб весь город.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_09");	//(презрительно) Бьюсь об заклад, бандиты даже не знают, что они используют вместо денег.
			Log_AddEntry(TOPIC_Addon_Relicts,"Красная каменная табличка. Бандиты используют такие таблички в качестве денег. На ней нанесено имя великого воина Куарходрона.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_02) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_02,1);
			Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE;
			BroughtToken += 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_10");	//Я нашел эту табличку в здании к югу отсюда.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_11");	//A! Табличка стражей мертвых. Вот кто вызывал духов их мертвецов.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_12");	//Зодчие поддерживали очень тесную связь с предками.
			Log_AddEntry(TOPIC_Addon_Relicts,"Фиолетовая каменная табличка из дворца стражей мертвых на юге.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_03) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_03,1);
			Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE;
			BroughtToken += 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_13");	//Я нашел эту табличку в здании к юго-западу отсюда.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_14");	//Судя по табличке, она как-то связана с дворцом городских жрецов.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_15");	//Верховного жреца звали Кардимон. О нем известно немного.
			Log_AddEntry(TOPIC_Addon_Relicts,"Синяя каменная табличка из дворца жрецов на юго-западе.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_04) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_04,1);
			Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE;
			BroughtToken += 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_15");	//Это лежало у здания рядом с огромным болотом.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_16");	//Скорее всего, это был дворец целителей.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_17");	//О них мы знаем немного. Похоже, они исчезли первыми.
			Log_AddEntry(TOPIC_Addon_Relicts,"Зеленая каменная табличка из дворца целителей в южной части болота.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_05) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_05,1);
			Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE;
			BroughtToken += 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_18");	//Эта вещь лежала в большом здании в глубоком ущелье.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_19");	//Это библиотека древнего народа.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_20");	//Предположительно, это табличка ученых.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_80");	//Многие найденные нами письмена ведут к главе касты ученых.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_81");	//Довольно любопытно, что он нигде не оставил своего имени...
			Log_AddEntry(TOPIC_Addon_Relicts,"Желтая каменная табличка из Библиотеки ученых на севере.");
		};
		if(SC_Knows_WeaponInAdanosTempel == TRUE)
		{
		};
		XP_BroughtTokens = XP_Addon_ForOneToken * BroughtToken;
		B_GivePlayerXP(XP_BroughtTokens);
		Saturas_BroughtTokenAmount += BroughtToken;
		if(Saturas_BroughtTokenAmount < 5)
		{
			if(Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_21");	//Очень хорошо. Образ города проясняется, но мы все еще знаем недостаточно.
			};
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_22");	//Всего в этой местности должно быть спрятано пять разных видов табличек.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_23");	//Найди их и принеси мне.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_24");	//Вот немного золота в качестве вознаграждения.
		Kohle = 200 * BroughtToken;
		CreateInvItems(self,ItMi_Gold,Kohle);
		B_GiveInvItems(self,other,ItMi_Gold,Kohle);
		ScBroughtToken = TRUE;
	};
	if(Saturas_BroughtTokenAmount == 5)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_25");	//Теперь мы собрали все необходимые реликвии.
		if(Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_26");	//Ты оказал нам огромную услугу. Благодарю тебя.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_27");	//Благодаря этому мы сделаем в наших исследованиях большой шаг вперед.
		};
		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_28");	//Посмотрим, смогу ли я что-нибудь найти.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_29");	//Хорошо. Но торопись. Время работает против нас.
	};
};


instance DIA_Addon_Saturas_StonePlateHint(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_StonePlateHint_Condition;
	information = DIA_Addon_Saturas_StonePlateHint_Info;
	important = TRUE;
};


func int DIA_Addon_Saturas_StonePlateHint_Condition()
{
	if(((Merdarion_GotFocusCount >= 2) || (RavenIsInTempel == TRUE)) && (Saturas_SCBroughtAllToken == FALSE) && (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_StonePlateHint_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_00");	//Хорошо, что ты пришел. Мы хотим поделиться с тобой новыми открытиями.
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_15_01");	//Рассказывай.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_02");	//Затонувший город когда-то назывался Яркендар. Его народом совместно управляли 5 властителей.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_03");	//У каждого из этих властителей был дворец, в котором властитель жил и держал свое имущество.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_04");	//Поэтому в поисках остатков древней культуры тебе важнее всего исследовать эти дворцы.
	MIS_Saturas_LookingForHousesOfRulers = LOG_Running;
	Info_ClearChoices(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice(DIA_Addon_Saturas_StonePlateHint,"А что, если от них ничего не осталось?",DIA_Addon_Saturas_StonePlateHint_unter);
	Info_AddChoice(DIA_Addon_Saturas_StonePlateHint,"Где мне искать дворцы?",DIA_Addon_Saturas_StonePlateHint_wo);
};

func void DIA_Addon_Saturas_StonePlateHint_wo()
{
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_wo_15_00");	//Где мне искать дворцы?
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_wo_14_01");	//Риордиан изучил устройство зданий в Яркендаре.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_wo_14_02");	//Он скажет, где тебе искать эти дворцы.
	Log_CreateTopic(TOPIC_Addon_HousesOfRulers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers,LOG_Running);
	B_LogEntry(TOPIC_Addon_HousesOfRulers,"Сатурас хочет, чтобы я обыскал дворцы зодчих. Риордиан скажет мне, где найти эти строения.");
};

func void DIA_Addon_Saturas_StonePlateHint_unter()
{
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_unter_15_00");	//А что, если от них ничего не осталось?
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_unter_14_01");	//Если ты не найдешь их, то скорее всего они утонули вместе с городом.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_unter_14_02");	//Однако если они существуют, то их важность для наших исследований невозможно переоценить.
};


instance DIA_Addon_Saturas_SCBroughtAllToken(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_SCBroughtAllToken_Condition;
	information = DIA_Addon_Saturas_SCBroughtAllToken_Info;
	description = "Зачем вам пять каменных табличек?";
};


func int DIA_Addon_Saturas_SCBroughtAllToken_Condition()
{
	if((ScBroughtToken == TRUE) && (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_SCBroughtAllToken_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_SCBroughtAllToken_15_00");	//Зачем вам пять каменных табличек?
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_01");	//Записи, которые мы смогли найти в развалинах, неполные.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_02");	//Но в письменах зодчих говорится о пяти властителях, которые управляли городом.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_03");	//У каждого из них было по одной такой табличке в качестве символа власти.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_04");	//Думаю, разгадка всех наших вопросов именно в этих табличках.
};


instance DIA_Addon_Saturas_Flut(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_Flut_Condition;
	information = DIA_Addon_Saturas_Flut_Info;
	description = "Нефариус рассказал мне про потоп...";
};


func int DIA_Addon_Saturas_Flut_Condition()
{
	if((NefariusADW_Talk2Saturas == TRUE) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Flut_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Flut_15_00");	//Нефариус рассказал мне про потоп...
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_02");	//Написано, что сам Аданос снизошел с небес, чтобы наказать неверных и ввергнуть их в царство мертвых.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_03");	//Объятый святым гневом, он приказал морю обрушиться на строителей города и таким образом стер его с лица земли.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_04");	//Болото к востоку отсюда было свидетелем этих давно минувших событий.
	TOPIC_END_Flut = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Saturas_AdanosZorn(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_AdanosZorn_Condition;
	information = DIA_Addon_Saturas_AdanosZorn_Info;
	description = "Что могло так разгневать Аданоса?";
};


func int DIA_Addon_Saturas_AdanosZorn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_Flut) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_AdanosZorn_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_AdanosZorn_15_00");	//Что могло так разгневать Аданоса?
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_01");	//В свое время храм этого города был великим и знаменитым сооружением.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_02");	//Все почитали его и молились нашему богу Аданосу.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_03");	//Радемес, сын командующего Куарходрона, осквернил храм.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_04");	//В результате этого жители один за другим пали жертвой Зла.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_05");	//Подозреваю, что Аданос не мог простить этого, и его возмездие обрушилось на весь край.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_06");	//Именно поэтому так важно остановить Ворона. Он собирается сделать то же самое...
};


instance DIA_Addon_Saturas_RavenInfos(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 9;
	condition = DIA_Addon_Saturas_RavenInfos_Condition;
	information = DIA_Addon_Saturas_RavenInfos_Info;
	permanent = TRUE;
	description = "Насчет Ворона...";
};


var int DIA_Addon_Saturas_RavenInfos_OneTime1;
var int DIA_Addon_Saturas_RavenInfos_OneTime2;
var int DIA_Addon_Saturas_RavenInfos_OneTime3;
var int DIA_Addon_Saturas_RavenInfos_OneTime4;
var int DIA_Addon_Saturas_RavenInfos_OneTime5;
var int Addon_Saturas_Fortuno;

func int DIA_Addon_Saturas_RavenInfos_Condition()
{
	if((MIS_ADDON_Saturas_GoToRaven == LOG_Running) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_RavenInfos_Info()
{
	var int RavenNeuigkeit;
	var int XP_RavenNeuigkeit;
	AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_00");	//Насчет Ворона...
	RavenNeuigkeit = 0;
	if((Thorus.aivar[AIV_TalkedToPlayer] == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime1 == FALSE) && (RavenIsInTempel == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_01");	//Я побывал в лагере бандитов к востоку отсюда. Ворон - их предводитель.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_02");	//Но прежде чем оказаться рядом с Вороном, я был вынужден убрать с дороги нескольких бандитов.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_03");	//Отлично. Удачи. Но не забывай, что тебе нужно действовать быстро.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_04");	//Ворон ни при каких обстоятельствах не должен достигнуть цели.
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE;
		RavenNeuigkeit += 1;
	};
	if((SC_KnowsRavensGoldmine == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime2 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_05");	//Он владеет золотым рудником и заключенными, добывающими золото.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_06");	//Это на него похоже. Ты должен освободить узников.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_07");	//(вздыхает) Да, конечно. Я работаю над этим.
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE;
		RavenNeuigkeit += 1;
	};
	if((SC_KnowsFortunoInfos == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_08");	//Один парень из бандитов заявляет, что знает о планах Ворона.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_09");	//Его зовут Фортуно. Он говорит, что Ворон хочет проникнуть в храм, чтобы завладеть могущественным артефактом.
		AI_Output(self,other,"DIA_Addon_Bodo_14_03");	//И? Знал ли он еще что-нибудь про этот артефакт?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_11");	//Он рассказал мне только о том, что Ворон вскрыл гробницу жреца Аданоса.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_12");	//В этой гробнице может быть ключ от храма. Осмотри ее.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_13");	//Ворон заставил узников раскопать гробницу жреца.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_14");	//Плохо. Ты должен поторопиться и остановить Ворона.
		Addon_Saturas_Fortuno = TRUE;
		DIA_Addon_Saturas_RavenInfos_OneTime3 = TRUE;
		RavenNeuigkeit += 1;
	};
	if((RavenIsInTempel == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime4 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_15");	//Я пробрался в покои Ворона.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_16");	//И? Что с Вороном?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_17");	//Я опоздал. Он скрылся в храме Аданоса у меня на глазах.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_18");	//(взволнованно) Что?! Это КАТАСТРОФА! Почему ты не последовал за ним?!
		DIA_Addon_Saturas_RavenInfos_OneTime4 = TRUE;
		MIS_ADDON_Saturas_GoToRaven = LOG_SUCCESS;
		RavenNeuigkeit += 1;
	};
	if(RavenNeuigkeit != 0)
	{
		XP_RavenNeuigkeit = RavenNeuigkeit * XP_Ambient;
		B_GivePlayerXP(XP_RavenNeuigkeit);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_19");	//Ты можешь рассказать что-то новое?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_20");	//Нет, пока ничего.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_21");	//Мой тебе совет: не стоит недооценивать Ворона. Запомни это.
	};
};


instance DIA_Addon_Saturas_TuerZu(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_TuerZu_Condition;
	information = DIA_Addon_Saturas_TuerZu_Info;
	description = "Я не смог последовать за Вороном. Он закрыл вход изнутри.";
};


func int DIA_Addon_Saturas_TuerZu_Condition()
{
	if((MIS_ADDON_Saturas_GoToRaven == LOG_SUCCESS) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_TuerZu_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_00");	//Я не смог последовать за Вороном. Он закрыл вход изнутри.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_02");	//Я должен подумать...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_03");	//Нам нужно понять, как Ворон смог попасть в храм...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_04");	//Что он делал перед тем, как открыть проход в храм?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_05");	//Прочитал перед воротами заклинание.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_06");	//А до этого?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_07");	//Он вскрыл гробницу жреца.
	if(Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_09");	//Я же тебе об этом уже говорил...
		AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_10");	//Верно!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_08");	//Я знаю только то, что он провел там какой-то ритуал...
	};
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_11");	//(задумчиво) Ритуал...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_12");	//Да! Правильно!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_13");	//Боюсь, Ворон получил силу стражей мертвых.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_14");	//Он получил знание о том, как попасть в храм, у духа!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_15");	//Ты должен рассказать об этом Миксиру!
	Log_CreateTopic(TOPIC_Addon_Quarhodron,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron,LOG_Running);
	B_LogEntry(TOPIC_Addon_Quarhodron,"Ворон обрел силу стражей мертвых. Он получил от призрака знания о храме Аданоса. Я должен рассказать об этом Миксиру.");
	Saturas_RiesenPlan = TRUE;
};


instance DIA_Addon_Saturas_GhostQuestions(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_GhostQuestions_Condition;
	information = DIA_Addon_Saturas_GhostQuestions_Info;
	description = "Я говорил с Куарходроном.";
};


func int DIA_Addon_Saturas_GhostQuestions_Condition()
{
	if(!Npc_IsDead(Quarhodron) && (SC_TalkedToGhost == TRUE) && (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_GhostQuestions_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_00");	//Я говорил с Куарходроном.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_01");	//Что же он тебе сказал?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_02");	//Что он поможет мне только в том случае, если я отвечу на его вопросы.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_03");	//И в чем проблема?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_04");	//Я не знаю правильных ответов.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_05");	//Хм-м... Нам известно, что на севере отсюда находится библиотека ученых.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_06");	//Ученые тщательно записывали сведения обо всех важных событиях прошлого.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_07");	//Возможно, в библиотеке ты найдешь ответы на вопросы Куарходрона.
	B_LogEntry(TOPIC_Addon_Quarhodron,"Сатурас думает, что я смогу найти ответы на вопросы Куарходрона в библиотеке ученых. Она находится далеко на севере.");
};


instance DIA_Addon_Saturas_TalkedToGhost(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_TalkedToGhost_Condition;
	information = DIA_Addon_Saturas_TalkedToGhost_Info;
	description = "Проблема с воротами храма решена.";
};


func int DIA_Addon_Saturas_TalkedToGhost_Condition()
{
	if((Ghost_SCKnowsHow2GetInAdanosTempel == TRUE) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_TalkedToGhost_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_00");	//Проблема с воротами храма решена.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_01");	//Дух заговорил?
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_02");	//Да.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_03");	//Значит, ты знаешь, как попасть в храм?
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_04");	//Именно так. И еще дух рассказал мне, что ждет меня внутри.
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_05");	//Он говорил о могущественном мече и залах Аданоса.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_06");	//(в отчаянии) О, Аданос! Какие же мы глупцы. Как мы могли быть так слепы?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_07");	//В записях же все сказано...
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_08");	//Этот меч - не что иное, как Коготь Белиара.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_09");	//Мы должны как можно скорее пройти через Залы Аданоса и забрать меч.
	Info_ClearChoices(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice(DIA_Addon_Saturas_TalkedToGhost,"А что это за Коготь Белиара?",DIA_Addon_Saturas_TalkedToGhost_wasistdas);
	Info_AddChoice(DIA_Addon_Saturas_TalkedToGhost,"Что такое эти Залы Аданоса?",DIA_Addon_Saturas_TalkedToGhost_kammern);
};

func void DIA_Addon_Saturas_TalkedToGhost_wasistdas()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00");	//А что это за Коготь Белиара?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01");	//Воплощение чистого Зла. Белиар своими руками выковал этот меч.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02");	//Владелец меча получает в свои руки ужасное орудие разрушения.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03");	//И чем могущественнее владелец, тем больше становится сила Когтя.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04");	//Только самые непреклонные и сильные духом могут устоять перед ним.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05");	//Теперь мне понятно, почему зодчие закрыли свою долину.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06");	//Они впустили в этот мир орудие Зла и поддались его темному влиянию.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07");	//Злоба и жадность заставляла их уничтожать друг друга.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08");	//Наконец, терпение Аданоса истощилось, и он обрушил на долину свой гнев, затопив ее в море.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09");	//Создатели портала поступили мудро, спрятав город от остального мира.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10");	//Какой трагический конец древней культуры!
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11");	//Теперь ты понимаешь всю важность твоего задания?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12");	//Ворон - опытный боец, а жажда власти ослепила его.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13");	//В его руках Коготь будет неудержимым оружием разрушения.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14");	//Ворон не должен завладеть Когтем, иначе все будет потеряно.
	Log_CreateTopic(TOPIC_Addon_Klaue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue,LOG_Running);
	B_LogEntry(TOPIC_Addon_Klaue,"В храме Аданоса находится могучее оружие. Оно называется 'Коготь Белиара'. Ворон не должен получить его в свои руки!");
};

func void DIA_Addon_Saturas_TalkedToGhost_kammern()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_kammern_15_00");	//Что такое эти Залы Аданоса?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_01");	//Теперь нам известно, что не только ворота закрывают доступ к тому, что спрятано в глубинах храма.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_02");	//На твоем пути встретятся три зала, каждый из которых предназначен для того, чтобы уничтожить любого непрошеного гостя.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_03");	//Ключ к тому, чтобы решить загадки Залов Аданоса - цветные реликвии зодчих.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_04");	//Когда ты соберешь все реликвии и поймешь, о чем говорят нанесенные на них надписи, ты сможешь попасть во внутреннее святилище храма.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_05");	//Не знаю, смог ли Ворон решить головоломки храма, но если ему это удалось, то у нас начнутся большие неприятности.
	Log_CreateTopic(TOPIC_Addon_Kammern,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern,LOG_Running);
	B_LogEntry(TOPIC_Addon_Kammern,LogText_Addon_Relicts);
	Log_CreateTopic(TOPIC_Addon_Relicts,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Relicts,LogText_Addon_Relicts);
	Saturas_KnowsHow2GetInTempel = TRUE;
	B_CheckLog();
};


instance DIA_Addon_Saturas_RelictsBack(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_RelictsBack_Condition;
	information = DIA_Addon_Saturas_RelictsBack_Info;
	description = "Как именно реликвии помогут мне в храме?";
};


func int DIA_Addon_Saturas_RelictsBack_Condition()
{
	if((Saturas_SCBroughtAllToken == TRUE) && (Saturas_KnowsHow2GetInTempel == TRUE) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_RelictsBack_Info()
{
	var string concatText;
	AI_Output(other,self,"DIA_Addon_Saturas_RelictsBack_15_00");	//Как именно реликвии помогут мне в храме?
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_03");	//Мы слишком мало знаем, чтобы я мог сказать тебе это. Надеюсь, что, оказавшись в храме, ты поймешь все сам.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_05");	//Извини, но больше я ничего сказать не могу. Теперь все зависит от тебя.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_06");	//Возьми реликвии и как можно скорее отправляйся в храм.
	CreateInvItems(hero,ItMi_Addon_Stone_01,1);
	CreateInvItems(hero,ItMi_Addon_Stone_02,1);
	CreateInvItems(hero,ItMi_Addon_Stone_03,1);
	CreateInvItems(hero,ItMi_Addon_Stone_04,1);
	CreateInvItems(hero,ItMi_Addon_Stone_05,1);
	concatText = ConcatStrings(IntToString(5),PRINT_ItemsErhalten);
	AI_PrintScreen(concatText,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	B_LogEntry(TOPIC_Addon_Kammern,"Сатурас послал меня в храм, вручив мне пять реликвий зодчих. Я должен пройти через залы храма и остановить Ворона.");
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_07");	//Да защитит нас милость Аданоса!
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_08");	//Возможно, еще не слишком поздно.
};


instance DIA_Addon_Saturas_RavensDead(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_RavensDead_Condition;
	information = DIA_Addon_Saturas_RavensDead_Info;
	important = TRUE;
};


func int DIA_Addon_Saturas_RavensDead_Condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_RavensDead_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_00");	//Землетрясения прекратились, а ты, как вижу, еще жив.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_01");	//Это значит, что ты сделал то, что должен был сделать?
	AI_Output(other,self,"DIA_Addon_Saturas_RavensDead_15_02");	//Да. Ворон мертв.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_03");	//Значит, все кончено. Слава Аданосу.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_04");	//Ты сделал славное дело, сын мой. Мы все перед тобой в долгу.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_05");	//Ты вырвал мощное оружие из лап Зла и восстановил равновесие в этой части мира.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_06");	//Когда закончились землетрясения, мы обсудили план дальнейших действий и пришли к соглашению.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_07");	//Возьми Коготь Белиара. Отныне - ты его хозяин.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_08");	//В твоих руках он станет орудием справедливости.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_09");	//Используй его разумно, сын мой. И да поможет тебе Аданос.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_11");	//Мы останемся здесь и восстановим храм во всем его прежнем великолепии.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_12");	//Обратно отправился только Миксир. Он поможет Ватрасу.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_13");	//Слишком долго Ватрас оставался в городе один.
	Log_CreateTopic(TOPIC_Addon_VatrasAbloesung,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung,LOG_Running);
	B_LogEntry(TOPIC_Addon_VatrasAbloesung,"Миксира послали на помощь Ватрасу.");
	B_GivePlayerXP(XP_Addon_Saturas_RavensDead);
};


instance DIA_Addon_Saturas_FreedMissingPeople(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_FreedMissingPeople_Condition;
	information = DIA_Addon_Saturas_FreedMissingPeople_Info;
	description = "Я освободил пленников.";
};


func int DIA_Addon_Saturas_FreedMissingPeople_Condition()
{
	if(Sklaven_Flucht == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_FreedMissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_FreedMissingPeople_15_00");	//Я освободил пленников.
	AI_Output(self,other,"DIA_Addon_Saturas_FreedMissingPeople_14_01");	//Очень хорошо. Надеюсь, они попадут домой в целости и сохранности.
	B_GivePlayerXP(XP_Addon_Saturas_FreedMissingPeople);
};


instance DIA_Addon_Saturas_BeliarsWeapon(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_BeliarsWeapon_Condition;
	information = DIA_Addon_Saturas_BeliarsWeapon_Info;
	description = "Я забрал Коготь Белиара.";
};


func int DIA_Addon_Saturas_BeliarsWeapon_Condition()
{
	if(C_ScHasBeliarsWeapon() && (RavenIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_BeliarsWeapon_Info()
{
//	AI_UnequipWeapons(hero);
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_15_00");	//Я забрал Коготь Белиара.
	if(Npc_HasItems(hero,ItMw_BeliarWeapon_Raven) && (SC_FailedToEquipBeliarsWeapon == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_15_01");	//Но я не могу его использовать!
	};
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_02");	//Коготь Белиара - необычное оружие.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_03");	//У него есть свой разум и своя воля.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_04");	//Являясь его владельцем, ты становишься его хозяином и повелителем.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_05");	//А он становится частью тебя и подстраивается под твои возможности.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_06");	//Однако по своей воле он этого делать не станет.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_07");	//Лишь сам Белиар может заставить его покориться тебе.
	Info_ClearChoices(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice(DIA_Addon_Saturas_BeliarsWeapon,"А как заставить Белиара помочь мне?",DIA_Addon_Saturas_BeliarsWeapon_besser);
	Info_AddChoice(DIA_Addon_Saturas_BeliarsWeapon,"Что же мне делать с этим оружием?",DIA_Addon_Saturas_BeliarsWeapon_wastun);
};

func void DIA_Addon_Saturas_BeliarsWeapon_wastun()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00");	//Что же мне делать с этим оружием?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01");	//Решать тебе. Ты завоевал меч, и ты теперь его хозяин.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02");	//Я могу лишь дать тебе совет.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03");	//Ты можешь или отдать его мне, и я прослежу, чтобы он больше никогда не попал в руки Зла...
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04");	//... или покорить его силу и использовать меч в сражениях.
	Info_AddChoice(DIA_Addon_Saturas_BeliarsWeapon,"Ты можешь сохранить меч?",DIA_Addon_Saturas_BeliarsWeapon_geben);
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_geben_15_00");	//Ты можешь сохранить меч?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_geben_14_03");	//Если ты отдашь его мне, я лишу меч его сил, и он больше никогда не сможет послужить Злу.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_geben_14_04");	//Так что решай. Выбор за тобой.
	Log_CreateTopic(TOPIC_Addon_Klaue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue,LOG_Running);
	B_LogEntry(TOPIC_Addon_Klaue,"Я могу отдать Коготь Белиара Сатурасу или оставить его себе.");
};

func void DIA_Addon_Saturas_BeliarsWeapon_besser()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_besser_15_00");	//А как заставить Белиара помочь мне?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_01");	//Этого можно добиться, помолившись ему.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_02");	//Но будь осторожен! Белиар зол и коварен.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_03");	//Если ты вызовешь его недовольство, он обрушит на тебя свой гнев.
	Log_CreateTopic(TOPIC_Addon_Klaue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Klaue,"Чтобы подчинить Коготь своей воле, я должен помолиться Белиару.");
	B_Say(other,self,"$VERSTEHE");
};


instance DIA_Addon_Saturas_PermENDE_ADDON(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_PermENDE_ADDON_Condition;
	information = DIA_Addon_Saturas_PermENDE_ADDON_Info;
	permanent = TRUE;
	description = "Что вы будете делать дальше?";
};


func int DIA_Addon_Saturas_PermENDE_ADDON_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_RavensDead))
	{
		return TRUE;
	};
};


var int DIA_Addon_Saturas_PermENDE_ADDON_OneTime;

func void DIA_Addon_Saturas_PermENDE_ADDON_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PermENDE_ADDON_15_00");	//Что вы будете делать дальше?
	AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_01");	//Мы останемся здесь и вернем храму его былую славу.
	AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_02");	//Слишком долго он простоял в таком плачевном состоянии.
	if(DIA_Addon_Saturas_PermENDE_ADDON_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_03");	//Если тебя это интересует, сын мой...
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_04");	//Я рад, что не ошибся в тебе. Ты - истинный Хранитель Равновесия. У меня больше нет в этом сомнений.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_05");	//Если бы не твоя отвага и сила, весь остров был бы разрушен. Мы благодарим тебя за твое великое дело.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_06");	//Теперь ты должен посвятить себя другим задачам и вернуть на наши земли мир и равновесие.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_07");	//Ступай и исполни свое предназначение, Хранитель. Мы будем молиться за тебя.
		DIA_Addon_Saturas_PermENDE_ADDON_OneTime = TRUE;
	};
};


instance DIA_Addon_Saturas_BeliarWeapGeben(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_BeliarWeapGeben_Condition;
	information = DIA_Addon_Saturas_BeliarWeapGeben_Info;
	description = "Возьми Коготь Белиара и уничтожь его.";
};


func int DIA_Addon_Saturas_BeliarWeapGeben_Condition()
{
	if(C_ScHasBeliarsWeapon() && (RavenIsDead == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Saturas_BeliarsWeapon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_BeliarWeapGeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGeben_15_00");	//Возьми Коготь Белиара и уничтожь его.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_01");	//Как скажешь, сын мой. Дай мне Коготь.
	B_ClearBeliarsWeapon();
	AI_PrintScreen(PRINT_ItemGegeben,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_02");	//Теперь Коготь лишен своей силы. Я утоплю его в глубинах моря.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_03");	//Мудрость Аданоса укроет его от Зла.
	TOPIC_END_Klaue = TRUE;
	B_GivePlayerXP(XP_Addon_BeliarsWeaponAbgegeben);
	Saturas_KlaueInsMeer = TRUE;
};


instance DIA_Addon_Saturas_ADW_PreTeachCircle(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 10;
	condition = DIA_Addon_Saturas_ADW_PreTeachCircle_Condition;
	information = DIA_Addon_Saturas_ADW_PreTeachCircle_Info;
	description = "Ты можешь обучить меня кругам магии?";
};


func int DIA_Addon_Saturas_ADW_PreTeachCircle_Condition()
{
	if((hero.guild == GIL_KDF) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_PreTeachCircle_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PreTeachCircle_15_00");	//Ты можешь обучить меня кругам магии?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_01");	//Ты - маг Огня. Что скажет Пирокар, если узнает, что я обучал тебя?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PreTeachCircle_15_02");	//Он не узнает.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_03");	//(вздыхает) Вижу, ты серьезно настроен учиться. Что ж, я выполню твою просьбу.
	if(RavenIsDead == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_04");	//Однако, если я узнаю, что ты передаешь наши знания в чужие руки, ты больше не сможешь рассчитывать на мою помощь.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_05");	//Не разочаруй меня.
	};
	Saturas_Addon_TeachCircle = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_SaturasTeach);
};


instance DIA_Addon_Saturas_ADW_CIRCLE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 99;
	condition = DIA_Addon_Saturas_ADW_CIRCLE_Condition;
	information = DIA_Addon_Saturas_ADW_CIRCLE_Info;
	permanent = TRUE;
	description = "Я хочу перейти на следующий уровень магии.";
};


var int DIA_Addon_Saturas_ADW_CIRCLE_NoPerm;

func int DIA_Addon_Saturas_ADW_CIRCLE_Condition()
{
	var int circle;
	var int kosten;
	circle = Npc_GetTalentSkill(other,NPC_TALENT_MAGE) + 1;
	kosten = B_GetLearnCostTalent(other,NPC_TALENT_MAGE,circle);
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 6) && (Saturas_Addon_TeachCircle == TRUE) && (DIA_Addon_Saturas_ADW_CIRCLE_NoPerm == FALSE))
	{
		DIA_Addon_Saturas_ADW_CIRCLE.description = B_BuildLearnString("Я хочу перейти на следующий уровень магии.",kosten);
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_CIRCLE_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CIRCLE_15_00");	//Я хочу перейти на следующий уровень магии.
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (Kapitel >= 2))
	{
		if(B_TeachMagicCircle(self,other,2))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_01");	//Да, ты готов увеличить свои знания.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_02");	//Вступи же во второй круг магии! Да поможет тебе Аданос мудро распоряжаться дарованными тебе знаниями.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Kapitel >= 3))
	{
		if(B_TeachMagicCircle(self,other,3))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_03");	//Время пришло. Вступи же в третий круг магии!
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_04");	//Теперь ты сможешь применять более мощные заклинания. Используя их, будь рассудителен.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (MIS_ReadyforChapter4 == TRUE))
	{
		if(B_TeachMagicCircle(self,other,4))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_05");	//Время пришло. Ты готов вступить в четвертый круг магии.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_06");	//Да будут могущественными твои слова и деяния! Но не используй свои силы безрассудно.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (Kapitel >= 5))
	{
		if(B_TeachMagicCircle(self,other,5))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_07");	//Ты удостоен чести вступить в пятый круг магии.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_08");	//Заклинания, которые тебе откроются, обладают огромной разрушительной мощью.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_09");	//Держи себя под контролем! Не дай мании величия овладеть тобой.
		};
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_10");	//Это не в моих силах.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_11");	//Чтобы вступить в последний, шестой круг магии, ты должен отправиться в монастырь магов Огня.
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_12");	//Ты еще не готов к этому. Возвращайся позже.
	};
};

