
instance DIA_Rukhar_EXIT(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 999;
	condition = DIA_Rukhar_EXIT_Condition;
	information = DIA_Rukhar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rukhar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rukhar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rukhar_HALLO(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 4;
	condition = DIA_Rukhar_HALLO_Condition;
	information = DIA_Rukhar_HALLO_Info;
	description = "Как здесь пиво?";
};


func int DIA_Rukhar_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Rukhar_HALLO_Info()
{
	AI_Output(other,self,"DIA_Rukhar_HALLO_15_00");	//Как здесь пиво?
	AI_Output(self,other,"DIA_Rukhar_HALLO_12_01");	//Не самое лучшее, но в наше время не приходится особенно привередничать.
};


instance DIA_Rukhar_WASMACHSTDU(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 5;
	condition = DIA_Rukhar_WASMACHSTDU_Condition;
	information = DIA_Rukhar_WASMACHSTDU_Info;
	description = "Что ты делаешь здесь?";
};


func int DIA_Rukhar_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rukhar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Rukhar_WASMACHSTDU_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_01");	//Еще несколько недель назад  вкалывал как раб на ферме Онара.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_02");	//Но однажды я понял, что больше так не выдержу и сбежал оттуда.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_03");	//Теперь я сам себе хозяин. Все, что принадлежит мне, находится в этом сундуке. И больше мне ничего не нужно.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_04");	//Не хочешь посостязаться со мной?
	Log_CreateTopic(TOPIC_Wettsaufen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wettsaufen,LOG_Running);
	B_LogEntry(TOPIC_Wettsaufen,"В таверне можно заключить пари.");
};


instance DIA_Rukhar_WETTKAMPF(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 3;
	condition = DIA_Rukhar_WETTKAMPF_Condition;
	information = DIA_Rukhar_WETTKAMPF_Info;
	description = "А что это за состязание?";
};


func int DIA_Rukhar_WETTKAMPF_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rukhar_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_WETTKAMPF_Info()
{
	AI_Output(other,self,"DIA_Rukhar_WETTKAMPF_15_00");	//А что это за состязание?
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_01");	//Я называю это 'ПЕЙ ДО ДНА'.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_02");	//Правила очень просты.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_03");	//Мы по очереди заказываем по кружке этого превосходного пива, которое предлагает этот старый чудак.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_04");	//Каждую кружку нужно осушить до дна, так, чтобы стол остался сухим, если ее перевернуть вверх дном.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_05");	//Выигрывает тот, кто дольше сможет держаться на ногах. Проигравший оплачивает пиво и ставку. Ну? Как тебе это?
	AI_Output(other,self,"DIA_Rukhar_WETTKAMPF_15_06");	//Может быть позже, когда я не буду так торопиться.
};


instance DIA_Rukhar_HOLERANDOLPH(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 3;
	condition = DIA_Rukhar_HOLERANDOLPH_Condition;
	information = DIA_Rukhar_HOLERANDOLPH_Info;
	description = "Могу я поставить на кого-нибудь еще?";
};


func int DIA_Rukhar_HOLERANDOLPH_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rukhar_WETTKAMPF))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_HOLERANDOLPH_Info()
{
	AI_Output(other,self,"DIA_Rukhar_HOLERANDOLPH_15_00");	//Могу я поставить на кого-нибудь еще?
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_01");	//Конечно. Если ты найдешь кого-нибудь, у кого хватит смелости померяться со мной силами, я приму твою ставку.
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_02");	//Все кладут одинаковые ставки в горшок. Победитель забирает все. Размер ставки зависит только от размера твоего кошелька.
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_03");	//Приведи мне кого-нибудь, кто осмелится померяться со мной силами, и я приму твою ставку.
	B_LogEntry(TOPIC_Wettsaufen,"Рухар называет эту игру ПЕЙ ДО ДНА. Нет, спасибо, мне это не интересно. Я найду кого-нибудь еще для него. Пусть дурачит других, но не меня.");
};


instance DIA_Rukhar_RANDOLPHWILL(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 3;
	condition = DIA_Rukhar_RANDOLPHWILL_Condition;
	information = DIA_Rukhar_RANDOLPHWILL_Info;
	permanent = TRUE;
	description = "Я нашел человека, который хочет сразиться с тобой.";
};


var int DIA_Rukhar_RANDOLPHWILL_noPerm;

