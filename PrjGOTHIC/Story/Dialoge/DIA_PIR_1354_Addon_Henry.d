
instance DIA_Addon_Henry_EXIT(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 999;
	condition = DIA_Addon_Henry_EXIT_Condition;
	information = DIA_Addon_Henry_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Henry_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Henry_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

func void B_Henry_Gold(var int gold)
{
	if(gold == 500)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold500_04_00");	//500 золотых.
	}
	else if(gold == 400)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold400_04_00");	//400 золотых.
	}
	else if(gold == 300)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold300_04_00");	//300 золотых.
	}
	else if(gold == 200)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold200_04_00");	//200 золотых.
	}
	else if(gold == 100)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold100_04_00");	//100 золотых.
	}
	else
	{
		B_Say_Gold(self,other,gold);
	};
};


instance DIA_Addon_Henry_PICKPOCKET(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 900;
	condition = DIA_Addon_Henry_PICKPOCKET_Condition;
	information = DIA_Addon_Henry_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Henry_PICKPOCKET_Condition()
{
	return C_Beklauen(40,60);
};

func void DIA_Addon_Henry_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Henry_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Henry_PICKPOCKET,Dialog_Back,DIA_Addon_Henry_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Henry_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Henry_PICKPOCKET_DoIt);
};

func void DIA_Addon_Henry_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Henry_PICKPOCKET);
};

func void DIA_Addon_Henry_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Henry_PICKPOCKET);
};


const string PIR_1354_Checkpoint = "ADW_PIRATECAMP_WAY_02";
var int Henry_FriendOrFoe;

instance DIA_Addon_Henry_Hello(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 5;
	condition = DIA_Addon_Henry_Hello_Condition;
	information = DIA_Addon_Henry_Hello_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Henry_Hello_Condition()
{
//	if((Npc_GetDistToWP(other,PIR_1354_Checkpoint) <= 700) && (self.aivar[AIV_PASSGATE] == FALSE))
	if(Npc_GetDistToWP(other,PIR_1354_Checkpoint) <= 700)
	{
		if(self.aivar[AIV_PASSGATE] == FALSE)
		{
			Npc_SetRefuseTalk(self,5);
		};
		return FALSE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && !Npc_RefuseTalk(self))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Henry_Hello_04_00");	//Стой!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PIR_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	if(Henry_FriendOrFoe == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Hello_04_01");	//Ты друг или враг?
		Info_ClearChoices(DIA_Addon_Henry_Hello);
		Info_AddChoice(DIA_Addon_Henry_Hello,"Враг!",DIA_Addon_Henry_Hello_Feind);
		Info_AddChoice(DIA_Addon_Henry_Hello,"Друг!",DIA_Addon_Henry_Hello_Freund);
		Henry_FriendOrFoe = TRUE;
	};
};


//var int Henry_SC_Frech;

func void DIA_Addon_Henry_Hello_Feind()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Feind_15_00");	//Враг!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_01");	//Ищешь приключений на свою задницу, клоун?
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_02");	//Говори, что тебе надо, или убирайся, да поскорее.
//	Henry_SC_Frech = TRUE;
	Info_ClearChoices(DIA_Addon_Henry_Hello);
};

func void DIA_Addon_Henry_Hello_Freund()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Freund_15_00");	//Друг!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Freund_04_01");	//Так может сказать любой! Я тебя не знаю. Что тебе здесь надо?
	Info_ClearChoices(DIA_Addon_Henry_Hello);
};


