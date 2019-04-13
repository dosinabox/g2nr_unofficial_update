
instance DIA_Till_EXIT(C_Info)
{
	npc = BAU_931_Till;
	nr = 999;
	condition = DIA_Till_EXIT_Condition;
	information = DIA_Till_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Till_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Till_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Till_HALLO(C_Info)
{
	npc = BAU_931_Till;
	nr = 3;
	condition = DIA_Till_HALLO_Condition;
	information = DIA_Till_HALLO_Info;
	description = "Привет.";
};


func int DIA_Till_HALLO_Condition()
{
	if(Kapitel < 5)
	{
		return TRUE;
	};
};

func void DIA_Till_HALLO_Info()
{
	AI_Output(other,self,"DIA_Till_HALLO_15_00");	//Привет.
	AI_Output(self,other,"DIA_Till_HALLO_03_01");	//Я не разговариваю с рабочими. Сколько тебе это повторять?
	B_StartOtherRoutine(Till,"Start");
	Info_ClearChoices(DIA_Till_HALLO);
	if(Kapitel < 5)
	{
		Info_AddChoice(DIA_Till_HALLO,"Я не рабочий.",DIA_Till_HALLO_keinervoneuch);
		if(Npc_IsDead(Sekob) == FALSE)
		{
			Info_AddChoice(DIA_Till_HALLO,"Ты командуешь здесь?",DIA_Till_HALLO_selber);
		};
	};
};

func void DIA_Till_HALLO_selber()
{
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_00");	//Ты командуешь здесь?
	AI_Output(self,other,"DIA_Till_HALLO_selber_03_01");	//Э-э. Нет, я всего лишь сын Секоба. Но когда старика больше не будет с нами, все земля, что ты видишь вокруг, перейдет ко мне.
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_02");	//Потрясающе!
	Info_ClearChoices(DIA_Till_HALLO);
};

func void DIA_Till_HALLO_keinervoneuch()
{
	AI_Output(other,self,"DIA_Till_HALLO_keinervoneuch_15_00");	//Я не рабочий.
	AI_Output(self,other,"DIA_Till_HALLO_keinervoneuch_03_01");	//А чего тебе тогда надо? У нас ничего нет. Так что лучше уходи.
	Info_ClearChoices(DIA_Till_HALLO);
};


instance DIA_Till_FELDARBEITER(C_Info)
{
	npc = BAU_931_Till;
	nr = 4;
	condition = DIA_Till_FELDARBEITER_Condition;
	information = DIA_Till_FELDARBEITER_Info;
	description = "Вы так всегда обращаетесь со своими работниками?";
};


func int DIA_Till_FELDARBEITER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_HALLO) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_FELDARBEITER_Info()
{
	AI_Output(other,self,"DIA_Till_FELDARBEITER_15_00");	//Вы так всегда обращаетесь со своими работниками?
	AI_Output(self,other,"DIA_Till_FELDARBEITER_03_01");	//Конечно  - иначе нельзя. Если не поддерживать дисциплину, никто не будет - это известное правило.
};


instance DIA_Till_SEKOB(C_Info)
{
	npc = BAU_931_Till;
	nr = 9;
	condition = DIA_Till_SEKOB_Condition;
	information = DIA_Till_SEKOB_Info;
	description = "Мне нужно поговорить с твоим отцом.";
};


func int DIA_Till_SEKOB_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_FELDARBEITER) && (Npc_KnowsInfo(other,DIA_Sekob_HALLO) == FALSE) && (Kapitel < 3) && (Npc_IsDead(Sekob) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Till_SEKOB_Info()
{
	AI_Output(other,self,"DIA_Till_SEKOB_15_00");	//Мне нужно поговорить с твоим отцом.
	AI_Output(self,other,"DIA_Till_SEKOB_03_01");	//У него нет на это времени. Я его представитель. Чем я могу помочь тебе?
	AI_Output(other,self,"DIA_Till_SEKOB_15_02");	//Поможешь, если отведешь к своему отцу.
	AI_Output(self,other,"DIA_Till_SEKOB_03_03");	//Ты считаешь себя крепким парнем и хорошим бойцом, да?
	AI_Output(other,self,"DIA_Till_SEKOB_15_04");	//Лучшим.
	AI_Output(self,other,"DIA_Till_SEKOB_03_05");	//Возможно, тогда стоит позвать его.
	AI_Output(other,self,"DIA_Till_SEKOB_15_06");	//Не беспокойся, мальчик. Я найду его сам.
	AI_Output(self,other,"DIA_Till_SEKOB_03_07");	//Как скажешь.
	AI_StopProcessInfos(self);
};


instance DIA_Till_WASMACHSTDU(C_Info)
{
	npc = BAU_931_Till;
	nr = 10;
	condition = DIA_Till_WASMACHSTDU_Condition;
	information = DIA_Till_WASMACHSTDU_Info;
	description = "Чем ты занимаешься?";
};


func int DIA_Till_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_HALLO) && (hero.guild != GIL_MIL) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_00");	//А что ты делаешь, когда не играешь в хозяина этой фермы?
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_01");	//Стою на страже.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_02");	//Грязные ополченцы из города все чаще забредают на наши земли и воруют все, что плохо лежит.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_03");	//Эти ублюдки были здесь только на прошлой неделе, они украли наших овец.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_04");	//Если бы я добрался до одного из них, ему бы не поздоровилось.
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_05");	//Конечно!
};


