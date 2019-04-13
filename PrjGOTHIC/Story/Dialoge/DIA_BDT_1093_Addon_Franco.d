
instance DIA_Addon_Franco_EXIT(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 999;
	condition = DIA_Addon_Franco_EXIT_Condition;
	information = DIA_Addon_Franco_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Franco_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Franco_EXIT_Info()
{
	if((Franco_Exit == FALSE) && (MIS_HlpLogan == LOG_Running))
	{
		AI_Output(self,other,"DIA_Addon_Franco_EXIT_08_00");	//Не потеряйся, или пойдешь на корм болотным акулам.
		Franco_Exit = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Franco_PICKPOCKET(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 900;
	condition = DIA_Franco_PICKPOCKET_Condition;
	information = DIA_Franco_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Украсть его амулет будет довольно рискованно)";
};


func int DIA_Franco_PICKPOCKET_Condition()
{
	return C_StealItems(60,Hlp_GetInstanceID(ItAm_Addon_Franco),1);
};

func void DIA_Franco_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Franco_PICKPOCKET);
	Info_AddChoice(DIA_Franco_PICKPOCKET,Dialog_Back,DIA_Franco_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Franco_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Franco_PICKPOCKET_DoIt);
};

func void DIA_Franco_PICKPOCKET_DoIt()
{
	B_StealItems(60,Hlp_GetInstanceID(ItAm_Addon_Franco),1);
	Info_ClearChoices(DIA_Franco_PICKPOCKET);
};

func void DIA_Franco_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Franco_PICKPOCKET);
};


instance DIA_Addon_Franco_HI(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 1;
	condition = DIA_Addon_Franco_HI_Condition;
	information = DIA_Addon_Franco_HI_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Franco_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Franco_HI_Info()
{
	Log_CreateTopic(Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Franco,LOG_Running);
	B_LogEntry(Topic_Addon_Franco,"Если я выполню задания Франко, он впустит меня в лагерь.");
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_00");	//Эй, что ты здесь делаешь? Ты хочешь попасть в лагерь?
	AI_Output(other,self,"DIA_Addon_Franco_HI_15_01");	//Да, я...
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_02");	//Меня не интересует, кто ты такой. Меня зовут Франко. Я здесь командую.
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_03");	//Если ты будешь хорошо работать, я отправлю тебя в лагерь.
	if(Ramon_News == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Franco_HI_08_04");	//Стражник Рамон может тебе сказать, нужны ли в лагере новые люди. Поговори с ним.
		B_LogEntry(Topic_Addon_Franco,"Я должен спросить Рамона, нужны ли в лагере еще люди.");
	};
};


instance DIA_Addon_Franco_Hai(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 2;
	condition = DIA_Addon_Franco_Hai_Condition;
	information = DIA_Addon_Franco_Hai_Info;
	permanent = FALSE;
	description = "Торусу нужен новый человек.";
};


func int DIA_Addon_Franco_Hai_Condition()
{
	if(Ramon_News == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_Hai_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_00");	//Торусу нужен новый человек.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_01");	//Хорошо, я позабочусь об этом.
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_02");	//Минуточку, а как же я?
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_03");	//Ты еще ничего не сделал.
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_04");	//Я сделал довольно много, вот только ты об этом не знаешь.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_05");	//Ну хорошо. Тебе нужен шанс? Ты его получишь. Тащи свою задницу к Логану. Его замучили болотные акулы.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_06");	//Помоги ему расправиться с чудовищами и считай, что ты в лагере.
	B_LogEntry(Topic_Addon_Franco,"Франко хочет, чтобы я помог Логану.");
};


instance DIA_Addon_Franco_Wo(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 3;
	condition = DIA_Addon_Franco_Wo_Condition;
	information = DIA_Addon_Franco_Wo_Info;
	permanent = FALSE;
	description = "Где мне найти Логана?";
};


func int DIA_Addon_Franco_Wo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_Hai) && !Npc_IsDead(Logan) && (MIS_HlpLogan == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_Wo_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Wo_15_00");	//Где мне найти Логана?
	AI_Output(self,other,"DIA_Addon_Franco_Wo_08_01");	//Если ты стоишь лицом к входу в лагерь, то тебе надо идти налево, вдоль скалы. Чтобы встретиться с Логаном, пройди немного вглубь болота.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Franco_tot(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 5;
	condition = DIA_Addon_Franco_tot_Condition;
	information = DIA_Addon_Franco_tot_Info;
	permanent = FALSE;
	description = "Логан мертв.";
};


func int DIA_Addon_Franco_tot_Condition()
{
	if((MIS_HlpLogan != LOG_SUCCESS) && Npc_IsDead(Logan) && Npc_KnowsInfo(other,DIA_Addon_Franco_Hai))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_tot_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_tot_15_00");	//Логан мертв.
	AI_Output(self,other,"DIA_Addon_Franco_tot_08_01");	//Черт! Он был нашим лучшим охотником. Дьявол, опять эти проблемы.
	AI_Output(self,other,"DIA_Addon_Franco_tot_08_02");	//Ну ладно. Но я уже послал в лагерь другого человека.
	if(MIS_HlpLogan == LOG_Running)
	{
		MIS_HlpLogan = LOG_OBSOLETE;
		B_CheckLog();
	};
};


