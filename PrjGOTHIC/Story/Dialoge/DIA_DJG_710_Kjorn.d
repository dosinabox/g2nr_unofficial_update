
instance DIA_Kjorn_EXIT(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 999;
	condition = DIA_Kjorn_EXIT_Condition;
	information = DIA_Kjorn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kjorn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kjorn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Kjorn_Hello(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 4;
	condition = DIA_Kjorn_Hello_Condition;
	information = DIA_Kjorn_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Kjorn_Hello_Condition()
{
	if(Npc_GetDistToNpc(self,hero) < 300)
	{
		return TRUE;
	};
};

func void DIA_Kjorn_Hello_Info()
{
	AI_Output(self,other,"DIA_Kjorn_Hello_06_00");	//Эй, иди сюда!
	AI_Output(other,self,"DIA_Kjorn_Hello_15_01");	//Чего тебе?
	AI_Output(self,other,"DIA_Kjorn_Hello_06_02");	//Эта долина - опасное место, и без правильного снаряжения ты сразу можешь считать себя трупом.
	AI_Output(other,self,"DIA_Kjorn_Hello_15_03");	//Я полагаю, что у ТЕБЯ как раз правильное снаряжение.
	AI_Output(self,other,"DIA_Kjorn_Hello_06_04");	//Угадал. И я даже могу продать его тебе.
};


instance DIA_Kjorn_TRADE(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 4;
	condition = DIA_Kjorn_TRADE_Condition;
	information = DIA_Kjorn_TRADE_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Что ты можешь предложить мне?";
};


func int DIA_Kjorn_TRADE_Condition()
{
	return TRUE;
};

func void DIA_Kjorn_TRADE_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Kjorn_TRADE_15_00");	//Что ты можешь предложить мне?
};


instance DIA_Kjorn_SellInfos(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 5;
	condition = DIA_Kjorn_SellInfos_Condition;
	information = DIA_Kjorn_SellInfos_Info;
	permanent = FALSE;
	description = "А информацией ты не торгуешь?";
};


func int DIA_Kjorn_SellInfos_Condition()
{
	return TRUE;
};

func void DIA_Kjorn_SellInfos_Info()
{
	AI_Output(other,self,"DIA_Kjorn_SellInfos_15_00");	//А информацией ты не торгуешь?
	AI_Output(self,other,"DIA_Kjorn_SellInfos_06_01");	//Может быть. Если цена подходящая, я расскажу тебе все, что я знаю.
	AI_Output(other,self,"DIA_Kjorn_SellInfos_15_02");	//Сколько ты берешь?
	AI_Output(self,other,"DIA_Kjorn_SellInfos_06_03");	//Хмм... трудно сказать. Но, думаю, 50 золотых за каждую информацию, что ты получишь, будет нормально.
};


instance DIA_Kjorn_BuyInfos(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 5;
	condition = DIA_Kjorn_BuyInfos_Condition;
	information = DIA_Kjorn_BuyInfos_Info;
	permanent = TRUE;
	description = "Мне нужна кое-какая информация.";
};


func int DIA_Kjorn_BuyInfos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kjorn_SellInfos))
	{
		return TRUE;
	};
};

func void DIA_Kjorn_BuyInfos_Info()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_15_00");	//Мне нужна информация.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_06_01");	//50 золотых!
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
	Info_AddChoice(DIA_Kjorn_BuyInfos,"Это слишком дорого для меня.",DIA_Kjorn_BuyInfos_HoldMoney);
	if(Npc_HasItems(other,ItMi_Gold) >= 50)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"Да, держи.",DIA_Kjorn_BuyInfos_GiveMoney);
	};
};

func void DIA_Kjorn_BuyInfos_HoldMoney()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_HoldMoney_15_00");	//Это слишком дорого для меня.
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_GiveMoney()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_00");	//Вот, держи.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_01");	//Теперь скажи мне...
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
	Info_AddChoice(DIA_Kjorn_BuyInfos,Dialog_Back,DIA_Kjorn_BuyInfos_Back);
	if(KjornToldDragon == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"... насчет драконов.",DIA_Kjorn_BuyInfos_Dragon1);
	}
	else if(KjornToldDragon == 1)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"... еще о драконах.",DIA_Kjorn_BuyInfos_Dragon2);
	};
	if(KjornToldColony == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"... о Долине Рудников.",DIA_Kjorn_BuyInfos_Colony1);
	}
	else if(KjornToldColony == 1)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"... еще о Долине Рудников.",DIA_Kjorn_BuyInfos_Colony2);
	};
	if(KjornToldOldCamp == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"... о замке.",DIA_Kjorn_BuyInfos_OldCamp1);
	};
	if(KjorntoldOrks == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"... об орках.",DIA_Kjorn_BuyInfos_Orks1);
	}
	else if(KjorntoldOrks == 1)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos,"... еще об орках.",DIA_Kjorn_BuyInfos_Orks2);
	};
};

