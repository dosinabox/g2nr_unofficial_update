
var int Lee_Teleport;

func void B_Lee_Teleport()
{
	if((Lee_Teleport == FALSE) && (Kapitel >= 3))
	{
		AI_Output(self,other,"DIA_Lee_Add_04_05");	//Ах. Хорошо, что ты пришел.
		AI_Output(other,self,"DIA_Lee_Add_15_06");	//Что случилось?
		AI_Output(self,other,"DIA_Lee_Add_04_07");	//Я нашел это в старой часовне.
		B_GiveInvItems(self,other,ItRu_TeleportFarm,1);
		AI_Output(self,other,"DIA_Lee_Add_04_08");	//Это магическая руна. Я думаю, она может в любое время перенести тебя сюда, на ферму.
		AI_Output(self,other,"DIA_Lee_Add_04_09");	//Я подумал, что ты сможешь пользоваться ей.
		Lee_Teleport = TRUE;
	};
};

var int Lee_Sends_To_Buster;

func void B_Lee_Sends_To_Buster()
{
	if((Kapitel >= 3) && (Kapitel < 5) && (Lee_Sends_To_Buster == FALSE) && !Npc_IsDead(Buster) && !Npc_KnowsInfo(other,DIA_Buster_SHADOWBEASTS) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_07");	//Ох, да. Чуть не забыл... Бастер хочет поболтать с тобой. Он не говорит мне, о чем. Может, стоит найти его?
		Lee_Sends_To_Buster = TRUE;
	};
};

instance DIA_Lee_EXIT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 999;
	condition = DIA_Lee_EXIT_Condition;
	information = DIA_Lee_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lee_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lee_EXIT_Info()
{
	B_Lee_Teleport();
	B_Lee_Sends_To_Buster();
	AI_StopProcessInfos(self);
};


var int Lee_LastPetzCounter;
var int Lee_LastPetzCrime;

instance DIA_Lee_PMSchulden(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_PMSchulden_Condition;
	information = DIA_Lee_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lee_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Lee_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Lee_LastPetzCrime))
	{
		return TRUE;
	};
};

func void DIA_Lee_PMSchulden_Info()
{
	var int diff;
	AI_Output(self,other,"DIA_Lee_PMSchulden_04_00");	//Ты здесь, чтобы принести деньги Онару?
	if(B_GetTotalPetzCounter(self) > Lee_LastPetzCounter)
	{
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_01");	//Я уже сказал тебе, что не надо творить глупости здесь.
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_02");	//Онар узнал, что ты успел заслужить себе дурную славу здесь.
		if(Lee_Schulden < 1000)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_03");	//Ну и естественно, он теперь хочет больше денег.
			AI_Output(other,self,"DIA_Lee_PMAdd_15_00");	//Сколько?
			diff = B_GetTotalPetzCounter(self) - Lee_LastPetzCounter;
			if(diff > 0)
			{
				Lee_Schulden += diff * 50;
			};
			if(Lee_Schulden > 1000)
			{
				Lee_Schulden = 1000;
			};
			B_Say_Gold(self,other,Lee_Schulden);
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_04");	//Я думал, ты умнее.
		};
	}
	else if(B_GetGreatestPetzCrime(self) < Lee_LastPetzCrime)
	{
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_05");	//Теперь хорошие новости для тебя.
		if(Lee_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_06");	//Неожиданно не осталось никого, кто видел, как ты совершил убийство.
		};
		if((Lee_LastPetzCrime == CRIME_THEFT) || ((Lee_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_07");	//Никто теперь не может подтвердить, что видел, как ты воруешь.
		};
		if((Lee_LastPetzCrime == CRIME_ATTACK) || ((Lee_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_08");	//Не осталось никого, кто видел бы, как ты избил одного из фермеров.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_09");	//Похоже, что все обвинения против тебя растворились в воздухе.
		};
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_10");	//Да уж, скажу тебе, это способ избавиться от подобных проблем.
		if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_11");	//Как бы то ни было, тебе больше не нужно платить.
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_12");	//Но будь осторожнее в будущем.
			Lee_Schulden = 0;
			Lee_LastPetzCounter = 0;
			Lee_LastPetzCrime = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_13");	//Ясно одно: ты должен, тем не менее, заплатить штраф полностью.
			B_Say_Gold(self,other,Lee_Schulden);
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_14");	//Так как насчет этого?
		};
	};
	if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(DIA_Lee_PMSchulden);
		Info_ClearChoices(DIA_Lee_PETZMASTER);
		Info_AddChoice(DIA_Lee_PMSchulden,"У меня нет столько золота!",DIA_Lee_PETZMASTER_PayLater);
		Info_AddChoice(DIA_Lee_PMSchulden,"Сколько там нужно?",DIA_Lee_PMSchulden_HowMuchAgain);
		if(Npc_HasItems(other,ItMi_Gold) >= Lee_Schulden)
		{
			Info_AddChoice(DIA_Lee_PMSchulden,"Я хочу заплатить штраф!",DIA_Lee_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Lee_PMSchulden_HowMuchAgain()
{
	AI_Output(other,self,"DIA_Lee_PMSchulden_HowMuchAgain_15_00");	//Сколько там нужно?
	B_Say_Gold(self,other,Lee_Schulden);
	Info_ClearChoices(DIA_Lee_PMSchulden);
	Info_ClearChoices(DIA_Lee_PETZMASTER);
	Info_AddChoice(DIA_Lee_PMSchulden,"У меня нет столько золота!",DIA_Lee_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Lee_PMSchulden,"Сколько там нужно?",DIA_Lee_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Lee_Schulden)
	{
		Info_AddChoice(DIA_Lee_PMSchulden,"Я хочу заплатить штраф!",DIA_Lee_PETZMASTER_PayNow);
	};
};


instance DIA_Lee_PETZMASTER(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_PETZMASTER_Condition;
	information = DIA_Lee_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lee_PETZMASTER_Condition()
{
	if(B_GetGreatestPetzCrime(self) > Lee_LastPetzCrime)
	{
		return TRUE;
	};
};

func void DIA_Lee_PETZMASTER_Info()
{
	Lee_Schulden = 0;
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_00");	//Какого дьявола тебя позволили пустить сюда? (удивленно) Это ТЫ новичок, от которого одни проблемы?
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_01");	//Я слышал от Горна, что ты все еще жив. Но что ты придешь сюда... А, ладно...
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_02");	//Хорошо, что ты все же пришел ко мне, пока твои дела не стали совсем паршивыми.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_03");	//Наемники - крутые парни, и фермеры здесь тоже могут постоять за себя, но ты не можешь просто так убивать людей.
		Lee_Schulden = B_GetTotalPetzCounter(self) * 50 + 500;
		if((PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller) > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_04");	//Не говоря уже о других твоих преступлениях здесь.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_05");	//Я могу помочь тебе выбраться из этого дерьма.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_06");	//Это обойдется тебе в кругленькую сумму, впрочем. Онар жадный человек, и только если ОН закроет на все это глаза, вопрос можно будет считать улаженным.
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_07");	//Хорошо, что ты пришел. Я слышал, что ты что-то украл.
		if(PETZCOUNTER_Farm_Attack > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_08");	//И вышиб дух из нескольких фермеров.
		};
		if(PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_09");	//И убил несколько овец.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_10");	//Ты не можешь просто так творить подобное здесь. В таких случаях Онар настаивает, чтобы я наказывал преступников деньгами.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_11");	//Это означает: ты платишь, он набивает себе карман, но, по крайней мере, об этом деле можно будет забыть.
		Lee_Schulden = B_GetTotalPetzCounter(self) * 50;
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_12");	//Если ты обвиняешься в дуэли с наемником, это одно...
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_13");	//Но если ты избил фермера, они сразу бегут к Онару. И он ожидает определенных действий от меня.
		if(PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_14");	//Не говоря уже о том, что он приходит в бешенство, когда кто-то убивает овцу.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_15");	//Ты должен заплатить штраф. Твои деньги переходят в карман Онару, но это единственный способ решить проблему.
		Lee_Schulden = B_GetTotalPetzCounter(self) * 50;
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_16");	//Онар ожидает от меня, что я буду защищать его ферму. Включая его овец.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_17");	//Тебе придется заплатить ему компенсацию!
		Lee_Schulden = 100;
	};
	AI_Output(other,self,"DIA_Lee_PETZMASTER_15_18");	//Сколько?
	if(Lee_Schulden > 1000)
	{
		Lee_Schulden = 1000;
	};
	B_Say_Gold(self,other,Lee_Schulden);
	Info_ClearChoices(DIA_Lee_PMSchulden);
	Info_ClearChoices(DIA_Lee_PETZMASTER);
	Info_AddChoice(DIA_Lee_PETZMASTER,"У меня нет столько золота!",DIA_Lee_PETZMASTER_PayLater);
	if(Npc_HasItems(other,ItMi_Gold) >= Lee_Schulden)
	{
		Info_AddChoice(DIA_Lee_PETZMASTER,"Я хочу заплатить штраф!",DIA_Lee_PETZMASTER_PayNow);
	};
};

func void DIA_Lee_PETZMASTER_PayNow()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayNow_15_00");	//Я хочу заплатить штраф!
	B_GiveInvItems(other,self,ItMi_Gold,Lee_Schulden);
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayNow_04_01");	//Хорошо! Я прослежу, чтобы эти деньги дошли до Онара. Можешь считать эту проблему забытой.
	B_GrantAbsolution(LOC_FARM);
	Lee_Schulden = 0;
	Lee_LastPetzCounter = 0;
	Lee_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Lee_PETZMASTER);
	Info_ClearChoices(DIA_Lee_PMSchulden);
};

