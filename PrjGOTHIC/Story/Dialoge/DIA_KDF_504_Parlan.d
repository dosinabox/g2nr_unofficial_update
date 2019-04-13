
instance DIA_Parlan_Kap1_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap1_EXIT_Condition;
	information = DIA_Parlan_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap1_EXIT_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Parlan_Hammer;

func void B_Parlan_HAMMER()
{
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_00");	//(строго) Подожди минутку, сын мой.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_01");	//Ходят слухи, что ценный артефакт 'исчез' из нашего святилища.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_02");	//Я не хочу ничего даже слышать об этом - я жду, что он вернется на свое законное место.
	Parlan_Hammer = TRUE;
};


var int Parlan_LastPetzCounter;
var int Parlan_LastPetzCrime;

instance DIA_Parlan_PMSchulden(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_PMSchulden_Condition;
	information = DIA_Parlan_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Parlan_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Parlan_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Parlan_LastPetzCrime))
	{
		return TRUE;
	};
};

func void DIA_Parlan_PMSchulden_Info()
{
	var int diff;
	if((Parlan_Hammer == FALSE) && (Hammer_Taken == TRUE) && (other.guild == GIL_NOV) && !Npc_IsDead(Garwig))
	{
		B_Parlan_HAMMER();
	};
	AI_Output(self,other,"DIA_Parlan_PMSchulden_05_00");	//Ты нарушил законы нашей общины.
	if(B_GetTotalPetzCounter(self) > Parlan_LastPetzCounter)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_01");	//И хотя ты уже был обвинен, ты лишь усугубляешь свою вину.
		if(Parlan_Schulden < 1000)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_02");	//Твой грех может быть отпущен только посредством пожертвования большой суммы монастырю.
			AI_Output(other,self,"DIA_Parlan_PMAdd_15_00");	//Сколько?
			diff = B_GetTotalPetzCounter(self) - Parlan_LastPetzCounter;
			if(diff > 0)
			{
				Parlan_Schulden += diff * 50;
			};
			if(Parlan_Schulden > 1000)
			{
				Parlan_Schulden = 1000;
			};
			B_Say_Gold(self,other,Parlan_Schulden);
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_03");	//За кого ты себя принимаешь? Молись Инносу, чтобы он даровал прощение твоих грехов!
		};
	}
	else if(B_GetGreatestPetzCrime(self) < Parlan_LastPetzCrime)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_04");	//Твоя ситуация изменилась.
		if(Parlan_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_05");	//Больше нет свидетелей убийства, совершенного тобой!
		};
		if((Parlan_LastPetzCrime == CRIME_THEFT) || ((Parlan_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_06");	//Никто не может засвидетельствовать, что ты воровал!
		};
		if((Parlan_LastPetzCrime == CRIME_ATTACK) || ((Parlan_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_07");	//Никто больше не может засвидетельствовать, что ты принимал участие в драке!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_08");	//Все обвинения против тебя не находят подтверждения!
		};
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_09");	//Возможно, тебе удастся провести меня, но Иннос все видит!
		if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_10");	//Твои грехи забыты.
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_11");	//И постарайся, чтобы мы больше не возвращались к этому разговору!
			Parlan_Schulden = 0;
			Parlan_LastPetzCounter = 0;
			Parlan_LastPetzCrime = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_12");	//Ты должен заплатить штраф. Такова воля Инноса!
			B_Say_Gold(self,other,Parlan_Schulden);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_13");	//Освободись от своей вины!
		};
	};
	if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(DIA_Parlan_PMSchulden);
		Info_ClearChoices(DIA_Parlan_PETZMASTER);
		Info_AddChoice(DIA_Parlan_PMSchulden,"У меня недостаточно золота!",DIA_Parlan_PETZMASTER_PayLater);
		Info_AddChoice(DIA_Parlan_PMSchulden,"Сколько там нужно?",DIA_Parlan_PMSchulden_HowMuchAgain);
		if(Npc_HasItems(other,ItMi_Gold) >= Parlan_Schulden)
		{
			Info_AddChoice(DIA_Parlan_PMSchulden,"Я хочу заплатить штраф!",DIA_Parlan_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Parlan_PMSchulden_HowMuchAgain()
{
	AI_Output(other,self,"DIA_Parlan_PMSchulden_HowMuchAgain_15_00");	//Сколько там нужно?
	B_Say_Gold(self,other,Parlan_Schulden);
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
	Info_AddChoice(DIA_Parlan_PMSchulden,"У меня недостаточно золота!",DIA_Parlan_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Parlan_PMSchulden,"Сколько там нужно?",DIA_Parlan_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Parlan_Schulden)
	{
		Info_AddChoice(DIA_Parlan_PMSchulden,"Я хочу заплатить штраф!",DIA_Parlan_PETZMASTER_PayNow);
	};
};


instance DIA_Parlan_PETZMASTER(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_PETZMASTER_Condition;
	information = DIA_Parlan_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Parlan_PETZMASTER_Condition()
{
	if(B_GetGreatestPetzCrime(self) > Parlan_LastPetzCrime)
	{
		return TRUE;
	};
};

func void DIA_Parlan_PETZMASTER_Info()
{
	if((Parlan_Hammer == FALSE) && (Hammer_Taken == TRUE) && (other.guild == GIL_NOV) && !Npc_IsDead(Garwig))
	{
		B_Parlan_HAMMER();
	};
	Parlan_Schulden = 0;
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_00");	//Мы еще не успели даже поговорить, а ты уже взвалил на себя груз вины!
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_01");	//Ты обвиняешься в худшем из всех преступлений! Убийстве!
		Parlan_Schulden = B_GetTotalPetzCounter(self) * 50 + 500;
		if((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_02");	//И ты взвалил на себя груз новой вины!
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_03");	//Если бы было решать мне, ты был бы проклят на месте, ты убийца!
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_04");	//Но если ты заплатишь штраф за свое преступление, впрочем, мы простим тебе твои грехи.
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_05");	//Воровство - нарушение законов монастыря!
		if((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_06");	//Кроме того, ты нарушил и другие законы.
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_07");	//Эти прегрешения должны быть наказаны. Таков закон Инноса.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_08");	//Ты должен заплатить штраф монастырю.
		Parlan_Schulden = B_GetTotalPetzCounter(self) * 50;
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_09");	//Мы не терпим драк в монастыре. Такое поведение нарушает наши правила.
		if(PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_10");	//И зачем ты убил нашу овцу?
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_11");	//Мы живем здесь в соответствии с законами. Они касаются и тебя.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_12");	//За твое преступление ты должен сделать пожертвование монастырю.
		Parlan_Schulden = B_GetTotalPetzCounter(self) * 50;
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_13");	//Ты убил нашу овцу. Ты должен заплатить компенсацию за нее!
		Parlan_Schulden = 100;
	};
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_15_14");	//Сколько?
	if(Parlan_Schulden > 1000)
	{
		Parlan_Schulden = 1000;
	};
	B_Say_Gold(self,other,Parlan_Schulden);
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
	Info_AddChoice(DIA_Parlan_PETZMASTER,"У меня недостаточно золота!",DIA_Parlan_PETZMASTER_PayLater);
	if(Npc_HasItems(other,ItMi_Gold) >= Parlan_Schulden)
	{
		Info_AddChoice(DIA_Parlan_PETZMASTER,"Я хочу заплатить штраф!",DIA_Parlan_PETZMASTER_PayNow);
	};
};

func void DIA_Parlan_PETZMASTER_PayNow()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayNow_15_00");	//Я хочу заплатить штраф!
	B_GiveInvItems(other,self,ItMi_Gold,Parlan_Schulden);
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayNow_05_01");	//Я принимаю твое пожертвование. Твои прегрешения забыты. Я надеюсь, Иннос даст тебе мудрость не совершать больше подобных ошибок.
	B_GrantAbsolution(LOC_MONASTERY);
	Parlan_Schulden = 0;
	Parlan_LastPetzCounter = 0;
	Parlan_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
};

func void DIA_Parlan_PETZMASTER_PayLater()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayLater_15_00");	//У меня недостаточно золота!
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_01");	//Тебе стоило подумать об этом до того, как грешить.
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_02");	//Возможно, это тебя чему-нибудь научит. Не создавай проблем, и тебе не нужно будет платить.
	Parlan_LastPetzCounter = B_GetTotalPetzCounter(self);
	Parlan_LastPetzCrime = B_GetGreatestPetzCrime(self);
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
	AI_StopProcessInfos(self);
};


instance DIA_Parlan_WELCOME(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_WELCOME_Condition;
	information = DIA_Parlan_WELCOME_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Parlan_WELCOME_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void B_DIA_Parlan_WELCOME_GoForTribute()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//Когда с этим будет покончено, мы поговорим о твоей работе здесь, в монастыре.
};

func void B_DIA_Parlan_WELCOME_BringTribute2Gorax()
{
	AI_Output(self,other,"DIA_Addon_Parlan_WELCOME_05_00");	//Отнеси свое пожертвование Гораксу. Он им распорядится.
};

func void DIA_Parlan_WELCOME_Info()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_00");	//Добро пожаловать, новый послушник. Я Парлан.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_01");	//А я...
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_02");	//(прерывает) ...ПОСЛУШНИК. Не важно, кем ты был раньше. Теперь ты слуга Инноса. Только это имеет значение.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_03");	//И с принятием в Братство Огня, все твои предыдущие прегрешения будут забыты.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_04");	//Да благословит Иннос этого человека, отдавшего свою жизнь служению Ему, и смоет все его грехи.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_05");	//И что теперь?
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//Прежде всего, ты должен выполнять свои обязанности послушника. Ты будешь работать и служить Братству.
	B_GrantAbsolution(LOC_ALL);
//	Snd_Play("LEVELUP");
	Log_CreateTopic(Topic_Gemeinschaft,LOG_MISSION);
	Log_SetTopicStatus(Topic_Gemeinschaft,LOG_Running);
	B_LogEntry(Topic_Gemeinschaft,"В обязанности послушника входят работы на благо общины.");
	if(Pedro_NOV_Aufnahme_LostInnosStatue_Daron == FALSE)
	{
		if(Liesel_Giveaway == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//Но сначала отведи свою овцу к Ополосу, он позаботится о ней.
		};
		if(DIA_Gorax_GOLD_perm == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//Ты можешь отдать свое золото Гораксу, нашему управляющему. Ты найдешь его в винодельне.
			B_DIA_Parlan_WELCOME_GoForTribute();
		};
	}
	else if(DIA_Gorax_GOLD_perm == FALSE)
	{
		B_DIA_Parlan_WELCOME_BringTribute2Gorax();
		B_DIA_Parlan_WELCOME_GoForTribute();
	};
};


instance DIA_Parlan_Auge(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_Auge_Condition;
	information = DIA_Parlan_Auge_Info;
	permanent = FALSE;
	description = "Я ищу Глаз Инноса.";
};


func int DIA_Parlan_Auge_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Auge_Info()
{
	AI_Output(other,self,"DIA_Parlan_Auge_15_00");	//Я ищу Глаз Инноса.
	AI_Output(self,other,"DIA_Parlan_Auge_05_01");	//Я не знаю, кто сказал тебе о нем, но к этому божественному артефакту никто не смеет прикасаться.
	AI_Output(other,self,"DIA_Parlan_Auge_15_02");	//Где хранится Глаз Инноса?
	AI_Output(self,other,"DIA_Parlan_Auge_05_03");	//Очень немногие знают эту тайну. Попробуй найти его - и тебе это не удастся.
};


instance DIA_Parlan_Amulett(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_Amulett_Condition;
	information = DIA_Parlan_Amulett_Info;
	permanent = FALSE;
	description = "Расскажи мне о Глазе Инноса.";
};


func int DIA_Parlan_Amulett_Condition()
{
	if((Kapitel <= 2) && Npc_KnowsInfo(other,DIA_Parlan_Auge))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Amulett_Info()
{
	AI_Output(other,self,"DIA_Parlan_Amulett_15_00");	//Расскажи мне о Глазе Инноса.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_01");	//Хорошо. Глаз Инноса содержит частицу божественной силы Инноса. Только ОДИН избранный слуга Инноса может носить этот амулет.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_02");	//Он был создан, чтобы защитить нас от сил Зла, когда придет время.
};


instance DIA_Parlan_Hagen(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_Hagen_Condition;
	information = DIA_Parlan_Hagen_Info;
	permanent = FALSE;
	description = "Я должен поговорить с командующим паладинами!";
};


func int DIA_Parlan_Hagen_Condition()
{
	if((Kapitel <= 2) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Hagen_Info()
{
	AI_Output(other,self,"DIA_Parlan_Hagen_15_00");	//Я должен поговорить с командующим паладинами!
	AI_Output(self,other,"DIA_Parlan_Hagen_05_01");	//Лорд Хаген не принимает послушников - только магам позволено видеть его.
};


instance DIA_Parlan_WORK(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_WORK_Condition;
	information = DIA_Parlan_WORK_Info;
	permanent = TRUE;
	description = "Чем я могу служить общине?";
};


var int DIA_Parlan_WORK_perm;

func int DIA_Parlan_WORK_Condition()
{
	if((Kapitel == 1) && !Npc_KnowsInfo(other,DIA_Parlan_KNOWSJUDGE) && Npc_KnowsInfo(other,DIA_Parlan_WELCOME) && (DIA_Parlan_WORK_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_WORK_Info()
{
	AI_Output(other,self,"DIA_Parlan_WORK_15_00");	//Чем я могу служить общине?
	if((Liesel_Giveaway == FALSE) || (DIA_Gorax_GOLD_perm == FALSE))
	{
		AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//Прежде всего, ты должен выполнять свои обязанности послушника. Ты будешь работать и служить Братству.
		if(Liesel_Giveaway == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//Но сначала отведи свою овцу к Ополосу, он позаботится о ней.
		};
		if(DIA_Gorax_GOLD_perm == FALSE)
		{
			if(Pedro_NOV_Aufnahme_LostInnosStatue_Daron == TRUE)
			{
				B_DIA_Parlan_WELCOME_BringTribute2Gorax();
				B_DIA_Parlan_WELCOME_GoForTribute();
			}
			else
			{
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//Ты можешь отдать свое золото Гораксу, нашему управляющему. Ты найдешь его в винодельне.
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//Когда с этим будет покончено, мы поговорим о твоей работе здесь, в монастыре.
			};
		};
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(22,0,7,30))
	{
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_01");	//Сейчас время мира. Работа послушников начинается рано утром и продолжается дотемна.
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_02");	//Ты тоже должен спать. Возвращайся ко мне, когда придет время работы.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_WORK_05_03");	//Поговори с другими магами. Они дадут тебе поручения.
		AI_Output(self,other,"DIA_Parlan_WORK_05_04");	//Я буду наблюдать за твоей работой, и если ты хорошо будешь справляться с ней, ты получишь позволение войти в библиотеку, чтобы изучать учение Инноса.
		DIA_Parlan_WORK_perm = TRUE;
		MIS_KlosterArbeit = LOG_Running;
		B_LogEntry(Topic_Gemeinschaft,"Если я выполню все задания магов, мне будет даровано право посещать библиотеку.");
	};
};


instance DIA_Parlan_Stand(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_Stand_Condition;
	information = DIA_Parlan_Stand_Info;
	permanent = TRUE;
	description = "Могу я войти в библиотеку?";
};


func int DIA_Parlan_Stand_Condition()
{
	if((MIS_KlosterArbeit == LOG_Running) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Stand_Info()
{
	Kloster_Punkte = 0;
	AI_Output(other,self,"DIA_Parlan_Stand_15_00");	//Могу я войти в библиотеку?
	if(MIS_NeorasPflanzen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_01");	//Ты принес огненную крапиву брату Неорасу.
		Kloster_Punkte += 2;
	};
	if(MIS_NeorasRezept == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_02");	//Ты нашел рецепт брата Неораса.
		Kloster_Punkte += 2;
	};
	if(MIS_IsgarothWolf == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_03");	//Ты убил черного волка, терроризировавшего часовню.
		Kloster_Punkte += 1;
	};
	if(MIS_ParlanFegen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_04");	//Ты смог найти четырех послушников и подмести кельи.
		Kloster_Punkte += 3;
	};
	if(MIS_GoraxEssen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_05");	//Ты честно раздал еду послушникам, как и просил тебя брат Горакс.
		Kloster_Punkte += 1;
	}
	else if(MIS_GoraxEssen == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_06");	//Горакс неудовлетворен тобой, так как нечестно распределил еду.
	};
	if(MIS_GoraxWein == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_07");	//Ты продал вино, как того и хотел Горакс.
		Kloster_Punkte += 1;
	}
	else if(MIS_GoraxWein == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_08");	//Чем меньше мы будем говорить о вине, тем лучше...
	};
	if(Kloster_Punkte >= 8)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_09");	//Да, ты хорошо поработал. Теперь пришло время начать постигать учение Инноса. Поговори с мастером Хигласом в библиотеке.
		AI_Output(self,other,"DIA_Parlan_Stand_05_10");	//Я выдаю тебе этот ключ.
		Parlan_Erlaubnis = TRUE;
		MIS_KlosterArbeit = LOG_SUCCESS;
		Wld_AssignRoomToGuild("Kloster02",GIL_PUBLIC);
		B_GiveInvItems(self,other,ItKe_KlosterBibliothek,1);
		/*if(MIS_NeorasPflanzen == LOG_Running)
		{
			MIS_NeorasPflanzen = LOG_OBSOLETE;
		};
		if(MIS_NeorasRezept == LOG_Running)
		{
			MIS_NeorasRezept = LOG_OBSOLETE;
		};
		if(MIS_IsgarothWolf == LOG_Running)
		{
			MIS_IsgarothWolf = LOG_OBSOLETE;
		};
		if(MIS_ParlanFegen == LOG_Running)
		{
			MIS_ParlanFegen = LOG_OBSOLETE;
		};
		if(MIS_GoraxEssen == LOG_Running)
		{
			MIS_GoraxEssen = LOG_OBSOLETE;
		};
		if(MIS_GoraxWein == LOG_Running)
		{
			MIS_GoraxWein = LOG_OBSOLETE;
		};
		if(MIS_MardukBeten == LOG_Running)
		{
			MIS_MardukBeten = LOG_OBSOLETE;
		};*/
		B_CheckLog();
	}
	else if(Kloster_Punkte >= 1)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_11");	//Ты работал, конечно, но пока ты должен продолжать служить общине.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_12");	//Сначала выполни свои поручения на благо общины. А когда ты закончишь свою работу, мы вернемся к этому разговору.
	};
};


instance DIA_Parlan_Aufgabe(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 10;
	condition = DIA_Parlan_Aufgabe_Condition;
	information = DIA_Parlan_Aufgabe_Info;
	permanent = FALSE;
	description = "У тебя есть поручение для меня?";
};


func int DIA_Parlan_Aufgabe_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_00");	//У тебя есть поручение для меня?
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_01");	//Хмм... Да, ты действительно можешь сделать кое-что для общины.
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_02");	//Кельям послушников не помешает хорошая уборка. Позаботься об этом.
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_03");	//Но это займет целую вечность...
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_04");	//Тогда тебе лучше не терять время попусту, разве нет?
	MIS_ParlanFegen = LOG_Running;
	Log_CreateTopic(Topic_ParlanFegen,LOG_MISSION);
	Log_SetTopicStatus(Topic_ParlanFegen,LOG_Running);
	B_LogEntry(Topic_ParlanFegen,"Мастер Парлан хочет, чтобы я подмел четыре кельи послушников. Это займет целую вечность.");
};


instance DIA_Parlan_Fegen(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_Fegen_Condition;
	information = DIA_Parlan_Fegen_Info;
	permanent = TRUE;
	description = "Насчет келий послушников...";
};


var int DIA_Parlan_Fegen_permanent;

func int DIA_Parlan_Fegen_Condition()
{
	if((MIS_ParlanFegen == LOG_Running) && (DIA_Parlan_Fegen_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Fegen_Info()
{
	AI_Output(other,self,"DIA_Parlan_Fegen_15_00");	//Насчет келий послушников...
	if(NOV_Helfer >= 4)
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_01");	//Тебе удалось найти четырех послушников себе в помощь. Я думаю, теперь они могут вернуться к своей работе.
		AI_Output(self,other,"DIA_Parlan_Fegen_05_02");	//Отлично, послушник. Ты выполнил мое поручение.
		MIS_ParlanFegen = LOG_SUCCESS;
		B_GivePlayerXP(XP_ParlanFegen);
		DIA_Parlan_Fegen_permanent = TRUE;
		B_StartOtherRoutine(Feger1,"START");
		B_StartOtherRoutine(Feger2,"START");
		B_StartOtherRoutine(Feger3,"START");
		B_StartOtherRoutine(Babo,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_03");	//Бесспорно - это непростая задача. Но с помощью Инноса ты справишься.
	};
};


instance DIA_Parlan_LEARN(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_LEARN_Condition;
	information = DIA_Parlan_LEARN_Info;
	permanent = FALSE;
	description = "Как мне изучить основы магии?";
};


func int DIA_Parlan_LEARN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_Hagen) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Parlan_LEARN_Info()
{
	AI_Output(other,self,"DIA_Parlan_LEARN_15_00");	//Как мне изучить основы магии?
	AI_Output(self,other,"DIA_Parlan_LEARN_05_01");	//Ты здесь не для того, чтобы получить дар магии. Ты здесь, чтобы служить Инносу.
	AI_Output(self,other,"DIA_Parlan_LEARN_05_02");	//Но я могу показать тебе, как повысить твои магические способности.
	B_LogEntry(Topic_KlosterTeacher,"Мастер Парлан может помочь мне повысить мою магическую энергию.");
};


instance DIA_Parlan_KNOWSJUDGE(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_KNOWSJUDGE_Condition;
	information = DIA_Parlan_KNOWSJUDGE_Info;
	permanent = FALSE;
	description = "Я хочу пройти Испытание Огнем.";
};


func int DIA_Parlan_KNOWSJUDGE_Condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && !Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_KNOWSJUDGE_Info()
{
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_00");	//Я хочу пройти Испытание Огнем.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_01");	//Что?.. Хм... (удостоверяясь) Ты это действительно серьезно?
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_02");	//Я настаиваю.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_03");	//Ты необычный послушник. Хорошо, если ты настаиваешь, поговори с мастером Пирокаром.
	B_LogEntry(TOPIC_FireContest,"Если я хочу потребовать пройти Испытание Огнем, я должен поговорить с мастером Пирокаром.");
};


instance DIA_Parlan_TEACH_MANA(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 10;
	condition = DIA_Parlan_TEACH_MANA_Condition;
	information = DIA_Parlan_TEACH_MANA_Info;
	permanent = TRUE;
	description = "Я хочу повысить мои магические способности.";
};


func int DIA_Parlan_TEACH_MANA_Condition()
{
	if(((other.guild == GIL_KDF) || (other.guild == GIL_PAL) || ((other.guild == GIL_NOV) && Npc_KnowsInfo(hero,DIA_Parlan_LEARN))) && (Parlan_Sends == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_TEACH_MANA_Info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_MANA_15_00");	//Я хочу повысить мои магические способности.
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);
};

func void DIA_Parlan_TEACH_MANA_BACK()
{
//	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	if(other.aivar[REAL_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_00");	//Твоя магическая энергия выросла. Я не могу помочь тебе повысить ее еще больше.
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_01");	//Если ты хочешь научиться большему, поговори с Пирокаром.
		Parlan_Sends = TRUE;
	};
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
};

func void DIA_Parlan_TEACH_MANA_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);
};

func void DIA_Parlan_TEACH_MANA_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);
};