instance DIA_Addon_Franco_HaiSuccess(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 6;
	condition = DIA_Addon_Franco_HaiSuccess_Condition;
	information = DIA_Addon_Franco_HaiSuccess_Info;
	permanent = FALSE;
	description = "Я помог Логану.";
};


func int DIA_Addon_Franco_HaiSuccess_Condition()
{
	if((MIS_HlpLogan == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Franco_Hai))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_HaiSuccess_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_HaiSuccess_15_00");	//Я помог Логану.
	if(Npc_IsDead(Logan))
	{
		AI_Output(other,self,"DIA_Addon_Franco_HaiSuccess_15_01");	//Но он не выжил.
	};
	AI_Output(self,other,"DIA_Addon_Franco_HaiSuccess_08_02");	//Итак, ты победил болотных акул. Следовательно, ты полезен... но по крайней мере, полезнее, чем большинство местных бездельников.
	B_GivePlayerXP(XP_Addon_HlpLogan);
	B_LogEntry(Topic_Addon_Franco,"Одной помощи Логану оказалось недостаточно для того, чтобы попасть в лагерь.");
};


instance DIA_Addon_Franco_Mis2(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 7;
	condition = DIA_Addon_Franco_Mis2_Condition;
	information = DIA_Addon_Franco_Mis2_Info;
	permanent = FALSE;
	description = "Теперь я могу пройти в лагерь?";
};


func int DIA_Addon_Franco_Mis2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_HaiSuccess) || Npc_KnowsInfo(other,DIA_Addon_Franco_tot))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_Mis2_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_MIS2_15_00");	//Теперь я могу пройти в лагерь?
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_01");	//Послушай, мне нужно, чтобы ты выполнил еще одно мое поручение.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_02");	//Несколько дней назад я послал на болото Эдгора.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_03");	//Он должен был добыть для меня древнюю каменную табличку. Но с тех пор его никто не видел.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_04");	//Узнай, что он делает, и принеси мне эту чертову табличку!
	MIS_HlpEdgor = LOG_Running;
	Log_CreateTopic(Topic_Addon_Stoneplate,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Stoneplate,LOG_Running);
	B_LogEntry(Topic_Addon_Stoneplate,"Франко нужна каменная табличка, которую должен был принести ему Эдгор. Теперь это моя забота.");
	B_LogEntry(Topic_Addon_Franco,"Франко хочет, чтобы я помог Эдгору.");
};


instance DIA_Addon_Franco_While(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 8;
	condition = DIA_Addon_Franco_While_Condition;
	information = DIA_Addon_Franco_While_Info;
	permanent = FALSE;
	description = "А что насчет золота?";
};


func int DIA_Addon_Franco_While_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_HaiSuccess))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_While_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_While_15_00");	//А что насчет золота?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_01");	//Что?
	AI_Output(other,self,"DIA_Addon_Franco_While_15_02");	//Что я получу за свою работу на болоте?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_03");	//(дружелюбно) А, тебе нужно золото? Ну конечно! Сколько ты хочешь? Пятьдесят самородков? Сто? Я дам тебе столько, сколько ты сможешь унести...
	AI_Output(self,other,"DIA_Addon_Franco_While_08_04");	//(кричит) Да кто ты такой?! Ты что, хочешь сделать из меня идиота?!
	AI_Output(self,other,"DIA_Addon_Franco_While_08_05");	//Шевели своей задницей и делай, что тебе говорят! Иначе ты к золоту и близко не подойдешь!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Franco_WOEDGOR(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 9;
	condition = DIA_Addon_Franco_WOEDGOR_Condition;
	information = DIA_Addon_Franco_WOEDGOR_Info;
	permanent = TRUE;
	description = "И где же мне найти этого Эдгора?";
};


func int DIA_Addon_Franco_WOEDGOR_Condition()
{
	if((MIS_HlpEdgor == LOG_Running) && !Npc_HasItems(other,ItMi_Addon_Stone_04) && !Npc_KnowsInfo(other,DIA_Addon_Edgor_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_WOEDGOR_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_15_00");	//(вздыхает) И где же мне найти этого Эдгора?
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_08_01");	//Тебе легкий путь или быстрый?
	Info_ClearChoices(DIA_Addon_Franco_WOEDGOR);
	Info_AddChoice(DIA_Addon_Franco_WOEDGOR,"Я выбираю быстрый путь.",DIA_Addon_Franco_WOEDGOR_Fast);
	Info_AddChoice(DIA_Addon_Franco_WOEDGOR,"Скажи мне легкий путь.",DIA_Addon_Franco_WOEDGOR_Easy);
};

func void B_Addon_Franco_There()
{
	AI_Output(self,other,"DIA_Addon_Franco_There_08_00");	//Здесь везде развалины. Он наверняка сидит где-то там.
	AI_Output(self,other,"DIA_Addon_Franco_There_08_01");	//Думаю, ему хватило ума развести костер. Надеюсь, костер-то ты сможешь найти?
};

func void DIA_Addon_Franco_WOEDGOR_Easy()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_Easy_15_00");	//Скажи мне легкий путь.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_01");	//Иди по пути, ведущему к главным воротам. Там ты встретишь Санчо.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_02");	//Оттуда иди налево по деревянной дорожке.
	B_Addon_Franco_There();
	Info_ClearChoices(DIA_Addon_Franco_WOEDGOR);
};