func void DIA_Lee_PETZMASTER_PayLater()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayLater_15_00");	//У меня нет столько золота!
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_01");	//Тогда добудь его и поскорее.
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_02");	//Но я не думаю, что ты сможешь украсть его здесь, на ферме. Если тебя поймают, тебе так просто не отвертеться.
	Lee_LastPetzCounter = B_GetTotalPetzCounter(self);
	Lee_LastPetzCrime = B_GetGreatestPetzCrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_Lee_Hallo(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_Hallo_Condition;
	information = DIA_Lee_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lee_Hallo_Condition()
{
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_Hallo_Info()
{
	AI_Output(self,other,"DIA_Lee_Hallo_04_00");	//Какого дьявола тебя позволили пустить сюда? (удивленно) Что ты делаешь здесь? Я думал, ты мертв!
	AI_Output(other,self,"DIA_Lee_Hallo_15_01");	//С чего ты так думал?
	AI_Output(self,other,"DIA_Lee_Hallo_04_02");	//Горн сказал мне, что это ты разрушил Барьер.
	AI_Output(other,self,"DIA_Lee_Hallo_15_03");	//Да, это действительно был я.
	AI_Output(self,other,"DIA_Lee_Hallo_04_04");	//Никогда бы не подумал, что человек может выжить после всего этого. Что привело тебя сюда? Ты же здесь не просто так...
};


instance DIA_Lee_Paladine(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_Paladine_Condition;
	information = DIA_Lee_Paladine_Info;
	permanent = FALSE;
	description = "Мне крайне необходимо поговорить с паладинами в городе.";
};


func int DIA_Lee_Paladine_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lee_Paladine_Info()
{
	AI_Output(other,self,"DIA_Lee_Paladine_15_00");	//Мне крайне необходимо поговорить с паладинами в городе. Ты не мог бы помочь мне добраться до них?
	AI_Output(self,other,"DIA_Lee_Paladine_04_01");	//(недоверчиво) Какие у тебя могут быть дела с паладинами?
	AI_Output(other,self,"DIA_Lee_Paladine_15_02");	//Это долгая история...
	AI_Output(self,other,"DIA_Lee_Paladine_04_03");	//У меня есть время.
	AI_Output(other,self,"DIA_Lee_Paladine_15_04");	//(вздыхает) Ксардас дал мне задание. Он хочет, чтобы я заполучил мощный амулет, Глаз Инноса.
	AI_Output(self,other,"DIA_Lee_Paladine_04_05");	//Значит, ты все еще в союзе с этим некромантом. Понятно. А этот амулет находится у паладинов, да?
	AI_Output(other,self,"DIA_Lee_Paladine_15_06");	//Насколько я знаю, да.
	AI_Output(self,other,"DIA_Lee_Paladine_04_07");	//Я могу помочь тебе добраться до паладинов. Но сначала ты должен стать одним из нас.
};


instance DIA_Lee_PaladineHOW(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_PaladineHOW_Condition;
	information = DIA_Lee_PaladineHOW_Info;
	permanent = FALSE;
	description = "Как ты можешь помочь мне добраться до паладинов?";
};


func int DIA_Lee_PaladineHOW_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Lee_Paladine))
	{
		if(GuildlessMode == FALSE)
		{
			return TRUE;
		};
	};
};

func void DIA_Lee_PaladineHOW_Info()
{
	AI_Output(other,self,"DIA_Lee_PaladineHOW_15_00");	//Как ты можешь помочь мне добраться до паладинов?
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_01");	//Доверяй мне. У меня есть план. Я думаю, ты как раз подходишь для него...
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_02");	//Я сведу тебя с паладинами, а ты окажешь мне услугу. Но сначала присоединись к нам!
};


instance DIA_Lee_LeesPlan(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_LeesPlan_Condition;
	information = DIA_Lee_LeesPlan_Info;
	permanent = FALSE;
	description = "А чем ты здесь занимаешься?";
};


func int DIA_Lee_LeesPlan_Condition()
{
	if(Lee_IsOnBoard == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_LeesPlan_Info()
{
	AI_Output(other,self,"DIA_Lee_LeesPlan_15_00");	//А чем ты здесь занимаешься?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_01");	//Это просто: я делаю все возможное, чтобы мы все смогли убраться с этого острова.
	if(MIS_Lee_Friedensangebot != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lee_LeesPlan_04_02");	//Онар нанял нас для защиты его фермы, и именно этим мы и намерены заниматься.
		AI_Output(self,other,"DIA_Lee_LeesPlan_04_03");	//Но наша награда - нечто большее, чем просто плата за работу. Помогая фермерам, мы отрезаем город от провизии.
		AI_Output(self,other,"DIA_Lee_LeesPlan_04_04");	//А чем меньше паладины едят, тем скорее они прислушаются, когда, наконец, я сделаю им предложение о мире.
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Lee_LeesPlan_04_05");	//Плохо только, что тебе пришлось присоединиться именно к ним.
		};
		if(MIS_Lee_Friedensangebot == FALSE)
		{
			AI_Output(other,self,"DIA_Lee_LeesPlan_15_06");	//Что за предложение ты хочешь сделать?
			if((other.guild == GIL_NONE) || (other.guild == GIL_SLD))
			{
				AI_Output(self,other,"DIA_Lee_LeesPlan_04_07");	//Естественно, условием будет наше помилование и свободный путь на материк. Ты все узнаешь, когда придет время.
			}
			else
			{
				AI_Output(self,other,"DIA_Lee_LeesPlan_04_07_add");	//Естественно, условием будет наше помилование и свободный путь на материк.
			};
		};
	};
};


instance DIA_Lee_WannaJoin(C_Info)
{
	npc = SLD_800_Lee;
	nr = 5;
	condition = DIA_Lee_WannaJoin_Condition;
	information = DIA_Lee_WannaJoin_Info;
	permanent = FALSE;
	description = "Я хочу присоединиться к вам!";
};


func int DIA_Lee_WannaJoin_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lee_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Lee_WannaJoin_15_00");	//Я хочу присоединиться к вам!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_01");	//Я надеялся, что ты скажешь это! Нам здесь нужны каждые надежные руки.
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_02");	//От последних наемников, что я нанял, не было никакого толку, одни проблемы!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_03");	//В принципе, ты можешь приступать прямо сейчас. Но, правда, есть парочка вопросов, которые нужно урегулировать, но, я думаю, это не будет проблемой...
};


instance DIA_Lee_ClearWhat(C_Info)
{
	npc = SLD_800_Lee;
	nr = 6;
	condition = DIA_Lee_ClearWhat_Condition;
	information = DIA_Lee_ClearWhat_Info;
	permanent = FALSE;
	description = "Что нужно 'урегулировать', прежде чем я смогу присоединиться к вам?";
};


func int DIA_Lee_ClearWhat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_WannaJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lee_ClearWhat_Info()
{
	AI_Output(other,self,"DIA_Lee_ClearWhat_15_00");	//Что нужно 'урегулировать', прежде чем я смогу присоединиться к вам?
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_01");	//Нас нанимает Онар, лендлорд. Ты можешь находиться на ферме только с его одобрения.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_02");	//Также, дело еще в наших парнях. Я смогу принять тебя, только если большинство наемников согласится, что ты можешь присоединиться к нам.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_03");	//Но не ходи к Онару, пока все не будет улажено. Он очень раздражительный тип...
	SCKnowsSLDVotes = TRUE;
	SLD_Aufnahme = LOG_Running;
	Log_CreateTopic(TOPIC_BecomeSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_Running);
	B_LogEntry(TOPIC_BecomeSLD,"Чтобы быть принятым в ряды наемников, я должен получить одобрение Онара, после того, как заручусь одобрением наемников.");
};


