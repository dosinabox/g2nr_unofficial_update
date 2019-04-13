
instance DIA_Harad_EXIT(C_Info)
{
	npc = VLK_412_Harad;
	nr = 999;
	condition = DIA_Harad_EXIT_Condition;
	information = DIA_Harad_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Harad_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Harad_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Harad_Hallo(C_Info)
{
	npc = VLK_412_Harad;
	nr = 2;
	condition = DIA_Harad_Hallo_Condition;
	information = DIA_Harad_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Harad_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Harad_Hallo_Info()
{
	AI_Output(self,other,"DIA_Harad_Hallo_12_00");	//(раздраженно) Что ты хочешь?
};


instance DIA_Harad_Arbeit(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Arbeit_Condition;
	information = DIA_Harad_Arbeit_Info;
	permanent = FALSE;
	description = "Я ищу работу!";
};


func int DIA_Harad_Arbeit_Condition()
{
	return TRUE;
};

func void DIA_Harad_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Harad_Arbeit_15_00");	//Я ищу работу!
	AI_Output(self,other,"DIA_Harad_Arbeit_12_01");	//Хм - мне не помешал бы новый ученик.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_02");	//Брайан скоро закончит свое обучение, а затем покинет город.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_03");	//А ты на что-нибудь годишься?
	AI_Output(other,self,"DIA_Harad_Arbeit_15_04");	//Если ты имеешь в виду, знаю ли я работу кузнеца...
	AI_Output(self,other,"DIA_Harad_Arbeit_12_05");	//Нет. Я о другом.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_06");	//Рано или поздно, придут орки и возьмут город в кольцо. И тогда в расчет будут приниматься только мужчины, способные защищать город.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Harad_Arbeit_12_07");	//А я не хочу, чтобы мой ученик опозорил мое имя, сбежав из города вместе с женщинами и никчемными бездельниками, вместо того, чтобы держать оборону вместе с другими мужчинами.
	};
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"Если я смогу убедить Гарада, что я хоть на что-нибудь гожусь, он примет меня в ученики.");
};


instance DIA_Harad_Taugenichts(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Taugenichts_Condition;
	information = DIA_Harad_Taugenichts_Info;
	permanent = FALSE;
	description = "Я не никчемный!";
};


func int DIA_Harad_Taugenichts_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Harad_Taugenichts_Info()
{
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_00");	//Я не никчемный!
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_01");	//Это громкие слова! А ты можешь подтвердить их такими же громкими делами?
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_02");	//На что ты намекаешь?
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_03");	//Принеси мне оружие орков.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_04");	//Орков недавно видели около города. Я думаю, тебе не придется искать их слишком долго.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_05");	//Если тебе удастся завалить одного из них, я возьму тебя в ученики.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_06");	//Если, конечно, другие мастера будут согласны.
	MIS_Harad_Orc = LOG_Running;
	Log_CreateTopic(TOPIC_HaradOrk,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HaradOrk,LOG_Running);
	B_LogEntry(TOPIC_HaradOrk,"Неподалеку от города видели орка. Кузнец Гарад хочет, чтобы я убил его. Оружие орка послужит достаточным доказательством.");
};


instance DIA_Harad_OrcRunning(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcRunning_Condition;
	information = DIA_Harad_OrcRunning_Info;
	permanent = FALSE;
	description = "Давай еще поговорим об этих орках...";
};


