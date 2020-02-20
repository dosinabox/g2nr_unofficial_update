
instance DIA_Godar_EXIT(C_Info)
{
	npc = DJG_711_Godar;
	nr = 999;
	condition = DIA_Godar_EXIT_Condition;
	information = DIA_Godar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Godar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Godar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Godar_Hello(C_Info)
{
	npc = DJG_711_Godar;
	nr = 4;
	condition = DIA_Godar_Hello_Condition;
	information = DIA_Godar_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Godar_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Godar_Hello_Info()
{
	AI_Output(self,other,"DIA_Godar_Hello_13_00");	//Э-э? Что?
};


instance DIA_Godar_ComeFrom(C_Info)
{
	npc = DJG_711_Godar;
	nr = 4;
	condition = DIA_Godar_ComeFrom_Condition;
	information = DIA_Godar_ComeFrom_Info;
	permanent = FALSE;
	description = "Откуда вы?";
};


func int DIA_Godar_ComeFrom_Condition()
{
	return TRUE;
};

func void DIA_Godar_ComeFrom_Info()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_15_00");	//Откуда вы?
	AI_Output(self,other,"DIA_Godar_ComeFrom_13_01");	//Мы пришли... э-э, из города.
	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom,"Вы бандиты!",DIA_Godar_ComeFrom_Bandits);
	Info_AddChoice(DIA_Godar_ComeFrom,"Я что-то не видел тебя в городе.",DIA_Godar_ComeFrom_NotCity);
	Info_AddChoice(DIA_Godar_ComeFrom,"Понятно. Вы из города.",DIA_Godar_ComeFrom_Understand);
};

func void DIA_Godar_ComeFrom_Bandits()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_15_00");	//Вы бандиты!
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_13_01");	//Поосторожнее! Твой язык не доведет тебя до добра!
	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom,"Расслабься. Я не буду сдавать вас.",DIA_Godar_ComeFrom_Bandits_KeepCalm);
	Info_AddChoice(DIA_Godar_ComeFrom,"Тебе не напугать меня.",DIA_Godar_ComeFrom_Bandits_NoFear);
};

func void DIA_Godar_ComeFrom_Bandits_KeepCalm()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_KeepCalm_15_00");	//Расслабься. Я не буду сдавать вас.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_KeepCalm_13_01");	//Надеюсь. Это для твоей же пользы. А то не сносить тебе головы!
	Info_ClearChoices(DIA_Godar_ComeFrom);
};

func void DIA_Godar_ComeFrom_Bandits_NoFear()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_NoFear_15_00");	//Тебе не напугать меня.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_NoFear_13_01");	//Ну, это мы еще посмотрим.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Godar_ComeFrom_NotCity()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_15_00");	//Я что-то не видел тебя в городе.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_13_01");	//Не выношу людей, которые суют нос не в свое дело. Понял?
	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom,"Нет.",DIA_Godar_ComeFrom_NotCity_CutThroat);
	Info_AddChoice(DIA_Godar_ComeFrom,"Понял. Вы пришли из города.",DIA_Godar_ComeFrom_NotCity_Forget);
};

func void DIA_Godar_ComeFrom_NotCity_Forget()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_Forget_15_00");	//Понял. Вы пришли из города.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_Forget_13_01");	//Именно.
	Info_ClearChoices(DIA_Godar_ComeFrom);
};

func void DIA_Godar_ComeFrom_NotCity_CutThroat()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_CutThroat_15_00");	//Нет.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_CutThroat_13_01");	//Тогда мне придется объяснить это в деталях...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Godar_ComeFrom_Understand()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Understand_15_00");	//Понятно. Вы из города.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_01");	//Видишь! Ты все понимаешь!
	AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_02");	//Вот, глотни!
	CreateInvItems(self,ItFo_Beer,1);
	B_GiveInvItems(self,other,ItFo_Beer,1);
	B_UseItem(other,ItFo_Beer);
	Info_ClearChoices(DIA_Godar_ComeFrom);
};


instance DIA_Godar_Plan(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Plan_Condition;
	information = DIA_Godar_Plan_Info;
	permanent = FALSE;
	description = "Что вы делаете здесь?";
};