instance DIA_Parlan_MAGE(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_MAGE_Condition;
	information = DIA_Parlan_MAGE_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Parlan_MAGE_Condition()
{
//	if((other.guild == GIL_KDF) && Npc_IsInState(self,ZS_Talk))
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Parlan_MAGE_Info()
{
	AI_Output(self,other,"DIA_Parlan_MAGE_05_00");	//Ты принес клятву, брат. Добро пожаловать в наши ряды.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_01");	//Я научу тебя первому Кругу магии, когда у тебя будет достаточно опыта.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_02");	//Возьми этот рунный камень в качестве символа силы, которая теперь находится в твоих руках.
//	B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	CreateInvItem(other,ItMi_RuneBlank);
	AI_PrintScreen("Рунный камень получено",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
};


instance DIA_Parlan_CIRCLE1(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE1_Condition;
	information = DIA_Parlan_CIRCLE1_Info;
	permanent = TRUE;
//	description = B_BuildLearnString("Научи меня первому Кругу магии",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,1));
	description = B_BuildLearnString("Первый Круг магии",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,1));
};


func int DIA_Parlan_CIRCLE1_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_MAGE) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0))
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE1_Info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE1_15_00");	//Научи меня первому Кругу магии.
	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_01");	//Первый Круг магии позволит тебе использовать руны, созданные тобой.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_02");	//Теперь ты достоин узнать формулы заклинаний для создания собственных рун.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_03");	//Каждый из нас специализируется в своей области магии. Так что хорошо подумай, в какой области хочешь специализироваться ты.
	};
};