instance DIA_Addon_Henry_SecondWarn(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 2;
	condition = DIA_Addon_Henry_SecondWarn_Condition;
	information = DIA_Addon_Henry_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Henry_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && (Npc_GetDistToWP(other,PIR_1354_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Addon_Henry_SecondWarn_04_00");	//Еще один шаг вперед - и я скормлю тебя акулам.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PIR_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Henry_Attack(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 3;
	condition = DIA_Addon_Henry_Attack_Condition;
	information = DIA_Addon_Henry_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Henry_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && (Npc_GetDistToWP(other,PIR_1354_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_Henry_Attack_04_00");	//Сам напросился...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


var int Henry_Zoll_WhatFor;

instance DIA_Addon_Henry_WantEnter(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 1;
	condition = DIA_Addon_Henry_WantEnter_Condition;
	information = DIA_Addon_Henry_WantEnter_Info;
	permanent = FALSE;
	description = "Я хочу попасть внутрь.";
};


func int DIA_Addon_Henry_WantEnter_Condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_WantEnter_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_00");	//Я хочу попасть внутрь.
	AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_01");	//Правда? Что ж, в таком случае, ты должен заплатить.
	B_Henry_Gold(500);
	if(Henry_Zoll_WhatFor == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_02");	//Да? А за что?
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_03");	//Не строй из себя идиота.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_04");	//В лагере полно всего того, что может тебя заинтересовать...
		Henry_Zoll_WhatFor = TRUE;
	};
	if(C_HenryNiceArmorCheck(other))
	{
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_07");	//А ты выглядишь человеком состоятельным.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_08");	//Так что небольшая плата за вход тебя не разорит.
		if(!C_RobeCheck(other))
		{
			AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_09");	//Или свою роскошную броню ты у кого-то украл?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_10");	//У тебя же есть золото, не так ли?
	};
};

func void B_Henry_NoJoin()
{
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_00");	//Если ты собираешься к нам присоединиться, тебе не повезло.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_01");	//Такими вопросами занимается только капитан. А он сейчас с половиной команды ушел в море за добычей.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_02");	//Но ты можешь подождать его возвращения.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_03");	//Только не создавай никаких неприятностей!
};


instance DIA_Addon_Henry_Einigen2(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 2;
	condition = DIA_Addon_Henry_Einigen2_Condition;
	information = DIA_Addon_Henry_Einigen2_Info;
	description = "Вот твои 500 золотых.";
};


func int DIA_Addon_Henry_Einigen2_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_WantEnter) && !Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (Npc_HasItems(other,ItMi_Gold) >= 500))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Einigen2_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Einigen2_15_00");	//Вот твои 500 золотых.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Addon_Henry_Einigen2_04_01");	//Прекрасно. Добро пожаловать в лагерь!
	if(GregIsBack == FALSE)
	{
		B_Henry_NoJoin();
	};
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance DIA_Addon_Henry_Einigen(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 3;
	condition = DIA_Addon_Henry_Einigen_Condition;
	information = DIA_Addon_Henry_Einigen_Info;
	description = "Мы можем как-нибудь договориться?";
};


func int DIA_Addon_Henry_Einigen_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_WantEnter))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Einigen_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Einigen_15_00");	//Мы можем как-нибудь договориться?
	AI_Output(self,other,"DIA_Addon_Henry_Einigen_04_01");	//Хм-м... Назови мне достойную причину, и я сделаю тебе скидку.
};


instance DIA_Addon_Henry_MeatForMorgan(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 4;
	condition = DIA_Addon_Henry_MeatForMorgan_Condition;
	information = DIA_Addon_Henry_MeatForMorgan_Info;
	permanent = FALSE;
	description = "Я должен отдать Моргану мясо.";
};


func int DIA_Addon_Henry_MeatForMorgan_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (MIS_AlligatorJack_BringMeat == LOG_Running) && Npc_HasItems(other,ItFoMuttonRaw))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_MeatForMorgan_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_00");	//Я должен отдать Моргану мясо.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_01");	//А! И кто же тебя послал?
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_02");	//Аллигатор Джек. Он говорит, что Морган это мясо уже ждет.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_03");	//Ясно. Сам он не в настроении, верно?
};


instance DIA_Addon_Henry_Malcom(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 5;
	condition = DIA_Addon_Henry_Malcom_Condition;
	information = DIA_Addon_Henry_Malcom_Info;
	description = "Меня послал Мальком. Он сказал, что с деревом придется еще немного подождать.";
};


