
instance DIA_Addon_Skip_EXIT(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 999;
	condition = DIA_Addon_Skip_EXIT_Condition;
	information = DIA_Addon_Skip_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Skip_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_PICKPOCKET(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 900;
	condition = DIA_Addon_Skip_PICKPOCKET_Condition;
	information = DIA_Addon_Skip_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Addon_Skip_PICKPOCKET_Condition()
{
	return C_Beklauen(20,43);
};

func void DIA_Addon_Skip_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Skip_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Skip_PICKPOCKET,Dialog_Back,DIA_Addon_Skip_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Skip_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Skip_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Skip_PICKPOCKET);
};

func void DIA_Addon_Skip_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Skip_PICKPOCKET);
};


instance DIA_Addon_Skip_Hello(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_Hello_Condition;
	information = DIA_Addon_Skip_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Skip_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerTalkedToSkipNW == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_00");	//Так-так, кто же это повстречался старому Скипу?
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_01");	//Я тебя знаю!
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_02");	//Помнишь бухту рядом с городом?
	AI_Output(other,self,"DIA_Addon_Skip_Hello_15_03");	//Скип, верно?
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_04");	//(гордо) Вижу, я произвел на тебя впечатление.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_05");	//Но мне кажется, что я где-то еще видел твою рожу...
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_06");	//Ну конечно!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_07");	//Не полное сходство, конечно, но это точно ты.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_08");	//Но не расстраивайся, приятель. Мое лицо на объявлении о розыске выглядит не лучше.
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Addon_SkipADW_BaltramPaket(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 2;
	condition = DIA_Addon_SkipADW_BaltramPaket_Condition;
	information = DIA_Addon_SkipADW_BaltramPaket_Info;
	description = "У меня для тебя посылка от Бальтрама.";
};


func int DIA_Addon_SkipADW_BaltramPaket_Condition()
{
	if(Npc_HasItems(other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_SkipADW_BaltramPaket_Info()
{
	AI_Output(other,self,"DIA_Addon_SkipADW_BaltramPaket_15_00");	//У меня для тебя посылка от Бальтрама.
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_01");	//(усмехается) Да, похоже этот парень действительно пристрастился к нашему рому.
	B_GiveInvItems(other,self,ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_02");	//Вот, передай ему две бутылки. Третью я выпил, пока его ждал.
	B_GiveInvItems(self,other,ItFo_Addon_Rum,2);
	B_GivePlayerXP(XP_Addon_Skip_BaltramPaket);
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram);
	Skip_Rum4Baltram = TRUE;
};


instance DIA_Addon_Skip_Job(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 3;
	condition = DIA_Addon_Skip_Job_Condition;
	information = DIA_Addon_Skip_Job_Info;
	description = "Что ты делаешь здесь?";
};


func int DIA_Addon_Skip_Job_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_Job_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Job_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Addon_Skip_Job_08_01");	//Я только что вернулся из Хориниса и теперь жду возвращения Грега.
};


instance DIA_Addon_Skip_ADW_GregGetroffen(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 4;
	condition = DIA_Addon_Skip_ADW_GregGetroffen_Condition;
	information = DIA_Addon_Skip_ADW_GregGetroffen_Info;
	description = "Я видел Грега в Хоринисе.";
};


func int DIA_Addon_Skip_ADW_GregGetroffen_Condition()
{
	if((PlayerTalkedToGregNW == TRUE) && (GregIsBack == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Skip_Job))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_ADW_GregGetroffen_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ADW_GregGetroffen_15_00");	//Я видел Грега в Хоринисе.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_01");	//Правда? Дьявол! Видимо, что-то пошло не так.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_02");	//Он уже давно должен был вернуться сюда на своем корабле.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_03");	//Полагаю, я должен вернуться в Хоринис и встретиться с ним...
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_04");	//(вздыхает) Нет, пожалуй, не сегодня. В конце концов, я только что оттуда.
	B_GivePlayerXP(XP_Ambient);
};


var int Skip_Transport_Variation;

instance DIA_Addon_Skip_Transport(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 99;
	condition = DIA_Addon_Skip_Transport_Condition;
	information = DIA_Addon_Skip_Transport_Info;
	permanent = TRUE;
	description = "Ты можешь отвезти меня в Хоринис?";
};


func int DIA_Addon_Skip_Transport_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Job) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Transport_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Transport_15_00");	//Ты можешь отвезти меня в Хоринис?
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_01");	//Нет, приятель. Сейчас я никуда не поплыву. Сначала мне нужно достать себе грога.
	}
	else if(Skip_Transport_Variation == 0)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_02");	//Ты рехнулся? Мы потеряли корабль, приятель!
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_03");	//Я не собираюсь рисковать нашей последней шлюпкой только потому, что тебе лень самостоятельно дотащить свою задницу до Хориниса!
		Skip_Transport_Variation = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_04");	//Последний раз отвечаю: НЕТ!
	};
};


