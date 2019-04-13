
instance DIA_Addon_Quarhodron_EXIT(C_Info)
{
	npc = NONE_ADDON_111_Quarhodron;
	nr = 999;
	condition = DIA_Addon_Quarhodron_EXIT_Condition;
	information = DIA_Addon_Quarhodron_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Quarhodron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Quarhodron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Quarhodron_Hello(C_Info)
{
	npc = NONE_ADDON_111_Quarhodron;
	nr = 5;
	condition = DIA_Addon_Quarhodron_Hello_Condition;
	information = DIA_Addon_Quarhodron_Hello_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Addon_Quarhodron_Hello_NoPerm;

func int DIA_Addon_Quarhodron_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Addon_Quarhodron_Hello_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Quarhodron_Hello_Info()
{
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_00");	//Почему ты нарушаешь мой покой, страж?
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_01");	//Говори, что тебе нужно?
		Info_ClearChoices(DIA_Addon_Quarhodron_Hello);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"Что находится в храме Аданоса?",DIA_Addon_Quarhodron_Hello_schwert);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"Кто-то смог проникнуть в храм Аданоса.",DIA_Addon_Quarhodron_Hello_raven);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"Расскажи мне, как попасть в храм Аданоса.",DIA_Addon_Quarhodron_Hello_tempel);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"Наша страна содрогается от землетрясений. Мы должны что-то сделать, иначе весь остров уйдет под воду.",DIA_Addon_Quarhodron_Hello_erdbeben);
		DIA_Addon_Quarhodron_Hello_NoPerm = TRUE;
		Npc_RemoveInvItems(hero,ItWr_Addon_SUMMONANCIENTGHOST,1);
		SC_TalkedToGhost = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_02");	//Бенгла антани, Осири?
		B_Say(other,self,"$CANTUNDERSTANDTHIS");
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_03");	//Бенгла антани?
		AI_StopProcessInfos(self);
	};
};


var int DIA_Addon_Quarhodron_Hello_ChoiceCounter;
var int B_Quarhodron_Hello_KommZumPunkt_OneTime;

func void B_Quarhodron_Hello_KommZumPunkt()
{
	if((DIA_Addon_Quarhodron_Hello_ChoiceCounter >= 3) && (B_Quarhodron_Hello_KommZumPunkt_OneTime == FALSE))
	{
		Info_AddChoice(DIA_Addon_Quarhodron_Hello,"Мудрость древних поистине поразительна.",DIA_Addon_Quarhodron_Hello_frech);
		B_Quarhodron_Hello_KommZumPunkt_OneTime = TRUE;
	};
};

func void DIA_Addon_Quarhodron_Hello_erdbeben()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_erdbeben_15_00");	//Наша страна содрогается от землетрясений. Мы должны что-то сделать, иначе весь остров уйдет под воду.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_erdbeben_11_01");	//Мы ничего не сможем сделать.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_erdbeben_11_02");	//Гнев Аданоса пал на Яркендар, чтобы покарать потерявших веру.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter += 1;
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_raven()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_raven_15_00");	//Кто-то смог проникнуть в храм Аданоса.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_raven_11_01");	//Вздор! Я лично запечатал дверь. Пройти в храм невозможно.
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_raven_15_02");	//В самом деле?
	DIA_Addon_Quarhodron_Hello_ChoiceCounter += 1;
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_tempel()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_tempel_15_00");	//Расскажи мне, как попасть в храм Аданоса.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_tempel_11_01");	//Храм останется закрытым навеки. Так решил совет.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter += 1;
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_schwert()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_schwert_15_00");	//Что находится в храме Аданоса?
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_schwert_11_01");	//Моя величайшая печаль. Мое величайшее разочарование.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter += 1;
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_frech()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_frech_15_00");	//Мудрость древних поистине поразительна.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_01");	//Человек твоего положения не должен так разговаривать.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_02");	//Я не могу освободиться от впечатления, что ты не тот, за кого себя выдаешь.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_03");	//Если тебе нужна моя помощь, ты должен доказать, что ты говоришь мне правду.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_04");	//Ответь на мои вопросы, чтобы я мог убедиться, что не выдаю чужаку наши тайны.
	Log_CreateTopic(TOPIC_Addon_Quarhodron,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron,LOG_Running);
	B_LogEntry(TOPIC_Addon_Quarhodron,"Куарходрон поможет мне только в том случае, если я докажу, что я достоин этого. Он задал мне несколько сложных вопросов. Я должен ответить на них, и только тогда он мне поможет.");
	Info_ClearChoices(DIA_Addon_Quarhodron_Hello);
};


