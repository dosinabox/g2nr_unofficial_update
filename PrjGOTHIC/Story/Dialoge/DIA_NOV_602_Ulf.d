
instance DIA_Ulf_EXIT(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 999;
	condition = DIA_Ulf_EXIT_Condition;
	information = DIA_Ulf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ulf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ulf_Hallo(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 2;
	condition = DIA_Ulf_Hallo_Condition;
	information = DIA_Ulf_Hallo_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Ulf_Hallo_Condition()
{
	if((hero.guild != GIL_NOV) && (hero.guild != GIL_KDF) && (MIS_SCHNITZELJAGD == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Hallo_Info()
{
	AI_Output(other,self,"DIA_Ulf_Hallo_15_00");	//Что ты делаешь здесь?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_01");	//Если тебе интересно это знать, я выполняю задание монастыря.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_02");	//Я послушник в монастыре. Я выполняю задания магов, а также паладинов.
	};
	AI_Output(self,other,"DIA_Ulf_Hallo_03_03");	//Я доставил трем трактирщикам города вино из монастыря.
};


instance DIA_Ulf_Wirte(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 3;
	condition = DIA_Ulf_Wirte_Condition;
	information = DIA_Ulf_Wirte_Info;
	permanent = FALSE;
	description = "Кто эти трое трактирщиков?";
};


func int DIA_Ulf_Wirte_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulf_Hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Wirte_Info()
{
	AI_Output(other,self,"DIA_Ulf_Wirte_15_00");	//Кто эти трое трактирщиков?
	AI_Output(self,other,"DIA_Ulf_Wirte_03_01");	//Один из них - вот этот добрый человек за прилавком.
	AI_Output(self,other,"DIA_Ulf_Wirte_03_02");	//Также еще Корагон - хозяин таверны на храмовой площади, и Кардиф - владелец бара в портовом районе.
};


instance DIA_Ulf_Kloster(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 3;
	condition = DIA_Ulf_Kloster_Condition;
	information = DIA_Ulf_Kloster_Info;
	permanent = FALSE;
	description = "Что ты можешь рассказать мне о монастыре?";
};


func int DIA_Ulf_Kloster_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulf_Hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Kloster_Info()
{
	AI_Output(other,self,"DIA_Ulf_Kloster_15_00");	//Что ты можешь рассказать мне о монастыре?
	AI_Output(self,other,"DIA_Ulf_Kloster_03_01");	//Мы, послушники, ищем просвещение в молитвах Инносу и изучении принципов веры под руководством магов.
	AI_Output(self,other,"DIA_Ulf_Kloster_03_02");	//Мы служим им так же, как мы служим Инносу, и готовим себя к единению с Огнем.
};


instance DIA_Ulf_Bringen(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 4;
	condition = DIA_Ulf_Bringen_Condition;
	information = DIA_Ulf_Bringen_Info;
	permanent = FALSE;
	description = "Отведи меня в монастырь.";
};


func int DIA_Ulf_Bringen_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulf_Hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV) && (hero.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Bringen_Info()
{
	AI_Output(other,self,"DIA_Ulf_Bringen_15_00");	//Отведи меня в монастырь.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_01");	//Забудь об этом. Ты знаешь, сколько различных злобных тварей встретилось мне по пути?
	AI_Output(self,other,"DIA_Ulf_Bringen_03_02");	//Когда я думаю обо всех этих кровавых мухах, волках и гоблинах, я рад, что мне больше не нужно жить здесь.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_03");	//Кроме того, тебя все равно не пустят в монастырь.
	AI_Output(other,self,"DIA_Ulf_Bringen_15_04");	//Почему?
	AI_Output(self,other,"DIA_Ulf_Bringen_03_05");	//Вход в монастырь разрешен только магам, паладинам и послушникам.
};


instance DIA_Ulf_Aufnahme(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 3;
	condition = DIA_Ulf_Aufnahme_Condition;
	information = DIA_Ulf_Aufnahme_Info;
	permanent = FALSE;
	description = "А как мне стать послушником?";
};


func int DIA_Ulf_Aufnahme_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulf_Bringen) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Aufnahme_Info()
{
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_00");	//А как мне стать послушником?
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_01");	//Если человек чувствует глубокое желание...
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_02");	//Эй! Просто скажи мне, каковы условия.
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_03");	//Ты должен принести дары. Овцу и...
	B_Say_Gold(self,other,Summe_Kloster);
	SC_KnowsKlosterTribut = TRUE;
	Log_CreateTopic(Topic_Kloster,LOG_MISSION);
	Log_SetTopicStatus(Topic_Kloster,LOG_Running);
	B_LogEntry(Topic_Kloster,"Чтобы стать послушником монастыря Инноса, мне нужна овца и 1000 золотых монет.");
};


instance DIA_Ulf_Gold(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 8;
	condition = DIA_Ulf_Gold_Condition;
	information = DIA_Ulf_Gold_Info;
	permanent = FALSE;
	description = "Как мне раздобыть такую огромную сумму?";
};


func int DIA_Ulf_Gold_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulf_Aufnahme) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Gold_Info()
{
	AI_Output(other,self,"DIA_Ulf_Gold_15_00");	//Как мне раздобыть такую огромную сумму?
	AI_Output(self,other,"DIA_Ulf_Gold_03_01");	//Так как очевидно, что ты не знаешь никого, кто бы мог заплатить за тебя, тебе просто нужно заработать ее.
};


instance DIA_Ulf_Schaf(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Schaf_Condition;
	information = DIA_Ulf_Schaf_Info;
	permanent = FALSE;
	description = "А где я могу найти овцу?";
};


func int DIA_Ulf_Schaf_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulf_Aufnahme) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Schaf_Info()
{
	AI_Output(other,self,"DIA_Ulf_Schaf_15_00");	//А где я могу найти овцу?
	AI_Output(self,other,"DIA_Ulf_Schaf_03_01");	//У фермеров, конечно же. Но ты не получишь ее даром.
	B_LogEntry(Topic_Kloster,"Я могу раздобыть овцу у фермеров.");
};


instance DIA_Ulf_Suche(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Suche_Condition;
	information = DIA_Ulf_Suche_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ulf_Suche_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Suche_Info()
{
	AI_Output(self,other,"DIA_Ulf_Suche_03_00");	//Эй, ты знаешь новости?
	AI_Output(other,self,"DIA_Ulf_Suche_15_01");	//Ты был избран.
	AI_Output(self,other,"DIA_Ulf_Suche_03_02");	//Точно. Я как раз хотел посидеть, попить холодного пива, когда из-за угла вышел Дарон и сказал мне, что я был избран.
	AI_Output(self,other,"DIA_Ulf_Suche_03_03");	//Кто бы мог подумать? Воля Инноса непостижима. А что привело тебя сюда?
	AI_Output(other,self,"DIA_Ulf_Suche_15_04");	//Я потребовал прохождения Испытания Огнем.
	AI_Output(self,other,"DIA_Ulf_Suche_03_05");	//Это невозможно! Похоже, мужества у тебя хватит на десятерых. Это значит, что ты тоже будешь искать 'то, что верующий находит в конце пути'?
	AI_Output(other,self,"DIA_Ulf_Suche_15_06");	//Похоже на это.
};


instance DIA_Ulf_Rausgefunden(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Rausgefunden_Condition;
	information = DIA_Ulf_Rausgefunden_Info;
	permanent = FALSE;
	description = "Ты еще ничего не нашел?";
};


func int DIA_Ulf_Rausgefunden_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Rausgefunden_Info()
{
	AI_Output(other,self,"DIA_Ulf_Rausgefunden_15_00");	//Ты еще ничего не нашел?
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_01");	//Ну, я пытался идти за Агоном - но я потерял его.
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_02");	//И что же теперь? Что они говорят? Следуй знакам Инноса. Но я не понимаю эту загадку с путем...
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_03");	//Так что я продолжу свои поиски.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_Ulf_Folgen(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Folgen_Condition;
	information = DIA_Ulf_Folgen_Info;
	permanent = FALSE;
	description = "Эй, ты что, идешь за мной?";
};


func int DIA_Ulf_Folgen_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Ulf_Rausgefunden))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Folgen_Info()
{
	AI_Output(other,self,"DIA_Ulf_Folgen_15_00");	//Эй, ты что, идешь за мной?
	AI_Output(self,other,"DIA_Ulf_Folgen_03_01");	//Чушь. Просто я случайно иду в том же направлении, что и ты.
	AI_StopProcessInfos(self);
};