instance DIA_Parlan_CIRCLE2(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE2_Condition;
	information = DIA_Parlan_CIRCLE2_Info;
	permanent = TRUE;
//	description = B_BuildLearnString("Научи меня второму Кругу магии",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,2));
	description = B_BuildLearnString("Второй Круг магии",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,2));
};


func int DIA_Parlan_CIRCLE2_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_MAGE) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1))
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE2_Info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE2_15_00");	//Научи меня второму Кругу магии.
	if(Kapitel >= 2)
	{
		if(B_TeachMagicCircle(self,other,2))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_01");	//Войди во второй Круг и научись использовать более сильную магию.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_02");	//Но также помни, что на тебе лежит большой груз ответственности. Не передо мной и Пирокаром - перед Инносом.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_03");	//Он покажет тебе направление - но путь формируют твои дела.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_04");	//Время еще не пришло.
	};
};


instance DIA_Parlan_CIRCLE3(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE3_Condition;
	information = DIA_Parlan_CIRCLE3_Info;
	permanent = TRUE;
//	description = B_BuildLearnString("Научи меня третьему Кругу магии",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,3));
	description = B_BuildLearnString("Третий Круг магии",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,3));
};


func int DIA_Parlan_CIRCLE3_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_MAGE) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2))
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE3_Info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE3_15_00");	//Научи меня третьему Кругу магии.
	if(Kapitel >= 3)
	{
		if(B_TeachMagicCircle(self,other,3))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_01");	//Да, время пришло. Войди в третий Круг магии. Тебя ждут новые заклинания.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_02");	//Они тебе понадобятся - Зло хочет погрузить землю в хаос, и остановить его можно только с помощью силы Инноса.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_03");	//Я научил тебя всем Кругам, которыми владею сам. Каррас введет тебя в другие Круги.
			B_LogEntry(Topic_KlosterTeacher,"Брат Парлан обучил меня первым трем Кругам. Брат Каррас поможет мне изучить следующие Круги.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_04");	//Для изучения третьего Круга еще не пришло время.
	};
};


