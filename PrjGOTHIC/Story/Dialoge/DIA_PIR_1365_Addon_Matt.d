
instance DIA_Addon_Matt_EXIT(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 999;
	condition = DIA_Addon_Matt_EXIT_Condition;
	information = DIA_Addon_Matt_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Matt_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Matt_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Matt_PICKPOCKET(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 900;
	condition = DIA_Addon_Matt_PICKPOCKET_Condition;
	information = DIA_Addon_Matt_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Matt_PICKPOCKET_Condition()
{
	return C_Beklauen(55,91);
};

func void DIA_Addon_Matt_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Matt_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Matt_PICKPOCKET,Dialog_Back,DIA_Addon_Matt_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Matt_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Matt_PICKPOCKET_DoIt);
};

func void DIA_Addon_Matt_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Matt_PICKPOCKET);
};

func void DIA_Addon_Matt_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Matt_PICKPOCKET);
};


instance DIA_Addon_Matt_Hello(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 1;
	condition = DIA_Addon_Matt_Hello_Condition;
	information = DIA_Addon_Matt_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Matt_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Matt_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Matt_Hello_10_01");	//А, новичок? Прекрасно. Нам сейчас пригодится каждый человек.
};


instance DIA_Addon_Matt_PERM(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 2;
	condition = DIA_Addon_Matt_PERM_Condition;
	information = DIA_Addon_Matt_PERM_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Addon_Matt_PERM_Condition()
{
	return TRUE;
};

func void DIA_Addon_Matt_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Matt_Alright_15_01");	//Как дела?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output(self,other,"DIA_Addon_Matt_Alright_10_02");	//Какую часть фразы 'ЛЕЧЕБНОЕ ЗЕЛЬЕ' ты не понял?
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Matt_Alright_10_01");	//Все в порядке, капитан!
		};
	}
	else if((GregIsBack == TRUE) && !Npc_IsDead(Greg))
	{
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_01");	//Шутишь? У нас больше нет корабля.
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_02");	//Остается только ждать, пока Грег решит, что делать дальше.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_03");	//Сейчас в лагере все спокойно. Так что я собираюсь немного отдохнуть.
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_04");	//На твоем месте, кстати, я бы сделал те же самое.
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_05");	//Бандиты здесь, так что ситуация может измениться быстрее, чем мы предполагали.
	};
};


instance DIA_Addon_Matt_Bandits(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 3;
	condition = DIA_Addon_Matt_Bandits_Condition;
	information = DIA_Addon_Matt_Bandits_Info;
	description = "Что ты знаешь об этих бандитах?";
};


func int DIA_Addon_Matt_Bandits_Condition()
{
	return TRUE;
};

func void DIA_Addon_Matt_Bandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Matt_Bandits_15_03");	//Что ты знаешь о бандитах?
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_01");	//Ты имеешь в виду, кроме того, что они смертельно опасны и во много раз превосходят нас числом?
	AI_Output(other,self,"DIA_Addon_Matt_Bandits_15_02");	//Да.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_02");	//У них полно золота.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_03");	//Ну, по крайней мере, у них БЫЛО полно золота. За последнюю партию товара они нам так и не заплатили.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_04");	//Но я сомневаюсь, что они сделали это от нехватки средств.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_05");	//Думаю, что они просто слишком зазнались.
};


instance DIA_Addon_Matt_Francis(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 4;
	condition = DIA_Addon_Matt_Francis_Condition;
	information = DIA_Addon_Matt_Francis_Info;
	description = "Что ты знаешь о Фрэнсисе?";
};


func int DIA_Addon_Matt_Francis_Condition()
{
	if(Francis_ausgeschissen == FALSE)
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut) || (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Matt_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_Matt_15_00");	//Что ты знаешь о Фрэнсисе?
	AI_Output(self,other,"DIA_Addon_Matt_Francis_10_01");	//Кроме того, что он ленив и не справляется со своими обязанностями?
	AI_Output(other,self,"DIA_Addon_Brandon_Matt_15_02");	//Да.
	AI_Output(self,other,"DIA_Addon_Matt_Francis_10_03");	//Надо подумать... Хм-м... Нет, больше ничего в голову не приходит.
};


