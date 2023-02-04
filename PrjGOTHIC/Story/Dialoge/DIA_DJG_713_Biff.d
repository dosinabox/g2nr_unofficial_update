
func void B_KommMit()
{
	AI_Output(other,self,"DIA_AkilsSchaf_KommMit_15_00");	//Иди за мной!
};

func void B_Biff_Verarschen()
{
	AI_Output(self,other,"DIA_Biff_ARBEITEN_lebenlassen_07_01");	//Я не хочу, чтобы ты делал из меня дурака.
};

func void B_BiffsAnteil_Berechnung()
{
	var int momentanKohle;
	var int UeberschussKohle;
	momentanKohle = Npc_HasItems(hero,ItMi_Gold);
	UeberschussKohle = momentanKohle - DJG_Biff_SCGold;
	BiffsAnteil = UeberschussKohle / 2;
};

func void B_BiffsAnteil_PrintScreen()
{
	var string BiffsAnteilText_Teil;
	var string BiffsAnteilText;
	var string Anteil;
	Anteil = IntToString(BiffsAnteil);
	BiffsAnteilText_Teil = ConcatStrings(PRINT_BiffsAnteil,Anteil);
	BiffsAnteilText = ConcatStrings(BiffsAnteilText_Teil,PRINT_Gold);
	AI_PrintScreen(BiffsAnteilText,-1,45,FONT_ScreenSmall,4);
};

func void B_Biff_SetRefuseTalk()
{
	if(DJG_Biff_HalbeHalbe == TRUE)
	{
		Npc_SetRefuseTalk(self,1000);
	}
	else
	{
		Npc_SetRefuseTalk(self,600);
	};
};


instance DIA_Biff_EXIT(C_Info)
{
	npc = DJG_713_Biff;
	nr = 999;
	condition = DIA_Biff_EXIT_Condition;
	information = DIA_Biff_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Biff_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Biff_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Biff_HALLO(C_Info)
{
	npc = DJG_713_Biff;
	nr = 5;
	condition = DIA_Biff_HALLO_Condition;
	information = DIA_Biff_HALLO_Info;
	description = "Что ты делаешь здесь?";
};


func int DIA_Biff_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Biff_HALLO_Info()
{
	AI_Output(other,self,"DIA_Biff_HALLO_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Biff_HALLO_07_01");	//Давно уже не слышал такого тупого вопроса. А что, по-твоему?
	Info_AddChoice(DIA_Biff_HALLO,"Я ничего не могу понять из-за твоего идиотского выражения лица.",DIA_Biff_HALLO_spott);
	Info_AddChoice(DIA_Biff_HALLO,"Совершенно не представляю.",DIA_Biff_HALLO_keineAhnung);
	Info_AddChoice(DIA_Biff_HALLO,"Ладно, забудь.",DIA_Biff_HALLO_doof);
};

func void DIA_Biff_HALLO_doof()
{
	AI_Output(other,self,"DIA_Biff_HALLO_doof_15_00");	//Ладно, забудь.
	Info_ClearChoices(DIA_Biff_HALLO);
};

func void DIA_Biff_HALLO_spott()
{
	AI_Output(other,self,"DIA_Biff_HALLO_spott_15_00");	//Я ничего не могу понять из-за твоего идиотского выражения лица. Вот почему я и спросил.
	AI_Output(self,other,"DIA_Biff_HALLO_spott_07_01");	//У тебя слишком длинный язык. Я думаю, пришло время подрезать его.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	DJG_BiffParty_nomore += 1;
};

func void DIA_Biff_HALLO_keineAhnung()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_15_00");	//Совершенно не представляю.
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_07_01");	//Я жду, когда что-нибудь, наконец, произойдет.
	Info_AddChoice(DIA_Biff_HALLO,"А что должно произойти?",DIA_Biff_HALLO_keineAhnung_was);
};

func void DIA_Biff_HALLO_keineAhnung_was()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_15_00");	//А что должно произойти?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_07_01");	//Ох, да ты еще более тупой, чем я думал. Если бы я знал это, я бы не ждал.
	Info_AddChoice(DIA_Biff_HALLO,"А что может произойти?",DIA_Biff_HALLO_keineAhnung_was_was2);
};

