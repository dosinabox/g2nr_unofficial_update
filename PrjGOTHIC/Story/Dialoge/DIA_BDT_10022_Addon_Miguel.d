
instance DIA_Addon_Miguel_EXIT(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 999;
	condition = DIA_Addon_Miguel_EXIT_Condition;
	information = DIA_Addon_Miguel_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Miguel_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Miguel_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Miguel_PICKPOCKET(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 900;
	condition = DIA_Addon_Miguel_PICKPOCKET_Condition;
	information = DIA_Addon_Miguel_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Miguel_PICKPOCKET_Condition()
{
	return C_Beklauen(40,48);
};

func void DIA_Addon_Miguel_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Miguel_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Miguel_PICKPOCKET,Dialog_Back,DIA_Addon_Miguel_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Miguel_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Miguel_PICKPOCKET_DoIt);
};

func void DIA_Addon_Miguel_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Miguel_PICKPOCKET);
};

func void DIA_Addon_Miguel_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Miguel_PICKPOCKET);
};


instance DIA_Addon_Miguel_Hi(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 1;
	condition = DIA_Addon_Miguel_Hi_Condition;
	information = DIA_Addon_Miguel_Hi_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Addon_Miguel_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Miguel_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_00");	//Что ты здесь делаешь?
	if(Wld_IsTime(6,0,22,0))
	{
		AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_01");	//Ищешь что-нибудь?
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_02");	//Растения. Я ищу растения.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_03");	//Обычно я ищу растения.
	};
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_04");	//Большинство из них можно использовать.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_05");	//Многие растения имеют лечебные свойства, а из болотной травы получаются отличные косяки.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_06");	//До того как я попал за Барьер, я работал алхимиком.
};


instance DIA_Addon_Miguel_Story(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 2;
	condition = DIA_Addon_Miguel_Story_Condition;
	information = DIA_Addon_Miguel_Story_Info;
	permanent = FALSE;
	description = "А почему ты оказался за Барьером?";
};


func int DIA_Addon_Miguel_Story_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_Story_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Story_15_00");	//А почему ты оказался за Барьером?
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_01");	//Я много работал над зельями, воздействующими на разум.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_02");	//Однажды вечером мой начальник Игнац выпил результат моего 'эксперимента' вместо своего вина.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_03");	//Это сделало его... э-э... непредсказуемым на некоторое время, и с тех пор он немного не в себе.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_04");	//(фальшиво) За это маги бросили меня за Барьер. 'Исследования запрещенных знаний,' - вот как они это назвали.
};


instance DIA_Addon_Miguel_Lager(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 3;
	condition = DIA_Addon_Miguel_Lager_Condition;
	information = DIA_Addon_Miguel_Lager_Info;
	permanent = FALSE;
	description = "Расскажи мне про лагерь.";
};


func int DIA_Addon_Miguel_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_Miguel_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Lager_15_00");	//Расскажи мне про лагерь.
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_01");	//Я знаю немного. Сам я никогда там не был.
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_02");	//Только люди Ворона были там с самого начала. Все остальные, те, кто пришел позже, как я, должны ждать, пока им не понадобятся новые люди.
};


instance DIA_Addon_Miguel_WhereFrom(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 4;
	condition = DIA_Addon_Miguel_WhereFrom_Condition;
	information = DIA_Addon_Miguel_WhereFrom_Info;
	permanent = FALSE;
	description = "Откуда ты пришел?";
};


func int DIA_Addon_Miguel_WhereFrom_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Hi) || Npc_KnowsInfo(other,DIA_Addon_Miguel_Lager))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_WhereFrom_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_00");	//Откуда ты пришел?
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_01");	//Ну, оттуда же, откуда и ты, я думаю. С пиратами. Через море.
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_02");	//Мы находимся на острове. Здесь нет другой связи с материком.
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_03");	//(задумчиво) Верно.
};


instance DIA_Addon_Miguel_Angefordert(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 4;
	condition = DIA_Addon_Miguel_Angefordert_Condition;
	information = DIA_Addon_Miguel_Angefordert_Info;
	permanent = FALSE;
	description = "Когда им бывают нужны новые люди?";
};


func int DIA_Addon_Miguel_Angefordert_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Lager))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_Angefordert_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Angefordert_15_00");	//Когда им бывают нужны новые люди?
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_01");	//Ну, когда они кого-нибудь теряют.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_02");	//Если рудокопа съедает краулер, утраченного работника заменяют одним из нас.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_03");	//Иногда они и сами друг друга убивают. Но в последнее время с этим полегче.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_04");	//Ворон каким-то образом установил контроль над шахтой, так чтобы все сразу не могли туда попасть.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_05");	//Но я не знаю, что именно он сделал. Я никогда не был внутри.
};


instance DIA_Addon_Miguel_Fortuno(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 6;
	condition = DIA_Addon_Miguel_Fortuno_Condition;
	information = DIA_Addon_Miguel_Fortuno_Info;
	permanent = FALSE;
	description = "Насчет Фортуно...";
};


func int DIA_Addon_Miguel_Fortuno_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fortuno_FREE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_Fortuno_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_00");	//У Фортуно не все в порядке с головой, он мог бы выпить зелье и вернуть себе память.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_01");	//Фортуно? Это слуга Ворона, да?
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_02");	//Он был им. Теперь он просто чурбан. И это ошибка Ворона.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_03");	//Ворона? Хм, до сих пор я думал о нем лучше. М-м, ну ладно. Но здесь, в болоте, я не могу сварить зелье.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_04");	//Я могу сварить зелье. В лагере есть стол алхимика. Мне нужен только рецепт.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_05");	//Будь осторожен с этим рецептом. Это зелье может быть опасно.
	B_GiveInvItems(self,other,ITWr_Addon_MCELIXIER_01,1);
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_06");	//Если ты как-то не так его сваришь, или возьмешь не тот ингредиент, он может быть смертельным.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_07");	//Я буду осторожен.
	B_LogEntry(Topic_Addon_Fortuno,"Мигель дал мне рецепт зелья, которое вернет Фортуно память. Но я должен быть уверен во всех ингредиентах, иначе у меня получится смертельный яд.");
};


instance DIA_Addon_Miguel_BRAU(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 7;
	condition = DIA_Addon_Miguel_BRAU_Condition;
	information = DIA_Addon_Miguel_BRAU_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня кое-чему?";
};


func int DIA_Addon_Miguel_BRAU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_Story))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_BRAU_Info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_BRAU_15_00");	//Ты можешь научить меня кое-чему?
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_01");	//У меня нет времени. Мне нужно зарабатывать золото. И пока я не могу попасть в лагерь, я живу, продавая растения.
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_02");	//Но если тебе нужны зелья, у меня пока еще есть несколько.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"У Мигеля я могу покупать зелья и травы.");
};


instance DIA_Addon_Miguel_trade(C_Info)
{
	npc = BDT_10022_Addon_Miguel;
	nr = 888;
	condition = DIA_Addon_Miguel_trade_Condition;
	information = DIA_Addon_Miguel_trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int DIA_Addon_Miguel_trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Miguel_BRAU))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_trade_Info()
{
	B_Say(other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};

