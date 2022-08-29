
instance DIA_Addon_Garett_EXIT(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 999;
	condition = DIA_Addon_Garett_EXIT_Condition;
	information = DIA_Addon_Garett_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Garett_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


func void B_GarettTradeIntro()
{
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_01");	//Мое имя Гаретт. Если тебе что-нибудь понадобится, спроси у меня.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_02");	//Я могу достать практически что угодно. Вино, оружие - все, что может тебе понадобиться.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_03");	//Кроме самогона. Если тебе нужен самогон, иди к Сэмюэлю.
	if(!Npc_KnowsInfo(other,DIA_Addon_Skip_News))
	{
		Log_CreateTopic(Topic_Addon_PIR_Trader,LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
	};
};

instance DIA_Addon_Garett_Anheuern(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 1;
	condition = DIA_Addon_Garett_Anheuern_Condition;
	information = DIA_Addon_Garett_Anheuern_Info;
	important = TRUE;
};


func int DIA_Addon_Garett_Anheuern_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Addon_Greg_ClearCanyon == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Anheuern_Info()
{
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_00");	//Даже не предлагай мне присоединиться к твоей группе.
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_01");	//Как ты думаешь, что здесь начнется, если я уйду?
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_02");	//Да тут к моему возвращению не останется ни одного ящика!
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_03");	//Нет, я должен оставаться здесь и охранять наши запасы.
	if(!Npc_KnowsInfo(other,DIA_Addon_Garett_Hello))
	{
		B_GarettTradeIntro();
	};
};


instance DIA_Addon_Garett_Hello(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 1;
	condition = DIA_Addon_Garett_Hello_Condition;
	information = DIA_Addon_Garett_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Garett_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (MIS_Addon_Greg_ClearCanyon != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_00");	//Так-так. Новое лицо. Надеюсь, ты не один из этих грязных бандитов?
	B_GarettTradeIntro();
};


instance DIA_Addon_Garett_Samuel(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 2;
	condition = DIA_Addon_Garett_Samuel_Condition;
	information = DIA_Addon_Garett_Samuel_Info;
	permanent = FALSE;
	description = "Кто такой Сэмюэль?";
};


func int DIA_Addon_Garett_Samuel_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Garett_Hello) || Npc_KnowsInfo(other,DIA_Addon_Garett_Anheuern)) && (Samuel.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Samuel_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Samuel_15_00");	//Кто такой Сэмюэль?
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_01");	//Наш самогонщик. У него есть пещера на берегу, недалеко от лагеря.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_02");	//Просто иди по берегу на север, и ты ее найдешь.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_03");	//Я бы посоветовал тебе запастись грогом.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_04");	//Не все наши ребята приветливо относятся к новичкам, надеюсь, ты меня понимаешь.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_05");	//А бутылка-другая грога может сотворить настоящие чудеса!
	Log_CreateTopic(Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};


instance DIA_Addon_Garett_Warez(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 3;
	condition = DIA_Addon_Garett_Warez_Condition;
	information = DIA_Addon_Garett_Warez_Info;
	description = "Откуда ты получаешь свои товары?";
};


func int DIA_Addon_Garett_Warez_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_Warez_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Warez_15_00");	//Откуда ты получаешь свои товары?
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_01");	//Когда Скип ездит в Хоринис, он всегда привозит оттуда множество вещей.
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_02");	//До недавнего времени часть из них он напрямую продавал бандитам.
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_03");	//Но сейчас у нас с бандитами война, так что все товары оказываются у меня.
};


instance DIA_Addon_Garett_Bandits(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 3;
	condition = DIA_Addon_Garett_Bandits_Condition;
	information = DIA_Addon_Garett_Bandits_Info;
	description = "Что ты знаешь о бандитах?";
};


func int DIA_Addon_Garett_Bandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Warez))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Bandits_Info()
{
	DIA_Common_WhatDoYouKnowAboutBandits();
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_01");	//Об этом тебе лучше спросить у Скипа.
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_02");	//Он довольно много общался с этой шайкой.
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_03");	//А сейчас Грег приказал нам убивать каждого бандита, подходящего к лагерю.
};


instance DIA_Addon_Garett_Greg(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 4;
	condition = DIA_Addon_Garett_Greg_Condition;
	information = DIA_Addon_Garett_Greg_Info;
	permanent = FALSE;
	description = "Ваш капитан Грег. Какой он?";
};


