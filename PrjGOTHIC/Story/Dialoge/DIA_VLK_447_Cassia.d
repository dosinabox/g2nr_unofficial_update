
instance DIA_Cassia_EXIT(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 999;
	condition = DIA_Cassia_EXIT_Condition;
	information = DIA_Cassia_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cassia_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cassia_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cassia_PICKME(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 900;
	condition = DIA_Cassia_PICKME_Condition;
	information = DIA_Cassia_PICKME_Info;
	permanent = TRUE;
	description = Pickpocket_100_Female;
};


func int DIA_Cassia_PICKME_Condition()
{
	return C_Beklauen(100,400);
};

func void DIA_Cassia_PICKME_Info()
{
	Info_ClearChoices(DIA_Cassia_PICKME);
	Info_AddChoice(DIA_Cassia_PICKME,Dialog_Back,DIA_Cassia_PICKME_BACK);
	Info_AddChoice(DIA_Cassia_PICKME,DIALOG_PICKPOCKET,DIA_Cassia_PICKME_DoIt);
};

func void DIA_Cassia_PICKME_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Cassia_PICKME);
};

func void DIA_Cassia_PICKME_BACK()
{
	Info_ClearChoices(DIA_Cassia_PICKME);
};


instance DIA_Cassia_Gilde(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_Gilde_Condition;
	information = DIA_Cassia_Gilde_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cassia_Gilde_Condition()
{
	if((Cassia_Gildencheck == TRUE) && (Join_Thiefs == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Gilde_Info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_00");	//Я вижу, ты стал служителем закона и порядка.
		AI_Output(self,other,"DIA_Cassia_Gilde_16_01");	//Но то, что ты теперь служишь Инносу, для нас значения не имеет. Ты один из нас. И я надеюсь, что ты это тоже понимаешь.
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_02");	//Так ты теперь служитель церкви Инноса? Отлично. Но ты помимо этого один из нас - надеюсь, ты никогда это не забудешь.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Cassia_Abgelaufen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Abgelaufen_Condition;
	information = DIA_Cassia_Abgelaufen_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cassia_Abgelaufen_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Cassia_Frist == TRUE) && (Cassia_Day < (B_GetDayPlus() - 2)))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Abgelaufen_Info()
{
	AI_Output(self,other,"DIA_Cassia_Abgelaufen_16_00");	//Твой срок истек. Тебе не следовало возвращаться.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};


instance DIA_Cassia_News(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_News_Condition;
	information = DIA_Cassia_News_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cassia_News_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_News_Info()
{
	if(MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_News_16_00");	//Я вижу, ты получил наш подарок. Я Кассия.
		AI_Output(other,self,"DIA_Cassia_News_15_01");	//Хорошо, Кассия. Теперь скажи мне, зачем я здесь?
		AI_Output(self,other,"DIA_Cassia_News_16_02");	//Ты привлек наше внимание тем, что завоевал доверие одного из наших друзей.
		AI_Output(self,other,"DIA_Cassia_News_16_03");	//И мы хотим дать тебе шанс. Ты можешь присоединиться к нам.
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_News_16_04");	//Только посмотрите, кто нашел дорогу сюда. Аттила недооценил тебя. Но я не сделаю такой ошибки.
		AI_Output(other,self,"DIA_Cassia_News_15_05");	//Что это за игры?
		AI_Output(self,other,"DIA_Cassia_News_16_06");	//Мы хотели, чтобы ты умер за то, что сдал одного из наших друзей. Вот почему мы послали Аттилу.
		AI_Output(self,other,"DIA_Cassia_News_16_07");	//Твое присутствие здесь, однако, открывает новые возможности...
		AI_Output(other,self,"DIA_Cassia_News_15_08");	//... что ты хочешь предложить мне?
		AI_Output(self,other,"DIA_Cassia_News_16_09");	//Ты можешь присоединиться к нам.
	};
	if((Npc_GetTrueGuild(other) == GIL_NONE) || (Npc_GetTrueGuild(other) == GIL_NOV))
	{
		Cassia_Gildencheck = TRUE;
	};
	DG_gefunden = TRUE;
};


instance DIA_Cassia_mehr(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_mehr_Condition;
	information = DIA_Cassia_mehr_Info;
	permanent = FALSE;
	description = "Расскажи мне о вашей организации.";
};


func int DIA_Cassia_mehr_Condition()
{
	return TRUE;
};

func void DIA_Cassia_mehr_Info()
{
	AI_Output(other,self,"DIA_Cassia_mehr_15_00");	//Расскажи мне о вашей организации.
	AI_Output(self,other,"DIA_Cassia_mehr_16_01");	//Горожане недолюбливают нас. Но никто не знает, где находится наше укрытие.
	AI_Output(self,other,"DIA_Cassia_mehr_16_02");	//Те немногие, что вообще знают, что канализация существует, полагают, что она закрыта, и в нее невозможно попасть.
	AI_Output(self,other,"DIA_Cassia_mehr_16_03");	//И пока они не найдут нас, мы можем работать спокойно.
};


instance DIA_Cassia_MissingPeople(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_MissingPeople_Condition;
	information = DIA_Cassia_MissingPeople_Info;
	permanent = FALSE;
	description = "Что ты знаешь о пропавших людях?";
};


func int DIA_Cassia_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_00");	//Что ты знаешь о пропавших людях?
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_01");	//А почему это так интересует тебя?
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_02");	//Я хочу выяснить, что случилось с ними.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_03");	//Когда выйдешь из канализации, плыви вдоль побережья вправо.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_04");	//Там ты найдешь ответы на интересующие тебя вопросы...
};


instance DIA_Cassia_Vorteil(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_Vorteil_Condition;
	information = DIA_Cassia_Vorteil_Info;
	permanent = FALSE;
	description = "А какая мне выгода от присоединения к вам?";
};


func int DIA_Cassia_Vorteil_Condition()
{
	return TRUE;
};

func void DIA_Cassia_Vorteil_Info()
{
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_00");	//А какая мне выгода от присоединения к вам?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_01");	//Ты можешь научиться у нас особым навыкам - навыкам, которые позволят тебе жить в роскоши.
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_02");	//Но для этого мне придется скрываться здесь, да?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_03");	//(тихо смеется) Нет. Тебе только нужно придерживаться наших правил. Вот и все.
};