instance DIA_Lee_OtherSld(C_Info)
{
	npc = SLD_800_Lee;
	nr = 7;
	condition = DIA_Lee_OtherSld_Condition;
	information = DIA_Lee_OtherSld_Info;
	permanent = FALSE;
	description = "Как мне убедить наемников проголосовать за меня?";
};


func int DIA_Lee_OtherSld_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_ClearWhat) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lee_OtherSld_Info()
{
	AI_Output(other,self,"DIA_Lee_OtherSld_15_00");	//Как мне убедить наемников проголосовать за меня?
	AI_Output(self,other,"DIA_Lee_OtherSld_04_01");	//Делая то, что ожидается от тебя, когда ты будешь наемником, я бы сказал.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_02");	//Поговори с Торлофом. Он обычно находится перед домом. Он даст тебе испытание.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_03");	//Если ты сможешь пройти его, ты завоюешь большую часть необходимого уважения.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_04");	//Он расскажет тебе обо всем, что тебе нужно знать.
	Log_CreateTopic(TOPIC_BecomeSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_Running);
	B_LogEntry(TOPIC_BecomeSLD,"Чтобы быть принятым в ряды наемников, я должен пройти испытание Торлофа и заслужить уважение остальных наемников.");
};


instance DIA_Addon_Lee_Ranger(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Addon_Lee_Ranger_Condition;
	information = DIA_Addon_Lee_Ranger_Info;
	description = "Что ты знаешь о Кольце Воды?";
};


func int DIA_Addon_Lee_Ranger_Condition()
{
	if(SC_KnowsRanger == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lee_Ranger_Info()
{
	AI_Output(other,self,"DIA_Addon_Lee_Ranger_15_00");	//Что ты знаешь о Кольце Воды?
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_01");	//(смеется) Я так и знал! Тебе просто необходимо всюду сунуть свой нос!
	AI_Output(other,self,"DIA_Addon_Lee_Ranger_15_02");	//Ну давай, говори.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_03");	//Сказать я могу немного. Я знаю, что это тайное общество существует и что управляют им маги Воды.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_04");	//Я больше не связан соглашением с магами Воды, которое мы заключили с ними в те времена, когда еще стоял Барьер.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_05");	//Конечно, если я могу чем-то им помочь, я это делаю. Но большую часть времени я занят своими делами. Ни на что другое времени не остается.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_06");	//Если ты хочешь узнать об этом обществе больше, поговори с Кордом. Насколько я знаю, он один из них.
	B_Lee_Teleport();
//	RangerHelp_gildeSLD = TRUE;
	SC_KnowsCordAsRangerFromLee = TRUE;
};


var int Lee_ProbeOK;
var int Lee_StimmenOK;
var int Lee_OnarOK;

instance DIA_Lee_JoinNOW(C_Info)
{
	npc = SLD_800_Lee;
	nr = 8;
	condition = DIA_Lee_JoinNOW_Condition;
	information = DIA_Lee_JoinNOW_Info;
	permanent = TRUE;
	description = "Я готов присоединиться к вам!";
};


func int DIA_Lee_JoinNOW_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Lee_OtherSld) && (Lee_OnarOK == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_JoinNOW_Info()
{
	AI_Output(other,self,"DIA_Lee_JoinNOW_15_00");	//Я готов присоединиться к вам!
	if(Lee_ProbeOK == FALSE)
	{
		if((MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS) && (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_01");	//Сначала ты должен пройти испытание Торлофа.
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_02");	//Так ты прошел испытание Торлофа?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_03");	//Да.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_04");	//Это хорошо.
			Lee_ProbeOK = TRUE;
		};
	};
	if((Lee_ProbeOK == TRUE) && (Lee_StimmenOK == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_JoinNOW_04_05");	//А что говорят другие наемники?
		if(Torlof_GenugStimmen == FALSE)
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_06");	//Я не уверен, достаточно ли наемников на моей стороне.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_07");	//Тогда поговори с Торлофом, он знает обо всем, о чем говорят на этой ферме.
		}
		else
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_08");	//Большинство из них на моей стороне.
			Lee_StimmenOK = TRUE;
		};
	};
	if((Lee_StimmenOK == TRUE) && (Lee_OnarOK == FALSE))
	{
		if(Onar_Approved == FALSE)
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_09");	//Хорошо, тогда иди прямо к Онару. Я уже переговорил с ним.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_10");	//Но ты должен договориться о своем жаловании сам.
			if(Lee_SendToOnar == FALSE)
			{
				B_LogEntry(TOPIC_BecomeSLD,"Все, что мне нужно теперь - это одобрение Онара.");
				Lee_SendToOnar = TRUE;
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_11");	//Ты беседовал с Онаром?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_12");	//Он согласился.
			Lee_OnarOK = TRUE;
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_13");	//Тогда добро пожаловать в наши ряды, приятель!
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_14");	//Вот, возьми для начала эти доспехи!
			hero.guild = GIL_SLD;
			Npc_SetTrueGuild(hero,GIL_SLD);
			CreateInvItem(hero,ITAR_SLD_L);
			AI_PrintScreen("Легкие доспехи наемника получено",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
			Snd_Play("LEVELUP");
			if(Hlp_IsValidNpc(Lothar) && !Npc_IsDead(Lothar))
			{
				Npc_ExchangeRoutine(Lothar,"START");
			};
			KDF_Aufnahme = LOG_OBSOLETE;
			SLD_Aufnahme = LOG_SUCCESS;
			MIL_Aufnahme = LOG_OBSOLETE;
			B_GivePlayerXP(XP_BecomeMercenary);
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_15");	//Я рад, что ты с нами.
			if(MIS_Lee_Friedensangebot == FALSE)
			{
				AI_Output(self,other,"DIA_Lee_JoinNOW_04_16");	//У меня уже есть первое поручение для тебя.
				AI_Output(self,other,"DIA_Lee_JoinNOW_04_17");	//Оно имеет отношение к паладинам. Пришло время тебе увидеться с ними.
				if(Npc_KnowsInfo(other,DIA_Lee_Paladine))
				{
					AI_Output(self,other,"DIA_Lee_JoinNOW_04_18");	//Ты все равно хотел туда идти.
				};
			};
			if(MIS_Addon_Daron_GetStatue == LOG_Running)
			{
				Log_CreateTopic(TOPIC_Addon_HelpDaron,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_HelpDaron,LOG_Running);
				Log_AddEntry(TOPIC_Addon_HelpDaron,TOPIC_Addon_DaronGobbos);
			};
		};
	};
};


