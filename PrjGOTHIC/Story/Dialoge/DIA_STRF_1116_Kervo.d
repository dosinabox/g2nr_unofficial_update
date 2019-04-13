
instance DIA_Kervo_EXIT(C_Info)
{
	npc = STRF_1116_Kervo;
	nr = 999;
	condition = DIA_Kervo_EXIT_Condition;
	information = DIA_Kervo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kervo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kervo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Kervo_WASIST(C_Info)
{
	npc = STRF_1116_Kervo;
	nr = 4;
	condition = DIA_Kervo_WASIST_Condition;
	information = DIA_Kervo_WASIST_Info;
	description = "Да что с тобой?";
};


func int DIA_Kervo_WASIST_Condition()
{
	return TRUE;
};

func void DIA_Kervo_WASIST_Info()
{
	AI_Output(other,self,"DIA_Kervo_WASIST_15_00");	//Да что с тобой?
	AI_Output(self,other,"DIA_Kervo_WASIST_13_01");	//Ты еще спрашиваешь? Ты только вокруг посмотри!
	AI_Output(self,other,"DIA_Kervo_WASIST_13_02");	//Эти чертовы луркеры заняли всю реку с тех пор, как я пришел сюда.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_03");	//Сначала их было всего двое. Но вчера я насчитал уже пять.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_04");	//Теперь я не знаю, как мне удастся выбраться отсюда.
};


instance DIA_Kervo_HILFE(C_Info)
{
	npc = STRF_1116_Kervo;
	nr = 5;
	condition = DIA_Kervo_HILFE_Condition;
	information = DIA_Kervo_HILFE_Info;
	description = "Ты пытался пробраться через Проход?";
};


func int DIA_Kervo_HILFE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kervo_WASIST))
	{
		return TRUE;
	};
};

func void DIA_Kervo_HILFE_Info()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_15_00");	//Ты пытался пробраться через Проход?
	AI_Output(self,other,"DIA_Kervo_HILFE_13_01");	//Я что, по-твоему, из ума выжил? Даже 20 солдат не вытащат меня отсюда, пока эти твари бродят там. Ненавижу их.
	AI_Output(self,other,"DIA_Kervo_HILFE_13_02");	//Стоит мне почувствовать их запах, и я покрываюсь холодным потом. А от их похрюкивания кровь стынет в моих венах.
	AI_Output(self,other,"DIA_Kervo_HILFE_13_03");	//Если тебе так хочется, чтобы с тебя содрали шкуру заживо, можешь рискнуть.
	Info_ClearChoices(DIA_Kervo_HILFE);
	Info_AddChoice(DIA_Kervo_HILFE,"Ладно. Я ухожу.",DIA_Kervo_HILFE_tschau);
	Info_AddChoice(DIA_Kervo_HILFE,"Но ты же не можешь оставаться здесь вечно.",DIA_Kervo_HILFE_ewig);
	if(Kervo_GotStuff == TRUE)
	{
		Info_AddChoice(DIA_Kervo_HILFE,"Что ты мне дашь, если я убью этих тварей?",DIA_Kervo_HILFE_Problem);
	};
	MIS_Kervo_KillLurker = LOG_Running;
};

func void DIA_Kervo_HILFE_ewig()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_ewig_15_00");	//Но ты же не можешь оставаться здесь вечно.
	AI_Output(self,other,"DIA_Kervo_HILFE_ewig_13_01");	//Я не знаю, что тебе нужно от меня, но я могу сказать тебе одно: ты не заставишь меня уйти отсюда.
};


var int Kervo_PromiseNugget;

func void DIA_Kervo_HILFE_Problem()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_Problem_15_00");	//Что ты мне дашь, если я убью этих тварей?
	AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_01");	//Ммм. Ну. Я был бы не прочь, чтобы эти луркеры, что бродят перед пещерой, исчезли.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_02");	//Я нашел чистый рунный камень. Ты ведь маг. Я уверен, ты найдешь применение ему.
	}
	else
	{
		AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_03");	//Я нашел кусок руды.
	};
	AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_04");	//Я отдам тебе его.
	Kervo_PromiseNugget = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kervo_HILFE_tschau()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_tschau_15_00");	//Ладно. Я ухожу.
	AI_Output(self,other,"DIA_Kervo_HILFE_tschau_13_01");	//Как знаешь. Я тебя удерживать не буду.
	AI_StopProcessInfos(self);
};


instance DIA_Kervo_LurkerPlatt(C_Info)
{
	npc = STRF_1116_Kervo;
	condition = DIA_Kervo_LurkerPlatt_Condition;
	information = DIA_Kervo_LurkerPlatt_Info;
	description = "Луркеров больше нет.";
};


func int DIA_Kervo_LurkerPlatt_Condition()
{
	if((MIS_Kervo_KillLurker == LOG_Running) && Npc_IsDead(Kervo_Lurker1) && Npc_IsDead(Kervo_Lurker2) && Npc_IsDead(Kervo_Lurker3) && Npc_IsDead(Kervo_Lurker4) && Npc_IsDead(Kervo_Lurker5) && Npc_IsDead(Kervo_Lurker6))
	{
		return TRUE;
	};
};

func void DIA_Kervo_LurkerPlatt_Info()
{
	AI_Output(other,self,"DIA_Kervo_LurkerPlatt_15_00");	//Луркеров больше нет.
	AI_Output(self,other,"DIA_Kervo_LurkerPlatt_13_01");	//Отлично. Теперь я опять смогу спать спокойно.
	if(Kervo_PromiseNugget == TRUE)
	{
		AI_Output(self,other,"DIA_Kervo_LurkerPlatt_13_02");	//Вот то, что я обещал тебе.
		if(hero.guild == GIL_KDF)
		{
			B_GiveInvItems(self,other,ItMi_RuneBlank,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItMi_Nugget,1);
		};
	};
	B_GivePlayerXP(XP_KervoKillLurker);
	MIS_Kervo_KillLurker = LOG_SUCCESS;
};


instance DIA_Kervo_VERGISSES(C_Info)
{
	npc = STRF_1116_Kervo;
	condition = DIA_Kervo_VERGISSES_Condition;
	information = DIA_Kervo_VERGISSES_Info;
	permanent = TRUE;
	description = "Ты теперь пойдешь к Проходу?";
};


func int DIA_Kervo_VERGISSES_Condition()
{
	if(MIS_Kervo_KillLurker == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Kervo_VERGISSES_Info()
{
	AI_Output(other,self,"DIA_Kervo_VERGISSES_15_00");	//Ты теперь пойдешь к Проходу?
	AI_Output(self,other,"DIA_Kervo_VERGISSES_13_01");	//Забудь об этом, парень. Если меня поймают, то опять заставят работать в шахте. Я останусь здесь.
	AI_StopProcessInfos(self);
};


instance DIA_Kervo_PICKPOCKET(C_Info)
{
	npc = STRF_1116_Kervo;
	nr = 900;
	condition = DIA_Kervo_PICKPOCKET_Condition;
	information = DIA_Kervo_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Kervo_PICKPOCKET_Condition()
{
	return C_Beklauen(34,10);
};

func void DIA_Kervo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kervo_PICKPOCKET);
	Info_AddChoice(DIA_Kervo_PICKPOCKET,Dialog_Back,DIA_Kervo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kervo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Kervo_PICKPOCKET_DoIt);
};

func void DIA_Kervo_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kervo_PICKPOCKET);
};

func void DIA_Kervo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kervo_PICKPOCKET);
};