func int DIA_Harad_OrcRunning_Condition()
{
	if((MIS_Harad_Orc == LOG_Running) && (Harad_HakonMission == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Harad_OrcRunning_Info()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_15_00");	//Давай еще поговорим об этих орках...
	AI_Output(self,other,"DIA_Harad_OrcRunning_12_01");	//(отрывисто) Что?
	Info_ClearChoices(DIA_Harad_OrcRunning);
	Info_AddChoice(DIA_Harad_OrcRunning,"Можешь считать своего орка мертвым!",DIA_Harad_OrcRunning_Done);
	Info_AddChoice(DIA_Harad_OrcRunning,"Но орк - это очень серьезный противник...",DIA_Harad_OrcRunning_TooHard);
};

func void DIA_Harad_OrcRunning_TooHard()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_00");	//Но орк - это очень серьезный противник...
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_01");	//Хм - судя по тому, как ты выглядишь, возможно, ты прав. У тебя слишком мало мяса на костях. Но это можно поправить.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_02");	//Тем не менее, ты должен доказать мне, что у тебя хватит мужества сражаться, если это будет необходимо.
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_03");	//А нет ли для меня противника немного поменьше?
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_04");	//Хм - (задумчиво) Хакон, торговец оружием на рыночной площади, сказал мне, что на него напали бандиты несколько дней назад.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_05");	//Эти ублюдки, по слухам, устроили себе логово где-то за восточными воротами.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_06");	//Эти трусливые шакалы не должны быть так уж сильны.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_07");	//Убей этих ублюдков! Всех! Тогда я пойму, что ты не опозоришь наш город.
	Harad_HakonMission = TRUE;
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	if(MIS_HakonBandits != LOG_Running)
	{
		B_LogEntry(TOPIC_Lehrling,"Гарад сказал мне, что бандиты ограбили торговца Хакона недалеко от города. Если я смогу убить их, это убедит его, что я хоть на что-то гожусь. Я должен поговорить с Хаконом. Возможно, он знает, где скрываются эти бандиты.");
	}
	else
	{
		B_LogEntry(TOPIC_Lehrling,"Гарад сказал мне, что бандиты ограбили торговца Хакона недалеко от города. Если я смогу убить их, это убедит его, что я хоть на что-то гожусь.");
	};
	Info_ClearChoices(DIA_Harad_OrcRunning);
};

func void DIA_Harad_OrcRunning_Done()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_Done_15_00");	//Можешь считать своего орка мертвым!
	AI_Output(self,other,"DIA_Harad_OrcRunning_Done_12_01");	//Хорошо! Тогда не трать слова попусту. Пусть твои дела сами говорят за себя.
	Info_ClearChoices(DIA_Harad_OrcRunning);
};


instance DIA_Harad_OrcSuccess(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcSuccess_Condition;
	information = DIA_Harad_OrcSuccess_Info;
	permanent = FALSE;
	description = "Я принес тебе оружие орков, как ты хотел.";
};


func int DIA_Harad_OrcSuccess_Condition()
{
	if(MIS_Harad_Orc == LOG_Running)
	{
		if(Npc_HasItems(other,ItMw_2H_OrcAxe_01) || Npc_HasItems(other,ItMw_2H_OrcAxe_02) || Npc_HasItems(other,ItMw_2H_OrcAxe_03) || Npc_HasItems(other,ItMw_2H_OrcAxe_04) || Npc_HasItems(other,ItMw_2H_OrcSword_01) || Npc_HasItems(other,ItMw_2H_OrcSword_02))
		{
			return TRUE;
		};
	};
};

func void DIA_Harad_OrcSuccess_Info()
{
	AI_Output(other,self,"DIA_Harad_OrcSuccess_15_00");	//Я принес тебе оружие орков, как ты хотел.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_01");	//Покажи...
	if(Npc_HasItems(other,ItMw_2H_OrcAxe_04))
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_04,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcSword_02))
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcSword_02,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcSword_01))
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcSword_01,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcAxe_03))
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_03,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcAxe_02))
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_02,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcAxe_01))
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_01,1);
	};
	B_InspectMeleeWeapon(self);
	if(Harad_HakonMission == TRUE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_02");	//Ты ВСЕ ЖЕ сделал это?! Ты настоящий мужчина!
	};
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_03");	//Давно уже не держал я подобного оружия в своих руках - с тех пор, как был солдатом во время войны с орками.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_04");	//Да уж, суровые то были времена, скажу я тебе.
	if(Player_IsApprentice == APP_Harad)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_05");	//Я знал, что из тебя получится хороший ученик. Отличная работа!
	}
	else if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_06");	//Я не думал, что тебе удастся это. Я поражен.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_07");	//Жаль только, что ты выбрал другое ремесло.
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_08");	//Ты бы очень пригодился мне.
	};
	MIS_Harad_Orc = LOG_SUCCESS;
	B_GivePlayerXP(XP_Harad_Orc);
	B_LogEntry(TOPIC_Lehrling,"Гарад примет меня в ученики, если я смогу получить одобрение других мастеров.");
};


var int Harad_StartGuild;

instance DIA_Harad_LEHRLING(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_LEHRLING_Condition;
	information = DIA_Harad_LEHRLING_Info;
	permanent = TRUE;
	description = "Когда я могу стать твоим учеником?";
};


