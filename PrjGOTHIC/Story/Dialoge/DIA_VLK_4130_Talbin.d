
instance DIA_Talbin_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_EXIT_Condition;
	information = DIA_Talbin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Talbin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Talbin_Runs;

instance DIA_Talbin_HALLO(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 5;
	condition = DIA_Talbin_HALLO_Condition;
	information = DIA_Talbin_HALLO_Info;
	important = TRUE;
};


func int DIA_Talbin_HALLO_Condition()
{
	if(Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Talbin_HALLO_Info()
{
	AI_Output(self,other,"DIA_Talbin_HALLO_07_00");	//Стой! Ни шагу дальше!
	AI_Output(other,self,"DIA_Talbin_HALLO_15_01");	//Ох! Нет проблем!
	AI_Output(self,other,"DIA_Talbin_HALLO_07_02");	//Эх! Еще один маленький ягненок, ха? Сначала я принял тебя за одного из этих ублюдков, что постоянно шляются здесь.
	AI_Output(self,other,"DIA_Talbin_HALLO_07_03");	//Но теперь я вижу, что ты не один из них. Ты выглядишь слишком беззащитным!
};


instance DIA_Talbin_WASMACHTIHR(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 6;
	condition = DIA_Talbin_WASMACHTIHR_Condition;
	information = DIA_Talbin_WASMACHTIHR_Info;
	description = "А ты похож на охотника, который не знает, куда девать свободное время.";
};


func int DIA_Talbin_WASMACHTIHR_Condition()
{
	if(Talbin_Runs == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Talbin_WASMACHTIHR_Info()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_15_00");	//А ты похож на охотника, который не знает, куда девать свободное время.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_01");	//Ха-ха! Да - ты угадал. Но что мне еще делать - я не могу вернуться через Проход!
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_02");	//Поэтому я остаюсь здесь и занимаюсь тем, что умею лучше всего.
	if(Npc_IsDead(Engrom) == FALSE)
	{
		AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_03");	//Мне жаль, впрочем, моего приятеля Энгрома.
	};
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_04");	//Садись ближе к моему костру. Погрейся немного.
	Info_ClearChoices(DIA_Talbin_WASMACHTIHR);
	Info_AddChoice(DIA_Talbin_WASMACHTIHR,Dialog_Back,DIA_Talbin_WASMACHTIHR_back);
	Info_AddChoice(DIA_Talbin_WASMACHTIHR,"Но мне кажется, ты комфортно чувствуешь себя здесь.",DIA_Talbin_WASMACHTIHR_gut);
	Info_AddChoice(DIA_Talbin_WASMACHTIHR,"Ты бывший каторжник из-за Барьера?",DIA_Talbin_WASMACHTIHR_strf);
};

func void DIA_Talbin_WASMACHTIHR_back()
{
	Info_ClearChoices(DIA_Talbin_WASMACHTIHR);
};

func void DIA_Talbin_WASMACHTIHR_strf()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_00");	//Ты бывший каторжник из-за Барьера?
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_01");	//Нет, нет! С чего ты взял? Я просто хотел подзаработать здесь.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_02");	//Кто-то сказал мне, что здесь лучшие охотничьи угодья на острове.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_03");	//Райские угодья, если ты понимаешь, что я имею в виду.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_04");	//Но единственное, что можно заработать здесь после того, как появились эти чертовы орки, - это удар топором, если зайдешь слишком далеко!
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_05");	//И я позволил этим идиотам обмануть меня.
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_06");	//Я знаю этих шутников!
};

func void DIA_Talbin_WASMACHTIHR_gut()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_gut_15_00");	//Но мне кажется, ты комфортно чувствуешь себя здесь.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_01");	//О да! Я думаю, мне не на что жаловаться. Несмотря на этих чертовых орков, район у реки наименее опасен.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_02");	//Похоже, они не осмеливаются приближаться к воде. Ммм. Хотя, возможно, это просто совпадение.
};


