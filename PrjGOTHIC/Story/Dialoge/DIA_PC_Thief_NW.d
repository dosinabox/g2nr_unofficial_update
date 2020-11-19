
instance DIA_DiegoNW_EXIT(C_Info)
{
	npc = PC_Thief_NW;
	nr = 999;
	condition = DIA_DiegoNW_EXIT_Condition;
	information = DIA_DiegoNW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_DiegoNW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DiegoNW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DiegoNW_Perm(C_Info)
{
	npc = PC_Thief_NW;
	nr = 800;
	condition = DIA_DiegoNW_Perm_Condition;
	information = DIA_DiegoNW_Perm_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_DiegoNW_Perm_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (Kapitel > 3))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_Perm_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_00");	//Как дела?
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_01");	//Паршиво. Почему никто не сказал мне, что Хоринис за это время полностью разорился?
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_02");	//Понятия не имею. Я знаю этот город только таким.
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_03");	//Ты бы видел его несколько лет назад. Он бы тебе совсем не понравился в нынешнем состоянии.
};


instance DIA_DiegoNW_NeedHelp(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = DIA_DiegoNW_NeedHelp_Condition;
	information = DIA_DiegoNW_NeedHelp_Info;
	important = TRUE;
};


func int DIA_DiegoNW_NeedHelp_Condition()
{
	if(Diego_IsOnBoard == FALSE)
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_NeedHelp_Info()
{
	if(Diego_IsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_01");	//Эй! Ты выглядишь так, будто увидел призрака!
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_02");	//(смеется) А ты думал, что мне пришел конец, верно?
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_03");	//Я тогда довольно долго провалялся без сознания. Но как видишь, я все еще жив.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_04");	//Ладно, самое важное - это то, что сейчас мы оба здесь.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_05");	//Ты должен мне помочь.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_NeedHelp_11_00");	//Хорошо, что ты здесь. Ты должен помочь мне.
	};
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	if(!Npc_KnowsInfo(other,DIA_DiegoOW_Hallo))
	{
		Info_AddChoice(DIA_DiegoNW_NeedHelp,"Кто ты?",DIA_DiegoNW_NeedHelp_WhoAreYou);
	};
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Что это на тебе за одежда?",DIA_DiegoNW_NeedHelp_Clothes);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Что ты делаешь здесь?",DIA_DiegoNW_NeedHelp_Plan);
};

func void DIA_DiegoNW_NeedHelp_Plan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Plan_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_01");	//За мной следит стража. Они всегда начеку.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_02");	//Не думаю, что мне будет легко устроиться здесь.
};

func void DIA_DiegoNW_NeedHelp_WhoAreYou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_01");	//Черт, это все, наверное, из-за одежды. В старой одежде стражники не пустили бы меня в город.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_02");	//Вот почему я купил это одеяние у торговца за городом. Теперь-то, надеюсь, ты вспомнил меня? Я Диего.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_03");	//В старой колонии я учил тебя всему, что необходимо для выживания.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_04");	//Ты же не мог вот так просто все забыть.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_05");	//Ээ... а что именно произошло там?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_06");	//Черт побери! Ты действительно ничего не помнишь.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_07");	//Послушай, у меня действительно нет времени объяснять все тебе теперь. Послушай только одно: мы были чертовски хорошими друзьями, и я не раз спасал твою жизнь.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_08");	//А теперь мне нужна твоя помощь.
};

func void DIA_DiegoNW_NeedHelp_Clothes()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_00");	//Что это на тебе за одежда?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_01");	//Я купил ее у торговца за городом. Стража не хотела пропускать меня в город.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_02");	//Также не стоит никому говорить, откуда я пришел.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_03");	//Это имеет смысл.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_04");	//Я тоже так думаю. Но даже хотя я снял свой старый наряд, я все равно остался прежним.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_05");	//И у меня большие планы касательно этого города.
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Какие планы?",DIA_DiegoNW_NeedHelp_Problem);
};

