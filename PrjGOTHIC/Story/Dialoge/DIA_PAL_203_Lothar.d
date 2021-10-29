
var int Lothar_ImOV;

instance DIA_Lothar_EXIT(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 999;
	condition = DIA_Lothar_EXIT_Condition;
	information = DIA_Lothar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lothar_EXIT_Condition()
{
	if(Lothar_ImOV == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lothar_FirstEXIT(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 999;
	condition = DIA_Lothar_FirstEXIT_Condition;
	information = DIA_Lothar_FirstEXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende_v1;
};


func int DIA_Lothar_FirstEXIT_Condition()
{
	if(Lothar_ImOV == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_FirstEXIT_Info()
{
	DIA_Common_IHaveToGo_v1();
	if((Lothar_Regeln == FALSE) && (Mil_305_schonmalreingelassen == FALSE))
	{
		AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_01");	//Подожди! Ты даже не знаешь новых законов города!
		AI_Output(other,self,"DIA_Lothar_FirstEXIT_15_02");	//Позже.
	}
	else
	{
		if(Npc_KnowsInfo(other,DIA_Lothar_Dragons) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
		{
			AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_03");	//Если я еще хоть раз услышу, что ты рассказываешь людям о драконах, у тебя будут большие проблемы, тебе все ясно?
		}
		else
		{
			AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_04");	//Пока ты находишься в Хоринисе, ты можешь чувствовать себя в безопасности.
			if(hero.guild != GIL_PAL)
			{
				AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_05");	//Город теперь охраняют паладины короля!
			};
		};
		Lothar_ImOV = TRUE;
		Npc_ExchangeRoutine(self,"START");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Lothar_Hallo(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_Hallo_Condition;
	information = DIA_Lothar_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lothar_Hallo_Condition()
{
	if((self.aivar[AIV_TalkedToPlayer] == FALSE) && (Mil_305_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_Hallo_Info()
{
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lothar_Hallo_01_00");	//Стой, чужеземец!
	};
	if((Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_MIL))
	{
		AI_Output(self,other,"DIA_Lothar_Hallo_01_01");	//Я не видел, чтобы ты проходил через эти ворота.
		AI_Output(other,self,"DIA_Lothar_Hallo_15_02");	//И?
		AI_Output(self,other,"DIA_Lothar_Hallo_01_03");	//А стража у других ворот получила приказ не пропускать неизвестных лиц в город.
		AI_Output(other,self,"DIA_Lothar_Hallo_15_04");	//Нуууу...
		AI_Output(self,other,"DIA_Lothar_Hallo_01_05");	//Придется серьезно поговорить с ними обоими!
		AI_Output(self,other,"DIA_Lothar_Hallo_01_06");	//Теперь, что касается нас...
	};
	AI_Output(self,other,"DIA_Lothar_Hallo_01_07");	//Я Лотар. Паладин короля и преданный слуга Инноса.
	AI_Output(self,other,"DIA_Lothar_Hallo_01_08");	//Наш командующий, лорд Хаген, вверил мне задачу объяснять всем новоприбывшим новые законы, которым должны подчиняться все жители этого города.
	AI_Output(self,other,"DIA_Addon_Lothar_Hallo_01_00");	//Недавно в городе начали пропадать люди, так что горожанам нужно быть осторожнее, чтобы не разделить эту судьбу.
	Player_KnowsLordHagen = TRUE;
	B_PlayerEnteredCity();
};


instance DIA_Lothar_MESSAGE(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_MESSAGE_Condition;
	information = DIA_Lothar_MESSAGE_Info;
	permanent = FALSE;
	description = "У меня важное сообщение для предводителя паладинов!";
};


func int DIA_Lothar_MESSAGE_Condition()
{
	if(PAL_205_schonmalreingelassen == FALSE)
	{
		if((hero.guild == GIL_NONE) || (hero.guild == GIL_NOV))
		{
			return TRUE;
		};
	};
};

func void DIA_Lothar_MESSAGE_Info()
{
	AI_Output(other,self,"DIA_Lothar_MESSAGE_15_00");	//У меня важное сообщение для предводителя паладинов!
	AI_Output(self,other,"DIA_Lothar_MESSAGE_01_01");	//Достопочтенный лорд Хаген никого не принимает.
	AI_Output(self,other,"DIA_Lothar_MESSAGE_01_02");	//За все вопросы, касающиеся простого народа, отвечает лорд Андрэ, командир городской стражи.
	AI_Output(other,self,"DIA_Lothar_Add_15_00");	//Но я ДОЛЖЕН увидеться с лордом Хагеном!
	AI_Output(self,other,"DIA_Lothar_Add_01_01");	//Ты должен повиноваться законам, как и все остальные!
	AI_Output(self,other,"DIA_Lothar_Add_01_02");	//Лорд Хаген не принимает.
	AI_Output(self,other,"DIA_Lothar_Add_01_03");	//Если у тебя действительно есть что-то ВАЖНОЕ, иди к лорду Андрэ. Он поможет тебе!
	Player_KnowsLordHagen = TRUE;
	if(!Npc_KnowsInfo(other,DIA_Lothar_Hagen))
	{
		Lothar_Day = B_GetDayPlus();
	};
};


instance DIA_Lothar_EyeInnos(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Lothar_EyeInnos_Condition;
	information = DIA_Lothar_EyeInnos_Info;
	permanent = FALSE;
	description = "Я пришел, чтобы получить Глаз Инноса!";
};


func int DIA_Lothar_EyeInnos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_MESSAGE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_EyeInnos_Info()
{
	AI_Output(other,self,"DIA_Lothar_EyeInnos_15_00");	//Я пришел, чтобы получить Глаз Инноса!
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_01");	//Вопрос о Глазе должен решать лорд Хаген. Поговори с ним об этом.
		Player_KnowsLordHagen = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_02");	//Священный Глаз Инноса! Откуда ты знаешь о нем?! Ты не принадлежишь к нашему ордену!
		AI_Output(other,self,"DIA_Lothar_EyeInnos_15_03");	//Мне сказал о нем маг.
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_04");	//Я не знаю, какими мотивами он руководствовался, когда доверил один из секретов нашего ордена тебе...
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_05");	//Но он, наверняка, не имел в виду, что ТЫ можешь коснуться его своими руками.
		AI_Output(other,self,"DIA_Lothar_EyeInnos_15_06");	//Но...
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_07");	//Я ничего об этом даже слышать не хочу!
		if(Npc_KnowsInfo(other,DIA_Lothar_Dragons))
		{
			AI_Output(self,other,"DIA_Lothar_EyeInnos_01_08");	//Сначала ты нес всякую чушь о драконах, и теперь - вот это. Невероятно!
		};
	};
};


instance DIA_Lothar_Dragons(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_Dragons_Condition;
	information = DIA_Lothar_Dragons_Info;
	permanent = FALSE;
	description = "Послушай - этому городу угрожают драконы!";
};


func int DIA_Lothar_Dragons_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_MESSAGE) || (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Lothar_Dragons_Info()
{
	AI_Output(other,self,"DIA_Lothar_Dragons_15_00");	//Послушай - этому городу угрожают драконы!
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lothar_Dragons_01_01");	//Это не может быть правдой!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_02");	//Еще один сумасшедший!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_03");	//В городе и без этого полно проблем. Не хватает только еще идиота, пугающего людей баснями о драконах!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_04");	//Я немедля посадил в тюрьму последнего, кто рассказывал здесь сказки о драконах, и отправил его тюремным транспортом в Долину Рудников. Так что попридержи свой язык!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_05");	//Мы не можем позволить, чтобы кто-либо здесь сеял панику среди людей!
		if(Npc_KnowsInfo(other,DIA_DiegoOw_Hallo))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_was_Diego_15_00");	//Ты говоришь о Диего?
			AI_Output(self,other,"DIA_Lothar_WhoDragons_01_01");	//Да. Парень по имени Диего. Если я не ошибаюсь.
			AI_Output(self,other,"DIA_Lothar_WhoDragons_01_02");	//(угрожающе) Я предупреждал его - как и тебя! Но этот безумец не переставал действовать мне на нервы!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_Dragons_01_06");	//Я часто слышу об этом. Но в это трудно поверить.
		AI_Output(self,other,"DIA_Lothar_Dragons_01_07");	//Будет лучше, если ты оставишь эти мысли при себе. Мы должны всеми силами избегать паники среди людей.
	};
};


instance DIA_Addon_Lothar_Ornament(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 5;
	condition = DIA_Addon_Lothar_Ornament_Condition;
	information = DIA_Addon_Lothar_Ornament_Info;
	description = "Ты знаешь что-нибудь о каменном существе из круга камней у фермы Лобарта?";
};


func int DIA_Addon_Lothar_Ornament_Condition()
{
	if(MIS_Addon_Cavalorn_GetOrnamentFromPAL == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lothar_Ornament_Info()
{
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_15_00");	//Ты знаешь что-нибудь о каменном существе из круга камней у фермы Лобарта?
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_01_01");	//Конечно. Мы уничтожили его. Оно угрожало близлежащим фермам.
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_01_02");	//А почему тебя это интересует?
	Info_ClearChoices(DIA_Addon_Lothar_Ornament);
	if(Lord_Hagen_GotOrnament == FALSE)
	{
		Info_AddChoice(DIA_Addon_Lothar_Ornament,"Я ищу часть металлического орнамента.",DIA_Addon_Lothar_Ornament_suche);
	};
	Info_AddChoice(DIA_Addon_Lothar_Ornament,"Ты думаешь, это нормально?",DIA_Addon_Lothar_Ornament_normal);
};

func void DIA_Addon_Lothar_Ornament_normal()
{
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_normal_15_00");	//Ты думаешь, это нормально?
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_normal_01_01");	//Что, появление каменного монстра?
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_normal_01_02");	//Насколько я знаю, этим вопросом занимаются маги Воды.
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_normal_01_03");	//Мне же совершенно не до этого. У нас хватает дел в городе и Долине Рудников.
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_normal_15_04");	//Понимаю.
};

func void DIA_Addon_Lothar_Ornament_suche()
{
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_suche_15_00");	//Я ищу часть металлического орнамента.
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_suche_15_01");	//Она должна была быть неподалеку от фермы Лобарта, в круге камней.
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_suche_01_02");	//Да, я помню этот предмет. Мы нашли его у каменного монстра. Я подумал, что это магическая руна.
	AI_Output(self,other,"DIA_Addon_Lothar_Ornament_suche_01_03");	//Вернувшись в город, я отдал ее лорду Хагену. Возможно, она до сих пор у него.
	Player_KnowsLordHagen = TRUE;
};


instance DIA_Lothar_WhoDragons(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_WhoDragons_Condition;
	information = DIA_Lothar_WhoDragons_Info;
	permanent = FALSE;
	description = "Кто-то уже докладывал о драконах?";
};


func int DIA_Lothar_WhoDragons_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_Dragons) && !Npc_KnowsInfo(other,DIA_DiegoOw_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Lothar_WhoDragons_Info()
{
	AI_Output(other,self,"DIA_Lothar_WhoDragons_15_00");	//Кто-то уже докладывал о драконах?
	AI_Output(self,other,"DIA_Lothar_WhoDragons_01_01");	//Да. Парень по имени Диего. Если я не ошибаюсь.
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lothar_WhoDragons_01_02");	//(угрожающе) Я предупреждал его - как и тебя! Но этот безумец не переставал действовать мне на нервы!
	};
};


instance DIA_Lothar_Regeln(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 3;
	condition = DIA_Lothar_Regeln_Condition;
	information = DIA_Lothar_Regeln_Info;
	permanent = FALSE;
	description = "Хорошо - объясни мне законы этого города!";
};


func int DIA_Lothar_Regeln_Condition()
{
	if(Mil_305_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_Regeln_Info()
{
	AI_Output(other,self,"DIA_Lothar_Regeln_15_00");	//(легкий вздох) Хорошо - объясни мне законы этого города!
	AI_Output(self,other,"DIA_Lothar_Regeln_01_01");	//Во-первых, достопочтенный паладин лорд Хаген расквартирован в верхнем квартале, вместе со своими войсками.
	AI_Output(self,other,"DIA_Lothar_Regeln_01_02");	//Вот почему доступ в верхнюю часть города разрешен только уважаемым горожанам.
	AI_Output(self,other,"DIA_Lothar_Add_01_04");	//Во-вторых, городская ратуша, находящаяся в верхнем квартале, в настоящее время является командным пунктом паладинов. Доступ туда имеют только сами паладины и члены ополчения.
	AI_Output(self,other,"DIA_Lothar_Add_01_05");	//И в-третьих, тот, кто обвиняется в преступлении, должен предстать перед командиром ополчения.
	AI_Output(self,other,"DIA_Lothar_Regeln_01_05");	//Есть вопросы?
	Player_KnowsLordHagen = TRUE;
	Lothar_Regeln = TRUE;
};


instance DIA_Addon_Lothar_MissingPeople(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Addon_Lothar_MissingPeople_Condition;
	information = DIA_Addon_Lothar_MissingPeople_Info;
	description = "В городе пропадают жители?";
};


func int DIA_Addon_Lothar_MissingPeople_Condition()
{
	if(SC_HearedAboutMissingPeople == TRUE)
	{
		return TRUE;
	};
	if(Npc_KnowsInfo(other,DIA_Lothar_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lothar_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Lothar_MissingPeople_15_00");	//В городе пропадают жители?
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_01");	//Да, и с каждым днем все больше.
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_02");	//Хуже всего то, что ополчение до сих пор не выяснило, кто стоит за этими событиями.
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_03");	//Неудивительно, что горожане начали с недоверием относиться к незнакомцам.
	AI_Output(self,other,"DIA_Addon_Lothar_MissingPeople_01_04");	//Так что не стоит их провоцировать. Тебе понятно?
	if(SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
	};
	SC_HearedAboutMissingPeople = TRUE;
};


instance DIA_Lothar_HowCitizen(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 4;
	condition = DIA_Lothar_HowCitizen_Condition;
	information = DIA_Lothar_HowCitizen_Info;
	permanent = FALSE;
	description = "Как я могу стать гражданином этого города?";
};


func int DIA_Lothar_HowCitizen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_Regeln) && (Player_IsApprentice == APP_NONE))
	{
		if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			return TRUE;
		};
	};
};

func void DIA_Lothar_HowCitizen_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_06");	//Как я могу стать гражданином этого города?
	AI_Output(self,other,"DIA_Lothar_Add_01_07");	//Гражданином города может считаться только тот, кто имеет постоянную работу!
	AI_Output(self,other,"DIA_Lothar_Add_01_09");	//Но не думай, что ты сможешь предстать перед лордом Хагеном только потому, что ты являешься гражданином!
	AI_Output(self,other,"DIA_Lothar_Add_01_10");	//Как гражданин, ты получишь доступ в верхнюю часть города - и не более того!
	AI_Output(self,other,"DIA_Lothar_Add_01_11");	//Только будучи членом ополчения, ты сможешь получить доступ в ратушу!
	Player_KnowsLordHagen = TRUE;
};


instance DIA_Lothar_WoArbeit(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 5;
	condition = DIA_Lothar_WoArbeit_Condition;
	information = DIA_Lothar_WoArbeit_Info;
	permanent = FALSE;
	description = "Где я могу найти работу?";
};


func int DIA_Lothar_WoArbeit_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_HowCitizen) && (Player_IsApprentice == APP_NONE))
	{
		if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			return TRUE;
		};
	};
};

func void DIA_Lothar_WoArbeit_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_14");	//Где я могу найти работу?
	AI_Output(self,other,"DIA_Lothar_Add_01_15");	//Тебе придется стать учеником одного из мастеров в нижней части города.
	AI_Output(self,other,"DIA_Lothar_Add_01_16");	//Как только мастер примет тебя на работу, ты станешь гражданином этого города.
	AI_Output(self,other,"DIA_Lothar_Add_01_17");	//Однако другие мастера должны согласиться с этим, таковы обычаи Хориниса.
	AI_Output(self,other,"DIA_Lothar_Add_01_18");	//Если ты думал найти работу в портовом квартале, забудь об этом!
	AI_Output(self,other,"DIA_Lothar_Add_01_19");	//Там живут отбросы общества. Даже не суй туда свой нос, ты пожалеешь об этом!
	AI_Output(other,self,"DIA_Lothar_Add_15_20");	//Сколько мастеров работает в городе?
	AI_Output(self,other,"DIA_Lothar_Add_01_21");	//Насколько я знаю, всего их пять.
};


instance DIA_Lothar_ToOV(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 6;
	condition = DIA_Lothar_ToOV_Condition;
	information = DIA_Lothar_ToOV_Info;
	permanent = FALSE;
	description = "Как мне попасть в верхний квартал?";
};


func int DIA_Lothar_ToOV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_Regeln) && (Mil_305_schonmalreingelassen == FALSE) && (Player_IsApprentice == APP_NONE) && !Npc_KnowsInfo(other,DIA_Lothar_HelloAgain))
	{
		if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			return TRUE;
		};
	};
};

