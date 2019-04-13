
instance DIA_Bosper_EXIT(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 999;
	condition = DIA_Bosper_EXIT_Condition;
	information = DIA_Bosper_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bosper_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bosper_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bosper_HALLO(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_HALLO_Condition;
	information = DIA_Bosper_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bosper_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Bosper_HALLO_Info()
{
	AI_Output(self,other,"DIA_Bosper_HALLO_11_00");	//Добро пожаловать в мою лавку, чужеземец!
	AI_Output(self,other,"DIA_Bosper_HALLO_11_01");	//Я Боспер. Я делаю луки и торгую шкурами.
	AI_Output(self,other,"DIA_Bosper_HALLO_11_02");	//Что привело тебя в Хоринис?
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Боспер делает луки и торгует шкурами. Его лавка находится у восточных ворот, в нижней части города.");
};


instance DIA_Bosper_IntoOV(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_IntoOV_Condition;
	information = DIA_Bosper_IntoOV_Info;
	permanent = FALSE;
	description = "Мне нужно попасть в верхний квартал...";
};


func int DIA_Bosper_IntoOV_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_IntoOV_Info()
{
	AI_Output(other,self,"DIA_Bosper_IntoOV_15_00");	//Мне нужно попасть в верхний квартал...
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_01");	//Где живут паладины? Забудь об этом.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_02");	//Тебе нужно быть уважаемым гражданином или, хотя бы, иметь приличную работу.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_03");	//А чужаку вроде тебя ни за что туда не попасть.
	if(Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(other,self,"DIA_Bosper_IntoOV_15_04");	//Я это заметил...
	};
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_Running);
	B_LogEntry(TOPIC_OV,"Чтобы попасть в верхний квартал, я либо должен стать уважаемым гражданином, либо получить работу.");
};


instance DIA_Bosper_SeekWork(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_SeekWork_Condition;
	information = DIA_Bosper_SeekWork_Info;
	permanent = FALSE;
	description = "Я ищу работу!";
};


func int DIA_Bosper_SeekWork_Condition()
{
	return TRUE;
};

func void DIA_Bosper_SeekWork_Info()
{
	AI_Output(other,self,"DIA_Bosper_SeekWork_15_00");	//Я ищу работу!
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_01");	//Ммм - мне не помешал бы новый ученик.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_02");	//Последний, что у меня был, бросил свою работу пару дней назад.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_03");	//Ты что-нибудь знаешь об охоте, а?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_04");	//Нуууу...
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_05");	//Я мог бы научить тебя снимать шкуры с животных.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_06");	//Я буду хорошо платить тебе за каждую шкуру, что ты принесешь мне.
	}
	else
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_07");	//Я могу дать тебе несколько шкур, если ты это имел в виду.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_08");	//Превосходно! Приноси мне все шкуры, что тебе удастся добыть - я куплю их у тебя по очень хорошей цене.
	};
	B_LogEntry(TOPIC_Lehrling,"Боспер ищет нового ученика. Я могу начать работать у него.");
};


var int Bosper_HintToJob;
var int Bosper_StartGuild;

instance DIA_Bosper_LEHRLING(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_LEHRLING_Condition;
	information = DIA_Bosper_LEHRLING_Info;
	permanent = TRUE;
	description = "Я хочу стать твоим учеником!";
};


