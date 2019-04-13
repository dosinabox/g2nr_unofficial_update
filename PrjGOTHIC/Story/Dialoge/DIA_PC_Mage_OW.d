
instance DIA_MiltenOW_EXIT(C_Info)
{
	npc = PC_Mage_OW;
	nr = 999;
	condition = DIA_MiltenOW_EXIT_Condition;
	information = DIA_MiltenOW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenOW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MiltenOW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenOW_Hello(C_Info)
{
	npc = PC_Mage_OW;
	nr = TRUE;
	condition = DIA_MiltenOW_Hello_Condition;
	information = DIA_MiltenOW_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_MiltenOW_Hello_Condition()
{
	return TRUE;
};

func void DIA_MiltenOW_Hello_Info()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_03_00");	//Посмотрите, кто вернулся! Наш герой из-за Барьера!
	Info_ClearChoices(DIA_MiltenOW_Hello);
	Info_AddChoice(DIA_MiltenOW_Hello,"Рад видеть тебя, Милтен. Ты все еще здесь или здесь опять?",DIA_MiltenOW_Hello_YES);
	Info_AddChoice(DIA_MiltenOW_Hello,"Я должен знать тебя?",DIA_MiltenOW_Hello_NO);
};

func void B_Milten_GornDiegoLester()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_02");	//Ты помнишь Горна, Диего и Лестера?
};

func void DIA_MiltenOW_Hello_YES()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_YES_15_00");	//Рад видеть тебя, Милтен. Ты все еще здесь или здесь опять?
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_01");	//Опять. После того, как Барьер рухнул, я вступил в монастырь магов Огня.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_02");	//Но когда стало ясно, что паладины хотят отправиться сюда, мой опыт и знание этих мест оказались весьма полезными.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_03");	//Поэтому было решено доверить мне эту священную миссию обеспечения магической поддержки этой экспедиции.
	B_Milten_GornDiegoLester();
	Info_ClearChoices(DIA_MiltenOW_Hello);
	Info_AddChoice(DIA_MiltenOW_Hello,"Конечно же, я помню парней.",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice(DIA_MiltenOW_Hello,"Эти имена ни о чем мне не говорят.",DIA_MiltenOW_Hello_Forget);
};

func void DIA_MiltenOW_Hello_NO()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_NO_15_00");	//Я должен знать тебя?
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_01");	//Ты через многое прошел, да?
	B_Milten_GornDiegoLester();
	Info_ClearChoices(DIA_MiltenOW_Hello);
	Info_AddChoice(DIA_MiltenOW_Hello,"Как здесь обстоят дела?",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice(DIA_MiltenOW_Hello,"Эти имена ни о чем мне не говорят.",DIA_MiltenOW_Hello_Forget);
};

func void DIA_MiltenOW_Hello_Friends()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_00");	//Конечно же, я помню парней.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_01");	//Ну, Горн и Диего не ушли далеко. Их подобрали паладины здесь, в долине.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_02");	//Лестер исчез, впрочем - и я понятия не имею, где он сейчас ошивается.
	if(Npc_KnowsInfo(other,DIA_Lester_Hello))
	{
		AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_03");	//Я встретил Лестера - он теперь с Ксардасом.
		AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_04");	//Ну, хоть какие-то хорошие новости.
	};
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_05");	//Ну, а у меня нет ничего хорошего.
	Knows_Diego = TRUE;
	Info_ClearChoices(DIA_MiltenOW_Hello);
};

func void DIA_MiltenOW_Hello_Forget()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Forget_15_00");	//Эти имена ни о чем мне не говорят.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_01");	//Ты многое забыл, да? Что ж, оставим прошлое в покое и посвятим себя делам нынешних дней.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_02");	//Хотя у меня и нет приятных новостей.
	Info_ClearChoices(DIA_MiltenOW_Hello);
};


instance DIA_MiltenOW_Bericht(C_Info)
{
	npc = PC_Mage_OW;
	nr = 3;
	condition = DIA_MiltenOW_Bericht_Condition;
	information = DIA_MiltenOW_Bericht_Info;
	permanent = FALSE;
	description = "Как здесь обстоят дела?";
};