func void DIA_Lothar_ToOV_Info()
{
	AI_Output(other,self,"DIA_Lothar_ToOV_15_00");	//Как мне попасть в верхний квартал?
	AI_Output(self,other,"DIA_Lothar_ToOV_01_01");	//Скажи, ты меня вообще слушаешь?!
	AI_Output(self,other,"DIA_Lothar_ToOV_01_02");	//Ты не являешься гражданином этого города. Ты можешь даже не пытаться - стража все равно тебя не пустит.
	AI_Output(self,other,"DIA_Lothar_ToOV_01_03");	//Все, что находится за внутренними вратами, для тебя является запретной зоной!
};


instance DIA_Lothar_ToMiliz(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 7;
	condition = DIA_Lothar_ToMiliz_Condition;
	information = DIA_Lothar_ToMiliz_Info;
	permanent = FALSE;
	description = "А как я могу поступить на службу в ополчение?";
};


func int DIA_Lothar_ToMiliz_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_Regeln) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_ToMiliz_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_26");	//А как я могу поступить на службу в ополчение?
	if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_27");	//По прямому указанию лорда Хагена, на службу в ополчение принимаются только граждане города.
		AI_Output(other,self,"DIA_Lothar_Add_15_28");	//Понимаю.
		Player_KnowsLordHagen = TRUE;
	};
	if((MIS_Harad_Orc == LOG_SUCCESS) || (MIS_HakonBandits == LOG_SUCCESS) || (MIS_Thorben_GetBlessings == LOG_SUCCESS) || (MIS_Matteo_Gold == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS) || (MIS_Bosper_Bogen == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_12");	//Я слышал, ты уже получил одобрение некоторых мастеров.
	};
	AI_Output(self,other,"DIA_Lothar_Add_01_29");	//Если ты хочешь узнать больше, поговори с лордом Андрэ в казармах.
};