instance DIA_Parlan_TEACH(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_TEACH_Condition;
	information = DIA_Parlan_TEACH_Info;
	permanent = TRUE;
	description = "Я хочу изучить новые заклинания.";
};


func int DIA_Parlan_TEACH_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Parlan_TEACH_Info()
{
	var int abletolearn;
	abletolearn = 0;
//	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Обучи меня!
	AI_Output(other,self,"DIA_MiltenOW_Teach_15_00");	//Я хочу изучить новые заклинания.
	Info_ClearChoices(DIA_Parlan_TEACH);
	Info_AddChoice(DIA_Parlan_TEACH,Dialog_Back,DIA_Parlan_TEACH_BACK);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_LightHeal] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_LightHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightHeal)),DIA_Parlan_TEACH_LIGHT_HEAL);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_Light] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_LIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Light)),DIA_Parlan_TEACH_LIGHT);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),DIA_Parlan_TEACH_WINDFIST);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_Sleep] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_Sleep,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Sleep)),DIA_Parlan_TEACH_Sleep);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_MediumHeal] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_MediumHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MediumHeal)),DIA_Parlan_TEACH_MediumHeal);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_Fear] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_Fear,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Fear)),DIA_Parlan_TEACH_Fear);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_DestroyUndead] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_DestroyUndead,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_DestroyUndead)),DIA_Parlan_TEACH_DestroyUndead);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_FullHeal] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_FullHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FullHeal)),DIA_Parlan_TEACH_FullHeal);
		abletolearn += 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_Shrink] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH,B_BuildLearnString(NAME_SPL_Shrink,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Shrink)),DIA_Parlan_TEACH_Shrink);
		abletolearn += 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_05_01");	//Пока я ничему не могу научить тебя.
	};
};