instance DIA_Till_WARUMNICHTSLD(C_Info)
{
	npc = BAU_931_Till;
	nr = 11;
	condition = DIA_Till_WARUMNICHTSLD_Condition;
	information = DIA_Till_WARUMNICHTSLD_Info;
	description = "А разве наемники не помогают вам защищаться от ополчения?";
};


func int DIA_Till_WARUMNICHTSLD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_WASMACHSTDU) && (hero.guild != GIL_MIL) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_WARUMNICHTSLD_Info()
{
	AI_Output(other,self,"DIA_Till_WARUMNICHTSLD_15_00");	//А разве наемники не помогают вам защищаться от ополчения?
	AI_Output(self,other,"DIA_Till_WARUMNICHTSLD_03_01");	//Да пока наемники почешутся, я уже успеваю прогнать всех воров.
};


instance DIA_Till_BRONKO(C_Info)
{
	npc = BAU_931_Till;
	nr = 5;
	condition = DIA_Till_BRONKO_Condition;
	information = DIA_Till_BRONKO_Info;
	description = "(спросить о Бронко)";
};


func int DIA_Till_BRONKO_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_FELDARBEITER) && Npc_KnowsInfo(other,DIA_Bronko_HALLO) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_BRONKO_Info()
{
	AI_Output(other,self,"DIA_Till_BRONKO_15_00");	//Это ваш работник требует плату со всех проходящих мимо, утверждая, что ОН тут фермер!
	AI_Output(self,other,"DIA_Till_BRONKO_03_01");	//(робко) Эээ. Да. Я знаю. Это Бронко. Он делает то, что хочет.
	AI_Output(self,other,"DIA_Till_BRONKO_03_02");	//Я уже столько раз задавал ему трепку, чтобы он взялся за ум и начал работать, но все без толку...
	AI_Output(other,self,"DIA_Till_BRONKO_15_03");	//Да?
	AI_Output(self,other,"DIA_Till_BRONKO_03_04");	//Он все равно не хочет работать.
	if(Npc_IsDead(Sekob) == FALSE)
	{
		AI_Output(self,other,"DIA_Till_BRONKO_03_05");	//Моему отцу очень не нравится, что мне все еще не удалось убедить его вернуться к работе.
	};
};


instance DIA_Till_BRONKOZURARBEIT(C_Info)
{
	npc = BAU_931_Till;
	nr = 6;
	condition = DIA_Till_BRONKOZURARBEIT_Condition;
	information = DIA_Till_BRONKOZURARBEIT_Info;
	permanent = TRUE;
	description = "Возможно, я смогу помочь тебе.";
};


var int DIA_Till_BRONKOZURARBEIT_noPerm;

func int DIA_Till_BRONKOZURARBEIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_BRONKO) && (DIA_Till_BRONKOZURARBEIT_noPerm == FALSE) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_BRONKOZURARBEIT_Info()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_15_00");	//Может быть, я смогу помочь.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_03_01");	//Что ты хочешь сказать этим? Хорошо, послушай, если ты сможешь заставить Бронко работать, я заплачу тебе, скажем, 10 золотых монет. Что скажешь?
	Till_Angebot = 10;
	Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
	Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Нет проблем. Но мне нужно больше денег.",DIA_Till_BRONKOZURARBEIT_mehr);
	Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Хорошо. Я посмотрю, что можно сделать.",DIA_Till_BRONKOZURARBEIT_ok);
	Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Я подумаю над этим.",DIA_Till_BRONKOZURARBEIT_nochnicht);
};

func void DIA_Till_BRONKOZURARBEIT_nochnicht()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_nochnicht_15_00");	//Я подумаю над этим.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_nochnicht_03_01");	//Как хочешь.
	Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
	AI_StopProcessInfos(self);
};

func void DIA_Till_BRONKOZURARBEIT_ok()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_ok_15_00");	//Хорошо. Я посмотрю, что можно сделать.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_ok_03_01");	//Но поторопись с этим.
	DIA_Till_BRONKOZURARBEIT_noPerm = TRUE;
	MIS_Sekob_Bronko_eingeschuechtert = LOG_Running;
	Log_CreateTopic(TOPIC_Bronkoeingeschuechtert,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Bronkoeingeschuechtert,LOG_Running);
	B_LogEntry(TOPIC_Bronkoeingeschuechtert,"Тилл не может заставить Бронко работать. Тилл хочет, чтобы это попробовал сделать я.");
	AI_StopProcessInfos(self);
};

