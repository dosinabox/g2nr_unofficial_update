
instance DIA_Addon_Esteban_EXIT(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 999;
	condition = DIA_Addon_Esteban_EXIT_Condition;
	information = DIA_Addon_Esteban_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Esteban_EXIT_Condition()
{
	if(Bodyguard_Killer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Esteban_PICKPOCKET(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 900;
	condition = DIA_Addon_Esteban_PICKPOCKET_Condition;
	information = DIA_Addon_Esteban_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Addon_Esteban_PICKPOCKET_Condition()
{
	return C_Beklauen(105,500);
};

func void DIA_Addon_Esteban_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Esteban_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Esteban_PICKPOCKET,Dialog_Back,DIA_Addon_Esteban_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Esteban_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Esteban_PICKPOCKET_DoIt);
};

func void DIA_Addon_Esteban_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Esteban_PICKPOCKET);
};

func void DIA_Addon_Esteban_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Esteban_PICKPOCKET);
};


instance DIA_Addon_Esteban_Hi(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 2;
	condition = DIA_Addon_Esteban_Hi_Condition;
	information = DIA_Addon_Esteban_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Esteban_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_00");	//Так ты тот самый парень, что с боем пробился в лагерь.
	AI_Output(other,self,"DIA_Addon_Esteban_Hi_15_01");	//Слухи быстро распространяются...
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_02");	//Франко был крепким орешком. Никто не хотел связываться с ним. Никто - кроме тебя.
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_03");	//Просто чтобы сразу прояснить ситуацию - если ты затеешь то же со мной, я убью тебя.
};


instance DIA_Addon_Esteban_Mine(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 3;
	condition = DIA_Addon_Esteban_Mine_Condition;
	information = DIA_Addon_Esteban_Mine_Info;
	permanent = FALSE;
	description = "Я хочу попасть в шахту!";
};


func int DIA_Addon_Esteban_Mine_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Mine_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Mine_15_00");	//Я хочу попасть в шахту!
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_01");	//(ухмыляясь) Естественно. Тогда ты пришел в правильное место к правильному человеку.
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_02");	//Потому что каждый, кто копает в шахте, оставляет себе изрядную долю золота.
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_03");	//А я выдаю красные камни, один из которых тебе будет нужен, чтобы Торус впустил тебя.
};


instance DIA_Addon_Esteban_Rot(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 3;
	condition = DIA_Addon_Esteban_Rot_Condition;
	information = DIA_Addon_Esteban_Rot_Info;
	permanent = FALSE;
	description = "Дай мне один из этих красных камней.";
};


func int DIA_Addon_Esteban_Rot_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Mine))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Rot_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Rot_15_00");	//Дай мне один из этих красных камней.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_01");	//Хорошо, но это не бесплатно.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_02");	//Обычно я прошу часть того золота, что рудокоп получает за работу.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_03");	//(оценивающе) Много ли ты знаешь о том, как добывать золото?
	if(Hero_HackChance > 25)
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_04");	//Ты, наверное, наработал несколько приемов, верно?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_05");	//Кажется, ты об этом ничего не знаешь.
	};
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_06");	//(фальшиво) Если я и дам тебе красный камень, то не потому, что ты такой хороший рудокоп.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_07");	//Нет, у меня есть для тебя другая работа...
};


instance DIA_Addon_Esteban_MIS(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 4;
	condition = DIA_Addon_Esteban_MIS_Condition;
	information = DIA_Addon_Esteban_MIS_Info;
	permanent = FALSE;
	description = "Какая работа?";
};


func int DIA_Addon_Esteban_MIS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Rot))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_MIS_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_00");	//Какая работа?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_01");	//Один из бандитов хотел меня убить. Но вместо этого мои охранники убили ЕГО.
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_02");	//Он хотел занять твое место?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_03");	//Он был просто дурень! Безмозглый убийца. Самому ему бы никогда в голову не пришло напасть на меня.
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_04");	//Он выполнял чье-то задание - кто-то послал его сделать это...
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_05");	//Так что же, мне нужно найти того, кто стоит за всем этим?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_06");	//Тот, кто послал убийцу, заплатит за это. Найди его - и я дам тебе пропуск в шахту.
	if(!Npc_IsDead(Senyan) && Npc_KnowsInfo(other,DIA_Addon_BDT_1084_Senyan_Hi))
	{
		AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_07");	//Сеньян послал меня к тебе по этому делу.
		AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_08");	//Сеньян? Он тоже работает на меня. Я сказал ему, чтобы он смотрел в оба.
	};
	MIS_Judas = LOG_Running;
	Log_CreateTopic(Topic_Addon_Esteban,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Esteban,LOG_Running);
	B_LogEntry(Topic_Addon_Esteban,"На жизнь Эстебана было совершено покушение. Я должен выяснить, кто за этим стоит.");
};


instance DIA_Addon_Esteban_Kerl(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_Kerl_Condition;
	information = DIA_Addon_Esteban_Kerl_Info;
	permanent = FALSE;
	description = "И что мне нужно сделать?";
};


func int DIA_Addon_Esteban_Kerl_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Kerl_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Kerl_15_00");	//И что мне нужно сделать?
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_01");	//Все в лагере знают об этом знают. Поэтому ты играешь в открытую.
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_02");	//Постарайся выяснить, кто на моей стороне, а кто - против, и не дай ребятам себя обдурить!
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_03");	//Поговори со Снафом. Этот жирный повар много знает.
	B_LogEntry(Topic_Addon_Esteban,"Чтобы найти виновного, я должен поговорить с людьми в лагере и выяснить, на чьей они стороне. Снаф может мне помочь - ему многое известно.");
};


