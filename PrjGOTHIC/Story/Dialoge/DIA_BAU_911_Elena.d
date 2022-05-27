
instance DIA_Elena_EXIT(C_Info)
{
	npc = BAU_911_Elena;
	nr = 999;
	condition = DIA_Elena_EXIT_Condition;
	information = DIA_Elena_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Elena_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Elena_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Elena_HALLO(C_Info)
{
	npc = BAU_911_Elena;
	nr = 1;
	condition = DIA_Elena_HALLO_Condition;
	information = DIA_Elena_HALLO_Info;
	permanent = FALSE;
	description = "Привет, красавица.";
};


func int DIA_Elena_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Elena_HALLO_Info()
{
	AI_Output(other,self,"DIA_Elena_HALLO_15_00");	//Привет, красавица.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_01");	//Хм. Откуда это ты сбежал?
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_02");	//Что тебе нужно?
	};
};


instance DIA_Elena_Aufstand(C_Info)
{
	npc = BAU_911_Elena;
	nr = 2;
	condition = DIA_Elena_Aufstand_Condition;
	information = DIA_Elena_Aufstand_Info;
	permanent = FALSE;
	description = "Говорят, что вы восстали против короля?";
};


func int DIA_Elena_Aufstand_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Elena_Aufstand_Info()
{
	AI_Output(other,self,"DIA_Elena_Aufstand_15_00");	//Говорят, что вы восстали против короля?
	AI_Output(self,other,"DIA_Elena_Aufstand_16_01");	//Мой отец решил, что пришло время защищать себя самим.
	if(VisibleGuild(other) != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Elena_Aufstand_16_02");	//Ополчение никогда не помогало нам. Они приходили сюда только, чтобы забрать провизию.
	};
};


instance DIA_Elena_Arbeit(C_Info)
{
	npc = BAU_911_Elena;
	nr = 3;
	condition = DIA_Elena_Arbeit_Condition;
	information = DIA_Elena_Arbeit_Info;
	permanent = FALSE;
	description = "Здесь, на ферме, есть какая-нибудь работа?";
};


func int DIA_Elena_Arbeit_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Elena_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Elena_Arbeit_15_00");	//Здесь, на ферме, есть какая-нибудь работа?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_01");	//Мой отец хорошо платит всем, кто помогает защищать ферму.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_02");	//Тебе это интересно? Ты не похож на человека, привычного к работе в поле.
	AI_Output(other,self,"DIA_Elena_Arbeit_15_03");	//Сколько платит твой отец?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_04");	//Тебе лучше обсудить этот вопрос с ним.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_05");	//Я знаю только, что наемникам платят ежедневно.
};


instance DIA_Elena_Regeln(C_Info)
{
	npc = BAU_911_Elena;
	nr = 4;
	condition = DIA_Elena_Regeln_Condition;
	information = DIA_Elena_Regeln_Info;
	permanent = FALSE;
	description = "Здесь есть какие-нибудь правила, которых мне нужно придерживаться?";
};


func int DIA_Elena_Regeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO) && ((other.guild == GIL_NONE) || (other.guild == GIL_SLD)))
	{
		return TRUE;
	};
};

func void DIA_Elena_Regeln_Info()
{
	AI_Output(other,self,"DIA_Elena_Regeln_15_00");	//Здесь есть какие-нибудь правила, которых мне нужно придерживаться?
	AI_Output(self,other,"DIA_Elena_Regeln_16_01");	//Не трогай того, что тебе не принадлежит.
	AI_Output(self,other,"DIA_Elena_Regeln_16_02");	//Не суй свой нос в чужие дела.
	AI_Output(self,other,"DIA_Elena_Regeln_16_03");	//Если тебе хочется подраться, дерись с наемниками.
	AI_Output(self,other,"DIA_Elena_Regeln_16_04");	//Если ты начнешь драку с фермером, все здесь будут против тебя.
};


var int Elena_Trade;

