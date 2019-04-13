
instance DIA_Bronko_EXIT(C_Info)
{
	npc = BAU_935_Bronko;
	nr = 999;
	condition = DIA_Bronko_EXIT_Condition;
	information = DIA_Bronko_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bronko_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bronko_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bronko_HALLO(C_Info)
{
	npc = BAU_935_Bronko;
	nr = 1;
	condition = DIA_Bronko_HALLO_Condition;
	information = DIA_Bronko_HALLO_Info;
	important = TRUE;
};


func int DIA_Bronko_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Bronko_HALLO_Info()
{
	AI_Output(self,other,"DIA_Bronko_HALLO_06_00");	//(отечески) И куда это мы направляемся, а?
	AI_Output(other,self,"DIA_Bronko_HALLO_15_01");	//А ты что, здесь старший?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_06_02");	//Сейчас в морду получишь, придурок.
	};
	AI_Output(self,other,"DIA_Bronko_HALLO_06_03");	//Если ты хочешь свободно ходить по моей земле, ты должен заплатить мне 5 золотых, или душу из тебя вытрясу!
	Info_ClearChoices(DIA_Bronko_HALLO);
	Info_AddChoice(DIA_Bronko_HALLO,"Забудь об этом. Ты ничего не получишь от меня.",DIA_Bronko_HALLO_vergisses);
	Info_AddChoice(DIA_Bronko_HALLO,"Похоже, у меня нет выбора - вот твои деньги.",DIA_Bronko_HALLO_hiergeld);
	Info_AddChoice(DIA_Bronko_HALLO,"Твоей земле? Ты что, местный фермер?",DIA_Bronko_HALLO_deinland);
};

func void DIA_Bronko_HALLO_deinland()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_deinland_15_00");	//Твоей земле? Ты что, местный фермер?
	AI_Output(self,other,"DIA_Bronko_HALLO_deinland_06_01");	//Естественно. А почему еще ты должен платить мне пошлину?
	AI_Output(self,other,"DIA_Bronko_HALLO_deinland_06_02");	//Я не возражаю, если ты поспрашиваешь остальных обо мне. Хе-хе!
};

func void DIA_Bronko_HALLO_hiergeld()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_hiergeld_15_00");	//Похоже, у меня нет выбора - вот твои деньги.
	if(Npc_HasItems(other,ItMi_Gold) >= 5)
	{
		B_GiveInvItems(other,self,ItMi_Gold,5);
		AI_Output(self,other,"DIA_Bronko_HALLO_hiergeld_06_01");	//(притворно) Спасибо. Удачного пути.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_hiergeld_06_02");	//У тебя нет даже 5 монет. Ты хочешь надуть меня?
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};

func void DIA_Bronko_HALLO_vergisses()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_vergisses_15_00");	//Забудь об этом. Ты ничего не получишь от меня.
	if((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_01");	//Тогда, боюсь, мне придется набить тебе морду.
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_02");	//У вас, парней из городской стражи, плохо с финансами, ха?
		};
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_03");	//Меня не волнует, что ты маг. Тебе придется заплатить. Понятно?
		};
	};
	Info_ClearChoices(DIA_Bronko_HALLO);
	Info_AddChoice(DIA_Bronko_HALLO,"Похоже, у меня нет выбора - вот твои деньги.",DIA_Bronko_HALLO_hiergeld);
	Info_AddChoice(DIA_Bronko_HALLO,"Тогда попробуй, возьми их сам.",DIA_Bronko_HALLO_attack);
};

func void DIA_Bronko_HALLO_attack()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_attack_15_00");	//Тогда попробуй, возьми их сам.
	AI_Output(self,other,"DIA_Bronko_HALLO_attack_06_01");	//Ну, раз ты так...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Bronko_KEINBAUER(C_Info)
{
	npc = BAU_935_Bronko;
	nr = 2;
	condition = DIA_Bronko_KEINBAUER_Condition;
	information = DIA_Bronko_KEINBAUER_Info;
	permanent = TRUE;
	description = "Ты?! Фермер?! Не смеши меня.";
};


var int DIA_Bronko_KEINBAUER_noPerm;

