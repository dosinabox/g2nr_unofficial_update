
var int Morgan_Perm_Counter;

instance DIA_Addon_Morgan_EXIT(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 999;
	condition = DIA_Addon_Morgan_EXIT_Condition;
	information = DIA_Addon_Morgan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Morgan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Morgan_EXIT_Info()
{
	if(GregIsBack == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Morgan_Perm_15_00");	//Можешь отправляться спать дальше.
		if(Morgan_Perm_Counter == 0)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_01");	//(зевает) Отличная мысль.
			Morgan_Perm_Counter = 1;
		}
		else if(Morgan_Perm_Counter == 1)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_02");	//(сонно) Что ж, спокойной ночи.
			Morgan_Perm_Counter = 2;
		}
		else if(Morgan_Perm_Counter == 2)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_03");	//(устало) С огромным удовольствием.
			Morgan_Perm_Counter = 3;
		}
		else if(Morgan_Perm_Counter == 3)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_04");	//Разбуди меня, если что-нибудь произойдет.
			Morgan_Perm_Counter = 0;
		};
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Morgan_PICKPOCKET(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 900;
	condition = DIA_Addon_Morgan_PICKPOCKET_Condition;
	information = DIA_Addon_Morgan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Addon_Morgan_PICKPOCKET_Condition()
{
	return C_Beklauen(20,43);
};

func void DIA_Addon_Morgan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Morgan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Morgan_PICKPOCKET,Dialog_Back,DIA_Addon_Morgan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Morgan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Morgan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Morgan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Morgan_PICKPOCKET);
};

func void DIA_Addon_Morgan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Morgan_PICKPOCKET);
};


instance DIA_Addon_Morgan_Anheuern(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 1;
	condition = DIA_Addon_Morgan_Anheuern_Condition;
	information = DIA_Addon_Morgan_Anheuern_Info;
	important = TRUE;
};


func int DIA_Addon_Morgan_Anheuern_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GregIsBack == TRUE) && !Npc_IsDead(Greg))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Anheuern_Info()
{
	AI_Output(self,other,"DIA_Addon_Morgan_Anheuern_07_00");	//Замечательно! Теперь Грег заставит меня пилить доски!
	if((MIS_Addon_Greg_ClearCanyon == LOG_Running) || (MIS_Addon_MorganLurker == LOG_Running))
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Anheuern_07_01");	//(с сарказмом) Удачи в потрошении монстров!
	};
};


instance DIA_Addon_Morgan_Hello(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 1;
	condition = DIA_Addon_Morgan_Hello_Condition;
	information = DIA_Addon_Morgan_Hello_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Morgan_Hello_Condition()
{
	if((MIS_AlligatorJack_BringMeat == FALSE) && Npc_IsInState(self,ZS_Talk) && !Npc_IsDead(AlligatorJack) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Hello_15_00");	//Эй, ты!
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_01");	//(сонно) А? Что тебе нужно?
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_02");	//(сонно) Аллигатор Джек уже вернулся?
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_03");	//(сонно) Нет? Ну, значит, скоро вернется. Приятных снов.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Morgan_Meat(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 2;
	condition = DIA_Addon_Morgan_Meat_Condition;
	information = DIA_Addon_Morgan_Meat_Info;
	description = "Я принес мясо.";
};


func int DIA_Addon_Morgan_Meat_Condition()
{
	if((MIS_AlligatorJack_BringMeat == LOG_Running) && Npc_HasItems(other,ItFoMuttonRaw))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Meat_Info()
{
	var int GivenMeat;
	AI_Output(other,self,"DIA_Addon_Morgan_Meat_15_00");	//Я принес мясо.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_01");	//(просыпается) А-а-а. Мне нужно глотнуть рома, чтобы проснуться.
		CreateInvItems(self,ItFo_Addon_Rum,1);
		B_UseItem(self,ItFo_Addon_Rum);
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_02");	//Так-то лучше. Еще раз, что ты хотел?
		AI_Output(other,self,"DIA_Addon_Morgan_Meat_15_03");	//Я принес мясо. От Аллигатора Джека.
	};
	AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_04");	//Точно! Я вспомнил! Мясо! Давай его сюда.
	GivenMeat = Npc_HasItems(other,ItFoMuttonRaw);
	if(GivenMeat > 10)
	{
		GivenMeat = 10;
	};
	B_GiveInvItems(other,self,ItFoMuttonRaw,GivenMeat);
	if(GivenMeat < 10)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_05");	//Это все? Остальное, наверное, сам съел? Ну ладно...
	};
	B_LogEntry(TOPIC_Addon_BringMeat,"Я принес мясо Моргану.");
	MIS_AlligatorJack_BringMeat = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_AlligatorJAck_BringMeat);
};