func int DIA_MiltenOW_Bericht_Condition()
{
	if(Npc_KnowsInfo(other,DIA_MiltenOW_Hello))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Bericht_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Bericht_15_00");	//Как здесь обстоят дела?
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_01");	//Паладины пришли сюда, чтобы добывать магическую руду.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_02");	//Но из-за всех этих нападений драконов и орков я сомневаюсь, что паладины уйдут отсюда с рудой.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_03");	//Нет, клянусь Инносом - я чувствую присутствие чего-то темного... какого-то Зла, оно разрастается здесь. Что-то темное поднимается от этой долины.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_04");	//Мы заплатили высокую цену за уничтожение Спящего. Разрушение Барьера погубило и это место.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_05");	//Мы можем считать себя счастливчиками, если нам удастся пережить все это.
};


instance DIA_MiltenOW_Erz(C_Info)
{
	npc = PC_Mage_OW;
	nr = 4;
	condition = DIA_MiltenOW_Erz_Condition;
	information = DIA_MiltenOW_Erz_Info;
	permanent = FALSE;
	description = "Сколько руды удалось добыть?";
};


func int DIA_MiltenOW_Erz_Condition()
{
	if(Npc_KnowsInfo(other,DIA_MiltenOW_Bericht))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Erz_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Erz_15_00");	//Сколько руды удалось добыть?
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_01");	//Сколько руды? Ни одного ящика! У нас уже давно нет вестей от старателей.
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_02");	//Я не удивлюсь, если они все давно мертвы. А нас атакуют драконы и осаждают орки!
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_03");	//Эта экспедиция обернулась полным провалом.
};


instance DIA_MiltenOW_Wo(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Wo_Condition;
	information = DIA_MiltenOW_Wo_Info;
	permanent = FALSE;
	description = "А где сейчас Горн и Диего?";
};


func int DIA_MiltenOW_Wo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_MiltenOW_Hello) && (Knows_Diego == TRUE))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Wo_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Wo_Forget_15_00");	//А где сейчас Горн и Диего?
	if(MIS_RescueGorn != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_01");	//Ну, Горн сидит здесь, в темнице, за то, что сопротивлялся аресту.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_01");	//Горн, похоже, ничуть не изменился после заключения в тюрьме Гаронда.
	};
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_02");	//Диего прикрепили к отряду старателей. Спроси паладина Парсиваля, он отправлял этот отряд.
	KnowsAboutGorn = TRUE;
	SearchForDiego = LOG_Running;
};


instance DIA_MiltenOW_Gorn(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Gorn_Condition;
	information = DIA_MiltenOW_Gorn_Info;
	permanent = FALSE;
	description = "Пойдем, освободим Горна!";
};


func int DIA_MiltenOW_Gorn_Condition()
{
	if((KnowsAboutGorn == TRUE) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Gorn_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_00");	//Пойдем, освободим Горна!
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_01");	//Ну... проблема заключается в том, что Горн - осужденный заключенный.
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_02");	//Но если нам повезет, Гаронд согласится на сделку и мы сможем купить Горну свободу.
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_03");	//Да, может быть...
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_04");	//Держи меня в курсе.
	Log_CreateTopic(TOPIC_RescueGorn,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RescueGorn,LOG_Running);
	B_LogEntry(TOPIC_RescueGorn,"Командующий Гаронд посадил Горна в тюрьму. Возможно, с ним можно договориться и нам удастся вытащить беднягу.");
};


instance DIA_MiltenOW_Preis(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Preis_Condition;
	information = DIA_MiltenOW_Preis_Info;
	permanent = FALSE;
	description = "Гаронд хочет 1000 золотых монет за Горна.";
};


func int DIA_MiltenOW_Preis_Condition()
{
	if((MIS_RescueGorn == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Preis_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Preis_15_00");	//Гаронд хочет 1000 золотых монет за Горна.
	AI_Output(self,other,"DIA_MiltenOW_Preis_03_01");	//Немаленькая сумма. Я могу пожертвовать 250 монет.
	B_GiveInvItems(self,other,ItMi_Gold,250);
	B_LogEntry(TOPIC_RescueGorn,"Милтен дал мне 250 золотых, чтобы я заплатил за освобождение Горна.");
};


instance DIA_MiltenOW_Mehr(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Mehr_Condition;
	information = DIA_MiltenOW_Mehr_Info;
	permanent = FALSE;
	description = "Мне нужно больше золота, чтобы купить свободу Горна.";
};


func int DIA_MiltenOW_Mehr_Condition()
{
	if((MIS_RescueGorn == LOG_Running) && (Kapitel == 2) /* && (Npc_HasItems(other,ItMi_Gold) < 1000) */ && Npc_KnowsInfo(other,DIA_MiltenOW_Preis))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Mehr_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mehr_15_00");	//Мне нужно больше золота, чтобы купить свободу Горна.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_01");	//Добыть еще золота... Хм, Диего мог бы помочь, но его здесь нет.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_02");	//Может, Горн припрятал где-нибудь золото для себя. Нужно выяснить это.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_03");	//Я напишу ему записку - вот, попробуй передать ее в темницу.
	B_GiveInvItems(self,other,ItWr_LetterForGorn_MIS,1);
	B_LogEntry(TOPIC_RescueGorn,"Милтен дал мне записку для Горна. Если я смогу пробраться в тюрьму, возможно, Горн сможет сообщить, не припрятал ли он где-нибудь немного золота.");
};


instance DIA_MiltenOW_Equipment(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Equipment_Condition;
	information = DIA_MiltenOW_Equipment_Info;
	permanent = FALSE;
	description = "Ты можешь обеспечить меня снаряжением? Гаронд попросил меня отправиться в шахты.";
};


func int DIA_MiltenOW_Equipment_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garond_Equipment) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Equipment_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Equipmentt_15_00");	//Ты можешь обеспечить меня снаряжением? Гаронд попросил меня отправиться в шахты.
	AI_Output(self,other,"DIA_MiltenOW_Equipment_03_01");	//И где я, по-твоему, возьму его? Единственное, что я могу тебе дать - это ценный рунный камень.
	B_GiveInvItems(self,other,ItMi_RuneBlank,1);
};