func void DIA_Parlan_TEACH_BACK()
{
	Info_ClearChoices(DIA_Parlan_TEACH);
};

func void DIA_Parlan_TEACH_LIGHT_HEAL()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightHeal);
};

func void DIA_Parlan_TEACH_LIGHT()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Light);
};

func void DIA_Parlan_TEACH_WINDFIST()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WindFist);
};

func void DIA_Parlan_TEACH_Sleep()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Sleep);
};

func void DIA_Parlan_TEACH_MediumHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MediumHeal);
};

func void DIA_Parlan_TEACH_Fear()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Fear);
};

func void DIA_Parlan_TEACH_DestroyUndead()
{
	B_TeachPlayerTalentRunes(self,other,SPL_DestroyUndead);
};

func void DIA_Parlan_TEACH_FullHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FullHeal);
};

func void DIA_Parlan_TEACH_Shrink()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Shrink);
};


instance DIA_Parlan_Kap2_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap2_EXIT_Condition;
	information = DIA_Parlan_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

func void B_Parlan_Exit()
{
	AI_Output(self,other,"DIA_Parlan_EXIT_05_00");	//Да защитит тебя Иннос.
};


instance DIA_Parlan_Kap3_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap3_EXIT_Condition;
	information = DIA_Parlan_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap3_EXIT_Info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Parlan_IAmParlan(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = DIA_Parlan_IAmParlan_Condition;
	information = DIA_Parlan_IAmParlan_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Parlan_IAmParlan_Condition()
{
//	if((Kapitel >= 3) && Npc_IsInState(self,ZS_Talk) && ((other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	if((Kapitel >= 3) && ((other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Parlan_IAmParlan_Info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_00");	//Я вижу, ты решил сражаться на нашей стороне. Я рад.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_01");	//Нам нужны каждые сильные руки. Ты должен поговорить с Мардуком, он отвечает за вас, паладинов.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_02");	//Я не знаю, почему тебя пустили в монастырь. Я Парлан, и я отвечаю за наших послушников.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_03");	//Я не хочу, чтобы ты отрывал их от работы своими дурацкими вопросами. Надеюсь, это ясно?
		Parlan_DontTalkToNovice = LOG_Running;
		Info_ClearChoices(DIA_Parlan_IAmParlan);
		Info_AddChoice(DIA_Parlan_IAmParlan,"Я буду делать то, что сочту нужным.",DIA_Parlan_IAmParlan_MyChoice);
		Info_AddChoice(DIA_Parlan_IAmParlan,"Конечно.",DIA_Parlan_IAmParlan_OK);
	};
/*	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		Wld_InsertItem(ItKe_KlosterBibliothek,"NW_MONASTERY_CORRIDOR_02");
	};*/
};