func void DIA_Biff_HALLO_keineAhnung_was_was2()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_15_00");	//А что может произойти?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_07_01");	//Ты начинаешь действовать мне на нервы. Послушай, меня не волнует, что произойдет. Мне нужно, чтобы что-нибудь произошло.
	Info_AddChoice(DIA_Biff_HALLO,"А почему ты тогда ничего не делаешь?",DIA_Biff_HALLO_keineAhnung_was_was2_was3);
};

func void DIA_Biff_HALLO_keineAhnung_was_was2_was3()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_15_00");	//А почему ты тогда ничего не делаешь?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_07_01");	//Если ты не перестанешь задавать идиотские вопросы, я подрежу твой длинный язык.
	Info_AddChoice(DIA_Biff_HALLO,"Если ты будешь просто ждать здесь, ничего и не произойдет!",DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4);
};

func void DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_15_00");	//Если ты будешь просто ждать здесь, ничего и не произойдет!
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_07_01");	//Ты достал меня!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	DJG_BiffParty_nomore += 1;
};


instance DIA_Biff_WASHIERIMTAL(C_Info)
{
	npc = DJG_713_Biff;
	nr = 7;
	condition = DIA_Biff_WASHIERIMTAL_Condition;
	information = DIA_Biff_WASHIERIMTAL_Info;
	description = "Что ты надеешься найти здесь, в Долине Рудников?";
};


func int DIA_Biff_WASHIERIMTAL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Biff_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Biff_WASHIERIMTAL_Info()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_15_00");	//Что ты надеешься найти здесь, в Долине Рудников?
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_07_01");	//Золото и славу. Что же еще? Когда я покончу с драконами, я буду купаться в золоте.
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_07_02");	//У меня будет достаточно, чтобы провести остаток своей жизни, пытаясь посетить все таверны и бордели в стране.
	if(MIS_SCKnowsWayToIrdorath == TRUE)
	{
		B_LogEntry(Topic_Crew,"Охотник на драконов Бифф - типичный наемник. Если я заплачу ему, он будет сражаться вместе со мной.");
	}
	else
	{
		B_LogEntry(TOPIC_Dragonhunter,"Охотник на драконов Бифф - типичный наемник. Если я заплачу ему, он будет сражаться вместе со мной.");
	};
	Info_AddChoice(DIA_Biff_WASHIERIMTAL,"Что ж, тогда я желаю тебе удачи.",DIA_Biff_WASHIERIMTAL_vielglueck);
	Info_AddChoice(DIA_Biff_WASHIERIMTAL,"Ну да, либо это, либо ты станешь трупом!",DIA_Biff_WASHIERIMTAL_ihrtot);
};

func void DIA_Biff_WASHIERIMTAL_ihrtot()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_ihrtot_15_00");	//Ну да, либо это, либо ты станешь трупом!
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_ihrtot_07_01");	//И что? Это часть игры. Если ты хочешь стать богатым, ты должен рисковать.
	Info_ClearChoices(DIA_Biff_WASHIERIMTAL);
};

func void DIA_Biff_WASHIERIMTAL_vielglueck()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_vielglueck_15_00");	//Что ж, тогда я желаю тебе удачи.
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_vielglueck_07_01");	//Мне не нужна удача. Достаточно моего топора.
	Info_ClearChoices(DIA_Biff_WASHIERIMTAL);
};

func void B_StartBiffParty()
{
	DJG_BiffParty = TRUE;
	B_Biff_SetRefuseTalk();
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"Follow");
};

instance DIA_Biff_ARBEITEN(C_Info)
{
	npc = DJG_713_Biff;
	nr = 8;
	condition = DIA_Biff_ARBEITEN_Condition;
	information = DIA_Biff_ARBEITEN_Info;
	permanent = TRUE;
	description = "Ты бы не хотел поработать на меня?";
};