instance DIA_Cassia_Lernen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 4;
	condition = DIA_Cassia_Lernen_Condition;
	information = DIA_Cassia_Lernen_Info;
	permanent = FALSE;
	description = "Чему я могу научиться у вас?";
};


func int DIA_Cassia_Lernen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Vorteil))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Lernen_Info()
{
	AI_Output(other,self,"DIA_Cassia_Lernen_15_00");	//Чему я могу научиться у вас?
	AI_Output(self,other,"DIA_Cassia_Lernen_16_01");	//Джеспер может научить тебя передвигаться бесшумно.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_02");	//Рамирез - чрезвычайно одаренный медвежатник. Ни один замок не устоит перед его отмычками.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_03");	//А я могу научить тебя карманному воровству.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_04");	//Также я могу помочь тебе стать более ловким. Именно ловкость - ключ к воровским способностям.
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Кассия может обучить меня карманному воровству и помочь мне стать более ловким.");
	B_LogEntry(TOPIC_CityTeacher,"Рамирез может обучить меня пользоваться отмычками.");
	B_LogEntry(TOPIC_CityTeacher,"Джеспер может обучить меня красться.");
};


instance DIA_Cassia_Regeln(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_Regeln_Condition;
	information = DIA_Cassia_Regeln_Info;
	permanent = FALSE;
	description = "Что у вас за правила?";
};


func int DIA_Cassia_Regeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Vorteil))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Regeln_Info()
{
	AI_Output(other,self,"DIA_Cassia_Regeln_15_00");	//Что у вас за правила?
	AI_Output(self,other,"DIA_Cassia_Regeln_16_02");	//Первое правило: никому ни слова о нас. Никогда.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_03");	//Второе: Не попадайся.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_04");	//Третье: если ты обнажишь оружие здесь, чтобы напасть на кого-нибудь, мы убьем тебя.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_05");	//И четвертое - последнее правило: тот, кто хочет присоединиться к нам, должен доказать серьезность своих намерений.
};


instance DIA_Cassia_Erwischen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Erwischen_Condition;
	information = DIA_Cassia_Erwischen_Info;
	permanent = FALSE;
	description = "Что будет, если меня поймают?";
};


func int DIA_Cassia_Erwischen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Regeln))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Erwischen_Info()
{
	AI_Output(other,self,"DIA_Cassia_Erwischen_15_00");	//Что будет, если меня поймают?
	AI_Output(self,other,"DIA_Cassia_Erwischen_16_01");	//Просто не попадайся, хорошо?
};


