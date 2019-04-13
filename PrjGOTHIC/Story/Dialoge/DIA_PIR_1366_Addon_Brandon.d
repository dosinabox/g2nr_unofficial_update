
instance DIA_Addon_Brandon_EXIT(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 999;
	condition = DIA_Addon_Brandon_EXIT_Condition;
	information = DIA_Addon_Brandon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Brandon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Brandon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Brandon_Hello(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 1;
	condition = DIA_Addon_Brandon_Hello_Condition;
	information = DIA_Addon_Brandon_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Brandon_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_00");	//Вы только посмотрите! Новичок.
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_01");	//И к тому же, сухопутная крыса!
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_02");	//До настоящего пирата тебе еще далеко.
};


instance DIA_Addon_Brandon_AnyNews(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 99;
	condition = DIA_Addon_Brandon_AnyNews_Condition;
	information = DIA_Addon_Brandon_AnyNews_Info;
	permanent = TRUE;
	description = "Есть новости?";
};


func int DIA_Addon_Brandon_AnyNews_Condition()
{
	return TRUE;
};

func void DIA_Addon_Brandon_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_AnyNews_15_00");	//Есть что-нибудь новое?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_01");	//Пожалуй. Например, я ранен. У тебя не найдется лечебного эликсира?
		}
		else if(C_AllCanyonRazorDead() == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_02");	//Что еще? Мы будем, наконец, охотиться или нет?
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_03");	//Что за вопросы?! Не думаю, что во всем чертовом каньоне остался еще хоть один бритвозуб.
		};
	}
	else if((GregIsBack == TRUE) && !Npc_IsDead(Greg) && (MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_04");	//Грег вернулся. Теперь все должно измениться.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_06");	//(заговорщицки) Погоди секунду...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_07");	//(смеется) Насколько я вижу, нет! Все по-старому
	};
};


instance DIA_Addon_Brandon_WannaLearn(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 11;
	condition = DIA_Addon_Brandon_WannaLearn_Condition;
	information = DIA_Addon_Brandon_WannaLearn_Info;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_Addon_Brandon_WannaLearn_Condition()
{
	return TRUE;
};

func void DIA_Addon_Brandon_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_WannaLearn_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_01");	//Научить тебя? Конечно, могу! Я могу сделать тебя более сильным и ловким.
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_02");	//Но зачем мне это делать?
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_OfferDrink_15_00");	//Затем, что я угощу тебя выпивкой?
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_03");	//(усмехается) Неплохо, сынок! Угадал с первой попытки.
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_04");	//Но не вздумай подсовывать мне какое-нибудь дешевое пойло.
	MIS_Brandon_BringHering = LOG_Running;
	Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_BrandonTeach);
	Log_CreateTopic(TOPIC_Addon_BrandonBooze,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BrandonBooze,LOG_Running);
	Log_AddEntry(TOPIC_Addon_BrandonBooze,"Я должен принести Брэндону выпивку. Тогда он согласится учить меня.");
};


instance DIA_Addon_Brandon_HoleGrog(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 12;
	condition = DIA_Addon_Brandon_HoleGrog_Condition;
	information = DIA_Addon_Brandon_HoleGrog_Info;
	description = "Я принесу тебе грога.";
};


func int DIA_Addon_Brandon_HoleGrog_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Brandon_WannaLearn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_HoleGrog_Info()
{
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_BringGrog_15_00");	//Я принесу тебе грога.
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_01");	//Ты что, хочешь меня отравить???
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_02");	//Я не дотронусь до этой бурды. Ты хоть представляешь, из ЧЕГО ее делают?!
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_03");	//Нет, хорошую выпивку можно достать только у Сэмюэля!
	if(Player_KnowsSchnellerHering == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Brandon_Hello_15_05");	//Ты говоришь о его 'Быстрой селедке'?
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_04");	//Да, именно ее я и имею в виду.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_05");	//Ты уже пробовал особый напиток Сэмюэля?
		AI_Output(other,self,"DIA_Addon_Brandon_Hello_15_07");	//Еще нет.
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_06");	//Так чего же ты ждешь? Эту штуку надо попробовать обязательно!
	};
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_08");	//Я просто обожаю эту смесь!
	B_LogEntry(TOPIC_Addon_BrandonBooze,"Грога Брэндону недостаточно. Он хочет 'Быструю селедку'. Этот напиток есть только у Сэмюэля.");
};


instance DIA_Addon_Brandon_SchnellerHering(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 13;
	condition = DIA_Addon_Brandon_SchnellerHering_Condition;
	information = DIA_Addon_Brandon_SchnellerHering_Info;
	description = "Возьми эту 'Быструю селедку'.";
};


