
instance DIA_Pepe_EXIT(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 999;
	condition = DIA_Pepe_EXIT_Condition;
	information = DIA_Pepe_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pepe_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pepe_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pepe_Hallo(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 1;
	condition = DIA_Pepe_Hallo_Condition;
	information = DIA_Pepe_Hallo_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Pepe_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Pepe_Hallo_Info()
{
	AI_Output(other,self,"DIA_Pepe_Hallo_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Pepe_Hallo_03_01");	//(скучая) Стерегу овец! (вздыхает) И, по возможности, стараюсь держаться подальше от неприятностей.
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(other,self,"DIA_Pepe_Hallo_15_02");	//Это не всегда возможно, да?
		AI_Output(self,other,"DIA_Pepe_Hallo_03_03");	//Да уж, особенно когда дело касается наемников. Я очень рад, что работаю здесь, на пастбище, подальше от них. Хотя и здесь не совсем безопасно.
	};
};


instance DIA_Pepe_Danger(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 2;
	condition = DIA_Pepe_Danger_Condition;
	information = DIA_Pepe_Danger_Info;
	permanent = FALSE;
	description = "А что опасного на пастбище?";
};


func int DIA_Pepe_Danger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Pepe_Danger_Info()
{
	AI_Output(other,self,"DIA_Pepe_Danger_15_00");	//А что опасного на пастбище?
	AI_Output(self,other,"DIA_Pepe_Danger_03_01");	//Неподалеку бродит небольшая стая волков. Эти проклятые твари почти каждый день утаскивают одну из моих овец.
	AI_Output(self,other,"DIA_Pepe_Danger_03_02");	//Несколько дней назад у меня было в два раза больше овец. Мне не хочется даже думать, что Онар сделает со мной, когда узнает об этом.
};


instance DIA_Pepe_WhyNotSLD(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 3;
	condition = DIA_Pepe_WhyNotSLD_Condition;
	information = DIA_Pepe_WhyNotSLD_Info;
	permanent = FALSE;
	description = "Почему ты не скажешь наемникам о волках? Мне казалось, это их работа.";
};


func int DIA_Pepe_WhyNotSLD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pepe_Danger) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Pepe_WhyNotSLD_Info()
{
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_00");	//Почему ты не скажешь наемникам о волках? Мне казалось, это их работа.
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_01");	//Да, я знаю. Я должен был сделать это. Но не сделал, черт!
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_02");	//А теперь, когда столько овец пропало, я боюсь кому-нибудь говорить об этом.
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_03");	//Но ты только что сказал МНЕ...
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_04");	//(сердито) Я уже пожалел об этом.
};


instance DIA_Pepe_KillWolves(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 4;
	condition = DIA_Pepe_KillWolves_Condition;
	information = DIA_Pepe_KillWolves_Info;
	permanent = FALSE;
	description = "Что если я убью этих волков?";
};


func int DIA_Pepe_KillWolves_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pepe_Danger))
	{
		return TRUE;
	};
};

