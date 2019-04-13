
instance DIA_Addon_Senyan_EXIT(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 999;
	condition = DIA_Addon_Senyan_EXIT_Condition;
	information = DIA_Addon_Senyan_EXIT_Info;
	permanent = TRUE;
	description = "Еще увидимся.";
};


func int DIA_Addon_Senyan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Senyan_EXIT_Info()
{
	if(Senyan_Erpressung == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Senyan_EXIT_12_00");	//Ты знаешь, что тебе нужно сделать...
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Senyan_PICKPOCKET(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 900;
	condition = DIA_Addon_Senyan_PICKPOCKET_Condition;
	information = DIA_Addon_Senyan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Senyan_PICKPOCKET_Condition()
{
	return C_Beklauen(45,88);
};

func void DIA_Addon_Senyan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Senyan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Senyan_PICKPOCKET,Dialog_Back,DIA_Addon_Senyan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Senyan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Senyan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Senyan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Senyan_PICKPOCKET);
};

func void DIA_Addon_Senyan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Senyan_PICKPOCKET);
};

func void B_Senyan_Attack()
{
	AI_Output(self,other,"DIA_Addon_Senyan_Attack_12_00");	//(насмехаясь) Тогда зачем ты мне еще нужен, тунеядец?
	AI_Output(self,other,"DIA_Addon_Senyan_Attack_12_01");	//(зовет) Эй, ребята, посмотрите, кто у нас здесь!
	Senyan_Called = TRUE;
	Senyan_Erpressung = LOG_OBSOLETE;
	B_CheckLog();
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void B_Senyan_Erpressung()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Erpressung_15_00");	//Сколько ты хочешь?
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_01");	//(играя обиду) О, нет, не надо, пожалуйста. Я не хочу вымогать у тебя деньги. Я даже и не мечтал об этом.
	AI_Output(other,self,"DIA_Addon_Senyan_Erpressung_15_02");	//Тогда что тебе нужно?
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_03");	//Недавно кто-то хотел убрать Эстебана. Но напоролся на телохранителей.
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_04");	//Пойди к Эстебану и поговори с ним. Потом возвращайся.
	AI_StopProcessInfos(self);
	Log_CreateTopic(Topic_Addon_Senyan,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Senyan,LOG_Running);
	B_LogEntry(Topic_Addon_Senyan,"Сеньян узнал меня. Ему известно, кто я такой. Он хочет использовать меня для каких-то своих целей. Но сначала я должен поговорить с Эстебаном.");
};


instance DIA_Addon_BDT_1084_Senyan_Hi(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 1;
	condition = DIA_Addon_Senyan_Hi_Condition;
	information = DIA_Addon_Senyan_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Senyan_Hi_Condition()
{
	return TRUE;
};


var int Senyan_Msg;
var int Senyan_Bad;
var int Senyan_Good;

func void DIA_Addon_Senyan_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_12_00");	//А! Кто это у нас здесь?
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_12_01");	//Ну-ка, ну-ка. Вот ты где. У меня для тебя есть хорошие новости и плохие новости.
	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);
	Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi,"Сначала - хорошие.",DIA_Addon_BDT_1084_Senyan_Hi_good);
	Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi,"Сначала расскажи мне плохие новости.",DIA_Addon_BDT_1084_Senyan_Hi_bad);
};

func void DIA_Addon_BDT_1084_Senyan_Hi_good()
{
	if(Senyan_Msg == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_good_15_00");	//Сначала - хорошие.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_good_15_01");	//А что за хорошие новости?
	};
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_02");	//Ну, я не знаю, как тебе это удалось, но ты нажил себе парочку влиятельных врагов.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_03");	//Можешь считать, что тебе повезло - никто, кроме меня, тебя не узнал.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_04");	//А я человек понимающий и дружелюбный.
	Senyan_Good = TRUE;
	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);
	if(Senyan_Bad == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else
	{
		Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi,"А что там с плохими новостями?",DIA_Addon_BDT_1084_Senyan_Hi_bad);
	};
};

func void DIA_Addon_BDT_1084_Senyan_Hi_bad()
{
	if(Senyan_Msg == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_00");	//Сначала расскажи мне плохие новости.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_01");	//А что там с плохими новостями?
	};
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_02");	//Тебя ищет Ворон. И его охрана. Вообще-то все бандиты ищут тебя...
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_03");	//И если они найдут тебя, они убьют тебя.
	AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_04");	//Многие уже пытались.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_05");	//Значит, ты дерешься не хуже, чем плетешь интриги. Придти в лагерь в таких доспехах, это...
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_06");	//...все равно что придти к волкам, будучи овцой. Твоя жизнь висит на волоске, сын риска.
	Senyan_Bad = TRUE;
	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);
	if(Senyan_Good == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else
	{
		Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi,"А что за хорошие новости?",DIA_Addon_BDT_1084_Senyan_Hi_good);
	};
};