instance DIA_Talbin_SORRYFORENGROM(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 7;
	condition = DIA_Talbin_SORRYFORENGROM_Condition;
	information = DIA_Talbin_SORRYFORENGROM_Info;
	description = "Почему тебе жаль Энгрома?";
};


func int DIA_Talbin_SORRYFORENGROM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_WASMACHTIHR) && (Npc_IsDead(Engrom) == FALSE) && (Talbin_FollowsThroughPass == 0) && (Kapitel <= 3) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_SORRYFORENGROM_Info()
{
	AI_Output(other,self,"DIA_Talbin_SORRYFORENGROM_15_00");	//Почему тебе жаль Энгрома?
	AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_01");	//Потому что он просто пошел за мной, не задавая вопросов.
	AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_02");	//И вот мы попали в эту передрягу. Жадность никогда не доводит до добра.
};


instance DIA_Talbin_WASJAGDIHR(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 8;
	condition = DIA_Talbin_WASJAGDIHR_Condition;
	information = DIA_Talbin_WASJAGDIHR_Info;
	description = "А на кого ты охотишься у реки?";
};


func int DIA_Talbin_WASJAGDIHR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_WASMACHTIHR) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_WASJAGDIHR_Info()
{
	AI_Output(other,self,"DIA_Talbin_WASJAGDIHR_15_00");	//А на кого ты охотишься у реки?
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_01");	//Что за вопрос! Просто пройди вдоль реки, и ты поймешь, на кого я охочусь. На луркеров, конечно же!
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_02");	//Этих тварей нелегко завалить, но их мясо очень вкусное.
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_03");	//Иногда также я натыкаюсь на падальщиков. Я не привередливый, и от них нос тоже не ворочу!
};


instance DIA_Talbin_ENGROMANGRY(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 9;
	condition = DIA_Talbin_ENGROMANGRY_Condition;
	information = DIA_Talbin_ENGROMANGRY_Info;
	description = "Мне кажется, твой приятель какой-то напряженный!";
};


func int DIA_Talbin_ENGROMANGRY_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Engrom_WhatAboutLeaving) && Npc_KnowsInfo(other,DIA_Talbin_SORRYFORENGROM) && (Npc_IsDead(Engrom) == FALSE) && (Talbin_FollowsThroughPass == 0) && (Kapitel <= 3) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_ENGROMANGRY_Info()
{
	AI_Output(other,self,"DIA_Talbin_ENGROMANGRY_15_00");	//Мне кажется, твой приятель какой-то напряженный!
	AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_01");	//Брось. Не провоцируй его, или он меня прикончит. Сейчас я ничем не могу помочь ему.
	AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_02");	//Но я что-нибудь придумаю!
};


instance DIA_Talbin_AskTeacher(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 10;
	condition = DIA_Talbin_AskTeacher_Condition;
	information = DIA_Talbin_AskTeacher_Info;
	description = "Ты можешь научить меня охотиться?";
};


func int DIA_Talbin_AskTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_WASJAGDIHR) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_00");	//Ты можешь научить меня охотиться?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_01");	//Понимаю! Это и тебя увлекло. Хорошо. Но не бесплатно!
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_02");	//Что ты хочешь за это?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_03");	//У тебя ничего нет поесть кроме мяса луркеров? Может быть, кусок сыра? Да, кусок сыра. Жизнь бы отдал за этот кусок...
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_04");	//Я посмотрю, что можно сделать.
	Log_CreateTopic(TOPIC_Teacher,LOG_NOTE);
	B_LogEntry(TOPIC_Teacher,"Талбин может обучить меня добывать трофеи животных.");
};


instance DIA_Talbin_PayTeacher(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 11;
	condition = DIA_Talbin_PayTeacher_Condition;
	information = DIA_Talbin_PayTeacher_Info;
	permanent = TRUE;
	description = "Вот твой сыр. Ты обучишь меня теперь?";
};


var int DIA_Talbin_PayTeacher_noPerm;