func int DIA_Godar_Plan_Condition()
{
	return TRUE;
};

func void DIA_Godar_Plan_Info()
{
	AI_Output(other,self,"DIA_Godar_Plan_15_00");	//Что вы делаете здесь?
	AI_Output(self,other,"DIA_Godar_Plan_13_01");	//Мы услышали об охоте на драконов. Ну... Мы собрали свои пожитки и пришли сюда.
	AI_Output(self,other,"DIA_Godar_Plan_13_02");	//Но, говоря откровенно, мне плевать на драконов. Мне нужно золото.
	AI_Output(self,other,"DIA_Godar_Plan_13_03");	//У драконов ведь есть золото, правда?
	AI_Output(other,self,"DIA_Godar_Plan_15_04");	//Конечно.
};


instance DIA_Godar_DragonLore(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_DragonLore_Condition;
	information = DIA_Godar_DragonLore_Info;
	permanent = FALSE;
	description = "Что ты знаешь о драконах?";
};


func int DIA_Godar_DragonLore_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Godar_Plan))
	{
		return TRUE;
	};
};

func void DIA_Godar_DragonLore_Info()
{
	AI_Output(other,self,"DIA_Godar_DragonLore_15_00");	//Что ты знаешь о драконах?
	AI_Output(self,other,"DIA_Godar_DragonLore_13_01");	//Я знаю о них только из детских сказок.
	AI_Output(self,other,"DIA_Godar_DragonLore_13_02");	//Понимаешь, девственницы, золото, огненное дыхание и все такое.
};


instance DIA_Godar_Destination(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Destination_Condition;
	information = DIA_Godar_Destination_Info;
	permanent = FALSE;
	description = "А куда вы собираетесь идти отсюда?";
};


func int DIA_Godar_Destination_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Godar_Plan))
	{
		return TRUE;
	};
};

func void DIA_Godar_Destination_Info()
{
	AI_Output(other,self,"DIA_Godar_Destination_15_00");	//А куда вы собираетесь идти отсюда?
	AI_Output(self,other,"DIA_Godar_Destination_13_01");	//Понятия не имею. Мы все еще думаем над этим.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(other,self,"DIA_Godar_Destination_15_02");	//Вы могли бы пойти в замок.
		AI_Output(self,other,"DIA_Godar_Destination_13_03");	//Меня туда силком не затащишь. Нет уж. Только не к паладинам.
		AI_Output(self,other,"DIA_Godar_Destination_13_04");	//Я не хочу обратно в тюрьму. Я уже был там, и мне этого хватило.
	};
};


instance DIA_Godar_Orks(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Orks_Condition;
	information = DIA_Godar_Orks_Info;
	permanent = FALSE;
	description = "Что насчет орков?";
};


func int DIA_Godar_Orks_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Godar_Destination))
	{
		return TRUE;
	};
};

func void DIA_Godar_Orks_Info()
{
	AI_Output(other,self,"DIA_Godar_Orks_15_00");	//Что насчет орков?
	AI_Output(self,other,"DIA_Godar_Orks_13_01");	//Ими окружен весь замок.
	AI_Output(self,other,"DIA_Godar_Orks_13_02");	//Пытаться пробраться туда - чистое безумие. Если ты хочешь сразиться с орками, то сразу можешь считать себя трупом.
	AI_Output(self,other,"DIA_Godar_Orks_13_03");	//Никому не пробиться туда.
	AI_Output(other,self,"DIA_Godar_Orks_15_04");	//Ах, действительно.
};


instance DIA_Godar_Prison(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Prison_Condition;
	information = DIA_Godar_Prison_Info;
	permanent = FALSE;
	description = "За что ты сидел?";
};