func void DIA_Kjorn_BuyInfos_Back()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Back_15_00");	//Знаешь, верни мне мои деньги, я передумал.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Back_06_01");	//Как хочешь.
	B_GiveInvItems(self,other,ItMi_Gold,50);
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Dragon1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon1_15_00");	//Расскажи мне о драконах.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01");	//Драконы - это древние невероятно сильные создания. Когда-то их было многие тысячи.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02");	//Но уже больше сотни лет ни одного из них не было видно.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03");	//Их кровь горяча, как кипящее масло. Если они посмотрят в твои глаза, твое сердце обратится в камень. Ну, так я слышал...
	KjornToldDragon = 1;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Dragon2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon2_15_00");	//Расскажи мне подробнее о драконах.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01");	//Все драконы разные.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02");	//Некоторые из них могут покрыть землю слоем льда несколько футов толщиной.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03");	//Другие же предпочитают жить в болотистой местности или в вулканах.
	B_LogEntry(TOPIC_DRACHENJAGD,"Охотник на драконов Кйорн полагает, что драконы бывают различных типов. Некоторые из них предпочитают холодные, сырые места, а другим, по его мнению, больше нравится огонь.");
	KjornToldDragon = 2;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Colony1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony1_15_00");	//Расскажи мне о Долине Рудников.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_01");	//Долина Рудников Хориниса известна всей стране из-за своей магической руды.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_02");	//Эти горы - единственное место, где встречается магическая руда.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_03");	//Оружие, выкованное из этой руды, никогда не ломается и может пробить даже самую прочную броню.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_04");	//До последнего времени вся долина была окружена магическим барьером. Он был непроницаем, и никто не мог выйти наружу.
	KjornToldColony = 1;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Colony2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony2_15_00");	//Расскажи мне подробнее о Долине Рудников.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_01");	//Долина сильно изменилась за последние несколько дней.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_02");	//Когда пришли орки, вместе с ними появились и другие ужасные создания, многих из которых раньше никогда здесь не видели.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_03");	//Говорят, что несколько охотников-одиночек все еще находятся в долине, но я не уверен, что они еще живы.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_04");	//Создается впечатление, что все создания Белиара вдруг толпами ринулись в эту долину.
	KjornToldColony = 2;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_OldCamp1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_OldCamp1_15_00");	//Расскажи мне о замке.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01");	//Он находится в самом центре Долины Рудников.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02");	//Когда долина еще была тюрьмой, рудные бароны контролировали всю торговлю рудой отсюда.
	KjornToldOldCamp = 1;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Orks1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks1_15_00");	//Расскажи мне об орках.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_01");	//Орки появились здесь недавно. По крайней мере, те орки, что сейчас перед замком.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_02");	//Но мне удивительно, как организованно они себя ведут. Орки обычно атакуют слепо, не взирая ни на что.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_03");	//А эти орки выжидают подходящего момента. Они ждут, но мы не знаем чего.
	KjorntoldOrks = 1;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Orks2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks2_15_00");	//Расскажи мне подробнее об орках.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_01");	//Орков возглавляют элитные воины. Эти воины очень сильны и облачены в хорошие доспехи. Их почти невозможно убить.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_02");	//Я как-то видел, как один из них срубил большой дуб одним ударом своего топора.
	KjorntoldOrks = 2;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};


instance DIA_Kjorn_AllDragonsDead(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 5;
	condition = DIA_Kjorn_AllDragonsDead_Condition;
	information = DIA_Kjorn_AllDragonsDead_Info;
	permanent = FALSE;
	description = "Я убил всех драконов!";
};


func int DIA_Kjorn_AllDragonsDead_Condition()
{
	if(MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kjorn_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Kjorn_AllDragonsDead_15_00");	//Я убил всех драконов!
	AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_01");	//(смеется) Конечно, а я паладин.
	AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_02");	//Возможно, ты убил ОДНОГО, но чтобы всех? Иди, поищи дурака, который поверит тебе.
};


instance DIA_Kjorn_PICKPOCKET(C_Info)
{
	npc = DJG_710_Kjorn;
	nr = 900;
	condition = DIA_Kjorn_PICKPOCKET_Condition;
	information = DIA_Kjorn_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Kjorn_PICKPOCKET_Condition()
{
	return C_Beklauen(47,75);
};

func void DIA_Kjorn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kjorn_PICKPOCKET);
	Info_AddChoice(DIA_Kjorn_PICKPOCKET,Dialog_Back,DIA_Kjorn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kjorn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Kjorn_PICKPOCKET_DoIt);
};

func void DIA_Kjorn_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kjorn_PICKPOCKET);
};

func void DIA_Kjorn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kjorn_PICKPOCKET);
};