instance DIA_Cassia_beweisen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_beweisen_Condition;
	information = DIA_Cassia_beweisen_Info;
	permanent = TRUE;
	description = "Как мне доказать серьезность моих намерений?";
};


var int DIA_Cassia_beweisen_permanent;

func int DIA_Cassia_beweisen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Regeln) && (DIA_Cassia_beweisen_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_beweisen_Info()
{
	AI_Output(other,self,"DIA_Cassia_beweisen_15_00");	//Как мне доказать серьезность моих намерений?
	if(Join_Thiefs == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_01");	//Так ты присоединишься к нам или нет?
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_02");	//У этого упрямого алхимика - Константино, есть прекрасное кольцо.
		AI_Output(self,other,"DIA_Cassia_beweisen_16_03");	//Но оно ему совсем ни к чему. Я хочу, чтобы оно украшало мою руку.
		MIS_CassiaRing = LOG_Running;
		DIA_Cassia_beweisen_permanent = TRUE;
		Log_CreateTopic(Topic_CassiaRing,LOG_MISSION);
		Log_SetTopicStatus(Topic_CassiaRing,LOG_Running);
		B_LogEntry(Topic_CassiaRing,"Кассия хочет, чтобы я принес ей кольцо Константино.");
	};
};


instance DIA_Cassia_Beitreten(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 10;
	condition = DIA_Cassia_Beitreten_Condition;
	information = DIA_Cassia_Beitreten_Info;
	permanent = FALSE;
	description = "Хорошо, я в деле.";
};


func int DIA_Cassia_Beitreten_Condition()
{
	if((Join_Thiefs == FALSE) && Npc_KnowsInfo(other,DIA_Cassia_Regeln))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Beitreten_Info()
{
	AI_Output(other,self,"DIA_Cassia_Beitreten_15_00");	//Хорошо, я в деле.
	AI_Output(self,other,"DIA_Cassia_Beitreten_16_01");	//Отлично. Тебе будет дана возможность проявить себя. А если ты захочешь чему-нибудь научиться у нас - всегда пожалуйста.
	Join_Thiefs = TRUE;
};


instance DIA_Cassia_Ablehnen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 9;
	condition = DIA_Cassia_Ablehnen_Condition;
	information = DIA_Cassia_Ablehnen_Info;
	permanent = FALSE;
	description = "А что если я не хочу присоединяться к вам?..";
};


func int DIA_Cassia_Ablehnen_Condition()
{
	if((Join_Thiefs == FALSE) && Npc_KnowsInfo(other,DIA_Cassia_Regeln))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Ablehnen_Info()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_15_00");	//А что если я не хочу присоединяться к вам?..
	if(MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_01");	//Ты теряешь шанс, который дается один раз в жизни, но ты можешь идти.
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_02");	//(серьезно) И даже не думай, чтобы предать нас. Ты горько пожалеешь об этом.
		Info_ClearChoices(DIA_Cassia_Ablehnen);
		Info_AddChoice(DIA_Cassia_Ablehnen,"Хорошо, я в деле.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice(DIA_Cassia_Ablehnen,"Мне нужно время на размышление.",DIA_Cassia_Ablehnen_Frist);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_03");	//В таком случае, я убью тебя.
		Info_ClearChoices(DIA_Cassia_Ablehnen);
		Info_AddChoice(DIA_Cassia_Ablehnen,"Хорошо, я в деле.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice(DIA_Cassia_Ablehnen,"Ну, тогда попробуй меня убить.",DIA_Cassia_Ablehnen_Kill);
	};
};

func void DIA_Cassia_Ablehnen_Okay()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Okay_15_00");	//Хорошо, я в деле.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_01");	//(улыбается) Ты принял мудрое решение. Если ты сможешь доказать серьезность своих намерений, то сможешь влиться в наши ряды.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_02");	//Если же ты хочешь сначала получить воровские навыки - пожалуйста - они тебе понадобятся.
	Join_Thiefs = TRUE;
	Info_ClearChoices(DIA_Cassia_Ablehnen);
};