func int DIA_Bronko_KEINBAUER_Condition()
{
	if(((MIS_Sekob_Bronko_eingeschuechtert == LOG_Running) || (Babera_BronkoKeinBauer == TRUE)) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST) && (DIA_Bronko_KEINBAUER_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bronko_KEINBAUER_Info()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_15_00");	//Ты?! Фермер?! Не смеши меня. Да ты вообще никто.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_06_01");	//Чтоооо? Хочешь получить по морде?
	Info_ClearChoices(DIA_Bronko_KEINBAUER);
	if(hero.guild == GIL_NONE)
	{
		if(Babera_BronkoKeinBauer == TRUE)
		{
			Info_AddChoice(DIA_Bronko_KEINBAUER,"(пригрозить Бронко наемниками)",DIA_Bronko_KEINBAUER_SLD);
		};
		if(MIS_Sekob_Bronko_eingeschuechtert == LOG_Running)
		{
			Info_AddChoice(DIA_Bronko_KEINBAUER,"Фермер здесь - Секоб, а ты просто мелкий жулик.",DIA_Bronko_KEINBAUER_sekobderbauer);
		};
	};
	Info_AddChoice(DIA_Bronko_KEINBAUER,"Ну... Давай посмотрим, что ты можешь.",DIA_Bronko_KEINBAUER_attack);
	Info_AddChoice(DIA_Bronko_KEINBAUER,"Забудь!",DIA_Bronko_KEINBAUER_schongut);
};

func void DIA_Bronko_KEINBAUER_attack()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_attack_15_00");	//Ну... Давай посмотрим, что ты можешь.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_attack_06_01");	//Я надеялся, что ты скажешь это.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Bronko_KEINBAUER_sekobderbauer()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_sekobderbauer_15_00");	//Фермер здесь - Секоб, а ты просто мелкий жулик, который пытается обманом вытянуть деньги из кошельков простых людей.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_sekobderbauer_06_01");	//Кто это сказал?
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_sekobderbauer_15_02");	//Я сказал. Секоб хочет, чтобы ты вернулся к работе, а не шлялся здесь без дела.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_sekobderbauer_06_03");	//И что? Что ты теперь будешь делать?
};

func void DIA_Bronko_KEINBAUER_schongut()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_schongut_15_00");	//Забудь!
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_schongut_06_01");	//Проваливай!
	AI_StopProcessInfos(self);
};

func void DIA_Bronko_KEINBAUER_SLD()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_SLD_15_00");	//Хорошо, тогда, пожалуй, мне придется сказать Онару, что здесь есть наглый фермер, который отказывается платить ренту.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_01");	//Черт. Подожди минутку. Онар пошлет сюда наемников.
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_SLD_15_02");	//И что?
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_03");	//Хорошо, хорошо. Я дам тебе все, что ты захочешь, но только не вмешивай в это дело наемников, хорошо?
	if(B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold)))
	{
		AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_04");	//Вот, я даже отдам тебе все мое золото.
	};
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_05");	//И я вернусь в поле и буду работать. Все, что угодно, только не надо наемников.
	AI_StopProcessInfos(self);
	DIA_Bronko_KEINBAUER_noPerm = TRUE;
	Npc_ExchangeRoutine(self,"Start");
	MIS_Sekob_Bronko_eingeschuechtert = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bronko_FLEISSIG(C_Info)
{
	npc = BAU_935_Bronko;
	nr = 3;
	condition = DIA_Bronko_FLEISSIG_Condition;
	information = DIA_Bronko_FLEISSIG_Info;
	permanent = TRUE;
	description = "(подразнить Бронко)";
};


func int DIA_Bronko_FLEISSIG_Condition()
{
	if((MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS) || (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{
		return TRUE;
	};
};

func void DIA_Bronko_FLEISSIG_Info()
{
	if(MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Bronko_FLEISSIG_15_00");	//Как дела? Работаешь как пчелка, да?
	}
	else
	{
		AI_Output(other,self,"DIA_Bronko_FLEISSIG_15_01");	//Как дела? Желание трепаться еще не пропало?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_02");	//Ты наемник, да? Я мог бы догадаться.
	}
	else if(MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_03");	//(в страхе) Ты ведь не приведешь сюда этих наемников, да?
	};
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_04");	//Не бей меня, пожалуйста.
	};
	AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_05");	//Я даже вернусь к работе, хорошо?
	MIS_Sekob_Bronko_eingeschuechtert = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Bronko_PICKPOCKET(C_Info)
{
	npc = BAU_935_Bronko;
	nr = 900;
	condition = DIA_Bronko_PICKPOCKET_Condition;
	information = DIA_Bronko_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Bronko_PICKPOCKET_Condition()
{
	return C_Beklauen(54,80);
};

func void DIA_Bronko_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bronko_PICKPOCKET);
	Info_AddChoice(DIA_Bronko_PICKPOCKET,Dialog_Back,DIA_Bronko_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bronko_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bronko_PICKPOCKET_DoIt);
};

func void DIA_Bronko_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bronko_PICKPOCKET);
};

func void DIA_Bronko_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bronko_PICKPOCKET);
};