instance DIA_Addon_Morgan_Job(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 3;
	condition = DIA_Addon_Morgan_Job_Condition;
	information = DIA_Addon_Morgan_Job_Info;
	description = "Что ты здесь делаешь?";
};


func int DIA_Addon_Morgan_Job_Condition()
{
//	if(Npc_KnowsInfo(other,DIA_Addon_Morgan_Meat) || (GregIsBack == TRUE) || Npc_IsDead(AlligatorJack))
//	{
//		return TRUE;
//	};
	return TRUE;
};

func void DIA_Addon_Morgan_Job_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Job_15_01");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_01");	//Грег назначил меня командиром одного из боевых отрядов.
	if(!Npc_IsDead(AlligatorJack))
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Job_07_02");	//Я отвечаю за снабжение лагеря. Мясо мне поставляет Аллигатор Джек.
	};
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_03");	//Еще я слежу за тем, чтобы к лагерю не подходили дикие звери, которых тут полно.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_04");	//За этим следят мои парни.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Job_07_05");	//Я сказал им, что к возвращению Грега здесь не должно быть (зевает) ни одного зверя.
	};
};


instance DIA_Addon_Morgan_Sleep(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 4;
	condition = DIA_Addon_Morgan_Sleep_Condition;
	information = DIA_Addon_Morgan_Sleep_Info;
	description = "А сам ты что-нибудь делаешь?";
};


func int DIA_Addon_Morgan_Sleep_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Morgan_Job))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Sleep_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Sleep_15_00");	//А сам ты что-нибудь делаешь?
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_01");	//На что это ты намекаешь?!
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_02");	//Да моя работа здесь самая важная.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_03");	//Я обучаю своих людей.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_04");	//Я делаю из них лучших и самых отважных бойцов, которых когда-либо видели эти воды.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_05");	//Но они не из тех, кто продает себя по дешевке.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_06");	//За свой труд они получают порядочный куш золота.
};


instance DIA_Addon_Morgan_JoinMorgan(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 5;
	condition = DIA_Addon_Morgan_JoinMorgan_Condition;
	information = DIA_Addon_Morgan_JoinMorgan_Info;
	description = "Я хочу вступить в твой отряд.";
};


func int DIA_Addon_Morgan_JoinMorgan_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Morgan_Sleep))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_JoinMorgan_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_JoinMorgan_15_00");	//Я хочу вступить в твой отряд.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_01");	//(смеется) Мой отряд? Мой отряд сейчас валяется на пляже.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_03");	//Они палец о палец не ударят до тех пор, пока капитан не вернется. Это я тебе точно говорю.
	};
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_04");	//Но если ты хочешь показать всем остальным, из чего ты сделан, то ступай на северный пляж.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_05");	//Там полно луркеров... и черт знает, чего еще.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_06");	//Разберись с ними, и ты заработаешь... (зевает) уважение людей...
		AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_07");	//Добро пожаловать в мой отряд. Хе-хе. А я (зевает) еще посплю...
	};
	Log_CreateTopic(TOPIC_Addon_MorganBeach,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MorganBeach,LOG_Running);
	B_LogEntry(TOPIC_Addon_MorganBeach,"Я присоединился к боевой группе Моргана. Он хочет, чтобы я очистил северный пляж от монстров.");
	MIS_Addon_MorganLurker = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Morgan_LurkerPlatt(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 6;
	condition = DIA_Addon_Morgan_LurkerPlatt_Condition;
	information = DIA_Addon_Morgan_LurkerPlatt_Info;
	permanent = TRUE;
	description = "На северном пляже теперь безопасно.";
};