func int DIA_Biff_ARBEITEN_Condition()
{
	if((DJG_BiffParty == FALSE) && Npc_KnowsInfo(other,DIA_Biff_WASHIERIMTAL) && (DJG_Biff_Stay == FALSE) && (Biff_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Biff_ARBEITEN_Info()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_15_00");	//Ты бы не хотел поработать на меня?
	if((DJG_BiffParty_nomore >= 6) || (Biff_IsOnBoard == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_07_01");	//Мы уже как-то пытались. Из этого не вышло ничего хорошего. Так что спасибо, не хочу.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_07_02");	//Ммм. Почему бы и нет? Как будешь платить?
	};
	Info_ClearChoices(DIA_Biff_ARBEITEN);
	Info_AddChoice(DIA_Biff_ARBEITEN,"Считай, что тебе повезло, если я оставлю тебя в живых.",DIA_Biff_ARBEITEN_lebenlassen);
	Info_AddChoice(DIA_Biff_ARBEITEN,"Ты получишь половину добычи.",DIA_Biff_ARBEITEN_HalbeHalbe);
	Info_AddChoice(DIA_Biff_ARBEITEN,"Я заплачу тебе 100 золотых.",DIA_Biff_ARBEITEN_100);
};

func void DIA_Biff_ARBEITEN_100()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_100_15_00");	//Я заплачу тебе 100 золотых.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_100_07_01");	//Хорошо. Меня устраивает. Иди вперед. Я пойду за тобой.
		B_StartBiffParty();
	}
	else
	{
		B_Biff_Verarschen();
		AI_StopProcessInfos(self);
		DJG_BiffParty_nomore += 1;
	};
};

func void DIA_Biff_ARBEITEN_HalbeHalbe()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_HalbeHalbe_15_00");	//Ты получишь половину добычи.
	AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_01");	//Звучит заманчиво. Но предупреждаю тебя: не пытайся обмануть меня! Ты пожалеешь об этом!
	AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_02");	//И еще одно: мне не нужно оружие и другое барахло, что ты соберешь там. Меня интересует только золото! Понятно?
	DJG_Biff_HalbeHalbe = TRUE;
	B_StartBiffParty();
	if(DJG_Biff_HalbeHalbe_again == FALSE)
	{
		DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);
		DJG_Biff_HalbeHalbe_again = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_03");	//Но что я говорю. Ты уже знаешь все это.
	};
};

func void DIA_Biff_ARBEITEN_lebenlassen()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_lebenlassen_15_00");	//Считай, что тебе повезло, если я оставлю тебя в живых.
	B_Biff_Verarschen();
	AI_StopProcessInfos(self);
	DJG_BiffParty_nomore += 1;
};


var int BIFF_LABERT_GELDEINTREIBEN;

func void B_GiveBiffsAnteil()
{
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_geben_07_01");	//Хорошо. Тогда в путь.
	AI_StopProcessInfos(self);
	B_GiveInvItems(other,self,ItMi_Gold,BiffsAnteil);
	B_Biff_SetRefuseTalk();
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);
};

instance DIA_Biff_GELDEINTREIBEN(C_Info)
{
	npc = DJG_713_Biff;
	nr = 9;
	condition = DIA_Biff_GELDEINTREIBEN_Condition;
	information = DIA_Biff_GELDEINTREIBEN_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Biff_GELDEINTREIBEN_Condition()
{
	if(Npc_GetBodyState(hero) == BS_INVENTORY)
	{
		return FALSE;
	};
	if(Npc_GetBodyState(hero) == BS_MOBINTERACT_INTERRUPT)
	{
		return FALSE;
	};
	if((DJG_Biff_SCGold < (Npc_HasItems(hero,ItMi_Gold) - 1)) && ((Npc_GetBodyState(hero) != BS_STAND) || (BIFF_LABERT_GELDEINTREIBEN == TRUE)) && ((Npc_GetBodyState(hero) != BS_ITEMINTERACT) || (BIFF_LABERT_GELDEINTREIBEN == TRUE)) && (DJG_Biff_HalbeHalbe == TRUE) && (DJG_BiffParty == TRUE) && (DJG_Biff_Stay == FALSE))
	{
		BIFF_LABERT_GELDEINTREIBEN = TRUE;
		return TRUE;
	};
};

func void DIA_Biff_GELDEINTREIBEN_Info()
{
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_07_00");	//Минутку! Разве ты не говорил, что половина трофеев принадлежит мне? Давай ее сюда!
	B_BiffsAnteil_Berechnung();
	B_BiffsAnteil_PrintScreen();
	Info_ClearChoices(DIA_Biff_GELDEINTREIBEN);
	Info_AddChoice(DIA_Biff_GELDEINTREIBEN,"Я не могу позволить себе такие расходы.",DIA_Biff_GELDEINTREIBEN_zuTeuer);
	Info_AddChoice(DIA_Biff_GELDEINTREIBEN,"Вот твоя доля.",DIA_Biff_GELDEINTREIBEN_geben);
};

func void DIA_Biff_GELDEINTREIBEN_geben()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_geben_15_00");	//Вот твоя доля.
	B_GiveBiffsAnteil();
};

