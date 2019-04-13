
instance DIA_Moe_EXIT(C_Info)
{
	npc = VLK_432_Moe;
	nr = 999;
	condition = DIA_Moe_EXIT_Condition;
	information = DIA_Moe_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Moe_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Moe_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Moe_PICKPOCKET(C_Info)
{
	npc = VLK_432_Moe;
	nr = 900;
	condition = DIA_Moe_PICKPOCKET_Condition;
	information = DIA_Moe_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Moe_PICKPOCKET_Condition()
{
	return C_Beklauen(25,30);
};

func void DIA_Moe_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Moe_PICKPOCKET);
	Info_AddChoice(DIA_Moe_PICKPOCKET,Dialog_Back,DIA_Moe_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Moe_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Moe_PICKPOCKET_DoIt);
};

func void DIA_Moe_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Moe_PICKPOCKET);
};

func void DIA_Moe_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Moe_PICKPOCKET);
};


instance DIA_Moe_Hallo(C_Info)
{
	npc = VLK_432_Moe;
	nr = 2;
	condition = DIA_Moe_Hallo_Condition;
	information = DIA_Moe_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Moe_Hallo_Condition()
{
	if((Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_MIL) && (hero.guild != GIL_NOV) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Moe_Hallo_Info()
{
	AI_Output(self,other,"DIA_Moe_Hallo_01_00");	//Эй, я не знаю тебя. Чего тебе здесь нужно? Ты идешь в кабак?
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo,"Нет, я не иду в кабак ... (КОНЕЦ)",DIA_Moe_Hallo_Gehen);
	Info_AddChoice(DIA_Moe_Hallo,"Ох, так это портовый трактир ...",DIA_Moe_Hallo_Witz);
	Info_AddChoice(DIA_Moe_Hallo,"Ты имеешь что-то против?",DIA_Moe_Hallo_Reizen);
};

func void DIA_Moe_Hallo_Gehen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Gehen_15_00");	//Нет, я не иду в кабак...
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_01");	//Я так и подумал. Но это не так уж важно - мы можем перейти прямо к делу.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_02");	//Так как ты здесь новичок, я хочу сделать тебе заманчивое предложение. Ты даешь мне 50 золотых монет и можешь идти дальше.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_03");	//Это плата за свободный вход в кабак.
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo,"Давай спросим, что думает по этому поводу ополчение...",DIA_Moe_Hallo_Miliz);
	Info_AddChoice(DIA_Moe_Hallo,"Забудь об этом, ты не получишь ни цента!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice(DIA_Moe_Hallo,"Хорошо, я заплачу.",DIA_Moe_Hallo_Zahlen);
	Info_AddChoice(DIA_Moe_Hallo,"Но я не хочу идти в кабак!",DIA_Moe_Hallo_Kneipe);
};

func void DIA_Moe_Hallo_Kneipe()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Kneipe_15_00");	//Но я не хочу идти в кабак!
	AI_Output(self,other,"DIA_Moe_Hallo_Kneipe_01_01");	//Понимаешь, рано или поздно все заходят в кабак. Так что лучше тебе заплатить прямо сейчас - и больше эта проблема не будет волновать тебя.
};

func void DIA_Moe_Hallo_Witz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Witz_15_00");	//Ох, так это портовый трактир. А я то принял его за дворец губернатора.
	AI_Output(self,other,"DIA_Moe_Hallo_Witz_01_01");	//Эй - держи свои шуточки при себе, кретин, или я заставлю тебя грызть булыжники из мостовой.
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo,"Понимаю, чтобы пройти дальше мне придется сломать тебе пару ребер ...",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice(DIA_Moe_Hallo,"Ты пытаешься создать мне проблемы?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice(DIA_Moe_Hallo,"Успокойся, я просто хотел выпить пива.",DIA_Moe_Hallo_Ruhig);
	Info_AddChoice(DIA_Moe_Hallo,"Но я не хочу идти в кабак!",DIA_Moe_Hallo_Kneipe);
};

func void DIA_Moe_Hallo_Reizen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Reizen_15_00");	//Ты имеешь что-то против?
	AI_Output(self,other,"DIA_Moe_Hallo_Reizen_01_01");	//Тебе нечего здесь делать, малыш.
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo,"Понимаю, чтобы пройти дальше мне придется сломать тебе пару ребер ...",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice(DIA_Moe_Hallo,"Ты пытаешься создать мне проблемы?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice(DIA_Moe_Hallo,"Успокойся, я просто хотел выпить пива.",DIA_Moe_Hallo_Ruhig);
};