func int DIA_Addon_Morgan_LurkerPlatt_Condition()
{
	if(Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && (MIS_Addon_MorganLurker == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_LurkerPlatt_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_00");	//На северном пляже теперь безопасно.
	AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_01");	//А пещера? Там ты тоже побывал?
	if(Npc_IsDead(BeachShadowbeast1))
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_02");	//Конечно.
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_03");	//Отлично. Ты хороший человек.
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_04");	//Вот твоя награда.
		CreateInvItems(self,ItMi_Gold,150);
		B_GiveInvItems(self,other,ItMi_Gold,150);
		B_LogEntry(TOPIC_Addon_MorganBeach,"Все чудовища на пляже убиты.");
		MIS_Addon_MorganLurker = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Morgan_LurkerPlatt);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_05");	//Э-э-э...
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_06");	//Это тоже часть твоего задания. Возвращайся, когда закончишь.
		B_LogEntry(TOPIC_Addon_MorganBeach,"Морган попросил меня заняться пещерой.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Morgan_Auftrag2(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 99;
	condition = DIA_Addon_Morgan_Auftrag2_Condition;
	information = DIA_Addon_Morgan_Auftrag2_Info;
	permanent = TRUE;
	description = "Для меня есть еще какая-нибудь работа?";
};


func int DIA_Addon_Morgan_Auftrag2_Condition()
{
	if(MIS_Addon_MorganLurker == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Auftrag2_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Auftrag2_15_00");	//Для меня есть еще какая-нибудь работа?
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_01");	//Пока нет.
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_02");	//Отдохни, полежи, выпей рома!
		CreateInvItems(self,ItFo_Addon_Rum,1);
		B_UseItem(self,ItFo_Addon_Rum);
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_03");	//Ух! Чертовски забористая вещь!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_04");	//Тебе лучше спросить капитана.
	};
	AI_StopProcessInfos(self);
};


var int Morgan_AngusStory;

instance DIA_Addon_Morgan_FOUNDTHEM(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 7;
	condition = DIA_Addon_Morgan_FOUNDTHEM_Condition;
	information = DIA_Addon_Morgan_FOUNDTHEM_Info;
	permanent = TRUE;
	description = "Насчет Хэнка и Ангуса...";
};


func int DIA_Addon_Morgan_FOUNDTHEM_Condition()
{
	if((MIS_Addon_Morgan_SeekTraitor != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Skip_AngusHank))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_FOUNDTHEM_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_00");	//Насчет Хэнка и Ангуса...
	if(Morgan_AngusStory == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_01");	//Не напоминай мне о них.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_02");	//Наверняка они попали в руки бандитов.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_03");	//А у Ангуса было мое кольцо.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_04");	//Нет, конечно, это было уже ЕГО кольцо. Он выиграл его у меня в кости.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_05");	//Но я бы обязательно отыгрался. А теперь оно пропало навсегда!
		Morgan_AngusStory = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
	if(Npc_HasItems(other,ItRi_Addon_MorgansRing_Mission))
	{
		Info_AddChoice(DIA_Addon_Morgan_FOUNDTHEM,"Я нашел их.",DIA_Addon_Morgan_FOUNDTHEM_Now);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_06");	//Если найдешь мое кольцо, принеси его мне. Я тебе достойно заплачу!
	};
};

func void DIA_Addon_Morgan_FOUNDTHEM_Now()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_01");	//Я нашел их.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_07");	//Ну, говори. Что с ними?
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_03");	//Они мертвы.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_08");	//А кольцо? Что с кольцом?
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
	Info_AddChoice(DIA_Addon_Morgan_FOUNDTHEM,"Вот оно.",DIA_Addon_Morgan_FOUNDTHEM_GiveRing);
	Info_AddChoice(DIA_Addon_Morgan_FOUNDTHEM,"У них его не было.",DIA_Addon_Morgan_FOUNDTHEM_NoRing);
};

func void DIA_Addon_Morgan_FOUNDTHEM_NoRing()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_15_00");	//У них его не было.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_01");	//(в ужасе) Что? Возвращайся и поищи получше. Оно должно было быть у Ангуса.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_02");	//Это небольшое кольцо, украшенное сложными узорами.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_03");	//Ты должен найти его! Должен!
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
};

