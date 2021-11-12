
instance DIA_Cord_EXIT(C_Info)
{
	npc = SLD_805_Cord;
	nr = 999;
	condition = DIA_Cord_EXIT_Condition;
	information = DIA_Cord_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cord_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cord_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cord_MeetingIsRunning(C_Info)
{
	npc = SLD_805_Cord;
	nr = 1;
	condition = DIA_Addon_Cord_MeetingIsRunning_Condition;
	information = DIA_Addon_Cord_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Cord_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		return TRUE;
	};
};


var int DIA_Addon_Cord_MeetingIsRunning_OneTime;

func void DIA_Addon_Cord_MeetingIsRunning_Info()
{
	if(DIA_Addon_Cord_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_00");	//Добро пожаловать в Кольцо Воды, брат.
		DIA_Addon_Cord_MeetingIsRunning_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_01");	//Ты должен поговорить с Ватрасом...
	AI_StopProcessInfos(self);
};


instance DIA_Cord_Hallo(C_Info)
{
	npc = SLD_805_Cord;
	nr = 2;
	condition = DIA_Cord_Hallo_Condition;
	information = DIA_Cord_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cord_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (other.guild == GIL_NONE) && (MIS_Addon_Lares_ComeToRangerMeeting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Cord_Hallo_Info()
{
	AI_Output(self,other,"DIA_Cord_Hallo_14_00");	//Если у тебя проблемы с волками или полевыми хищниками, поговори с одним из наемников помоложе.
	AI_Output(self,other,"DIA_Cord_Hallo_14_01");	//А ко мне ты можешь обратиться, когда появятся паладины.
	AI_Output(other,self,"DIA_Cord_Hallo_15_02");	//Что?
	AI_Output(self,other,"DIA_Cord_Hallo_14_03");	//Когда вы, крестьяне, обращаетесь ко мне, вы всегда просите убить ни в чем не повинных зверей.
	AI_Output(other,self,"DIA_Cord_Hallo_15_04");	//Я не крестьянин.
	AI_Output(self,other,"DIA_Cord_Hallo_14_05");	//Ох? И чего же ты хочешь?
};


func void B_Cord_BeBetter()
{
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_14");	//Пока ты едва умеешь обращаться с оружием, и тебе здесь не место!
};

func void DIA_Cord_Approve()
{
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_10");	//Ну, по крайней мере, ты не зеленый новичок. Хорошо. Я проголосую за тебя.
};

var int Cord_SchonmalGefragt;
var int DIA_Cord_WannaJoin_Once;

instance DIA_Cord_WannaJoin(C_Info)
{
	npc = SLD_805_Cord;
	nr = 5;
	condition = DIA_Cord_WannaJoin_Condition;
	information = DIA_Cord_WannaJoin_Info;
	permanent = TRUE;
	description = "Я хочу стать наемником!";
};


func int DIA_Cord_WannaJoin_Condition()
{
	if((Cord_Voted == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Cord_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Cord_WannaJoin_15_00");	//Я хочу стать наемником!
	if(DIA_Cord_Teacher_permanent == FALSE)
	{
		if(Cord_SchonmalGefragt == FALSE)
		{
			if(MIS_Addon_Lares_ComeToRangerMeeting != LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Cord_WannaJoin_14_01");	//Ты больше похож на того, кто был рожден работать на поле, парень.
			};
			AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//Ты умеешь обращаться с оружием?
			Cord_SchonmalGefragt = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Cord_WannaJoin_14_03");	//Ты повысил свои навыки?
		};
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_04");	//Итак, как насчет одноручного оружия?
		if(TeacherCanTrainTalent(NPC_TALENT_1H,TeachCondition_Cord))
		{
			AI_Output(other,self,"DIA_Cord_WannaJoin_15_05");	//Я не так уж плох в этом.
		}
		else
		{
			AI_Output(other,self,"DIA_Cord_WannaJoin_15_06");	//Что-о-ожж...
		};
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_07");	//А что насчет двуручного оружия?
		if(TeacherCanTrainTalent(NPC_TALENT_2H,TeachCondition_Cord))
		{
			AI_Output(other,self,"DIA_Cord_WannaJoin_15_08");	//Я умею обращаться с ним.
		}
		else
		{
			AI_Output(other,self,"DIA_Cord_WannaJoin_15_09");	//И скоро я стану еще лучше!
		};
	};
	if(TeacherCanTrainTalent(NPC_TALENT_1H,TeachCondition_Cord) || TeacherCanTrainTalent(NPC_TALENT_2H,TeachCondition_Cord) || (DIA_Cord_Teacher_permanent == TRUE))
	{
		DIA_Cord_Approve();
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_11");	//Если тебе еще что-то нужно знать, ты можешь спросить у меня.
		Cord_Voted = TRUE;
		B_GivePlayerXP(XP_Cord_Voted);
		if(Torlof_GenugStimmen == FALSE)
		{
			Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
		};
		B_LogEntry(TOPIC_SLDRespekt,"Голос Корда у меня в кармане.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_12");	//Другими словами: ты зеленый новичок!
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_13");	//Мы, наемники, должны быть уверены, что можем всецело положиться на наших товарищей. От этого зависит наша жизнь.
		SCKnowsSLDVotes = TRUE;
		B_Cord_BeBetter();
		if(DIA_Cord_WannaJoin_Once == FALSE)
		{
			Log_CreateTopic(TOPIC_CordProve,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CordProve,LOG_Running);
			B_LogEntry(TOPIC_CordProve,"Корд проголосует за меня, когда я научусь сражаться лучше.");
			DIA_Cord_WannaJoin_Once = TRUE;
		};
	};
};


instance DIA_Addon_Cord_YouAreRanger(C_Info)
{
	npc = SLD_805_Cord;
	nr = 2;
	condition = DIA_Addon_Cord_YouAreRanger_Condition;
	information = DIA_Addon_Cord_YouAreRanger_Info;
	description = "Говорят, ты принадлежишь к Кольцу Воды?";
};


func int DIA_Addon_Cord_YouAreRanger_Condition()
{
	if(RangerHelp_gildeSLD == TRUE)
	{
		return TRUE;
	}
	else if(SC_KnowsCordAsRangerFromLee == TRUE)
	{
		return TRUE;
	}
	else if(MIS_Addon_Lares_ComeToRangerMeeting == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_00");	//Говорят, ты принадлежишь к Кольцу Воды?
	if(MIS_Addon_Lares_ComeToRangerMeeting != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_01");	//Что за крыса не смогла удержать на замке свой болтливый рот?
		if(SC_KnowsCordAsRangerFromLee == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_02");	//Мне сказал Ли.
		};
		if(RangerHelp_gildeSLD == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_03");	//Ларес сказал, что ты поможешь мне, если я скажу, что он взял меня под свое крыло.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_04");	//(вздыхает) Похоже, что теперь мне придется возиться с тобой, так?
	AI_Output(self,other,"DIA_Addon_Cord_Add_14_01");	//Ну хорошо, что тебе нужно?
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_06");	//И хорошо подумай над тем, что ты мне скажешь. Потому что, если мне не понравится то, что я услышу, я с тебя кожу сдеру.
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"На самом деле мне ничего не нужно. Я и сам справлюсь.",DIA_Addon_Cord_YouAreRanger_nix);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Мне нужна твоя броня.",DIA_Addon_Cord_YouAreRanger_ruestung);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Мне нужно твое оружие!",DIA_Addon_Cord_YouAreRanger_waffe);
	if((Cord_Approved == FALSE) && (Cord_RangerHelp_Fight == FALSE))
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Научи меня сражаться.",DIA_Addon_Cord_YouAreRanger_kampf);
	};
	if(hero.guild == GIL_NONE)
	{
		if((SCKnowsSLDVotes == TRUE) && (Cord_Voted == FALSE))
		{
			Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Ты проголосуешь за меня?",DIA_Addon_Cord_YouAreRanger_vote);
		};
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Уходи отсюда. Я хочу занять твое место на этой ферме.",DIA_Addon_Cord_YouAreRanger_weg);
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Ты бы мог помочь мне стать наемником.",DIA_Addon_Cord_YouAreRanger_SLDAufnahme);
	};
	if(MIS_Addon_Lares_ComeToRangerMeeting != LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Заплати мне за молчание.",DIA_Addon_Cord_YouAreRanger_Gold);
	};
};


var int Cord_SC_Dreist;

func void B_DIA_Addon_Cord_YouAreRanger_WARN()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_WARN_14_00");	//(угрожающе) И горе тебе, если мне станет известно, что ты распускаешь язык. Предупреждаю первый и единственный раз, понятно?
};

func void B_DIA_Addon_Cord_YouAreRanger_FRESSE()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_FRESSE_14_00");	//(в ярости) Ну хватит! На этот раз ты зашел слишком далеко. Я выбью из тебя дурь.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	if(Cord_Voted_Trick == TRUE)
	{
		Cord_Voted = FALSE;
	};
	if(Cord_RangerHelp_Fight_Trick == TRUE)
	{
		Cord_RangerHelp_Fight = FALSE;
	};
	Cord_RangerHelp_GetSLD = FALSE;
	TOPIC_End_RangerHelpSLD = TRUE;
	B_CheckLog();
};

func void DIA_Addon_Cord_YouAreRanger_ruestung()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_ruestung_15_00");	//Мне нужна твоя броня.
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_ruestung_14_01");	//Повтори это еще раз - и тебе придется собирать свои зубы с земли.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_waffe()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Add_15_00");	//Мне нужно твое оружие!
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_03");	//(угрожающе) Неужели?
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_02");	//(мрачно) Тогда попробуй его забрать!
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_weg()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_weg_15_00");	//Уходи отсюда. Я хочу занять твое место на этой ферме.
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_weg_14_01");	//Не шути со мной, малыш, иначе я переломаю тебе все кости.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

var int DIA_Addon_Cord_YouAreRanger_SCGotOffer;

func void DIA_Cord_And()
{
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_01");	//И?
};

func void DIA_Cord_WhatElse()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_kampf_14_01");	//Хорошо. Что еще?
};