instance DIA_MiltenOW_Versteck(C_Info)
{
	npc = PC_Mage_OW;
	nr = 1;
	condition = DIA_MiltenOW_Versteck_Condition;
	information = DIA_MiltenOW_Versteck_Info;
	permanent = FALSE;
	important = FALSE;
	description = "Я получил ответ от Горна. Он говорит, что его золото находится у южных ворот.";
};


func int DIA_MiltenOW_Versteck_Condition()
{
	if((GornsTreasure == TRUE) && !Npc_HasItems(other,ItMi_GornsTreasure_MIS) && (Gorns_Beutel == FALSE) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Versteck_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_00");	//Я получил ответ от Горна. Он говорит, что его золото находится у южных ворот.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_01");	//(с горечью) Бывших южных ворот, ты хочешь сказать. Дракон превратил их в развалины.
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_02");	//Как мне добраться туда?
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_03");	//Это неподалеку от тарана орков. Южные ворота были справа от него.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_04");	//Это будет непросто - так что постарайся сделать все побыстрее и не привлекая внимания врага.
	B_LogEntry(TOPIC_RescueGorn,"Бывшие южные ворота находятся справа от тарана орков. Золото Горна спрятано где-то там.");
};


instance DIA_MiltenOW_Frei(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Frei_Condition;
	information = DIA_MiltenOW_Frei_Info;
	permanent = FALSE;
	description = "Я освободил Горна.";
};


func int DIA_MiltenOW_Frei_Condition()
{
	if((MIS_RescueGorn == LOG_SUCCESS) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Frei_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Frei_15_00");	//Я освободил Горна.
	AI_Output(self,other,"DIA_MiltenOW_Frei_03_01");	//Хорошо. Теперь мы можем подумать о том, что делать дальше.
};


instance DIA_MiltenOW_Lehren(C_Info)
{
	npc = PC_Mage_OW;
	nr = 9;
	condition = DIA_MiltenOW_Lehren_Condition;
	information = DIA_MiltenOW_Lehren_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_MiltenOW_Lehren_Condition()
{
	if((other.guild == GIL_KDF) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Lehren_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Lehren_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_01");	//Я могу обучить тебя магии из второго круга, или я могу помочь повысить твою магическую энергию.
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_02");	//Если ты готов повысить свою энергию, я могу обучить тебя.
};


instance DIA_MiltenOW_TeachCircle2(C_Info)
{
	npc = PC_Mage_OW;
	nr = 91;
	condition = DIA_MiltenOW_TeachCircle2_Condition;
	information = DIA_MiltenOW_TeachCircle2_Info;
	permanent = TRUE;
//	description = B_BuildLearnString("Обучи меня второму Кругу магии",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,2));
	description = B_BuildLearnString("Второй Круг магии",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,2));
};


func int DIA_MiltenOW_TeachCircle2_Condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_MiltenOW_Lehren) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_TeachCircle2_Info()
{
	AI_Output(other,self,"DIA_Milten_Add_15_00");	//Обучи меня второму Кругу магии!
	AI_Output(self,other,"DIA_Milten_Add_03_01");	//Это обычно привилегия учителей нашего ордена.
	AI_Output(self,other,"DIA_Milten_Add_03_02");	//Но я думаю, что в твоем случае мы можем сделать исключение...
	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other,"DIA_Milten_Add_03_03");	//Я не уверен, что помню все эти официальные и торжественные слова...
		AI_Output(self,other,"DIA_Milten_Add_03_04");	//Войди во второй Круг. Э-э... он покажет тебе направление, но твои дела формируют путь...
		AI_Output(self,other,"DIA_Milten_Add_03_05");	//Я думаю, ты понимаешь, о чем все это...
	};
};