func int DIA_Talbin_PayTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_AskTeacher) && (DIA_Talbin_PayTeacher_noPerm == FALSE) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_PayTeacher_Info()
{
	if(B_GiveInvItems(other,self,ItFo_Cheese,1))
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_00");	//Вот твой сыр. Ты обучишь меня теперь?
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_01");	//У тебя действительно есть сыр? Ох, давненько я не ел ничего подобного. Спасибо. Ээ, а что насчет... Ах, да, конечно!
		Talbin_TeachAnimalTrophy = TRUE;
		DIA_Talbin_PayTeacher_noPerm = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_02");	//У меня сейчас нет сыра!
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_03");	//Это было бы слишком хорошо, чтобы быть правдой. Ладно, скажешь, когда раздобудешь его!
	};
};


instance DIA_Talbin_TEACHHUNTING(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 12;
	condition = DIA_Talbin_TEACHHUNTING_Condition;
	information = DIA_Talbin_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "Чему ты можешь обучить меня?";
};


func int DIA_Talbin_TEACHHUNTING_Condition()
{
	if((Talbin_TeachAnimalTrophy == TRUE) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Talbin_TEACHHUNTING_15_00");	//Чему ты можешь обучить меня?
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_01");	//А что ты хочешь знать?
		Info_AddChoice(DIA_Talbin_TEACHHUNTING,Dialog_Back,DIA_Talbin_TEACHHUNTING_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING,B_BuildLearnString("Удаление когтей",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Talbin_TEACHHUNTING_Claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING,B_BuildLearnString("Снятие шкур",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Talbin_TEACHHUNTING_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING,B_BuildLearnString("Рог мракориса",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn)),DIA_Talbin_TEACHHUNTING_ShadowHorn);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING,B_BuildLearnString("Удаление сердца",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Heart)),DIA_Talbin_TEACHHUNTING_Heart);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_02");	//Я разочарую тебя. Ты уже знаешь все, чему я могу научить. Но все же, спасибо за сыр!
	};
};

func void DIA_Talbin_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_Claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_00");	//Отрезать когти - это просто. Берешь коготь за основание и прижимаешь его к земле.
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_01");	//Затем берешь нож и аккуратно отрезаешь коготь.
	};
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_00");	//Проще всего снять шкуру с луркера, сделав разрез вдоль всего живота...
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_01");	//...затем тянешь за задние ноги и стягиваешь шкуру с зада наперед.
	};
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_ShadowHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_ShadowHorn_07_00");	//Рога мракорисов очень твердые, и из них делают статуи и инструменты.
	};
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_Heart()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Heart))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Heart_07_00");	//Сердца магических существ очень редки, и их очень тяжело добыть. Будь осторожен, когда пытаешься сделать это, особенно в случае големов.
	};
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};


instance DIA_Talbin_KAP3_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_KAP3_EXIT_Condition;
	information = DIA_Talbin_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_KAP4_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_KAP4_EXIT_Condition;
	information = DIA_Talbin_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_KAP4_WASNEUES(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 13;
	condition = DIA_Talbin_KAP4_WASNEUES_Condition;
	information = DIA_Talbin_KAP4_WASNEUES_Info;
	description = "Здесь никто не проходил?";
};


