
instance DIA_Fester_EXIT(C_Info)
{
	npc = Sld_816_Fester;
	nr = 999;
	condition = DIA_Fester_EXIT_Condition;
	information = DIA_Fester_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fester_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fester_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Fester_Hello(C_Info)
{
	npc = Sld_816_Fester;
	nr = 1;
	condition = DIA_Fester_Hello_Condition;
	information = DIA_Fester_Hello_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Fester_Hello_Condition()
{
	return TRUE;
};

func void DIA_Fester_Hello_Info()
{
	AI_Output(other,self,"DIA_Fester_Hello_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Fester_Hello_08_01");	//Я готовлюсь к бою...
};


instance DIA_Fester_Auftrag(C_Info)
{
	npc = Sld_816_Fester;
	nr = 2;
	condition = DIA_Fester_Auftrag_Condition;
	information = DIA_Fester_Auftrag_Info;
	permanent = FALSE;
	description = "Почему?";
};


func int DIA_Fester_Auftrag_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fester_Hello))
	{
		return TRUE;
	};
};

func void DIA_Fester_Auftrag_Info()
{
	AI_Output(other,self,"DIA_Fester_Auftrag_15_00");	//Зачем?
	AI_Output(self,other,"DIA_Fester_Auftrag_08_01");	//Последнее время у фермеров все больше с полевыми хищниками.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_02");	//Нескольких крестьян эти твари даже съели.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_03");	//А этот жирный Онар не видит здесь никакой проблемы. Нам не платят жалование уже неделю.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_04");	//И в этом есть моя вина. Теперь Ли хочет, чтобы я лично уничтожил гнездо этих тварей.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_05");	//А остальные наемники уже делают ставки, удастся мне выжить или нет...
};


instance DIA_Fester_YouFight(C_Info)
{
	npc = Sld_816_Fester;
	nr = 3;
	condition = DIA_Fester_YouFight_Condition;
	information = DIA_Fester_YouFight_Info;
	permanent = FALSE;
	description = "Ты хороший боец?";
};


func int DIA_Fester_YouFight_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && Npc_KnowsInfo(other,DIA_Fester_Hello) && (MIS_Fester_KillBugs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fester_YouFight_Info()
{
	AI_Output(other,self,"DIA_Fester_YouFight_15_00");	//Ты хороший боец?
	AI_Output(self,other,"DIA_Fester_YouFight_08_01");	//Я неплохо умею обращаться с мечом, а лук это вообще мой конек! А почему ты спрашиваешь?
};


instance DIA_Fester_WoNest(C_Info)
{
	npc = Sld_816_Fester;
	nr = 4;
	condition = DIA_Fester_WoNest_Condition;
	information = DIA_Fester_WoNest_Info;
	permanent = FALSE;
	description = "Где это гнездо?";
};


func int DIA_Fester_WoNest_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fester_Auftrag) && (MIS_Fester_KillBugs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fester_WoNest_Info()
{
	AI_Output(other,self,"DIA_Fester_WoNest_15_00");	//Где это гнездо?
	AI_Output(self,other,"DIA_Fester_WoNest_08_01");	//В центре поля вон там, вон в той большой скале.
};


var int Fester_Choice;
const int FC_Gold = 0;
const int FC_Join = 1;

instance DIA_Fester_Together(C_Info)
{
	npc = Sld_816_Fester;
	nr = 5;
	condition = DIA_Fester_Together_Condition;
	information = DIA_Fester_Together_Info;
	permanent = FALSE;
	description = "Мы могли бы  атаковать это гнездо вместе...";
};


func int DIA_Fester_Together_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && Npc_KnowsInfo(other,DIA_Fester_Auftrag))
	{
		return TRUE;
	};
};

func void DIA_Fester_Together_Info()
{
	AI_Output(other,self,"DIA_Fester_Together_15_00");	//Мы могли бы  атаковать это гнездо вместе...
	AI_Output(self,other,"DIA_Fester_Together_08_01");	//Ты хочешь помочь мне? Почему?
	Info_ClearChoices(DIA_Fester_Together);
	Info_AddChoice(DIA_Fester_Together,"Я хочу получить за это золото!",DIA_Fester_Together_Gold);
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(DIA_Fester_Together,"Я хочу присоединиться к вам!",DIA_Fester_Together_Join);
	};
};