func int DIA_Godar_Prison_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Godar_Destination) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Godar_Prison_Info()
{
	AI_Output(other,self,"DIA_Godar_Prison_15_00");	//За что ты сидел?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Godar_Prison_13_01");	//Так я тебе и сказал! Ха!
		AI_Output(self,other,"DIA_Godar_Prison_13_02");	//Вы, маги, заодно с паладинами. Нет, дружок. Забудь об этом.
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Prison_13_03");	//Эти свиньи поймали меня за браконьерство. За двух жалких зайцев!
		AI_Output(self,other,"DIA_Godar_Prison_13_04");	//Мне дали 10 лет за это!
		AI_Output(other,self,"DIA_Godar_Prison_15_05");	//Это все?
		AI_Output(self,other,"DIA_Godar_Prison_13_06");	//Ну... Конечно же, я защищался...
		AI_Output(other,self,"DIA_Godar_Prison_15_07");	//И?
		AI_Output(self,other,"DIA_Godar_Prison_13_08");	//Я тут не причем. Этот парень сам поскользнулся и сломал себе шею. Честно!
		Info_ClearChoices(DIA_Godar_Prison);
		Info_AddChoice(DIA_Godar_Prison,"Знакомая история.",DIA_Godar_Prison_Court);
		Info_AddChoice(DIA_Godar_Prison,"Тебе не следовало попадаться.",DIA_Godar_Prison_Pissoff);
	};
};

func void DIA_Godar_Prison_Court()
{
	AI_Output(other,self,"DIA_Godar_Prison_Court_15_00");	//Знакомая история.
	AI_Output(self,other,"DIA_Godar_Prison_Court_13_01");	//Ты понимаешь меня? Эти спесивые богачи понятия не имеют, как нам тяжело.
	AI_Output(self,other,"DIA_Godar_Prison_Court_13_02");	//Ну, по крайней мере, их это не волнует.
	Info_ClearChoices(DIA_Godar_Prison);
	GodarLikesYou = TRUE;
};

func void DIA_Godar_Prison_Pissoff()
{
	AI_Output(other,self,"DIA_Godar_Prison_Pissoff_15_00");	//Тебе не следовало попадаться.
	AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_01");	//(сердито) Ручаюсь, ты никогда не был в тюрьме, так ведь?
	AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_02");	//Сейчас я покажу тебе, что может стать с человеком в тюрьме!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Godar_Hunting(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Hunting_Condition;
	information = DIA_Godar_Hunting_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня охотиться?";
};


func int DIA_Godar_Hunting_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Godar_Prison) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Godar_Hunting_Info()
{
	AI_Output(other,self,"DIA_Godar_Hunting_15_00");	//Ты можешь научить меня охотиться?
	if(GodarLikesYou == FALSE)
	{
		AI_Output(self,other,"DIA_Godar_Hunting_13_01");	//Ты шутишь? Ни за что!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Hunting_13_03");	//Животные - это не только мясо. Ты также можешь продавать их шкуры или когти. Это неплохие деньги.
		AI_Output(self,other,"DIA_Godar_Hunting_13_04");	//Дождаться не могу, когда мы доберемся до этого дракона!
		Godar_TeachAnimalTrophy = TRUE;
	};
};


instance DIA_Godar_Dragonstuff(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Dragonstuff_Condition;
	information = DIA_Godar_Dragonstuff_Info;
	permanent = TRUE;
	description = "Расскажи мне, как потрошить дракона.";
};


var int Godar_TeachDragonStuff;

func int DIA_Godar_Dragonstuff_Condition()
{
	if((Godar_TeachAnimalTrophy == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)) && (Godar_TeachDragonStuff == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Godar_Dragonstuff_Info()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_15_00");	//Расскажи мне, как потрошить дракона.
	AI_Output(self,other,"DIA_Godar_Dragonstuff_13_01");	//Чтобы ты прибрал все золотишко себе, ха?
	AI_Output(self,other,"DIA_Godar_Dragonstuff_13_02");	//Ладно, хорошо, но это обойдется тебе в 1000 золотых.
	Info_ClearChoices(DIA_Godar_Dragonstuff);
	Info_AddChoice(DIA_Godar_Dragonstuff,"Мне это не очень интересно.",DIA_Godar_Dragonstuff_nein);
	Info_AddChoice(DIA_Godar_Dragonstuff,"Это честно.",DIA_Godar_Dragonstuff_fair);
};

func void DIA_Godar_Dragonstuff_fair()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_fair_15_00");	//Это честно.
	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		Godar_TeachDragonStuff = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Dragonstuff_fair_13_01");	//Без денег? Нет уж, сначала раздобудь золото.
	};
	Info_ClearChoices(DIA_Godar_Dragonstuff);
};