func int DIA_Harad_LEHRLING_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_Arbeit) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Harad_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Harad_LEHRLING_15_00");	//Когда я могу стать твоим учеником?
	if((MIS_Harad_Orc == LOG_SUCCESS) || ((MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE)))
	{
		if(MIS_Harad_Orc == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_01");	//Нам здесь совсем не помешал бы человек, способный прикончить орка.
			if(MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_02");	//Кроме того, Хакон рассказал мне, как ты решил проблему с бандитами. Ты настоящий мужчина!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_03");	//Ты не убил орка, но Хакон рассказал мне, как ты решил проблему с бандитами. Это хорошо!
		};
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_04");	//Что касается моего мнения, то ты можешь приступать к работе хоть сейчас.
		stimmen += 1;
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_05");	//А другие мастера...
		if(Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_06");	//Торбен дал тебе свое благословение.
				stimmen += 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_07");	//Старый добрый Торбен хочет, чтобы ты получил благословение богов. Я думаю, это хорошая идея.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_08");	//Торбен говорит, что никогда не видел тебя.
		};
		if(Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_09");	//Боспер пытался отговорить меня от идеи взять тебя в ученики. Он хочет, чтобы ты стал ЕГО учеником.
			if((MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_10");	//Я имел краткий, но напряженный разговор с ним по этому вопросу.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_11");	//В конце концов, он согласился.
				stimmen += 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_12");	//Он попросил меня, чтобы я дал тебе возможность хотя бы попробовать себя в его ремесле.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_13");	//Попробуй - ты можешь принять решение чуть позже. Если, конечно, тебе нужен его голос.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_14");	//Боспер пока не знает, кто ты такой.
		};
		if(Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_15");	//Как всегда, Константино ничего не волнует. Он сказал, что с его точки зрения, ты можешь стать моим учеником в любой момент.
				stimmen += 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_16");	//Константино говорит, что ты обвиняешься в преступлении в городе - это правда?
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_17");	//Если это так, то тебе нужно уладить эту проблему как можно быстрее!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_18");	//Константино никогда не слышал о тебе.
		};
		if(Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_19");	//Маттео говорит, что ты вернул ему его золото. Мне кажется, ты благородный молодой человек.
				stimmen += 1;
			}
			else if(MIS_Matteo_Gold == LOG_Running)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_20");	//Маттео говорит, что ты ему что-то должен. Я не знаю, что у вас там за дела, но ты должен урегулировать эту проблему.
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_21");	//Маттео говорит, что никогда не говорил об этом с тобой.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_22");	//Маттео говорит, что никогда не видел тебя в своей лавке.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_23");	//Это означает, что ты получил одобрение всех мастеров!
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_24");	//Это означает, что ты получил одобрение четырех мастеров. Этого достаточно, чтобы быть принятым в ученики.
			};
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_25");	//Ты готов стать моим учеником?
			Info_ClearChoices(DIA_Harad_LEHRLING);
			Info_AddChoice(DIA_Harad_LEHRLING,"Хорошо - я подумаю над этим.",DIA_Harad_LEHRLING_Later);
			Info_AddChoice(DIA_Harad_LEHRLING,"Я готов!",DIA_Harad_LEHRLING_OK);
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_26");	//Тебе нужно получить одобрение, по крайней мере, четырех мастеров. Иначе ты не сможешь стать учеником в нижней части города.
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_27");	//Поэтому ты должен поговорить со всеми мастерами, которые еще не уверены в тебе.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_28");	//Не раньше, чем докажешь мне, что хоть на что-то годен.
	};
};

func void DIA_Harad_LEHRLING_OK()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_00");	//Я готов!
	AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_01");	//Отлично! Я научу тебя ковать хорошие мечи.
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_02");	//Я уже умею это!
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_03");	//Что ж. Тем лучше!
	};
	if(other.attribute[ATR_STRENGTH] < (T_MED - 30))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04");	//Кроме того, пришло время стать немного сильнее. Ты чахнешь прямо у меня на глазах!
	};
	Player_IsApprentice = APP_Harad;
	Npc_ExchangeRoutine(Lothar,"START");
	Harad_StartGuild = other.guild;
	Harad_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("schmied",GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	B_LogEntry(Topic_Bonus,"Гарад принял меня в ученики. Теперь я смогу попасть в верхний квартал.");
	B_LogEntry(Topic_Bonus,"Гарад будет покупать оружие, выкованное мной, по хорошей цене.");
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_GivePlayerXP(XP_Lehrling);
	B_LogEntry(TOPIC_CityTeacher,"Гарад может обучить меня кузнечному делу. Также он может помочь мне стать сильнее.");
	Info_ClearChoices(DIA_Harad_LEHRLING);
};