instance DIA_Addon_Quarhodron_Fragen(C_Info)
{
	npc = NONE_ADDON_111_Quarhodron;
	nr = 5;
	condition = DIA_Addon_Quarhodron_Fragen_Condition;
	information = DIA_Addon_Quarhodron_Fragen_Info;
	permanent = TRUE;
	description = "Спрашивай!";
};


func int DIA_Addon_Quarhodron_Fragen_Condition()
{
	if(QuarhodronIstZufrieden == FALSE)
	{
		return TRUE;
	};
};


var int Quarhodrons_NextQuestion;
var int QuarhodronIstZufrieden;
var int Quarhodrons_RichtigeAntworten;
const int Quarhodron_AlleFragenGestellt = 100;
var int B_Quarhodron_Fragen_ChoicesOneTime;

func void B_Quarhodron_TestFailed()
{
	AI_Output(self,other,"DIA_Addon_Quarhodron_TestFailed_11_00");	//Неправильные ответы выдают твои злые намерения.
	AI_Output(self,other,"DIA_Addon_Quarhodron_TestFailed_11_01");	//Я не стану тебе помогать.
	AI_StopProcessInfos(self);
};

func void B_Quarhodron_Fragen_Choices()
{
	Log_AddEntry(TOPIC_Addon_Quarhodron," --- ВОПРОСЫ КУАРХОДРОНА ---");
	if(Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed();
	}
	else if((Quarhodrons_NextQuestion == 1) && (Quarhodrons_RichtigeAntworten == 0))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_00");	//Я тебе не верю.
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_01");	//Возвращайся, когда решишь сказать мне правду.
		AI_StopProcessInfos(self);
	}
	else
	{
		if(Quarhodrons_NextQuestion == 1)
		{
			if(B_Quarhodron_Fragen_ChoicesOneTime == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_02");	//(задумчиво) Да, сила стражей мертвых могла позволить тебе пробудить меня.
				AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_03");	//Если ты действительно страж мертвых, ты сможешь ответить на все мои вопросы.
				AI_Output(self,other,"DIA_Addon_Quarhodron_Add_11_00");	//Кроме одного...
				B_Quarhodron_Fragen_ChoicesOneTime = TRUE;
			};
			Quarhodrons_NextQuestion = 2;
		};
		if(Quarhodrons_NextQuestion == 7)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_04");	//Кто закрыл портал, чтобы не пропустить зло в наш мир?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Кто закрыл портал и защитил мир от зла? ---");
			Quarhodrons_NextQuestion = Quarhodron_AlleFragenGestellt;
		}
		else if(Quarhodrons_NextQuestion == 6)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_05");	//Кто облегчает страдания раненых и ухаживает за больными?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Кто в Яркендаре ухаживает за больными и облегчает их страдания? ---");
			Quarhodrons_NextQuestion = 7;
		}
		else if(Quarhodrons_NextQuestion == 5)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_06");	//За кем остается последнее слово в Совете Пяти?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Кто имеет последнее слово в Совете Пяти? ---");
			Quarhodrons_NextQuestion = 6;
		}
		else if(Quarhodrons_NextQuestion == 4)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_07");	//Кто привел в наш мир зло?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Кто виновен в несчастьях, постигших жителей Яркендара? ---");
			Quarhodrons_NextQuestion = 5;
		}
		else if(Quarhodrons_NextQuestion == 3)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_08");	//Кто может отдать мне прямой приказ?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Кто может дать Куарходрону прямой приказ? ---");
			Quarhodrons_NextQuestion = 4;
		}
		else if(Quarhodrons_NextQuestion == 2)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_09");	//Кто защищает людей Яркендара от нападения врагов?
			Log_AddEntry(TOPIC_Addon_Quarhodron," --- Кто защищал Яркендар от врагов? ---");
			Quarhodrons_NextQuestion = 3;
		};
		Info_ClearChoices(DIA_Addon_Quarhodron_Fragen);
		if(Quarhodrons_NextQuestion >= Quarhodron_AlleFragenGestellt)
		{
			Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Я не могу знать этого.",DIA_Addon_Quarhodron_Fragen_NoPlan);
		}
		else
		{
			Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Я не знаю.",DIA_Addon_Quarhodron_Fragen_NoPlan);
		};
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Ученые.",DIA_Addon_Quarhodron_Fragen_gele);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Стражи мертвых.",DIA_Addon_Quarhodron_Fragen_totenw);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Жрецы.",DIA_Addon_Quarhodron_Fragen_prie);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Воины.",DIA_Addon_Quarhodron_Fragen_warr);
		Info_AddChoice(DIA_Addon_Quarhodron_Fragen,"Целители.",DIA_Addon_Quarhodron_Fragen_heiler);
	};
};


