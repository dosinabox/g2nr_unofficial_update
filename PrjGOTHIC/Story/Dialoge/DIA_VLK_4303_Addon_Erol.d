
instance DIA_Addon_Erol_EXIT(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 999;
	condition = DIA_Addon_Erol_EXIT_Condition;
	information = DIA_Addon_Erol_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Erol_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Erol_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Erol_PICKPOCKET(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 900;
	condition = DIA_Addon_Erol_PICKPOCKET_Condition;
	information = DIA_Addon_Erol_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Erol_PICKPOCKET_Condition()
{
	return C_Beklauen(43,42);
};

func void DIA_Addon_Erol_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Erol_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Erol_PICKPOCKET,Dialog_Back,DIA_Addon_Erol_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Erol_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Erol_PICKPOCKET_DoIt);
};

func void DIA_Addon_Erol_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Erol_PICKPOCKET);
};

func void DIA_Addon_Erol_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Erol_PICKPOCKET);
};


instance DIA_Addon_Erol_Hallo(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_Hallo_Condition;
	information = DIA_Addon_Erol_Hallo_Info;
	description = "В чем дело?";
};


func int DIA_Addon_Erol_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Hallo_15_00");	//В чем дело?
	AI_Output(self,other,"DIA_Addon_Erol_Hallo_10_01");	//(в ярости) В чем дело? Ты только посмотри на этот бардак под мостом!
	AI_Output(self,other,"DIA_Addon_Erol_Hallo_10_02");	//Я такого за всю свою жизнь не встречал! Этих тварей нужно перебить всех до единой.
};


instance DIA_Addon_Erol_what(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_what_Condition;
	information = DIA_Addon_Erol_what_Info;
	description = "Что произошло?";
};


func int DIA_Addon_Erol_what_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_what_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_15_00");	//Что случилось?
	AI_Output(self,other,"DIA_Addon_Erol_what_10_01");	//Я со своими помощниками спокойно ехал по дороге, и вдруг эти подонки выскочили из засады и убили всех моих людей.
	AI_Output(self,other,"DIA_Addon_Erol_what_10_02");	//Хорошо, что я еще не забыл свой коронный хук справа, иначе я тоже был бы мертв.
	Log_CreateTopic(TOPIC_Addon_Erol,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol,LOG_Running);
	B_LogEntry(TOPIC_Addon_Erol,"На торговца Эрола напали бандиты. Они забрали все его товары. Эрол хочет, чтобы я вернул похищенные каменные таблички. Бандиты расположились на мосту неподалеку от таверны 'Мертвая Гарпия'.");
	MIS_Addon_Erol_BanditStuff = LOG_Running;
	Info_ClearChoices(DIA_Addon_Erol_what);
	Info_AddChoice(DIA_Addon_Erol_what,"Так это твои вещи лежат под мостом?",DIA_Addon_Erol_what_dein);
	Info_AddChoice(DIA_Addon_Erol_what,"Кто эти люди?",DIA_Addon_Erol_what_wer);
};

func void DIA_Addon_Erol_what_back()
{
	Info_ClearChoices(DIA_Addon_Erol_what);
};

func void DIA_Addon_Erol_what_dein()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_dein_15_00");	//Так это твои вещи лежат под мостом?
	AI_Output(self,other,"DIA_Addon_Erol_what_dein_10_01");	//Да. Тележка, товары, все остальное.
	if(Npc_HasItems(other,itmi_erolskelch) > 0)
	{
		AI_Output(other,self,"DIA_Addon_Erol_what_dein_Add_15_00");	//Я кое-что оттуда забрал...
		AI_Output(self,other,"DIA_Addon_Erol_what_dein_Add_10_01");	//Можешь оставить эти вещи себе, ценности они не представляют.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_what_dein_Add_10_02");	//Хотя все это особой ценности не представляет.
	};
	AI_Output(self,other,"DIA_Addon_Erol_what_dein_10_02");	//Но бандиты украли у меня нечто действительно ценное. Три каменные таблички.
	Info_AddChoice(DIA_Addon_Erol_what,Dialog_Back,DIA_Addon_Erol_what_back);
	Info_AddChoice(DIA_Addon_Erol_what,"Каменные таблички?",DIA_Addon_Erol_what_Was);
};

func void DIA_Addon_Erol_what_Was()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_Was_15_00");	//Каменные таблички?
	AI_Output(self,other,"DIA_Addon_Erol_what_Was_10_01");	//Да. Их хотел купить у меня городской маг воды. Я обещал ему, что достану их.
	AI_Output(self,other,"DIA_Addon_Erol_what_Was_10_02");	//Я должен любой ценой вернуть их, иначе пострадает моя репутация.
	Info_AddChoice(DIA_Addon_Erol_what,"Где ты берешь эти таблички?",DIA_Addon_Erol_what_woher);
	Info_AddChoice(DIA_Addon_Erol_what,"Зачем таблички нужны магу воды?",DIA_Addon_Erol_what_KDW);
};