instance DIA_Addon_Skip_Bandits(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_Bandits_Condition;
	information = DIA_Addon_Skip_Bandits_Info;
	description = "Что ты мне можешь рассказать о бандитах?";
};


func int DIA_Addon_Skip_Bandits_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_Bandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Bandits_15_00");	//Что ты мне можешь рассказать о бандитах?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_01");	//Бандиты?! Они нападают на нас!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_02");	//Как ты думаешь, почему мы строим эту ограду?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_03");	//Мы сами привезли сюда этих подонков.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_04");	//Сначала мы с ними торговали. И скажу тебе, приятель, что у них столько золота, что они не знают, куда его девать!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_05");	//За бутылку рома они были платить любую цену.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_06");	//Но мирные времена прошли. Теперь у нас война!
	AI_Output(other,self,"DIA_Addon_Erol_Bandits_15_06");	//Что произошло?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_07");	//Эти сволочи не заплатили за последнюю поставку.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_08");	//Поэтому я пошел к ним, чтобы узнать, что случилось с нашим золотом.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_09");	//Но когда я дошел до болота, эти гады напали на меня!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_10");	//Но это еще не все. Они убили Ангуса и Хэнка - двоих наших лучших людей.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_11");	//Мой тебе совет, парень: держись от этого болота подальше.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_12");	//Бандиты нападают на каждого, кто выглядит побогаче, чем они.
};


instance DIA_Addon_Skip_ArmorPrice(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_ArmorPrice_Condition;
	information = DIA_Addon_Skip_ArmorPrice_Info;
	description = "Мне нужны доспехи бандитов.";
};


func int DIA_Addon_Skip_ArmorPrice_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_ArmorPrice_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_00");	//Мне нужны доспехи бандитов.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_01");	//Ты хочешь пойти на болото? Ты сошел с ума!
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_02");	//Как только они поймут, что ты - не один из них, тебе конец!
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_02");	//Ты не знаешь, где я могу найти бандитские доспехи?
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_03");	//(вздыхает) А тебя просто так не отговорить, верно? Ну хорошо. У нас был комплект таких доспехов.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_04");	//Он, наверное, до сих пор лежит в хижине Грега.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_05");	//Может быть, когда Грег вернется, ты сможешь купить у него доспехи...
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Скип думает, что доспехи находятся в хижине Грега.");
};


instance DIA_Addon_Skip_GregsHut(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_GregsHut_Condition;
	information = DIA_Addon_Skip_GregsHut_Info;
	permanent = FALSE;
	description = "Ты можешь сказать, как попасть в хижину Грега?";
};


func int DIA_Addon_Skip_GregsHut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_ArmorPrice) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_GregsHut_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_GregsHut_15_00");	//Ты можешь сказать, как попасть в его хижину?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_01");	//Эй, эй, не так быстро!
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_02");	//Ты же не собираешься копаться в вещах Грега?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_03");	//Когда Грег уезжал, он оставил ключ от хижины Фрэнсису и приказал ему никого не пускать внутрь.
	B_LogEntry(TOPIC_Addon_BDTRuestung,"У Фрэнсиса есть ключ от хижины, но ему приказано никого в нее не пускать.");
	Knows_GregsHut = TRUE;
};