func int DIA_Rukhar_RANDOLPHWILL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_GEGENWEN) && Npc_KnowsInfo(other,DIA_Rukhar_HOLERANDOLPH) && (DIA_Rukhar_RANDOLPHWILL_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_RANDOLPHWILL_Info()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_15_00");	//Я нашел человека, который хочет сразиться с тобой.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_01");	//Кто это?
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_15_02");	//Рендольф.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_03");	//Хо хо. Рендольф хвастун? Хорошо. Почему бы и нет.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_04");	//Пришли этого слизняка ко мне, и сделай ставку.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_05");	//Ты можешь выставить его еще раз не раньше чем через 2 дня. Кто знает? Может, тебе повезет, и он успеет протрезветь.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_06");	//Какова твоя ставка?
	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"Ноль",DIA_Rukhar_RANDOLPHWILL_nix);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"100",DIA_Rukhar_RANDOLPHWILL_100);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"50",DIA_Rukhar_RANDOLPHWILL_50);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"20",DIA_Rukhar_RANDOLPHWILL_20);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"10 золотых",DIA_Rukhar_RANDOLPHWILL_10);
};

func void DIA_Rukhar_RANDOLPHWILL_annehmen()
{
	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_annehmen_12_00");	//Я возьму твою ставку и подержу е у себя, пока состязание не будет окончено, хорошо?
	DIA_Rukhar_RANDOLPHWILL_noPerm = TRUE;
};

func void DIA_Rukhar_RANDOLPHWILL_mehr()
{
	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"Ноль",DIA_Rukhar_RANDOLPHWILL_nix);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"100",DIA_Rukhar_RANDOLPHWILL_100);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"50",DIA_Rukhar_RANDOLPHWILL_50);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"20",DIA_Rukhar_RANDOLPHWILL_20);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"10 золотых",DIA_Rukhar_RANDOLPHWILL_10);
};

func void DIA_Rukhar_RANDOLPHWILL_nix()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_nix_15_00");	//Ноль
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_nix_12_01");	//Тогда нам лучше забыть о состязании.
	AI_StopProcessInfos(self);
};

func void DIA_Rukhar_RANDOLPHWILL_10()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_10_15_00");	//10 золотых
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_10_12_01");	//Да ладно, ты, должно быть, шутишь. Еще несколько золотых не разорят тебя.
	Rukhar_Einsatz = 10;
	Rukhar_Gewinn = 20;
	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"(выбрать другую ставку)",DIA_Rukhar_RANDOLPHWILL_mehr);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"(принять ставку)",DIA_Rukhar_RANDOLPHWILL_annehmen);
};

func void DIA_Rukhar_RANDOLPHWILL_20()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_20_15_00");	//20
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_20_12_01");	//Если ты хочешь сделать ставку, то делай уж это по-человечески.
	Rukhar_Einsatz = 20;
	Rukhar_Gewinn = 40;
	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"(выбрать другую ставку)",DIA_Rukhar_RANDOLPHWILL_mehr);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"(принять ставку)",DIA_Rukhar_RANDOLPHWILL_annehmen);
};

func void DIA_Rukhar_RANDOLPHWILL_50()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_50_15_00");	//50
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_50_12_01");	//Не робей. Смелее.
	Rukhar_Einsatz = 50;
	Rukhar_Gewinn = 100;
	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"(выбрать другую ставку)",DIA_Rukhar_RANDOLPHWILL_mehr);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"(принять ставку)",DIA_Rukhar_RANDOLPHWILL_annehmen);
};

func void DIA_Rukhar_RANDOLPHWILL_100()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_100_15_00");	//100
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_100_12_01");	//Вот это мне уже нравится.
	Rukhar_Einsatz = 100;
	Rukhar_Gewinn = 200;
	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"(выбрать другую ставку)",DIA_Rukhar_RANDOLPHWILL_mehr);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"(принять ставку)",DIA_Rukhar_RANDOLPHWILL_annehmen);
};


instance DIA_Rukhar_ICHSEHEDICH(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 3;
	condition = DIA_Rukhar_ICHSEHEDICH_Condition;
	information = DIA_Rukhar_ICHSEHEDICH_Info;
	permanent = TRUE;
	description = "Вот моя ставка.";
};


var int DIA_Rukhar_ICHSEHEDICH_noPerm;