func void DIA_Fester_Together_Join()
{
	AI_Output(other,self,"DIA_Fester_Together_Join_15_00");	//Я хочу присоединиться к вам!
	AI_Output(self,other,"DIA_Fester_Together_Join_08_01");	//Ох, тогда ладно. Ты хочешь показать, что ты хороший боец...
	AI_Output(self,other,"DIA_Fester_Together_Join_08_02");	//(лукаво) Хорошо, давай расправимся с этими тварями вместе.
	Fester_Choice = FC_Join;
	Info_ClearChoices(DIA_Fester_Together);
};

func void DIA_Fester_Together_Gold()
{
	AI_Output(other,self,"DIA_Fester_Together_Gold_15_00");	//Я хочу получить за это золото!
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_01");	//(смеется) Ах ты шельмец! Ты хочешь воспользоваться моим положением, ха?
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_02");	//То есть, либо я заплачу тебе, либо отправлюсь к праотцам?
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_03");	//Хорошо. Я могу заплатить тебе 50 золотых - это все, что у меня есть.
	Fester_Choice = FC_Gold;
	Info_ClearChoices(DIA_Fester_Together);
};


var int Fester_Losgeh_Day;

instance DIA_Fester_TogetherNOW(C_Info)
{
	npc = Sld_816_Fester;
	nr = 6;
	condition = DIA_Fester_TogetherNOW_Condition;
	information = DIA_Fester_TogetherNOW_Info;
	permanent = TRUE;
	description = "Давай атаковать гнездо!";
};


func int DIA_Fester_TogetherNOW_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && Npc_KnowsInfo(other,DIA_Fester_Together) && (MIS_Fester_KillBugs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fester_TogetherNOW_Info()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_15_00");	//Давай атаковать гнездо!
	if(Wld_IsTime(20,30,6,0))
	{
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_01");	//В темноте? Нет, нам лучше дождаться рассвета.
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_02");	//Прямо сейчас? А может, тебе сначала раздобыть снаряжение получше?
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_03");	//Ты мог бы сходить сначала на ферму...
		Info_ClearChoices(DIA_Fester_TogetherNOW);
		Info_AddChoice(DIA_Fester_TogetherNOW,"Хорошо, давай подождем еще немного...",DIA_Fester_TogetherNOW_Later);
		Info_AddChoice(DIA_Fester_TogetherNOW,"Лучшей возможности, чем сейчас, не будет.",DIA_Fester_TogetherNOW_NOW);
	};
};

func void DIA_Fester_TogetherNOW_NOW()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_Now_15_00");	//Лучшей возможности, чем сейчас, не будет.
	AI_Output(self,other,"DIA_Fester_TogetherNOW_Now_08_01");	//Хорошо, давай посмотрим, на что ты способен.
	Npc_ExchangeRoutine(self,"GUIDE");
	Fester_Losgeh_Day = B_GetDayPlus();
	MIS_Fester_KillBugs = LOG_Running;
	Log_CreateTopic(TOPIC_FesterRauber,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FesterRauber,LOG_Running);
	B_LogEntry(TOPIC_FesterRauber,"Я собираюсь атаковать гнездо полевых хищников вместе с Фестером.");
	Info_ClearChoices(DIA_Fester_TogetherNOW);
	AI_StopProcessInfos(self);
};

func void DIA_Fester_TogetherNOW_Later()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_Later_15_00");	//Хорошо, давай подождем еще немного...
	AI_Output(self,other,"DIA_Fester_TogetherNOW_Later_08_01");	//Ты знаешь, где найти меня...
	Info_ClearChoices(DIA_Fester_TogetherNOW);
};


instance DIA_Fester_InCave(C_Info)
{
	npc = Sld_816_Fester;
	nr = 7;
	condition = DIA_Fester_InCave_Condition;
	information = DIA_Fester_InCave_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fester_InCave_Condition()
{
	if((MIS_Fester_KillBugs == LOG_Running) && (Npc_GetDistToWP(self,"NW_BIGFARM_FELDREUBER4") <= 500))
	{
		self.aivar[AIV_LastFightComment] = TRUE;
		return TRUE;
	};
};

func void DIA_Fester_InCave_Info()
{
	if(Wld_GetDay() > Fester_Losgeh_Day)
	{
		AI_Output(self,other,"DIA_Fester_InCave_08_00");	//Где ты шлялся, черт тебя побери?
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_InCave_08_01");	//Так вот куда они уволокли мертвых фермеров. Какая мерзость.
	};
	AI_Output(self,other,"DIA_Fester_InCave_08_02");	//Похоже, все эти грязные твари уничтожены.
	AI_Output(self,other,"DIA_Fester_InCave_08_03");	//Пойдем назад!
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_Fester_WasMitAbmachung(C_Info)
{
	npc = Sld_816_Fester;
	nr = 8;
	condition = DIA_Fester_WasMitAbmachung_Condition;
	information = DIA_Fester_WasMitAbmachung_Info;
	permanent = FALSE;
	description = "Что насчет нашего соглашения?";
};


func int DIA_Fester_WasMitAbmachung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fester_InCave))
	{
		return TRUE;
	};
};