func int DIA_Bosper_LEHRLING_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_SeekWork) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Bosper_LEHRLING_15_00");	//Я хочу стать твоим учеником!
	if(MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_01");	//(ухмыляется) Отлично! Похоже, ты уже знаешь основы.
		stimmen = stimmen + 1;
		if(Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if((MIS_Harad_Orc == LOG_SUCCESS) || (MIS_HakonBandits == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_02");	//Гарад считает, что ты хороший человек.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_03");	//Но Гарад пока не уверен в твоих способностях.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_04");	//Но Гарад говорит, что никогда не видел тебя.
		};
		if(Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_05");	//Торбен дает тебе свое благословение. Я не так набожен, как он, но все же это хорошо.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_06");	//Торбен даст тебе свое одобрение только с благословения богов.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_07");	//Торбен понятия не имеет, кто ты такой.
		};
		if(Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_08");	//Константино говорит, что ты можешь стать учеником кого захочешь.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_09");	//Константино говорит, что ты обвиняешься в преступлении в городе - надеюсь, это какая-нибудь ерунда?
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_10");	//Позаботься, чтобы этот вопрос был улажен.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_11");	//Константино никогда даже не слышал о тебе.
		};
		if(Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_12");	//Маттео говорит, что ты стоишь столько же, сколько золото равное твоему весу.
				stimmen = stimmen + 1;
			}
			else if(MIS_Matteo_Gold == LOG_Running)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_13");	//Маттео упомянул о каких-то долгах - я не знаю, что он имеет в виду, но тебе лучше поговорить с ним.
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_14");	//Маттео говорит, что еще не говорил с тобой об этом.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_15");	//Маттео говорит, что никогда не видел тебя.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_16");	//Это означает, что ты получил одобрение всех мастеров!
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_17");	//Ты получил одобрение четырех мастеров. Этого достаточно, чтобы быть принятым в ученики.
			};
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_18");	//Ты можешь начать работать на меня когда только захочешь.
			Info_ClearChoices(DIA_Bosper_LEHRLING);
			Info_AddChoice(DIA_Bosper_LEHRLING,"Хорошо - я подумаю над этим.",DIA_Bosper_LEHRLING_Later);
			Info_AddChoice(DIA_Bosper_LEHRLING,"Я готов стать твоим учеником!",DIA_Bosper_LEHRLING_OK);
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_19");	//Тебе нужно получить одобрение хотя бы четырех мастеров. Без этого ты не сможешь стать учеником в нижней части города.
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_20");	//Это означает, что ты должен поговорить со всеми, кто еще сомневается в тебе.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_21");	//Прежде чем взять тебя к себе, я должен сначала понять, годен ли ты вообще хоть на что-то.
		if(MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_22");	//Ты вернул назад мой лук, но это ничего не говорит о твоем таланте охотника.
		};
		Bosper_HintToJob = TRUE;
	};
};

func void DIA_Bosper_LEHRLING_OK()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_OK_15_00");	//Я готов стать твоим учеником!
	AI_Output(self,other,"DIA_Bosper_LEHRLING_OK_11_01");	//Ты не пожалеешь об этом! Думаю, мы сработаемся.
	Player_IsApprentice = APP_Bosper;
	Npc_ExchangeRoutine(Lothar,"START");
	Bosper_StartGuild = other.guild;
	Bosper_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("gritta",GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP(XP_Lehrling);
	B_LogEntry(Topic_Bonus,"Боспер принял меня в ученики. Теперь я смогу попасть в верхний квартал.");
	Info_ClearChoices(DIA_Bosper_LEHRLING);
};

func void DIA_Bosper_LEHRLING_Later()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_Later_15_00");	//Хорошо - я подумаю над этим.
	AI_Output(self,other,"DIA_Bosper_LEHRLING_Later_11_01");	//Смотри, не прими ошибочного решения! Ты лучше всего подходишь именно для моей работы.
	Info_ClearChoices(DIA_Bosper_LEHRLING);
};


instance DIA_Bosper_OtherMasters(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_OtherMasters_Condition;
	information = DIA_Bosper_OtherMasters_Info;
	permanent = FALSE;
	description = "А что если я захочу поступить в ученики к другому мастеру?";
};


func int DIA_Bosper_OtherMasters_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_SeekWork) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_OtherMasters_Info()
{
	AI_Output(other,self,"DIA_Bosper_OtherMasters_15_00");	//А что если я захочу поступить в ученики к другому мастеру?
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_01");	//(раздраженно) Бред!
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_02");	//Гарад и Маттео уже имеют учеников.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_03");	//Алхимик Константино - одинокий волк. У него не было ученика уже многие годы.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_04");	//А что касается Торбена - все знают, что он обанкротился. Он, вероятно, даже не сможет платить тебе.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_05");	//А мне вот, например, очень нужен ученик. И плачу я хорошо.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_06");	//Но не важно, чьим учеником ты хочешь стать - тебе понадобится одобрение всех мастеров из нижней части города...
};