func void DIA_Biff_GELDEINTREIBEN_geben2()
{
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_15_02");	//Хорошо, похоже, у меня нет выбора. Давай разделим пополам.
	B_GiveBiffsAnteil();
};

func void DIA_Biff_GELDEINTREIBEN_zuTeuer()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_zuTeuer_15_00");	//Я не могу позволить себе такие расходы.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_zuTeuer_07_01");	//Хватит ныть. Мы договорились на половину.
	Info_ClearChoices(DIA_Biff_GELDEINTREIBEN);
	Info_AddChoice(DIA_Biff_GELDEINTREIBEN,"Боюсь, дальше наши пути расходятся.",DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen);
	Info_AddChoice(DIA_Biff_GELDEINTREIBEN,"Хорошо, похоже, у меня нет выбора. Давай разделим пополам.",DIA_Biff_GELDEINTREIBEN_geben2);
};

func void DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen()
{
	DIA_Common_ImAfraidThatsTheEndForUs();
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_07_01");	//Как скажешь. Тогда я заберу свою долю.
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_Attack(self,other,AR_NONE,1);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BiffParty = FALSE;
	DJG_Biff_HalbeHalbe = FALSE;
	DJG_BiffParty_nomore += 1;
};

func int B_GetBiffLocation(var int tolerance)
{
	if(Npc_GetDistToWP(self,"OC_CENTER_GUARD_02") < (4500 + tolerance))
	{	
		return LOC_BURG;
	};
	if(!Npc_IsDead(SwampDragon))
	{
		if(SwampDragon.flags != 0)
		{
			if(Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01") < (4000 + tolerance))
			{
				return LOC_SWAMP;
			};
		};
	};
	if(!Npc_IsDead(RockDragon))
	{
		if(RockDragon.flags != 0)
		{
			if(Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8") < (2000 + tolerance))
			{
				return LOC_ROCK;
			};
		};
	};
	if(!Npc_IsDead(FireDragon))
	{
		if(FireDragon.flags != 0)
		{
			if(Npc_GetDistToWP(self,"CASTLE_36") < (4000 + tolerance))
			{
				if(Npc_GetHeightToNpc(self,FireDragon) < 500)
				{
					return LOC_FIRE;
				};
			};
		};
	};
	if(!Npc_IsDead(IceDragon))
	{
		if(IceDragon.flags != 0)
		{
			if(Npc_GetDistToWP(self,"OW_ICEDRAGON_01") < (4000 + tolerance))
			{
				return LOC_ICE;
			};
		};
	};
	return LOC_NONE;
};

instance DIA_Biff_ICHBLEIBHIER(C_Info)
{
	npc = DJG_713_Biff;
	nr = 6;
	condition = DIA_Biff_ICHBLEIBHIER_Condition;
	information = DIA_Biff_ICHBLEIBHIER_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Biff_ICHBLEIBHIER_Condition()
{
	if(Npc_GetBodyState(hero) == BS_INVENTORY)
	{
		return FALSE;
	};
	if(Npc_GetBodyState(hero) == BS_MOBINTERACT_INTERRUPT)
	{
		return FALSE;
	};
	if((DJG_BiffParty == TRUE) && (DJG_Biff_Stay == FALSE))
	{
		var int location;
		location = B_GetBiffLocation(0);
		if(location == LOC_BURG)
		{
			return TRUE;
		};
		if(location == LOC_SWAMP)
		{
			return TRUE;
		};
		if(location == LOC_ROCK)
		{
			return TRUE;
		};
		if(location == LOC_FIRE)
		{
			return TRUE;
		};
		if(location == LOC_ICE)
		{
			return TRUE;
		};
	};
};

func void DIA_Biff_ICHBLEIBHIER_Info()
{
	var int location;
	location = B_GetBiffLocation(1000);
	AI_Output(self,other,"DIA_Biff_ICHBLEIBHIER_07_00");	//Очень опасная местность. Ты иди первым. А я буду прикрывать тебя сзади.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
	if(location == LOC_BURG)
	{
		Npc_ExchangeRoutine(self,"Stay_AwayFromOC");
	}
	else if(location == LOC_SWAMP)
	{
		Npc_ExchangeRoutine(self,"Stay_Swamp");
	}
	else if(location == LOC_ROCK)
	{
		Npc_ExchangeRoutine(self,"Stay_Rock");
	}
	else if(location == LOC_FIRE)
	{
		Npc_ExchangeRoutine(self,"Stay_Fire");
	}
	else if(location == LOC_ICE)
	{
		Npc_ExchangeRoutine(self,"Stay_Ice");
	};
	DJG_Biff_Stay = TRUE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);
};


instance DIA_Biff_Stay_AwayFromOC(C_Info)
{
	npc = DJG_713_Biff;
	nr = 3;
	condition = DIA_Biff_Stay_AwayFromOC_Condition;
	information = DIA_Biff_Stay_AwayFromOC_Info;
	permanent = TRUE;
	description = "Иди за мной!";
};


func int DIA_Biff_Stay_AwayFromOC_Condition()
{
	if((DJG_BiffParty == TRUE) && (DJG_Biff_Stay == TRUE))
	{
		if(Npc_GetDistToWP(self,"OW_PATH_298") < 500)
		{
			return TRUE;
		};
		if(Npc_GetDistToWP(self,"SWAMPDRAGON") < 500)
		{
			return TRUE;
		};
		if(Npc_GetDistToWP(self,"LOCATION_19_01") < 500)
		{
			return TRUE;
		};
		if(Npc_GetDistToWP(self,"CASTLE_14") < 500)
		{
			return TRUE;
		};
		if(Npc_GetDistToWP(self,"OW_ICEDRAGON_09") < 500)
		{
			return TRUE;
		};
	};
};

func void DIA_Biff_Stay_AwayFromOC_Info()
{
	B_KommMit();
	AI_WaitTillEnd(self,other);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
	DJG_Biff_Stay = FALSE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);
};


instance DIA_Biff_KOHLEWEGGEBEN(C_Info)
{
	npc = DJG_713_Biff;
	nr = 10;
	condition = DIA_Biff_KOHLEWEGGEBEN_Condition;
	information = DIA_Biff_KOHLEWEGGEBEN_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Biff_KOHLEWEGGEBEN_Condition()
{
	if(Npc_GetBodyState(hero) == BS_INVENTORY)
	{
		return FALSE;
	};
	if(Npc_GetBodyState(hero) == BS_MOBINTERACT_INTERRUPT)
	{
		return FALSE;
	};
	if((DJG_Biff_SCGold > Npc_HasItems(hero,ItMi_Gold)) && (DJG_Biff_HalbeHalbe == TRUE) && (DJG_BiffParty == TRUE) && (DJG_Biff_Stay == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_KOHLEWEGGEBEN_Info()
{
	AI_Output(self,other,"DIA_Biff_KOHLEWEGGEBEN_07_00");	//Не разбрасывай свое золото.
	AI_Output(self,other,"DIA_Biff_KOHLEWEGGEBEN_07_01");	//Лучше дай мне его сюда.
	AI_StopProcessInfos(self);
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);
};


instance DIA_Biff_BIFFLOSWERDEN(C_Info)
{
	npc = DJG_713_Biff;
	nr = 11;
	condition = DIA_Biff_BIFFLOSWERDEN_Condition;
	information = DIA_Biff_BIFFLOSWERDEN_Info;
	permanent = TRUE;
	description = "Я думаю, на этом наше сотрудничество можно считать оконченным.";
};


func int DIA_Biff_BIFFLOSWERDEN_Condition()
{
	if((DJG_BiffParty == TRUE) || (Biff_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Biff_BIFFLOSWERDEN_Info()
{
	AI_Output(other,self,"DIA_Biff_BIFFLOSWERDEN_15_00");	//Я думаю, на этом наше сотрудничество можно считать оконченным.
	AI_Output(self,other,"DIA_Biff_BIFFLOSWERDEN_07_01");	//Как знаешь. Я найду себе работу и получше. Бывай.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_Biff_HalbeHalbe = FALSE;
	DJG_BiffParty = FALSE;
	DJG_BiffParty_nomore += 1;
	if(Biff_IsOnBoard == LOG_SUCCESS)
	{
		Biff_IsOnBoard = LOG_FAILED;
		Biff_FollowsThroughPass = LOG_FAILED;
		Crewmember_Count -= 1;
	};
};


instance DIA_Biff_MEHRGELD(C_Info)
{
	npc = DJG_713_Biff;
	nr = 12;
	condition = DIA_Biff_MEHRGELD_Condition;
	information = DIA_Biff_MEHRGELD_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Biff_MEHRGELD_Condition()
{
	if((DJG_BiffParty == TRUE) && !Npc_RefuseTalk(self) && (DJG_Biff_Stay == FALSE) && (Biff_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int DIA_Biff_MEHRGELD_Info_OneTime;

func void DIA_Biff_MEHRGELD_Info()
{
	AI_Output(self,other,"DIA_Biff_MEHRGELD_07_00");	//Мне почему-то кажется, что я должен получить с тебя больше денег.
	if(DJG_Biff_HalbeHalbe == TRUE)
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_07_01");	//100 золотых будет достаточно.
		if(DIA_Biff_MEHRGELD_Info_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Biff_MEHRGELD_07_02");	//Не бойся. Я не забыл, что мы делим трофеи поровну.
			AI_Output(self,other,"DIA_Biff_MEHRGELD_07_03");	//Вот почему я не приставал к тебе с просьбами дать мне еще денег.
			DIA_Biff_MEHRGELD_Info_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_07_04");	//Я хочу еще 100 золотых.
	};
	Info_ClearChoices(DIA_Biff_MEHRGELD);
	Info_AddChoice(DIA_Biff_MEHRGELD,"Я не могу платить тебе.",DIA_Biff_MEHRGELD_zuTeuer);
	Info_AddChoice(DIA_Biff_MEHRGELD,"Хорошо. Ты этого стоишь.",DIA_Biff_MEHRGELD_ok);
};

func void DIA_Biff_MEHRGELD_ok()
{
	AI_Output(other,self,"DIA_Biff_MEHRGELD_ok_15_00");	//Хорошо. Ты этого стоишь.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_01");	//Да уж, это точно. Теперь пошли дальше.
		AI_StopProcessInfos(self);
		if(DJG_Biff_HalbeHalbe == TRUE)
		{
			DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);
		};
		B_Biff_SetRefuseTalk();
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_02");	//Ах ты, ничтожество! Ты даже не можешь заплатить компаньону.
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_03");	//Я думаю, мне стоит поискать другого партнера.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		DJG_Biff_HalbeHalbe = FALSE;
		DJG_BiffParty = FALSE;
		DJG_BiffParty_nomore += 2;
	};
};

func void DIA_Biff_MEHRGELD_zuTeuer()
{
	AI_Output(other,self,"DIA_Biff_MEHRGELD_zuTeuer_15_00");	//Я не могу платить тебе.
	AI_Output(self,other,"DIA_Biff_MEHRGELD_zuTeuer_07_01");	//Тогда тебе придется дальше топать в одиночку.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BiffParty = FALSE;
	DJG_BiffParty_nomore += 2;
};


func void B_Biff_NoTrankComment()
{
	var int randy;
	randy = Hlp_Random(2);
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_Biff_HEILUNG_HeilTrank_07_00");	//Я думаю, я могу подождать, когда ты раздобудешь его для меня.
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_HEILUNG_HeilTrankLow_07_00");	//К сожалению, его у тебя нет. Вернемся к этому вопросу позже.
	};
};

instance DIA_Biff_HEILUNG(C_Info)
{
	npc = DJG_713_Biff;
	nr = 4;
	condition = DIA_Biff_HEILUNG_Condition;
	information = DIA_Biff_HEILUNG_Info;
	permanent = TRUE;
	description = "Тебе нужно лечебное зелье?";
};


func int DIA_Biff_HEILUNG_Condition()
{
	if(DJG_BiffParty == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Biff_HEILUNG_Info()
{
	AI_Output(other,self,"DIA_Biff_HEILUNG_15_00");	//Тебе нужно лечебное зелье?
	AI_Output(self,other,"DIA_Biff_HEILUNG_07_01");	//Конечно. Не помешает.
	Info_ClearChoices(DIA_Biff_HEILUNG);
	Info_AddChoice(DIA_Biff_HEILUNG,"Я дам тебе что-нибудь позже.",DIA_Biff_HEILUNG_Spaeter);
	if(Npc_HasItems(other,ItPo_Health_Addon_04))
	{
		Info_AddChoice(DIA_Biff_HEILUNG,"(дать чистое здоровье)",DIA_Biff_HEILUNG_HeilTrankMax);
	};
	if(Npc_HasItems(other,ItPo_Health_03))
	{
		Info_AddChoice(DIA_Biff_HEILUNG,"(дать лечебный эликсир)",DIA_Biff_HEILUNG_HeilTrankHigh);
	};
	if(Npc_HasItems(other,ItPo_Health_02))
	{
		Info_AddChoice(DIA_Biff_HEILUNG,"(дать лечебный экстракт)",DIA_Biff_HEILUNG_HeilTrankMed);
	};
	if(Npc_HasItems(other,ItPo_Health_01))
	{
		Info_AddChoice(DIA_Biff_HEILUNG,"(дать лечебную эссенцию)",DIA_Biff_HEILUNG_HeilTrankLow);
	};
};

func void DIA_Biff_HEILUNG_HeilTrankMax()
{
	if(B_GiveInvItems(other,self,ItPo_Health_Addon_04,1))
	{
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			B_UseItem(self,ItPo_Health_Addon_04);
		};
	}
	else
	{
		B_Biff_NoTrankComment();
	};
	AI_StopProcessInfos(self);
};

func void DIA_Biff_HEILUNG_HeilTrankHigh()
{
	if(B_GiveInvItems(other,self,ItPo_Health_03,1))
	{
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			B_UseItem(self,ItPo_Health_03);
		};
	}
	else
	{
		B_Biff_NoTrankComment();
	};
	AI_StopProcessInfos(self);
};

func void DIA_Biff_HEILUNG_HeilTrankMed()
{
	if(B_GiveInvItems(other,self,ItPo_Health_02,1))
	{
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			B_UseItem(self,ItPo_Health_02);
		};
	}
	else
	{
		B_Biff_NoTrankComment();
	};
	AI_StopProcessInfos(self);
};

func void DIA_Biff_HEILUNG_HeilTrankLow()
{
	if(B_GiveInvItems(other,self,ItPo_Health_01,1))
	{
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			B_UseItem(self,ItPo_Health_01);
		};
	}
	else
	{
		B_Biff_NoTrankComment();
	};
	AI_StopProcessInfos(self);
};

func void DIA_Biff_HEILUNG_Spaeter()
{
	DIA_Common_IWillGiveYouSomethingLater();
	AI_Output(self,other,"DIA_Biff_HEILUNG_Spaeter_07_01");	//Только не забудь.
	AI_StopProcessInfos(self);
};


instance DIA_Biff_DRACHENTOT(C_Info)
{
	npc = DJG_713_Biff;
	nr = 5;
	condition = DIA_Biff_DRACHENTOT_Condition;
	information = DIA_Biff_DRACHENTOT_Info;
	description = "Вот так. Все драконы мертвы.";
};


func int DIA_Biff_DRACHENTOT_Condition()
{
	if(DJG_BiffSurvivedLastDragon == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Biff_DRACHENTOT_Info()
{
	AI_Output(other,self,"DIA_Biff_DRACHENTOT_15_00");	//Вот так. Все драконы мертвы.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_01");	//Да. И я все еще жив.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_02");	//Ты уверен, что это был последний?
	AI_Output(other,self,"DIA_Biff_DRACHENTOT_15_03");	//Думаю, да.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_04");	//Жаль. А я только размялся.
	B_GivePlayerXP(XP_BiffSurvivedLastDragon);
};


var int Biff_ToldLaterOnce;

instance DIA_Biff_KnowWhereEnemy(C_Info)
{
	npc = DJG_713_Biff;
	nr = 2;
	condition = DIA_Biff_KnowWhereEnemy_Condition;
	information = DIA_Biff_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Ты не хотел бы совершить небольшое путешествие по миру?";
};


func int DIA_Biff_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && ((Biff_IsOnBoard == FALSE) || (Biff_IsOnBoard == LOG_OBSOLETE)) && Npc_KnowsInfo(other,DIA_Biff_WASHIERIMTAL))
	{
		return TRUE;
	};
};

func void DIA_Biff_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_00");	//Ты не хотел бы совершить небольшое путешествие по миру?
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_07_01");	//Что?
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_02");	//Ничего. Мой корабль все равно полон.
		AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_07_03");	//Тогда не беспокой меня попусту.
	}
	else
	{
		if(Biff_ToldLaterOnce == FALSE)
		{
			AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_04");	//Я собираюсь покинуть Хоринис и отправиться на другой остров. Там должны быть еще враги.
			Biff_ToldLaterOnce = TRUE;
		}
		else
		{
			AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_No_15_00");	//Мне казалось, я уже говорил об этом.
		};
		Info_ClearChoices(DIA_Biff_KnowWhereEnemy);
		Info_AddChoice(DIA_Biff_KnowWhereEnemy,"Вернемся к этому позже.",DIA_Biff_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Biff_KnowWhereEnemy,"Ты не хочешь присоединиться?",DIA_Biff_KnowWhereEnemy_Yes);
	};
};

func void DIA_Biff_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_00");	//Ты не хочешь присоединиться?
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_01");	//Меня не волнуют враги. Мне нужно...
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_02");	//Там, куда мы направляемся, больше золота, чем ты сможешь унести.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_03");	//В таком случае, я в деле. Куда мы направляемся?
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_04");	//Сначала нам нужно выбраться из Долины Рудников.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_05");	//Нет проблем. Я уже в пути. Встретимся у Прохода.
	B_LogEntry(Topic_Crew,"Перспектива разбогатеть убедила Биффа присоединиться ко мне. Пока он получает достаточно золота, я могу рассчитывать на него.");
	Biff_FollowsThroughPass = LOG_Running;
	B_JoinShip(self);
};

func void DIA_Biff_KnowWhereEnemy_No()
{
	DIA_Common_WeWillGetToThatLater();
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_No_07_01");	//Да, да. Тогда повеселимся.
	Biff_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Biff_KnowWhereEnemy);
};