instance DIA_Addon_Skip_Francis(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_Francis_Condition;
	information = DIA_Addon_Skip_Francis_Info;
	permanent = FALSE;
	description = "Что ты мне можешь сказать о Фрэнсисе?";
};


func int DIA_Addon_Skip_Francis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Francis_15_00");	//Что ты скажешь о Фрэнсисе?
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_01");	//Это наш казначей.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_02");	//Капитан ему доверяет. Поэтому он оставил Фрэнсиса за старшего.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_03");	//Но никто из наших не воспринимает его всерьез.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_04");	//Если хочешь узнать больше, поговори с Сэмюэлем.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_05");	//У него лаборатория в небольшой пещере на севере отсюда.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_06");	//Нет в лагере такого человека, о котором Сэмюэль не знал бы всю подноготную...
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Я должен поговорить с Сэмюэлем. Возможно, он поможет мне.");
};


instance DIA_Addon_Skip_Raven(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_Raven_Condition;
	information = DIA_Addon_Skip_Raven_Info;
	permanent = FALSE;
	description = "Ты когда-нибудь видел Ворона?";
};


func int DIA_Addon_Skip_Raven_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Raven_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Raven_15_00");	//Ты когда-нибудь видел Ворона?
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_01");	//Да, бывало. Когда мы с Генри дежурили у ворот, мы наблюдали, как Ворон размещает своих людей в башне на юге.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_02");	//От нее до нашего лагеря камень добросить можно. (смеется) Понятно, что они будут за нами шпионить.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_03");	//А еще я видел, как он расправляется с людьми, которые ему не подчиняется.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_04");	//С теми, кто не выполняет его приказ до последнего слова, у него разговор короткий.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_05");	//Запомни мои слова: не связывайся с Вороном.
};


instance DIA_Addon_Skip_AngusHank(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_AngusHank_Condition;
	information = DIA_Addon_Skip_AngusHank_Info;
	description = "Расскажи мне об Ангусе и Хэнке.";
};


func int DIA_Addon_Skip_AngusHank_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_AngusHank_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHank_15_00");	//Расскажи мне об Ангусе и Хэнке.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_01");	//Ангус и Хэнк должны были встретиться с бандитами неподалеку от лагеря.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_02");	//У них с собой были различные товары. Все, что эти твари у нас заказали.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_03");	//Сталь, отмычки и так далее.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_04");	//Но обратно парни не вернулись. По-видимому, эти свиньи с ними расправились!
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_05");	//Морган и Билл отправились на поиски, но результатов это не принесло.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_06");	//Билл полностью подавлен. Они с Хэнком и Ангусом были друзьями.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_07");	//А он еще молод, и перенести исчезновение друзей для него непросто.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_08");	//Впрочем, жизнь продолжается. Потерю товара мы переживем. (вздыхает) Но у них был с собой грог...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_09");	//(сердито) По меньшей мере, 20 бутылок!
	MIS_ADDON_SkipsGrog = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_SkipsGrog,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_SkipsGrog,LOG_Running);
	B_LogEntry(TOPIC_Addon_SkipsGrog,"Бандиты отобрали у Скипа 20 бутылок грога. Он хочет вернуть их.");
	Log_AddEntry(TOPIC_Addon_SkipsGrog,"Ангус и Хэнк должны были встретиться с бандитами. С тех пор их никто не видел.");
	Log_AddEntry(TOPIC_Addon_SkipsGrog,"Поиски Моргана и Билла прошли безуспешно.");
};


instance DIA_Addon_Skip_AngusHankDead(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_AngusHankDead_Condition;
	information = DIA_Addon_Skip_AngusHankDead_Info;
	permanent = FALSE;
	description = "Насчет Ангуса и Хэнка...";
};


