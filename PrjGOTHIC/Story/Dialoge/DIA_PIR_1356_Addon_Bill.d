
instance DIA_Addon_Bill_EXIT(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 999;
	condition = DIA_Addon_Bill_EXIT_Condition;
	information = DIA_Addon_Bill_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Bill_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bill_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Bill_PICKPOCKET(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 900;
	condition = DIA_Addon_Bill_PICKPOCKET_Condition;
	information = DIA_Addon_Bill_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Addon_Bill_PICKPOCKET_Condition()
{
	return C_Beklauen(80,205);
};

func void DIA_Addon_Bill_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Bill_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Bill_PICKPOCKET,Dialog_Back,DIA_Addon_Bill_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Bill_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Bill_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bill_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Bill_PICKPOCKET);
};

func void DIA_Addon_Bill_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Bill_PICKPOCKET);
};


instance DIA_Addon_Bill_Hello(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 1;
	condition = DIA_Addon_Bill_Hello_Condition;
	information = DIA_Addon_Bill_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Bill_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Hello_15_00");	//Как у тебя дела?
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_01");	//Тебя прислал сюда Генри?
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_02");	//Скажи ему, что он получит свое дерево, как только я закончу.
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_03");	//А если он не хочет ждать, может придти сюда и помочь мне пилить.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Bill_Planks(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 2;
	condition = DIA_Addon_Bill_Planks_Condition;
	information = DIA_Addon_Bill_Planks_Info;
	description = "Для чего нужно все это дерево?";
};


func int DIA_Addon_Bill_Planks_Condition()
{
	if(GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_Planks_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Planks_15_00");	//Для чего нужно все это дерево?
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_01");	//Для частокола, глупец.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_02");	//Грег решил, что не мешало бы защитить наш лагерь стеной.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_03");	//Впрочем, я думаю, что мы могли бы особо не трудиться.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_04");	//Если бандиты всерьез решили на нас напасть, эта смехотворная ограда нас не защитит.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_05");	//Их с самого начала нужно было гнать отсюда.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_06");	//Если бы я знал, что дойдет до такого, я бы остался в Хоринисе.
};


var int Bill_Perm_Once;

instance DIA_Addon_Bill_Perm(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 4;
	condition = DIA_Addon_Bill_Perm_Condition;
	information = DIA_Addon_Bill_Perm_Info;
	permanent = TRUE;
	description = "Я могу помочь тебе?";
};


func int DIA_Addon_Bill_Perm_Condition()
{
	if((GregIsBack == FALSE) && Npc_WasInState(self,ZS_Saw))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Perm_15_00");	//Я могу помочь тебе?
	AI_Output(self,other,"DIA_Addon_Bill_Perm_03_01");	//Нет, спасибо, я сам справлюсь.
	if(Bill_Perm_Once == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Bill_Perm_03_02");	//Я не так давно присоединился к пиратам, и если я буду сваливать на других свою работу, то мне здесь многого не добиться.
		Bill_Perm_Once = TRUE;
	};
};


instance DIA_Addon_Bill_Perm2(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 5;
	condition = DIA_Addon_Bill_Perm2_Condition;
	information = DIA_Addon_Bill_Perm2_Info;
	permanent = TRUE;
	description = "Что ты делаешь сейчас?";
};


func int DIA_Addon_Bill_Perm2_Condition()
{
	if(GregIsBack == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_Perm2_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Perm2_15_00");	//Что ты делаешь сейчас?
	AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_01");	//Я? Я отдыхаю.
	if(!Npc_IsDead(Francis))
	{
		AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_02");	//(усмехается) Моей работой занимается Фрэнсис.
		AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_03");	//И пилить он будет, пока у него руки не отвалятся.
	};
};


instance DIA_Addon_Bill_AngusnHank(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 11;
	condition = DIA_Addon_Bill_AngusnHank_Condition;
	information = DIA_Addon_Bill_AngusnHank_Info;
	permanent = FALSE;
	description = "Я ищу Ангуса и Хэнка.";
};


func int DIA_Addon_Bill_AngusnHank_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_AngusHank) && Npc_HasItems(Angus,ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_AngusnHank_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_AngusnHank_15_00");	//Я ищу Ангуса и Хэнка.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_01");	//(вздыхает) Я не знаю, где они. Должно быть, бандиты их убили.
	AI_Output(other,self,"DIA_Addon_Bill_AngusnHank_15_02");	//Вы были друзьями, верно?
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_03");	//Все, что я знаю, - это то, что они должны были встретиться с бандитами в какой-то пещере неподалеку отсюда.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_04");	//Она должна быть где-то на востоке от лагеря.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_05");	//Не знаю, где именно она находится. Сам я там ни разу не был.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_06");	//Может быть, тебе стоит поговорить с Аллигатором Джеком. Он любит бродить вокруг лагеря.
	B_LogEntry(TOPIC_Addon_SkipsGrog,"У Ангуса и Хэнка была пещера к востоку от лагеря. О ней должен знать Аллигатор Джек.");
};


instance DIA_Addon_Bill_FoundFriends(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 12;
	condition = DIA_Addon_Bill_FoundFriends_Condition;
	information = DIA_Addon_Bill_FoundFriends_Info;
	permanent = FALSE;
	description = "Я нашел твоих друзей.";
};