instance DIA_Biff_Pass(C_Info)
{
	npc = DJG_713_Biff;
	nr = 55;
	condition = DIA_Biff_Pass_Condition;
	information = DIA_Biff_Pass_Info;
	permanent = TRUE;
	description = "Ты пройдешь сам через Проход?";
};


func int DIA_Biff_Pass_Condition()
{
	if((Npc_GetDistToWP(self,"START") < 1000) && (Biff_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Biff_Pass_Info()
{
	AI_Output(other,self,"DIA_Biff_Pass_15_00");	//Ты пройдешь сам через Проход?
	AI_Output(self,other,"DIA_Biff_Pass_07_01");	//Хватит болтать. Пошли. Я хочу, наконец, опять начать действовать.
	AI_StopProcessInfos(self);
};


instance DIA_Biff_StillNeedYou(C_Info)
{
	npc = DJG_713_Biff;
	nr = 55;
	condition = DIA_Biff_StillNeedYou_Condition;
	information = DIA_Biff_StillNeedYou_Info;
	permanent = FALSE;
	description = "Ты все еще заинтересован в месте на корабле?";
};


func int DIA_Biff_StillNeedYou_Condition()
{
	if((Biff_IsOnBoard == LOG_FAILED) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Biff_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Lares_StillNeedYou_15_00");	//Ты все еще заинтересован в месте на корабле?
	B_Biff_Verarschen();
	AI_StopProcessInfos(self);
};