func void DIA_Harad_LEHRLING_Later()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_Later_15_00");	//Хорошо - я подумаю над этим.
	if(!Npc_IsDead(Brian))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_Later_12_01");	//Как знаешь. Брайан все равно еще поработает здесь некоторое время.
	};
	Info_ClearChoices(DIA_Harad_LEHRLING);
};


instance DIA_Harad_Zustimmung(C_Info)
{
	npc = VLK_412_Harad;
	nr = 2;
	condition = DIA_Harad_Zustimmung_Condition;
	information = DIA_Harad_Zustimmung_Info;
	permanent = TRUE;
	description = "Могу я стать учеником другого мастера?";
};


func int DIA_Harad_Zustimmung_Condition()
{
	if((Player_IsApprentice == APP_NONE) && Npc_KnowsInfo(other,DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};


var int DIA_Harad_Zustimmung_Permanent;

func void DIA_Harad_Zustimmung_Info()
{
	AI_Output(other,self,"DIA_Harad_Zustimmung_15_00");	//Могу я стать учеником другого мастера?
	if((MIS_Harad_Orc == LOG_SUCCESS) || ((MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE)))
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_01");	//Ты хороший человек.
		if(MIS_HakonBandits == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_02");	//Хакон рассказал мне, как ты разделался с бандитами.
		};
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_03");	//Я дам тебе свое одобрение.
		if(DIA_Harad_Zustimmung_Permanent == FALSE)
		{
			B_GivePlayerXP(XP_Zustimmung);
			B_LogEntry(TOPIC_Lehrling,"Гарад даст мне свое одобрение, если я захочу стать учеником другого мастера.");
			DIA_Harad_Zustimmung_Permanent = TRUE;
		};
		if(!Npc_IsDead(Brian))
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_04");	//Брайан еще поработает здесь некоторое время. И я уверен, что рано или поздно найдется крепкий парень, способный заменить его.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_05");	//Другие мастера могут дать свое согласие на это. Но я дам свое одобрение только после того, как ты докажешь, что хоть на что-то годен!
	};
};


var int Harad_MILKommentar;
var int Harad_PALKommentar;
var int Harad_INNOSKommentar;