func int DIA_Addon_Henry_Malcom_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (MalcomBotschaft == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Malcom_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Malcom_15_00");	//Меня послал Мальком. Он сказал, что с деревом придется еще немного подождать.
	AI_Output(self,other,"DIA_Addon_Henry_Malcom_04_01");	//(ворчит) Ну конечно... Я так и знал. Вечно он копается.
	B_MalcomExident();
};


instance DIA_Addon_Henry_BaltramPack(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 6;
	condition = DIA_Addon_Henry_BaltramPack_Condition;
	information = DIA_Addon_Henry_BaltramPack_Info;
	description = "У меня посылка для Скипа. Он здесь?";
};


func int DIA_Addon_Henry_BaltramPack_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && Npc_HasItems(other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_BaltramPack_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_BaltramPack_15_00");	//У меня посылка для Скипа. Он здесь?
	AI_Output(self,other,"DIA_Addon_Henry_BaltramPack_04_01");	//Да, Скип здесь. И что?
};


var int Henry_Amount;

instance DIA_Addon_Henry_Tribut(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 7;
	condition = DIA_Addon_Henry_Tribut_Condition;
	information = DIA_Addon_Henry_Tribut_Info;
	permanent = TRUE;
	description = "Пропусти меня внутрь.";
};


func int DIA_Addon_Henry_Tribut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (self.aivar[AIV_PASSGATE] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Tribut_Info()
{
	Henry_Amount = 500;
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_15_00");	//Пропусти меня внутрь.
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_01");	//Хм-м...
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_02");	//Ты принес мне сообщение от одного из лесорубов.
		Henry_Amount -= 100;
	};
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_MeatForMorgan))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_03");	//Аллигатор Джек использует тебя как мальчика на побегушках, чтобы передать мясо Моргану.
		Henry_Amount -= 100;
	};
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_BaltramPack))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_04");	//У тебя посылка для Скипа.
		Henry_Amount -= 100;
	};
	if(MIS_Henry_FreeBDTTower == LOG_SUCCESS)
	{
		if(Henry_Amount < 500)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_00");	//И что лучше всего:
		};
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_01");	//Ты разобрался с этими подонками, засевшими в башне.
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_02");	//Не думал я, что с этим можно было справиться в одиночку.
		Henry_Amount -= 200;
	};
	if(Henry_Amount <= 0)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_03");	//Знаешь, что? Можешь пройти бесплатно.
		self.aivar[AIV_PASSGATE] = TRUE;
		Info_ClearChoices(DIA_Addon_Henry_Tribut);
	}
	else
	{
		B_Henry_Gold(Henry_Amount);
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_05");	//Если не согласен, можешь проваливать. Все просто.
		Info_ClearChoices(DIA_Addon_Henry_Tribut);
		Info_AddChoice(DIA_Addon_Henry_Tribut,"Думаю, это слишком много.",DIA_Addon_Henry_Tribut_nein);
		if(Npc_HasItems(other,ItMi_Gold) >= Henry_Amount)
		{
			Info_AddChoice(DIA_Addon_Henry_Tribut,"Хорошо. Вот золото.",DIA_Addon_Henry_Tribut_ja);
		};
	};
};

func void DIA_Addon_Henry_Tribut_ja()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_ja_15_00");	//Хорошо. Вот золото.
	B_GiveInvItems(other,self,ItMi_Gold,Henry_Amount);
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_ja_04_01");	//Благодарю. Добро пожаловать в лагерь!
	if(GregIsBack == FALSE)
	{
		B_Henry_NoJoin();
	};
	Info_ClearChoices(DIA_Addon_Henry_Tribut);
	self.aivar[AIV_PASSGATE] = TRUE;
};

func void DIA_Addon_Henry_Tribut_nein()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_nein_15_00");	//Думаю, это слишком много.
	if(Henry_Amount < 500)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_nein_04_03");	//Перестань! Я и так сделал тебе скидку.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_nein_04_04");	//В таком случае можешь убираться отсюда.
	};
	Info_ClearChoices(DIA_Addon_Henry_Tribut);
};