func void DIA_Addon_Erol_what_KDW()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_KDW_15_00");	//Зачем таблички нужны магу воды?
	AI_Output(self,other,"DIA_Addon_Erol_what_KDW_10_01");	//Он сказал, что изучает их, и просил привезти как можно больше.
};

func void DIA_Addon_Erol_what_woher()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_woher_15_00");	//Где ты берешь эти таблички?
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_01");	//Нахожу их в древних строениях, например, мавзолеях. А иногда их можно найти в пещерах.
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_02");	//Я продал магу воды уже целую кучу табличек.
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_03");	//Впрочем, здесь они встречаются довольно редко. Чаще всего я нахожу их на северо-востоке Хориниса.
	Info_AddChoice(DIA_Addon_Erol_what,"Почему бы тебе просто не поискать новые таблички?",DIA_Addon_Erol_what_neue);
};

func void DIA_Addon_Erol_what_neue()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_neue_15_00");	//Почему бы тебе просто не поискать новые таблички?
	AI_Output(self,other,"DIA_Addon_Erol_what_neue_10_01");	//Во время схватки с бандитами я вывихнул лодыжку.
	AI_Output(self,other,"DIA_Addon_Erol_what_neue_10_02");	//С хромой ногой я далеко не уйду.
};

func void DIA_Addon_Erol_what_wer()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_wer_15_00");	//Что за люди на тебя напали?
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_01");	//Бандиты, кто еще? Они обосновались на мосту.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_02");	//Грабят каждого, кто пытается пройти.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_03");	//Я знал, что у них там засада, так что решил проехать под мостом.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_04");	//Но похоже, моя тележка показалась им слишком соблазнительной.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_05");	//Эти негодяи просто спрыгнули с моста прямо на нас.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_06");	//Надо было попробовать незаметно проехать ночью...
};


instance DIA_Addon_Erol_FernandosWeapons(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_FernandosWeapons_Condition;
	information = DIA_Addon_Erol_FernandosWeapons_Info;
	description = "Ты что-нибудь знаешь о поставках оружия бандитам?";
};


func int DIA_Addon_Erol_FernandosWeapons_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_what) && (MIS_Vatras_FindTheBanditTrader == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_FernandosWeapons_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_FernandosWeapons_15_00");	//Ты что-нибудь знаешь о поставках оружия бандитам?
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_01");	//Поставках оружия? Да, кое-что знаю. Какая-то свинья из города продала им столько оружия, что они еле его увезли.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_02");	//Часть его хранится на мосту у напавших на меня бандитов.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_03");	//Часть увезли куда-то в сторону фермы Бенгара на верхних пастбищах.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_04");	//Возможно, бандиты хотели переправить оружие через проход.
	Info_ClearChoices(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice(DIA_Addon_Erol_FernandosWeapons,Dialog_Back,DIA_Addon_Erol_FernandosWeapons_back);
	Info_AddChoice(DIA_Addon_Erol_FernandosWeapons,"Где находятся эти верхние пастбища?",DIA_Addon_Erol_FernandosWeapons_bengar);
};

func void DIA_Addon_Erol_FernandosWeapons_bengar()
{
	AI_Output(other,self,"DIA_Addon_Erol_FernandosWeapons_bengar_15_00");	//Где находятся эти верхние пастбища?
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_bengar_10_01");	//В центральной части Хориниса находится 'Мертвая Гарпия', таверна Орлана.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_bengar_10_02");	//От нее на юг ведет дорога. Она проходит через верхние пастбища к проходу в Долину Рудников.
	Info_ClearChoices(DIA_Addon_Erol_FernandosWeapons);
};

func void DIA_Addon_Erol_FernandosWeapons_back()
{
	Info_ClearChoices(DIA_Addon_Erol_FernandosWeapons);
};


instance DIA_Addon_Erol_Stoneplates(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_Stoneplates_Condition;
	information = DIA_Addon_Erol_Stoneplates_Info;
	permanent = TRUE;
	description = "Насчет этих каменных табличек...";
};


func int DIA_Addon_Erol_Stoneplates_Condition()
{
	if(MIS_Addon_Erol_BanditStuff == LOG_Running)
	{
		return TRUE;
	};
};


var int StoneplatesCounter;
const int Addon_ErolsStoneplatesOffer = 10;

