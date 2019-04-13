
instance DIA_Dexter_EXIT(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 999;
	condition = DIA_Dexter_EXIT_Condition;
	information = DIA_Dexter_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dexter_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dexter_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dexter_Hallo(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 1;
	condition = DIA_Dexter_Hallo_Condition;
	information = DIA_Dexter_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dexter_Hallo_Condition()
{
	if(Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dexter_Hallo_Info()
{
	AI_Output(self,other,"DIA_Dexter_Hallo_09_00");	//Посмотрите, кто пришел. Великий освободитель. Что ж, герой, что ты делаешь здесь?
	AI_Output(other,self,"DIA_Dexter_Hallo_15_01");	//Я хочу получить ответы на несколько вопросов.
	if(Ranger_SCKnowsDexter == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_00");	//Не ожидал я, что ты придешь сюда добровольно.
		AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_01");	//Что ты имеешь в виду?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_02");	//Я имею в виду, что я разыскивал тебя. Неужели тебе не попадались мои объявления о розыске?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_03");	//На них изображена твоя рожа. Да-да, тебя усиленно разыскивают. Разве ты не знал?
	}
	else
	{
		AI_Output(other,self,"DIA_Dexter_Hallo_15_02");	//КТО-ТО распространяет листки бумаги с моим изображением. КОЕ-КТО сказал мне, что это ты.
		AI_Output(self,other,"DIA_Dexter_Hallo_09_03");	//Кто-то слишком много болтает.
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_04");	//Впрочем, ты прав. Я распространял объявления о розыске. Я искал тебя - и ты явился.
		MIS_Steckbriefe = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	};
	AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_05");	//Итак, что тебе от меня надо?
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_06");	//Мне? Абсолютно ничего. Но мой хозяин просто дьявольски жаждет твоей смерти.
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_07");	//Поэтому он приказал мне найти тебя и доставить ему твою голову.
};


instance DIA_Dexter_Glaube(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Dexter_Glaube_Condition;
	information = DIA_Dexter_Glaube_Info;
	permanent = FALSE;
	description = "Я не верю ни одному твоему слову.";
};


func int DIA_Dexter_Glaube_Condition()
{
	if(Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dexter_Glaube_Info()
{
	AI_Output(other,self,"DIA_Dexter_Glaube_15_00");	//Я не верю ни одному твоему слову.
	AI_Output(self,other,"DIA_Dexter_Glaube_09_01");	//Послушай, это все правда. Клянусь могилой своей матери!
};


instance DIA_Addon_Dexter_Patrick(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Addon_Dexter_Patrick_Condition;
	information = DIA_Addon_Dexter_Patrick_Info;
	description = "К вам приходил наемник по имени Патрик?";
};


func int DIA_Addon_Dexter_Patrick_Condition()
{
	if((MIS_Addon_Cord_Look4Patrick == LOG_Running) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Patrick_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Patrick_15_00");	//К вам приходил наемник по имени Патрик?
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_01");	//Патрик? Не понимаю, о ком ты говоришь.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_02");	//Я припоминаю какого-то крикливого наемника, который иногда здесь появлялся и болтал с ребятами.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_03");	//Но я не видел его уже черт знает сколько времени.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_04");	//Возможно, он в конце концов нарвался на неприятности. Мне это неизвестно.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Декстер утверждает, что не знает наемника Патрика.");
	Dexter_KnowsPatrick = TRUE;
	B_GivePlayerXP(XP_Addon_Dexter_KnowsPatrick);
};


instance DIA_Addon_Dexter_Greg(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Addon_Dexter_Greg_Condition;
	information = DIA_Addon_Dexter_Greg_Info;
	description = "Тебя ищет человек с повязкой на глазу!";
};


func int DIA_Addon_Dexter_Greg_Condition()
{
	if((SC_KnowsGregsSearchsDexter == TRUE) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Greg_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Greg_15_00");	//Тебя ищет человек с повязкой на глазу!
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_01");	//Меня все ищут. Но это их дело.
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_02");	//Если этому человеку есть, что сказать, то пусть он приходит сюда.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Dexter_missingPeople(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Addon_Dexter_missingPeople_Condition;
	information = DIA_Addon_Dexter_missingPeople_Info;
	description = "Ты похищаешь жителей Хориниса!";
};


func int DIA_Addon_Dexter_missingPeople_Condition()
{
	if((SC_KnowsDexterAsKidnapper == TRUE) && (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_missingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_15_00");	//Ты похищаешь жителей Хориниса!
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_01");	//Итак, ты это выяснил. Хорошая работа, приятель.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_02");	//А я-то думал, я надежно заметаю все следы.
	Info_ClearChoices(DIA_Addon_Dexter_missingPeople);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"Кто отдает тебе приказы?",DIA_Addon_Dexter_missingPeople_wer);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"Куда попадают похищенные люди? Работают где-то здесь в рудниках?",DIA_Addon_Dexter_missingPeople_Wo);
};

func void DIA_Addon_Dexter_missingPeople_Wo()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Wo_15_00");	//Куда попадают похищенные люди? Работают где-то здесь в рудниках?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_01");	//(смеется) Нет-нет, они далеко на северо-востоке. Тебе туда не добраться.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_02");	//Я мог бы показать тебе, где именно, но мне совершенно не хочется.
};

func void DIA_Addon_Dexter_missingPeople_wer()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_wer_15_00");	//Кто отдает тебе приказы?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_01");	//Хозяин. Очень опасный человек. Впрочем, ты его знаешь. Это Ворон, один из бывших рудных баронов из Долины Рудников.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_02");	//Эти люди нужны ему для выполнения его планов. И это все, что тебе нужно знать.
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"Ворон опасен? Перестань...",DIA_Addon_Dexter_missingPeople_Raven);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople,"Рудный барон здесь, в Хоринисе?",DIA_Addon_Dexter_missingPeople_RavenTot);
};