func void B_Elena_Trade()
{
	if(Elena_Trade == FALSE)
	{
		Log_CreateTopic(TOPIC_SoldierTrader,LOG_NOTE);
		B_LogEntry(TOPIC_SoldierTrader,"Елена продает товары на ферме Онара.");
		Elena_Trade = TRUE;
	};
};

instance DIA_Elena_AUFGABE(C_Info)
{
	npc = BAU_911_Elena;
	nr = 5;
	condition = DIA_Elena_AUFGABE_Condition;
	information = DIA_Elena_AUFGABE_Info;
	permanent = FALSE;
	description = "А чем ты занимаешься?";
};


func int DIA_Elena_AUFGABE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Elena_AUFGABE_Info()
{
	AI_Output(other,self,"DIA_Elena_AUFGABE_15_00");	//А чем ты занимаешься?
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_01");	//Я продаю то, что мы выращиваем на ферме. Если захочешь купить что-нибудь, дай мне знать.
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_02");	//Но я хочу предупредить тебя. Я не люблю торговаться и не потерплю воровства. Понятно?
	B_Elena_Trade();
};


instance DIA_Elena_TRADE(C_Info)
{
	npc = BAU_911_Elena;
	nr = 7;
	condition = DIA_Elena_TRADE_Condition;
	information = DIA_Elena_TRADE_Info;
	permanent = TRUE;
	description = DIALOG_TRADE_v4;
	trade = TRUE;
};


func int DIA_Elena_TRADE_Condition()
{
	if(Elena_Trade == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Elena_TRADE_Info()
{
	AI_Output(other,self,"DIA_Elena_TRADE_15_00");	//Покажи мне свои товары.
	AI_Output(self,other,"DIA_Elena_TRADE_16_01");	//Выбирай.
	if(MIS_Serpentes_MinenAnteil_KDF == LOG_Running)
	{
		ElenaMinenAnteil = TRUE;
	};
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Elena_PERM(C_Info)
{
	npc = BAU_911_Elena;
	nr = 900;
	condition = DIA_Elena_PERM_Condition;
	information = DIA_Elena_PERM_Info;
	permanent = TRUE;
	description = "Ничего интересного последнее время не было?";
};


func int DIA_Elena_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Elena_PERM_Info()
{
	AI_Output(other,self,"DIA_Elena_PERM_15_00");	//Ничего интересного последнее время не было?
	if(Kapitel <= 1)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_01");	//Несколько дней назад мой отец объявил, что нам больше нельзя ничего продавать городу.
		AI_Output(self,other,"DIA_Elena_PERM_16_02");	//Поэтому я теперь все время на ферме и продаю товары только здесь.
		B_Elena_Trade();
	}
	else if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_03");	//Нападения ополчения на соседние фермы происходят все чаще и чаще. Это только вопрос времени, когда мой отец вмешается.
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_04");	//Жизнь здесь стала такой опасной. Никто не осмеливается далеко отходить от своего поля. Уже давно никто из нас не был в городе.
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_05");	//Наемники становятся все более и более нервными. Но с тех пор, как ушел Сильвио со своими парнями, они вроде немного успокоились.
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_06");	//Все только и говорят о скором нападении орков. Но я не очень-то верю в это. Я думаю, что здесь, на ферме, мы в безопасности.
	};
};


instance DIA_Elena_MINENANTEIL(C_Info)
{
	npc = BAU_911_Elena;
	nr = 2;
	condition = DIA_Elena_MINENANTEIL_Condition;
	information = DIA_Elena_MINENANTEIL_Info;
	description = "Ты продаешь акции шахт?";
};


func int DIA_Elena_MINENANTEIL_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && (ElenaMinenAnteil == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Elena_MINENANTEIL_Info()
{
	AI_Output(other,self,"DIA_Elena_MINENANTEIL_15_00");	//Ты продаешь акции шахт?
	AI_Output(self,other,"DIA_Elena_MINENANTEIL_16_01");	//Ну и что? Я сама их купила у другого торговца.
	B_GivePlayerXP(XP_Ambient);
};