func void DIA_DiegoNW_NeedHelp_Problem()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_00");	//Какие планы?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_01");	//Здесь многое переменилось с тех пор, как я покинул его. Мне как-то нужно опять встать на ноги.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_02");	//В чем проблема?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_03");	//Я должен попасть в верхний квартал.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_04");	//Но я не гражданин этого города, и у меня нет денег, чтобы подкупить стражу. Вот зачем нужен ты!
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_05");	//То есть, ты хочешь, чтобы я одолжил тебе золота?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_06");	//Чушь. У меня есть золото. Я бы сказал даже целая куча золота! Но, к сожалению, оно не при мне.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_07");	//Ты должен забрать мое золото там, где оно находится.
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"У меня нет времени на это.",DIA_DiegoNW_NeedHelp_Problem_NoTime);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Что мне с этого будет?",DIA_DiegoNW_NeedHelp_Problem_Reward);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Ладно, я помогу тебе.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou);
};

func void DIA_DiegoNW_NeedHelp_Problem_NoTime()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00");	//У меня нет времени на это.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01");	//Эй, я думал мы друзья! Это ведь я, не забывай, спасал твою задницу, когда тебя бросили в колонию.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02");	//Ты преувеличиваешь.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03");	//Да?! А ты задумайся на минутку, что могло бы быть, если бы я не объяснил тебе тогда, как нужно вести себя в колонии.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04");	//Рудные бароны сожрали бы тебя на завтрак, и ты бы подох жалкой смертью где-нибудь в шахте.
	MIS_HelpDiegoNW = LOG_FAILED;
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
};

func void DIA_DiegoNW_NeedHelp_Problem_Reward()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_Reward_15_00");	//Что мне с этого будет?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_Reward_11_01");	//Я когда-нибудь спрашивал тебя, что ты мне дашь взамен? Мы же друзья, разве этого недостаточно?
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00");	//Ладно, я помогу тебе.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_01");	//Прекрасно. Слушай внимательно. Когда Барьер еще был на месте, я спрятал в Долине Рудников небольшой клад.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_02");	//Это было довольно давно, и поэтому когда я оттуда уходил, я забыл его забрать.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_03");	//А сейчас мне очень нужны эти деньги.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_03");	//Если вкратце, ты должен пойти в Долину Рудников и забрать мое золото.
	MIS_HelpDiegoNW = LOG_Running;
	Log_CreateTopic(TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW,LOG_Running);
	B_LogEntry(TOPIC_HelpDiegoNW,"Золото Диего находится в Долине Рудников. Оно нужно ему, чтобы попасть в верхнюю часть города, и он попросил меня найти это золото.");
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Что ты собираешься делать с этим золотом?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Откуда у тебя это золото?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Где спрятано это золото?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Почему ты не заберешь его сам?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_Why);
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00");	//Что ты собираешься делать с этим золотом?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01");	//Я хочу свести счеты с одним из торговцев в верхнем квартале. Я очень этого хочу.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02");	//А затем я буду готов начать новую карьеру!
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00");	//Откуда у тебя это золото?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01");	//Я что, единственный что ли, кто откладывал золото для себя в Долине Рудников?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02");	//Украсть несколько кусков золота было легче легкого. Просто на случай, если нам когда-нибудь удастся выбраться оттуда.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03");	//Все были так сосредоточены на руде, что на золото никто не обращал внимания...
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00");	//Где спрятано это золото?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01");	//Прямо на торговой площади. Над заброшенной шахтой. Оно в кожаном кошельке.
	if(Diego_Nostalgie == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_01");	//Обойдись без комментариев. Я и сам помню, что мы проходили мимо этого места.
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_02");	//Просто принеси мне золото.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_02");	//Я собирался пойти и забрать его, но неожиданно около этого места появилась банда орков.
	};
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02");	//Но проверь, чтобы это был тот самый кошелек, чтобы не ходить туда вхолостую.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03");	//Как я опознаю его?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04");	//Он полон золота. Доверху полон!
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Я попытаюсь найти твое золото.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt);
	B_LogEntry(TOPIC_HelpDiegoNW,"Золото Диего находится где-то на старой торговой площади, там, где товары переправлялись в колонию по канатной дороге, неподалеку от заброшенной шахты.");
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00");	//Я попытаюсь найти твое золото.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01");	//(ухмыляется) Сделай это. Этого будет достаточно для меня.
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_Why()
{
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_04");	//Почему ты не заберешь его сам?
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_05");	//Потому что там, где оно спрятано, ошиваются орки. Ты как нельзя лучше подходишь для этой работы, поверь мне.
};