instance DIA_Addon_Henry_Palisade(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 11;
	condition = DIA_Addon_Henry_Palisade_Condition;
	information = DIA_Addon_Henry_Palisade_Info;
	permanent = FALSE;
	description = "Что ты здесь делаешь?";
};


func int DIA_Addon_Henry_Palisade_Condition()
{
	return TRUE;
};

func void DIA_Addon_Henry_Palisade_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_01");	//А как ты думаешь? Я должен проследить за тем, чтобы эти жалкие лентяи построили частокол в срок.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_02");	//Если он не будет построен, капитан Грег даст мне хорошего пинка под зад.
	};
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_03");	//Также я решаю, пропускать ли в лагерь всяких проходимцев вроде тебя.
};


instance DIA_Addon_Henry_Palisade_WhatFor(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 12;
	condition = DIA_Addon_Henry_Palisade_WhatFor_Condition;
	information = DIA_Addon_Henry_Palisade_WhatFor_Info;
	permanent = FALSE;
	description = "Зачем вам понадобился частокол?";
};


func int DIA_Addon_Henry_Palisade_WhatFor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_WhatFor_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_WhatFor_15_00");	//Зачем вам понадобился частокол?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_10");	//Мы не хотим стать легкой добычей для бандитов!
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_02");	//Эти ублюдки наглеют с каждым днем! В последнее время они повадились крутиться вокруг лагеря, как акулы у обломков затонувшего корабля.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_11");	//Несколько бандитов даже поселились в башне к югу отсюда.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_12");	//Я уверен, что это передовой отряд.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_03");	//Но если они настолько глупы, что решат напасть на нас, мы их так встретим, что они не скоро это забудут.
	Log_CreateTopic(TOPIC_Addon_BanditsTower,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BanditsTower,LOG_Running);
	B_LogEntry(TOPIC_Addon_BanditsTower,"Несколько бандитов заняли башню к югу от пиратского лагеря.");
};

func void B_Henry_WhereIsTower()
{
	AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_08");	//Где именно находится башня?
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_07");	//Иди на юг и придерживайся правой стороны.
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_08");	//Ты увидишь башню на небольшом утесе.
};


instance DIA_Addon_Henry_Turmbanditen(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 13;
	condition = DIA_Addon_Henry_Turmbanditen_WhatFor_Condition;
	information = DIA_Addon_Henry_Turmbanditen_WhatFor_Info;
	permanent = TRUE;
	description = "Насчет бандитов в башне...";
};


func int DIA_Addon_Henry_Turmbanditen_WhatFor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade_WhatFor) && (MIS_Henry_FreeBDTTower != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Turmbanditen_WhatFor_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Turmbanditen_15_00");	//Насчет бандитов в башне...
	if(C_TowerBanditsDead())
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_01");	//Да?
		AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_01");	//Они мертвы.
		if(MIS_Henry_FreeBDTTower == LOG_Running)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_02");	//Прекрасно! Что ж, одной проблемой меньше.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_03");	//Ты разобрался с ними в одиночку? Позволь выразить тебе свое уважение!
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_04");	//Может быть, когда-нибудь ты даже станешь настоящим пиратом!
		};
		if(!Npc_IsDead(SawPirate))
		{
			SawPirate.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine(SawPirate,"START");
		};
		if(!Npc_IsDead(HammerPirate))
		{
			HammerPirate.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine(HammerPirate,"START");
		};
		MIS_Henry_FreeBDTTower = LOG_SUCCESS;
		B_LogEntry(TOPIC_Addon_BanditsTower,"Бандиты из башни убиты.");
		B_GivePlayerXP(XP_Addon_Henry_FreeBDTTower);
	}
	else if(MIS_Henry_FreeBDTTower == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_07");	//Что еще ты хочешь?
		B_Henry_WhereIsTower();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_05");	//Если ты планируешь справиться с ними самостоятельно, забудь об этом!
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_06");	//Скоро я пошлю туда двоих человек из моего отряда. Они позаботятся о бандитах.
	};
	Knows_HenrysEntertrupp = TRUE;
};