instance DIA_Harad_AlsLehrling(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_AlsLehrling_Condition;
	information = DIA_Harad_AlsLehrling_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Harad_AlsLehrling_Condition()
{
	if((Player_IsApprentice == APP_Harad) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Harad_AlsLehrling_Info()
{
	if((other.guild == GIL_MIL) && (Harad_StartGuild != GIL_MIL) && (Harad_MILKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_00");	//Ты теперь служишь в ополчении? Я горжусь тобой!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_01");	//Пока ты служишь в армии, естественно я не могу рассчитывать, что ты будешь выполнять еще и свои обязанности ученика.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_02");	//Но если тебе что-нибудь понадобится, можешь заходить ко мне, когда захочешь.
		Harad_MILKommentar = TRUE;
	}
	else if((other.guild == GIL_PAL) && (Harad_StartGuild != GIL_PAL) && (Harad_PALKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_03");	//Тебе удалось стать паладином!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_04");	//Я рад, что когда-то взял тебя в ученики. Даже хотя ты и не проводил много времени за наковальней.
		Harad_PALKommentar = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (Harad_StartGuild != GIL_NOV) && (Harad_StartGuild != GIL_KDF) && (Harad_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_05");	//Так ты постригся в монастырь. Я бы предпочел, чтобы ты оставался в городе. Нам нужны сильные люди.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_06");	//Но если ты решил следовать пути Инноса, то так тому и быть.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_07");	//Если тебе будет что-нибудь нужно от меня, я всегда буду рад помочь.
		Harad_INNOSKommentar = TRUE;
	}
	else if((Harad_Lehrling_Day <= (Wld_GetDay() - 4)) && (Harad_MILKommentar == FALSE) && (Harad_PALKommentar == FALSE) && (Harad_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_08");	//Давненько тебя не было видно здесь. Где ты был все это время, хм?
		Harad_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_09");	//Опять ты...
		Harad_Lehrling_Day = Wld_GetDay();
	};
};


instance DIA_Harad_Waffen(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_Waffen_Condition;
	information = DIA_Harad_Waffen_Info;
	permanent = FALSE;
	description = "Ты продаешь оружие?";
};


func int DIA_Harad_Waffen_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Harad_Waffen_Info()
{
	AI_Output(other,self,"DIA_Harad_Waffen_15_00");	//Ты продаешь оружие?
	AI_Output(self,other,"DIA_Harad_Waffen_12_01");	//Забудь об этом. Все, что я делаю, уходит паладинам или ополчению.
	AI_Output(self,other,"DIA_Harad_Add_12_00");	//У меня заказ на 100 мечей от лорда Хагена. Он хочет вооружить городскую стражу.
};


instance DIA_Harad_Aufgaben(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Aufgaben_Condition;
	information = DIA_Harad_Aufgaben_Info;
	permanent = FALSE;
	description = "Что должен делать ученик?";
};


func int DIA_Harad_Aufgaben_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_Aufgaben_Info()
{
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_00");	//Что должен делать ученик?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_01");	//Три вещи. Попробуй угадать.
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_02");	//Ковать, ковать и ковать?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_03");	//Ты не так уж бестолков, как кажешься. Я плачу за каждый меч. Если ты не работаешь, то и денег не получаешь. Это просто.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_05");	//Кроме того, я научу тебя всему, что нужно знать для изготовления обычных мечей.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_06");	//Изготовление магических мечей - работа для опытного кузнеца. Тебе до этого еще далеко...
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_07");	//Если тебе нужно место для сна, ты можешь прилечь где-нибудь в моем доме. Все понятно?
};


instance DIA_Harad_SellBlades(C_Info)
{
	npc = VLK_412_Harad;
	nr = 200;
	condition = DIA_Harad_SellBlades_Condition;
	information = DIA_Harad_SellBlades_Info;
	permanent = TRUE;
	description = "Я хочу продать оружие, выкованное мной.";
};


func int DIA_Harad_SellBlades_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_SellBlades_Info()
{
	var C_Item EquipWeap;
	var int anzahl_common;
	var int anzahl_schwert1;
	var int anzahl_schwert4;
	var int anzahl_rubinklinge;
	var int anzahl_elbastardo;
	var int gesamt;
	var string concatText;
	var int lohn;
	AI_Output(other,self,"DIA_Harad_SellBlades_15_00");	//Я хочу продать оружие, выкованное мной.
	EquipWeap = Npc_GetEquippedMeleeWeapon(other);
	anzahl_common = Npc_HasItems(other,ItMw_1H_Common_01);
	if(Hlp_IsItem(EquipWeap,ItMw_1H_Common_01))
	{
		if(anzahl_common > 1)
		{
			Npc_RemoveInvItem(other,ItMw_1H_Common_01);
		};
		anzahl_common -= 1;
	};
	anzahl_schwert1 = Npc_HasItems(other,ItMw_Schwert1);
	if(Hlp_IsItem(EquipWeap,ItMw_Schwert1))
	{
		if(anzahl_schwert1 > 1)
		{
			Npc_RemoveInvItem(other,ItMw_Schwert1);
		};
		anzahl_schwert1 -= 1;
	};
	anzahl_schwert4 = Npc_HasItems(other,ItMw_Schwert4);
	if(Hlp_IsItem(EquipWeap,ItMw_Schwert4))
	{
		if(anzahl_schwert4 > 1)
		{
			Npc_RemoveInvItem(other,ItMw_Schwert4);
		};
		anzahl_schwert4 -= 1;
	};
	anzahl_rubinklinge = Npc_HasItems(other,ItMw_Rubinklinge);
	if(Hlp_IsItem(EquipWeap,ItMw_Rubinklinge))
	{
		if(anzahl_rubinklinge > 1)
		{
			Npc_RemoveInvItem(other,ItMw_Rubinklinge);
		};
		anzahl_rubinklinge -= 1;
	};
	anzahl_elbastardo = Npc_HasItems(other,ItMw_ElBastardo);
	if(Hlp_IsItem(EquipWeap,ItMw_ElBastardo))
	{
		if(anzahl_elbastardo > 1)
		{
			Npc_RemoveInvItem(other,ItMw_ElBastardo);
		};
		anzahl_elbastardo -= 1;
	};
	gesamt = anzahl_common + anzahl_schwert1 + anzahl_schwert4 + anzahl_rubinklinge + anzahl_elbastardo;
	if(gesamt == 0)
	{
		if(Hlp_IsItem(EquipWeap,ItMw_1H_Common_01) || Hlp_IsItem(EquipWeap,ItMw_Schwert1) || Hlp_IsItem(EquipWeap,ItMw_Schwert4) || Hlp_IsItem(EquipWeap,ItMw_Rubinklinge) || Hlp_IsItem(EquipWeap,ItMw_ElBastardo))
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_01");	//Все, что у тебя есть - это меч, висящий на поясе. Ты лучше оставь его себе.
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_04");	//Тогда сделай его! Я принимаю только обычные мечи.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_SellBlades_12_02");	//Хорошо - давай сюда.
		Npc_RemoveInvItems(other,ItMw_1H_Common_01,anzahl_common);
		Npc_RemoveInvItems(other,ItMw_Schwert1,anzahl_schwert1);
		Npc_RemoveInvItems(other,ItMw_Schwert4,anzahl_schwert4);
		Npc_RemoveInvItems(other,ItMw_Rubinklinge,anzahl_rubinklinge);
		Npc_RemoveInvItems(other,ItMw_ElBastardo,anzahl_elbastardo);
		concatText = ConcatStrings(IntToString(gesamt),PRINT_ItemsGegeben);
		AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		AI_Output(self,other,"DIA_Harad_SellBlades_12_03");	//Отлично. Держи, что заработал.
		lohn = ((anzahl_common * Value_Common1) + (anzahl_schwert1 * Value_Schwert1) + (anzahl_schwert4 * Value_Schwert4) + (anzahl_rubinklinge * Value_Rubinklinge) + (anzahl_elbastardo * Value_ElBastardo)) / 3;
		B_GiveInvItems(self,other,ItMi_Gold,lohn);
		AI_EquipBestMeleeWeapon(other);
	};
};

func void B_Harad_TeachSmith()
{
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_01");	//Это довольно просто, парень. Берешь кусок сырой стали, и держишь его над огнем, пока он не раскалится.
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_02");	//Потом придаешь клинку форму на наковальне.
};

func void B_HaradSmithChoices()
{
	Info_ClearChoices(DIA_Harad_TeachSmith);
	Info_AddChoice(DIA_Harad_TeachSmith,Dialog_Back,DIA_Harad_TeachSmith_BACK);
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,B_BuildLearnString(NAME_Addon_Harad_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_04)),DIA_Harad_TeachSmith_Harad04);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,B_BuildLearnString(NAME_Addon_Harad_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_03)),DIA_Harad_TeachSmith_Harad03);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,B_BuildLearnString(NAME_Addon_Harad_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_02)),DIA_Harad_TeachSmith_Harad02);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,B_BuildLearnString(NAME_Addon_Harad_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_01)),DIA_Harad_TeachSmith_Harad01);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(DIA_Harad_TeachSmith,B_BuildLearnString("Научиться ковать",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),DIA_Harad_TeachSmith_Common);
	};
};