func void DIA_Addon_Cord_YouAreRanger_vote()
{
	AI_Output(other,self,"DIA_Sentenza_Vote_15_00");	//Ты проголосуешь за меня?
	if(MIS_Addon_Lares_ComeToRangerMeeting == LOG_SUCCESS)
	{
		DIA_Cord_Approve();
		DIA_Cord_And();
	}
	else
	{
		DIA_Cord_WhatElse();
	};
	Cord_Voted = TRUE;
	Cord_Voted_Trick = TRUE;
	if(Torlof_GenugStimmen == FALSE)
	{
		Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
	};
	B_LogEntry(TOPIC_SLDRespekt,"Голос Корда у меня в кармане.");
	if(DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Это все.",DIA_Addon_Cord_YouAreRanger_reicht);
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_kampf()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_kampf_15_00");	//Научи меня сражаться.
	DIA_Cord_WhatElse();
	Cord_RangerHelp_Fight = TRUE;
	Cord_RangerHelp_Fight_Trick = TRUE;
	if(DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Это все.",DIA_Addon_Cord_YouAreRanger_reicht);
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_SLDAufnahme()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_15_00");	//Ты бы мог помочь мне стать наемником.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_14_01");	//(смеется) Все понятно. Ладно, я попытаюсь. Что еще?
	Cord_RangerHelp_GetSLD = TRUE;
	if(DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Это все.",DIA_Addon_Cord_YouAreRanger_reicht);
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_Gold()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Gold_15_00");	//Заплати мне за молчание.
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_Gold_14_01");	//Вот как? Тебе не повезло. Я не тот, кого можно шантажировать, приятель.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_nix()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_nix_15_00");	//На самом деле мне ничего не нужно. Я и сам справлюсь.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_nix_14_01");	//Как скажешь.
	B_DIA_Addon_Cord_YouAreRanger_WARN();
	if(Cord_Voted_Trick == TRUE)
	{
		Cord_Voted = FALSE;
	};
	if(Cord_RangerHelp_Fight_Trick == TRUE)
	{
		Cord_RangerHelp_Fight = FALSE;
	};
	Cord_RangerHelp_GetSLD = FALSE;
	TOPIC_End_RangerHelpSLD = TRUE;
	B_CheckLog();
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
};

func void DIA_Addon_Cord_YouAreRanger_reicht()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_reicht_15_00");	//Это все.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_reicht_14_01");	//Ну, это не сложно.
	B_DIA_Addon_Cord_YouAreRanger_WARN();
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
};