instance DIA_Bosper_Bartok(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 4;
	condition = DIA_Bosper_Bartok_Condition;
	information = DIA_Bosper_Bartok_Info;
	permanent = FALSE;
	description = "А почему твой ученик бросил работу?";
};


func int DIA_Bosper_Bartok_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_SeekWork))
	{
		return TRUE;
	};
};

func void DIA_Bosper_Bartok_Info()
{
	AI_Output(other,self,"DIA_Bosper_Bartok_15_00");	//А почему твой ученик бросил работу?
	AI_Output(self,other,"DIA_Bosper_Bartok_11_01");	//Как он сказал, последнее время охотиться стало слишком опасно.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_02");	//Если тебе это действительно интересно, ты можешь спросить его об этом сам.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_03");	//Его зовут Барток. Он, вероятно, ошивается где-то у таверны Корагона.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_04");	//Пройди через подземный проход у кузницы и окажешься прямо перед ним.
};


instance DIA_Bosper_ZUSTIMMUNG(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_ZUSTIMMUNG_Condition;
	information = DIA_Bosper_ZUSTIMMUNG_Info;
	permanent = TRUE;
	description = "Я получу твое одобрение на работу с другим мастером?";
};


func int DIA_Bosper_ZUSTIMMUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_OtherMasters) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};


var int Bosper_Zustimmung_Once;

func void DIA_Bosper_ZUSTIMMUNG_Info()
{
	AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_00");	//Я получу твое одобрение на работу с другим мастером?
	if((MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_01");	//(разочарованно) Я надеялся, что ты выберешь меня.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_02");	//Но если ты решил так...
		AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_03");	//Это означает, что ты проголосуешь за меня?
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_04");	//Если никто больше из мастеров не будет возражать - то да.
		if(MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_05");	//Ты ведь все же вернул назад мой лук.
		};
		if(MIS_Bosper_WolfFurs == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_06");	//Но из тебя бы получился такой хороший охотник!
		};
		if(Bosper_Zustimmung_Once == FALSE)
		{
			B_GivePlayerXP(XP_Zustimmung);
			Bosper_Zustimmung_Once = TRUE;
		};
		B_LogEntry(TOPIC_Lehrling,"Боспер даст мне свое одобрение, если я захочу стать учеником другого мастера.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_07");	//(вздыхает) Хорошо! Ты получишь мое одобрение - но при одном условии.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_08");	//Поработай на меня, хотя бы недолго.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_09");	//Таким образом, ты сможешь понять, нравится тебе мое ремесло или нет.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_10");	//И кто знает - может это тебе так понравится, что ты останешься со мной.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_11");	//Если ты достаточно хорош, чтобы стать МОИМ учеником, то ты также подойдешь и другим мастерам.
		Bosper_HintToJob = TRUE;
	};
};


instance DIA_Bosper_Job(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_Job_Condition;
	information = DIA_Bosper_Job_Info;
	permanent = FALSE;
	description = "Что ты хочешь, чтобы я сделал для тебя?";
};


func int DIA_Bosper_Job_Condition()
{
	if(Bosper_HintToJob == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bosper_Job_Info()
{
	AI_Output(other,self,"DIA_Bosper_Job_15_00");	//Что ты хочешь, чтобы я сделал для тебя?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_01");	//Я научу тебя снимать шкуры с животных, и ты принесешь мне - скажем - полдюжины волчьих шкур.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Боспер может обучить меня снимать шкуры с животных.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_02");	//Принеси мне полдюжины волчьих шкур.
	};
	AI_Output(self,other,"DIA_Bosper_Job_11_03");	//Тогда я пойму, что ты освоил это ремесло.
	AI_Output(self,other,"DIA_Bosper_Job_11_04");	//Если только у тебя не уйдет на это целая вечность, и если шкуры будут в приемлемом состоянии. И тогда я возьму тебя к себе, если ты захочешь.
	if(Npc_KnowsInfo(other,DIA_Bosper_OtherMasters))
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_05");	//Или (вздыхает) ты сможешь стать учеником другого мастера - если ты этого действительно хочешь.
	};
	MIS_Bosper_WolfFurs = LOG_Running;
	Log_CreateTopic(TOPIC_BosperWolf,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BosperWolf,LOG_Running);
	B_LogEntry(TOPIC_BosperWolf,"Я должен принести Босперу шесть волчьих шкур. Тогда я смогу либо работать на него, либо получу его одобрение на работу с другими мастерами.");
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		B_LogEntry(TOPIC_BosperWolf,"Я должен попросить его обучить меня снимать шкуры с животных.");
	};
};