instance DIA_Addon_Henry_Palisade_Bandits(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 14;
	condition = DIA_Addon_Henry_Palisade_Bandits_Condition;
	information = DIA_Addon_Henry_Palisade_Bandits_Info;
	permanent = FALSE;
	description = "Почему ты думаешь, что бандиты могут на вас напасть?";
};


func int DIA_Addon_Henry_Palisade_Bandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade_WhatFor))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_Bandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Bandits_15_00");	//Почему ты думаешь, что бандиты могут на вас напасть?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_04");	//Потому что между нами и бандитами война! А ты как думал?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_05");	//Сначала все было хорошо. Мы привезли сюда бандитов, они ушли на свое болото и оставили нас в покое.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_06");	//Но теперь эти подонки нападают на каждого чужака.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_07");	//Только дьявол знает, что на них нашло.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_08");	//Думаю, им нужны наши корабли. Ведь другого способа выбраться отсюда не существует.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_09");	//Насчет бандитов тебе лучше поговорить со Скипом. Он вел с ними какие-то дела - и чудом остался в живых.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_10");	//Он может рассказать тебе много интересного.
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_11");	//(издевательски) Жаль только, что тебе с ним поговорить не удастся. За вход-то ты не заплатил...
//		Henry_Zoll_WhatFor = TRUE;
	};
};


var int Henry_EnterCrewMember;

instance DIA_Addon_Henry_Entercrew(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 31;
	condition = DIA_Addon_Henry_Entercrew_Condition;
	information = DIA_Addon_Henry_Entercrew_Info;
	permanent = TRUE;
	description = "Я хочу присоединиться к твоему отряду.";
};


func int DIA_Addon_Henry_Entercrew_Condition()
{
	if((Knows_HenrysEntertrupp == TRUE) && (Henry_EnterCrewMember == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Entercrew_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_00");	//Я хочу присоединиться к твоему отряду.
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_00");	//(смеется) Нет, так дело не пойдет, приятель!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_01");	//Сначала тебе надо попасть в лагерь!
//		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_06");	//Ну что ж, добро пожаловать!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_07");	//Еще один боец нам не помешает.
		if(MIS_Henry_FreeBDTTower == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_02");	//Хм-м. Я бы приказал тебе взять одного из моих ребят и выкурить засевших в башне бандитов...
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_03");	//Но ты это уже сделал.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_05");	//Ты должен избавиться от бандитов, обосновавшихся в башне!
			if(Npc_IsDead(SawPirate) && Npc_IsDead(HammerPirate))
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_04");	//Оба моих воина мертвы, так что тебе придется заняться этим в одиночку.
				B_LogEntry(TOPIC_Addon_BanditsTower,"Генри хочет, чтобы я разобрался с занявшими башню бандитами. Помочь он мне ничем не может.");
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_06");	//Возьми одного из моих ребят, и разберись с этими бандитами.
//				Henry_GetPartyMember = TRUE;
				B_LogEntry(TOPIC_Addon_BanditsTower,"Генри хочет, чтобы я разобрался с занявшими башню бандитами. Я могу взять с собой одного из его парней.");
			};
			B_Henry_WhereIsTower();
			AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_09");	//Есть, сэр!
			MIS_Henry_FreeBDTTower = LOG_Running;
		};
		Henry_EnterCrewMember = TRUE;
	};
};


instance DIA_Addon_Henry_Owen(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 32;
	condition = DIA_Addon_Henry_Owen_Condition;
	information = DIA_Addon_Henry_Owen_Info;
	description = "Для меня есть еще какие-нибудь задания?";
};