var int DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm;

func void B_Cord_RangerHelpObsolete()
{
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_00");	//Я уже позаботился об этом.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_01");	//В таком случае, я не смогу тебе помочь.
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_02");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_03");	//Я имею в виду, что не смогу тебе помочь.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_04");	//Или ты хочешь, чтобы я лично убедил бы каждого наемника в том, что ты можешь к нам присоединиться?
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_05");	//Этим тебе придется заняться самому.
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
	TOPIC_End_RangerHelpSLD = TRUE;
	B_CheckLog();
};

func void B_Cord_ComeLaterWhenDone()
{
	AI_Output(self,other,"DIA_Addon_Cord_ComeLaterWhenDone_14_00");	//Так что вперед. Сделаешь это, и возвращайся ко мне.
	AI_StopProcessInfos(self);
};

func void B_Cord_IDoItForYou()
{
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_00");	//Понятно. Что ж, это просто. Возвращайся завтра, и все будет сделано.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_01");	//Но за это тебе придется кое-что для меня сделать.
	AI_Output(other,self,"DIA_Addon_Cord_IDoItForYou_15_02");	//И что же именно?
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_03");	//Недалеко отсюда, в холмах на юго-востоке, расположен небольшой бандитский лагерь.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_04");	//Если отсюда ты пойдешь на юго-восток, ты вскорости увидишь их башню.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_05");	//Один из моих людей, Патрик, несколько дней назад отправился туда, чтобы заключить сделку с этими подонками.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_06");	//Я говорил ему, что это плохая мысль, но этот идиот меня не послушал.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_07");	//Думаю, они расправились с ним. Но не уверен.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_08");	//Ты должен выяснить, что с ним случилось.
	B_LogEntry(TOPIC_Addon_RangerHelpSLD,"Корд готов решить проблему с испытанием Торлофа. Пропал приятель Корда Патрик. Корд хочет, чтобы я отправился в лагерь бандитов в горах на юго-востоке и выяснил, нет ли там Патрика.");
	Info_ClearChoices(DIA_Addon_Cord_RangerHelp2GetSLD);
	Info_AddChoice(DIA_Addon_Cord_RangerHelp2GetSLD,"Забудь об этом. Это гораздо сложнее, чем задание Торлофа.",B_Cord_IDoItForYou_mist);
	Info_AddChoice(DIA_Addon_Cord_RangerHelp2GetSLD,"А почему ты думаешь, что со мной они не расправятся так же, как с Патриком?",B_Cord_IDoItForYou_Dexter);
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
};