func void DIA_Godar_Dragonstuff_nein()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_nein_15_00");	//Мне это не очень интересно.
	AI_Output(self,other,"DIA_Godar_Dragonstuff_nein_13_01");	//Как знаешь.
	Info_ClearChoices(DIA_Godar_Dragonstuff);
};


instance DIA_Godar_Teach(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Teach_Condition;
	information = DIA_Godar_Teach_Info;
	permanent = TRUE;
	description = "Научи меня охотиться.";
};


func int DIA_Godar_Teach_Condition()
{
	if((Godar_TeachAnimalTrophy == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Godar_Teach_Info()
{
	AI_Output(other,self,"DIA_Godar_Teach_15_00");	//Научи меня охотиться.
	if(!Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE))
	{
		Info_AddChoice(DIA_Godar_Teach,Dialog_Back,DIA_Godar_Teach_Back);
		if(!Npc_GetTalentSkill(other,NPC_TALENT_SNEAK))
		{
			Info_AddChoice(DIA_Godar_Teach,B_BuildLearnString("Подкрадывание",B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1)),DIA_Godar_Teach_Thief_Sneak);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach,B_BuildLearnString(NAME_TROPHY_Teeth,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Godar_Teach_TROPHYS_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach,B_BuildLearnString(NAME_TROPHY_BFSting,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSting)),DIA_Godar_Teach_TROPHYS_BFSting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach,B_BuildLearnString(NAME_TROPHY_BFWing,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWing)),DIA_Godar_Teach_TROPHYS_BFWing);
		};
		if(Godar_TeachDragonStuff == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
			{
				Info_AddChoice(DIA_Godar_Teach,B_BuildLearnString(NAME_TROPHY_DragonScale,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonScale)),DIA_Godar_Teach_TROPHYS_DragonScale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
			{
				Info_AddChoice(DIA_Godar_Teach,B_BuildLearnString(NAME_TROPHY_DragonBlood,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonBlood)),DIA_Godar_Teach_TROPHYS_DragonBlood);
			};
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
	};
};

func void DIA_Godar_Teach_Back()
{
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Teeth_13_00");	//Зубы лучше всего отделять при помощи хорошего ножа.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_BFSting()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFSting_13_00");	//Чтобы изъять жало кровавой мухи, нужно сначала выдавить его из ее тела.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_BFWing()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFWing_13_00");	//Крылья кровавых мух очень нежные. Нужно быть очень аккуратным, когда отрезаешь их.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_Thief_Sneak()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Sneak_13_00");	//Чтобы неслышно красться, лучше всего использовать мягкую обувь. Жесткая подошва издает слишком много шума.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_DragonScale()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonScale))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonScale_13_00");	//Чтобы оторвать чешую дракона, нужно иметь много сил. Но ты справишься.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_DragonBlood()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonBlood))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonBlood_13_00");	//Найди мягкое место на животе дракона. Там легче всего сцедить его кровь.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};


instance DIA_Godar_AllDragonsDead(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_AllDragonsDead_Condition;
	information = DIA_Godar_AllDragonsDead_Info;
	permanent = FALSE;
	description = "Я убил всех драконов.";
};


func int DIA_Godar_AllDragonsDead_Condition()
{
	if(MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Godar_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Godar_AllDragonsDead_15_00");	//Я убил всех драконов.
	AI_Output(self,other,"DIA_Godar_AllDragonsDead_13_01");	//Ну и ладно. Здесь, в Долине, мы все равно найдем, чем поживиться.
};


instance DIA_Godar_PICKPOCKET(C_Info)
{
	npc = DJG_711_Godar;
	nr = 900;
	condition = DIA_Godar_PICKPOCKET_Condition;
	information = DIA_Godar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Godar_PICKPOCKET_Condition()
{
	return C_Beklauen(16,160);
};

func void DIA_Godar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
	Info_AddChoice(DIA_Godar_PICKPOCKET,Dialog_Back,DIA_Godar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Godar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Godar_PICKPOCKET_DoIt);
};

func void DIA_Godar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
};

func void DIA_Godar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
};