func int DIA_Talbin_KAP4_WASNEUES_Condition()
{
	if((Kapitel >= 4) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP4_WASNEUES_Info()
{
	AI_Output(other,self,"DIA_Talbin_KAP4_WASNEUES_15_00");	//Здесь никто не проходил?
	AI_Output(self,other,"DIA_Talbin_KAP4_WASNEUES_07_01");	//Походил. Недавно здесь были очень забавные парни! Они расхаживали в расфуфыренных доспехах, и у них был очень важный и напыщенный вид.
};


instance DIA_Talbin_KAP4_WASWOLLTENDJG(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 14;
	condition = DIA_Talbin_KAP4_WASWOLLTENDJG_Condition;
	information = DIA_Talbin_KAP4_WASWOLLTENDJG_Info;
	description = "А что этим 'забавным парням' было нужно здесь?";
};


func int DIA_Talbin_KAP4_WASWOLLTENDJG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_KAP4_WASNEUES) && (Kapitel >= 4) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP4_WASWOLLTENDJG_Info()
{
	AI_Output(other,self,"DIA_Talbin_KAP4_WASWOLLTENDJG_15_00");	//А что этим 'забавным парням' было нужно здесь?
	AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_01");	//Они спрашивали меня насчет провизии и снаряжения. Я и так-то еле концы с концами свожу!
	AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_02");	//Они болтали что-то о том, что собираются убить дракона. Одному богу ведомо, откуда они взялись такие, но они не вызвали у меня особого доверия!
	if(Kapitel == 4)
	{
		B_LogEntry(TOPIC_Dragonhunter,"Несколько охотников на драконов остановились на охотничьих угодьях Талбина.");
	};
};


instance DIA_Talbin_WOENGROM(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 15;
	condition = DIA_Talbin_WOENGROM_Condition;
	information = DIA_Talbin_WOENGROM_Info;
	description = "Ты сейчас один?";
};


func int DIA_Talbin_WOENGROM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_WASMACHTIHR) && (Kapitel >= 4) && (Talbin_FollowsThroughPass == 0) && (EngromIsGone == TRUE) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_WOENGROM_Info()
{
	AI_Output(other,self,"DIA_Talbin_WOENGROM_15_00");	//Ты сейчас один?
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_01");	//Да. Мой приятель Энгром ушел. Вчера он сказал, что ему было видение - кто-то очень ласково говорил с ним.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_02");	//Я ничего не слышал. Я подумал про себя, что он просто дошел до точки...
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_03");	//...а затем он неожиданно исчез. Понятия не имею, куда он направился.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_04");	//Если ты где-нибудь увидишь Энгрома, скажи ему, что он все еще должен мне шкуру луркера.
	if(Npc_KnowsInfo(other,DIA_Engrom_WhatAboutLeaving))
	{
		AI_Output(other,self,"DIA_Talbin_WOENGROM_15_05");	//Но у меня было впечатление, что он не собирался уходить отсюда, пока орки все еще в долине.
		AI_Output(self,other,"DIA_Talbin_WOENGROM_07_06");	//Я же сказал: у него крыша поехала.
	};
	MIS_Tabin_LookForEngrom = LOG_Running;
};


instance DIA_Talbin_FOUNDENGROM(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 16;
	condition = DIA_Talbin_FOUNDENGROM_Condition;
	information = DIA_Talbin_FOUNDENGROM_Info;
	description = "Я нашел твоего приятеля Энгрома.";
};


func int DIA_Talbin_FOUNDENGROM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_WOENGROM) && ((NpcObsessedByDMT_Engrom == TRUE) || Npc_HasItems(other,ItAt_TalbinsLurkerSkin)) && (Kapitel >= 4) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_FOUNDENGROM_Info()
{
	AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_00");	//Я нашел твоего приятеля Энгрома.
	AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_01");	//Да? Где он?
	if(Npc_IsDead(Engrom))
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_02");	//Он мертв.
	}
	else
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_03");	//Я не думаю, что ты когда-нибудь его увидишь.
	};
	if(B_GiveInvItems(other,self,ItAt_TalbinsLurkerSkin,1))
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_04");	//Вот. Я нашел при нем эту шкуру луркера.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_05");	//Ищущие овладели им.
		AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_06");	//Ищущие? Кто это такие?
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_07");	//Приспешники преисподней. Это они командуют орками.
	};
	AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_08");	//О, Иннос. Мне нужно выбираться отсюда, даже если я при этом найду свою смерть. Сейчас или никогда!
	AI_StopProcessInfos(self);
	Log_CreateTopic(TOPIC_Talbin_Runs,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Talbin_Runs,LOG_Running);
	B_LogEntry(TOPIC_Talbin_Runs,"Талбин, охотник из Долины рудников, бежал через проход, как будто за ним по пятам гнался рой кровавых мух. Я думаю, он направился в Хоринис.");
	B_GivePlayerXP(XP_Ambient);
	Npc_ExchangeRoutine(self,"FleePass");
	Wld_InsertNpc(Snapper,"START");
	Talbin_Runs = TRUE;
};