func void DIA_Cassia_Ablehnen_Kill()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Kill_15_00");	//Ну, тогда попробуй меня убить.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Kill_16_01");	//Жаль. Я думала, ты умнее.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Cassia_Ablehnen_Frist()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Frist_15_00");	//Мне нужно время на размышление.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Frist_16_01");	//Пожалуйста. Я дам тебе два дня на принятие этого решения. После этого, тебе лучше не появляться здесь.
	Cassia_Day = B_GetDayPlus();
	Cassia_Frist = TRUE;
	Info_ClearChoices(DIA_Cassia_Ablehnen);
};


instance DIA_Cassia_BevorLernen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 5;
	condition = DIA_Cassia_BevorLernen_Condition;
	information = DIA_Cassia_BevorLernen_Info;
	permanent = TRUE;
	description = "Ты можешь обучить меня?";
};


func int DIA_Cassia_BevorLernen_Condition()
{
	if((Join_Thiefs == TRUE) && Npc_KnowsInfo(other,DIA_Cassia_Lernen) && ((Cassia_TeachPickpocket == FALSE) || (Cassia_TeachDEX == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Cassia_BevorLernen_Info()
{
	AI_Output(other,self,"DIA_Cassia_BevorLernen_15_00");	//Ты можешь обучить меня?
	if(MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_01");	//Конечно, нет проблем. Просто скажи мне, когда будешь готов.
		Cassia_TeachPickpocket = TRUE;
		Cassia_TeachDEX = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_02");	//Конечно. Карманное воровство и ловкость обойдутся тебе по 100 золотых монет.
		Info_ClearChoices(DIA_Cassia_BevorLernen);
		Info_AddChoice(DIA_Cassia_BevorLernen,"Может быть, позже ...(НАЗАД)",DIA_Cassia_BevorLernen_Spaeter);
		if(Cassia_TeachPickpocket == FALSE)
		{
			Info_AddChoice(DIA_Cassia_BevorLernen,"Я хочу научиться карманному воровству (заплатить 100 золотых).",DIA_Cassia_BevorLernen_Pickpocket);
		};
		if(Cassia_TeachDEX == FALSE)
		{
			Info_AddChoice(DIA_Cassia_BevorLernen,"Я хочу стать более ловким (заплатить 100 золотых).",DIA_Cassia_BevorLernen_DEX);
		};
	};
};

func void DIA_Cassia_BevorLernen_Spaeter()
{
	Info_ClearChoices(DIA_Cassia_BevorLernen);
};

func void DIA_Cassia_BevorLernen_DEX()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_DEX_15_00");	//Я хочу стать более ловким. Вот золото.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_DEX_16_01");	//Мы можем начать, когда ты будешь готов.
		Cassia_TeachDEX = TRUE;
		Info_ClearChoices(DIA_Cassia_BevorLernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02");	//Возвращайся, когда у тебя будет золото.
		Info_ClearChoices(DIA_Cassia_BevorLernen);
	};
};

func void DIA_Cassia_BevorLernen_Pickpocket()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_Pickpocket_15_00");	//Я хочу научиться карманному воровству. Вот золото.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_01");	//Мы можем начать, когда ты будешь готов.
		Cassia_TeachPickpocket = TRUE;
		Info_ClearChoices(DIA_Cassia_BevorLernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_02");	//Возвращайся, когда у тебя будет золото.
		Info_ClearChoices(DIA_Cassia_BevorLernen);
	};
};


instance DIA_Cassia_TEACH(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 12;
	condition = DIA_Cassia_TEACH_Condition;
	information = DIA_Cassia_TEACH_Info;
	permanent = TRUE;
	description = "Я хочу стать более ловким.";
};