func int DIA_Addon_Garett_Greg_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_Greg_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Greg_15_00");	//Ваш капитан Грег. Какой он?
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_01");	//С этим старым морским волком лучше не шутить.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_02");	//К тому же он жаден до невозможности.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_03");	//Фрэнсис, его казначей, платит нам ровно столько, сколько нужно, чтобы мы не подняли бунт.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_04");	//А если нам попадется что-нибудь действительно ценное, капитан тут же забирает это себе.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_05");	//Однажды на королевском фрегате я нашел золотой компас.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_06");	//Конечно же, этот ублюдок Грег отобрал его у меня.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_07");	//Наверняка он его где-нибудь закопал. Он так поступает со всеми своими сокровищами.
};


instance DIA_Addon_Garett_Tips(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 5;
	condition = DIA_Addon_Garett_Tips_Condition;
	information = DIA_Addon_Garett_Tips_Info;
	description = "А где он мог закопать твой компас?";
};


func int DIA_Addon_Garett_Tips_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Tips_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Tips_15_00");	//А где он мог закопать твой компас?
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_01");	//Однажды Грег сказал мне, что компас охраняет сама Смерть. А потом он расхохотался.
	AI_Output(other,self,"DIA_Addon_Garett_Tips_15_02");	//Что-нибудь еще?
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_03");	//На юге есть бухточка, добраться до которой можно только по морю.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_04");	//Грег нередко там бывает. Может быть, тебе удастся там что-нибудь найти.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_05");	//Однажды я сам попытался исследовать это место, но оказалось, что оно кишит монстрами.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_06");	//Если ты все же решишься туда отправиться, не забудь кирку.
	MIS_ADDON_GARett_BringKompass = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_Kompass,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kompass,LOG_Running);
	B_LogEntry(TOPIC_Addon_Kompass,"Грег отобрал у Гаретта драгоценный компас. Гаретт думает, что Грег закопал его где-то на южном пляже.");
};


func void B_GarettGiveBelt()
{
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_04");	//Возьми в награду этот пояс. Это одна из самых ценных моих вещей.
	B_GiveInvItems(self,other,ItBe_Addon_Prot_EdgPoi,1);
};

instance DIA_Addon_Garett_GiveKompass(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 6;
	condition = DIA_Addon_Garett_GiveKompass_Condition;
	information = DIA_Addon_Garett_GiveKompass_Info;
	permanent = FALSE;
	description = "Вот твой компас.";
};


func int DIA_Addon_Garett_GiveKompass_Condition()
{
	if((Npc_HasItems(other,ItMI_Addon_Kompass_Mis) >= 1) && (MIS_ADDON_GARett_BringKompass == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_GiveKompass_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_GiveKompass_15_00");	//Вот твой компас.
	B_GiveInvItems(other,self,ItMI_Addon_Kompass_Mis,1);
	Npc_RemoveInvItem(self,ItMI_Addon_Kompass_Mis);
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_01");	//(радостно) Да, это он! Вот уж не думал, что снова его увижу.
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_02");	//Спасибо, приятель!
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_03");	//На этот раз Грег его не получит.
	if(Npc_HasItems(self,ItBe_Addon_Prot_EdgPoi))
	{
		B_GarettGiveBelt();
	}
	else if(self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_05");	//Помнишь, ты купил у меня пояс.
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_06");	//Ты заплатил за него порядочную сумму... Нет, конечно он стоит этих денег. В общем, можешь взять их обратно.
		B_GiveInvItems(self,other,ItMi_Gold,Value_ItBE_Addon_Prot_EdgPoi);
	}
	else
	{
		CreateInvItems(self,ItBe_Addon_Prot_EdgPoi,1);
		B_GarettGiveBelt();
	};
	B_LogEntry(TOPIC_Addon_Kompass,"Гаретт был очень рад, когда я вернул ему компас.");
	MIS_ADDON_GARett_BringKompass = LOG_SUCCESS;
	B_GivePlayerXP(XP_ADDON_Garett_Bring_Kompass);
};


instance DIA_Addon_Garett_Francis(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 7;
	condition = DIA_Addon_Garett_Francis_Condition;
	information = DIA_Addon_Garett_Francis_Info;
	permanent = FALSE;
	description = "Что ты можешь мне сказать о Фрэнсисе?";
};


func int DIA_Addon_Garett_Francis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Francis_15_00");	//Что ты можешь мне сказать о Фрэнсисе?
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_01");	//Когда Грега нет, он остается за старшего.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_02");	//Но честно говоря, лидер из него никакой.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_03");	//Он даже Моргана не может заставить оторвать свою ленивую задницу от кровати.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_04");	//Чем-то полезным сейчас занимается только Генри со своими ребятами.
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_05");	//Остальные же просто бездельничают.
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_06");	//Надеюсь, что Грег скоро вернется.
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_07");	//Он-то покажет этим лентяям, что к чему.
	};
};