instance DIA_Addon_Esteban_Armor(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 9;
	condition = DIA_Addon_Esteban_Armor_Condition;
	information = DIA_Addon_Esteban_Armor_Info;
	permanent = FALSE;
	description = "Мне нужны доспехи получше.";
};


func int DIA_Addon_Esteban_Armor_Condition()
{
	if(Huno_ArmorCheap == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Armor_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Armor_15_00");	//Мне нужны доспехи получше.
	AI_Output(self,other,"DIA_Addon_Esteban_Armor_07_01");	//Зачем? У тебя уже есть доспехи, пока что вполне можешь обойтись ими!
	if(MIS_Judas == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Armor_07_02");	//Если ты выполнишь мое задание, мы поговорим об этом...
	};
};


instance DIA_Addon_Esteban_Auftrag(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 99;
	condition = DIA_Addon_Esteban_Auftrag_Condition;
	information = DIA_Addon_Esteban_Auftrag_Info;
	permanent = TRUE;
	description = "По поводу задания...";
};


func int DIA_Addon_Esteban_Auftrag_Condition()
{
	if(((MIS_Judas == LOG_Running) || (MIS_Judas == LOG_SUCCESS)) && (Bodyguard_Killer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Auftrag_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_00");	//По поводу задания...
	AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_01");	//Послушай, у меня есть и другие дела.
	if(MIS_Judas == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_02");	//Я думал, тебе будет интересно, кто организовал нападение...
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_03");	//И кто же это? Скажи мне его имя - и мои ребята свернут ему шею...
		AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_04");	//Его организовал торговец Фиск. В данный момент он сидит в баре, пьет и ничего не подозревает...
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_05");	//ХА! Отличная работа, сынок. Мои охранники займутся им.
		AI_TurnToNPC(self,Wache_01);
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_06");	//Вы слышали, что он сказал, ребята. Пойдите и схватите Фиска.
		AI_TurnToNPC(self,other);
		Bodyguard_Killer = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_07");	//Возвращайся, когда ты выяснишь, кто стоит за нападением.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Esteban_Away(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_Away_Condition;
	information = DIA_Addon_Esteban_Away_Info;
	permanent = FALSE;
	description = "И что теперь будет?";
};


func int DIA_Addon_Esteban_Away_Condition()
{
	if(Bodyguard_Killer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Away_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Away_15_00");	//И что теперь будет?
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_01");	//Что теперь будет? Я скажу тебе, что будет.
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_02");	//Фиск умрет мучительной смертью. И весь лагерь будет знать, за что.
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_03");	//Это послужит им всем предупреждением.
	B_StartOtherRoutine(Wache_01,"AMBUSH");
	B_StartOtherRoutine(Wache_02,"AMBUSH");
};


instance DIA_Addon_Esteban_Stone(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_Stone_Condition;
	information = DIA_Addon_Esteban_Stone_Info;
	permanent = FALSE;
	description = "Могу я теперь получить красный камень?";
};


func int DIA_Addon_Esteban_Stone_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Away) && (Bodyguard_Killer == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Stone_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Stone_15_00");	//Могу я теперь получить красный камень?
	AI_Output(self,other,"DIA_Addon_Esteban_Stone_07_01");	//Ты хорошо справился с работой. Тебе нечего делать в шахте.
	AI_Output(self,other,"DIA_Addon_Esteban_Stone_07_02");	//Я могу использовать тебя с большей выгодой. Ты останешься в лагере и будешь продолжать работать на меня.
};


instance DIA_Addon_Esteban_not(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_not_Condition;
	information = DIA_Addon_Esteban_not_Info;
	permanent = FALSE;
	description = "Я подумаю об этом.";
};


func int DIA_Addon_Esteban_not_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Stone))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_not_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_not_15_00");	//Я подумаю об этом.
	AI_Output(self,other,"DIA_Addon_Esteban_not_07_01");	//Ты забыл, с кем ты разговариваешь. Я здесь главный, и тебе придется делать то, что я скажу.
	AI_Output(self,other,"DIA_Addon_Esteban_not_07_02");	//А я сказал, что ты будешь работать на меня, а не на кого-нибудь еще. Это понятно?
};


instance DIA_Addon_Esteban_fight(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 6;
	condition = DIA_Addon_Esteban_fight_Condition;
	information = DIA_Addon_Esteban_fight_Info;
	permanent = FALSE;
	description = "Ты хочешь одурачить меня?";
};


func int DIA_Addon_Esteban_fight_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Stone))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_fight_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_00");	//Ты хочешь одурачить меня? И речи не было о том, чтобы я на тебя работал.
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_01");	//Не каждый получает такое предложение. Но если тебе оно не нравится, ты можешь свободно покинуть лагерь...
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_02");	//А может быть, ты сдержишь слово и дашь мне красный камень?
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_03");	//Эй! Еще одно слово - и моим охранникам придется применить силу.
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_04");	//(ухмыляясь) Каким охранникам?..
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_05");	//Что?.. А, понятно, ты хочешь обвести меня... Ну, погоди...
	Bodyguard_Killer = FALSE;
	B_KillNpc(Wache_01);
	B_KillNpc(Wache_02);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Addon_Esteban_Duell(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 99;
	condition = DIA_Addon_Esteban_Duell_Condition;
	information = DIA_Addon_Esteban_Duell_Info;
	permanent = FALSE;
	description = "Давай сюда камень СЕЙЧАС ЖЕ, или я заберу его сам!";
};


func int DIA_Addon_Esteban_Duell_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Rot) && (Bodyguard_Killer != TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Duell_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Duell_15_00");	//Давай сюда камень СЕЙЧАС ЖЕ, или я заберу его сам!
	AI_Output(self,other,"DIA_Addon_Esteban_Duell_07_01");	//О, у тебя есть последнее желание. Как мило. Я сделаю тебе одолжение и избавлю тебя от твоей тупости!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