instance DIA_Talbin_WOHIN(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 17;
	condition = DIA_Talbin_WOHIN_Condition;
	information = DIA_Talbin_WOHIN_Info;
	permanent = TRUE;
	description = "Куда ты собрался? ";
};


func int DIA_Talbin_WOHIN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_FOUNDENGROM) && (Talbin_FollowsThroughPass == 0))
	{
		return TRUE;
	};
};

func void DIA_Talbin_WOHIN_Info()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_15_00");	//Куда ты собрался?
	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		AI_Output(self,other,"DIA_Talbin_WOHIN_07_01");	//Доведи меня до Прохода. Пожалуйста!!
		Info_ClearChoices(DIA_Talbin_WOHIN);
		Info_AddChoice(DIA_Talbin_WOHIN,"У меня нет времени на тебя.",DIA_Talbin_WOHIN_);
		Info_AddChoice(DIA_Talbin_WOHIN,"Просто иди вперед.",DIA_Talbin_WOHIN_durch);
		Info_AddChoice(DIA_Talbin_WOHIN,"Хорошо.",DIA_Talbin_WOHIN_ok);
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_WOHIN_07_02");	//Я должен выбраться отсюда, через Проход!
		AI_StopProcessInfos(self);
	};
};

func void DIA_Talbin_WOHIN_ok()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_ok_15_00");	//Хорошо.
	AI_Output(self,other,"DIA_Talbin_WOHIN_ok_07_01");	//Спасибо. Я просто пойду за тобой.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"IntoPass");
	Talbin_FollowsThroughPass = LOG_Running;
	self.flags = NPC_FLAG_IMMORTAL;
};

func void DIA_Talbin_WOHIN_durch()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_durch_15_00");	//Просто иди вперед.
	AI_Output(self,other,"DIA_Talbin_WOHIN_durch_07_01");	//Там так темно. Я бы ни за что не пошел бы туда один.
};

func void DIA_Talbin_WOHIN_()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_schwein_15_00");	//У меня нет времени на тебя.
	AI_Output(self,other,"DIA_Talbin_WOHIN_schwein_07_01");	//Ты оставляешь меня здесь умирать?! Ты будешь гореть в аду за это!
	Talbin_FollowsThroughPass = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_VERSCHWINDE(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 15;
	condition = DIA_Talbin_VERSCHWINDE_Condition;
	information = DIA_Talbin_VERSCHWINDE_Info;
	permanent = TRUE;
	description = "Эй.";
};


func int DIA_Talbin_VERSCHWINDE_Condition()
{
	if(Talbin_FollowsThroughPass == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void DIA_Talbin_VERSCHWINDE_Info()
{
	AI_Output(other,self,"DIA_Talbin_VERSCHWINDE_15_00");	//Эй.
	AI_Output(self,other,"DIA_Talbin_VERSCHWINDE_07_01");	//Проваливай. Я справлюсь и без тебя, дерьмо!
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_KAP5_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_KAP5_EXIT_Condition;
	information = DIA_Talbin_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_KAP6_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_KAP6_EXIT_Condition;
	information = DIA_Talbin_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_PICKPOCKET(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 900;
	condition = DIA_Talbin_PICKPOCKET_Condition;
	information = DIA_Talbin_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Talbin_PICKPOCKET_Condition()
{
	return C_Beklauen(40,25);
};

func void DIA_Talbin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Talbin_PICKPOCKET);
	Info_AddChoice(DIA_Talbin_PICKPOCKET,Dialog_Back,DIA_Talbin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Talbin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Talbin_PICKPOCKET_DoIt);
};

func void DIA_Talbin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Talbin_PICKPOCKET);
};

func void DIA_Talbin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Talbin_PICKPOCKET);
};