instance DIA_Harad_TeachSmith(C_Info)
{
	npc = VLK_412_Harad;
	nr = 50;
	condition = DIA_Harad_TeachSmith_Condition;
	information = DIA_Harad_TeachSmith_Info;
	permanent = TRUE;
	description = "Научи меня ковать хорошие мечи!";
};


func int DIA_Harad_TeachSmith_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE))
		{
			return TRUE;
		};
	};
};

func void DIA_Harad_TeachSmith_Info()
{
	AI_Output(other,self,"DIA_Harad_TeachCommon_15_00");	//Научи меня ковать хорошие мечи!
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_BACK()
{
	Info_ClearChoices(DIA_Harad_TeachSmith);
};

func void DIA_Harad_TeachSmith_Common()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_Common))
	{
		B_Harad_TeachSmith();
		AI_Output(self,other,"DIA_Harad_TeachCommon_12_03");	//Твой первый меч, конечно, не станет произведением искусства, но всему остальному ты научишься чуть позже.
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad01()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_01))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad02()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_02))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad03()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_03))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad04()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_04))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};


var int Harad_Merke_STR;

instance DIA_Harad_TeachSTR(C_Info)
{
	npc = VLK_412_Harad;
	nr = 100;
	condition = DIA_Harad_TeachSTR_Condition;
	information = DIA_Harad_TeachSTR_Info;
	permanent = 1;
	description = "Я хочу стать сильнее!";
};