instance DIA_DiegoNW_HelpYou(C_Info)
{
	npc = PC_Thief_NW;
	nr = 30;
	condition = DIA_DiegoNW_HelpYou_Condition;
	information = DIA_DiegoNW_HelpYou_Info;
	permanent = FALSE;
	description = "Ладно, я все же помогу тебе.";
};


func int DIA_DiegoNW_HelpYou_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (MIS_HelpDiegoNW == LOG_FAILED) && (Diego_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_HelpYou_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_00");	//Ладно, я все же помогу тебе.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_01");	//Я знал это.
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_02");	//Давай перейдем сразу к делу.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_03");	//Хорошо. Я спрятал золото в Долине Рудников, и ты должен забрать его оттуда для меня.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_06");	//А я буду ждать здесь и все подготовлю для дальнейших действий.
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_Why();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt();
	MIS_HelpDiegoNW = LOG_Running;
	Log_CreateTopic(TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW,LOG_Running);
	B_LogEntry(TOPIC_HelpDiegoNW,"Золото Диего находится в Долине Рудников. Оно нужно ему, чтобы попасть в верхнюю часть города, и он попросил меня найти это золото.");
};


func void B_DiegoNW_DiegosRevenge()
{
	if(!Npc_IsDead(Gerbrandt))
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_05");	//Очень хорошо. Пусть Гербрандт теперь дрожит от страха.
	}
	else
	{
		B_Say(self,other,"$ABS_GOOD");
	};
	MIS_HelpDiegoNW = LOG_SUCCESS;
	B_GivePlayerXP(XP_HelpDiegoNW);
};

instance DIA_DiegoNW_HaveYourGold(C_Info)
{
	npc = PC_Thief_NW;
	nr = 31;
	condition = DIA_DiegoNW_HaveYourGold_Condition;
	information = DIA_DiegoNW_HaveYourGold_Info;
	permanent = TRUE;
	description = "Я нашел твое золото!";
};


func int DIA_DiegoNW_HaveYourGold_Condition()
{
	if(((OpenedDiegosBag == TRUE) || Npc_HasItems(other,ItSe_DiegosTreasure_Mis)) && (MIS_HelpDiegoNW == LOG_Running) && (Diego_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_HaveYourGold_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_HaveYourGold_15_00");	//Я нашел твое золото!
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_01");	//Отлично. Покажи.
	if(Npc_HasItems(other,ItSe_DiegosTreasure_Mis))
	{
		B_GiveInvItems(other,self,ItSe_DiegosTreasure_Mis,1);
		B_DiegoNW_DiegosRevenge();
	}
	else if(Npc_HasItems(other,ItMi_Gold) < DiegosTreasure)
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_02");	//Но здесь не все! Ты что, не доверяешь мне? Мне нужна вся сумма.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_03");	//Если мой план сработает, золота останется достаточно и для тебя.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_04");	//Так что, пожалуйста, принеси всю сумму. Это очень важно!
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_Gold,DiegosTreasure);
		B_DiegoNW_DiegosRevenge();
	};
	if(!Npc_IsDead(Gerbrandt) && (MIS_HelpDiegoNW == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_06");	//Послушай, я все еще не договорился со стражей.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_07");	//Я хочу, чтобы ты отнес это письмо Гербрандту. Это один из торговцев в верхнем квартале.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_08");	//Передай ему привет от меня. А затем встретимся перед домом Гербрандта.
		CreateInvItems(self,ItWr_DiegosLetter_MIS,1);
		B_GiveInvItems(self,other,ItWr_DiegosLetter_MIS,1);
		B_StartOtherRoutine(Gerbrandt,"WaitForDiego");
		MIS_DiegosResidence = LOG_Running;
		Log_CreateTopic(TOPIC_DiegosResidence,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DiegosResidence,LOG_Running);
		B_LogEntry(TOPIC_DiegosResidence,"Диего дал мне письмо для торговца Гербрандта.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_DiegoNW_DeliveredLetter(C_Info)
{
	npc = PC_Thief_NW;
	nr = 30;
	condition = DIA_DiegoNW_DeliveredLetter_Condition;
	information = DIA_DiegoNW_DeliveredLetter_Info;
	permanent = FALSE;
	description = "Я доставил твое письмо.";
};


func int DIA_DiegoNW_DeliveredLetter_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (MIS_DiegosResidence == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_DeliveredLetter_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_00");	//Я доставил твое письмо.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_01");	//Очень хорошо. Как Гербрандт воспринял это?
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_02");	//Он был в шоке и моментально исчез куда-то.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_03");	//(удовлетворенно) Я так и думал.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_04");	//Боюсь, правда, что в первую очередь мне придется заняться обстановкой моего нового дома. Если я правильно помню, вкус у Гербрандта просто ужасный.
	B_GivePlayerXP(XP_DiegoHasANewHome);
	Wld_AssignRoomToGuild("reich01",GIL_PUBLIC);
	B_StartOtherRoutine(Gerbrandt,"NEWLIFE");
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,Dialog_Back,DIA_DiegoNW_DeliveredLetter_YourTrick_BACK);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"Что насчет моей доли?",DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"Что насчет Гербрандта?",DIA_DiegoNW_DeliveredLetter_Gerbrandt);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"Как тебе удалось провернуть это?",DIA_DiegoNW_DeliveredLetter_YourTrick);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"Значит, это теперь твой дом?",DIA_DiegoNW_DeliveredLetter_YourHouse);
};