func void B_Cord_IDoItForYou_mist()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_mist_15_00");	//Забудь об этом. Это гораздо сложнее, чем задание Торлофа.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_01");	//Да нет. Такой маленький и безобидный человек, как ты, не вызовет у них интереса.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_02");	//А вот мне туда идти нельзя. Эти парни хватаются за оружие при одном виде наемника.
};

func void B_Cord_IDoItForYou_Dexter()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_Dexter_15_00");	//А почему ты думаешь, что со мной они не расправятся так же, как с Патриком?
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_01");	//Дело в том, что я знаю имя предводителя бандитов. Его зовут Декстер. Просто скажи им, что ты знаешь этого парня.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_02");	//Это должно лишить их желания свернуть тебе шею.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_03");	//Конечно, это все довольно опасно.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_04");	//Но ты справишься.
	Info_ClearChoices(DIA_Addon_Cord_RangerHelp2GetSLD);
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntries(TOPIC_Addon_MissingPeople,"Наемник Корд ищет своего приятеля Патрика.");
	B_LogNextEntry(TOPIC_Addon_RangerHelpSLD,"Главаря бандитов зовут Декстер.");
	MIS_Addon_Cord_Look4Patrick = LOG_Running;
	Ranger_SCKnowsDexter = TRUE;
};