func void DIA_Addon_Erol_Stoneplates_Info()
{
	var int StoneplatesCount;
	var int XP_Addon_BringStoneplates;
	var int StoneplatesGeld;
	AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_00");	//Насчет этих каменных табличек...
	if(Npc_HasItems(other,ItWr_StonePlateCommon_Addon) >= 1)
	{
		StoneplatesCount = Npc_HasItems(other,ItWr_StonePlateCommon_Addon);
		if(StoneplatesCount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_01");	//У меня есть одна такая.
			B_GivePlayerXP(XP_Addon_BringStoneplate);
			B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,1);
			StoneplatesCounter = StoneplatesCounter + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_02");	//У меня есть несколько штук.
			if((StoneplatesCount + StoneplatesCounter) >= 3)
			{
				B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,3 - StoneplatesCounter);
				XP_Addon_BringStoneplates = (3 - StoneplatesCounter) * XP_Addon_BringStoneplate;
				StoneplatesCounter = 3;
			}
			else
			{
				B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,StoneplatesCount);
				XP_Addon_BringStoneplates = StoneplatesCount * XP_Addon_BringStoneplate;
				StoneplatesCounter = StoneplatesCounter + StoneplatesCount;
			};
			B_GivePlayerXP(XP_Addon_BringStoneplates);
		};
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_03");	//Спасибо тебе.
		if(StoneplatesCounter == 1)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_04");	//Теперь мне не хватает только двух.
		}
		else if(StoneplatesCounter == 2)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_05");	//Теперь мне не хватает только одной.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_06");	//Этого достаточно. Маг воды получит то, что я обещал, и я смогу, наконец, вернуться домой.
			MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
			Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
		};
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_07");	//Конечно же, я тебе заплачу.
		StoneplatesGeld = Addon_ErolsStoneplatesOffer * Npc_HasItems(self,ItWr_StonePlateCommon_Addon);
		CreateInvItems(self,ItMi_Gold,StoneplatesGeld);
		B_GiveInvItems(self,other,ItMi_Gold,StoneplatesGeld);
		Npc_RemoveInvItems(self,ItWr_StonePlateCommon_Addon,Npc_HasItems(self,ItWr_StonePlateCommon_Addon));
		if(MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_08");	//Я иду домой. Если хочешь, можешь пойти со мной.
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_09");	//Когда мы доберемся до моего дома, я смогу продать тебе некоторые вещи.
			AI_StopProcessInfos(self);
			AI_UseMob(self,"BENCH",-1);
			AI_GotoWP(self,"NW_TAVERN_TO_FOREST_03");
			Npc_ExchangeRoutine(self,"Start");
			Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
		};
	}
	else if(C_ScHasMagicStonePlate() == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_10");	//Эта табличка подойдет?
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_11");	//Нет. Она обладает магической силой.
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_12");	//Такие таблички маг воды не покупает.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_13");	//Сколько тебе нужно табличек?
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_14");	//Чтобы спасти мою репутацию, мне нужно передать магу воды три таблички.
	};
};


instance DIA_Addon_Erol_Buerger(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_Buerger_Condition;
	information = DIA_Addon_Erol_Buerger_Info;
	description = "Ты живешь в городе?";
};


func int DIA_Addon_Erol_Buerger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_Buerger_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Buerger_15_00");	//Ты живешь в городе?
	AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_01");	//Я не был там уже много лет, приятель. Меня ничего не удерживает среди этих глупых и жадных свиней, живущих в верхнем квартале.
	AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_02");	//В свое время я был довольно влиятельным горожанином. Но это было давно.
};


instance DIA_Addon_Erol_PreTeach(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_PreTeach_Condition;
	information = DIA_Addon_Erol_PreTeach_Info;
	description = "Ты смог отбиться от бандитов?";
};


func int DIA_Addon_Erol_PreTeach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_what))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_PreTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_PreTeach_15_00");	//Ты смог отбиться от бандитов?
	AI_Output(self,other,"DIA_Addon_Erol_PreTeach_10_01");	//Да. Но они все еще сидят на мосту.
	AI_Output(other,self,"DIA_Addon_Erol_PreTeach_15_02");	//Ты можешь научить меня такому удару?
	AI_Output(self,other,"DIA_Addon_Erol_PreTeach_10_03");	//Конечно.
	Erol_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(Topic_OutTeacher,LOG_NOTE);
	B_LogEntry(Topic_OutTeacher,LogText_Addon_Erol_Teach);
};


instance DIA_Addon_Erol_PreTrade(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 100;
	condition = DIA_Addon_Erol_PreTrade_Condition;
	information = DIA_Addon_Erol_PreTrade_Info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
};


func int DIA_Addon_Erol_PreTrade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_what) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") > 2000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_PreTrade_Info()
{
	B_Say(other,self,"$TRADE_2");
	AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_00");	//Я ничего не могу тебе продать. Все мои вещи остались под мостом.
	AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_01");	//Что-то у меня купить ты сможешь только тогда, когда я доберусь до дома.
	if(MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_02");	//Но я не могу вернуться, пока не достану таблички для мага.
	};
};