func void DIA_DiegoNW_DeliveredLetter_Gerbrandt()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00");	//Что насчет Гербрандта?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01");	//Он наслаждался беззаботной жизнью слишком долго.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02");	//Он жил здесь, купаясь в роскоши, когда я питался похлебкой из мясных жуков.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03");	//Понятия не имею, куда он сбежал отсюда, но он больше не осмелится появиться в Хоринисе вновь - я позабочусь об этом.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04");	//Если ты ищешь его, попробуй пошарить в портовом квартале.
};

func void DIA_DiegoNW_DeliveredLetter_YourHouse()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_00");	//Значит, это теперь твой дом?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_01");	//Да, от погреба до чердака! Со всей мебелью!
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_02");	//Я столько лет провел в невыносимых условиях и теперь мечтаю о том, как я буду спать в огромной кровати с балдахином.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_03");	//А потом, на завтрак, я буду есть превосходный окорок и запивать его дорогим вином.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_04");	//Да, ты своего не упустишь.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05");	//Точно.
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_00");	//Как тебе удалось провернуть это?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_01");	//Ты думаешь, Гербрандт заработал свое состояние на честном бизнесе?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_02");	//Конечно, он никогда не марал руки, когда доходило до грязных дел. У него для этого был помощник.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_03");	//А на моей совести тогда много чего было. Гербрандт, в конце концов, решил избавиться от меня. Вероятно, он опасался, что я знаю слишком много.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_04");	//Ты никогда не говорил мне об этом.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_05");	//А ты никогда и не спрашивал.
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00");	//Что насчет моей доли?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01");	//Похоже, ты ничего не забыл из того, чему я учил тебя.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02");	//Но ты прав, у меня ничего бы не вышло без твоей помощи. Вот твоя доля.
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick_BACK()
{
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
};


var int Diego_Teach;

instance DIA_DiegoNW_CanYouTeach(C_Info)
{
	npc = PC_Thief_NW;
	nr = 888;
	condition = DIA_DiegoNW_CanYouTeach_Condition;
	information = DIA_DiegoNW_CanYouTeach_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_DiegoNW_CanYouTeach_Condition()
{
//	if((Diego_IsOnBoard == FALSE) && (Diego_Teach == FALSE))
	if(Diego_Teach == FALSE)
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_CanYouTeach_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_CanYouTeach_15_00");	//Ты можешь научить меня чему-нибудь?
	if(Npc_KnowsInfo(other,DIA_DiegoNW_DeliveredLetter))
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_01");	//Да, конечно. Дай мне знать, когда будешь готов.
		if(DiegoOW_Teach == FALSE)
		{
			Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
			B_LogEntry(TOPIC_CityTeacher,"Диего может помочь мне повысить мою ловкость и силу.");
		};
		Diego_Teach = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoOW_Teach_11_01");	//Сейчас не время для этого. У меня есть дела поважнее.
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_02");	//Сначала мне нужно решить свои проблемы.
	};
};


var int DiegoNW_Merke_DEX;
var int DiegoNW_Merke_STR;