func void DIA_Addon_Morgan_FOUNDTHEM_GiveRing()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_15_00");	//Вот оно.
	B_GiveInvItems(other,self,ItRi_Addon_MorgansRing_Mission,1);
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_01");	//(радостно) Да, это оно! Спасибо тебе!
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_02");	//Вот, возьми эту каменную табличку. Возможно, она на первый взгляд и бесполезна, но Гаретт тебе за нее хорошо заплатит.
	MIS_Addon_Morgan_SeekTraitor = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_MorgansRing);
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
	B_GiveInvItems(self,other,ItWr_StonePlateCommon_Addon,1);
};


instance DIA_Addon_Morgan_Francis(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 5;
	condition = DIA_Addon_Morgan_Francis_Condition;
	information = DIA_Addon_Morgan_Francis_Info;
	description = "Что ты думаешь о Фрэнсисе?";
};


func int DIA_Addon_Morgan_Francis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut) || (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Francis_15_00");	//Что ты думаешь о Фрэнсисе?
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_01");	//Я ничего не имею против него, (угрожающе) пока он ко мне не лезет!
	if(GregIsBack == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Morgan_Francis_15_02");	//Он здесь начальник?
		AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_03");	//(смеется) Он ДУМАЕТ, что он главный.
		AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_04");	//Но когда вернется Грег, Фрэнсис снова займется своей обычной работой - пилением досок.
	};
};


instance DIA_Addon_Morgan_TRAIN(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 5;
	condition = DIA_Addon_Morgan_TRAIN_Condition;
	information = DIA_Addon_Morgan_TRAIN_Info;
	description = "А меня ты можешь чему-нибудь научить?";
};


func int DIA_Addon_Morgan_TRAIN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Morgan_Sleep))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_TRAIN_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_TRAIN_15_00");	//А меня ты можешь чему-нибудь научить?
	AI_Output(self,other,"DIA_Addon_Morgan_TRAIN_07_01");	//Конечно. Я могу улучшить твое умение обращаться с одноручным оружием.
	if(!Npc_KnowsInfo(other,DIA_Addon_Bones_Teacher))
	{
		Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);
	};
	Morgan_Addon_TeachPlayer = TRUE;
};


var int Morgan_merke1h;
var int Morgan_Labercount;

instance DIA_Addon_Morgan_Teach(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 99;
	condition = DIA_Addon_Morgan_Teach_Condition;
	information = DIA_Addon_Morgan_Teach_Info;
	permanent = TRUE;
	description = "Я готов учиться!";
};


func int DIA_Addon_Morgan_Teach_Condition()
{
	if(Morgan_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Teach_15_00");	//Я готов учиться!
//	Morgan_merke1h = other.HitChance[NPC_TALENT_1H];
	Morgan_merke1h = other.aivar[REAL_TALENT_1H];
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
	Info_AddChoice(DIA_Addon_Morgan_Teach,Dialog_Back,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice(DIA_Addon_Morgan_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Morgan_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Morgan_Teach_1H_5);
};

func void DIA_Addon_Morgan_Teach_Back()
{
//	if(other.HitChance[NPC_TALENT_1H] > Morgan_merke1h)
	if(other.aivar[REAL_TALENT_1H] > Morgan_merke1h)
	{
		if(Morgan_Labercount == 0)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_00");	//Итак, забудь всю эту ерунду насчет чести и всего прочего. Либо ты убиваешь врага, либо он тебя.
			Morgan_Labercount = 1;
		}
		else if(Morgan_Labercount == 1)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_01");	//Ты научишься вкладывать больше силы в свои удары.
			Morgan_Labercount = 2;
		}
		else if(Morgan_Labercount == 2)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_02");	//Ха-ха. Ну, теперь ты хотя бы знаешь, с какой стороны браться за меч.
			Morgan_Labercount = 0;
		};
	}
//	else if(other.HitChance[NPC_TALENT_1H] >= 75)
	else if(other.aivar[REAL_TALENT_1H] >= 75)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Teach_Back_07_00");	//Если ты хочешь стать еще лучше, ты должен найти более опытного учителя.
	};
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
};

func void DIA_Addon_Morgan_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,75);
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
	Info_AddChoice(DIA_Addon_Morgan_Teach,Dialog_Back,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice(DIA_Addon_Morgan_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Morgan_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Morgan_Teach_1H_5);
};

func void DIA_Addon_Morgan_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,75);
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
	Info_AddChoice(DIA_Addon_Morgan_Teach,Dialog_Back,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice(DIA_Addon_Morgan_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Morgan_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Morgan_Teach_1H_5);
};