func void DIA_Pepe_KillWolves_Info()
{
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_00");	//Что если я убью этих волков?
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_01");	//(насмешливо) Ты, сам? Ха ха. Я не верю в это. Я скорее поверю, что мой баран-вожак расправится с ними.
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_02");	//Забудь об этом. Это было всего лишь предположение. Я пойду к парням, и посмотрим, что ОНИ скажут насчет этого...
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_03");	//(испуганно) Подожди минутку. Хорошо, хорошо! Эээ... ты величайший воин, и ты можешь уложить сотню волков одной левой. Нет проблем!
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_04");	//Обычно они шныряют в лесу около пастбища. (как бы между прочим) Я думаю, их всего четверо...
	AI_StopProcessInfos(self);
	Wld_InsertNpc(PEPES_YWolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01");
	Wld_InsertNpc(PEPES_YWolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02");
	Wld_InsertNpc(PEPES_YWolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03");
	Wld_InsertNpc(PEPES_YWolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04");
	MIS_Pepe_KillWolves = LOG_Running;
	Log_CreateTopic(TOPIC_PepeWolves,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PepeWolves,LOG_Running);
	B_LogEntry(TOPIC_PepeWolves,"Овцы Пепе страдают от волков. Я должен прогнать их.");
};


instance DIA_Pepe_KilledWolves(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 5;
	condition = DIA_Pepe_KilledWolves_Condition;
	information = DIA_Pepe_KilledWolves_Info;
	permanent = TRUE;
	description = "Я расправился с волками.";
};


func int DIA_Pepe_KilledWolves_Condition()
{
	if(MIS_Pepe_KillWolves == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Pepe_KilledWolves_Info()
{
	AI_Output(other,self,"DIA_Pepe_KilledWolves_15_00");	//Я расправился с волками.
	if(Npc_IsDead(PEPES_YWolf1) && Npc_IsDead(PEPES_YWolf2) && Npc_IsDead(PEPES_YWolf3) && Npc_IsDead(PEPES_YWolf4))
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_01");	//(пораженно) Ты сделал это! Слава Инносу!
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_02");	//Но я все равно не знаю, как сказать Онару, что его овцы пропали.
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_03");	//(себе под нос) Это все этот чертов Булко виноват!
		MIS_Pepe_KillWolves = LOG_SUCCESS;
		B_GivePlayerXP(XP_PepeWolves);
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_04");	//ты меня считаешь за идиота? Эти звери еще не все мертвы.
	};
};


instance DIA_Pepe_Bullco(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 5;
	condition = DIA_Pepe_Bullco_Condition;
	information = DIA_Pepe_Bullco_Info;
	permanent = FALSE;
	description = "Что ты сказал насчет Булко?";
};


func int DIA_Pepe_Bullco_Condition()
{
	if((MIS_Pepe_KillWolves == LOG_SUCCESS) && !Npc_IsDead(Bullco) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Pepe_Bullco_Info()
{
	AI_Output(other,self,"DIA_Pepe_Bullco_15_00");	//Что ты сказал насчет Булко?
	AI_Output(self,other,"DIA_Pepe_Bullco_03_01");	//Это один из наемников. Это его работа охранять пастбище.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_02");	//Но вместо этого он и его приятель Сильвио день напролет ошиваются в кухне у Теклы.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_03");	//Это этот ублюдок будет виноват, если мне не заплатят за многие недели работы из-за потери овец.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_04");	//Как я хотел бы набить ему морду. Но никому это не по силам. Этот парень - убийца.
	MIS_Pepe_KickBullco = LOG_Running;
	Log_CreateTopic(TOPIC_KickBullco,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KickBullco,LOG_Running);
	B_LogEntry(TOPIC_KickBullco,"Булко плохо охраняет овец Пепе. Пепе хочет, чтобы кто-нибудь проучил его.");
};


instance DIA_Pepe_BullcoDefeated(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 5;
	condition = DIA_Pepe_BullcoDefeated_Condition;
	information = DIA_Pepe_BullcoDefeated_Info;
	permanent = FALSE;
	description = "Булко получил по заслугам.";
};


func int DIA_Pepe_BullcoDefeated_Condition()
{
	if(MIS_Pepe_KickBullco == LOG_Running)
	{
		if((Bullco.aivar[AIV_DefeatedByPlayer] == TRUE) || (DJG_Bullco.aivar[AIV_DefeatedByPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Pepe_BullcoDefeated_Info()
{
	AI_Output(other,self,"DIA_Pepe_BullcoDefeated_15_00");	//Булко получил по заслугам. Я преподал ему урок.
	AI_Output(self,other,"DIA_Pepe_BullcoDefeated_03_01");	//Эта свинья заслужила это.
	MIS_Pepe_KickBullco = LOG_SUCCESS;
	B_GivePlayerXP(XP_KickBullco);
};


instance DIA_Pepe_PERM(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 6;
	condition = DIA_Pepe_PERM_Condition;
	information = DIA_Pepe_PERM_Info;
	permanent = TRUE;
	description = "Как дела, как твои овцы?";
};


func int DIA_Pepe_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Pepe_PERM_Info()
{
	AI_Output(other,self,"DIA_Pepe_PERM_15_00");	//Как дела, как твои овцы?
	if(Kapitel <= 1)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_01");	//Прекрасно. И с овцами все в порядке. Ну, с теми, что еще остались у меня, все в порядке.
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_02");	//Хорошо. Но могут придти другие волки. И, возможно, в большем количестве!
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_03");	//Я слышал странные вещи. Говорят, что на ферме Секоба появились страшные личности. Они заняли его дом.
	};
	if(Kapitel >= 4)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_04");	//Я слышал, что какие-то бандиты поселились на ферме Лобарта. Кто-нибудь должен помочь ему.
	};
};


instance DIA_Pepe_Liesel(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 7;
	condition = DIA_Pepe_Liesel_Condition;
	information = DIA_Pepe_Liesel_Info;
	permanent = FALSE;
	description = "Могу я купить овцу?";
};


func int DIA_Pepe_Liesel_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Pepe_Liesel_Info()
{
	AI_Output(other,self,"DIA_Pepe_Liesel_15_00");	//Могу я купить овцу?
	AI_Output(self,other,"DIA_Pepe_Liesel_03_01");	//Когда захочешь, если у тебя есть деньги. Овца стоит 100 золотых монет.
	AI_Output(self,other,"DIA_Pepe_Liesel_03_02");	//Если ты заплатишь, можешь выбрать себе овцу. Но ты должен пообещать хорошо с ней обращаться.
};


var int Pepe_SchafGekauft;

instance DIA_Pepe_BuyLiesel(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 8;
	condition = DIA_Pepe_BuyLiesel_Condition;
	information = DIA_Pepe_BuyLiesel_Info;
	permanent = TRUE;
	description = "Вот 100 золотых монет. Давай мне овцу.";
};


func int DIA_Pepe_BuyLiesel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pepe_Liesel))
	{
		return TRUE;
	};
};

func void DIA_Pepe_BuyLiesel_Info()
{
	AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_00");	//Вот 100 золотых монет. Давай мне овцу.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		if(Pepe_SchafGekauft == 0)
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_01");	//Хорошо. Возьми Бетси - ты найдешь ее на пастбище.
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_02");	//Просто скажи ей, что она должна идти за тобой. Она очень умна для овцы. Не обижай ее!
		}
		else
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_03");	//Опять? Хорошо. Возьми Бетси.
			AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_04");	//Бетси? Но последнюю овцу, что я взял у тебя, тоже звали Бетси...
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_05");	//Всех овец зовут Бетси.
			if(Pepe_SchafGekauft == 3)
			{
				AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_06");	//За исключением баранов, конечно же.
				AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_07");	//А как их зовут?
				AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_08");	//Брюс.
			};
		};
		Pepe_SchafGekauft = Pepe_SchafGekauft + 1;
		Wld_InsertNpc(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_09");	//У тебя недостаточно золота. А я не могу продать овцу дешевле.
	};
};


instance DIA_Pepe_PICKPOCKET(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 900;
	condition = DIA_Pepe_PICKPOCKET_Condition;
	information = DIA_Pepe_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Pepe_PICKPOCKET_Condition()
{
	return C_Beklauen(15,25);
};

func void DIA_Pepe_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pepe_PICKPOCKET);
	Info_AddChoice(DIA_Pepe_PICKPOCKET,Dialog_Back,DIA_Pepe_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pepe_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Pepe_PICKPOCKET_DoIt);
};

func void DIA_Pepe_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Pepe_PICKPOCKET);
};

func void DIA_Pepe_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pepe_PICKPOCKET);
};