func void DIA_Moe_Hallo_Miliz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Miliz_15_00");	//Давай спросим, что думает по этому поводу ополчение...
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_01");	//(смеется) Ополчения здесь нет. А ты знаешь, почему их здесь не бывает?
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_02");	//Ты находишься в портовом квартале, малыш. Никто из ополчения не осмелится вступать здесь в драку со мной.
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_03");	//Они только иногда заглядывают в 'Красный Фонарь'. Понимаешь, здесь есть только ты и я. (мерзкая ухмылка)
};

func void DIA_Moe_Hallo_Pruegel()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Pruegel_15_00");	//Понимаю, чтобы пройти дальше, мне придется сломать тебе пару ребер.
	AI_Output(self,other,"DIA_Moe_Hallo_Pruegel_01_01");	//Можешь попробовать, малыш. Покажи мне, на что ты способен!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Moe_Hallo_Aerger()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Aerger_15_00");	//Ты пытаешься создать мне проблемы?
	AI_Output(self,other,"DIA_Moe_Hallo_Aerger_01_01");	//Конечно, я мастер создавать проблемы. Так что защищайся, кретин!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Moe_Hallo_Ruhig()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Ruhig_15_00");	//Успокойся, я просто хотел выпить пива.
	AI_Output(self,other,"DIA_Moe_Hallo_Ruhig_01_01");	//Хорошо, но это будет стоить тебе 50 монет. Это плата за вход. (ухмыляется)
	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo,"Забудь об этом, ты не получишь ни цента!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice(DIA_Moe_Hallo,"Хорошо, я заплачу.",DIA_Moe_Hallo_Zahlen);
};

func void DIA_Moe_Hallo_Zahlen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_00");	//Хорошо, я заплачу.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_01");	//Отлично. Раз сегодня ты такой щедрый, теперь ты можешь отдать мне все содержимое твоего кошелька.
		Info_ClearChoices(DIA_Moe_Hallo);
		Info_AddChoice(DIA_Moe_Hallo,"Забудь об этом, ты не получишь ни цента!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice(DIA_Moe_Hallo,"Хорошо, это все, что у меня есть.",DIA_Moe_Hallo_Alles);
	}
	else if(Npc_HasItems(hero,ItMi_Gold) > 9)
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_02");	//...но у меня нет с собой столько золота.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_03");	//Это не важно. Просто отдай мне все, что у тебя есть.
		Info_ClearChoices(DIA_Moe_Hallo);
		Info_AddChoice(DIA_Moe_Hallo,"Забудь об этом, ты не получишь ни цента!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice(DIA_Moe_Hallo,"Хорошо, это все, что у меня есть.",DIA_Moe_Hallo_Alles);
	}
	else
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_04");	//...но у меня нет даже и 10 монет.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_05");	//Черт, неужели сегодня мне не повезло?!
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_06");	//Хорошо, (вздох) ты можешь идти.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Moe_Hallo_Vergisses()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Vergisses_15_00");	//Забудь об этом, ты не получишь ни цента!
	AI_Output(self,other,"DIA_Moe_Hallo_Vergisses_01_01");	//Тогда я возьму все, что у тебя есть, - а ты будешь лежать распростертым на земле передо мной.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Moe_Hallo_Alles()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Alles_15_00");	//Хорошо, это все, что у меня есть.
	B_GiveInvItems(other,self,ItMi_Gold,Npc_HasItems(other,ItMi_Gold));
	AI_Output(self,other,"DIA_Moe_Hallo_Alles_01_01");	//Отлично, этого достаточно. Я сегодня великодушен. (ухмыляется)
	AI_StopProcessInfos(self);
};


instance DIA_Moe_Harbor(C_Info)
{
	npc = VLK_432_Moe;
	nr = 998;
	condition = DIA_Moe_Harbor_Condition;
	information = DIA_Moe_Harbor_Info;
	permanent = TRUE;
	description = "Ты знаешь о порте почти все, да?";
};


func int DIA_Moe_Harbor_Condition()
{
	return TRUE;
};