instance DIA_Lothar_ToPaladins(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 7;
	condition = DIA_Lothar_ToPaladins_Condition;
	information = DIA_Lothar_ToPaladins_Info;
	permanent = FALSE;
	description = "Что мне нужно сделать, чтобы получить доспехи как у тебя?";
};


func int DIA_Lothar_ToPaladins_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_ToMiliz) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Lothar_ToPaladins_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_30");	//Что мне нужно сделать, чтобы получить доспехи как у тебя?
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_31");	//(напыщенно) Что? Ты даже не являешься членом ополчения!
	};
	if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_32");	//Ты даже не ГРАЖДАНИН!
	};
	AI_Output(self,other,"DIA_Lothar_Add_01_33");	//Как ты даже думать смеешь о том, чтобы носить доспехи ПАЛАДИНА?
	AI_Output(self,other,"DIA_Lothar_Add_01_34");	//Только немногим из солдат ополчения, успешно выполнившим необычайно важные задания, была дарована такая честь.
	AI_Output(self,other,"DIA_Lothar_Add_01_35");	//(сурово) Если ты хочешь стать паладином, впереди тебя ждет очень долгий и тернистый путь, мой мальчик!
};


instance DIA_Lothar_WoAndre(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 8;
	condition = DIA_Lothar_WoAndre_Condition;
	information = DIA_Lothar_WoAndre_Info;
	permanent = FALSE;
	description = "Где мне найти командира городской стражи?";
};