instance DIA_Lee_KeinSld(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_KeinSld_Condition;
	information = DIA_Lee_KeinSld_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lee_KeinSld_Condition()
{
	if(((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (Lee_IsOnBoard == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lee_KeinSld_Info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_00");	//Я вижу, ты поступил на службу к паладинам.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_01");	//Ты постригся в монастырь? (смеется) Я всего ожидал, только не этого.
	};
	AI_Output(self,other,"DIA_Lee_KeinSld_04_02");	//Что ж, теперь ты не сможешь стать наемником.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_03");	//Но кто знает, может быть, ты сможешь сделать что-нибудь для меня - или я для тебя.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_04");	//Посмотрим. Но, как бы то ни было, я желаю тебе всего наилучшего.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_05");	//Но даже и не думай обвести меня вокруг пальца, понял?
};


instance DIA_Lee_ToHagen(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_ToHagen_Condition;
	information = DIA_Lee_ToHagen_Info;
	permanent = FALSE;
	description = "И как мне теперь добраться до паладинов?";
};


func int DIA_Lee_ToHagen_Condition()
{
	if(other.guild == GIL_SLD)
	{
		return TRUE;
	};
	if((GuildlessMode == TRUE) && Npc_KnowsInfo(other,DIA_Lee_Paladine))
	{
		return TRUE;
	};
};

func void DIA_Lee_ToHagen_Info()
{
	AI_Output(other,self,"DIA_Lee_ToHagen_15_00");	//И как мне теперь добраться до паладинов?
	AI_Output(self,other,"DIA_Lee_ToHagen_04_01");	//Очень просто. Ты отнесешь им наше предложение о мире.
	if(!Npc_KnowsInfo(other,DIA_Lee_LeesPlan))
	{
		AI_Output(other,self,"DIA_Lee_LeesPlan_15_06");	//Что за предложение ты хочешь сделать?
	};
	AI_Output(self,other,"DIA_Lee_ToHagen_04_02");	//Я знаю лорда Хагена, командующего паладинов, со времен моей службы в королевской армии.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_03");	//Я знаю, о чем он думает - у него недостаточно людей. Он примет это предложение. По крайней мере, он выслушает тебя.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_04");	//Я написал ему письмо - держи.
	B_GiveInvItems(self,other,ItWr_Passage_MIS,1);
	AI_Output(self,other,"DIA_Lee_ToHagen_04_05");	//В любом случае, это должно тебе позволить получить аудиенцию у командующего паладинов.
	Player_KnowsLordHagen = TRUE;
	MIS_Lee_Friedensangebot = LOG_Running;
	Log_CreateTopic(TOPIC_Frieden,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Frieden,LOG_Running);
	B_LogEntry(TOPIC_Frieden,"Ли отправляет меня к лорду Хагену с предложением мира. Так я могу добиться аудиенции у паладинов.");
};


instance DIA_Lee_AngebotSuccess(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_AngebotSuccess_Condition;
	information = DIA_Lee_AngebotSuccess_Info;
	permanent = FALSE;
	description = "Я отнес лорду Хагену твое предложение о мире.";
};


func int DIA_Lee_AngebotSuccess_Condition()
{
	if(Hagen_FriedenAbgelehnt == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_AngebotSuccess_Info()
{
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_00");	//Я отнес лорду Хагену твое предложение о мире.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_01");	//Что он сказал?
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_02");	//Он сказал, что он готов даровать помилование тебе, но не твоим людям.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_03");	//Вот упрямый дурак. Большинство людей в КОРОЛЕВСКОЙ армии большие головорезы, чем мои парни.
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_04");	//Что ты собираешься делать теперь?
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_05");	//Я должен найти другой способ вытащить нас отсюда. Если понадобится, мы захватим корабль. Мне нужно подумать об этом.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_06");	//Вытащить свою голову из петли и бросить моих людей - это даже не обсуждается.
	MIS_Lee_Friedensangebot = LOG_SUCCESS;
};


instance DIA_Lee_Background(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_Background_Condition;
	information = DIA_Lee_Background_Info;
	permanent = FALSE;
	description = "Почему ты так рвешься на материк?";
};


func int DIA_Lee_Background_Condition()
{
	if(MIS_Lee_Friedensangebot == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Lee_Background_Info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_10");	//Почему ты так рвешься на материк?
	AI_Output(self,other,"DIA_Lee_Add_04_11");	//Как ты знаешь, я был генералом в армии короля.
	AI_Output(self,other,"DIA_Lee_Add_04_12");	//Но его лизоблюды предали меня, потому что я знал кое-что, чего не должен был знать.
	AI_Output(self,other,"DIA_Lee_Add_04_13");	//Они засунули меня в эту колонию, и король позволил это.
	AI_Output(self,other,"DIA_Lee_Add_04_14");	//У меня было много свободного времени, чтобы все обдумать.
	AI_Output(self,other,"DIA_Lee_Add_04_15");	//Я должен отомстить.
	AI_Output(other,self,"DIA_Lee_Add_15_16");	//(изумленно) Королю?
	AI_Output(self,other,"DIA_Lee_Add_04_17");	//(решительно) Королю! И его прихвостням. Они все горько пожалеют о том, что сделали со мной...
};


instance DIA_Lee_RescueGorn(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_RescueGorn_Condition;
	information = DIA_Lee_RescueGorn_Info;
	permanent = FALSE;
	description = "Я собираюсь отправиться в Долину Рудников.";
};


func int DIA_Lee_RescueGorn_Condition()
{
	if((Hagen_BringProof == TRUE) && (Kapitel < 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Lee_RescueGorn_Info()
{
	AI_Output(other,self,"DIA_Lee_RescueGorn_15_00");	//Я собираюсь отправиться в Долину Рудников.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_01");	//Я и не надеялся, что ты долго задержишься на этой ферме.
	if(MIS_RescueGorn != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lee_RescueGorn_04_02");	//Если ты возвращаешься в колонию, поищи там Горна. Паладины держат его там за решеткой.
		AI_Output(self,other,"DIA_Lee_RescueGorn_04_03");	//Горн хороший человек, и он бы очень пригодился мне здесь, так что если у тебя появится шанс освободить парня, не упускай его.
		KnowsAboutGorn = TRUE;
	};
};


instance DIA_Lee_Success(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_Success_Condition;
	information = DIA_Lee_Success_Info;
	permanent = FALSE;
	description = "Я освободил Горна.";
};


func int DIA_Lee_Success_Condition()
{
//	if((MIS_RescueGorn == LOG_SUCCESS) && (Kapitel >= 3) && (other.guild == GIL_SLD))
	if((MIS_RescueGorn == LOG_SUCCESS) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Lee_Success_Info()
{
	AI_Output(other,self,"DIA_Lee_Success_15_00");	//Я освободил Горна.
	if(Kapitel >= 3)
	{
		AI_Output(self,other,"DIA_Lee_Success_04_01");	//Да, он уже рассказал мне об этом. Отлично сработано.
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_02");	//Отличная работа.
	};
	AI_Output(self,other,"DIA_Lee_Success_04_02");	//Он стоит больше, чем Сильвио и все его парни вместе взятые.
	B_Lee_Teleport();
	B_GivePlayerXP(XP_AmbientKap5);
};


func void B_Lee_AboutGorn()
{
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_01");	//Его поймали паладины и отправили назад, в Долину Рудников, с конвоем каторжников.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_02");	//Если бы дорога в Долину Рудников не кишела паладинами и орками, я бы уже отправил пару своих парней, чтобы освободить его.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_03");	//Но сейчас это абсолютно неосуществимо. Бедняга.
	KnowsAboutGorn = TRUE;
};

instance DIA_Lee_AboutGorn(C_Info)
{
	npc = SLD_800_Lee;
	nr = 5;
	condition = DIA_Lee_AboutGorn_Condition;
	information = DIA_Lee_AboutGorn_Info;
	permanent = FALSE;
	description = "Горн сказал тебе обо мне? Что произошло с ним?";
};


func int DIA_Lee_AboutGorn_Condition()
{
	if((Kapitel < 3) && !Npc_KnowsInfo(other,DIA_Lee_RescueGorn))
	{
		return TRUE;
	};
};

func void DIA_Lee_AboutGorn_Info()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_15_00");	//Горн сказал тебе обо мне? Что произошло с ним?
	AI_Output(self,other,"DIA_Lee_AboutGorn_04_01");	//Ты ведь помнишь его, да?
	Info_ClearChoices(DIA_Lee_AboutGorn);
	Info_AddChoice(DIA_Lee_AboutGorn,"Дай попытаюсь вспомнить...",DIA_Lee_AboutGorn_Who);
	Info_AddChoice(DIA_Lee_AboutGorn,"Конечно.",DIA_Lee_AboutGorn_Yes);
};

func void DIA_Lee_AboutGorn_Yes()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Yes_15_00");	//Конечно.
	B_Lee_AboutGorn();
	Info_ClearChoices(DIA_Lee_AboutGorn);
};

func void DIA_Lee_AboutGorn_Who()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Who_15_00");	//Дай попытаюсь вспомнить...
	AI_Output(self,other,"DIA_Lee_AboutGorn_Who_04_01");	//Большой, черноволосый, плохой парень с большим топором, он отбил нашу шахту с твоей помощью. Это было в колонии.
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_06");	//Ну да.
	B_Lee_AboutGorn();
	Info_ClearChoices(DIA_Lee_AboutGorn);
};


instance DIA_Lee_WegenBullco(C_Info)
{
	npc = SLD_800_Lee;
	nr = 6;
	condition = DIA_Lee_WegenBullco_Condition;
	information = DIA_Lee_WegenBullco_Info;
	permanent = FALSE;
	description = "У Онара теперь на несколько овец меньше благодаря Буллко...";
};


func int DIA_Lee_WegenBullco_Condition()
{
	if(MIS_Pepe_KillWolves == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Lee_WegenBullco_Info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_00");	//У Онара теперь на несколько овец меньше благодаря Буллко...
	AI_Output(self,other,"DIA_Lee_Add_04_01");	//Ох, не приставай ко мне с такой чепухой! У меня и без этого проблем хватает.
	if((Bullco_scharf == TRUE) && !Npc_IsDead(Bullco) && (MIS_ReadyforChapter4 == FALSE))
	{
		AI_Output(other,self,"DIA_Lee_Add_15_02");	//У меня тоже. Буллко, похоже, видит проблему во мне. Он хочет, чтобы я покинул ферму...
		AI_Output(self,other,"DIA_Lee_Add_04_03");	//Да, и что? Постой за себя.
		AI_Output(self,other,"DIA_Lee_Add_04_04");	//Ты можешь сказать ему, что он должен вести себя сдержаннее, или я вычту пропавших овец из его жалования...
	};
};


instance DIA_Lee_Report(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_Report_Condition;
	information = DIA_Lee_Report_Info;
//	permanent = TRUE;
	permanent = FALSE;
	description = "Я пришел из Долины Рудников. Замок, находящийся там, был атакован драконами!";
};


func int DIA_Lee_Report_Condition()
{
//	if((EnterOW_Kapitel2 == TRUE) && (Kapitel <= 3))
	if(EnterOW_Kapitel2 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_Report_Info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_18");	//Я пришел из Долины Рудников. Замок, находящийся там, был атакован драконами!
	AI_Output(self,other,"DIA_Lee_Add_04_19");	//Так это правда! Ларес говорил, что в городе циркулируют слухи о драконах... Я не поверил в это...
	AI_Output(self,other,"DIA_Lee_Add_04_20");	//А что насчет паладинов?
	AI_Output(other,self,"DIA_Lee_Add_15_21");	//Они понесли большие потери.
	if(MIS_Lee_Friedensangebot == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lee_Add_04_22");	//Хорошо! Может теперь лорд Хаген более взвешенно подумает о моем предложении...
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_Add_04_24");	//Хорошо! Может, это заставит лорда Хагена отправиться со своими людьми в Долину Рудников...
		if(other.guild != GIL_PAL)
		{
			AI_Output(self,other,"DIA_Lee_Add_04_25");	//Чем меньше паладинов останется здесь, тем лучше.
		};
	};
	AI_Output(self,other,"DIA_Lee_Add_04_23");	//А если нет... (жестко) Тогда мы найдем другой способ вырваться отсюда...
};


var int Lee_Give_Sld_M;

instance DIA_Lee_ArmorM(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_ArmorM_Condition;
	information = DIA_Lee_ArmorM_Info;
	permanent = TRUE;
	description = "А как насчет доспехов получше?";
};


func int DIA_Lee_ArmorM_Condition()
{
	if((Kapitel == 2) && (other.guild == GIL_SLD) && (Lee_Give_Sld_M == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_ArmorM_Info()
{
	AI_Output(other,self,"DIA_Lee_ArmorM_15_00");	//А как насчет доспехов получше?
	if((MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS) && (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Lee_ArmorM_04_01");	//Ты выполнил задание.
		AI_Output(self,other,"DIA_Lee_ArmorM_04_02");	//У меня есть достойные доспехи для тебя. Конечно, если ты кредитоспособен.
		Lee_Give_Sld_M = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_ArmorM_04_03");	//Торлоф получил задание от Онара, которое должно было быть выполнено уже давным-давно.
		AI_Output(self,other,"DIA_Lee_ArmorM_04_04");	//Сначала реши этот вопрос, а затем мы поговорим о достойных доспехах!
	};
};


instance DIA_Lee_BuyArmorM(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_BuyArmorM_Condition;
	information = DIA_Lee_BuyArmorM_Info;
	permanent = TRUE;
	description = "Купить средние доспехи наемника. Защита: 50/50/0/5. (1000 золотых)";
};


func int DIA_Lee_BuyArmorM_Condition()
{
	if((Lee_Give_Sld_M == TRUE) && (Lee_SldMGiven == FALSE) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Lee_BuyArmorM_Info()
{
	AI_Output(other,self,"DIA_Lee_BuyArmorM_15_00");	//Дай мне эти доспехи.
	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_01");	//Держи. Это очень хорошие доспехи.
		CreateInvItem(hero,ITAR_SLD_M);
		AI_PrintScreen("Средние доспехи наемника получено",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		Lee_SldMGiven = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_02");	//Но это не подарок! Сначала я хочу увидеть золото!
	};
};


instance DIA_Lee_ArmorH(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_ArmorH_Condition;
	information = DIA_Lee_ArmorH_Info;
	permanent = FALSE;
	description = "У тебя есть доспехи получше для меня?";
};


func int DIA_Lee_ArmorH_Condition()
{
	if((Kapitel == 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Lee_ArmorH_Info()
{
	AI_Output(other,self,"DIA_Lee_ArmorH_15_00");	//У тебя есть доспехи получше для меня?
	AI_Output(self,other,"DIA_Lee_ArmorH_04_01");	//Конечно.
	B_Lee_Teleport();
};


instance DIA_Lee_BuyArmorH(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_BuyArmorH_Condition;
	information = DIA_Lee_BuyArmorH_Info;
	permanent = TRUE;
	description = "Купить тяжелые доспехи наемника. Защита: 80/80/5/10. (2500 золотых)";
};


func int DIA_Lee_BuyArmorH_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_ArmorH) && (Lee_SldHGiven == FALSE) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Lee_BuyArmorH_Info()
{
	AI_Output(other,self,"DIA_Lee_BuyArmorH_15_00");	//Дай мне тяжелые доспехи.
	if(B_GiveInvItems(other,self,ItMi_Gold,2500))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_01");	//Держи. Это очень хорошие доспехи. Я сам такие ношу.
		CreateInvItem(hero,ITAR_SLD_H);
		AI_PrintScreen("Тяжелые доспехи наемника получено",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		Lee_SldHGiven = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_02");	//Ты знаешь правила. Сначала золото!
	};
};


instance DIA_Lee_Richter(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_Richter_Condition;
	information = DIA_Lee_Richter_Info;
	permanent = FALSE;
	description = "У тебя нет еще для меня работы?";
};


func int DIA_Lee_Richter_Condition()
{
	if((Kapitel >= 3) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && !Npc_IsDead(Richter))
	{
		return TRUE;
	};
};

func void DIA_Lee_Richter_Info()
{
	AI_Output(other,self,"DIA_Lee_Richter_15_00");	//У тебя нет еще для меня работы?
	AI_Output(self,other,"DIA_Lee_Richter_04_01");	//Тебе все мало, да? По-моему, у тебя и без того проблем хватает. Чего же еще тебе нужно?
	AI_Output(other,self,"DIA_Lee_Richter_15_02");	//Еще задание. Я же наемник, помнишь?
	AI_Output(self,other,"DIA_Lee_Richter_04_03");	//Хорошо. У меня есть кое-что. Как раз для тебя.
	AI_Output(self,other,"DIA_Lee_Richter_04_04");	//Я должен поквитаться с судьей в городе. Я бы, конечно, предпочел сделать это сам.
	AI_Output(self,other,"DIA_Lee_Richter_04_05");	//Но паладины и на пушечный выстрел не подпустят меня к его дому.
	AI_Output(self,other,"DIA_Lee_Richter_04_06");	//Это дело очень деликатное. Так что слушай внимательно. Ты пойдешь к судье и предложишь ему свои услуги.
	AI_Output(self,other,"DIA_Lee_Richter_04_07");	//Ты должен попытаться завоевать его доверие и выполнять всякую грязную работу, пока не найдешь что-нибудь, дискредитирующее его.
	AI_Output(self,other,"DIA_Lee_Richter_04_08");	//Эта свинья провернула столько грязных делишек, что от него смердит за версту.
	AI_Output(self,other,"DIA_Lee_Richter_04_09");	//Дай мне что-нибудь, что я смогу использовать, чтобы запятнать его имя перед лицом ополчения. Я хочу, чтобы он провел остаток своих дней за решеткой.
	AI_Output(self,other,"DIA_Lee_Richter_04_10");	//Но я не хочу, чтобы ты убивал его. Это для него слишком мало. Я хочу, чтобы он страдал, понимаешь?
	AI_Output(self,other,"DIA_Lee_Richter_04_11");	//Как ты думаешь, справишься?
	Log_CreateTopic(TOPIC_RichterLakai,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichterLakai,LOG_Running);
	B_LogEntry(TOPIC_RichterLakai,"Ли хочет, чтобы я нашел доказательства, обвиняющие судью Хориниса. Для этого, я должен предложить свои услуги судье и должен держать ушки на макушке.");
	MIS_Lee_JudgeRichter = LOG_Running;
	Info_ClearChoices(DIA_Lee_Richter);
	Info_AddChoice(DIA_Lee_Richter,"Я не буду заниматься этим. Я не хочу прислуживать этой свинье.",DIA_Lee_Richter_nein);
	Info_AddChoice(DIA_Lee_Richter,"Нет проблем. Сколько?",DIA_Lee_Richter_wieviel);
};

func void DIA_Lee_Richter_wieviel()
{
	AI_Output(other,self,"DIA_Lee_Richter_wieviel_15_00");	//Нет проблем. Сколько?
	AI_Output(self,other,"DIA_Lee_Richter_wieviel_04_01");	//Твоя награда зависит от того, что ты сообщишь мне. Так что постарайся.
	B_Lee_Teleport();
	Info_ClearChoices(DIA_Lee_Richter);
};

func void DIA_Lee_Richter_nein()
{
	AI_Output(other,self,"DIA_Lee_Richter_nein_15_00");	//Я не буду заниматься этим. Я не хочу прислуживать этой свинье.
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_01");	//Не нервничай так. Помни о том, что именно он засадил тебя за решетку и засунул за Барьер. Или ты забыл это?
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_02");	//Поступай, как знаешь, но я надеюсь, ты примешь правильное решение.
	Info_ClearChoices(DIA_Lee_Richter);
};


instance DIA_Lee_RichterBeweise(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_RichterBeweise_Condition;
	information = DIA_Lee_RichterBeweise_Info;
	description = "Я нашел кое-что, дискредитирующее судью.";
};


func int DIA_Lee_RichterBeweise_Condition()
{
	if((Kapitel >= 3) && (MIS_Lee_JudgeRichter == LOG_Running) && Npc_HasItems(other,ItWr_RichterKomproBrief_MIS) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Lee_RichterBeweise_Info()
{
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_00");	//Я нашел кое-что, дискредитирующее судью.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_01");	//Правда? И что же?
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_02");	//Он нанял головорезов, чтобы те ограбили губернатора Хориниса.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_03");	//Вскоре после этого он арестовал их и забрал себе все золото.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_04");	//Я принес тебе в качестве доказательства письменный приказ судьи этим головорезам.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_05");	//Покажи.
	B_GiveInvItems(other,self,ItWr_RichterKomproBrief_MIS,1);
	B_UseFakeScroll();
	if(!Npc_IsDead(Richter))
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_06");	//Наконец-то. Этого должно быть достаточно, чтобы заставить его страдать. Я восхищен.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_07");	//Я готов хорошо заплатить за это. Держи свою награду.
		CreateInvItems(self,ItMi_Gold,500);
		B_GiveInvItems(self,other,ItMi_Gold,500);
		MIS_Lee_JudgeRichter = LOG_SUCCESS;
		B_GivePlayerXP(XP_JudgeRichter);
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_08");	//И не говори об этом никому, хорошо?
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_09");	//Это потрясающе. Но вопрос решился сам собой. Судья мертв.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_10");	//Какой-то идиот прикончил его. Ох, да. Меня это тоже, в общем-то, устраивает.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_11");	//Вот несколько монет. Эта бумажка сейчас большего не стоит.
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
		MIS_Lee_JudgeRichter = LOG_FAILED;
		B_GivePlayerXP(XP_Ambient);
	};
};


instance DIA_Lee_TalkAboutBennet(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_TalkAboutBennet_Condition;
	information = DIA_Lee_TalkAboutBennet_Info;
	permanent = FALSE;
	description = "Что насчет Беннета?";
};


func int DIA_Lee_TalkAboutBennet_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Lee_TalkAboutBennet_Info()
{
	AI_Output(other,self,"DIA_Lee_TalkAboutBennet_15_00");	//Что насчет Беннета?
	AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_01");	//Так ты уже знаешь. Эти ублюдки посадили его за решетку. Вот и все.
	AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_02");	//Как будто мне не хватает проблем с моими людьми - теперь я должен заботиться еще и о паладинах.
	B_Lee_Teleport();
};


instance DIA_Lee_DoAboutBennet(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_DoAboutBennet_Condition;
	information = DIA_Lee_DoAboutBennet_Info;
	permanent = FALSE;
	description = "Что ты собираешься сделать для Беннета?";
};


func int DIA_Lee_DoAboutBennet_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Lee_TalkAboutBennet))
	{
		return TRUE;
	};
};

func void DIA_Lee_DoAboutBennet_Info()
{
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_00");	//Что ты собираешься сделать для Беннета?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_01");	//Я пока не знаю. Часть парней готовы хоть сейчас ворваться в город и вбить зубы лорду Хагену по самые гланды.
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_02");	//К счастью, у нас недостаточно людей для такой операции, и, кроме того, это не в моем стиле.
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_03");	//То есть ты собираешься сидеть сложа руки?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_04");	//Конечно, нет.
	B_LogEntry(TOPIC_RescueBennet,"Если я не смогу доказать невиновность Беннета достаточно быстро, Ли ничего не может гарантировать. Его люди могут не выдержать и напасть на город в любой момент, чтобы освободить Беннета.");
	if(!Npc_IsDead(Lares))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_05");	//Ларес все еще в городе и пытается выяснить, как можно вытащить Беннета.
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_06");	//А пока я попытаюсь успокоить моих парней. Остается надеяться, что Ларесу не понадобится слишком много времени на это.
	};
};


instance DIA_Lee_CanHelpYou(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_CanHelpYou_Condition;
	information = DIA_Lee_CanHelpYou_Info;
	permanent = FALSE;
	description = "Могу я как-нибудь помочь с Беннетом?";
};


func int DIA_Lee_CanHelpYou_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Lee_DoAboutBennet))
	{
		return TRUE;
	};
};

func void DIA_Lee_CanHelpYou_Info()
{
	AI_Output(other,self,"DIA_Lee_CanHelpYou_15_00");	//Могу я как-нибудь помочь с Беннетом?
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_01");	//Конечно, но помни, что в таком деле нужен трезвый ум и холодный расчет.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_02");	//Иннос свидетель, горячих идиотов здесь и так хватает.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_03");	//Иди в город, может, тебе удастся найти способ вытащить Беннета оттуда.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_04");	//Но не затягивай сильно с этим делом, я не знаю, как долго мне удастся удерживать парней под контролем.
};


var int DIA_Lee_AnyNews_OneTime;

instance DIA_Lee_AnyNews(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_AnyNews_Condition;
	information = DIA_Lee_AnyNews_Info;
	permanent = TRUE;
	description = "Есть новости о Беннете?";
};


func int DIA_Lee_AnyNews_Condition()
{
	if((MIS_RescueBennet != FALSE) && Npc_KnowsInfo(other,DIA_Lee_DoAboutBennet) && (DIA_Lee_AnyNews_OneTime == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Lee_AnyNews_15_00");	//Есть новости о Беннете?
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_01");	//Ну, по крайней мере, тюрьма, похоже, не сильно сказалась на его здоровье.
		AI_Output(self,other,"DIA_Lee_AnyNews_04_02");	//Отличная работа.
		B_Lee_Teleport();
		if(DIA_Lee_AnyNews_OneTime == FALSE)
		{
			B_GivePlayerXP(XP_AmbientKap3);
			DIA_Lee_AnyNews_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_03");	//Нет, мы все еще знаем недостаточно.
	};
};


instance DIA_Lee_SYLVIO(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_SYLVIO_Condition;
	information = DIA_Lee_SYLVIO_Info;
	description = "Что произошло за последнее время?";
};


func int DIA_Lee_SYLVIO_Condition()
{
	if(MIS_ReadyforChapter4 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_SYLVIO_Info()
{
	AI_Output(other,self,"DIA_Lee_SYLVIO_15_00");	//Что произошло за последнее время?
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_01");	//Сильвио, ублюдок, прослышал о драконах в Долине Рудников и свел с ума всех здесь на ферме баснями о них.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_02");	//Он пытался уговорить парней пойти с ним в Долину Рудников. Он обещал им славу, почет, золото и еще кучу всяческих благ.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_03");	//Большинство не особенно воодушевилось идеей быть убитым ради Сильвио, но все же нашлось несколько идиотов, которые клюнули на его наживку.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_04");	//Все закончилось тем, что они вооружились у Беннета, а затем свалили.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_05");	//(облегченно) Ах. Откровенно говоря, я даже рад, что Сильвио наконец ушел с фермы.
	B_Lee_Teleport();
};


var int DIA_Lee_Teacher_permanent;
var int Lee_Labercount;
var int DIA_Lee_TeachState_2H;

func void B_Lee_CommentFightSkill()
{
	if(Lee_Labercount == 0)
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_1H_5_04_00");	//Твои кисти слишком напряжены. Ты должен держать оружие свободнее.
		Lee_Labercount = 1;
	}
	else if(Lee_Labercount == 1)
	{
		AI_Output(self,other,"DIA_DIA_Lee_DI_Teach_2H_1_04_00");	//Всегда помни: боковой удар должен идти от бедра, а не от запястья.
		Lee_Labercount = 2;
	}
	else if(Lee_Labercount == 2)
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_2H_5_04_00");	//Сильнейший удар бесполезен, если он приходится в никуда. Так что старайся точно рассчитывать удары.
		Lee_Labercount = 0;
	};
};

func void B_Lee_TeachNoMore()
{
	AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00");	//Теперь ты настоящий мастер боя двуручным оружием.
	AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01");	//Ты больше не нуждаешься в учителях.
};

instance DIA_Lee_CanTeach(C_Info)
{
	npc = SLD_800_Lee;
	nr = 10;
	condition = DIA_Lee_CanTeach_Condition;
	information = DIA_Lee_CanTeach_Info;
	permanent = TRUE;
	description = "Ты можешь обучить меня?";
};


func int DIA_Lee_CanTeach_Condition()
{
//	if((Kapitel >= 4) && (Lee_TeachPlayer == FALSE))
	if(Lee_TeachPlayer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_15_00");	//Ты можешь обучить меня?
	if(RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Lee)
	{
		B_Lee_TeachNoMore();
		Lee_TeachPlayer = TRUE;
		DIA_Lee_Teacher_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_01");	//Я могу показать тебе, как сражаться двуручным оружием.
		if(!TeacherCanTrainTalent(NPC_TALENT_2H,TeachCondition_2H_Lee))
		{
			AI_Output(self,other,"DIA_Lee_CanTeach_04_02");	//Но у меня нет времени на то, чтобы учить тебя основам.
			AI_Output(self,other,"DIA_Lee_CanTeach_04_03");	//Как только ты достигнешь определенного уровня, я в твоем распоряжении. А пока поищи другого учителя.
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_CanTeach_04_04");	//Я слышал, что ты очень хорош. Но готов поспорить, что я все же могу научить тебя парочке-другой приемов.
			if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
			{
				Lee_TeachPlayer = TRUE;
				Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
				B_LogEntry(Topic_SoldierTeacher,"Ли может обучить меня искусству обращения с двуручным оружием.");
			}
			else
			{
				AI_Output(self,other,"DIA_Lee_CanTeach_04_05");	//Так что, если хочешь, я могу потренировать тебя. Впрочем, не бесплатно.
				AI_Output(other,self,"DIA_Lee_CanTeach_15_06");	//Сколько?
				AI_Output(self,other,"DIA_Lee_CanTeach_04_07");	//1000 монет - и считай, что мы договорились.
				Info_ClearChoices(DIA_Lee_CanTeach);
				Info_AddChoice(DIA_Lee_CanTeach,"Это слишком дорого для меня.",DIA_Lee_CanTeach_No);
				if(Npc_HasItems(other,ItMi_Gold) >= 1000)
				{
					Info_AddChoice(DIA_Lee_CanTeach,"Договорились. Вот золото.",DIA_Lee_CanTeach_Yes);
				};
			};
		};
	};
};

func void DIA_Lee_CanTeach_No()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_No_15_00");	//Это слишком дорого для меня.
	AI_Output(self,other,"DIA_Lee_CanTeach_No_04_01");	//Подумай на досуге. Учителя моего калибра встречаются нечасто.
	Info_ClearChoices(DIA_Lee_CanTeach);
};

func void DIA_Lee_CanTeach_Yes()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_Yes_15_00");	//Договорились. Вот золото.
	AI_Output(self,other,"DIA_Lee_CanTeach_Yes_04_01");	//Хорошо, поверь мне: я стою этих денег.
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Lee_TeachPlayer = TRUE;
	Info_ClearChoices(DIA_Lee_CanTeach);
	Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry(Topic_SoldierTeacher,"Ли может обучить меня искусству обращения с двуручным оружием.");
};

func void B_BuildLearnDialog_Lee()
{
	if(VisibleTalentValue(NPC_TALENT_2H) < TeachLimit_2H_Lee)
	{
		Info_ClearChoices(DIA_Lee_Teach);
		Info_AddChoice(DIA_Lee_Teach,Dialog_Back,DIA_Lee_Teach_Back);
		Info_AddChoice(DIA_Lee_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_Teach_2H_1);
		Info_AddChoice(DIA_Lee_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_Teach_2H_5);
	}
	else
	{
		if(RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Lee)
		{
			DIA_Lee_Teacher_permanent = TRUE;
		};
		PrintScreen(PRINT_NoLearnOverMAX,-1,53,FONT_Screen,2);
		B_Lee_TeachNoMore();
		AI_StopProcessInfos(self);
	};
};

instance DIA_Lee_Teach(C_Info)
{
	npc = SLD_800_Lee;
	nr = 10;
	condition = DIA_Lee_Teach_Condition;
	information = DIA_Lee_Teach_Info;
	permanent = TRUE;
	description = "Начнем обучение.";
};


func int DIA_Lee_Teach_Condition()
{
	if((Lee_TeachPlayer == TRUE) && (DIA_Lee_Teacher_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_Teach_Info()
{
	AI_Output(other,self,"DIA_Lee_Teach_15_00");	//Начнем обучение.
	B_BuildLearnDialog_Lee();
};

func void DIA_Lee_Teach_Back()
{
	Info_ClearChoices(DIA_Lee_Teach);
};

func void DIA_Lee_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,TeachLimit_2H_Lee))
	{
		B_Lee_CommentFightSkill();
		B_BuildLearnDialog_Lee();
	};
};

func void DIA_Lee_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,TeachLimit_2H_Lee))
	{
		B_Lee_CommentFightSkill();
		B_BuildLearnDialog_Lee();
	};
};