func int DIA_Addon_Henry_Owen_Condition()
{
//	if((MIS_Henry_FreeBDTTower == LOG_SUCCESS) && (Henry_EnterCrewMember == TRUE) && !Npc_IsDead(Malcom))
	if((MIS_Henry_FreeBDTTower == LOG_SUCCESS) && (Henry_EnterCrewMember == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Owen_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Owen_15_01");	//Для меня есть еще какие-нибудь задания?
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_01");	//Мы уже несколько дней ждем новую партию дерева для частокола.
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_05");	//Его должны были доставить Мальком и Оуэн.
	if(!Npc_KnowsInfo(other,DIA_Addon_Henry_Malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_06");	//Их лагерь недалеко отсюда, у долины на юго-востоке.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_07");	//Мальком сказал, что заготовка дерева займет некоторое время. Но не вечность же!
	};
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_08");	//Скажи ему, что мне надоело ждать!
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_09");	//Нет, погоди! Лучше скажи это Оуэну. Мальком слишком ненадежен.
	B_MalcomExident();
	MIS_Henry_HolOwen = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_HolOwen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HolOwen,LOG_Running);
	B_LogEntry(TOPIC_Addon_HolOwen,"Генри нужно дерево для строительства частокола. Я должен сказать об этом Оуэну. Его и Малькома можно найти в низине.");
};

func void B_Addon_Henry_MalcomsDead()
{
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_00");	//Что с Малькомом?
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_Add_15_01");	//Он мертв.
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_02");	//Бедняга. Похоже, удача отвернулась от него...
};


instance DIA_Addon_Henry_Owen2(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 33;
	condition = DIA_Addon_Henry_Owen2_Condition;
	information = DIA_Addon_Henry_Owen2_Info;
	permanent = TRUE;
	description = "Насчет Оуэна, лесоруба...";
};


func int DIA_Addon_Henry_Owen2_Condition()
{
	if(MIS_Henry_HolOwen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Owen2_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_00");	//Насчет Оуэна, лесоруба...
	if(Npc_IsDead(Owen))
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_01");	//Он мертв.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_02");	//Черт возьми! Видимо, мне придется отправить туда нового человека.
		if(!Npc_IsDead(Morgan))
		{
			AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_03");	//Морган очень вовремя занялся заполонившими всю округу дикими зверями.
		};
		B_Addon_Henry_MalcomsDead();
		MIS_Henry_HolOwen = LOG_OBSOLETE;
		B_LogEntry(TOPIC_Addon_HolOwen,"Оуэн и Мальком мертвы.");
		Log_SetTopicStatus(TOPIC_Addon_HolOwen,LOG_OBSOLETE);
	}
	else if(Owen_ComesToHenry == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_03");	//Оуэн скоро принесет дерево.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_04");	//Очень хорошо. И очень вовремя.
		B_Addon_Henry_MalcomsDead();
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_05");	//Вот твоя награда.
		B_GiveInvItems(self,other,ItMi_Gold,200);
		if(Npc_KnowsInfo(other,DIA_Addon_Greg_RavenDead))
		{
			B_StartOtherRoutine(Owen,"PostStart");
		}
		else
		{
			B_StartOtherRoutine(Owen,"PreStart");
		};
		MIS_Henry_HolOwen = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Owen_ComesToHenry);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_06");	//Повтори, где находится лагерь лесорубов?
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_07");	//Недалеко отсюда, у долины на юго-востоке.
	};
};


var int Henry_PERM_Once;

instance DIA_Addon_Henry_Palisade_CanHelp(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 34;
	condition = DIA_Addon_Henry_Palisade_CanHelp_Condition;
	information = DIA_Addon_Henry_Palisade_CanHelp_Info;
	permanent = TRUE;
	description = "Тебе нужна помощь?";
};