instance DIA_Bosper_BringFur(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 102;
	condition = DIA_Bosper_BringFur_Condition;
	information = DIA_Bosper_BringFur_Info;
	permanent = TRUE;
	description = "Насчет волчьих шкур...";
};


func int DIA_Bosper_BringFur_Condition()
{
	if(MIS_Bosper_WolfFurs == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BringFur_Info()
{
	AI_Output(other,self,"DIA_Bosper_BringFur_15_00");	//Насчет волчьих шкур...
	if(Player_IsApprentice > APP_NONE)
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_01");	//Ты уже стал учеником другого мастера. Я буду покупать у тебя шкуры по обычной цене.
		MIS_Bosper_WolfFurs = LOG_OBSOLETE;
		return;
	};
	if(B_GiveInvItems(other,self,ItAt_WolfFur,6))
	{
		AI_Output(other,self,"DIA_Bosper_BringFur_15_02");	//Я принес их - вот.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_03");	//Отлично! Я знал, что ты подходишь для этой работы.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_04");	//Вот деньги, как я и обещал тебе.
		B_GiveInvItems(self,other,ItMi_Gold,Value_WolfFur * 6);
		AI_Output(self,other,"DIA_Bosper_BringFur_11_05");	//И? Что скажешь? Разве это не лучше, чем корпеть над мечами день напролет или наполнять бутылочки в пыльной каморке?
		MIS_Bosper_WolfFurs = LOG_SUCCESS;
		B_LogEntry(TOPIC_Lehrling,"Боспер примет меня в ученики, если другие мастера не будут против.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_06");	//Мы договорились на полдюжины - но у тебя еще есть время. Иди и добудь эти шкуры.
	};
};


instance DIA_Bosper_TeachFUR(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_TeachFUR_Condition;
	information = DIA_Bosper_TeachFUR_Info;
	permanent = TRUE;
	description = "Научи меня снимать шкуры с животных! (5 LP)";
};


func int DIA_Bosper_TeachFUR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_Job) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_TeachFUR_Info()
{
	AI_Output(other,self,"DIA_Bosper_TeachFUR_15_00");	//Научи меня снимать шкуры с животных!
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_01");	//Хорошо. Слушай. Это довольно просто.
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_02");	//Берешь острый нож и разрезаешь брюхо животного. Затем делаешь несколько небольших надрезов на внутренней стороне ног, и снимаешь шкуру.
		if(MIS_Bosper_WolfFurs == LOG_Running)
		{
			AI_Output(self,other,"DIA_Bosper_TeachFUR_11_03");	//Принеси мне волчьи шкуры, а там посмотрим...
			B_LogEntry(TOPIC_BosperWolf,"Боспер научил меня снимать шкуры с животных.");
		};
	};
};


instance DIA_Bosper_Trade(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 700;
	condition = DIA_Bosper_Trade_Condition;
	information = DIA_Bosper_Trade_Info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
};


func int DIA_Bosper_Trade_Condition()
{
	if(MIS_Bosper_WolfFurs != LOG_Running)
	{
		DIA_Bosper_Trade.trade = TRUE;
	};
	return TRUE;
};

func void DIA_Bosper_Trade_Info()
{
	var int McBolzenAmount;
	var int McArrowAmount;
	AI_Output(other,self,"DIA_Bosper_Trade_15_00");	//Покажи мне свои товары.
	if(DIA_Bosper_Trade.trade == TRUE)
	{
		B_GiveTradeInv(self);
		Npc_RemoveInvItems(self,ItRw_Bolt,Npc_HasItems(self,ItRw_Bolt));
		McBolzenAmount = Kapitel * 50;
		CreateInvItems(self,ItRw_Bolt,McBolzenAmount);
		Npc_RemoveInvItems(self,ItRw_Arrow,Npc_HasItems(self,ItRw_Arrow));
		McArrowAmount = Kapitel * 50;
		CreateInvItems(self,ItRw_Arrow,McArrowAmount);
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Trade_11_01");	//Ты здесь не для того, чтобы разглядывать мои товары, ты должен принести мне шкуры!
		AI_Output(self,other,"DIA_Bosper_Trade_11_02");	//Так что берись за дело!
	};
};