func void B_BuildLearnDialog_Diego_NW()
{
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoNW_TeachDEX_5);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_DiegoNW_TeachSTR_1);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_DiegoNW_TeachSTR_5);
};

instance DIA_DiegoNW_Teach(C_Info)
{
	npc = PC_Thief_NW;
	nr = 888;
	condition = DIA_DiegoNW_Teach_Condition;
	information = DIA_DiegoNW_Teach_Info;
	permanent = TRUE;
	description = "Обучи меня.";
};


func int DIA_DiegoNW_Teach_Condition()
{
	if(Diego_Teach == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_Teach_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_Teach_15_00");	//Обучи меня.
	AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_01");	//Конечно. Что ты хочешь знать?
	DiegoNW_Merke_DEX = other.aivar[REAL_DEXTERITY];
	DiegoNW_Merke_STR = other.aivar[REAL_STRENGTH];
	B_BuildLearnDialog_Diego_NW();
};

func void DIA_DiegoNW_Teach_BACK()
{
	if(DiegoNW_Merke_DEX < other.aivar[REAL_DEXTERITY])
	{
		AI_Output(self,other,"DIA_DiegoNW_Teach_BACK_11_00");	//Ты уже стал более ловким. Так держать!
	};
	if(DiegoNW_Merke_STR < other.aivar[REAL_STRENGTH])
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_03");	//(оценивающе) Очень хорошо. Твоя сила увеличилась.
	};
	Info_ClearChoices(DIA_DiegoNW_Teach);
};

func void DIA_DiegoNW_TeachDEX_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX))
	{
		B_BuildLearnDialog_Diego_NW();
	};
};

func void DIA_DiegoNW_TeachDEX_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX))
	{
		B_BuildLearnDialog_Diego_NW();
	};
};

func void DIA_DiegoNW_TeachSTR_1()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED))
	{
		B_BuildLearnDialog_Diego_NW();
	};
};

func void DIA_DiegoNW_TeachSTR_5()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED))
	{
		B_BuildLearnDialog_Diego_NW();
	};
};


instance DIA_DiegoNW_KnowWhereEnemy(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_KnowWhereEnemy_Condition;
	information = DIA_DiegoNW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Я собираюсь покинуть Хоринис.";
};


func int DIA_DiegoNW_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Diego_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_00");	//Я собираюсь покинуть Хоринис.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_01");	//Мудрое решение. Я был бы не прочь отправиться с тобой. Этот город изменился слишком быстро - времена, когда здесь можно было разбогатеть, уже в прошлом.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_02");	//Я мог бы научить тебя метко стрелять, пользоваться отмычками и мог бы повысить твою ловкость.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_03");	//Также, я уверен, тебе не помешает хороший вор.
	if(SCToldDiegoHeKnowWhereEnemy == FALSE)
	{
		B_LogEntry(Topic_Crew,"Конечно же, Диего готов пойти со мной. Ему кажется, что чем скорее он покинет Хоринис, тем лучше. Он мог бы научить меня, как стать более ловким и сделать из меня отличного лучника. Также он может научить меня пользоваться отмычками.");
		SCToldDiegoHeKnowWhereEnemy = TRUE;
	};
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_04");	//Я подумаю над этим. Но пока моя команда полностью укомплектована.
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_05");	//Не торопись. Я все равно никуда не денусь.
	}
	else
	{
		Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy,"Возможно, я дам тебе знать, когда придет время.",DIA_DiegoNW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy,"Почему бы тебе не отправиться в путь со мной? Встретимся в гавани.",DIA_DiegoNW_KnowWhereEnemy_Yes);
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_Yes_15_00");	//Почему бы тебе не отправиться в путь со мной? Встретимся у гавани.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_01");	//Хм-м, ты прав, в Хоринисе все равно нечего делать. Я поплыву с тобой.
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") && !ArmorEquipped(self,ITAR_Diego))
	{
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_02");	//Подожди, я буду готов через минуту.
		AI_SetWalkMode(self,NPC_RUN);
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		if(!Npc_HasItems(self,ITAR_Diego))
		{
			CreateInvItems(self,ITAR_Diego,1);
		};
		AI_EquipArmor(self,ITAR_Diego);
		AI_Wait(self,1);
		AI_GotoWP(self,"NW_CITY_UPTOWN_PATH_23");
	};
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_03");	//Ну, я готов. Встретимся у корабля.
	B_JoinShip(self);
};