func int DIA_Harad_TeachSTR_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_TeachSTR_Info()
{
	AI_Output(other,self,"DIA_Harad_TeachSTR_15_00");	//Я хочу стать сильнее!
//	Harad_Merke_STR = other.attribute[ATR_STRENGTH];
	Harad_Merke_STR = other.aivar[REAL_STRENGTH];
	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR,Dialog_Back,DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Harad_TeachSTR_5);
};

func void DIA_Harad_TeachSTR_BACK()
{
//	if(Harad_Merke_STR < other.attribute[ATR_STRENGTH])
	if(Harad_Merke_STR < other.aivar[REAL_STRENGTH])
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_01");	//Ты уже нарастил немного мускулов.
	};
//	if(other.attribute[ATR_STRENGTH] < T_MED)
	if(other.aivar[REAL_STRENGTH] < T_MED)
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_02");	//Возвращайся, если хочешь поучиться еще.
	};
	Info_ClearChoices(DIA_Harad_TeachSTR);
};

func void DIA_Harad_TeachSTR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR,Dialog_Back,DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Harad_TeachSTR_5);
};

func void DIA_Harad_TeachSTR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR,Dialog_Back,DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Harad_TeachSTR_5);
};


instance DIA_Harad_ImmerNoch(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_ImmerNoch_Condition;
	information = DIA_Harad_ImmerNoch_Info;
	permanent = FALSE;
	description = "Ты все еще работаешь на паладинов?";
};


func int DIA_Harad_ImmerNoch_Condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Harad_ImmerNoch_Info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_01");	//Ты все еще работаешь на паладинов?
	AI_Output(self,other,"DIA_Harad_Add_12_02");	//Я закончил заказ лорда Хагена.
	AI_Output(self,other,"DIA_Harad_Add_12_03");	//Теперь я делаю для него мечи из магической руды - но на этот раз за деньги.
	AI_Output(self,other,"DIA_Harad_Add_12_04");	//Но теперь у меня также есть время, чтобы делать оружие для торговцев на рыночной площади.
	AI_Output(self,other,"DIA_Harad_Add_12_05");	//Так что если ты ищешь хороший меч, обратись к ним.
};


instance DIA_Harad_AboutErzklingen(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_AboutErzklingen_Condition;
	information = DIA_Harad_AboutErzklingen_Info;
	permanent = FALSE;
	description = "Расскажи мне о мечах из магической руды!";
};


func int DIA_Harad_AboutErzklingen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_ImmerNoch))
	{
		return TRUE;
	};
};

func void DIA_Harad_AboutErzklingen_Info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_06");	//Расскажи мне о мечах из магической руды!
	AI_Output(self,other,"DIA_Harad_Waffen_12_02");	//Создание магического меча - очень сложный и дорогой процесс, но в результате получается очень удобный и практически не тупящийся меч.
	AI_Output(self,other,"DIA_Harad_Waffen_12_03");	//Это очень хороший меч, но все его достоинства раскрываются только в руках паладина.
	AI_Output(self,other,"DIA_Harad_Waffen_12_04");	//Меч паладина освящается самим Инносом. В результате он становится зачарованным оружием, наносящим огромный урон врагу!
};


instance DIA_Harad_Erzklingen(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_Erzklingen_Condition;
	information = DIA_Harad_Erzklingen_Info;
	permanent = TRUE;
	description = "Я хочу купить меч из магической руды.";
};


func int DIA_Harad_Erzklingen_Condition()
{
	if((OreBladeBought == FALSE) && Npc_KnowsInfo(other,DIA_Harad_AboutErzklingen))
	{
		return TRUE;
	};
};


var int OreBladeBought;

func void DIA_Harad_Erzklingen_Info()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_15_00");	//Я хочу купить меч из магической руды.
	if(hero.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_01");	//Я продаю магические мечи только паладинам. И только по одному в одни руки.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_02");	//Вы, паладины, можете считать себя счастливчиками, что вам дозволено владеть такими превосходными мечами.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_03");	//Согласно декрету лорда Хагена, я могу продать тебе только одно магическое оружие.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_04");	//Так, что я могу предложить тебе?
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen,Dialog_Back,DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen,"Двуручный меч (2000 золота)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen,"Одноручный меч (2000 золота)",DIA_Harad_Erzklingen_1h);
	};
};

