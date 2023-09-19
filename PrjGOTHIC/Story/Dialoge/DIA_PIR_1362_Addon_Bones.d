
instance DIA_Addon_Bones_EXIT(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 999;
	condition = DIA_Addon_Bones_EXIT_Condition;
	information = DIA_Addon_Bones_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Bones_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bones_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


func void B_Addon_Bones_KeineZeit()
{
	AI_Output(self,other,"DIA_Addon_Bones_Train_01_01");	//Извини, у меня сейчас совсем нет времени.
	AI_Output(self,other,"DIA_Addon_Bones_Train_01_02");	//Мне нужно тренироваться.
};


instance DIA_Addon_Bones_Anheuern(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 1;
	condition = DIA_Addon_Bones_Anheuern_Condition;
	information = DIA_Addon_Bones_Anheuern_Info;
	description = "Нас ждет каньон.";
};


func int DIA_Addon_Bones_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Anheuern_15_01");	//Нас ждет каньон.
	B_Addon_Bones_KeineZeit();
};


instance DIA_Addon_Bones_Hello(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 5;
	condition = DIA_Addon_Bones_Hello_Condition;
	information = DIA_Addon_Bones_Hello_Info;
	permanent = FALSE;
	description = "Как дела?";
};


func int DIA_Addon_Bones_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bones_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Hello_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Addon_Bones_Hello_01_01");	//Грех жаловаться. Немного скучновато, но зато работать не приходится.
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_01");	//Я готовлюсь к новому заданию, которое дал мне Грег.
	AI_Output(other,self,"DIA_Addon_Bones_Work_15_02");	//Что это за задание?
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_03");	//Я не могу тебе сказать.
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_04");	//Не обижайся, приятель, но я тяжело трудился, чтобы получить это задание, и не хочу снова его потерять.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Bones_Train(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 5;
	condition = DIA_Addon_Bones_Train_Condition;
	information = DIA_Addon_Bones_Train_Info;
	permanent = FALSE;
	description = "Ты можешь меня чему-нибудь научить?";
};


func int DIA_Addon_Bones_Train_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bones_Hello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_Train_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Train_15_00");	//Ты можешь меня чему-нибудь научить?
	B_Addon_Bones_KeineZeit();
};


instance DIA_Addon_Bones_Teacher(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 5;
	condition = DIA_Addon_Bones_Teacher_Condition;
	information = DIA_Addon_Bones_Teacher_Info;
	permanent = FALSE;
	description = "Кто здесь может чему-нибудь меня научить?";
};


func int DIA_Addon_Bones_Teacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bones_Train))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_Teacher_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Teacher_15_00");	//Кто здесь может чему-нибудь меня научить?
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_04");	//Генри и Морган командуют нашими боевыми группами.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_05");	//Они могут научить тебя лучше сражаться.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_07");	//Люди Генри используют двуручное оружие.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_08");	//Морган же предпочитает более быстрые одноручные клинки.
	AI_Output(other,self,"DIA_Addon_Bones_Teacher_15_09");	//А еще?
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_10");	//Знаешь, честно говоря, я больше ничем не интересовался.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_11");	//Но думаю, Аллигатору Джеку и Сэмюэлю найдется, чем с тобой поделиться.
	Knows_HenrysEntertrupp = TRUE;
	if(Henry_Addon_TeachPlayer == FALSE)
	{
		Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	};
	if(Morgan_Addon_TeachPlayer == FALSE)
	{
		Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);
	};
};


instance DIA_Addon_Bones_Francis(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 3;
	condition = DIA_Addon_Bones_Francis_Condition;
	information = DIA_Addon_Bones_Francis_Info;
	permanent = FALSE;
	description = "Что ты скажешь о Фрэнсисе?";
};


func int DIA_Addon_Bones_Francis_Condition()
{
	if(C_CanAskPiratesAboutFrancis())
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Francis_15_00");	//Что ты скажешь о Фрэнсисе?
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Bones_Francis_01_03");	//Посмотри вокруг. Работает только Генри и его люди.
		AI_Output(self,other,"DIA_Addon_Bones_Francis_01_04");	//Морган целыми днями либо спит, либо пьет самогон.
		AI_Output(self,other,"DIA_Addon_Bones_Francis_01_05");	//При Греге такого не бывает. Если ты бездельничаешь, ты получаешь по шее. Вот и все.
	}
	else
	{
		B_Addon_Bones_KeineZeit();
	};
};


var int DIA_Addon_Bones_WantArmor_Once;

instance DIA_Addon_Bones_WantArmor(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 2;
	condition = DIA_Addon_Bones_WantArmor_Condition;
	information = DIA_Addon_Bones_WantArmor_Info;
	permanent = TRUE;
	description = "Отдай мне бандитские доспехи.";
};


func int DIA_Addon_Bones_WantArmor_Condition()
{
	if((Greg_GaveArmorToBones == TRUE) && (MIS_Greg_ScoutBandits == FALSE) && !C_SCHasBDTArmor())
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_WantArmor_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_WantArmor_15_00");	//Отдай мне бандитские доспехи.
	AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_01");	//Я еще не свихнулся. Грег мне голову оторвет.
	AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_02");	//Он сказал мне, что без его приказа я не должен никому их отдавать.
	if(GregIsBack == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_03");	//Нет, я не могу дать их тебе. Тем более, когда Грег здесь.
	};
	if(DIA_Addon_Bones_WantArmor_Once == FALSE)
	{
		B_LogEntry(TOPIC_Addon_BDTRuestung,"Бонес не отдаст мне доспехи, пока я не получу разрешение Грега.");
		DIA_Addon_Bones_WantArmor_Once = TRUE;
	};
};


instance DIA_Addon_Bones_GiveArmor(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 2;
	condition = DIA_Addon_Bones_GiveArmor_Condition;
	information = DIA_Addon_Bones_GiveArmor_Info;
	permanent = FALSE;
	description = "Ты должен отдать мне доспехи бандитов. Приказ Грега.";
};


func int DIA_Addon_Bones_GiveArmor_Condition()
{
	if((MIS_Greg_ScoutBandits == LOG_Running) && !C_SCHasBDTArmor())
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_GiveArmor_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_GiveArmor_15_00");	//Ты должен отдать мне доспехи бандитов. Приказ Грега.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_01");	//Приказ Грега? Фу, а я-то думал мне действительно придется идти на это задание.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_02");	//Разведка в лагере бандитов - это просто самоубийство.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_03");	//Пусть уж лучше Грег взвалит на меня какую-нибудь скучную работу...
	AI_Output(other,self,"DIA_Addon_Bones_GiveArmor_15_04");	//(раздраженно) Доспехи.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_05");	//Да, конечно, вот они.
	B_GiveArmor(ITAR_BDT_M);
	Bones_ArmorGiven = TRUE;
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_06");	//Будь осторожнее. С этими бандитами шутки плохи.
	self.flags = 0;
	B_SetMortal(Greg);
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Приказ Грега возымел свое действие. Доспехи у меня!");
	B_GivePlayerXP(XP_Bones_GetBDTArmor);
};