instance DIA_Addon_Senyan_unterwegs(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 99;
	condition = DIA_Addon_Senyan_unterwegs_Condition;
	information = DIA_Addon_Senyan_unterwegs_Info;
	permanent = TRUE;
	description = "По поводу Эстебана...";
};


func int DIA_Addon_Senyan_unterwegs_Condition()
{
	if((MIS_Judas != LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_BDT_1084_Senyan_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_unterwegs_Info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_unterwegs_15_00");	//По поводу Эстебана...
	AI_Output(self,other,"DIA_Addon_Senyan_unterwegs_12_01");	//Ты уже поговорил с ним?
	AI_Output(other,self,"DIA_Addon_Senyan_unterwegs_15_02");	//Еще нет.
	AI_Output(self,other,"DIA_Addon_Senyan_unterwegs_12_03");	//Тогда тебе следует сделать это поскорее.
};


instance DIA_Addon_Senyan_Attentat(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 2;
	condition = DIA_Addon_Senyan_Attentat_Condition;
	information = DIA_Addon_Senyan_Attentat_Info;
	permanent = FALSE;
	description = "Я поговорил с Эстебаном.";
};


func int DIA_Addon_Senyan_Attentat_Condition()
{
	if((MIS_Judas == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_BDT_1084_Senyan_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_Attentat_Info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_00");	//Я поговорил с Эстебаном.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_01");	//И он сказал тебе о нападении?
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_02");	//Он сказал мне найти того, кто послал убийцу. Ты что-нибудь знаешь про это?
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_03");	//Не больше тебя. Я тоже его ищу. И тут начинается самое интересное.
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_04");	//Да?
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_05");	//Я хочу, чтобы ты выполнил свое задание. Чтобы ты нашел предателя.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_06");	//(холодно) И когда ты его найдешь - ты убьешь его для меня.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_07");	//А я заберу награду.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_08");	//У меня объявление о твоем розыске - не забывай об этом. Выполняй свою работу и сделай ее хорошо. Сам понимаешь, что может случиться в ином случае.
	Info_ClearChoices(DIA_Addon_Senyan_Attentat);
	Info_AddChoice(DIA_Addon_Senyan_Attentat,"Не то чтобы у меня был выбор...",DIA_Addon_Senyan_Attentat_JA);
	Info_AddChoice(DIA_Addon_Senyan_Attentat,"Забудь об этом!",DIA_Addon_Senyan_Attentat_NO);
};

func void DIA_Addon_Senyan_Attentat_NO()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_NO_15_00");	//Забудь об этом!
	B_Senyan_Attack();
	Info_ClearChoices(DIA_Addon_Senyan_Attentat);
};

func void DIA_Addon_Senyan_Attentat_JA()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_JA_15_00");	//Не то чтобы у меня был выбор...
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_JA_12_01");	//Я знал, что мы сможем договориться.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_JA_12_02");	//(хитро) Когда ты выполнишь свою работу - и выполнишь ее хорошо - и выяснишь, кто виноват, мы убьем тупицу вместе. А теперь иди!
	Senyan_Erpressung = LOG_Running;
	Info_ClearChoices(DIA_Addon_Senyan_Attentat);
	B_LogEntry(Topic_Addon_Senyan,"Сеньян хочет, чтобы я нашел виновного и убил его. После этого я получу свою награду.");
};


instance DIA_Addon_Senyan_ChangePlan(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 3;
	condition = DIA_Addon_Senyan_ChangePlan_Condition;
	information = DIA_Addon_Senyan_ChangePlan_Info;
	permanent = FALSE;
	description = "Я передумал. Мы больше не работаем вместе!";
};


func int DIA_Addon_Senyan_ChangePlan_Condition()
{
	if((Senyan_Erpressung == LOG_Running) && (Snaf_Tip_Senyan == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_ChangePlan_Info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_ChangePlan_15_00");	//Я передумал. Мы больше не работаем вместе!
	B_Senyan_Attack();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_1084_Senyan_Found(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 3;
	condition = DIA_Addon_Senyan_Found_Condition;
	information = DIA_Addon_Senyan_Found_Info;
	permanent = FALSE;
	description = "Я нашел предателя. Это Фиск.";
};


func int DIA_Addon_Senyan_Found_Condition()
{
	if((Senyan_Erpressung == LOG_Running) && (MIS_Judas == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_Found_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Found_15_00");	//Я нашел предателя. Это Фиск.
	B_Senyan_Attack();
};


instance DIA_Addon_BDT_1084_Senyan_derbe(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 1;
	condition = DIA_Addon_Senyan_derbe_Condition;
	information = DIA_Addon_Senyan_derbe_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Senyan_derbe_Condition()
{
	if((Senyan_Erpressung == LOG_Running) && (MIS_Judas == LOG_SUCCESS) && (Npc_IsDead(Fisk) || Npc_IsDead(Esteban)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_derbe_Info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_derbe_12_00");	//(в ярости) Ты не выполнил наше соглашение.
	B_Senyan_Attack();
};