func void DIA_Addon_Franco_WOEDGOR_Fast()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_Fast_15_00");	//Я выбираю быстрый путь.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Fast_08_01");	//Хорошо. Иди отсюда по диагонали налево. Направляйся вглубь болота, минуя деревянную дорожку.
	B_Addon_Franco_There();
	Info_ClearChoices(DIA_Addon_Franco_WOEDGOR);
};


instance DIA_Addon_Franco_tafel(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 10;
	condition = DIA_Addon_Franco_tafel_Condition;
	information = DIA_Addon_Franco_tafel_Info;
	permanent = FALSE;
	description = "Вот твоя каменная табличка.";
};


func int DIA_Addon_Franco_tafel_Condition()
{
	if(Npc_HasItems(other,ItMi_Addon_Stone_04) && (MIS_HlpEdgor == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_tafel_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_tafel_15_00");	//Вот твоя каменная табличка.
	B_GiveInvItems(other,self,ItMi_Addon_Stone_04,1);
	AI_Output(self,other,"DIA_Addon_Franco_tafel_08_01");	//Очень хорошо. Ворон будет доволен.
	MIS_HlpEdgor = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_HlpEdgor);
	B_LogEntry(Topic_Addon_Franco,"Я принес Франко его каменную табличку.");
};


instance DIA_Addon_Franco_JemandAnderen(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 11;
	condition = DIA_Addon_Franco_JemandAnderen_Condition;
	information = DIA_Addon_Franco_JemandAnderen_Info;
	permanent = FALSE;
	description = "Ну что, теперь-то наконец я попаду в лагерь?";
};


func int DIA_Addon_Franco_JemandAnderen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_tafel))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_JemandAnderen_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_JemandAnderen_15_00");	//Ну что, теперь-то наконец я попаду в лагерь?
	if(!Npc_IsDead(Logan))
	{
		AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_01");	//Нет, я уже отправил туда Логана. Он был перед тобой в списке.
		Logan_Inside = TRUE;
		AI_Teleport(Logan,"BL_INN_CORNER_02");
		B_StartOtherRoutine(Logan,"LAGER");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_02");	//Нет, я уже послал в лагерь другого человека.
	};
	AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_03");	//И больше люди в лагере не нужны.
	AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_04");	//К тому же теперь, когда Логана больше здесь нет, я смогу использовать вместо него тебя.
	B_LogEntry(Topic_Addon_Franco,"Франко не пускает меня в лагерь. Думаю, придется с ним разобраться...");
};


instance DIA_Addon_Franco_Fight(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 12;
	condition = DIA_Addon_Franco_Fight_Condition;
	information = DIA_Addon_Franco_Fight_Info;
	permanent = TRUE;
	description = "Немедленно впусти меня в лагерь!";
};


func int DIA_Addon_Franco_Fight_Condition()
{
	return TRUE;
};

func void DIA_Addon_Franco_Fight_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_15_00");	//Немедленно впусти меня в лагерь!
	AI_Output(self,other,"DIA_Addon_Franco_Fight_08_01");	//А что, если я откажусь?
	Info_ClearChoices(DIA_Addon_Franco_Fight);
	Info_AddChoice(DIA_Addon_Franco_Fight,"Ладно, я подожду...",DIA_Addon_Franco_Fight_Nothing);
	Info_AddChoice(DIA_Addon_Franco_Fight,"Тогда ты об этом пожалеешь.",DIA_Addon_Franco_Fight_Duel);
};

func void DIA_Addon_Franco_Fight_Duel()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_Duel_15_00");	//Тогда ты об этом пожалеешь.
	AI_Output(self,other,"DIA_Addon_Franco_Fight_Duel_08_01");	//Ты что, мне угрожаешь? ТЫ угрожаешь МНЕ? Придется преподать тебе урок...
	Info_ClearChoices(DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Addon_Franco_Fight_Nothing()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_Nothing_15_00");	//Ладно, я подожду...
	AI_Output(self,other,"DIA_Addon_Franco_Fight_Nothing_08_01");	//Именно так.
	Info_ClearChoices(DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Franco_Pig(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 13;
	condition = DIA_Addon_Franco_Pig_Condition;
	information = DIA_Addon_Franco_Pig_Info;
	permanent = TRUE;
	description = "Свинья! Я разделаюсь с тобой!";
};


func int DIA_Addon_Franco_Pig_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_JemandAnderen))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_Pig_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Pig_15_00");	//Свинья! Я разделаюсь с тобой!
	AI_Output(self,other,"DIA_Addon_Franco_Pig_08_01");	//Ах ты, жалкий ублюдок! Ты посмел угрожать мне? Тебе конец!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