instance DIA_Lee_DRACHENEI(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_DRACHENEI_Condition;
	information = DIA_Lee_DRACHENEI_Info;
	description = "Люди-ящеры раскладывают драконьи яйца по всему острову.";
};


func int DIA_Lee_DRACHENEI_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonEgg_MIS) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Lee_DRACHENEI_Info()
{
	AI_Output(other,self,"DIA_Lee_DRACHENEI_15_00");	//Люди-ящеры раскладывают драконьи яйца по всему острову.
	AI_Output(self,other,"DIA_Lee_DRACHENEI_04_01");	//Я мог понять это раньше. Пришло время убираться отсюда.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Lee_DRACHENEI_15_02");	//А что мне делать с ними?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_03");	//Разбей их. Что еще?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_04");	//Может быть, из скорлупы можно будет сделать доспехи или еще что-нибудь.
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_05");	//Похоже, они очень крепкие. Поговори об этом с Беннетом.
		B_LogEntry(TOPIC_DRACHENEIER,"Ли не знает, что делать с драконьим яйцом. Он отправил меня к кузнецу Беннету.");
	};
	B_GivePlayerXP(XP_AmbientKap5);
};


instance DIA_Lee_KAP4_Perm(C_Info)
{
	npc = SLD_800_Lee;
	nr = 49;
	condition = DIA_Lee_KAP4_Perm_Condition;
	information = DIA_Lee_KAP4_Perm_Info;
	permanent = TRUE;
	description = "Как идут дела на ферме?";
};