func int DIA_Lothar_WoAndre_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Lothar_Regeln) || Npc_KnowsInfo(other,DIA_Lothar_MESSAGE)) && (Andre.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_WoAndre_Info()
{
	AI_Output(other,self,"DIA_Lothar_WoAndre_15_00");	//Где мне найти командира городской стражи?
	AI_Output(self,other,"DIA_Lothar_WoAndre_01_01");	//Лорда Андрэ можно найти в казармах в противоположном конце города.
};


instance DIA_Lothar_Schlafen(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 9;
	condition = DIA_Lothar_Schlafen_Condition;
	information = DIA_Lothar_Schlafen_Info;
	permanent = FALSE;
	description = "Где я могу провести ночь?";
};


func int DIA_Lothar_Schlafen_Condition()
{
	if(other.guild != GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Lothar_Schlafen_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_22");	//Где я могу провести ночь?
	AI_Output(self,other,"DIA_Lothar_Add_01_23");	//Если ты ищешь место для ночлега, иди в отель, находящийся перед казармами.
	AI_Output(self,other,"DIA_Lothar_Add_01_24");	//Паладины платят за ночлег всех путников, которые заходят в этот город.
	AI_Output(self,other,"DIA_Lothar_Add_01_25");	//Странствующие торговцы с рыночной площади тоже ночуют там.
};


instance DIA_Lothar_PermB4OV(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 3;
	condition = DIA_Lothar_PermB4OV_Condition;
	information = DIA_Lothar_PermB4OV_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lothar_PermB4OV_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Mil_305_schonmalreingelassen == FALSE) && (Lothar_Regeln == TRUE) && !Npc_KnowsInfo(other,DIA_Lothar_HelloAgain))
	{
		if(Npc_KnowsInfo(other,DIA_Lothar_MESSAGE) || Npc_KnowsInfo(other,DIA_Lothar_Hagen))
		{
			if((Lothar_Reported == TRUE) || (Lothar_Day >= Wld_GetDay()))
			{
				return TRUE;
			};
		}
		else
		{
			return TRUE;
		};
	};
};

