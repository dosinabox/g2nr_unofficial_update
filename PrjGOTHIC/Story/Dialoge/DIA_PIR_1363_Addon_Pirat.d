
instance DIA_Addon_BenchPirate_EXIT(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 999;
	condition = DIA_Addon_BenchPirate_EXIT_Condition;
	information = DIA_Addon_BenchPirate_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_BenchPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BenchPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BenchPirate_Hello(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 1;
	condition = DIA_Addon_BenchPirate_Hello_Condition;
	information = DIA_Addon_BenchPirate_Hello_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Addon_BenchPirate_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_BenchPirate_Hello_Info()
{
	var int randy;
	AI_Output(other,self,"DIA_Addon_Pir_7_Hello_15_00");	//Как дела?
	randy = Hlp_Random(3);
	if(GregIsBack == TRUE)
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_01");	//Грег наконец-то вернулся. Самое время.
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_02");	//Теперь Фрэнсису приходится пилить деревья для частокола. Надеюсь, это для него не слишком большой удар.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_03");	//Что ж, пусть приходят бандиты. Пока с нами Грег, они нам не страшны.
		};
	}
	else if(randy == 0)
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_04");	//Фрэнсис, который остался за главного, - всего лишь жалкий клоун. Никто не воспринимает его всерьез.
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_05");	//Грег доверяет Фрэнсису, потому что тот слишком туп, чтобы его обманывать. Но делать его за это командиром...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_06");	//Если в ближайшее время Грег не вернется, и я не почувствую палубу под своими ногами, у меня будет земная болезнь!
	};
};


instance DIA_Addon_BenchPirate_Anheuern(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 11;
	condition = DIA_Addon_BenchPirate_Anheuern_Condition;
	information = DIA_Addon_BenchPirate_Anheuern_Info;
	permanent = FALSE;
	description = "Ты должен мне помочь.";
};


func int DIA_Addon_BenchPirate_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_BenchPirate_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_Anheuern_15_00");	//Ты должен мне помочь.
	AI_Output(self,other,"DIA_Addon_BenchPirate_Anheuern_07_01");	//Приказ Грега?
	AI_Output(other,self,"DIA_Addon_BenchPirate_Anheuern_15_08");	//Точно.
};


instance DIA_Addon_BenchPirate_ComeOn(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 12;
	condition = DIA_Addon_BenchPirate_ComeOn_Condition;
	information = DIA_Addon_BenchPirate_ComeOn_Info;
	permanent = TRUE;
	description = "Нас ждет каньон.";
};


func int DIA_Addon_BenchPirate_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_BenchPirate_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_BenchPirate_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_ComeOn_15_01");	//Нас ждет каньон.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BenchPirate_ComeOn_07_02");	//Именно туда я и возвращаюсь...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BenchPirate_ComeOn_07_01");	//Есть, капитан!
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			B_TurnToNpc(self,other);
		};
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_BenchPirate_GoHome(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 13;
	condition = DIA_Addon_BenchPirate_GoHome_Condition;
	information = DIA_Addon_BenchPirate_GoHome_Info;
	permanent = TRUE;
	description = "Ты мне больше не нужен.";
};


func int DIA_Addon_BenchPirate_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_BenchPirate_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_GoHome_15_00");	//Ты мне больше не нужен.
	AI_Output(self,other,"DIA_Addon_BenchPirate_GoHome_07_01");	//Возвращаюсь в лагерь, капитан!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_BenchPirate_TooFar(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_BenchPirate_TooFar_Condition;
	information = DIA_Addon_BenchPirate_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_BenchPirate_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_BenchPirate_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_BenchPirate_TooFar_07_01");	//Мы слишком далеко от лагеря.
	AI_Output(self,other,"DIA_Addon_BenchPirate_GoHome_07_02");	//Мне все это не нравится.
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_07_02");	//Я возвращаюсь в лагерь!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_07_03");	//Мы с ребятами возвращаемся в лагерь!
	};
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};