func int DIA_Addon_Bill_FoundFriends_Condition()
{
	if(!Npc_HasItems(Angus,ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_FoundFriends_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_00");	//Я нашел твоих друзей.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_01");	//И? Где они?
	AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_02");	//Они мертвы.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_03");	//(с ненавистью) Проклятые бандиты! Они убили их!
	if(SC_Knows_JuanMurderedAngus == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_06");	//Возможно.
	};
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_04");	//Чертовы свиньи! Вы будете гореть в аду.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_05");	//Если бы я только знал имя тех подонков, кто это сделал...
	MIS_Addon_Bill_SearchAngusMurder = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_KillJuan,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KillJuan,LOG_Running);
	B_LogEntry(TOPIC_Addon_KillJuan,"Билл был потрясен, когда я сказал ему о смерти Ангуса и Хэнка. Он хочет знать имена их убийц.");
};


instance DIA_Addon_Bill_JuanMurder(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 13;
	condition = DIA_Addon_Bill_JuanMurder_Condition;
	information = DIA_Addon_Bill_JuanMurder_Info;
	description = "Я знаю, кто убил Хэнка и Ангуса.";
};


func int DIA_Addon_Bill_JuanMurder_Condition()
{
	if((MIS_Addon_Bill_SearchAngusMurder == LOG_Running) && (SC_Knows_JuanMurderedAngus == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_JuanMurder_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_JuanMurder_15_00");	//Я знаю, кто убил Хэнка и Ангуса.
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_01");	//Кто? Кто это сделал?
	AI_Output(other,self,"DIA_Addon_Bill_JuanMurder_15_02");	//Один из бандитов. Его зовут Хуан.
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_03");	//Ты должен прирезать этого гада, ты слышишь меня?
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_04");	//Это не должно сойти ему с рук.
	B_LogEntry(TOPIC_Addon_KillJuan,"Я должен отомстить за Ангуса и Хэнка и убить Хуана.");
};


instance DIA_Addon_Bill_KilledEsteban(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 14;
	condition = DIA_Addon_Bill_KilledEsteban_Condition;
	information = DIA_Addon_Bill_KilledEsteban_Info;
	description = "Хуан убит.";
};


func int DIA_Addon_Bill_KilledEsteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bill_JuanMurder) && Npc_IsDead(Juan))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_KilledEsteban_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_KilledEsteban_15_00");	//Хуан убит.
	AI_Output(self,other,"DIA_Addon_Bill_KilledEsteban_03_01");	//Он страдал?
	AI_Output(other,self,"DIA_Addon_Bill_KilledEsteban_15_02");	//Успокойся, сынок!
	AI_Output(self,other,"DIA_Addon_Bill_KilledEsteban_03_03");	//(вздыхает) Ну ладно. По крайней мере, эта свинья мертва.
	B_LogEntry(TOPIC_Addon_KillJuan,"Хуан мертв. Билл очень рад.");
	MIS_Addon_Bill_SearchAngusMurder = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Bill_KillAngusMurder);
};


instance DIA_Addon_Bill_Khorinis(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 21;
	condition = DIA_Addon_Bill_Khorinis_Condition;
	information = DIA_Addon_Bill_Khorinis_Info;
	description = "Ты из Хориниса?";
};


func int DIA_Addon_Bill_Khorinis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bill_Planks))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_Khorinis_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Khorinis_15_00");	//Ты из Хориниса?
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_01");	//Да. Я зарабатывал на жизнь карманными кражами и мошенничеством.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_02");	//Но когда в порт перестали заходить корабли, дела начали становиться все хуже и хуже.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_03");	//В конце концов мне надоело бегать от ополчения из-за пары корок хлеба.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_04");	//Поэтому я присоединился к Грегу. И вот теперь я застрял здесь.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_05");	//(вздыхает) Целый день пилю, чтобы построить никому не нужный частокол.
	};
};


instance DIA_Addon_Bill_TeachPlayer(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 22;
	condition = DIA_Addon_Bill_TeachPlayer_Condition;
	information = DIA_Addon_Bill_TeachPlayer_Info;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_Addon_Bill_TeachPlayer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bill_Khorinis))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_TeachPlayer_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_TeachPlayer_15_00");	//Ты можешь меня чему-нибудь научить?
	AI_Output(self,other,"DIA_Addon_Bill_TeachPlayer_03_01");	//Ну, я бы мог показать тебе, как незамеченным воровать чужие кошельки.
	AI_Output(self,other,"DIA_Addon_Bill_TeachPlayer_03_02");	//Но ты должен быть достаточно ловким, иначе ничего не получится.
	Bill_Addon_TeachPickPocket = TRUE;
};


instance DIA_Addon_Bill_LearnTalent(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 23;
	condition = DIA_Addon_Bill_LearnTalent_Condition;
	information = DIA_Addon_Bill_LearnTalent_Info;
	permanent = TRUE;
	description = "Научи меня карманному воровству (10 LP)";
};


func int DIA_Addon_Bill_LearnTalent_Condition()
{
	if((Bill_Addon_TeachPickPocket == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_LearnTalent_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_LearnTalent_15_00");	//Обучи меня карманным кражам.
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKPOCKET))
		{
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_01");	//Прежде всего, ты должен заставить жертву почувствовать себя в безопасности.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_02");	//Я, например, подходил к человеку и заводил беседу. Действовало безотказно.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_03");	//Когда человек отвлекся, вытаскивай добычу, но убедись, что жертва ничего не замечает.
			AI_Output(other,self,"DIA_Addon_Bill_LearnTalent_15_05");	//Что-нибудь еще?
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_06");	//Продолжай тренировать ловкость. Чем ловчее ты будешь, тем больше ты будешь замечать.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_07");	//И тем чаще у тебя будет получаться незаметно отнимать у людей вещи!
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_08");	//Это все. По крайней мере, в плане теории.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_09");	//Забудь об этом! Ты недостаточно проворен!
		AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_10");	//Ты должен либо стать более ловким, либо найти лучшего учителя.
	};
};