func int DIA_Cassia_TEACH_Condition()
{
	if(Cassia_TeachDEX == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cassia_TEACH_Info()
{
	AI_Output(other,self,"DIA_Cassia_TEACH_15_00");	//Я хочу стать более ловким.
	Info_ClearChoices(DIA_Cassia_TEACH);
	Info_AddChoice(DIA_Cassia_TEACH,Dialog_Back,DIA_Cassia_TEACH_BACK);
	Info_AddChoice(DIA_Cassia_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice(DIA_Cassia_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Cassia_TEACH_5);
};

func void DIA_Cassia_TEACH_BACK()
{
	Info_ClearChoices(DIA_Cassia_TEACH);
};

func void DIA_Cassia_TEACH_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(DIA_Cassia_TEACH);
	Info_AddChoice(DIA_Cassia_TEACH,Dialog_Back,DIA_Cassia_TEACH_BACK);
	Info_AddChoice(DIA_Cassia_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice(DIA_Cassia_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Cassia_TEACH_5);
};

func void DIA_Cassia_TEACH_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(DIA_Cassia_TEACH);
	Info_AddChoice(DIA_Cassia_TEACH,Dialog_Back,DIA_Cassia_TEACH_BACK);
	Info_AddChoice(DIA_Cassia_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice(DIA_Cassia_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Cassia_TEACH_5);
};


instance DIA_Cassia_Pickpocket(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 10;
	condition = DIA_Cassia_Pickpocket_Condition;
	information = DIA_Cassia_Pickpocket_Info;
	permanent = TRUE;
	description = "Научи меня карманному воровству (10 LP)";
};


func int DIA_Cassia_Pickpocket_Condition()
{
	if((Cassia_TeachPickpocket == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Pickpocket_Info()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_15_00");	//Научи меня карманному воровству.
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKPOCKET))
	{
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_01");	//Если ты хочешь обчистить чьи-нибудь карманы, отвлеки его. Просто начни говорить с ним, поболтай.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_02");	//А когда будешь разговаривать, оцени его. Обращай внимание на оттопыривающиеся карманы, драгоценности или кожаный шнурок на шее. И, самое главное, попытайся оценить, насколько он осторожен.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_03");	//Обокрасть пьяного поденного рабочего - это далеко не то же самое, что украсть у бдительного торговца. Помни об этом.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_04");	//Если ты неуклюж, он конечно же почует недоброе. И, превыше всего: всегда сохраняй хладнокровие.
	};
};


instance DIA_Cassia_Aufnahme(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Aufnahme_Condition;
	information = DIA_Cassia_Aufnahme_Info;
	permanent = FALSE;
	description = "Я принес кольцо Константино.";
};


func int DIA_Cassia_Aufnahme_Condition()
{
	if((MIS_CassiaRing == LOG_Running) && (Npc_HasItems(other,ItRi_Prot_Point_01_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Aufnahme_Info()
{
	AI_Output(other,self,"DIA_Cassia_Aufnahme_15_00");	//Я принес кольцо Константино.
	B_GiveInvItems(other,self,ItRi_Prot_Point_01_MIS,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_01");	//Поздравляю. Ты прошел вступительный тест. Теперь ты один из нас.
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_02");	//Возьми этот ключ. Он открывает дверь в отель. (улыбается) Теперь тебе не придется каждый раз плыть сюда.
	B_GiveInvItems(self,other,ItKe_ThiefGuildKey_Hotel_MIS,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_03");	//Кроме того, ты должен знать, что у нас есть секретный знак. Особый кивок.
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_04");	//Вот такой. Когда ты говоришь с правильными людьми и делаешь этот знак, они поймут, что ты один из нас.
	MIS_CassiaRing = LOG_SUCCESS;
	B_GivePlayerXP(XP_CassiaRing);
	Knows_SecretSign = TRUE;
	Log_CreateTopic(Topic_Diebesgilde,LOG_NOTE);
	B_LogEntry(Topic_Diebesgilde,"Я был принят в гильдию воров.");
	B_LogEntry(Topic_Diebesgilde,"Я знаю знак воров. Если я покажу его нужным людям, они поймут, что я один из них.");
};


instance DIA_Cassia_Versteck(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Versteck_Condition;
	information = DIA_Cassia_Versteck_Info;
	permanent = FALSE;
	description = "А где вы прячете награбленное?";
};


func int DIA_Cassia_Versteck_Condition()
{
	if((MIS_CassiaRing == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Ramirez_Beute))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Versteck_Info()
{
	AI_Output(other,self,"DIA_Cassia_Versteck_15_00");	//А где вы прячете награбленное?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_01");	//Ты думаешь, я тебе вот так просто все и выложу?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_02");	//У тебя будет достаточно возможностей самому сколотить состояние. Помни - жадные обычно остаются ни с чем.
};


instance DIA_Cassia_Blutkelche(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Blutkelche_Condition;
	information = DIA_Cassia_Blutkelche_Info;
	permanent = FALSE;
	description = "У тебя есть работа для меня?";
};


func int DIA_Cassia_Blutkelche_Condition()
{
	if((MIS_CassiaRing == LOG_SUCCESS) && (MIS_CassiaKelche != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Blutkelche_Info()
{
	AI_Output(other,self,"DIA_Cassia_Blutkelche_15_00");	//У тебя есть работа для меня?
	if(PETZCOUNTER_City_Theft > 0)
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_01");	//Нет, пока ты разыскиваешься в городе за воровство.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_02");	//Урегулируй эту проблему - заплати штраф или избавься от свидетелей. Меня не волнует, как ты это сделаешь, лишь бы этой проблемы больше не было.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_03");	//Да. Меня интересует коллекция кубков. Всего их шесть.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_04");	//Король Робар захватил их как-то во время одной из своих кампаний - но для этого ему пришлось положить очень много своих людей. Вот почему они называются Кровавые Кубки.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_05");	//Каждый из кубков сам по себе не особенно ценен - но все шесть, собранные вместе, стоят целое состояние.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_06");	//Где эти кубки?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_07");	//Они здесь, в городе - ими владеют богатые торговцы из верхнего квартала.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_08");	//Принеси их мне. А тем временем я подыщу покупателя для них.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_09");	//А мне что с этого будет?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_10");	//Либо половина от дохода, либо ты сможешь выбрать что-нибудь из моей сокровищницы.
		MIS_CassiaKelche = LOG_Running;
		Log_CreateTopic(Topic_CassiaKelche,LOG_MISSION);
		Log_SetTopicStatus(Topic_CassiaKelche,LOG_Running);
		B_LogEntry(Topic_CassiaKelche,"Кассия хочет, чтобы я принес ей шесть кровавых кубков. По-видимому, они находятся в городе.");
	};
};


instance DIA_Cassia_abgeben(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_abgeben_Condition;
	information = DIA_Cassia_abgeben_Info;
	permanent = TRUE;
	description = "Насчет Кровавых Кубков...";
};


func int DIA_Cassia_abgeben_Condition()
{
	if(MIS_CassiaKelche == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Cassia_abgeben_Info()
{
	AI_Output(other,self,"DIA_Cassia_abgeben_15_00");	//Насчет Кровавых Кубков...
	if(B_GiveInvItems(other,self,ItMi_BloodCup_MIS,6))
	{
		AI_Output(other,self,"DIA_Cassia_abgeben_15_01");	//У меня есть все шесть кубков.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_02");	//Отличная работа. А я тем временем подыскала покупателя.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_03");	//Ты можешь получить свою награду. Спасибо, что сделал это для меня.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_04");	//Мне больше нечего тебе предложить, но ты можешь учиться у меня, когда захочешь. Ну и всегда помни - на этом острове много что плохо лежит... (улыбается)
		MIS_CassiaKelche = LOG_SUCCESS;
		B_GivePlayerXP(XP_CassiaBlutkelche);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_abgeben_16_05");	//Я могу продать эти кубки только все вместе. Принеси мне все шесть.
	};
};


instance DIA_Cassia_Belohnung(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Belohnung_Condition;
	information = DIA_Cassia_Belohnung_Info;
	permanent = FALSE;
	description = "Я пришел за своей наградой.";
};


func int DIA_Cassia_Belohnung_Condition()
{
	if(MIS_CassiaKelche == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Cassia_Belohnung_Info()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_00");	//Я пришел за своей наградой.
	AI_Output(self,other,"DIA_Cassia_Belohnung_16_01");	//Что ты выбираешь?
	Info_ClearChoices(DIA_Cassia_Belohnung);
	Info_AddChoice(DIA_Cassia_Belohnung,"400 золотых.",DIA_Cassia_Belohnung_Gold);
	Info_AddChoice(DIA_Cassia_Belohnung,"4 лечебных эликсира",DIA_Cassia_Belohnung_Trank);
	Info_AddChoice(DIA_Cassia_Belohnung,NAME_ADDON_CASSIASBELOHNUNGSRING,DIA_Cassia_Belohnung_Ring);
};

func void DIA_Cassia_Belohnung_Gold()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_02");	//Дай мне золото.
	B_GiveInvItems(self,other,ItMi_Gold,400);
	Info_ClearChoices(DIA_Cassia_Belohnung);
};

func void DIA_Cassia_Belohnung_Trank()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_03");	//Дай мне зелья.
	B_GiveInvItems(self,other,ItPo_Health_03,4);
	Info_ClearChoices(DIA_Cassia_Belohnung);
};

func void DIA_Cassia_Belohnung_Ring()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_04");	//Дай мне кольцо.
	B_GiveInvItems(self,other,ItRi_HP_01,1);
	Info_ClearChoices(DIA_Cassia_Belohnung);
};