func void DIA_Parlan_IAmParlan_MyChoice()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_MyChoice_15_00");	//Я буду делать то, что сочту нужным.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_01");	//Возможно, тому, что тебя терпят здесь, есть причины, но предел есть всему.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_02");	//Если ты будешь создавать проблемы, ты ответишь за это. Так что лучше держись подальше от послушников.
	Info_ClearChoices(DIA_Parlan_IAmParlan);
};

func void DIA_Parlan_IAmParlan_OK()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_OK_15_00");	//Конечно.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_OK_05_01");	//Очень надеюсь на это.
	Info_ClearChoices(DIA_Parlan_IAmParlan);
};


instance DIA_Parlan_Bibliothek(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 40;
	condition = DIA_Parlan_Bibliothek_Condition;
	information = DIA_Parlan_Bibliothek_Info;
	permanent = FALSE;
	description = "У тебя есть что-нибудь для меня?";
};


func int DIA_Parlan_Bibliothek_Condition()
{
//	if((other.guild != GIL_KDF) && (Kapitel >= 3) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	if((other.guild != GIL_KDF) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Bibliothek_Info()
{
	AI_Output(other,self,"DIA_Parlan_Bibliothek_15_00");	//У тебя есть что-нибудь для меня?
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_00");	//Я вижу, ты решил сражаться на нашей стороне. Я рад.
	};
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_01");	//Да. Как читателю библиотеки, тебе выдается ключ от нее. Там ты найдешь братьев Карраса и Хигласа.
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_02");	//Если хочешь, ты можешь поговорить с ними.
	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_DontDisturb_05_03");	//Но оставь в покое послушников!
	};
	B_GiveInvItems(self,other,ItKe_KlosterBibliothek,1);
};