func int DIA_Lee_KAP4_Perm_Condition()
{
	if((Kapitel >= 4) && (Lee_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Lee_KAP4_Perm_Info()
{
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_00");	//Как идут дела на ферме?
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_01");	//Ну, с тех пор, как Сильвио свалил, здесь стало довольно спокойно.
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_02");	//По-моему, это тоже неплохо.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_03");	//Но, к сожалению, у нас не стало меньше работы. Парни все чаще и чаще выражают недовольство, им теперь приходится работать еще и за людей Сильвио.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_04");	//Но это мои проблемы. Я справлюсь.
	B_Lee_Teleport();
};


instance DIA_Lee_GetShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_GetShip_Condition;
	information = DIA_Lee_GetShip_Info;
	description = "Ты не знаешь, как мне захватить корабль паладинов?";
};


func int DIA_Lee_GetShip_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (MIS_ShipIsFree == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_GetShip_Info()
{
	AI_Output(other,self,"DIA_Lee_GetShip_15_00");	//Ты не знаешь, как мне захватить корабль паладинов?
	AI_Output(self,other,"DIA_Lee_GetShip_04_01");	//Ты думаешь, я все еще сидел бы здесь, если бы знал? Этот корабль охраняют сильнее, чем транспорты с рудой в старой колонии.
	AI_Output(other,self,"DIA_Lee_GetShip_15_02");	//Должен же быть способ попасть на корабль.
	AI_Output(self,other,"DIA_Lee_GetShip_04_03");	//Конечно. Попасть на борт просто.
	if((MIS_Lee_JudgeRichter == LOG_SUCCESS) && !Npc_IsDead(Richter))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_04");	//Ты же знаешь, у нас судья под каблуком. Ты должен пойти к нему и вытянуть из него официальное письмо, которое позволит нам попасть на корабль.
		MIS_RichtersPermissionForShip = LOG_Running;
		B_LogEntry(Topic_Ship,"Ли полагает, что лучший способ попасть на корабль паладинов - получить письмо о соответствующих полномочиях от судьи. Но вряд ли он даст такое письмо по своей доброй воле.");
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_05");	//У меня есть поддельное письмо о предоставлении полномочий. Увидев его, корабельная стража позволит тебе пройти.
		B_LogEntry(Topic_Ship,"Ох, старина Ли! Он раздобыл поддельное письмо, которое позволит мне попасть на корабль паладинов.");
	};
	AI_Output(self,other,"DIA_Lee_GetShip_04_06");	//Но это не все. Чтобы управлять кораблем, тебе понадобится капитан, команда и много чего еще.
	AI_Output(self,other,"DIA_Lee_GetShip_04_07");	//Нужно проделать очень большую работу.
	Info_ClearChoices(DIA_Lee_GetShip);
	Info_AddChoice(DIA_Lee_GetShip,Dialog_Back,DIA_Lee_GetShip_back);
	Info_AddChoice(DIA_Lee_GetShip,"А кого мне взять в команду?",DIA_Lee_GetShip_crew);
	if(!Npc_IsDead(Torlof) && (SCGotCaptain == FALSE))
	{
		Info_AddChoice(DIA_Lee_GetShip,"Ты знаешь кого-нибудь, кто мог бы управлять кораблем?",DIA_Lee_GetShip_torlof);
	};
};

func void DIA_Lee_GetShip_torlof()
{
	AI_Output(other,self,"DIA_Lee_GetShip_torlof_15_00");	//Ты знаешь кого-нибудь, кто мог бы управлять кораблем?
	AI_Output(self,other,"DIA_Lee_GetShip_torlof_04_01");	//Насколько я знаю, Торлоф ходил в море. Он разбирается в морском деле.
	TorlofIsSailor = TRUE;
	B_LogEntry(Topic_Captain,"Торлоф - старый морской волк. Возможно, он захочет стать моим капитаном.");
};

func void DIA_Lee_GetShip_crew()
{
	AI_Output(other,self,"DIA_Lee_GetShip_crew_15_00");	//А кого мне взять в команду?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_01");	//Это ты должен решить сам. Но я бы взял только людей, которым доверяю. Ты много знаешь людей, которым можно доверять?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_02");	//Если тебе нужен кузнец в команде, попробуй уговорить Беннета. Лучше его ты вряд ли найдешь.
	if(SCToldBennetHeKnowWhereEnemy == FALSE)
	{
		B_LogEntry(Topic_Crew,"Что касается моей команды, здесь Ли мало чем может помочь мне. Но все же он дал совет - набирать только людей, которым я могу доверять. Я, пожалуй, спрошу Беннета, может быть, ему это будет интересно.");
	}
	else
	{
		B_LogEntry(Topic_Crew,"Что касается моей команды, здесь Ли мало чем может помочь мне. Но все же он дал совет - набирать только людей, которым я могу доверять.");
	};	
};

func void DIA_Lee_GetShip_back()
{
	Info_ClearChoices(DIA_Lee_GetShip);
};


instance DIA_Lee_GotRichtersPermissionForShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_GotRichtersPermissionForShip_Condition;
	information = DIA_Lee_GotRichtersPermissionForShip_Info;
	description = "Письмо сработало. Корабль теперь мой. Судья оказался очень кстати.";
};