func void DIA_Moe_Harbor_Info()
{
	AI_Output(other,self,"DIA_Moe_Harbor_15_00");	//Ты знаешь о порте почти все, да?
	AI_Output(self,other,"DIA_Moe_Harbor_01_01");	//Конечно. А что?
	Info_ClearChoices(DIA_Moe_Harbor);
	Info_AddChoice(DIA_Moe_Harbor,Dialog_Back,DIA_Moe_Harbor_Back);
	Info_AddChoice(DIA_Moe_Harbor,"Как тут с кораблями?",DIA_Moe_Harbor_Ship);
	Info_AddChoice(DIA_Moe_Harbor,"Почему я не вижу здесь никого из ополчения?",DIA_Moe_Harbor_Militia);
	Info_AddChoice(DIA_Moe_Harbor,"Какие слухи бродят в последнее время?",DIA_Moe_Harbor_Rumors);
};

func void DIA_Moe_Harbor_Back()
{
	Info_ClearChoices(DIA_Moe_Harbor);
};

func void DIA_Moe_Harbor_Ship()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Ship_15_00");	//Как тут с кораблями?
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_01");	//Единственный корабль, который пришел за последнее время, - это корабль паладинов.
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_02");	//Он стоит вон там, за скалами к юго-западу.
};

func void DIA_Moe_Harbor_Militia()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Militia_15_00");	//Почему я не вижу здесь никого из ополчения?
	AI_Output(self,other,"DIA_Moe_Harbor_Militia_01_01");	//Они не осмеливаются соваться сюда. У нас здесь свои порядки.
};

func void DIA_Moe_Harbor_Rumors()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_00");	//Какие слухи бродят в последнее время?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_01");	//Мы здесь не любим людей, которые задают слишком много вопросов. Особенно, если они чужаки.
	}
	else if(Kapitel == 2)
	{
		if(hero.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_02");	//Ничего, да и что может случиться? Все тихо.
		}
		else if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_03");	//(наиграно) Все плохо. Времена настали тяжелые, но мы все еще пытаемся не сбиться с праведного пути.
			AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_04");	//Хватит издеваться надо мной.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_05");	//Как ты мог подумать такое обо мне? Я глубоко оскорблен.
		}
		else
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_06");	//Становится жарко. Лорд Андрэ пытается сунуть свой нос туда, где ему делать нечего.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_07");	//Эти шишки никогда не понимали, как здесь ведутся дела.
		};
	}
	else if(Kapitel == 3)
	{
		if(MIS_RescueBennet == LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_08");	//К этому делу мы не имеем никакого отношения.
				AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_09");	//К какому делу?
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_10");	//К этому убийству паладина там, наверху. Я бы на твоем месте подумал о наемниках вместо того, чтобы попусту проводить время здесь.
			}
			else
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_11");	//Я знаю, что ты не имеешь к этому никакого отношения, но убийство паладина сильно напугало этих вельмож.
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_12");	//Хочешь дружеский совет? Тебе лучше убираться из города. По крайней мере, на некоторое время.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_13");	//С тех пор, как выяснилось, что наемники не имели отношения к этому паладину, ополчение не осмеливается даже заглядывать сюда.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_14");	//Я думаю, они боятся уйти отсюда с расквашенным носом. А по мне, так даже лучше.
		};
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_15");	//Здесь абсолютно ничего не происходит.
	}
	else
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_16");	//Наконец-то эти разжиревшие паладины покидают гавань. Давно пора.
	};
};


instance DIA_Moe_LEHMARGELDEINTREIBEN(C_Info)
{
	npc = VLK_432_Moe;
	nr = 2;
	condition = DIA_Moe_LEHMARGELDEINTREIBEN_Condition;
	information = DIA_Moe_LEHMARGELDEINTREIBEN_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Moe_LEHMARGELDEINTREIBEN_Condition()
{
	if((Lehmar_GeldGeliehen_Day <= (Wld_GetDay() - 2)) && (Lehmar_GeldGeliehen != 0) && (RangerHelp_LehmarKohle == FALSE) && (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Moe_LEHMARGELDEINTREIBEN_Info()
{
	AI_Output(self,other,"DIA_Moe_LEHMARGELDEINTREIBEN_01_00");	//Эй, ты! Лемар передает тебе привет.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