func void DIA_Addon_Dexter_missingPeople_Raven()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Raven_15_00");	//Ворон опасен? Перестань...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_01");	//(раздраженно) Да что тебе известно? Ты не знаешь его, как я знаю.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_02");	//(неуверенно) Тогда он действительно был жалкой свиньей, но теперь...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_03");	//После падения Барьера он изменился. На его лицо легла черная тень.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_04");	//(со страхом) Если слишком долго смотреть ему в глаза, его взгляд пронзит тебя, как когти хищника.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_05");	//Я дам тебе один совет. Беги из Хориниса. Беги, пока еще не слишком поздно.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_06");	//(мрачно) Здесь тебя ждет лишь верная смерть.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"У декстера есть клиент. Зовут его Ворон. Ворон - бывший рудный барон. Похоже, что именно Ворон стоит за всеми этими похищениями людей. Теперь мне нужно только получить доказательство этого.");
	Info_ClearChoices(DIA_Addon_Dexter_missingPeople);
};

func void DIA_Addon_Dexter_missingPeople_RavenTot()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_RavenTot_15_00");	//Рудный барон здесь, в Хоринисе?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_RavenTot_09_01");	//Он больше не рудный барон. У него свои планы, и скоро Хоринис падет к его ногам.
};


instance DIA_Addon_Dexter_Boss(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 3;
	condition = DIA_Addon_Dexter_Boss_Condition;
	information = DIA_Addon_Dexter_Boss_Info;
	description = "Твой хозяин? Кто это такой?";
};


func int DIA_Addon_Dexter_Boss_Condition()
{
	if((Knows_Dexter == TRUE) && (SC_KnowsDexterAsKidnapper == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Boss_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Boss_15_00");	//Твой хозяин? Кто это такой?
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_01");	//(смеется) Тебе, наверняка, не терпится это узнать? Понимаю.
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_02");	//(серьезно) Не вижу ни одной причины, по которой я должен тебе это сказать.
};


instance DIA_Dexter_Vor(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Dexter_Vor_Condition;
	information = DIA_Dexter_Vor_Info;
	permanent = FALSE;
	description = "И что ты собираешься делать сейчас? Убить меня?";
};


func int DIA_Dexter_Vor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Dexter_missingPeople))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Vor_Info()
{
	AI_Output(other,self,"DIA_Dexter_Vor_15_00");	//И что ты собираешься делать сейчас? Убить меня?
	AI_Output(self,other,"DIA_Dexter_Vor_09_01");	//Да. Но ты освободил нас всех. Вот почему я даю тебе еще один шанс. Сваливай - исчезни, сделайся невидимым. Уходи и больше не попадайся мне на пути.
	AI_Output(other,self,"DIA_Addon_Dexter_Vor_15_00");	//Я должен узнать, куда ты отправил людей.
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_01");	//(смеется) Ты мог бы попробовать силой заставить меня говорить...
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_02");	//(угрожающе) Думаю, тебе лучше уйти.
	AI_Output(self,other,"DIA_Dexter_Vor_09_02");	//Если я увижу тебя еще раз, то без колебаний убью!
	Dexter_NoMoreSmallTalk = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Dexter_Kill(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 2;
	condition = DIA_Dexter_Kill_Condition;
	information = DIA_Dexter_Kill_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dexter_Kill_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((Dexter_NoMoreSmallTalk == TRUE) || (Knows_Dexter == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Kill_Info()
{
	if(Knows_Dexter == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Dexter_Add_09_02");	//Ты сам напросился...
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_01");	//Ох, тебе не стоило показываться здесь. Ты оказался не в то время и не в том месте.
	};
	MIS_Steckbriefe = LOG_OBSOLETE;
	B_CheckLog();
	B_Greg_ComesToDexter();
	Info_ClearChoices(DIA_Dexter_Kill);
	Info_AddChoice(DIA_Dexter_Kill,Dialog_Ende,DIA_Dexter_Kill_ENDE);
};

func void DIA_Dexter_Kill_ENDE()
{
	var C_Item itm;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	itm = Npc_GetEquippedArmor(Greg_NW);
	if(Hlp_IsItem(itm,ITAR_PIR_H_Addon) == FALSE)
	{
		AI_EquipArmor(Greg_NW,ITAR_PIR_H_Addon);
	};
};


instance DIA_Dexter_Kopf(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 5;
	condition = DIA_Dexter_Kopf_Condition;
	information = DIA_Dexter_Kopf_Info;
	permanent = FALSE;
	description = "Тебе нужна моя голова? Что ж, попробуй ее взять!";
};


func int DIA_Dexter_Kopf_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dexter_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Kopf_Info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Add_15_00");	//Тебе нужна моя голова? Что ж, попробуй ее взять!
	AI_Output(self,other,"DIA_Addon_Dexter_Add_09_01");	//Ну, если ты так хочешь...
	DIA_Dexter_Kill_ENDE();
};


instance DIA_Dexter_PICKPOCKET(C_Info)
{
	npc = BDT_1060_Dexter;
	nr = 900;
	condition = DIA_Dexter_PICKPOCKET_Condition;
	information = DIA_Dexter_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Dexter_PICKPOCKET_Condition()
{
	return C_Beklauen(96,370);
};

func void DIA_Dexter_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
	Info_AddChoice(DIA_Dexter_PICKPOCKET,Dialog_Back,DIA_Dexter_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dexter_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dexter_PICKPOCKET_DoIt);
};

func void DIA_Dexter_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
};

func void DIA_Dexter_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
};