func int DIA_Rukhar_ICHSEHEDICH_Condition()
{
	if((DIA_Rukhar_ICHSEHEDICH_noPerm == FALSE) && (DIA_Rukhar_RANDOLPHWILL_noPerm == TRUE) && (Rukhar_Einsatz != 0))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_ICHSEHEDICH_Info()
{
	AI_Output(other,self,"DIA_Rukhar_ICHSEHEDICH_15_00");	//Вот моя ставка.
	if(B_GiveInvItems(other,self,ItMi_Gold,Rukhar_Einsatz))
	{
		AI_Output(self,other,"DIA_Rukhar_ICHSEHEDICH_12_01");	//Хорошо. Но только не тяни, приведи Рендольфа побыстрее, слышишь?
		DIA_Rukhar_ICHSEHEDICH_noPerm = TRUE;
		MIS_Rukhar_Wettkampf = LOG_Running;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self,other,"DIA_Rukhar_ICHSEHEDICH_12_02");	//Очень смешно. Возвращайся, когда у тебя будут деньги.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Rukhar_GELDZURUECK(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 3;
	condition = DIA_Rukhar_GELDZURUECK_Condition;
	information = DIA_Rukhar_GELDZURUECK_Info;
	permanent = TRUE;
	description = "Я хочу получить свои деньги назад.";
};


func int DIA_Rukhar_GELDZURUECK_Condition()
{
	if((MIS_Rukhar_Wettkampf == LOG_SUCCESS) && (Rukhar_Won_Wettkampf == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_GELDZURUECK_Info()
{
	AI_Output(other,self,"DIA_Rukhar_GELDZURUECK_15_00");	//Я хочу получить свои деньги назад.
	AI_Output(self,other,"DIA_Rukhar_GELDZURUECK_12_01");	//Игровой долг - это долг чести, приятель. Тебе следовало подумать об этом раньше.
	AI_StopProcessInfos(self);
};


instance DIA_Rukhar_HAENSELN(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 3;
	condition = DIA_Rukhar_HAENSELN_Condition;
	information = DIA_Rukhar_HAENSELN_Info;
	permanent = TRUE;
	description = "Похоже, ты откусил больше, чем можешь проглотить.";
};


func int DIA_Rukhar_HAENSELN_Condition()
{
	if((MIS_Rukhar_Wettkampf == LOG_SUCCESS) && (Rukhar_Won_Wettkampf == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Rukhar_HAENSELN_nureimalgeld;

func void DIA_Rukhar_HAENSELN_Info()
{
	AI_Output(other,self,"DIA_Rukhar_HAENSELN_15_00");	//Похоже, ты откусил больше, чем можешь проглотить.
	if(DIA_Rukhar_HAENSELN_nureimalgeld == FALSE)
	{
		AI_Output(self,other,"DIA_Rukhar_HAENSELN_12_01");	//Вот твои деньги, и больше я ни слова не скажу.
		B_GivePlayerXP(XP_Rukhar_Lost);
		IntToFloat(Rukhar_Gewinn);
		CreateInvItems(self,ItMi_Gold,Rukhar_Gewinn);
		B_GiveInvItems(self,other,ItMi_Gold,Rukhar_Gewinn);
		DIA_Rukhar_HAENSELN_nureimalgeld = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Rukhar_HAENSELN_12_02");	//Я еще поквитаюсь с тобой.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Rukhar_Perm(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 7;
	condition = DIA_Rukhar_Perm_Condition;
	information = DIA_Rukhar_Perm_Info;
	permanent = TRUE;
	description = "Ничего интересного не произошло?";
};


func int DIA_Rukhar_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rukhar_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_Perm_Info()
{
	AI_Output(other,self,"DIA_Rukhar_Perm_15_00");	//Ничего интересного не произошло?
	AI_Output(self,other,"DIA_Rukhar_Perm_12_01");	//Ничего такого, о чем бы я зал. Никто ничего мне не рассказывает.
};


instance DIA_Rukhar_PICKPOCKET(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 900;
	condition = DIA_Rukhar_PICKPOCKET_Condition;
	information = DIA_Rukhar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Rukhar_PICKPOCKET_Condition()
{
	return C_Beklauen(26,30);
};

func void DIA_Rukhar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rukhar_PICKPOCKET);
	Info_AddChoice(DIA_Rukhar_PICKPOCKET,Dialog_Back,DIA_Rukhar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rukhar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rukhar_PICKPOCKET_DoIt);
};

func void DIA_Rukhar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rukhar_PICKPOCKET);
};

func void DIA_Rukhar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rukhar_PICKPOCKET);
};