var int DIA_Addon_Quarhodron_Fragen_Info_OneTime;

func void DIA_Addon_Quarhodron_Fragen_Info()
{
	Quarhodrons_NextQuestion = 0;
	Quarhodrons_RichtigeAntworten = 0;
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_15_00");	//Спрашивай!
	if(DIA_Addon_Quarhodron_Fragen_Info_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_01");	//Я - Куарходрон. Когда-то я был предводителем армий Яркендара.
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_02");	//Ты пробудил меня.
		DIA_Addon_Quarhodron_Fragen_Info_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_03");	//К какой касте ты принадлежишь?
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_warr()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_warr_15_00");	//Воины.
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	if(Quarhodrons_NextQuestion == 3)
	{
		Quarhodrons_RichtigeAntworten += 1;
	};
	if(Quarhodrons_NextQuestion == 5)
	{
		Quarhodrons_RichtigeAntworten += 1;
	};
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_prie()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_prie_15_00");	//Жрецы.
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	if(Quarhodrons_NextQuestion == 4)
	{
		Quarhodrons_RichtigeAntworten += 1;
	};
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_gele()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_gele_15_00");	//Ученые.
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	if(Quarhodrons_NextQuestion == 6)
	{
		Quarhodrons_RichtigeAntworten += 1;
	};
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_totenw()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_totenw_15_00");	//Стражи мертвых.
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_RichtigeAntworten += 1;
	};
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_heiler()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_heiler_15_00");	//Целители.
	if(Quarhodrons_NextQuestion == 0)
	{
		Quarhodrons_NextQuestion = 1;
	};
	if(Quarhodrons_NextQuestion == 7)
	{
		Quarhodrons_RichtigeAntworten += 1;
	};
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_NoPlan()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_NoPlan_15_00");	//Я не знаю.
	if((Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt) && (Quarhodrons_RichtigeAntworten >= 6))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_NoPlan_11_01");	//Хорошо. Я верю тебе, и поэтому помогу.
		QuarhodronIstZufrieden = TRUE;
		Info_ClearChoices(DIA_Addon_Quarhodron_Fragen);
	}
	else if(Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_NoPlan_11_02");	//Тогда не трать мое время.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Quarhodron_GibMirKey(C_Info)
{
	npc = NONE_ADDON_111_Quarhodron;
	nr = 5;
	condition = DIA_Addon_Quarhodron_GibMirKey_Condition;
	information = DIA_Addon_Quarhodron_GibMirKey_Info;
	description = "Послушай меня! В храм Аданоса смог попасть очень злой человек.";
};


func int DIA_Addon_Quarhodron_GibMirKey_Condition()
{
	if(QuarhodronIstZufrieden == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Quarhodron_GibMirKey_Info()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_00");	//Послушай меня! В храм Аданоса смог попасть очень злой человек.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_01");	//Если ты не поможешь мне попасть в храм немедленно, мы можем опоздать, и тогда всем нам придет конец.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_02");	//Этого не может быть. Во всем Яркендаре лишь мы с верховным жрецом Кардимоном знаем, как открыть ворота в храм.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_03");	//Ну, значит, твой приятель Кардимон проболтался.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_04");	//Ворота были открыты. Я видел это своими собственными глазами.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_05");	//По твоему голосу я слышу, что ты говоришь правду. Больше я не буду сомневаться в твоих словах.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_06");	//Надеюсь.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_07");	//Я дам тебе каменную табличку, на которой записаны тайные слова. Произнеси их перед запечатанными воротами храма, и они распахнутся перед тобой.
	CreateInvItems(self,ItMi_TempelTorKey,1);
	B_GiveInvItems(self,other,ItMi_TempelTorKey,1);
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_08");	//(умирает) Мое время подходит к концу. Увы, но больше я ни в чем тебе помочь не смогу.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_09");	//(умирает) Помни, залы Аданоса смертельно опасны. Будь осторожнее.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_10");	//Постой! Что находится в этих залах?
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_11");	//(умирает) Силы покидают меня. Прощай! Когда-нибудь мы снова встретимся в стране мертвых.
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_Addon_Quarhodron,"Куарходрон дал мне каменную табличку, которая откроет мне вход в храм Аданоса.");
	Log_CreateTopic(TOPIC_Addon_Kammern,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern,LOG_Running);
	B_LogEntry(TOPIC_Addon_Kammern,"Куарходрон сказал, что я должен быть осторожнее в 'Залах Аданоса'. Я должен выяснить, что он имел в виду, если не хочу попасть в ловушку.");
	Ghost_SCKnowsHow2GetInAdanosTempel = TRUE;
};