func void DIA_Harad_Erzklingen_Back()
{
	Info_ClearChoices(DIA_Harad_Erzklingen);
};

func void B_Harad_NotEnoughGold()
{
	AI_Output(self,other,"B_Harad_NotEnoughGold_12_00");	//У тебя недостаточно золота.
};

func void B_Harad_HaveFunWithYourSword()
{
	AI_Output(self,other,"B_Harad_HaveGunWithYourSword_12_00");	//Береги свое новое оружие. Оно стоит целое состояние.
	OreBladeBought = TRUE;
	Info_ClearChoices(DIA_Harad_Erzklingen);
};

func void DIA_Harad_Erzklingen_2h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_2h_15_00");	//Я возьму двуручный меч!
	if(Npc_HasItems(other,ItMi_Gold) >= Value_Blessed_2H_1)
	{
		B_GiveInvItems(other,self,ItMi_Gold,Value_Blessed_2H_1);
		CreateInvItems(self,ItMw_2H_Blessed_01,1);
		B_GiveInvItems(self,other,ItMw_2H_Blessed_01,1);
		B_Harad_HaveFunWithYourSword();
	}
	else
	{
		B_Harad_NotEnoughGold();
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen,Dialog_Back,DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen,"Двуручный меч (2000 золота)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen,"Одноручный меч (2000 золота)",DIA_Harad_Erzklingen_1h);
	};
};

func void DIA_Harad_Erzklingen_1h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_1h_15_00");	//Я возьму одноручный меч!
	if(Npc_HasItems(other,ItMi_Gold) >= Value_Blessed_1H_1)
	{
		B_GiveInvItems(other,self,ItMi_Gold,Value_Blessed_1H_1);
		CreateInvItems(self,ItMw_1H_Blessed_01,1);
		B_GiveInvItems(self,other,ItMw_1H_Blessed_01,1);
		B_Harad_HaveFunWithYourSword();
	}
	else
	{
		B_Harad_NotEnoughGold();
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen,Dialog_Back,DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen,"Двуручный меч (2000 золота)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen,"Одноручный меч (2000 золота)",DIA_Harad_Erzklingen_1h);
	};
};


instance DIA_Harad_RepairNecklace(C_Info)
{
	npc = VLK_412_Harad;
	nr = 8;
	condition = DIA_Harad_RepairNecklace_Condition;
	information = DIA_Harad_RepairNecklace_Info;
	permanent = FALSE;
	description = "Ты можешь чинить драгоценности?";
};


func int DIA_Harad_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Harad_RepairNecklace_Info()
{
	AI_Output(other,self,"DIA_Harad_RepairNecklace_15_00");	//Ты можешь чинить драгоценности?
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_01");	//Я оружейник, а не ювелир. Пожалуй, здесь в городе ты не найдешь никого, кто мог бы помочь тебе.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_02");	//Сейчас мало у кого водятся деньги, и давно уже никому не удавалось разбогатеть здесь.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_03");	//Большинство радо хотя бы тому, что им хватает на хлеб.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Harad_Goldsmith(C_Info)
{
	npc = VLK_412_Harad;
	nr = 8;
	condition = DIA_Harad_Goldsmith_Condition;
	information = DIA_Harad_Goldsmith_Info;
	permanent = FALSE;
	description = "Где мне найти ювелира?";
};


func int DIA_Harad_Goldsmith_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_RepairNecklace))
	{
		return TRUE;
	};
};

func void DIA_Harad_Goldsmith_Info()
{
	AI_Output(other,self,"DIA_Harad_Goldsmith_15_00");	//Где мне найти ювелира?
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_01");	//Я слышал, что у наемников на ферме Онара есть хороший кузнец.
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_02");	//Может, тебе стоит поспрашивать там.
};


instance DIA_Harad_PICKPOCKET(C_Info)
{
	npc = VLK_412_Harad;
	nr = 900;
	condition = DIA_Harad_PICKPOCKET_Condition;
	information = DIA_Harad_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Harad_PICKPOCKET_Condition()
{
	return C_Beklauen(14,35);
};

func void DIA_Harad_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
	Info_AddChoice(DIA_Harad_PICKPOCKET,Dialog_Back,DIA_Harad_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Harad_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Harad_PICKPOCKET_DoIt);
};

func void DIA_Harad_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
};

func void DIA_Harad_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
};