instance DIA_Addon_Cord_RangerHelp2GetSLD(C_Info)
{
	npc = SLD_805_Cord;
	nr = 2;
	condition = DIA_Addon_Cord_RangerHelp2GetSLD_Condition;
	information = DIA_Addon_Cord_RangerHelp2GetSLD_Info;
	permanent = TRUE;
	description = "Помоги мне стать наемником.";
};


func int DIA_Addon_Cord_RangerHelp2GetSLD_Condition()
{
	if((Cord_RangerHelp_GetSLD == TRUE) && (hero.guild == GIL_NONE) && (DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cord_RangerHelp2GetSLD_Info()
{
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_00");	//Помоги мне стать наемником.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_01");	//Надо подумать... Хм-м. Если ты хочешь чего-то здесь добиться, тебе нужно поговорить с Торлофом.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_02");	//Ты уже встречался с ним?
	if(Torlof_Go == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_03");	//Еще нет.
		B_Cord_ComeLaterWhenDone();
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_04");	//Да. Он рассказал мне об испытании и прочем...
		AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_05");	//Ага. И какое же задание тебе дали?
		if((Torlof_ProbeBestanden == TRUE) || ((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && Npc_IsDead(Rumbold) && Npc_IsDead(Rick)) || ((MIS_Torlof_HolPachtVonSekob == LOG_Running) && ((Sekob.aivar[AIV_DefeatedByPlayer] == TRUE) || Npc_IsDead(Sekob))))
		{
			B_Cord_RangerHelpObsolete();
		}
		else if(Torlof_Probe == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_06");	//Я пока не получил задание.
			B_Cord_ComeLaterWhenDone();
		}
		else if(Torlof_Probe == Probe_Sekob)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_07");	//Я должен собрать ренту на ферме Секоба.
			B_Cord_IDoItForYou();
		}
		else if(Torlof_Probe == Probe_Bengar)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_08");	//Я должен избавить Бенгара от солдат ополчения.
			B_Cord_IDoItForYou();
		}
		else
		{
			B_Cord_RangerHelpObsolete();
		};
	};
};


instance DIA_Addon_Cord_TalkedToDexter(C_Info)
{
	npc = SLD_805_Cord;
	nr = 5;
	condition = DIA_Addon_Cord_TalkedToDexter_Condition;
	information = DIA_Addon_Cord_TalkedToDexter_Info;
	description = "Я встретился с Декстером.";
};


func int DIA_Addon_Cord_TalkedToDexter_Condition()
{
	if(MIS_Addon_Cord_Look4Patrick == LOG_Running)
	{
		if(Npc_KnowsInfo(other,DIA_Dexter_Hallo))
		{
			return TRUE;
		};
		if(Npc_KnowsInfo(other,DIA_Dexter_Kill))
		{
			return TRUE;
		};
		if(Npc_IsDead(Dexter))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Cord_TalkedToDexter_Info()
{
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_00");	//Я встретился с Декстером.
	DIA_Cord_And();
	if(Npc_IsDead(Dexter))
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_02");	//Он мертв.
	};
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_03");	//Я не нашел следов твоего друга Патрика.
	if(Dexter_KnowsPatrick == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_04");	//Декстер его вспомнил, но сказал, что последний раз его видел очень давно.
		AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_05");	//Ты уверен, что Декстер не лгал?
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_06");	//Не уверен. Но это все, что я могу тебе сказать.
	};
	if((MissingPeopleReturnedHome == FALSE) || (Patrick_DiedInADW == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_07");	//Не понимаю... Не мог же Патрик просто так взять и исчезнуть.
	};
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_08");	//Что ж, ты выполнил условия сделки...
	MIS_Addon_Cord_Look4Patrick = LOG_SUCCESS;
	TOPIC_End_RangerHelpSLD = TRUE;
	if((other.guild == GIL_NONE) && (Torlof_ProbeBestanden == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_09");	//Что насчет задания Торлофа?
		AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_10");	//Не беспокойся, я обо всем позаботился. Твое задание выполнено, и ты прошел испытание. Можешь поговорить с Торлофом.
	};
	Cord_RangerHelp_TorlofsProbe = TRUE;
	if(Torlof_Probe == Probe_Sekob)
	{
		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
	}
	else if(Torlof_Probe == Probe_Bengar)
	{
		if(Kapitel < 3)
		{
			if(!Npc_IsDead(Rick))
			{
				Npc_ExchangeRoutine(Rick,"Flucht3");
				Rick.aivar[AIV_DropDeadAndKill] = FALSE;
			};
			if(!Npc_IsDead(Rumbold))
			{
				Npc_ExchangeRoutine(Rumbold,"Flucht3");
				Rumbold.aivar[AIV_DropDeadAndKill] = FALSE;
			};
		};
		MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	};
	B_GivePlayerXP(XP_Addon_Cord_Look4Patrick);
};


instance DIA_Cord_ReturnPatrick(C_Info)
{
	npc = SLD_805_Cord;
	nr = 8;
	condition = DIA_Cord_ReturnPatrick_Condition;
	information = DIA_Cord_ReturnPatrick_Info;
	permanent = FALSE;
	description = "Патрик вернулся.";
};


func int DIA_Cord_ReturnPatrick_Condition()
{
	if(MissingPeopleReturnedHome == TRUE)
	{
		if(!Npc_IsDead(Patrick_NW))
		{
			if(Npc_GetDistToWP(Patrick_NW,"NW_BIGFARM_PATRICK") <= 1000)
			{
				return TRUE;
			};
		};
	};
};

func void DIA_Cord_ReturnPatrick_Info()
{
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_00");	//Патрик вернулся.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_01");	//Отлично! Я уже почти потерял надежду. Ты...
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_02");	//У меня есть одна просьба.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_03");	//Да?
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_04");	//Давай обойдемся без благодарностей.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_05");	//Но я не собирался тебя благодарить.
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_06");	//Что?..
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_07");	//(усмехается) Я собирался сказать тебе, что ты нахальный и скользкий малый.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_09");	//(усмехается) Продолжай в том же духе!
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Cord_ExplainSkills(C_Info)
{
	npc = SLD_805_Cord;
	nr = 1;
	condition = DIA_Cord_ExplainSkills_Condition;
	information = DIA_Cord_ExplainSkills_Info;
	permanent = FALSE;
	description = "Что я должен изучить сначала: обращение с одноручным или двуручным оружием?";
};


func int DIA_Cord_ExplainSkills_Condition()
{
	if((Cord_Teacher == TRUE) && (RealTalentValue(NPC_TALENT_1H) < 100) && (RealTalentValue(NPC_TALENT_2H) < 100))
	{
		return TRUE;
	};
};

func void DIA_Cord_ExplainSkills_Info()
{
	AI_Output(other,self,"DIA_Cord_ExplainSkills_15_00");	//Что я должен изучить сначала: обращение с одноручным или двуручным оружием?
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_01");	//Эти два вида оружия весьма похожи друг на друга.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_02");	//Когда ты достигнешь следующего уровня в одном из них, ты автоматически повышаешь и уровень владения другим.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_03");	//Если, например, ты хорошо владеешь одноручным мечом, но все еще новичок в том, что касается двуручного...
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_04");	//... навык владения двуручным оружием также повысится, когда ты будешь тренировать одноручное.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_05");	//Если ты тренируешься только с одним типом оружия, ты найдешь процесс обучения более изматывающим.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_06");	//Если же ты всегда тренируешь оба вида оружия, ты достигнешь того же результата, затратив меньше усилий.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_07");	//И еще, результат все равно будет одним и тем же - так что тебе выбирать.
};