func int DIA_Addon_Skip_AngusHankDead_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits) && !Npc_HasItems(Angus,ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_AngusHankDead_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_00");	//Насчет Ангуса и Хэнка...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_01");	//Что?
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_01");	//Я их нашел.
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_03");	//Они мертвы.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_03");	//Убиты... Бедняги...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_04");	//Что ж, этого можно было ожидать.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_05");	//Если ты еще этого не сделал, расскажи Биллу.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_06");	//Но постарайся сделать это помягче. Он еще молод.
};


instance DIA_Addon_Skip_AngusHankMurder(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_AngusHankMurder_Condition;
	information = DIA_Addon_Skip_AngusHankMurder_Info;
	permanent = FALSE;
	description = "Я знаю, кто убил Хэнка и Ангуса.";
};


func int DIA_Addon_Skip_AngusHankMurder_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_AngusHankDead) && (SC_Knows_JuanMurderedAngus == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_AngusHankMurder_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_JuanMurder_15_00");	//Я знаю, кто убил Хэнка и Ангуса.
	if(MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_01");	//Хорошо. Но они оба мертвы. Какая теперь разница?
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_02");	//Месть еще не сделала богатым ни одного пирата.
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_03");	//Мне бы свой грог назад получить.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_04");	//Меня не интересует, кто их убил. Что с моим грогом?!
	};
};


instance DIA_Addon_Skip_Grog(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 9;
	condition = DIA_Addon_Skip_Grog_Condition;
	information = DIA_Addon_Skip_Grog_Info;
	permanent = TRUE;
	description = "По поводу грога...";
};


func int DIA_Addon_Skip_Grog_Condition()
{
	if(MIS_ADDON_SkipsGrog == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Grog_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_15_00");	//По поводу грога...
	if(Npc_HasItems(other,ItFo_Addon_Grog) >= 20)
	{
		Info_ClearChoices(DIA_Addon_Skip_Grog);
		Info_AddChoice(DIA_Addon_Skip_Grog,Dialog_Back,DIA_Addon_Skip_Grog_back);
		Info_AddChoice(DIA_Addon_Skip_Grog,"Вот твои 20 бутылок.",DIA_Addon_Skip_Grog_geben);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Skip_Grog_15_01");	//У тебя пропало 20 бутылок, верно?
		AI_Output(self,other,"DIA_Addon_Skip_Grog_08_02");	//Да, черт подери! Все мои запасы.
	};
};

func void DIA_Addon_Skip_Grog_back()
{
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};

func void DIA_Addon_Skip_Grog_geben()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_00");	//Вот тебе 20 бутылок.
	B_GiveInvItems(other,self,ItFo_Addon_Grog,20);
	B_LogEntry(TOPIC_Addon_SkipsGrog,"Скип получил свои 20 бутылок грога назад и теперь очень счастлив.");
	MIS_ADDON_SkipsGrog = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_SkipsGrog);
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_01");	//Что? Вот так вот просто?
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_02");	//Ну-у...
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_03");	//Ладно, я заплачу за них.
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_04");	//Может быть, у тебя найдется что-нибудь поинтереснее золота?
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_05");	//Хм-м... Посмотрим... У меня есть вот это кольцо.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_06");	//Я выиграл его в кости в каком-то грязном портовом кабаке пару лет назад.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_07");	//Парень, который его проиграл, сказал, что оно волшебное. Не знаю, правда ли это.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_08");	//Если хочешь, я дам тебе его вместо денег?
	Info_ClearChoices(DIA_Addon_Skip_Grog);
	Info_AddChoice(DIA_Addon_Skip_Grog,"Я возьму деньги.",DIA_Addon_Skip_Grog_gold);
	Info_AddChoice(DIA_Addon_Skip_Grog,"Дай мне кольцо.",DIA_Addon_Skip_Grog_ring);
};

func void DIA_Addon_Skip_Grog_ring()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_ring_15_00");	//Я возьму кольцо.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_ring_08_01");	//Держи.
	B_GiveInvItems(self,other,ItRi_Prot_Edge_02,1);
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};