instance DIA_MiltenOW_Teach(C_Info)
{
	npc = PC_Mage_OW;
	nr = 90;
	condition = DIA_MiltenOW_Teach_Condition;
	information = DIA_MiltenOW_Teach_Info;
	permanent = TRUE;
	description = "Я хочу изучить новые заклинания.";
};


func int DIA_MiltenOW_Teach_Condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_MiltenOW_Lehren) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Teach_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Teach_15_00");	//Я хочу изучить новые заклинания.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0)
	{
		AI_Output(self,other,"DIA_MiltenOW_Teach_03_01");	//Ты все еще не достиг второго Круга магии. Я ничему не могу научить тебя.
	}
	else
	{
		Info_ClearChoices(DIA_MiltenOW_Teach);
		Info_AddChoice(DIA_MiltenOW_Teach,Dialog_Back,DIA_MiltenOW_Teach_BACK);
		if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
		{
			if(PLAYER_TALENT_RUNES[SPL_Light] == FALSE)
			{
				Info_AddChoice(DIA_MiltenOW_Teach,B_BuildLearnString(NAME_SPL_Light,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Light)),DIA_MiltenOW_Teach_Light);
			};
			if(PLAYER_TALENT_RUNES[SPL_LightHeal] == FALSE)
			{
				Info_AddChoice(DIA_MiltenOW_Teach,B_BuildLearnString(NAME_SPL_LightHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightHeal)),DIA_MiltenOW_Teach_Heal);
			};
		};
		if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
		{
			if(PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE)
			{
				Info_AddChoice(DIA_MiltenOW_Teach,B_BuildLearnString(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),DIA_MiltenOW_Teach_Windfist);
			};
			if(PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE)
			{
				Info_AddChoice(DIA_MiltenOW_Teach,B_BuildLearnString(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),DIA_MiltenOW_Teach_Feuerball);
			};
			if(PLAYER_TALENT_RUNES[SPL_Icebolt] == FALSE)
			{
				Info_AddChoice(DIA_MiltenOW_Teach,B_BuildLearnString(NAME_SPL_Icebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Icebolt)),DIA_MiltenOW_Teach_Eispfeil);
			};
		};
	};
};

func void DIA_MiltenOW_Teach_BACK()
{
	Info_ClearChoices(DIA_MiltenOW_Teach);
};

func void DIA_MiltenOW_Teach_Windfist()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WindFist);
};

func void DIA_MiltenOW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void DIA_MiltenOW_Teach_Eispfeil()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Icebolt);
};

func void DIA_MiltenOW_Teach_Heal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightHeal);
};

func void DIA_MiltenOW_Teach_Light()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Light);
};


instance DIA_MiltenOW_Mana(C_Info)
{
	npc = PC_Mage_OW;
	nr = 100;
	condition = DIA_MiltenOW_Mana_Condition;
	information = DIA_MiltenOW_Mana_Info;
	permanent = TRUE;
	description = "Я хочу повысить мои магические способности.";
};


func int DIA_MiltenOW_Mana_Condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_MiltenOW_Lehren) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Mana_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mana_15_00");	//Я хочу повысить мои магические способности.
	Info_ClearChoices(DIA_MiltenOW_Mana);
	Info_AddChoice(DIA_MiltenOW_Mana,Dialog_Back,DIA_MiltenOW_Mana_BACK);
	Info_AddChoice(DIA_MiltenOW_Mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenOW_Mana_1);
	Info_AddChoice(DIA_MiltenOW_Mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenOW_Mana_5);
};