instance DIA_Cord_ExplainWeapons(C_Info)
{
	npc = SLD_805_Cord;
	nr = 2;
	condition = DIA_Cord_ExplainWeapons_Condition;
	information = DIA_Cord_ExplainWeapons_Info;
	permanent = FALSE;
	description = "Ну, а каковы преимущества одноручного и двуручного оружия?";
};


func int DIA_Cord_ExplainWeapons_Condition()
{
	if(Cord_Teacher == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cord_ExplainWeapons_Info()
{
	AI_Output(other,self,"DIA_Cord_ExplainWeapons_15_00");	//Ну, а каковы преимущества одноручного и двуручного оружия?
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_01");	//Хороший вопрос. Я вижу, что ты размышлял над этим вопросом.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_02");	//Одноручное оружие быстрее, но оно наносит меньший урон врагам.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_03");	//Двуручное оружие наносит больший урон, но им не получится размахивать так же быстро, как одноручным.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_04");	//Также, чтобы владеть двуручным мечом, тебе понадобится больше сил. Это означает необходимость дополнительных тренировок.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_05");	//Чтобы стать настоящим профессионалом, придется затратить много усилий.
};


var int DIA_Cord_Teacher_permanent;
var int DIA_Cord_TeachState_1H;
var int DIA_Cord_TeachState_2H;
var int Cord_Merke_1h;
var int Cord_Merke_2h;

func void B_Cord_Zeitverschwendung()
{
	AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Я не хочу тратить свое время на новичков.
};

func void DIA_Cord_CantTeach1H()
{
	AI_Output(self,other,"DIA_Cord_Teach_14_05");	//Если ты захочешь потренироваться с одноручным оружием, тебе придется найти другого учителя.
};

func void B_Cord_Teach()
{
	if(Cord_Teacher == FALSE)
	{
		Log_CreateTopic(TOPIC_SoldierTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_SoldierTeacher,"Корд может обучить меня владению одноручным и двуручным оружием.");
		Cord_Teacher = TRUE;
	};
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	if(TeacherCanTrainTalent(NPC_TALENT_2H,TeachCondition_Cord) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		if(VisibleTalentValue(NPC_TALENT_2H) < TeachLimit_2H_Cord)
		{
			Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
			Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
			DIA_Cord_TeachState_2H = 1;
		}
		else
		{
			if(DIA_Cord_TeachState_2H == 1)
			{
				PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_2H_Cord)),-1,53,FONT_Screen,2);
			};
			DIA_Cord_TeachState_2H = 2;
		};
	};
	if(TeacherCanTrainTalent(NPC_TALENT_1H,TeachCondition_Cord) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		if(VisibleTalentValue(NPC_TALENT_1H) < TeachLimit_1H_Cord)
		{
			Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
			Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);
			DIA_Cord_TeachState_1H = 1;
		}
		else
		{
			if(DIA_Cord_TeachState_1H == 1)
			{
				PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_1H_Cord)),-1,53,FONT_Screen,2);
				DIA_Cord_CantTeach1H();
			};
			DIA_Cord_TeachState_1H = 2;
		};
	};
	if((RealTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Cord) && (RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Cord))
	{
		DIA_Cord_Teacher_permanent = TRUE;
	};
	if((DIA_Cord_TeachState_1H == 2) && (DIA_Cord_TeachState_2H == 2))
	{
		PrintScreen(PRINT_NoLearnTotalMAXReached,-1,53,FONT_Screen,2);
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		AI_StopProcessInfos(self);
	};
};