func int DIA_Lee_GotRichtersPermissionForShip_Condition()
{
	if(MIS_RichtersPermissionForShip == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Lee_GotRichtersPermissionForShip_Info()
{
	AI_Output(other,self,"DIA_Lee_GotRichtersPermissionForShip_15_00");	//Письмо сработало. Корабль теперь мой. Судья оказался очень кстати.
	AI_Output(self,other,"DIA_Lee_GotRichtersPermissionForShip_04_01");	//Хорошо. Значит, все твои унижения перед этим ублюдком были не напрасными.
	B_GivePlayerXP(XP_AmbientKap5);
};


instance DIA_Lee_StealShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_StealShip_Condition;
	information = DIA_Lee_StealShip_Info;
	permanent = FALSE;
	description = "Я хочу украсть корабль.";
};


func int DIA_Lee_StealShip_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_GetShip) && (MIS_RichtersPermissionForShip == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Lee_StealShip_Info()
{
	AI_Output(other,self,"DIA_Lee_StealShip_15_00");	//Я хочу украсть корабль.
	AI_Output(self,other,"DIA_Lee_StealShip_04_01");	//И как ты собираешься сделать это?
	AI_Output(other,self,"DIA_Lee_StealShip_15_02");	//Легче легкого - я пойду туда, покажу им твои бумаги - и корабль мой!
	AI_Output(self,other,"DIA_Lee_StealShip_04_03");	//Ну-ну. Держи. Надеюсь, ты знаешь, что делаешь.
	CreateInvItems(self,ITWr_ForgedShipLetter_MIS,1);
	B_GiveInvItems(self,other,ITWr_ForgedShipLetter_MIS,1);
};


instance DIA_Lee_KnowWhereEnemy(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_KnowWhereEnemy_Condition;
	information = DIA_Lee_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Ты пойдешь со мной на корабле?";
};


func int DIA_Lee_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Lee_IsOnBoard == FALSE))
	{
		if(Npc_KnowsInfo(other,DIA_Lee_GetShip) || (MIS_ShipIsFree == TRUE))
		{
			return TRUE;
		};
	};
};