func void DIA_DiegoNW_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_No_15_00");	//Возможно, я дам тебе знать, когда придет время.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_No_11_01");	//Попробуй. И, возможно, я даже присоединюсь к тебе. Кто знает?
	Diego_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
};


instance DIA_DiegoNW_LeaveMyShip(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_LeaveMyShip_Condition;
	information = DIA_DiegoNW_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Ты должен заботиться о городе.";
};


func int DIA_DiegoNW_LeaveMyShip_Condition()
{
	if((Diego_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_00");	//Ты должен заботиться о городе.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_01");	//Да? Я тебе больше не нужен? Ох, ладно. Не забудь заглянуть ко мне, когда вернешься в город.
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_02");	//Ты думаешь, мы еще встретимся?
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_03");	//Я никогда не забуду выражение твоего лица, когда ты лежал на земле после того, как Буллит вырубил тебя. Тогда мы встретились в первый раз.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_04");	//Им никогда не одолеть тебя. Мы ОБЯЗАТЕЛЬНО встретимся снова. Береги себя.
	if(!Npc_HasItems(self,ITAR_Vlk_H))
	{
		CreateInvItems(self,ITAR_Vlk_H,1);
	};
	if(!ArmorEquipped(self,ITAR_Vlk_H))
	{
		AI_EquipArmor(self,ITAR_Vlk_H);
	};
	Diego_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count -= 1;
	if(MIS_DiegosResidence == LOG_SUCCESS)
	{
		Npc_ExchangeRoutine(self,"GERBRANDT");
	}
	else
	{
		Npc_ExchangeRoutine(self,"START");
	};
};


instance DIA_DiegoNW_StillNeedYou(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_StillNeedYou_Condition;
	information = DIA_DiegoNW_StillNeedYou_Info;
	permanent = TRUE;
	description = "Возвращайся. Я хочу, чтобы ты сопровождал меня.";
};


func int DIA_DiegoNW_StillNeedYou_Condition()
{
	if(((Diego_IsOnBoard == LOG_OBSOLETE) || (Diego_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		if(Diego_WasOnBoard == TRUE)
		{
			DIA_DiegoNW_StillNeedYou.description = "Возвращайся. Я хочу, чтобы ты сопровождал меня.";
		}
		else
		{
			DIA_DiegoNW_StillNeedYou.description = "Мне не помешала бы твоя помощь.";
		};
		return TRUE;
	};
};

func void DIA_DiegoNW_StillNeedYou_Info()
{
	if(Diego_WasOnBoard == TRUE)
	{
		AI_Output(other,self,"DIA_DiegoNW_StillNeedYou_15_00");	//Возвращайся. Я хочу, чтобы ты сопровождал меня.
		AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_01");	//Куда подевалась твоя решительность, друг? Конечно, я присоединюсь к тебе - ты только определись с тем, что тебе нужно.
	}
	else
	{
		AI_Output(other,self,"DIA_Sylvio_DUHIER_15_00");	//Мне не помешала бы твоя помощь.
	};
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") && !ArmorEquipped(self,ITAR_Diego))
	{
		AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_02");	//Подожди, я буду готов через минуту.
		AI_SetWalkMode(self,NPC_RUN);
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		if(!Npc_HasItems(self,ITAR_Diego))
		{
			CreateInvItems(self,ITAR_Diego,1);
		};
		AI_EquipArmor(self,ITAR_Diego);
		AI_Wait(self,1);
		AI_GotoWP(self,"NW_CITY_UPTOWN_PATH_23");
	};
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_03");	//Отлично, мы можем идти.
	B_JoinShip(self);
};


instance DIA_Thief_NW_PICKPOCKET(C_Info)
{
	npc = PC_Thief_NW;
	nr = 900;
	condition = DIA_Thief_NW_PICKPOCKET_Condition;
	information = DIA_Thief_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120;
};


func int DIA_Thief_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(120,600);
};

func void DIA_Thief_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
	Info_AddChoice(DIA_Thief_NW_PICKPOCKET,Dialog_Back,DIA_Thief_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thief_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Thief_NW_PICKPOCKET_DoIt);
};

func void DIA_Thief_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
};

func void DIA_Thief_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
};