instance DIA_Ulf_Stop(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Stop_Condition;
	information = DIA_Ulf_Stop_Info;
	permanent = FALSE;
	description = "Хватит бегать за мной!";
};


func int DIA_Ulf_Stop_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Ulf_Folgen))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Stop_Info()
{
	AI_Output(other,self,"DIA_Ulf_Stop_15_00");	//Хватит бегать за мной!
	AI_Output(self,other,"DIA_Ulf_Stop_03_01");	//Я не иду за тобой. Но, пожалуйста, если тебе так кажется - я пойду другой дорогой.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SUCHE");
};


instance DIA_Ulf_Abrechnung(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Abrechnung_Condition;
	information = DIA_Ulf_Abrechnung_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ulf_Abrechnung_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (other.guild == GIL_NOV) && Npc_HasItems(other,ItMi_RuneBlank))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Abrechnung_Info()
{
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_00");	//Мы опять встретились. Я много размышлял. Я верю, что желание стать магом сильно во мне.
	AI_Output(other,self,"DIA_Ulf_Abrechnung_15_01");	//Ох - не делай этого...
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_02");	//У меня нет выбора. Жизнь послушника не по мне.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_03");	//Я должен стать магом. Тогда сразу все станет хорошо. И теперь я заберу то, что должно принадлежать мне.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_04");	//Ты хочешь сказать последнее слово?
	Info_ClearChoices(DIA_Ulf_Abrechnung);
	Info_AddChoice(DIA_Ulf_Abrechnung,"Прекрати, я не хочу убивать тебя.",DIA_Ulf_Abrechnung_Lass);
	Info_AddChoice(DIA_Ulf_Abrechnung,"Ты, возможно, что-то не понимаешь - мне нужно вернуться в монастырь.",DIA_Ulf_Abrechnung_Schnell);
	Info_AddChoice(DIA_Ulf_Abrechnung,"У тебя нет ничего покурить?",DIA_Ulf_Abrechnung_Rauch);
};