func void DIA_Addon_Skip_Grog_gold()
{
	var int GrogKohle;
	AI_Output(other,self,"DIA_Addon_Skip_Grog_gold_15_00");	//Я возьму деньги.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_gold_08_01");	//Хорошо.
	GrogKohle = Value_Grog * 20;
	B_GiveInvItems(self,other,ItMi_Gold,GrogKohle);
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};


instance DIA_Addon_Skip_News(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 888;
	condition = DIA_Addon_Skip_News_Condition;
	information = DIA_Addon_Skip_News_Info;
	permanent = FALSE;
	description = "Ты можешь что-нибудь продать?";
};


func int DIA_Addon_Skip_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_News_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_News_15_00");	//Ты можешь мне что-нибудь продать?
	AI_Output(self,other,"DIA_Addon_Skip_News_08_01");	//Если ты хочешь торговать, иди к Гаретту. Он отвечает за наши запасы.
	Log_CreateTopic(Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
};


instance DIA_Addon_Skip_Anheuern(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 11;
	condition = DIA_Addon_Skip_Anheuern_Condition;
	information = DIA_Addon_Skip_Anheuern_Info;
	permanent = FALSE;
	description = "Ты должен мне помочь.";
};


func int DIA_Addon_Skip_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Anheuern_15_00");	//Ты должен мне помочь.
	AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_01");	//Каким образом?
	AI_Output(other,self,"DIA_Addon_Skip_Anheuern_15_01");	//Нас ждет каньон.
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_02");	//Вижу, ты взял с собой ребят. Правильно!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_03");	//Тебе лучше взять с собой еще людей!
	};
	AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_04");	//В каньоне чертовски опасно!
};


instance DIA_Addon_Skip_ComeOn(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 12;
	condition = DIA_Addon_Skip_ComeOn_Condition;
	information = DIA_Addon_Skip_ComeOn_Info;
	permanent = TRUE;
	description = "Пойдем со мной.";
};


func int DIA_Addon_Skip_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Skip_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ComeOn_15_00");	//Пойдем со мной.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_02");	//Подожди. Давай сначала вернемся в каньон...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_01");	//Идем!
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


instance DIA_Addon_Skip_GoHome(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 13;
	condition = DIA_Addon_Skip_GoHome_Condition;
	information = DIA_Addon_Skip_GoHome_Info;
	permanent = TRUE;
	description = "Ты мне больше не нужен.";
};


func int DIA_Addon_Skip_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_GoHome_15_00");	//Ты мне больше не нужен.
	AI_Output(self,other,"DIA_Addon_Skip_GoHome_08_01");	//Что ж, мы неплохо прогулялись. Если что, ты можешь найти меня в лагере.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Skip_TooFar(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 14;
	condition = DIA_Addon_Skip_TooFar_Condition;
	information = DIA_Addon_Skip_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Skip_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_01");	//Мы зашли достаточно далеко!
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_02");	//Если ты идешь дальше, то на нас не рассчитывай!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_03");	//Если ты идешь дальше, то на нас не рассчитывай!
	};
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_Treffpunkt(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_Treffpunkt_Condition;
	information = DIA_Addon_Skip_Treffpunkt_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Skip_Treffpunkt_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_CANYON_TELEPORT_PATH_06") <= 800) && (C_AllCanyonRazorDead() == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Treffpunkt_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_00");	//Если мы потеряем друг друга, то встречаемся здесь, у водопоя.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_02");	//Вперед!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_Orks(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_Orks_Condition;
	information = DIA_Addon_Skip_Orks_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Skip_Orks_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Orks_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_01");	//Орки! Ненавижу этих тварей!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_AllRazorsDead(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_AllRazorsDead_Condition;
	information = DIA_Addon_Skip_AllRazorsDead_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Skip_AllRazorsDead_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_AllCanyonRazorDead() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_AllRazorsDead_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_03");	//Похоже, мы перебили всех бритвозубов.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_04");	//Если хочешь, мы можем побродить здесь еще.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_05");	//Только не выходи из каньона.
	AI_StopProcessInfos(self);
};