instance DIA_Addon_Erol_SLD(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_SLD_Condition;
	information = DIA_Addon_Erol_SLD_Info;
	description = "Это и есть твой дом?";
};


func int DIA_Addon_Erol_SLD_Condition()
{
	if(Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 2000)
	{
		return TRUE;
	};
};


var int Erol_IsAtHome;

func void DIA_Addon_Erol_SLD_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_SLD_15_00");	//(удивленно) Это и есть твой дом?
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_01");	//Да. А что? Что-нибудь не так?
	AI_Output(other,self,"DIA_Addon_Erol_SLD_15_02");	//У тебя нет проблем с наемниками?
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_03");	//Пока я не сую нос в их дела, они меня не трогают .
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_04");	//К тому же, они неплохие покупатели. И я плачу им, чтобы они охраняли мой дом, пока я в отъезде.
	B_GivePlayerXP(XP_Ambient);
	if(Erol_IsAtHome == FALSE)
	{
		Npc_ExchangeRoutine(self,"HOME");
		Erol_IsAtHome = TRUE;
	};
};


instance DIA_Addon_Erol_Trade(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 100;
	condition = DIA_Addon_Erol_Trade_Condition;
	information = DIA_Addon_Erol_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
};


func int DIA_Addon_Erol_Trade_Condition()
{
	if((MIS_Addon_Erol_BanditStuff == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 3000))
	{
		return TRUE;
	};
};


var int DIA_Addon_Erol_Trade_OneTime;

func void DIA_Addon_Erol_Trade_Info()
{
	B_GiveTradeInv(self);
	B_Say(other,self,"$TRADE_2");
	AI_Output(self,other,"DIA_Addon_Erol_Trade_10_00");	//Впрочем, выбора у меня нет.
	if(Erol_IsAtHome == FALSE)
	{
		Log_CreateTopic(Topic_OutTrader,LOG_NOTE);
		B_LogEntry(Topic_OutTrader,LogText_Addon_ErolTrade);
		Npc_ExchangeRoutine(self,"Home");
		Erol_IsAtHome = TRUE;
	};
};


instance DIA_Addon_Erol_Teach(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 99;
	condition = DIA_Addon_Erol_Teach_Condition;
	information = DIA_Addon_Erol_Teach_Info;
	permanent = TRUE;
	description = "Покажи мне, как сделать удар сильнее.";
};


func int DIA_Addon_Erol_Teach_Condition()
{
	if(Erol_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Teach_15_00");	//Покажи мне, как сделать удар сильнее.
	if(MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_01");	//Хорошо, но ты окажешь мне одну услугу.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_02");	//Помоги мне спасти мою репутацию. Принеси мне каменные таблички для мага воды.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_03");	//Тогда я покажу тебе, как увеличить твою силу в бою.
	}
	else if(Erol_Bonus == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_00");	//Хорошо. Смотри внимательно. Есть один простой прием.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_01");	//Когда ты наносишь удар, используй не силу руки, а силу всего тела.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_02");	//В одно и то же время ты должен развернуть бедро, вынести вперед плечо и распрямить руку.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_03");	//(смеется) Если ты нанесешь удар правильно, ты это поймешь!
		B_RaiseAttribute(other,ATR_STRENGTH,1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_04");	//Если ты хочешь добиться большего, ты должен упорно тренироваться...
		Info_ClearChoices(DIA_Addon_Erol_Teach);
		Info_AddChoice(DIA_Addon_Erol_Teach,Dialog_Back,DIA_Addon_Erol_Teach_Back);
		Info_AddChoice(DIA_Addon_Erol_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Erol_Teach_STR_1);
		Info_AddChoice(DIA_Addon_Erol_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Erol_Teach_STR_5);
	};
};

func void DIA_Addon_Erol_Teach_Back()
{
	Info_ClearChoices(DIA_Addon_Erol_Teach);
};

func void DIA_Addon_Erol_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(DIA_Addon_Erol_Teach);
	Info_AddChoice(DIA_Addon_Erol_Teach,Dialog_Back,DIA_Addon_Erol_Teach_Back);
	Info_AddChoice(DIA_Addon_Erol_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice(DIA_Addon_Erol_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Erol_Teach_STR_5);
};

func void DIA_Addon_Erol_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(DIA_Addon_Erol_Teach);
	Info_AddChoice(DIA_Addon_Erol_Teach,Dialog_Back,DIA_Addon_Erol_Teach_Back);
	Info_AddChoice(DIA_Addon_Erol_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice(DIA_Addon_Erol_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Erol_Teach_STR_5);
};