func void DIA_Lothar_PermB4OV_Info()
{
	AI_Output(self,other,"DIA_Lothar_PermB4OV_01_00");	//Обо всем остальном ты можешь поговорить с лордом Андрэ!
	AI_StopProcessInfos(self);
};


var int Lothar_Reported;

func int C_Lothar_Reported()
{
	if((Npc_KnowsInfo(other,DIA_Lothar_MESSAGE) || Npc_KnowsInfo(other,DIA_Lothar_Hagen)) && (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE) && (Lothar_Day < Wld_GetDay()) && (Lothar_Reported == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void B_Lothar_Reported()
{
	AI_Output(self,other,"DIA_Lothar_Add_01_48");	//Я доложил лорду Хагену, что ты желаешь поговорить с ним...
	AI_Output(other,self,"DIA_Lothar_Add_15_49");	//И? Что он сказал?
	AI_Output(self,other,"DIA_Lothar_Add_01_50");	//Он никогда не слышал о тебе.
	if(Npc_KnowsInfo(other,DIA_Lothar_Dragons))
	{
		AI_Output(other,self,"DIA_Lothar_Add_15_51");	//Конечно нет. Ты сказал ему о драконах?
		AI_Output(self,other,"DIA_Lothar_Add_01_52");	//Разве я не говорил тебе, чтобы ты прекратил нести этот вздор?!
	};
	Lothar_Reported = TRUE;
};

instance DIA_Lothar_HelloAgain(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_HelloAgain_Condition;
	information = DIA_Lothar_HelloAgain_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lothar_HelloAgain_Condition()
{
	if(Mil_305_schonmalreingelassen == TRUE)
	{
		return TRUE;
	};
	if(Lothar_ImOV == TRUE)
	{
		if(Npc_GetDistToWP(self,"NW_CITY_LOTHAR") < 1000)
		{
			return TRUE;
		};
	};
};

func void DIA_Lothar_HelloAgain_Info()
{
	if(self.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_00");	//Ах! Опять ты!
		if((Player_IsApprentice > APP_NONE) && ((other.guild == GIL_NONE) || (other.guild == GIL_NOV)))
		{
			AI_Output(other,self,"DIA_Lothar_Add_15_08");	//Теперь я ученик одного из мастеров!
		};
	};
	if(Player_TalkedAboutDragonsToSomeone == TRUE)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_62");	//Скажи мне, разве я говорил недостаточно внятно? Хватит разговоров о драконах!
		AI_Output(other,self,"DIA_Lothar_Add_15_63");	//Откуда тебе знать?..
		AI_Output(self,other,"DIA_Lothar_Add_01_64");	//Это НЕ ТВОЕ дело!
		AI_Output(self,other,"DIA_Lothar_Add_01_65");	//Это было последний раз, понятно?!
	};
	if(Npc_KnowsInfo(other,DIA_Lothar_ToOV))
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_01");	//Так тебе все же удалось получить доступ в верхний квартал!
		AI_Output(self,other,"DIA_Lothar_Add_01_13");	//Похоже, ты полон решимости добиться своего, да?
	};
	if((VisibleGuild(other) == GIL_KDF) || (VisibleGuild(other) == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_36");	//Где ты взял эту мантию?
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Lothar_Add_15_37");	//Я прошел Испытание Огнем.
		AI_Output(self,other,"DIA_Lothar_Add_01_38");	//Невероятно. Тогда то, что происходит здесь, может быть волей Инноса...
	}
	else if(other.guild == GIL_SLD)
	{
		if(self.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Lothar_Add_01_39");	//Ты ведь не присоединился к наемникам Онара, нет?
		};
		AI_Output(self,other,"DIA_Lothar_Add_01_40");	//Как ты попал сюда?
		if((Hagen_FriedenAbgelehnt == TRUE) || Npc_HasItems(other,ItWr_Passage_MIS))
		{
			AI_Output(other,self,"DIA_Lothar_Add_15_41");	//Я принес предложение мира от Ли...
			AI_Output(self,other,"DIA_Lothar_Add_01_42");	//Ха! Лорд Хаген никогда не согласится на это.
			Player_KnowsLordHagen = TRUE;
		}
		else
		{
			if(Player_IsApprentice > APP_NONE)
			{
				AI_Output(other,self,"DIA_Lothar_Add_15_08");	//Теперь я ученик одного из мастеров!
			}
			else
			{
				DIA_Common_Well();
			};
		};
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_43");	//Как я слышал, ты разговаривал с лордом Андрэ?
		if(Npc_KnowsInfo(other,DIA_Lothar_ToMiliz))
		{
			AI_Output(self,other,"DIA_Lothar_Add_01_44");	//Я говорил тебе, что ты можешь присоединиться к ополчению, только если станешь гражданином города.
			if(Player_IsApprentice > APP_NONE)
			{
				AI_Output(other,self,"DIA_Lothar_Add_15_08");	//Теперь я ученик одного из мастеров!
			};
		};
		AI_Output(self,other,"DIA_Lothar_Add_01_45");	//Как я понимаю, он принял тебя в ряды ополчения.
		AI_Output(self,other,"DIA_Lothar_Add_01_46");	//Хмм... Надеюсь, он знает, что делает.
	};
	if(!Npc_KnowsInfo(other,DIA_Lothar_Hallo))
	{
		AI_Output(self,other,"DIA_Lothar_Hallo_01_07");	//Я Лотар. Паладин короля и преданный слуга Инноса.
	};
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_02");	//Есть вещи, о которых ты всегда должен помнить. В противном случае ты будешь вышвырнут отсюда так же быстро, как попал сюда.
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_03");	//Тебе можно входить только в дома торговцев. Ты узнаешь их по вывескам над дверьми - тут тяжело ошибиться.
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV) || (other.guild == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_04");	//Другие здания здесь принадлежат знатным горожанам - там тебе совершенно нечего делать!
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_08");	//В этом квартале живут знатные горожане. Так что относись к ним с уважением.
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_05");	//Даже несмотря на то, что ты теперь член ордена Инноса.
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_06");	//Будучи членом ополчения, ты также получаешь доступ в покои паладинов.
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_07");	//Но твое место по-прежнему в казармах.
	};
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_09");	//Мы поняли друг друга?
	AI_Output(other,self,"DIA_Lothar_HelloAgain_15_10");	//Конечно.
	if(C_Lothar_Reported())
	{
		B_Lothar_Reported();
	};
};


instance DIA_Lothar_Hagen(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Lothar_Hagen_Condition;
	information = DIA_Lothar_Hagen_Info;
	permanent = FALSE;
	description = "Где я могу найти лорда Хагена?";
};


func int DIA_Lothar_Hagen_Condition()
{
	if((Player_KnowsLordHagen == TRUE) && (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_Hagen_Info()
{
	AI_Output(other,self,"DIA_Lothar_Hagen_15_00");	//Где я могу найти лорда Хагена?
	AI_Output(self,other,"DIA_Lothar_Hagen_01_01");	//Он в ратуше, в конце верхнего квартала.
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lothar_Hagen_01_02");	//Но тебя не примут там без веской на то причины.
	};
	if(!Npc_KnowsInfo(other,DIA_Lothar_MESSAGE))
	{
		Lothar_Day = B_GetDayPlus();
	};
};


instance DIA_Lothar_Reported(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_Reported_Condition;
	information = DIA_Lothar_Reported_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lothar_Reported_Condition()
{
	if(C_Lothar_Reported())
	{
		return TRUE;
	};
};

func void DIA_Lothar_Reported_Info()
{
	B_Lothar_Reported();
	AI_StopProcessInfos(self);
};


instance DIA_Lothar_OWRunning(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Lothar_OWRunning_Condition;
	information = DIA_Lothar_OWRunning_Info;
	permanent = FALSE;
	description = "Я поговорил с лордом Хагеном...";
};


func int DIA_Lothar_OWRunning_Condition()
{
	if((MIS_OLDWORLD == LOG_Running) && !Npc_HasItems(hero,ItWr_PaladinLetter_MIS) && Npc_KnowsInfo(other,DIA_Lothar_Dragons))
	{
		return TRUE;
	};
};

func void DIA_Lothar_OWRunning_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_53");	//Я поговорил с лордом Хагеном...
	AI_Output(self,other,"DIA_Lothar_Add_01_54");	//И? Ты не докучал ему своими россказнями о драконах, нет?
	AI_Output(other,self,"DIA_Lothar_Add_15_55");	//Да, я говорил ему...
	AI_Output(self,other,"DIA_Lothar_Add_01_56");	//Скажи мне, что это неправда...
	AI_Output(other,self,"DIA_Lothar_Add_15_57");	//Он послал меня добыть доказательства...
	AI_Output(self,other,"DIA_Lothar_Add_01_58");	//Ну что ж, тогда удачи. (себе под нос) Что за безумец...
	AI_StopProcessInfos(self);
};


instance DIA_Lothar_OWRunningBrief(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Lothar_OWRunningBrief_Condition;
	information = DIA_Lothar_OWRunningBrief_Info;
	permanent = FALSE;
	description = "У меня есть доказательство! Вот письмо от командующего Гаронда!";
};


func int DIA_Lothar_OWRunningBrief_Condition()
{
	if((MIS_OLDWORLD == LOG_Running) && Npc_HasItems(hero,ItWr_PaladinLetter_MIS) && Npc_KnowsInfo(other,DIA_Lothar_Dragons))
	{
		return TRUE;
	};
};

func void DIA_Lothar_OWRunningBrief_Info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_59");	//У меня есть доказательство! Вот письмо от командующего Гаронда!
	AI_PrintScreen("Письмо Гаронда лорду Хагену отдано",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	AI_Output(self,other,"DIA_Lothar_Add_01_60");	//Так драконы действительно существуют?
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_UseMob(self,"THRONE",-1);
		B_TurnToNpc(self,other);
	};
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Lothar_Add_01_61");	//Я был несправедлив к тебе. Я буду молить Инноса о прощении за мое поведение.
	AI_PrintScreen("Письмо Гаронда лорду Хагену получено",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
};


instance DIA_Lothar_PERM(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 3;
	condition = DIA_Lothar_PERM_Condition;
	information = DIA_Lothar_PERM_Info;
	permanent = TRUE;
	description = "Ничего интересного не было за последнее время?";
};


func int DIA_Lothar_PERM_Condition()
{
	if(Mil_305_schonmalreingelassen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_PERM_Info()
{
	AI_Output(other,self,"DIA_Lothar_PERM_15_00");	//Ничего интересного не было за последнее время?
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV) || (other.guild == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_01");	//Да, сюда стали пускать оборванцев вроде тебя. Такого не случалось уже многие века.
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_02");	//Ты должен зарубить себе на носу. В качестве члена городской стражи в твои обязанности входит поддерживать в городе закон и порядок!
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_03");	//Нет.
	};
};


instance DIA_Lothar_PICKPOCKET(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 900;
	condition = DIA_Lothar_PICKPOCKET_Condition;
	information = DIA_Lothar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Lothar_PICKPOCKET_Condition()
{
	return C_Beklauen(56,95);
};

func void DIA_Lothar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lothar_PICKPOCKET);
	Info_AddChoice(DIA_Lothar_PICKPOCKET,Dialog_Back,DIA_Lothar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lothar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lothar_PICKPOCKET_DoIt);
};

func void DIA_Lothar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lothar_PICKPOCKET);
};

func void DIA_Lothar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lothar_PICKPOCKET);
};