instance DIA_Addon_Garett_PERM(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 99;
	condition = DIA_Addon_Garett_PERM_Condition;
	information = DIA_Addon_Garett_PERM_Info;
	permanent = TRUE;
	description = "Есть новости?";
};


func int DIA_Addon_Garett_PERM_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_PERM_15_00");	//Есть новости?
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_PERM_09_02");	//С тех пор, как Грег уехал, ничего интересного не случалось.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Garett_PERM_09_01");	//После того, как Грег вернулся, все начало приходить в норму.
	};
};


instance DIA_Addon_Garett_Trade(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 888;
	condition = DIA_Addon_Garett_Trade_Condition;
	information = DIA_Addon_Garett_Trade_Info;
	permanent = TRUE;
	description = DIALOG_TRADE_v4;
	trade = TRUE;
};


func int DIA_Addon_Garett_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Hello) || Npc_KnowsInfo(other,DIA_Addon_Garett_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Trade_Info()
{
	DIA_Common_ShowMeYourGoods();
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
	B_RefreshTraderAmmo(self,25);
};

instance DIA_Addon_Garett_ArmorM(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 8;
	condition = DIA_Addon_Garett_ArmorM_Condition;
	information = DIA_Addon_Garett_ArmorM_Info;
	permanent = TRUE;
	description = "А как насчет доспехов получше?";
};


func int DIA_Addon_Garett_ArmorM_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Garett_Hello) || Npc_KnowsInfo(other,DIA_Addon_Garett_Anheuern)) && Npc_KnowsInfo(other,DIA_Addon_Greg_JoinPirates) && (Greg_NoHelpInNW >= 2) && (Garett_Armor_Given == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_ArmorM_Info()
{
	DIA_Common_WhatAboutBetterArmor();
	AI_Output(self,other,"DIA_Matteo_LEATHER_09_01");	//Они тебе понравятся. (ухмыляется)
	Info_ClearChoices(DIA_Addon_Garett_ArmorM);
	Info_AddChoice(DIA_Addon_Garett_ArmorM,Dialog_Back,DIA_Addon_Garett_ArmorM_Back);
	Info_AddChoice(DIA_Addon_Garett_ArmorM,B_BuildPriceString("Купить доспехи пирата. Защита: 55/55/0/0.",VALUE_ITAR_PIR_M_Addon),DIA_Addon_Garett_ArmorM_Buy);
};

func void DIA_Addon_Garett_ArmorM_Buy()
{
	DIA_Common_GiveMeThatArmor();
	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_PIR_M_Addon))
	{
		B_Say(self,other,"$ABS_GOOD");
		B_GiveArmor(ITAR_PIR_M_Addon);
		Garett_Armor_Given = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_02");	//Эти доспехи стоят недешево - но они, определенно, стоят своих денег. Так что возвращайся, когда у тебя будет достаточно золота.
	};
	Info_ClearChoices(DIA_Addon_Garett_ArmorM);
};

func void DIA_Addon_Garett_ArmorM_Back()
{
	Info_ClearChoices(DIA_Addon_Garett_ArmorM);
};

/*instance DIA_Addon_Garett_StonePlate(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 9;
	condition = DIA_Addon_Garett_StonePlate_Condition;
	information = DIA_Addon_Garett_StonePlate_Info;
	permanent = FALSE;
	description = "У меня с собой есть каменная табличка. Сколько ты готов дать за это?";
};


func int DIA_Addon_Garett_StonePlate_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Garett_Hello) || Npc_KnowsInfo(other,DIA_Addon_Garett_Anheuern)) && (MIS_Addon_Morgan_SeekTraitor == LOG_SUCCESS) && Npc_HasItems(other,ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Garett_StonePlate_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_StonePlate_15_00_add");	//У меня с собой есть каменная табличка. Сколько ты готов дать за это?
	AI_Output(self,other,"DIA_Addon_Garett_StonePlate_09_01_add");	//
};*/