instance DIA_Cord_Teach(C_Info)
{
	npc = SLD_805_Cord;
	nr = 3;
	condition = DIA_Cord_Teach_Condition;
	information = DIA_Cord_Teach_Info;
	permanent = TRUE;
	description = "Научи меня сражаться!";
};


func int DIA_Cord_Teach_Condition()
{
	if(DIA_Cord_Teacher_permanent == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Cord_Teach_Info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Научи меня сражаться!
	if((VisibleTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Cord) && (VisibleTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Cord))
	{
		if((RealTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Cord) && (RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Cord))
		{
			DIA_Cord_Teacher_permanent = TRUE;
		};
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		AI_StopProcessInfos(self);
	}
	else if(TeacherCanTrainTalent(NPC_TALENT_1H,TeachCondition_Cord) || TeacherCanTrainTalent(NPC_TALENT_2H,TeachCondition_Cord) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		if(TeacherCanTrainTalent(NPC_TALENT_1H,TeachCondition_Cord) && TeacherCanTrainTalent(NPC_TALENT_2H,TeachCondition_Cord))
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_01");	//Я могу обучить тебя владению любым оружием - с чего начнем?
			Cord_Approved = TRUE;
		}
		else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
		{
			Cord_Approved = TRUE;
		}
		else if(TeacherCanTrainTalent(NPC_TALENT_1H,TeachCondition_Cord))
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_02");	//Я могу обучить тебя владению одноручным мечом. Но ты пока недостаточно хорош, чтобы использовать двуручный меч.
			B_Cord_Zeitverschwendung();
			Cord_Approved = TRUE;
		}
		else if(TeacherCanTrainTalent(NPC_TALENT_2H,TeachCondition_Cord))
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_04");	//Что касается одноручного оружия, то здесь ты зеленый новичок! Хотя в обращении с двуручным ты не так уж и плох.
			DIA_Cord_CantTeach1H();
			Cord_Approved = TRUE;
		}
		else
		{
			B_Cord_Zeitverschwendung();
			B_Cord_BeBetter();
		};
		B_CheckLog();
		if(Cord_Approved == TRUE)
		{
			Cord_Merke_1h = other.HitChance[NPC_TALENT_1H];
			Cord_Merke_2h = other.HitChance[NPC_TALENT_2H];
			B_Cord_Teach();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_Teach_14_06");	//Я тренирую только наемников и достойных кандидатов!
	};
};