func void DIA_MiltenOW_Mana_BACK()
{
//	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	if(other.aivar[REAL_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_MiltenOW_Mana_03_00");	//Твоя магическая энергия велика. Слишком велика, чтобы я мог увеличить ее.
	};
	Info_ClearChoices(DIA_MiltenOW_Mana);
};

func void DIA_MiltenOW_Mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(DIA_MiltenOW_Mana);
	Info_AddChoice(DIA_MiltenOW_Mana,Dialog_Back,DIA_MiltenOW_Mana_BACK);
	Info_AddChoice(DIA_MiltenOW_Mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenOW_Mana_1);
	Info_AddChoice(DIA_MiltenOW_Mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenOW_Mana_5);
};

func void DIA_MiltenOW_Mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(DIA_MiltenOW_Mana);
	Info_AddChoice(DIA_MiltenOW_Mana,Dialog_Back,DIA_MiltenOW_Mana_BACK);
	Info_AddChoice(DIA_MiltenOW_Mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenOW_Mana_1);
	Info_AddChoice(DIA_MiltenOW_Mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenOW_Mana_5);
};


instance DIA_MiltenOW_Perm(C_Info)
{
	npc = PC_Mage_OW;
	nr = 101;
	condition = DIA_MiltenOW_Perm_Condition;
	information = DIA_MiltenOW_Perm_Info;
	permanent = TRUE;
	description = "А какие у тебя здесь обязанности?";
};


func int DIA_MiltenOW_Perm_Condition()
{
	if((Kapitel == 2) && !Npc_KnowsInfo(other,DIA_MiltenOW_Frei))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Perm_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Perm_15_00");	//А какие у тебя здесь обязанности?
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_01");	//Изначально я должен был проверять магическую руду. Но она здесь редко попадала мне в руки.
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_02");	//И теперь я сосредоточился на изучении алхимии.
};


instance DIA_MiltenOW_Plan(C_Info)
{
	npc = PC_Mage_OW;
	nr = 101;
	condition = DIA_MiltenOW_Plan_Condition;
	information = DIA_MiltenOW_Plan_Info;
	permanent = TRUE;
	description = "И что ты планируешь делать дальше?";
};


func int DIA_MiltenOW_Plan_Condition()
{
	if((Kapitel == 2) && Npc_KnowsInfo(other,DIA_MiltenOW_Frei))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Plan_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_00");	//И что ты планируешь делать дальше?
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_01");	//Я вернусь. Подожду еще немного, и теперь, когда Горн свободен, я могу отправиться в путь вместе с ним.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_02");	//Крайне важно, чтобы Пирокар узнал о ситуации здесь.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_03");	//Ну, если ты так считаешь.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_04");	//Я надеюсь, что лорд Хаген поймет, какая угроза исходит от этой долины. Не хочется думать, что произойдет, если орки пройдут через Проход.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_05");	//Ну, тогда удачного путешествия.
};


instance DIA_MiltenOW_PICKPOCKET(C_Info)
{
	npc = PC_Mage_OW;
	nr = 888;
	condition = DIA_MiltenOW_PICKPOCKET_Condition;
	information = DIA_MiltenOW_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(украсть его зелье будет довольно трудно)";
};


func int DIA_MiltenOW_PICKPOCKET_Condition()
{
//	return C_StealItems(80,Hlp_GetInstanceID(ItPo_Perm_Mana),1);
	if(Npc_HasItems(self,ItPo_Perm_Mana))
	{
		return C_StealItem(80,Hlp_GetInstanceID(ItPo_Perm_Mana));
	}
	else
	{
		return FALSE;
	};
};

func void DIA_MiltenOW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_MiltenOW_PICKPOCKET);
	Info_AddChoice(DIA_MiltenOW_PICKPOCKET,Dialog_Back,DIA_MiltenOW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_MiltenOW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_MiltenOW_PICKPOCKET_DoIt);
};

func void DIA_MiltenOW_PICKPOCKET_DoIt()
{
//	B_StealItems(80,Hlp_GetInstanceID(ItPo_Perm_Mana),1);
	B_StealItem(80,Hlp_GetInstanceID(ItPo_Perm_Mana));
	Info_ClearChoices(DIA_MiltenOW_PICKPOCKET);
};

func void DIA_MiltenOW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_MiltenOW_PICKPOCKET);
};