func void DIA_Fester_WasMitAbmachung_Info()
{
	AI_Output(other,self,"DIA_Fester_WasMitAbmachung_15_00");	//Что насчет нашего соглашения?
	if(Festers_Giant_Bug_Killed == 0)
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_01");	//Ты шутишь? Ты же вообще ничего не делал.
	}
	else if(Fester_Choice == FC_Join)
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_02");	//Я мог бы помочь тебе вступить в наши ряды, но я не буду делать этого.
		AI_Output(other,self,"DIA_Fester_WasMitAbmachung_15_03");	//Почему?
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_04");	//Если я скажу кому-нибудь, что ты помог мне, они дадут мне новое задание.
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_05");	//Ты понимаешь, что такая перспектива меня не воодушевляет?
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_06");	//Тебе не повезло, парень. Но я уверен, ты найдешь кого-нибудь еще, кто поможет тебе.
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_07");	//Эй - ты хотел воспользоваться моим положением. А теперь я воспользуюсь твоим.
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_08");	//Попробуй взглянуть на это дело с оптимизмом: ты получил опыт. А это что-то да значит, разве нет?
	};
	MIS_Fester_KillBugs = LOG_OBSOLETE;
	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(Giant_Bug,"NW_BIGMILL_FIELD_MONSTER_04");
	Wld_InsertNpc(Giant_Bug,"NW_BIGMILL_FIELD_MONSTER_04");
};


var int Fester_Duell_Day;
var int Fester_FightVerarscht;
var int Fester_FightSylvio;

instance DIA_Fester_PERMPruegel(C_Info)
{
	npc = Sld_816_Fester;
	nr = 9;
	condition = DIA_Fester_PERMPruegel_Condition;
	information = DIA_Fester_PERMPruegel_Info;
	permanent = TRUE;
	description = "Я думаю, тебе не помешает еще одна трепка.";
};


func int DIA_Fester_PERMPruegel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fester_WasMitAbmachung) || Npc_KnowsInfo(other,DIA_Jarvis_MissionKO) || (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
	{
		return TRUE;
	};
};

func void DIA_Fester_PERMPruegel_Info()
{
	var int random;
	AI_Output(other,self,"DIA_Fester_PERMPruegel_15_00");	//Я думаю, тебе не помешает еще одна трепка.
	if(Fester_Duell_Day < Wld_GetDay())
	{
		random = Hlp_Random(11);
		CreateInvItems(self,ItMi_Gold,random);
		Fester_Duell_Day = Wld_GetDay();
	};
	if(Npc_KnowsInfo(other,DIA_Fester_WasMitAbmachung) && (Fester_FightVerarscht == FALSE))
	{
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_01");	//Мне не нравится, когда меня обманывают.
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_02");	//Я весь дрожу, я весь дрожу!
		Fester_FightVerarscht = TRUE;
	}
	else if(Npc_KnowsInfo(other,DIA_Jarvis_MissionKO))
	{
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_03");	//Тебе не стоило связываться с Сильвио.
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_04");	//Ты один из лизоблюдов Ли, да? Тогда ты ошибся адресом!
		Fester_FightSylvio = TRUE;
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_05");	//Какого черта тебе от меня надо?
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_06");	//Мне очень хочется посмотреть, как ты будешь валяться в грязи!
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_07");	//Тебе что мало, да?
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Fester_PICKPOCKET(C_Info)
{
	npc = Sld_816_Fester;
	nr = 900;
	condition = DIA_Fester_PICKPOCKET_Condition;
	information = DIA_Fester_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Fester_PICKPOCKET_Condition()
{
	return C_Beklauen(27,45);
};

func void DIA_Fester_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fester_PICKPOCKET);
	Info_AddChoice(DIA_Fester_PICKPOCKET,Dialog_Back,DIA_Fester_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fester_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fester_PICKPOCKET_DoIt);
};

func void DIA_Fester_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fester_PICKPOCKET);
};

func void DIA_Fester_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fester_PICKPOCKET);
};