func int DIA_Addon_Brandon_SchnellerHering_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Brandon_WannaLearn) && (Npc_HasItems(other,ItFo_Addon_SchnellerHering) > 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_SchnellerHering_Info()
{
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_GiveGrog_15_00");	//Получай.
	B_GiveInvItems(other,self,ItFo_Addon_SchnellerHering,1);
	B_UseItem(self,ItFo_Addon_SchnellerHering);
	AI_Output(self,other,"DIA_Addon_Brandon_GiveGrog_04_01");	//Ах-х! Словно жидкий огонь!
	B_LogEntry(TOPIC_Addon_BrandonBooze,"Я отдал Брэндону его ужасное пойло. Теперь он готов учить меня.");
	MIS_Brandon_BringHering = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


var int Brandon_Merke_Str;
var int Brandon_Merke_Dex;

instance DIA_Addon_Brandon_TeachPlayer(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 777;
	condition = DIA_Addon_Brandon_TeachPlayer_Condition;
	information = DIA_Addon_Brandon_TeachPlayer_Info;
	permanent = TRUE;
	description = "Я готов учиться!";
};


func int DIA_Addon_Brandon_TeachPlayer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Brandon_WannaLearn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_TeachPlayer_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_TeachPlayer_15_00");	//Я готов учиться!
	Brandon_Merke_Str = other.attribute[ATR_STRENGTH];
	Brandon_Merke_Dex = other.attribute[ATR_DEXTERITY];
	if(MIS_Brandon_BringHering == LOG_SUCCESS)
	{
		Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_04_01");	//Сначала ты должен принести мне достойную выпивку, сынок!
	};
};

func void DIA_Addon_Brandon_TeachPlayer_Back()
{
	if(other.attribute[ATR_STRENGTH] > Brandon_Merke_Str)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_00");	//Прекрасно, сынок! Ты уже стал сильнее.
	};
	if(other.attribute[ATR_DEXTERITY] > Brandon_Merke_Dex)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_01");	//Чем выше твоя ловкость, тем чаще ты будешь попадать по врагу.
	};
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
};

func void DIA_Addon_Brandon_TeachPlayer_DEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
};

func void DIA_Addon_Brandon_TeachPlayer_DEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
};

func void DIA_Addon_Brandon_TeachPlayer_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
};

func void DIA_Addon_Brandon_TeachPlayer_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,Dialog_Back,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Brandon_TeachPlayer_STR_5);
};


instance DIA_Addon_Brandon_Anheuern(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 11;
	condition = DIA_Addon_Brandon_Anheuern_Condition;
	information = DIA_Addon_Brandon_Anheuern_Info;
	permanent = FALSE;
	description = "Ты должен мне помочь.";
};


func int DIA_Addon_Brandon_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_FollowMe_15_00");	//Ты должен мне помочь.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_01");	//Это для меня новость. И кто так решил?
	AI_Output(other,self,"DIA_Addon_Brandon_FollowMe_15_02");	//Так решил Грег. Мы должны истребить бритвозубов в каньоне.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_03");	//(усмехается) Наконец-то здесь хоть что-нибудь происходит!
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_04");	//Что ж, пойдем. Чем скорее мы разделаемся с ними, тем скорее можно будет вернуться.
};


instance DIA_Addon_Brandon_ComeOn(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 12;
	condition = DIA_Addon_Brandon_ComeOn_Condition;
	information = DIA_Addon_Brandon_ComeOn_Info;
	permanent = TRUE;
	description = "Пойдем со мной.";
};


func int DIA_Addon_Brandon_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Brandon_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_Weiter_15_00");	//Пойдем со мной.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_ComeOn_04_02");	//Давай сначала вернемся немного назад.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_ComeOn_04_01");	//Иду!
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_Brandon_GoHome(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 13;
	condition = DIA_Addon_Brandon_GoHome_Condition;
	information = DIA_Addon_Brandon_GoHome_Info;
	permanent = TRUE;
	description = "Ты мне больше не нужен.";
};


func int DIA_Addon_Brandon_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_DontNeedYou_15_00");	//Ты мне больше не нужен.
	AI_Output(self,other,"DIA_Addon_Brandon_GoHome_04_01");	//Хорошо.
	AI_Output(self,other,"DIA_Addon_Brandon_GoHome_04_02");	//Может быть, мы как-нибудь с тобой выпьем.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Brandon_TooFar(C_Info)
{
	npc = PIR_1366_Addon_Brandon;
	nr = 14;
	condition = DIA_Addon_Brandon_TooFar_Condition;
	information = DIA_Addon_Brandon_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Brandon_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_00");	//Достаточно! Ты что, хочешь истребить всех зверей на острове?
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_01");	//Мы возвращаемся в лагерь.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_02");	//Я возвращаюсь в лагерь.
	};
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};