instance DIA_Bosper_BogenRunning(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 5;
	condition = DIA_Bosper_BogenRunning_Condition;
	information = DIA_Bosper_BogenRunning_Info;
	permanent = FALSE;
	description = "Я слышал, что у тебя что-то украли.";
};


func int DIA_Bosper_BogenRunning_Condition()
{
	if(MIS_Bosper_Bogen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BogenRunning_Info()
{
	AI_Output(other,self,"DIA_Bosper_BogenRunning_15_00");	//Я слышал, что у тебя что-то украли.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_01");	//Кто сказал тебе это? Вероятно Барток, да? Ему что, больше нечего было сказать тебе? Ох, ладно.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_02");	//Но если я доберусь до этого ублюдка, никакие молитвы ему не помогут!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_03");	//Я отлучился из своей лавки всего на минуту. А когда вернулся, я увидел только, как он выходил - с моим луком на плече.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_04");	//Я тут же позвал стражу, но этот подонок побежал к гавани. И они потеряли его там!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_05");	//Я спустил на них всех собак за это, и стражники обыскали весь портовый квартал. Но ничего не нашли.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_06");	//Бестолочи!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_07");	//Готов поклясться, что мой лук все еще находится где-то в городе. Я поговорил со стражей у обоих городских ворот, но они не видели, чтобы кто-нибудь выходил из города с луком.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_08");	//Когда я доберусь до этого ублюдка...
	Log_CreateTopic(TOPIC_BosperBogen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BosperBogen,LOG_Running);
	B_LogEntry(TOPIC_BosperBogen,"У Боспера был украден лук. Вор побежал к гавани, и скрылся там. Ополчение обыскало портовый квартал, но они ничего не нашли, хотя лук все еще должен быть в городе.");
};


instance DIA_Bosper_BogenSuccess(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 6;
	condition = DIA_Bosper_BogenSuccess_Condition;
	information = DIA_Bosper_BogenSuccess_Info;
	permanent = FALSE;
	description = "Я думаю, это твой лук...";
};


func int DIA_Bosper_BogenSuccess_Condition()
{
	if(Npc_HasItems(other,ItRw_Bow_L_03_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BogenSuccess_Info()
{
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_00");	//Я думаю, это твой лук...
	B_GiveInvItems(other,self,ItRw_Bow_L_03_MIS,1);
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_01");	//Мой лук! Где ты нашел его?
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_02");	//В темной дыре, полной крыс.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_03");	//Надеюсь, у тебя не возникло проблем из-за этого...
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_04");	//Нет - мне приходилось делать такое и раньше.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_05");	//Хм - но все же спасибо. Я твой должник!
	MIS_Bosper_Bogen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Bosper_Bogen);
	Npc_RemoveInvItems(self,ItRw_Bow_L_03_MIS,1);
};


var int Bosper_Island;

instance DIA_Bosper_PERM(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 10;
	condition = DIA_Bosper_PERM_Condition;
	information = DIA_Bosper_PERM_Info;
	permanent = TRUE;
	description = "Как обстановка в городе?";
};


func int DIA_Bosper_PERM_Condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Bosper_PERM_Info()
{
	AI_Output(other,self,"DIA_Bosper_PERM_15_00");	//Как обстановка в городе?
	if(Bosper_Island == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_01");	//Если орки действительно решатся напасть на нас, здесь станет совсем паршиво.
		AI_Output(self,other,"DIA_Bosper_PERM_11_02");	//В гавани стоит только один корабль - и его охраняют паладины. Я не думаю, что они используют его для спасения горожан.
		AI_Output(other,self,"DIA_Bosper_PERM_15_03");	//А нет другого способа выбраться отсюда?
		AI_Output(self,other,"DIA_Bosper_PERM_11_04");	//Нет, никому из нас не покинуть этот остров без корабля.
		Bosper_Island = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_05");	//Пока нет никаких новостей. Если хочешь, зайди позже.
	};
};


var int Bosper_MILKommentar;
var int Bosper_PALKommentar;
var int Bosper_INNOSKommentar;

instance DIA_Bosper_AlsLehrling(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_AlsLehrling_Condition;
	information = DIA_Bosper_AlsLehrling_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Bosper_AlsLehrling_Condition()
{
	if((Player_IsApprentice == APP_Bosper) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Bosper_AlsLehrling_Info()
{
	if((other.guild == GIL_MIL) && (Bosper_StartGuild != GIL_MIL) && (Bosper_MILKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_00");	//Ты что, вступил в ополчение, да?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_01");	//Мне, в общем-то, все равно. Лишь бы ты, помимо орков и бандитов, охотился также и на волков. (ухмыляется)
		Bosper_MILKommentar = TRUE;
	}
	else if((other.guild == GIL_PAL) && (Bosper_StartGuild != GIL_PAL) && (Bosper_PALKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_02");	//Похоже, твоя карьера переживает стремительный взлет. Паладин короля!
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_03");	//Но куда бы ни занесло тебя, прошу, не забывай своего старого учителя...
		Bosper_PALKommentar = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (Bosper_StartGuild != GIL_NOV) && (Bosper_StartGuild != GIL_KDF) && (Bosper_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_04");	//Ты постригся в монастырь, да? Надеюсь, они будут отпускать тебя хоть иногда, и ты сможешь приносить мне шкуры...
		Bosper_INNOSKommentar = TRUE;
	}
	else if((Bosper_Lehrling_Day <= (Wld_GetDay() - 4)) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_05");	//Где ты болтался так долго?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_06");	//Мне нужны еще шкуры. Ты принес их?
		Bosper_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_07");	//Пришел, наконец...
		Bosper_Lehrling_Day = Wld_GetDay();
	};
};


instance DIA_Bosper_Aufgaben(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_Aufgaben_Condition;
	information = DIA_Bosper_Aufgaben_Info;
	permanent = FALSE;
	description = "Что должен делать ученик?";
};


func int DIA_Bosper_Aufgaben_Condition()
{
	if(Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};

func void DIA_Bosper_Aufgaben_Info()
{
	AI_Output(other,self,"DIA_Bosper_Aufgaben_15_00");	//Что должен делать ученик?
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_01");	//Это просто. Приноси мне все шкуры, что сможешь добыть.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_02");	//Я дам тебе за них более высокую цену, чем любой другой из местных торговцев.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_03");	//Ну, а в остальное время, тебе не обязательно появляться в моей лавке. Я и один тут неплохо справляюсь.
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Bosper_Aufgaben_15_04");	//А где я буду спать?
		AI_Output(self,other,"DIA_Bosper_Aufgaben_11_05");	//У меня здесь нет места для тебя. Но ты всегда найдешь свободную койку в отеле на рыночной площади.
	};
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"Боспер готов платить очень хорошую цену за шкуры животных.");
};


var int Bosper_TrollFurSold;

instance DIA_Bosper_SellFur(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 600;
	condition = DIA_Bosper_SellFur_Condition;
	information = DIA_Bosper_SellFur_Info;
	permanent = TRUE;
	description = "Я принес несколько шкур для тебя...";
};


func int DIA_Bosper_SellFur_Condition()
{
	if(Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};

func void DIA_Bosper_SellFur_Info()
{
	AI_Output(other,self,"DIA_Bosper_SellFur_15_00");	//Я принес несколько шкур для тебя...
	if((Npc_HasItems(other,ItAt_SheepFur) > 0) || (Npc_HasItems(other,ItAt_WolfFur) > 0) || (Npc_HasItems(other,ItAt_WargFur) > 0) || (Npc_HasItems(other,ItAt_ShadowFur) > 0) || (Npc_HasItems(other,ItAt_TrollFur) > 0) || (Npc_HasItems(other,ItAt_TrollBlackFur) > 0) || (Npc_HasItems(other,ItAt_Addon_KeilerFur) > 0))
	{
		if(Npc_HasItems(other,ItAt_Addon_KeilerFur) > 0)
		{
			AI_Wait(self,3);
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_Addon_KeilerFur) * Value_Keilerfur);
			B_GiveInvItems(other,self,ItAt_Addon_KeilerFur,Npc_HasItems(other,ItAt_Addon_KeilerFur));
		};
		if(Npc_HasItems(other,ItAt_SheepFur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_01");	//Овечьи шкуры? Ты ведь не убивал овец фермеров на пастбищах, нет?
			AI_Output(other,self,"DIA_Bosper_SellFur_15_02");	//Я даже и не думал заниматься этим...
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_SheepFur) * Value_SheepFur);
			B_GiveInvItems(other,self,ItAt_SheepFur,Npc_HasItems(other,ItAt_SheepFur));
		};
		if(Npc_HasItems(other,ItAt_WolfFur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_03");	//Волчьи шкуры это хорошо...
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_WolfFur) * Value_WolfFur);
			B_GiveInvItems(other,self,ItAt_WolfFur,Npc_HasItems(other,ItAt_WolfFur));
		};
		if(Npc_HasItems(other,ItAt_WargFur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_04");	//Шкура варга? Это опасные звери ...
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_WargFur) * Value_WargFur);
			B_GiveInvItems(other,self,ItAt_WargFur,Npc_HasItems(other,ItAt_WargFur));
		};
		if(Npc_HasItems(other,ItAt_ShadowFur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_05");	//Ах, и даже шкура мракориса - она дорогого стоит.
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_ShadowFur) * Value_ShadowFur);
			B_GiveInvItems(other,self,ItAt_ShadowFur,Npc_HasItems(other,ItAt_ShadowFur));
		};
		if((Npc_HasItems(other,ItAt_TrollFur) > 0) || (Npc_HasItems(other,ItAt_TrollBlackFur) > 0))
		{
			if(Bosper_TrollFurSold == FALSE)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_06");	//А это что за шкура, черт побери?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_07");	//Я снял ее с тролля.
				AI_Output(self,other,"DIA_Bosper_SellFur_11_08");	//Это... она стоит целое состояние.
				Bosper_TrollFurSold = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_09");	//Еще одна шкура огромного тролля... ты что, охотишься на них?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_10");	//Когда я натыкаюсь на одного из них, я не упускаю такой возможности...
			};
			if(Npc_HasItems(other,ItAt_TrollFur) > 0)
			{
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_TrollFur) * Value_TrollFur);
				B_GiveInvItems(other,self,ItAt_TrollFur,Npc_HasItems(other,ItAt_TrollFur));
			};
			if(Npc_HasItems(other,ItAt_TrollBlackFur) > 0)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_11");	//И шкура черного тролля, надо же!
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_TrollBlackFur) * Value_TrollBlackFur);
				B_GiveInvItems(other,self,ItAt_TrollBlackFur,Npc_HasItems(other,ItAt_TrollBlackFur));
			};
		};
		AI_Output(self,other,"DIA_Bosper_SellFur_11_12");	//Отличная работа. Заходи ко мне еще, когда у тебя будут шкуры...
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_SellFur_11_13");	//Но, знаешь - меня интересуют только шкуры волков, мракорисов и им подобные...
	};
};


instance DIA_Bosper_Minenanteil(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_Minenanteil_Condition;
	information = DIA_Bosper_Minenanteil_Info;
	description = "Я вижу, ты продаешь акции шахт.";
};


func int DIA_Bosper_Minenanteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Bosper_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Bosper_Minenanteil_15_00");	//Я вижу, ты продаешь акции шахт.
	AI_Output(self,other,"DIA_Bosper_Minenanteil_11_01");	//Гм. Я ничего не знаю об этом. Ты можешь забрать их, если хочешь.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bosper_PICKPOCKET(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 900;
	condition = DIA_Bosper_PICKPOCKET_Condition;
	information = DIA_Bosper_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Bosper_PICKPOCKET_Condition()
{
	return C_Beklauen(67,120);
};

func void DIA_Bosper_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bosper_PICKPOCKET);
	Info_AddChoice(DIA_Bosper_PICKPOCKET,Dialog_Back,DIA_Bosper_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bosper_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bosper_PICKPOCKET_DoIt);
};

func void DIA_Bosper_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bosper_PICKPOCKET);
};

func void DIA_Bosper_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bosper_PICKPOCKET);
};