func void DIA_Cord_Teach_Back()
{
	if((Cord_Merke_1h < other.HitChance[NPC_TALENT_1H]) || (Cord_Merke_2h < other.HitChance[NPC_TALENT_2H]))
	{
		AI_Output(self,other,"DIA_Cord_Teach_BACK_14_00");	//Ты стал значительно лучше - так держать!
	};
	Info_ClearChoices(DIA_Cord_Teach);
};

func void DIA_Cord_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,TeachLimit_2H_Cord))
	{
		B_Cord_Teach();
	};
};

func void DIA_Cord_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,TeachLimit_2H_Cord))
	{
		B_Cord_Teach();
	};
};

func void DIA_Cord_Teach_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,TeachLimit_1H_Cord))
	{
		B_Cord_Teach();
	};
};

func void DIA_Cord_Teach_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,TeachLimit_1H_Cord))
	{
		B_Cord_Teach();
	};
};

instance DIA_Cord_PICKPOCKET(C_Info)
{
	npc = SLD_805_Cord;
	nr = 900;
	condition = DIA_Cord_PICKPOCKET_Condition;
	information = DIA_Cord_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Cord_PICKPOCKET_Condition()
{
	return C_Beklauen(65,75);
};

func void DIA_Cord_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
	Info_AddChoice(DIA_Cord_PICKPOCKET,Dialog_Back,DIA_Cord_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Cord_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Cord_PICKPOCKET_DoIt);
};

func void DIA_Cord_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
};

func void DIA_Cord_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
};