instance DIA_Addon_Matt_Anheuern(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 11;
	condition = DIA_Addon_Matt_Anheuern_Condition;
	information = DIA_Addon_Matt_Anheuern_Info;
	permanent = FALSE;
	description = "Пойдем со мной.";
};


func int DIA_Addon_Matt_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Matt_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_00");	//Пойдем со мной.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_10_01");	//Я не могу сейчас никуда идти. Я отдыхаю.
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_02");	//Приказ Грега.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_10_03");	//Понимаю, понимаю. Это, конечно, все меняет. Уже иду.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_10_04");	//А куда мы направляемся?
	Info_ClearChoices(DIA_Addon_Matt_Anheuern);
	Info_AddChoice(DIA_Addon_Matt_Anheuern,"Заткнись и иди за мной.",DIA_Addon_Matt_Anheuern_ShutUp);
	Info_AddChoice(DIA_Addon_Matt_Anheuern,"Мы должны очистить каньон от зверей.",DIA_Addon_Matt_Anheuern_ClearCanyon);
};

func void DIA_Addon_Matt_Anheuern_ShutUp()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_ShutUp_15_00");	//Заткнись и иди за мной.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_ShutUp_10_01");	//(саркастически) Есть, капитан!
	Info_ClearChoices(DIA_Addon_Matt_Anheuern);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

func void DIA_Addon_Matt_Anheuern_ClearCanyon()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_00");	//Мы должны очистить каньон от зверей.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_01");	//Ты рехнулся. Там их полно! А с этими бритвозубами шутки плохи.
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_02");	//Я знаю. Ну так что, ты идешь?
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_03");	//(вздыхает) Надеюсь, у тебя достаточно бутылок с лечебным зельем. Они нам понадобятся.
	Info_ClearChoices(DIA_Addon_Matt_Anheuern);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_Addon_Matt_ComeOn(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 12;
	condition = DIA_Addon_Matt_ComeOn_Condition;
	information = DIA_Addon_Matt_ComeOn_Info;
	permanent = TRUE;
	description = "Пойдем со мной.";
};


func int DIA_Addon_Matt_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Matt_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_Matt_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_Matt_ComeOn_15_00");	//Идем со мной.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self,other,"$RUNAWAY");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_ComeOn_10_01");	//Есть, капитан!
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_Matt_GoHome(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 13;
	condition = DIA_Addon_Matt_GoHome_Condition;
	information = DIA_Addon_Matt_GoHome_Info;
	permanent = TRUE;
	description = "Ты мне больше не нужен.";
};


func int DIA_Addon_Matt_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Matt_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_Matt_DontNeedYou_15_00");	//Ты мне больше не нужен.
	AI_Output(self,other,"DIA_Addon_Matt_GoHome_10_01");	//(бормочет под нос) Мне не помешает выпить кружечку грога!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Matt_TooFar(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 14;
	condition = DIA_Addon_Matt_TooFar_Condition;
	information = DIA_Addon_Matt_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Matt_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Matt_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_Matt_TooFar_10_01");	//Дальше тебе придется идти одному, (саркастически) капитан.
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_10_03");	//Мы с ребятами возвращаемся в лагерь!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_10_02");	//Я возвращаюсь в лагерь!
	};
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Matt_Healing(C_Info)
{
	npc = PIR_1365_Addon_Matt;
	nr = 15;
	condition = DIA_Addon_Matt_Healing_Condition;
	information = DIA_Addon_Matt_Healing_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Matt_Healing_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] - 100)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Matt_Healing_Info()
{
	AI_Output(self,other,"DIA_Addon_Matt_Healing_10_01");	//Эй, капитан, мне не помешало бы лечебное зелье!
};