instance DIA_Parlan_DontDisturb(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = DIA_Parlan_DontDisturb_Condition;
	information = DIA_Parlan_DontDisturb_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Parlan_DontDisturb_Condition()
{
//	if((Parlan_DontTalkToNovice == LOG_SUCCESS) && (B_GetGreatestPetzCrime(self) == CRIME_NONE) && ((other.guild != GIL_PAL) || (other.guild != GIL_NOV) || (other.guild != GIL_KDF)))
	if((Parlan_DontTalkToNovice == LOG_SUCCESS) && (B_GetGreatestPetzCrime(self) == CRIME_NONE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_DontDisturb_Info()
{
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_00");	//(угрожающе) Я не люблю повторять. Оставь послушников в покое.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_01");	//Они должны очищать свой дух физическим трудом и готовить себя к жизни в монастыре.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_02");	//(резко) Я не потерплю вмешательства в их работу!
	Parlan_DontTalkToNovice = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Parlan_Kap3U4U5_PERM(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = DIA_Parlan_Kap3U4U5_PERM_Condition;
	information = DIA_Parlan_Kap3U4U5_PERM_Info;
	permanent = TRUE;
	description = "Где мне найти...";
};


func int DIA_Parlan_Kap3U4U5_PERM_Condition()
{
	if((Kapitel >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap3U4U5_PERM_Info()
{
	AI_Output(other,self,"DIA_Parlan_Kap3_PERM_15_00");	//Где мне найти...
	Info_ClearChoices(DIA_Parlan_Kap3U4U5_PERM);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,Dialog_Back,DIA_Parlan_Kap3U4U5_PERM_Back);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"... церковь?",DIA_Parlan_Kap3U4U5_PERM_Church);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"... библиотеку?",DIA_Parlan_Kap3U4U5_PERM_Library);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"... часовню?",DIA_Parlan_Kap3U4U5_PERM_Chapel);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"... подвал?",DIA_Parlan_Kap3U4U5_PERM_Cellar);
};

func void DIA_Parlan_Kap3U4U5_PERM_Back()
{
	Info_ClearChoices(DIA_Parlan_Kap3U4U5_PERM);
};

func void DIA_Parlan_Kap3U4U5_PERM_Church()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Church_15_00");	//... церковь?
	AI_Output(self,other,"DIA_Parlan_Add_05_00");	//О, господи! Неужели Иннос ослепил тебя?!
	AI_Output(self,other,"DIA_Parlan_Add_05_01");	//(цинично) Где церковь? Ох, боже, и куда же она подевалась?!
};

func void DIA_Parlan_Kap3U4U5_PERM_Library()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Library_15_00");	//... библиотеку?
	AI_Output(self,other,"DIA_Parlan_Add_05_02");	//Библиотека находится в конце колоннады слева, прямо напротив церкви.
};

func void DIA_Parlan_Kap3U4U5_PERM_Chapel()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Chapel_15_00");	//... часовню?
	AI_Output(self,other,"DIA_Parlan_Add_05_03");	//Часовня находится в комнате посередине левой колоннады. Там паладины молятся Инносу.
};

func void DIA_Parlan_Kap3U4U5_PERM_Cellar()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Cellar_15_00");	//... подвал?
	AI_Output(self,other,"DIA_Parlan_Add_05_04");	//Вход в подвал находится посередине колоннады справа.
};


instance DIA_Parlan_Kap4_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap4_EXIT_Condition;
	information = DIA_Parlan_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap4_EXIT_Info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Parlan_Kap5_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap5_EXIT_Condition;
	information = DIA_Parlan_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap5_EXIT_Info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	AI_StopProcessInfos(self);
};

