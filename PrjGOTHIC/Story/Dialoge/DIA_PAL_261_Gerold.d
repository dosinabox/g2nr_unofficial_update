
instance DIA_Gerold_EXIT(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 999;
	condition = DIA_Gerold_EXIT_Condition;
	information = DIA_Gerold_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gerold_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gerold_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gerold_Hallo(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Hallo_Condition;
	information = DIA_Gerold_Hallo_Info;
	permanent = FALSE;
	description = "Что ты охраняешь?";
};


func int DIA_Gerold_Hallo_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Gerold_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gerold_Hallo_15_00");	//Что ты охраняешь?
	AI_Output(self,other,"DIA_Gerold_Hallo_12_01");	//Заключенных.
	AI_Output(other,self,"DIA_Gerold_Hallo_15_02");	//А кто там?
	AI_Output(self,other,"DIA_Gerold_Hallo_12_03");	//Несколько каторжников и наемник Горн. Серьезный парень - сильный как бык.
	AI_Output(self,other,"DIA_Gerold_Hallo_12_04");	//Четыре человека еле затолкали его туда.
	KnowsAboutGorn = TRUE;
};


instance DIA_Gerold_Jail(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Jail_Condition;
	information = DIA_Gerold_Jail_Info;
	permanent = FALSE;
	description = "Ты пропустишь меня в темницу?";
};