func int DIA_Addon_Henry_Palisade_CanHelp_Condition()
{
	if((MIS_Henry_HolOwen == LOG_SUCCESS) || (MIS_Henry_HolOwen == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_CanHelp_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_00");	//Тебе нужна помощь?
	if(Henry_PERM_Once == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_01");	//Ты знаешь что-нибудь о постройке частоколов?
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_02");	//Честно говоря, нет.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_03");	//Тогда пользы от тебя здесь не будет. Помоги кому-нибудь еще.
		Henry_PERM_Once = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_04");	//Можешь напиться до потери памяти, я не возражаю. Только не мешай моим рабочим.
};


instance DIA_Addon_Henry_WhatTeach(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 21;
	condition = DIA_Addon_Henry_WhatTeach_Condition;
	information = DIA_Addon_Henry_WhatTeach_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня лучше сражаться?";
};


func int DIA_Addon_Henry_WhatTeach_Condition()
{
	if((Knows_HenrysEntertrupp == TRUE) && (Henry_Addon_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_WhatTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_WhatTeach_Add_15_00");	//Ты можешь научить меня лучше сражаться?
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_01");	//(смеется) Сначала заплати за проход в лагерь, а потом уже мы об этом поговорим.
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_02");	//Цена обучения включена в плату за вход.
//		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_03");	//Конечно, почему нет?
		if(!Npc_KnowsInfo(other,DIA_Addon_Bones_Teacher))
		{
			Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
			B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
		};
		Henry_Addon_TeachPlayer = TRUE;
	};
};


var int Henry_merke2h;
var int Henry_merkeCbow;
var int Henry_Labercount;
var int Henry_Comment2H;
var int DIA_Henry_Teacher_permanent;
var int DIA_Henry_TeachState_2H;
var int DIA_Henry_TeachState_Crossbow;

func void B_Henry_NoMore_2H()
{
	AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00");	//Теперь ты настоящий мастер боя двуручным оружием.
};

func void B_Henry_NoMoreTeach()
{
	AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01");	//Ты больше не нуждаешься в учителях.
};

func void B_BuildLearnDialog_Henry()
{
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	if(VisibleTalentValue(NPC_TALENT_2H) < TeachLimit_2H_Henry)
	{
		Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
		Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Addon_Henry_Teach_2H_5);
		DIA_Henry_TeachState_2H = 1;
	}
	else
	{
		if((DIA_Henry_TeachState_2H == 1) && (DIA_Henry_TeachState_Crossbow != 2))
		{
			PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_2H_Henry)),-1,53,FONT_Screen,2);
			B_Henry_NoMore_2H();
		};
		DIA_Henry_TeachState_2H = 2;
	};
	if(VisibleTalentValue(NPC_TALENT_CROSSBOW) < TeachLimit_Crossbow_Henry)
	{
		Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
		Info_AddChoice(DIA_Addon_Henry_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
		DIA_Henry_TeachState_Crossbow = 1;
	}
	else
	{
		if((DIA_Henry_TeachState_Crossbow == 1) && (DIA_Henry_TeachState_2H != 2))
		{
			PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_Crossbow_Henry)),-1,53,FONT_Screen,2);
			B_Say(self,other,"$NOLEARNYOUREBETTER");
		};
		DIA_Henry_TeachState_Crossbow = 2;
	};
	if((RealTalentValue(NPC_TALENT_2H) >= DIA_Henry_TeachState_2H) && (RealTalentValue(NPC_TALENT_CROSSBOW) >= TeachLimit_Crossbow_Henry))
	{
		DIA_Henry_Teacher_permanent = TRUE;
	};
	if((DIA_Henry_TeachState_2H == 2) && (DIA_Henry_TeachState_Crossbow == 2))
	{
		PrintScreen(PRINT_NoLearnTotalMAXReached,-1,53,FONT_Screen,2);
		B_Henry_NoMoreTeach();
		AI_StopProcessInfos(self);
	};
};

func void B_Henry_Comment2H()
{
	if(Henry_Comment2H == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_03");	//Никогда не забывай: дольше живет тот, кто не забывает парировать удары!
		Henry_Comment2H = TRUE;
	};
};

func void B_Henry_CommentFightSkill()
{
	if(Henry_Labercount == 0)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Teach_Back_04_00");	//Твое умение растет.
		Henry_Labercount = 1;
	}
	else if(Henry_Labercount == 1)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_01");	//Ты быстро учишься. Может, тебе удастся стать настоящим пиратом.
		Henry_Labercount = 2;
	}
	else if(Henry_Labercount == 2)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_02");	//Если будешь продолжать в том же духе, то скоро ты сможешь в одиночку захватить целый корабль.
		Henry_Labercount = 0;
	};
};