var int SCToldLeeHeKnowWhereEnemy;

func void DIA_Lee_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_00");	//Ты пойдешь со мной на корабле?
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_01");	//Ты шутишь? Конечно. Мне не терпится поквитаться кое с кем на материке.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_02");	//Кроме того, я могу обучить тебя искусству владения одноручным и двуручным оружием. Это может оказаться очень полезным.
	if(SCToldLeeHeKnowWhereEnemy == FALSE)
	{
		B_LogEntry(Topic_Crew,"Ли не терпится увидеть материк вновь. Он предложил мне свою поддержку. Мне будет сложно найти такого учителя боевых искусств где-либо еще.");
		SCToldLeeHeKnowWhereEnemy = TRUE;
	};
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_03");	//Все места на корабле сейчас заняты, но я вернусь, если появится какая-нибудь вакансия.
	}
	else
	{
		Info_ClearChoices(DIA_Lee_KnowWhereEnemy);
		if(!Npc_KnowsInfo(other,DIA_Lee_GetShip) && !Npc_IsDead(Torlof) && (SCGotCaptain == FALSE) && (TorlofIsSailor == FALSE))
		{
			Info_AddChoice(DIA_Lee_KnowWhereEnemy,"Ты знаешь кого-нибудь, кто мог бы управлять кораблем?",DIA_Lee_GetShip_torlof);
		};
		Info_AddChoice(DIA_Lee_KnowWhereEnemy,"Я дам тебе знать, если ты мне понадобишься.",DIA_Lee_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Lee_KnowWhereEnemy,"Пакуй свои вещи!",DIA_Lee_KnowWhereEnemy_Yes);
	};
};

func void DIA_Lee_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_00");	//Пакуй свои вещи!
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01");	//Что? Прямо сейчас?
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_02");	//Да, я скоро отправляюсь в путь, и если ты плывешь со мной, приходи в гавань. Встретимся на корабле.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03");	//Я так долго ждал этого момента. Я буду там.
	B_JoinShip(self);
};

func void DIA_Lee_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_No_15_00");	//Я дам тебе знать, если ты мне понадобишься.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_01");	//Надеюсь, ты знаешь, что делаешь. Но помни, что хороших бойцов никогда не бывает слишком много.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_02");	//(ухмыляется) Если это только не полные кретины вроде Сильвио.
	Lee_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Lee_KnowWhereEnemy);
};


instance DIA_Lee_LeaveMyShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_LeaveMyShip_Condition;
	information = DIA_Lee_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Я все-таки не могу взять тебя с собой!";
};


func int DIA_Lee_LeaveMyShip_Condition()
{
	if((Lee_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Lee_LeaveMyShip_15_00");	//Я все-таки не могу взять тебя с собой!
	AI_Output(self,other,"DIA_Lee_LeaveMyShip_04_01");	//Как скажешь. Ты знаешь, где меня найти, если что!
	Lee_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count -= 1;
	Lee_Nerver += 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Lee_StillNeedYou(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_StillNeedYou_Condition;
	information = DIA_Lee_StillNeedYou_Info;
	permanent = TRUE;
	description = "Ты мне все-таки нужен!";
};


func int DIA_Lee_StillNeedYou_Condition()
{
	if(((Lee_IsOnBoard == LOG_OBSOLETE) || (Lee_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Lee_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Lee_StillNeedYou_15_00");	//Ты мне все-таки нужен!
	if((Lee_IsOnBoard == LOG_OBSOLETE) && (Lee_Nerver <= 2))
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_01");	//Я знал, что понадоблюсь тебе! Увидимся на корабле.
		B_JoinShip(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_02");	//Знаешь, а не пошел бы ты! Сначала ты сказал, чтобы я пришел, затем отправил меня назад!
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_03");	//Найди себе другого идиота!
		AI_StopProcessInfos(self);
		Lee_IsOnBoard = LOG_FAILED;
	};
	B_CheckLog();
};