func void DIA_Till_BRONKOZURARBEIT_mehr()
{
	if(Till_IchMachsNurEinmal == TRUE)
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_00");	//Я хочу больше.
	}
	else
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_01");	//Нет проблем. Но мне нужно больше денег.
		Till_IchMachsNurEinmal = TRUE;
	};
	if(Till_Angebot == 10)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_02");	//Хорошо. 20 золотых монет.
		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Я хочу больше.",DIA_Till_BRONKOZURARBEIT_mehr);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Хорошо. Я посмотрю, что можно сделать.",DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 20;
	}
	else if(Till_Angebot == 20)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_03");	//30?
		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Я хочу больше.",DIA_Till_BRONKOZURARBEIT_mehr);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Хорошо. Я посмотрю, что можно сделать.",DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 30;
	}
	else if(Till_Angebot == 30)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_04");	//Может быть... 50?
		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Я хочу больше.",DIA_Till_BRONKOZURARBEIT_mehr);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Хорошо. Я посмотрю, что можно сделать.",DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 50;
	}
	else if(Till_Angebot == 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_05");	//Хорошо. 70?
		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Я хочу больше.",DIA_Till_BRONKOZURARBEIT_mehr);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Хорошо. Я посмотрю, что можно сделать.",DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 70;
	}
	else if(Till_Angebot == 70)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_06");	//Хорошо, хорошо! Я дам тебе 100 золотых монет. Но это все, что у меня есть.
		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Хорошо. Я посмотрю, что можно сделать.",DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 100;
	};
};


instance DIA_Till_BRONKOWIEDERANARBEIT(C_Info)
{
	npc = BAU_931_Till;
	nr = 7;
	condition = DIA_Till_BRONKOWIEDERANARBEIT_Condition;
	information = DIA_Till_BRONKOWIEDERANARBEIT_Info;
	description = "Бронко вернулся к работе.";
};


func int DIA_Till_BRONKOWIEDERANARBEIT_Condition()
{
	if((MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS) && (DIA_Till_BRONKOZURARBEIT_noPerm == TRUE) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_BRONKOWIEDERANARBEIT_Info()
{
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_00");	//Бронко вернулся к работе.
	AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_01");	//Правда? Это превосходно.
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_02");	//Да. И тепрь я хочу получить мои деньги.
	IntToFloat(Till_Angebot);
	if(Till_Angebot <= 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_03");	//(колеблясь) Мммм. Хорошо. Сделка есть сделка, правда?
		CreateInvItems(self,ItMi_Gold,Till_Angebot);
		B_GiveInvItems(self,other,ItMi_Gold,Till_Angebot);
	}
	else
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_04");	//К сожалению, у меня нет такой суммы. Но я очень благодарен тебе за помощь.
		Till_HatSeinGeldBehalten = TRUE;
	};
	B_GivePlayerXP(XP_BronkoGehtAnDieArbeit);
	AI_StopProcessInfos(self);
};


instance DIA_Till_PERMKAP1(C_Info)
{
	npc = BAU_931_Till;
	nr = 99;
	condition = DIA_Till_PERMKAP1_Condition;
	information = DIA_Till_PERMKAP1_Info;
	permanent = TRUE;
	description = "(подразнить Тилла)";
};


func int DIA_Till_PERMKAP1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_HALLO) || (Kapitel >= 5))
	{
		return TRUE;
	};
};

func void DIA_Till_PERMKAP1_Info()
{
	if(Kapitel == 5)
	{
		if((MIS_bringRosiBackToSekob != LOG_SUCCESS) && (Rosi_FleeFromSekob_Kap5 == TRUE))
		{
			AI_Output(other,self,"DIA_Till_PERMKAP1_15_00");	//А до дома-то далеко, а? Папочка не сможет помочь тебе здесь.
			AI_Output(self,other,"DIA_Till_PERMKAP1_03_01");	//Когда-нибудь я набью тебе морду.
		};
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_02");	//Ты трус, радуйся, если я оставлю тебя в живых.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_03");	//Тогда оставь меня в покое.
		AI_StopProcessInfos(self);
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_04");	//Может, тебе стоит питаться получше, чтобы ты вырос большим и сильным.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_05");	//Когда-нибудь я поквитаюсь с тобой.
		AI_StopProcessInfos(self);
	}
	else if(Till_HatSeinGeldBehalten == TRUE)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_06");	//Ах ты жалкий маленький...
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_07");	//Уходи.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_08");	//Тебе сегодня никто еще не бил в морду?
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_09");	//Оставь меня в покое, ты, идиот!
	};
};


instance DIA_Till_PICKPOCKET(C_Info)
{
	npc = BAU_931_Till;
	nr = 900;
	condition = DIA_Till_PICKPOCKET_Condition;
	information = DIA_Till_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Till_PICKPOCKET_Condition()
{
	return C_Beklauen(36,40);
};

func void DIA_Till_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Till_PICKPOCKET);
	Info_AddChoice(DIA_Till_PICKPOCKET,Dialog_Back,DIA_Till_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Till_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Till_PICKPOCKET_DoIt);
};

func void DIA_Till_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Till_PICKPOCKET);
};

func void DIA_Till_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Till_PICKPOCKET);
};