func void DIA_Ulf_Abrechnung_Lass()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Lass_15_00");	//Прекрати, я не хочу убивать тебя.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Lass_03_01");	//Чушь. Ты же знаешь, что у тебя нет ни единого шанса против меня! Сражайся!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};

func void DIA_Ulf_Abrechnung_Schnell()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Schnell_15_00");	//Ты, возможно, что-то не понимаешь - мне нужно вернуться в монастырь.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Schnell_03_01");	//Тебе больше никуда не нужно идти!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};

func void DIA_Ulf_Abrechnung_Rauch()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Rauch_15_00");	//У тебя нет ничего покурить?
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_01");	//Тебе повезло. Как раз у меня кое-что есть.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_02");	//Давай, закурим.
	B_GiveInvItems(self,other,ItMi_Joint,1);
	B_UseItem(other,ItMi_Joint);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};


instance DIA_Ulf_Troll(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Troll_Condition;
	information = DIA_Ulf_Troll_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ulf_Troll_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Ulf_Rausgefunden) && ((Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_14") <= 1000) || (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_15") <= 1000)))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Troll_Info()
{
	AI_Output(self,other,"DIA_Ulf_Troll_03_00");	//Эй, ты действительно думаешь, что мы идем правильной дорогой? Тролль живет здесь.
	AI_Output(self,other,"DIA_Ulf_Troll_03_01");	//Я думаю, нам нужно идти в другую сторону.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WAIT");
};


instance DIA_Ulf_PICKPOCKET(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 900;
	condition = DIA_Ulf_PICKPOCKET_Condition;
	information = DIA_Ulf_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Ulf_PICKPOCKET_Condition()
{
	return C_Beklauen(34,50);
};

func void DIA_Ulf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ulf_PICKPOCKET);
	Info_AddChoice(DIA_Ulf_PICKPOCKET,Dialog_Back,DIA_Ulf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ulf_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ulf_PICKPOCKET_DoIt);
};

func void DIA_Ulf_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ulf_PICKPOCKET);
};

func void DIA_Ulf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ulf_PICKPOCKET);
};