instance DIA_Addon_Henry_Teach(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 6;
	condition = DIA_Addon_Henry_Teach_Condition;
	information = DIA_Addon_Henry_Teach_Info;
	permanent = TRUE;
	description = "Учи меня!";
};


func int DIA_Addon_Henry_Teach_Condition()
{
	if((Henry_Addon_TeachPlayer == TRUE) && (DIA_Henry_Teacher_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Teach_15_00");	//Учи меня!
	Henry_merke2h = other.HitChance[NPC_TALENT_2H];
	Henry_merkeCbow = other.HitChance[NPC_TALENT_CROSSBOW];
	B_BuildLearnDialog_Henry();
};

func void DIA_Addon_Henry_Teach_Back()
{
	if((other.HitChance[NPC_TALENT_2H] > Henry_merke2h) || (other.HitChance[NPC_TALENT_CROSSBOW] > Henry_merkeCbow))
	{
		B_Henry_CommentFightSkill();
	};
	Info_ClearChoices(DIA_Addon_Henry_Teach);
};

func void DIA_Addon_Henry_Teach_CB_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,TeachLimit_Crossbow_Henry))
	{
		B_BuildLearnDialog_Henry();
	};
};

func void DIA_Addon_Henry_Teach_CB_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,TeachLimit_Crossbow_Henry))
	{
		B_BuildLearnDialog_Henry();
	};
};

func void DIA_Addon_Henry_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,TeachLimit_2H_Henry))
	{
		B_Henry_Comment2H();
		B_BuildLearnDialog_Henry();
	};
};

func void DIA_Addon_Henry_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,TeachLimit_2H_Henry))
	{
		B_Henry_Comment2H();
		B_BuildLearnDialog_Henry();
	};
};


instance DIA_Addon_Henry_Palisade_Train(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 11;
	condition = DIA_Addon_Henry_Palisade_Train_Condition;
	information = DIA_Addon_Henry_Palisade_Train_Info;
	permanent = FALSE;
	description = "Грег - ваш командир?";
};


func int DIA_Addon_Henry_Palisade_Train_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_Train_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_00");	//Грег - ваш командир?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_01");	//Да. Но для тебя он - КАПИТАН Грег. Это понятно?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_02");	//Он - великий человек. Когда ты с ним встретишься, тебе лучше не быть на стороне его врагов. Ты даже не успеешь об этом пожалеть.
	if((SC_SawGregInTaverne == TRUE) || (PlayerTalkedToGregNW == TRUE) || (Greg.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_03");	//Я с ним уже встречался.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_04");	//Очень хорошо. Значит, ты понимаешь, о чем я говорю.
	};
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_05");	//Впрочем, его сейчас нет в лагере.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_06");	//Нами командует Фрэнсис.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_07");	//Он целый день сидит перед хижиной Грега и смотрит, как мы работаем.
	};
};


instance DIA_Addon_Henry_YourOwnTrupp(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 1;
	condition = DIA_Addon_Henry_YourOwnTrupp_Condition;
	information = DIA_Addon_Henry_YourOwnTrupp_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Henry_YourOwnTrupp_Condition()
{
	if((MIS_Addon_Greg_ClearCanyon == LOG_Running) && ((AlligatorJack.aivar[AIV_PARTYMEMBER] == TRUE) || (Brandon.aivar[AIV_PARTYMEMBER] == TRUE) || (Matt.aivar[AIV_PARTYMEMBER] == TRUE) || (Skip.aivar[AIV_PARTYMEMBER] == TRUE) || (BenchPirate.aivar[AIV_PARTYMEMBER] == TRUE) || (RoastPirate.aivar[AIV_PARTYMEMBER] == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_YourOwnTrupp_Info()
{
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_04");	//Итак, капитан дал тебе в распоряжение собственный отряд.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_05");	//Позаботься о том, чтобы твои люди не сидели сложа руки!
	AI_StopProcessInfos(self);
};