func int DIA_Gerold_Jail_Condition()
{
	if((Kapitel == 2) && Npc_KnowsInfo(other,DIA_Gerold_Hallo) && (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Jail_Info()
{
	AI_Output(other,self,"DIA_Gerold_Jail_15_00");	//Ты пропустишь меня в темницу?
	AI_Output(self,other,"DIA_Gerold_Jail_12_01");	//Нет. НИКТО не может входить в темницу. Это касается ВСЕХ. Тебя, Милтена и всех остальных.
	AI_Output(self,other,"DIA_Gerold_Jail_12_02");	//Здесь вам не таверна, куда вы можете входить и выходить когда захотите. Помни об этом.
//	KnowsAboutGorn = TRUE;
};


instance DIA_Gerold_Ausnahme(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Ausnahme_Condition;
	information = DIA_Gerold_Ausnahme_Info;
	permanent = FALSE;
	description = "Ты не мог бы сделать исключение для меня?";
};


func int DIA_Gerold_Ausnahme_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gerold_Jail) && (Kapitel == 2) && (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Ausnahme_Info()
{
	AI_Output(other,self,"DIA_Gerold_Ausnahme_15_00");	//Ты не мог бы сделать исключение для меня?
	AI_Output(self,other,"DIA_Gerold_Ausnahme_12_01");	//Нет.
};


instance DIA_Gerold_Gold(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Gold_Condition;
	information = DIA_Gerold_Gold_Info;
	permanent = FALSE;
	description = "А что, если я заплачу золотом?";
};


func int DIA_Gerold_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gerold_Ausnahme) && (Kapitel == 2) && (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Gold_Info()
{
	AI_Output(other,self,"DIA_Gerold_Gold_15_00");	//А что, если я заплачу золотом?
	AI_Output(self,other,"DIA_Gerold_Gold_12_01");	//... хм...
	AI_Output(self,other,"DIA_Gerold_Gold_12_02");	//Нет.
};


instance DIA_Gerold_Deal(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Deal_Condition;
	information = DIA_Gerold_Deal_Info;
	permanent = FALSE;
	description = "У меня есть записка для одного из заключенных. Ты можешь передать ее?";
};


func int DIA_Gerold_Deal_Condition()
{
	if((MIS_RescueGorn == LOG_Running) && Npc_HasItems(other,ItWr_LetterForGorn_MIS) && (Kapitel == 2) && (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Deal_Info()
{
	AI_Output(other,self,"DIA_Gerold_Deal_15_00");	//У меня есть записка для одного из заключенных. Ты можешь передать ее?
	AI_Output(self,other,"DIA_Gerold_Deal_12_01");	//Хм... в принципе, я не вижу препятствий для этого. Для кого эта записка?
	AI_Output(other,self,"DIA_Gerold_Deal_15_02");	//Для Горна.
	AI_Output(self,other,"DIA_Gerold_Deal_12_03");	//Это очень важный заключенный. Я не думаю, что Гаронд согласится. Но если это для тебя так важно, мы всегда можем договориться.
	AI_Output(other,self,"DIA_Gerold_Deal_15_04");	//Что ты хочешь за это?
	AI_Output(self,other,"DIA_Gerold_Deal_12_05");	//Наши пайки последнее время стали совсем скудные. Я хочу нормальной еды.
	AI_Output(self,other,"DIA_Gerold_Deal_12_06");	//Принеси мне колбасы и буханку свежего хлеба - и немного сладкого меда.
	AI_Output(self,other,"DIA_Gerold_Deal_12_07");	//Бутылку вина, чтобы запить все это... Да, этого должно хватить. Я верю, у тебя получится достать все это. Так что заходи, когда найдешь продукты.
	B_LogEntry(TOPIC_RescueGorn,"Если я принесу Герольду колбасу, хлеб, вино и мед, он передаст записку Горну.");
};


instance DIA_Gerold_Stuff(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Stuff_Condition;
	information = DIA_Gerold_Stuff_Info;
	permanent = TRUE;
	description = "Я принес тебе кое-что. Вот еда, как ты и просил.";
};


var int DIA_Gerold_Stuff_permanent;

func int DIA_Gerold_Stuff_Condition()
{
	if(Npc_HasItems(other,ItWr_LetterForGorn_MIS) && Npc_KnowsInfo(other,DIA_Gerold_Deal) && (Kapitel == 2) && (DIA_Gerold_Stuff_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Stuff_Info()
{
	AI_Output(other,self,"DIA_Gerold_Stuff_15_00");	//Я принес тебе кое-что. Вот еда, как ты и просил.
	if(Npc_HasItems(other,ItFo_Honey) && Npc_HasItems(other,ItFo_Bread) && Npc_HasItems(other,ItFo_Wine) && Npc_HasItems(other,ItFo_Sausage))
	{
		Npc_RemoveInvItem(other,ItFo_Honey);
		AI_PrintScreen("Мед отдан",-1,34,FONT_ScreenSmall,2);
		Npc_RemoveInvItem(other,ItFo_Bread);
		AI_PrintScreen("Хлеб отдан",-1,37,FONT_ScreenSmall,2);
		Npc_RemoveInvItem(other,ItFo_Wine);
		AI_PrintScreen("Вино отдано",-1,40,FONT_ScreenSmall,2);
		Npc_RemoveInvItem(other,ItFo_Sausage);
		AI_PrintScreen("Колбаса отдана",-1,43,FONT_ScreenSmall,2);
		AI_Output(self,other,"DIA_Gerold_Stuff_12_01");	//Хорошо, дай посмотрю. Записка у тебя с собой?
		AI_Output(other,self,"DIA_Gerold_Stuff_15_02");	//Да, вот. Не забудь, она для Горна.
		AI_Output(self,other,"DIA_Gerold_Stuff_12_03");	//Заходи завтра, он к этому времени уже получит ее.
		B_GiveInvItems(other,self,ItWr_LetterForGorn_MIS,1);
		DayContactGorn = Wld_GetDay();
		DIA_Gerold_Stuff_permanent = TRUE;
		B_LogEntry(TOPIC_RescueGorn,"Герольд получил то, что хотел, и передаст записку.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_Stuff_12_04");	//Заходи, когда у тебя будет то, что я просил.
	};
};


instance DIA_Gerold_Antwort(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Antwort_Condition;
	information = DIA_Gerold_Antwort_Info;
	permanent = TRUE;
	description = "Горн получил записку?";
};


var int DIA_Gerold_Antwort_permanent;

func int DIA_Gerold_Antwort_Condition()
{
	if((DIA_Gerold_Stuff_permanent == TRUE) && (Kapitel == 2) && (DIA_Gerold_Antwort_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Antwort_Info()
{
	AI_Output(other,self,"DIA_Gerold_Antwort_15_00");	//Горн получил записку?
	if((DayContactGorn < Wld_GetDay()) || (MIS_RescueGorn == LOG_SUCCESS))
	{
		Npc_RemoveInvItem(self,ItWr_LetterForGorn_MIS);
		AI_Output(self,other,"DIA_Gerold_Antwort_12_01");	//Да, и я должен передать тебе его слова:
		AI_Output(other,self,"DIA_Gerold_Antwort_15_02");	//И?
		AI_Output(self,other,"DIA_Gerold_Antwort_12_03");	//'Это находится у южных ворот'.
		AI_Output(other,self,"DIA_Gerold_Antwort_15_04");	//Он сказал что-нибудь еще?
		AI_Output(self,other,"DIA_Gerold_Antwort_12_05");	//Нет. Понятия не имею, что это значит. А ты знаешь?
		AI_Output(other,self,"DIA_Gerold_Antwort_15_06");	//Возможно. Но тебе не стоит сильно напрягать мозги по этому поводу.
		AI_Output(self,other,"DIA_Gerold_Antwort_12_07");	//Да, возможно, ты прав.
		GornsTreasure = TRUE;
		DIA_Gerold_Antwort_permanent = TRUE;
		B_LogEntry(TOPIC_RescueGorn,"Горн говорит, что его золото находится у южных ворот.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_GornsAnswer_12_08");	//Нет еще. Зайди попозже.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Gerold_SetGornFree(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_SetGornFree_Condition;
	information = DIA_Gerold_SetGornFree_Info;
	permanent = FALSE;
	description = "Освободи Горна. Это приказ командующего Гаронда.";
};


func int DIA_Gerold_SetGornFree_Condition()
{
	if((Garond_Kerkerauf == TRUE) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Gerold_SetGornFree_Info()
{
	AI_Output(other,self,"DIA_Gerold_SetGornFree_15_00");	//Освободи Горна. Это приказ командующего Гаронда.
	AI_Output(self,other,"DIA_Gerold_SetGornFree_12_01");	//Мне уже сообщили об этом. Вот ключ, ты можешь войти туда.
	CreateInvItems(self,ItKe_PrisonKey_MIS,1);
	B_GiveInvItems(self,other,ItKe_PrisonKey_MIS,1);
	B_LogEntry(TOPIC_RescueGorn,"Герольд дал мне ключ от тюрьмы.");
};


instance DIA_Gerold_Perm(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 900;
	condition = DIA_Gerold_Perm_Condition;
	information = DIA_Gerold_Perm_Info;
	permanent = TRUE;
	description = "Ты когда-нибудь спишь?";
};


func int DIA_Gerold_Perm_Condition()
{
	if((Kapitel < 4) && Npc_KnowsInfo(other,DIA_Gerold_Gold) && (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Perm_Info()
{
	AI_Output(other,self,"DIA_Gerold_Perm_15_00");	//Ты когда-нибудь спишь?
	AI_Output(self,other,"DIA_Gerold_Perm_12_01");	//Нет. Сам Иннос дарует мне силу никогда не спать на посту.
};


instance DIA_Gerold_KAP4_ALLESRUHIG(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 30;
	condition = DIA_Gerold_KAP4_ALLESRUHIG_Condition;
	information = DIA_Gerold_KAP4_ALLESRUHIG_Info;
	description = "Все тихо?";
};


func int DIA_Gerold_KAP4_ALLESRUHIG_Condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Gerold_KAP4_ALLESRUHIG_Info()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_00");	//Все тихо?
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_01");	//Тихо, да.
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_02");	//Но?
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_03");	//У меня пупок уже прилип к позвоночнику. Гаронд опять урезал наши пайки.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_04");	//Если я не найду где-нибудь приличной еды, я пойду и откушу кусок жирной задницы Гаронда.
	Info_ClearChoices(DIA_Gerold_KAP4_ALLESRUHIG);
	Info_AddChoice(DIA_Gerold_KAP4_ALLESRUHIG,"Это не мои проблемы.",DIA_Gerold_KAP4_ALLESRUHIG_Nein);
	Info_AddChoice(DIA_Gerold_KAP4_ALLESRUHIG,"Возможно, я могу угостить тебя.",DIA_Gerold_KAP4_ALLESRUHIG_geben);
};

func void DIA_Gerold_KAP4_ALLESRUHIG_geben()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_geben_15_00");	//Возможно, я могу угостить тебя.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_01");	//Ты с ума сошел? Только не здесь! Если кто-нибудь это увидит, у меня сразу появится куча новых друзей, если ты понимаешь, о чем я.
	if(!Wld_IsTime(23,10,8,0))
	{
		AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_02");	//Ты найдешь меня в храме, когда все лягут спать.
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_03");	//Быстрее пошли в храм, пока остальные не повылезли из своих нор. Я не могу ждать до завтра.
	};
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_04");	//Я думаю, в это время в храме никого нет. Я буду ждать тебя там.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_05");	//Но смотри, чтобы это не оказалась черствая корка хлеба или какой-нибудь сырой кусок мяса, ты понял?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Food");
	Log_CreateTopic(TOPIC_GeroldGiveFood,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GeroldGiveFood,LOG_Running);
	B_LogEntry(TOPIC_GeroldGiveFood,"Гаронд опять урезал паек. Мне лучше принести Герольду что-нибудь поесть, пока он с голодухи не выкинул какую-нибудь глупость. Я должен встретиться с ним в доме магов, когда все уснут.");
	MIS_GeroldGiveFood = LOG_Running;
};

func void DIA_Gerold_KAP4_ALLESRUHIG_Nein()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_15_00");	//Это не мои проблемы.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_01");	//Тебе легко говорить. Твою-то пайку Гаронд наверняка не урежет.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_02");	//Даже хотя он и не признает это, он страшно напуган и видит в тебе свое единственное спасение.
	AI_StopProcessInfos(self);
};


var int Gerold_FoodCounter;

instance DIA_Gerold_FOOD(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 31;
	condition = DIA_Gerold_FOOD_Condition;
	information = DIA_Gerold_FOOD_Info;
	important = TRUE;
};


func int DIA_Gerold_FOOD_Condition()
{
	if((Npc_GetDistToWP(self,"OC_MAGE_IN") < 500) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Gerold_MoreFood()
{
	Info_ClearChoices(DIA_Gerold_FOOD);
	if(Gerold_FoodCounter > 8)
	{
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_00");	//Этого достаточно. Этого достаточно! Теперь меня некоторое время не будет мучить голод.
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_01");	//Вот мое золото. Я все равно ничего не могу на него купить здесь, а тебе оно, может быть, пригодится.
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_02");	//А теперь я лучше пойду, пока никто не увидел нас.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		MIS_GeroldGiveFood = LOG_SUCCESS;
		B_GivePlayerXP(XP_GeroldGiveFood);
		CreateInvItems(self,ItMi_Gold,450);
		B_GiveInvItems(self,other,ItMi_Gold,450);
	}
	else
	{
		if(Gerold_FoodCounter == 0)
		{
			Info_AddChoice(DIA_Gerold_FOOD,"Сейчас у меня ничего нет.",DIA_Gerold_FOOD_nichts);
		}
		else
		{
			Info_AddChoice(DIA_Gerold_FOOD,"Это все, что у меня есть.",DIA_Gerold_FOOD_kaese_nichtmehr);
			if(Gerold_FoodCounter < 5)
			{
				AI_Output(self,other,"DIA_Gerold_MoreFood_12_03");	//Конечно. Давай сюда. А еще у тебя есть?
			}
			else
			{
				AI_Output(self,other,"DIA_Gerold_MoreFood_12_04");	//Да. Еще, еще!
			};
		};
		if(Npc_HasItems(other,ItFo_FishSoup) || Npc_HasItems(other,ItFo_EddasFishSoup))
		{
			Info_AddChoice(DIA_Gerold_FOOD,"(дать уху)",DIA_Gerold_FOOD_Suppe);
		};
		if(Npc_HasItems(other,ItFo_Stew))
		{
			Info_AddChoice(DIA_Gerold_FOOD,"(дать похлебку)",DIA_Gerold_FOOD_Stew);
		};
		if(Npc_HasItems(other,ItFoMutton) || Npc_HasItems(other,ItFo_NiclasBacon))
		{
			Info_AddChoice(DIA_Gerold_FOOD,"(дать жареное мясо)",DIA_Gerold_FOOD_fleisch);
		};
		if(Npc_HasItems(other,ItFo_Bacon))
		{
			Info_AddChoice(DIA_Gerold_FOOD,"(дать окорок)",DIA_Gerold_FOOD_schinken);
		};
		if(Npc_HasItems(other,ItFo_Cheese))
		{
			Info_AddChoice(DIA_Gerold_FOOD,"(дать сыр)",DIA_Gerold_FOOD_kaese);
		};
		if(Npc_HasItems(other,ItFo_Sausage) || Npc_HasItems(other,ItFo_Schafswurst))
		{
			Info_AddChoice(DIA_Gerold_FOOD,"(дать колбасу)",DIA_Gerold_FOOD_Wurst);
		};
		Gerold_FoodCounter += 1;
	};
};

func void DIA_Gerold_FOOD_Info()
{
	AI_Output(self,other,"DIA_Gerold_FOOD_12_00");	//Вот ты где. И как? У тебя есть что-нибудь поесть?
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_nichts()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_nichts_15_00");	//Сейчас у меня ничего нет.
	AI_Output(self,other,"DIA_Gerold_FOOD_nichts_12_01");	//Сначала наобещаешь с три короба, а затем хочешь обмануть меня?
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Npc_ExchangeRoutine(self,"Start");
	MIS_GeroldGiveFood = LOG_FAILED;
	B_GivePlayerXP(100);
};

func void DIA_Gerold_FOOD_kaese_nichtmehr()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_kaese_nichtmehr_15_00");	//Это все, что у меня есть.
	AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_01");	//И я, по-твоему, поверю в это? Ладно, это все же лучше, чем ничего. Вот, возьми немного золота за это.
	CreateInvItems(self,ItMi_Gold,50);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_02");	//Хорошо. А теперь мне нужно возвращаться на мой пост.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	MIS_GeroldGiveFood = LOG_OBSOLETE;
	if(Gerold_FoodCounter < 4)
	{
		B_GivePlayerXP(100);
	}
	else
	{
		B_GivePlayerXP(XP_GeroldGiveFood / 2);
	};
};

func void DIA_Gerold_FOOD_kaese()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_kaese_15_00");	//Как насчет сочного куска сыра?
	B_GiveInvItems(other,self,ItFo_Cheese,1);
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_Wurst()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Wurst_15_00");	//Кусок колбасы?
	if(Npc_HasItems(other,ItFo_Sausage))
	{
		B_GiveInvItems(other,self,ItFo_Sausage,1);
	}
	else
	{
		B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	};
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_schinken()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_schinken_15_00");	//Я могу дать тебе этот окорок.
	B_GiveInvItems(other,self,ItFo_Bacon,1);
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_fleisch()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_fleisch_15_00");	//Кусок мяса?
	if(Npc_HasItems(other,ItFoMutton))
	{
		B_GiveInvItems(other,self,ItFoMutton,1);
	}
	else
	{
		B_GiveInvItems(other,self,ItFo_NiclasBacon,1);
	};
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_Suppe()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Suppe_15_00");	//Хороший суп еще никому не повредил, тебе так не кажется?
	if(Npc_HasItems(other,ItFo_FishSoup))
	{
		B_GiveInvItems(other,self,ItFo_FishSoup,1);
	}
	else
	{
		B_GiveInvItems(other,self,ItFo_EddasFishSoup,1);
	};
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_Stew()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Suppe_15_00");	//Хороший суп еще никому не повредил, тебе так не кажется?
	B_GiveInvItems(other,self,ItFo_Stew,1);
	DIA_Gerold_MoreFood();
};

instance DIA_Gerold_PERM4(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 41;
	condition = DIA_Gerold_PERM4_Condition;
	information = DIA_Gerold_PERM4_Info;
	permanent = TRUE;
	description = "Все еще голоден?";
};


func int DIA_Gerold_PERM4_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gerold_KAP4_ALLESRUHIG))
	{
		return TRUE;
	};
};

func void DIA_Gerold_PERM4_Info()
{
	AI_Output(other,self,"DIA_Gerold_PERM4_15_00");	//Все еще голоден?
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_01");	//Если орки атакуют нас опять, даже полный желудок не поможет мне.
	}
	else if(MIS_GeroldGiveFood == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_02");	//Ты, должно быть, шутишь. В меня больше не лезет. Спасибо еще раз.
	}
	else if(MIS_GeroldGiveFood == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_03");	//Да. Но все же, спасибо за помощь.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_04");	//Все в порядке, Мастер.
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_05");	//Проваливай!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Gerold_PICKPOCKET(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 900;
	condition = DIA_Gerold_PICKPOCKET_Condition;
	information = DIA_Gerold_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Gerold_PICKPOCKET_Condition()
{
	return C_Beklauen(71,170);
};

func void DIA_Gerold_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gerold_PICKPOCKET);
	Info_AddChoice(DIA_Gerold_PICKPOCKET,Dialog_Back,DIA_Gerold_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gerold_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gerold_PICKPOCKET_DoIt);
};

func void DIA_Gerold_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gerold_PICKPOCKET);
};

func void DIA_Gerold_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gerold_PICKPOCKET);
};

